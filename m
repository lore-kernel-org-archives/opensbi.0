From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 26 Feb 2024 08:47:07 +0530
Subject: [PATCH V2] lib: sbi: Add sparse hartid support for mtimer and mswi
In-Reply-To: <6cf968eb.2609.18de31745ff.Coremail.gaoshanliukou@163.com>
References: <20240222065530.17673-1-gaoshanliukou@163.com> <CAAhSdy1nEgZa+T1VzWL-Soam5PU6ztqRXCsJc9yrpyCu4n8HkA@mail.gmail.com>
 <6cf968eb.2609.18de31745ff.Coremail.gaoshanliukou@163.com>
Message-ID: <CAK9=C2WH1JM6j8iT6JYYb5v+v0gc1_Kv7_6BzqLyd1BkoY40Sw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024 at 7:16?AM yang.zhang <gaoshanliukou@163.com> wrote:
>
> At 2024-02-24 20:55:58, "Anup Patel" <anup@brainfault.org> wrote:
> >On Thu, Feb 22, 2024 at 12:25?PM yang.zhang <gaoshanliukou@163.com> wrote:
> >>
> >> From: "yang.zhang" <yang.zhang@hexintek.com>
> >>
> >> Need to support sparse hartid for mtmer and mswi.
> >>
> >> Signed-off-by: yang.zhang <yang.zhang@hexintek.com>
> >
> >hartid can always be derived from hartindex using sbi_hartindex_to_hartid()
> >so this patch can be simplified
>
> I considered this replacement, but the first_hartindex is not always  first_hartid.
> Such as mswi_ipi_send, when set IPI, it needs to know the offset between current hart_id
> and first_hartid. If i drop first_hartid, maybe i would calculate the first_hartid by all of the
> hartindex?

You can simply translate current hart_id to current hartindex using
sbi_hartid_to_hartindex().

Regards,
Anup

