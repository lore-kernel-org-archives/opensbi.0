From: Cheng Yang <yangcheng.work@foxmail.com>
Date: Tue, 7 May 2024 23:04:02 +0800
Subject: [PATCH v5] lib:sbi:platform:generic: Improved mlevel imsic check and init.
In-Reply-To: <CAAhSdy2QhWVS=gADWXu9YVjO9_1PbsN8Ev6Ap-21MGCdghmwZQ@mail.gmail.com>
References: <tencent_B70E64F2449AA3D56C0A58DC95B1C86BB707@qq.com>
	<CAAhSdy2QhWVS=gADWXu9YVjO9_1PbsN8Ev6Ap-21MGCdghmwZQ@mail.gmail.com>
Message-ID: <tencent_0A0A89A647C4D95EB0502B8F91DA6E20C808@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

&gt;On Wed, Apr 10, 2024 at 2:58?PM Cheng Yang <yangcheng.work@foxmail.com> wrote:
&gt;&gt;
&gt;&gt; The current mlevel imsic check is only for the platform, which
&gt;&gt; may cause hart without imsic in the platform to trigger an
&gt;&gt; illegal instruction exception when initializing imsic. For
&gt;&gt; example, the platform contains a management hart that only
&gt;&gt; supports wired interrupts.
&gt;&gt;
&gt;&gt; This patch will check whether each hart has imsic according
&gt;&gt; to fdt and record it in a bitmap, and only allow harts with
&gt;&gt; imsic to initialize imsic to avoid triggering illegal instruction
&gt;&gt; exceptions.
&gt;&gt;
&gt;&gt; Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
&gt;
&gt;We don't need such a complex solution using bitmap because we
&gt;can simply extend imsic_local_irqchip_init() as follows:
&gt;
&gt;diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
&gt;index f2a35c6..02e3a33 100644
&gt;--- a/lib/utils/irqchip/imsic.c
&gt;+++ b/lib/utils/irqchip/imsic.c
&gt;@@ -12,6 +12,7 @@
&gt;#include <sbi riscv_io.h="">
&gt;#include <sbi riscv_encoding.h="">
&gt;#include <sbi sbi_console.h="">
&gt;+#include <sbi sbi_csr_detect.h="">
&gt;#include <sbi sbi_domain.h="">
&gt;#include <sbi sbi_ipi.h="">
&gt;#include <sbi sbi_irqchip.h="">
&gt;@@ -222,6 +223,8 @@ static void imsic_local_eix_update(unsigned long base_id,
&gt;
&gt;void imsic_local_irqchip_init(void)
&gt;{
&gt;+    struct sbi_trap_info trap = { 0 };
&gt;+
&gt;/*
&gt;* This function is expected to be called from:
&gt;* 1) nascent_init() platform callback which is called
&gt;@@ -231,6 +234,11 @@ void imsic_local_irqchip_init(void)
&gt;*    in boot-up path.
&gt;*/
&gt;
&gt;+    /* If Smaia not available then do nothing */
&gt;+    csr_read_allowed(CSR_MTOPI, (ulong)&amp;trap);
&gt;+    if (trap.cause)
&gt;+        return;
&gt;+
&gt;/* Setup threshold to allow all enabled interrupts */
&gt;imsic_csr_write(IMSIC_EITHRESHOLD, IMSIC_ENABLE_EITHRESHOLD);
&gt;
&gt;Regards,
&gt;Anup

Hi Anup,

Thanks for the great suggestion, it's certainly much easier than my method. 
However, I was thinking that we could maybe use sbi_hart_has_extension() to 
detect if the current hart has the smaia extension instead of using csr_read_allowed(), 
which method do you think is better?

Best regards,
Cheng Yang

&gt;
&gt;&gt; Changes V4 -&gt; V5:
&gt;&gt;   - Fixed the issue where patch cannot be applied due to the editor automatically removing trailing spaces.
&gt;&gt; Changes V3 -&gt; V4:
&gt;&gt;   - Rebase to the latest master branch.
&gt;&gt; Changes V2 -&gt; V3:
&gt;&gt;   - Trailing whitespace.
&gt;&gt;   - Replace platform.hart_index2id to generic_hart_index2id.
&gt;&gt; Changes V1 -&gt; V2:
&gt;&gt;   - Add the processing of plat-&gt;hart_index2id be NULL in fdt_check_imsic_mlevel.
&gt;&gt; ---
&gt;&gt;  include/sbi/sbi_platform.h         |  8 ++++--
&gt;&gt;  include/sbi_utils/fdt/fdt_helper.h |  4 ++-
&gt;&gt;  lib/sbi/sbi_init.c                 |  2 +-
&gt;&gt;  lib/utils/fdt/fdt_helper.c         | 45 ++++++++++++++++++++++++------
&gt;&gt;  platform/generic/platform.c        | 26 ++++++++++++-----
&gt;&gt;  5 files changed, 64 insertions(+), 21 deletions(-)
&gt;&gt;
&gt;&gt; diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
&gt;&gt; index 581935a..f62d23d 100644
&gt;&gt; --- a/include/sbi/sbi_platform.h
&gt;&gt; +++ b/include/sbi/sbi_platform.h
&gt;&gt; @@ -75,7 +75,7 @@ struct sbi_platform_operations {
&gt;&gt;         bool (*cold_boot_allowed)(u32 hartid);
&gt;&gt;
&gt;&gt;         /* Platform nascent initialization */
&gt;&gt; -       int (*nascent_init)(void);
&gt;&gt; +       int (*nascent_init)(u32 hartid);
&gt;&gt;
&gt;&gt;         /** Platform early initialization */
&gt;&gt;         int (*early_init)(bool cold_boot);
&gt;&gt; @@ -395,10 +395,12 @@ static inline bool sbi_platform_cold_boot_allowed(
&gt;&gt;   *
&gt;&gt;   * @return 0 on success and negative error code on failure
&gt;&gt;   */
&gt;&gt; -static inline int sbi_platform_nascent_init(const struct sbi_platform *plat)
&gt;&gt; +static inline int sbi_platform_nascent_init(
&gt;&gt; +                                       const struct sbi_platform *plat,
&gt;&gt; +                                       u32 hartid)
&gt;&gt;  {
&gt;&gt;         if (plat &amp;&amp; sbi_platform_ops(plat)-&gt;nascent_init)
&gt;&gt; -               return sbi_platform_ops(plat)-&gt;nascent_init();
&gt;&gt; +               return sbi_platform_ops(plat)-&gt;nascent_init(hartid);
&gt;&gt;         return 0;
&gt;&gt;  }
&gt;&gt;
&gt;&gt; diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
&gt;&gt; index ab4a80f..1b7fdeb 100644
&gt;&gt; --- a/include/sbi_utils/fdt/fdt_helper.h
&gt;&gt; +++ b/include/sbi_utils/fdt/fdt_helper.h
&gt;&gt; @@ -12,6 +12,7 @@
&gt;&gt;
&gt;&gt;  #include <sbi sbi_types.h="">
&gt;&gt;  #include <sbi sbi_domain.h="">
&gt;&gt; +#include <sbi sbi_platform.h="">
&gt;&gt;
&gt;&gt;  struct fdt_match {
&gt;&gt;         const char *compatible;
&gt;&gt; @@ -89,7 +90,8 @@ int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic);
&gt;&gt;
&gt;&gt;  struct imsic_data;
&gt;&gt;
&gt;&gt; -bool fdt_check_imsic_mlevel(void *fdt);
&gt;&gt; +int fdt_check_imsic_mlevel(void *fdt, struct sbi_platform *plat,
&gt;&gt; +                                                  unsigned long *imsic_bitmap);
&gt;&gt;
&gt;&gt;  int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic);
&gt;&gt;
&gt;&gt; diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
&gt;&gt; index 389172a..96f71a4 100644
&gt;&gt; --- a/lib/sbi/sbi_init.c
&gt;&gt; +++ b/lib/sbi/sbi_init.c
&gt;&gt; @@ -545,7 +545,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
&gt;&gt;          * that platform can initialize platform specific per-HART CSRs
&gt;&gt;          * or per-HART devices.
&gt;&gt;          */
&gt;&gt; -       if (sbi_platform_nascent_init(plat))
&gt;&gt; +       if (sbi_platform_nascent_init(plat, hartid))
&gt;&gt;                 sbi_hart_hang();
&gt;&gt;
&gt;&gt;         if (coldboot)
&gt;&gt; diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
&gt;&gt; index a0e93b9..ae5d9cc 100644
&gt;&gt; --- a/lib/utils/fdt/fdt_helper.c
&gt;&gt; +++ b/lib/utils/fdt/fdt_helper.c
&gt;&gt; @@ -764,27 +764,54 @@ skip_delegate_parse:
&gt;&gt;         return 0;
&gt;&gt;  }
&gt;&gt;
&gt;&gt; -bool fdt_check_imsic_mlevel(void *fdt)
&gt;&gt; +int fdt_check_imsic_mlevel(void *fdt, struct sbi_platform *plat, unsigned long *imsic_bitmap)
&gt;&gt;  {
&gt;&gt;         const fdt32_t *val;
&gt;&gt; -       int i, len, noff = 0;
&gt;&gt; +       int i, h, len, err, cpu_offset, cpu_intc_offset, noff = 0;
&gt;&gt; +       u32 phandle, hwirq, hartid;
&gt;&gt; +
&gt;&gt; +       bitmap_zero(imsic_bitmap, SBI_HARTMASK_MAX_BITS);
&gt;&gt;
&gt;&gt;         if (!fdt)
&gt;&gt; -               return false;
&gt;&gt; +               return SBI_ENODEV;
&gt;&gt;
&gt;&gt;         while ((noff = fdt_node_offset_by_compatible(fdt, noff,
&gt;&gt;                                                      "riscv,imsics")) &gt;= 0) {
&gt;&gt;                 val = fdt_getprop(fdt, noff, "interrupts-extended", &amp;len);
&gt;&gt; -               if (val &amp;&amp; len &gt; sizeof(fdt32_t)) {
&gt;&gt; -                       len = len / sizeof(fdt32_t);
&gt;&gt; -                       for (i = 0; i &lt; len; i += 2) {
&gt;&gt; -                               if (fdt32_to_cpu(val[i + 1]) == IRQ_M_EXT)
&gt;&gt; -                                       return true;
&gt;&gt; +               if (!val || len &lt; sizeof(fdt32_t))
&gt;&gt; +                       continue;
&gt;&gt; +
&gt;&gt; +               len = len / sizeof(fdt32_t);
&gt;&gt; +               for (i = 0; i &lt; len; i += 2) {
&gt;&gt; +                       phandle = fdt32_to_cpu(val[i]);
&gt;&gt; +                       hwirq = fdt32_to_cpu(val[i + 1]);
&gt;&gt; +
&gt;&gt; +                       if (hwirq != IRQ_M_EXT)
&gt;&gt; +                               continue;
&gt;&gt; +
&gt;&gt; +                       cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
&gt;&gt; +                       if (cpu_intc_offset &lt; 0)
&gt;&gt; +                               continue;
&gt;&gt; +
&gt;&gt; +                       cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
&gt;&gt; +                       if (cpu_offset &lt; 0)
&gt;&gt; +                               continue;
&gt;&gt; +
&gt;&gt; +                       err = fdt_parse_hart_id(fdt, cpu_offset, &amp;hartid);
&gt;&gt; +                       if (err)
&gt;&gt; +                               return SBI_EINVAL;
&gt;&gt; +
&gt;&gt; +                       for (int i = 0; i &lt; plat-&gt;hart_count; i++) {
&gt;&gt; +                               h = plat-&gt;hart_index2id ? plat-&gt;hart_index2id[i] : i;
&gt;&gt; +                               if (hartid == h) {
&gt;&gt; +                                       bitmap_set(imsic_bitmap, i, 1);
&gt;&gt; +                                       break;
&gt;&gt; +                               }
&gt;&gt;                         }
&gt;&gt;                 }
&gt;&gt;         }
&gt;&gt;
&gt;&gt; -       return false;
&gt;&gt; +       return SBI_OK;
&gt;&gt;  }
&gt;&gt;
&gt;&gt;  int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
&gt;&gt; diff --git a/platform/generic/platform.c b/platform/generic/platform.c
&gt;&gt; index 1f46b76..00f8f86 100644
&gt;&gt; --- a/platform/generic/platform.c
&gt;&gt; +++ b/platform/generic/platform.c
&gt;&gt; @@ -70,15 +70,15 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
&gt;&gt;  }
&gt;&gt;
&gt;&gt;  extern struct sbi_platform platform;
&gt;&gt; -static bool platform_has_mlevel_imsic = false;
&gt;&gt;  static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };
&gt;&gt;
&gt;&gt;  static DECLARE_BITMAP(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
&gt;&gt; +static DECLARE_BITMAP(generic_hart_has_mlevel_imsic, SBI_HARTMASK_MAX_BITS);
&gt;&gt;
&gt;&gt;  /*
&gt;&gt; - * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
&gt;&gt; + * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
&gt;&gt;   * function to initialize the cold boot harts allowed by the generic platform
&gt;&gt; - * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
&gt;&gt; + * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
&gt;&gt;   * DT node. If there is no "cold-boot-harts" in DT, all harts will be allowed.
&gt;&gt;   */
&gt;&gt;  static void fw_platform_coldboot_harts_init(void *fdt)
&gt;&gt; @@ -186,7 +186,11 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
&gt;&gt;
&gt;&gt;         platform.hart_count = hart_count;
&gt;&gt;         platform.heap_size = fw_platform_calculate_heap_size(hart_count);
&gt;&gt; -       platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
&gt;&gt; +
&gt;&gt; +       rc = fdt_check_imsic_mlevel(fdt, &amp;platform,
&gt;&gt; +                                                               generic_hart_has_mlevel_imsic);
&gt;&gt; +       if (rc)
&gt;&gt; +               goto fail;
&gt;&gt;
&gt;&gt;         fw_platform_coldboot_harts_init(fdt);
&gt;&gt;
&gt;&gt; @@ -212,10 +216,18 @@ static bool generic_cold_boot_allowed(u32 hartid)
&gt;&gt;         return false;
&gt;&gt;  }
&gt;&gt;
&gt;&gt; -static int generic_nascent_init(void)
&gt;&gt; +static int generic_nascent_init(u32 hartid)
&gt;&gt;  {
&gt;&gt; -       if (platform_has_mlevel_imsic)
&gt;&gt; -               imsic_local_irqchip_init();
&gt;&gt; +       for (int i = 0; i &lt; platform.hart_count; i++) {
&gt;&gt; +               if (hartid != generic_hart_index2id[i])
&gt;&gt; +                       continue;
&gt;&gt; +
&gt;&gt; +               if (bitmap_test(generic_hart_has_mlevel_imsic, i)) {
&gt;&gt; +                       imsic_local_irqchip_init();
&gt;&gt; +                       break;
&gt;&gt; +               }
&gt;&gt; +       }
&gt;&gt; +
&gt;&gt;         return 0;
&gt;&gt;  }
&gt;&gt;
&gt;&gt; --
&gt;&gt; 2.34.1
&gt;&gt;
&gt;&gt;
&gt;&gt; --
&gt;&gt; opensbi mailing list
&gt;&gt; opensbi at lists.infradead.org
&gt;&gt; http://lists.infradead.org/mailman/listinfo/opensbi</sbi></sbi></sbi></sbi></sbi></sbi></sbi></sbi></sbi></sbi></yangcheng.work@foxmail.com></yangcheng.work@foxmail.com>
