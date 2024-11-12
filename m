From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Nov 2024 09:43:36 +0530
Subject: [PATCH 3/9] lib: utils/irqchip: plic: Provide a hartindex to
 context map
In-Reply-To: <20241105041015.2949808-4-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com> <20241105041015.2949808-4-samuel.holland@sifive.com>
Message-ID: <CAAhSdy15x=J3eLxDHNtjiPh+dtmzspE_wTSrLaN9u_gaegX32Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 5, 2024 at 9:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> This removes platform-specific arguments to plic_warm_irqchip_init(),
> which makes the driver independent from the platform after cold init,
> and allows for further refactoring.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  include/sbi_utils/irqchip/plic.h     | 14 +++++--
>  lib/utils/irqchip/fdt_irqchip_plic.c | 62 +++++++---------------------
>  lib/utils/irqchip/plic.c             | 14 +++++--
>  platform/fpga/ariane/platform.c      |  6 ++-
>  platform/fpga/openpiton/platform.c   |  8 +++-
>  platform/kendryte/k210/platform.c    |  7 +++-
>  platform/nuclei/ux600/platform.c     |  7 ++--
>  platform/template/platform.c         |  9 +++-
>  8 files changed, 62 insertions(+), 65 deletions(-)
>
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index cbe66761..e6b6f823 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -17,6 +17,7 @@ struct plic_data {
>         unsigned long size;
>         unsigned long num_src;
>         unsigned long flags;
> +       s16 context_map[][2];
>  };
>
>  /** Work around a bug on Ariane that requires enabling interrupts at boot */
> @@ -24,6 +25,12 @@ struct plic_data {
>  /** PLIC must be delegated to S-mode like T-HEAD C906 and C910 */
>  #define PLIC_FLAG_THEAD_DELEGATION     BIT(1)
>
> +#define PLIC_M_CONTEXT                 0
> +#define PLIC_S_CONTEXT                 1
> +
> +#define PLIC_DATA_SIZE(__hart_count)   (sizeof(struct plic_data) + \
> +                                        (__hart_count) * 2 * sizeof(s16))
> +
>  /* So far, priorities on all consumers of these functions fit in 8 bits. */
>  void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
>
> @@ -32,14 +39,13 @@ void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
>
>  void plic_delegate(const struct plic_data *plic);
>
> -void plic_context_save(const struct plic_data *plic, int context_id,
> +void plic_context_save(const struct plic_data *plic, bool smode,
>                        u32 *enable, u32 *threshold, u32 num);
>
> -void plic_context_restore(const struct plic_data *plic, int context_id,
> +void plic_context_restore(const struct plic_data *plic, bool smode,
>                           const u32 *enable, u32 threshold, u32 num);
>
> -int plic_warm_irqchip_init(const struct plic_data *plic,
> -                          int m_cntx_id, int s_cntx_id);
> +int plic_warm_irqchip_init(const struct plic_data *plic);
>
>  int plic_cold_irqchip_init(const struct plic_data *plic);
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 3c57a0f5..2ba56748 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -12,6 +12,7 @@
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_heap.h>
> +#include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
> @@ -25,22 +26,6 @@ static unsigned long plic_ptr_offset;
>  #define plic_set_hart_data_ptr(__scratch, __plic)                      \
>         sbi_scratch_write_type((__scratch), void *, plic_ptr_offset, (__plic))
>
> -static unsigned long plic_mcontext_offset;
> -
> -#define plic_get_hart_mcontext(__scratch)                              \
> -       (sbi_scratch_read_type((__scratch), long, plic_mcontext_offset) - 1)
> -
> -#define plic_set_hart_mcontext(__scratch, __mctx)                      \
> -       sbi_scratch_write_type((__scratch), long, plic_mcontext_offset, (__mctx) + 1)
> -
> -static unsigned long plic_scontext_offset;
> -
> -#define plic_get_hart_scontext(__scratch)                              \
> -       (sbi_scratch_read_type((__scratch), long, plic_scontext_offset) - 1)
> -
> -#define plic_set_hart_scontext(__scratch, __sctx)                      \
> -       sbi_scratch_write_type((__scratch), long, plic_scontext_offset, (__sctx) + 1)
> -
>  void fdt_plic_priority_save(u8 *priority, u32 num)
>  {
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> @@ -59,9 +44,7 @@ void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num)
>  {
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> -       plic_context_save(plic_get_hart_data_ptr(scratch),
> -                         smode ? plic_get_hart_scontext(scratch) :
> -                                 plic_get_hart_mcontext(scratch),
> +       plic_context_save(plic_get_hart_data_ptr(scratch), smode,
>                           enable, threshold, num);
>  }
>
> @@ -70,9 +53,7 @@ void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
>  {
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> -       plic_context_restore(plic_get_hart_data_ptr(scratch),
> -                            smode ? plic_get_hart_scontext(scratch) :
> -                                    plic_get_hart_mcontext(scratch),
> +       plic_context_restore(plic_get_hart_data_ptr(scratch), smode,
>                              enable, threshold, num);
>  }
>
> @@ -80,16 +61,14 @@ static int irqchip_plic_warm_init(void)
>  {
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> -       return plic_warm_irqchip_init(plic_get_hart_data_ptr(scratch),
> -                                     plic_get_hart_mcontext(scratch),
> -                                     plic_get_hart_scontext(scratch));
> +       return plic_warm_irqchip_init(plic_get_hart_data_ptr(scratch));
>  }
>
> -static int irqchip_plic_update_hartid_table(const void *fdt, int nodeoff,
> -                                           struct plic_data *pd)
> +static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
> +                                          struct plic_data *pd)
>  {
>         const fdt32_t *val;
> -       u32 phandle, hwirq, hartid;
> +       u32 phandle, hwirq, hartid, hartindex;
>         struct sbi_scratch *scratch;
>         int i, err, count, cpu_offset, cpu_intc_offset;
>
> @@ -114,17 +93,18 @@ static int irqchip_plic_update_hartid_table(const void *fdt, int nodeoff,
>                 if (err)
>                         continue;
>
> -               scratch = sbi_hartid_to_scratch(hartid);
> +               hartindex = sbi_hartid_to_hartindex(hartid);
> +               scratch = sbi_hartindex_to_scratch(hartindex);
>                 if (!scratch)
>                         continue;
>
>                 plic_set_hart_data_ptr(scratch, pd);
>                 switch (hwirq) {
>                 case IRQ_M_EXT:
> -                       plic_set_hart_mcontext(scratch, i / 2);
> +                       pd->context_map[hartindex][PLIC_M_CONTEXT] = i / 2;
>                         break;
>                 case IRQ_S_EXT:
> -                       plic_set_hart_scontext(scratch, i / 2);
> +                       pd->context_map[hartindex][PLIC_S_CONTEXT] = i / 2;
>                         break;
>                 }
>         }
> @@ -135,6 +115,8 @@ static int irqchip_plic_update_hartid_table(const void *fdt, int nodeoff,
>  static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
>                                   const struct fdt_match *match)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>         int rc;
>         struct plic_data *pd;
>
> @@ -144,19 +126,7 @@ static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
>                         return SBI_ENOMEM;
>         }
>
> -       if (!plic_mcontext_offset) {
> -               plic_mcontext_offset = sbi_scratch_alloc_type_offset(long);
> -               if (!plic_mcontext_offset)
> -                       return SBI_ENOMEM;
> -       }
> -
> -       if (!plic_scontext_offset) {
> -               plic_scontext_offset = sbi_scratch_alloc_type_offset(long);
> -               if (!plic_scontext_offset)
> -                       return SBI_ENOMEM;
> -       }
> -
> -       pd = sbi_zalloc(sizeof(*pd));
> +       pd = sbi_zalloc(PLIC_DATA_SIZE(plat->hart_count));
>         if (!pd)
>                 return SBI_ENOMEM;
>
> @@ -166,11 +136,11 @@ static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
>
>         pd->flags = (unsigned long)match->data;
>
> -       rc = plic_cold_irqchip_init(pd);
> +       rc = irqchip_plic_update_context_map(fdt, nodeoff, pd);
>         if (rc)
>                 goto fail_free_data;
>
> -       rc = irqchip_plic_update_hartid_table(fdt, nodeoff, pd);
> +       rc = plic_cold_irqchip_init(pd);
>         if (rc)
>                 goto fail_free_data;
>
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index a432a8c4..c8ea8840 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -102,9 +102,11 @@ void plic_delegate(const struct plic_data *plic)
>                 writel_relaxed(BIT(0), (char *)plic->addr + THEAD_PLIC_CTRL_REG);
>  }
>
> -void plic_context_save(const struct plic_data *plic, int context_id,
> +void plic_context_save(const struct plic_data *plic, bool smode,
>                        u32 *enable, u32 *threshold, u32 num)
>  {
> +       u32 hartindex = current_hartindex();
> +       s16 context_id = plic->context_map[hartindex][smode];
>         u32 ie_words = plic->num_src / 32 + 1;
>
>         if (num > ie_words)
> @@ -116,9 +118,11 @@ void plic_context_save(const struct plic_data *plic, int context_id,
>         *threshold = plic_get_thresh(plic, context_id);
>  }
>
> -void plic_context_restore(const struct plic_data *plic, int context_id,
> +void plic_context_restore(const struct plic_data *plic, bool smode,
>                           const u32 *enable, u32 threshold, u32 num)
>  {
> +       u32 hartindex = current_hartindex();
> +       s16 context_id = plic->context_map[hartindex][smode];
>         u32 ie_words = plic->num_src / 32 + 1;
>
>         if (num > ie_words)
> @@ -149,9 +153,11 @@ static int plic_context_init(const struct plic_data *plic, int context_id,
>         return 0;
>  }
>
> -int plic_warm_irqchip_init(const struct plic_data *plic,
> -                          int m_cntx_id, int s_cntx_id)
> +int plic_warm_irqchip_init(const struct plic_data *plic)
>  {
> +       u32 hartindex = current_hartindex();
> +       s16 m_cntx_id = plic->context_map[hartindex][PLIC_M_CONTEXT];
> +       s16 s_cntx_id = plic->context_map[hartindex][PLIC_S_CONTEXT];
>         bool enable;
>         int ret;
>
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index b21d9ba9..79f6441f 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -40,6 +40,9 @@ static struct plic_data plic = {
>         .size = ARIANE_PLIC_SIZE,
>         .num_src = ARIANE_PLIC_NUM_SOURCES,
>         .flags = PLIC_FLAG_ARIANE_BUG,
> +       .context_map = {
> +               [0] = { 0, 1 },
> +       },
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -99,7 +102,6 @@ static int ariane_final_init(bool cold_boot)
>   */
>  static int ariane_irqchip_init(bool cold_boot)
>  {
> -       u32 hartid = current_hartid();
>         int ret;
>
>         if (cold_boot) {
> @@ -108,7 +110,7 @@ static int ariane_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
> +       return plic_warm_irqchip_init(&plic);
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index c1e84b61..ae5b56c2 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -44,6 +44,11 @@ static struct plic_data plic = {
>         .size = OPENPITON_DEFAULT_PLIC_SIZE,
>         .num_src = OPENPITON_DEFAULT_PLIC_NUM_SOURCES,
>         .flags = PLIC_FLAG_ARIANE_BUG,
> +       .context_map = {
> +               [0] = { 0, 1 },
> +               [1] = { 2, 3 },
> +               [2] = { 4, 5 },
> +       },
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -130,7 +135,6 @@ static int openpiton_final_init(bool cold_boot)
>   */
>  static int openpiton_irqchip_init(bool cold_boot)
>  {
> -       u32 hartid = current_hartid();
>         int ret;
>
>         if (cold_boot) {
> @@ -139,7 +143,7 @@ static int openpiton_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
> +       return plic_warm_irqchip_init(&plic);
>  }
>
>  /*
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 2f3f7079..fa175667 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -33,6 +33,10 @@ static struct plic_data plic = {
>         .addr = K210_PLIC_BASE_ADDR,
>         .size = K210_PLIC_BASE_SIZE,
>         .num_src = K210_PLIC_NUM_SOURCES,
> +       .context_map = {
> +               [0] = { 0, 1 },
> +               [1] = { 2, 3 },
> +       },
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -135,7 +139,6 @@ static int k210_final_init(bool cold_boot)
>  static int k210_irqchip_init(bool cold_boot)
>  {
>         int rc;
> -       u32 hartid = current_hartid();
>
>         if (cold_boot) {
>                 rc = plic_cold_irqchip_init(&plic);
> @@ -143,7 +146,7 @@ static int k210_irqchip_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return plic_warm_irqchip_init(&plic, hartid * 2, hartid * 2 + 1);
> +       return plic_warm_irqchip_init(&plic);
>  }
>
>  static int k210_ipi_init(bool cold_boot)
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 5610e7c7..cca12ead 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -66,6 +66,9 @@ static struct plic_data plic = {
>         .addr = UX600_PLIC_ADDR,
>         .size = UX600_PLIC_SIZE,
>         .num_src = UX600_PLIC_NUM_SOURCES,
> +       .context_map = {
> +               [0] = { 0, -1 },
> +       },
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -190,7 +193,6 @@ static int ux600_final_init(bool cold_boot)
>  static int ux600_irqchip_init(bool cold_boot)
>  {
>         int rc;
> -       u32 hartid = current_hartid();
>
>         if (cold_boot) {
>                 rc = plic_cold_irqchip_init(&plic);
> @@ -198,8 +200,7 @@ static int ux600_irqchip_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return plic_warm_irqchip_init(&plic, (hartid) ? (2 * hartid - 1) : 0,
> -                                     (hartid) ? (2 * hartid) : -1);
> +       return plic_warm_irqchip_init(&plic);
>  }
>
>  static int ux600_ipi_init(bool cold_boot)
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index b4d30a57..37674304 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -37,6 +37,12 @@ static struct plic_data plic = {
>         .addr = PLATFORM_PLIC_ADDR,
>         .size = PLATFORM_PLIC_SIZE,
>         .num_src = PLATFORM_PLIC_NUM_SOURCES,
> +       .context_map = {
> +               [0] = { 0, 1 },
> +               [1] = { 2, 3 },
> +               [2] = { 4, 5 },
> +               [3] = { 6, 7 },
> +       },
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -85,7 +91,6 @@ static int platform_final_init(bool cold_boot)
>   */
>  static int platform_irqchip_init(bool cold_boot)
>  {
> -       u32 hartid = current_hartid();
>         int ret;
>
>         /* Example if the generic PLIC driver is used */
> @@ -95,7 +100,7 @@ static int platform_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
> +       return plic_warm_irqchip_init(&plic);
>  }
>
>  /*
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