> Thanks.
>
> >> ---
> >> v1 -> v2:
> >> - Add handle in the case of multiple ACLINT instances
> >> - Check valid hartindex not hartid when parse fdt
> >>
> >> V1: https://lists.infradead.org/pipermail/opensbi/2024-February/006342.html
> >>
> >> ---
> >> I add additional first_hartindex instead of replacing first_hartid with it.
> >> Because first_hartindex maybe not the first hartid, which is the base of
> >> mtimer/mswi, such as in the cpus node of dts:
> >> cluster0 {cpu at 0: reg=<0x0>, cpu at 1: reg=<0x3>}
> >> cluster1 {cpu at 2: reg=<0x7>, cpu at 3: reg=<0x4>}
> >> ---
> >>  include/sbi_utils/fdt/fdt_helper.h      |  2 +-
> >>  include/sbi_utils/ipi/aclint_mswi.h     |  1 +
> >>  include/sbi_utils/timer/aclint_mtimer.h |  1 +
> >>  lib/utils/fdt/fdt_helper.c              | 16 +++++++++++-----
> >>  lib/utils/ipi/aclint_mswi.c             |  2 +-
> >>  lib/utils/ipi/fdt_ipi_mswi.c            |  2 +-
> >>  lib/utils/timer/aclint_mtimer.c         |  2 +-
> >>  lib/utils/timer/fdt_timer_mtimer.c      |  2 +-
> >>  platform/fpga/ariane/platform.c         |  2 ++
> >>  platform/fpga/openpiton/platform.c      |  2 ++
> >>  platform/kendryte/k210/platform.c       |  2 ++
> >>  platform/nuclei/ux600/platform.c        |  2 ++
> >>  platform/template/platform.c            |  2 ++
> >>  13 files changed, 28 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> >> index ab4a80f..398700d 100644
> >> --- a/include/sbi_utils/fdt/fdt_helper.h
> >> +++ b/include/sbi_utils/fdt/fdt_helper.h
> >> @@ -103,7 +103,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>                           bool for_timer, bool allow_regname,
> >>                           unsigned long *out_addr1, unsigned long *out_size1,
> >>                           unsigned long *out_addr2, unsigned long *out_size2,
> >> -                         u32 *out_first_hartid, u32 *out_hart_count);
> >> +                         u32 *out_first_hartindex, u32 *out_first_hartid, u32 *out_hart_count);
> >
> >Drop out_first_hartid
> >
> >>
> >>  int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
> >>                           unsigned long *plmt_size, u32 *hart_count);
> >> diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
> >> index e373a8c..d5708e2 100644
> >> --- a/include/sbi_utils/ipi/aclint_mswi.h
> >> +++ b/include/sbi_utils/ipi/aclint_mswi.h
> >> @@ -22,6 +22,7 @@ struct aclint_mswi_data {
> >>         /* Public details */
> >>         unsigned long addr;
> >>         unsigned long size;
> >> +       u32 first_hartindex;
> >>         u32 first_hartid;
> >
> >Remove first_hartid
> >
> >>         u32 hart_count;
> >>  };
> >> diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
> >> index 6ab8799..21a7d93 100644
> >> --- a/include/sbi_utils/timer/aclint_mtimer.h
> >> +++ b/include/sbi_utils/timer/aclint_mtimer.h
> >> @@ -31,6 +31,7 @@ struct aclint_mtimer_data {
> >>         unsigned long mtime_size;
> >>         unsigned long mtimecmp_addr;
> >>         unsigned long mtimecmp_size;
> >> +       u32 first_hartindex;
> >>         u32 first_hartid;
> >
> >Remove first_hartid
> >
> >>         u32 hart_count;
> >>         bool has_64bit_mmio;
> >> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> >> index a0e93b9..5d9215f 100644
> >> --- a/lib/utils/fdt/fdt_helper.c
> >> +++ b/lib/utils/fdt/fdt_helper.c
> >> @@ -961,16 +961,17 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>                           bool for_timer, bool allow_regname,
> >>                           unsigned long *out_addr1, unsigned long *out_size1,
> >>                           unsigned long *out_addr2, unsigned long *out_size2,
> >> -                         u32 *out_first_hartid, u32 *out_hart_count)
> >> +                         u32 *out_first_hartindex, u32 *out_first_hartid, u32 *out_hart_count)
> >
> >Same as above.
> >
> >>  {
> >>         const fdt32_t *val;
> >>         int i, rc, count, cpu_offset, cpu_intc_offset;
> >> -       u32 phandle, hwirq, hartid, first_hartid, last_hartid, hart_count;
> >> +       u32 phandle, hwirq;
> >> +       u32 hartindex, hartid, first_hartindex, first_hartid, last_hartid, hart_count;
> >>         u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
> >>
> >>         if (nodeoffset < 0 || !fdt ||
> >>             !out_addr1 || !out_size1 ||
> >> -           !out_first_hartid || !out_hart_count)
> >> +           !out_first_hartindex || !out_first_hartid || !out_hart_count)
> >>                 return SBI_EINVAL;
> >>
> >>         if (for_timer && allow_regname && out_addr2 && out_size2 &&
> >> @@ -985,6 +986,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>         if (rc)
> >>                 return rc;
> >>
> >> +       *out_first_hartindex = 0;
> >>         *out_first_hartid = 0;
> >>         *out_hart_count = 0;
> >>
> >> @@ -993,7 +995,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>                 return 0;
> >>         count = count / sizeof(fdt32_t);
> >>
> >> -       first_hartid = -1U;
> >> +       first_hartindex = first_hartid = -1U;
> >>         hart_count = last_hartid = 0;
> >>         for (i = 0; i < (count / 2); i++) {
> >>                 phandle = fdt32_to_cpu(val[2 * i]);
> >> @@ -1011,10 +1013,13 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>                 if (rc)
> >>                         continue;
> >>
> >> -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> >> +               hartindex = sbi_hartid_to_hartindex(hartid);
> >> +               if (SBI_HARTMASK_MAX_BITS <= hartindex)
> >>                         continue;
> >>
> >>                 if (match_hwirq == hwirq) {
> >> +                       if (hartindex < first_hartindex)
> >> +                               first_hartindex = hartindex;
> >>                         if (hartid < first_hartid)
> >>                                 first_hartid = hartid;
> >>                         if (hartid > last_hartid)
> >> @@ -1024,6 +1029,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
> >>         }
> >>
> >>         if ((last_hartid >= first_hartid) && first_hartid != -1U) {
> >> +               *out_first_hartindex = first_hartindex;
> >>                 *out_first_hartid = first_hartid;
> >>                 count = last_hartid - first_hartid + 1;
> >>                 *out_hart_count = (hart_count < count) ? hart_count : count;
> >> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> >> index 4ae6bb1..15298eb 100644
> >> --- a/lib/utils/ipi/aclint_mswi.c
> >> +++ b/lib/utils/ipi/aclint_mswi.c
> >> @@ -102,7 +102,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
> >>
> >>         /* Update MSWI pointer in scratch space */
> >>         for (i = 0; i < mswi->hart_count; i++) {
> >> -               scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
> >> +               scratch = sbi_hartindex_to_scratch(mswi->first_hartindex + i);
> >>                 /*
> >>                  * We don't need to fail if scratch pointer is not available
> >>                  * because we might be dealing with hartid of a HART disabled
> >> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> >> index a709abe..e896e5a 100644
> >> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> >> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> >> @@ -26,7 +26,7 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
> >>
> >>         rc = fdt_parse_aclint_node(fdt, nodeoff, false, false,
> >>                                    &ms->addr, &ms->size, NULL, NULL,
> >> -                                  &ms->first_hartid, &ms->hart_count);
> >> +                                  &ms->first_hartindex, &ms->first_hartid, &ms->hart_count);
> >>         if (rc) {
> >>                 sbi_free(ms);
> >>                 return rc;
> >> diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
> >> index 271e625..706967c 100644
> >> --- a/lib/utils/timer/aclint_mtimer.c
> >> +++ b/lib/utils/timer/aclint_mtimer.c
> >> @@ -218,7 +218,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
> >>
> >>         /* Update MTIMER pointer in scratch space */
> >>         for (i = 0; i < mt->hart_count; i++) {
> >> -               scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
> >> +               scratch = sbi_hartindex_to_scratch(mt->first_hartindex + i);
> >>                 /*
> >>                  * We don't need to fail if scratch pointer is not available
> >>                  * because we might be dealing with hartid of a HART disabled
> >> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> >> index 9e27e3a..aa05afe 100644
> >> --- a/lib/utils/timer/fdt_timer_mtimer.c
> >> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> >> @@ -47,7 +47,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
> >>
> >>         rc = fdt_parse_aclint_node(fdt, nodeoff, true, !is_clint,
> >>                                    &addr[0], &size[0], &addr[1], &size[1],
> >> -                                  &mt->first_hartid, &mt->hart_count);
> >> +                                  &mt->first_hartindex, &mt->first_hartid, &mt->hart_count);
> >>         if (rc) {
> >>                 sbi_free(mtn);
> >>                 return rc;
> >> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> >> index 8be5e6c..d88350c 100644
> >> --- a/platform/fpga/ariane/platform.c
> >> +++ b/platform/fpga/ariane/platform.c
> >> @@ -45,6 +45,7 @@ static struct plic_data plic = {
> >>  static struct aclint_mswi_data mswi = {
> >>         .addr = ARIANE_ACLINT_MSWI_ADDR,
> >>         .size = ACLINT_MSWI_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = ARIANE_HART_COUNT,
> >>  };
> >> @@ -57,6 +58,7 @@ static struct aclint_mtimer_data mtimer = {
> >>         .mtimecmp_addr = ARIANE_ACLINT_MTIMER_ADDR +
> >>                          ACLINT_DEFAULT_MTIMECMP_OFFSET,
> >>         .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = ARIANE_HART_COUNT,
> >>         .has_64bit_mmio = true,
> >> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> >> index 2317a89..c21e8ad 100644
> >> --- a/platform/fpga/openpiton/platform.c
> >> +++ b/platform/fpga/openpiton/platform.c
> >> @@ -49,6 +49,7 @@ static struct plic_data plic = {
> >>  static struct aclint_mswi_data mswi = {
> >>         .addr = OPENPITON_DEFAULT_ACLINT_MSWI_ADDR,
> >>         .size = ACLINT_MSWI_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = OPENPITON_DEFAULT_HART_COUNT,
> >>  };
> >> @@ -61,6 +62,7 @@ static struct aclint_mtimer_data mtimer = {
> >>         .mtimecmp_addr = OPENPITON_DEFAULT_ACLINT_MTIMER_ADDR +
> >>                          ACLINT_DEFAULT_MTIMECMP_OFFSET,
> >>         .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = OPENPITON_DEFAULT_HART_COUNT,
> >>         .has_64bit_mmio = true,
> >> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> >> index 27b23f7..21d34b7 100644
> >> --- a/platform/kendryte/k210/platform.c
> >> +++ b/platform/kendryte/k210/platform.c
> >> @@ -39,6 +39,7 @@ static struct plic_data plic = {
> >>  static struct aclint_mswi_data mswi = {
> >>         .addr = K210_ACLINT_MSWI_ADDR,
> >>         .size = ACLINT_MSWI_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = K210_HART_COUNT,
> >>  };
> >> @@ -51,6 +52,7 @@ static struct aclint_mtimer_data mtimer = {
> >>         .mtimecmp_addr = K210_ACLINT_MTIMER_ADDR +
> >>                          ACLINT_DEFAULT_MTIMECMP_OFFSET,
> >>         .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = K210_HART_COUNT,
> >>         .has_64bit_mmio = true,
> >> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> >> index f688b50..54f35f4 100644
> >> --- a/platform/nuclei/ux600/platform.c
> >> +++ b/platform/nuclei/ux600/platform.c
> >> @@ -72,6 +72,7 @@ static struct plic_data plic = {
> >>  static struct aclint_mswi_data mswi = {
> >>         .addr = UX600_ACLINT_MSWI_ADDR,
> >>         .size = ACLINT_MSWI_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = UX600_HART_COUNT,
> >>  };
> >> @@ -84,6 +85,7 @@ static struct aclint_mtimer_data mtimer = {
> >>         .mtimecmp_addr = UX600_ACLINT_MTIMER_ADDR +
> >>                          ACLINT_DEFAULT_MTIMECMP_OFFSET,
> >>         .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = UX600_HART_COUNT,
> >>         .has_64bit_mmio = true,
> >> diff --git a/platform/template/platform.c b/platform/template/platform.c
> >> index 4b3f2ac..4840542 100644
> >> --- a/platform/template/platform.c
> >> +++ b/platform/template/platform.c
> >> @@ -42,6 +42,7 @@ static struct plic_data plic = {
> >>  static struct aclint_mswi_data mswi = {
> >>         .addr = PLATFORM_ACLINT_MSWI_ADDR,
> >>         .size = ACLINT_MSWI_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = PLATFORM_HART_COUNT,
> >>  };
> >> @@ -54,6 +55,7 @@ static struct aclint_mtimer_data mtimer = {
> >>         .mtimecmp_addr = PLATFORM_ACLINT_MTIMER_ADDR +
> >>                          ACLINT_DEFAULT_MTIMECMP_OFFSET,
> >>         .mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
> >> +       .first_hartindex = 0,
> >>         .first_hartid = 0,
> >>         .hart_count = PLATFORM_HART_COUNT,
> >>         .has_64bit_mmio = true,
> >> --
> >> 2.25.1
> >>
> >
> >Regards,
> >Anup

