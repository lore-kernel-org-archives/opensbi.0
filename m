From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Mar 2025 18:26:17 +0530
Subject: [PATCH 4/4] lib: sbi: Use sbi_hart_count() and for_each_hartindex()
In-Reply-To: <20250220184233.23802-5-samuel.holland@sifive.com>
References: <20250220184233.23802-1-samuel.holland@sifive.com> <20250220184233.23802-5-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3suh+z7Ev=6d+i6B6zyF0hezZquAKuWm1WiQ=FXCkFTQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2025 at 12:12?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Simplify the code and improve consistency by using the new macros where
> possible. sbi_hart_count() obsoletes sbi_scratch_last_hartindex().
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>
>  include/sbi/sbi_platform.h            | 2 +-
>  include/sbi/sbi_scratch.h             | 3 ---
>  lib/sbi/sbi_domain.c                  | 4 +---
>  lib/sbi/sbi_hsm.c                     | 3 +--
>  lib/sbi/sbi_scratch.c                 | 3 +--
>  lib/utils/irqchip/fdt_irqchip_plic.c  | 5 +----
>  lib/utils/irqchip/plic.c              | 8 ++++----
>  lib/utils/reset/fdt_reset_atcwdt200.c | 5 +----
>  platform/generic/platform.c           | 2 +-
>  9 files changed, 11 insertions(+), 24 deletions(-)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 5e50c997..3c99d439 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -326,7 +326,7 @@ static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *p
>  {
>         if (plat && sbi_platform_ops(plat)->get_tlb_num_entries)
>                 return sbi_platform_ops(plat)->get_tlb_num_entries();
> -       return sbi_scratch_last_hartindex() + 1;
> +       return sbi_hart_count();
>  }
>
>  /**
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 200f73d2..8e6fe577 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -220,9 +220,6 @@ extern u32 sbi_scratch_hart_count;
>  #define for_each_hartindex(__var) \
>         for (u32 __var = 0; __var < sbi_hart_count(); ++__var)
>
> -/** Get last HART index having a sbi_scratch pointer */
> -#define sbi_scratch_last_hartindex() (sbi_hart_count() - 1)
> -
>  /** Check whether a particular HART index is valid or not */
>  #define sbi_hartindex_valid(__hartindex) ((__hartindex) < sbi_hart_count())
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 51c82a75..920298a8 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -770,11 +770,9 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
>
>  int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>  {
> -       u32 i;
>         int rc;
>         struct sbi_hartmask *root_hmask;
>         struct sbi_domain_memregion *root_memregs;
> -       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>
>         SBI_INIT_LIST_HEAD(&domain_list);
>
> @@ -855,7 +853,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>         root.next_mode = scratch->next_mode;
>
>         /* Root domain possible and assigned HARTs */
> -       for (i = 0; i < plat->hart_count; i++)
> +       for_each_hartindex(i)
>                 sbi_hartmask_set_hartindex(i, root_hmask);
>
>         /* Finally register the root domain */
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index cf0eb84b..c740a6c5 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -238,7 +238,6 @@ static void hsm_device_hart_resume(void)
>
>  int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
> -       u32 i;
>         struct sbi_scratch *rscratch;
>         struct sbi_hsm_data *hdata;
>
> @@ -248,7 +247,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
>                         return SBI_ENOMEM;
>
>                 /* Initialize hart state data for every hart */
> -               for (i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> +               for_each_hartindex(i) {
>                         rscratch = sbi_hartindex_to_scratch(i);
>                         if (!rscratch)
>                                 continue;
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index 2dc028ee..5bf49657 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -54,7 +54,6 @@ int sbi_scratch_init(struct sbi_scratch *scratch)
>
>  unsigned long sbi_scratch_alloc_offset(unsigned long size)
>  {
> -       u32 i;
>         void *ptr;
>         unsigned long ret = 0;
>         struct sbi_scratch *rscratch;
> @@ -86,7 +85,7 @@ done:
>         spin_unlock(&extra_lock);
>
>         if (ret) {
> -               for (i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> +               for_each_hartindex(i) {
>                         rscratch = sbi_hartindex_to_scratch(i);
>                         if (!rscratch)
>                                 continue;
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 59898d24..fe880732 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -12,7 +12,6 @@
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_heap.h>
> -#include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
> @@ -66,12 +65,10 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
>  static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
>                                   const struct fdt_match *match)
>  {
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -       const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>         int rc;
>         struct plic_data *pd;
>
> -       pd = sbi_zalloc(PLIC_DATA_SIZE(plat->hart_count));
> +       pd = sbi_zalloc(PLIC_DATA_SIZE(sbi_hart_count()));
>         if (!pd)
>                 return SBI_ENOMEM;
>
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 8b2190f8..06788af0 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -135,7 +135,7 @@ void plic_suspend(void)
>         if (!data_word)
>                 return;
>
> -       for (u32 h = 0; h <= sbi_scratch_last_hartindex(); h++) {
> +       for_each_hartindex(h) {
>                 u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
>
>                 if (context_id < 0)
> @@ -166,7 +166,7 @@ void plic_resume(void)
>         if (!data_word)
>                 return;
>
> -       for (u32 h = 0; h <= sbi_scratch_last_hartindex(); h++) {
> +       for_each_hartindex(h) {
>                 u32 context_id = plic->context_map[h][PLIC_S_CONTEXT];
>
>                 if (context_id < 0)
> @@ -236,7 +236,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>         if (plic->flags & PLIC_FLAG_ENABLE_PM) {
>                 unsigned long data_size = 0;
>
> -               for (u32 i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> +               for_each_hartindex(i) {
>                         if (plic->context_map[i][PLIC_S_CONTEXT] < 0)
>                                 continue;
>
> @@ -270,7 +270,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>         if (ret)
>                 return ret;
>
> -       for (u32 i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> +       for_each_hartindex(i) {
>                 if (plic->context_map[i][PLIC_M_CONTEXT] < 0 &&
>                     plic->context_map[i][PLIC_S_CONTEXT] < 0)
>                         continue;
> diff --git a/lib/utils/reset/fdt_reset_atcwdt200.c b/lib/utils/reset/fdt_reset_atcwdt200.c
> index 97ec7431..00379ce9 100644
> --- a/lib/utils/reset/fdt_reset_atcwdt200.c
> +++ b/lib/utils/reset/fdt_reset_atcwdt200.c
> @@ -12,7 +12,6 @@
>  #include <sbi/sbi_ecall_interface.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> -#include <sbi/sbi_platform.h>
>  #include <sbi/sbi_system.h>
>  #include <sbi_utils/fdt/fdt_driver.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -59,9 +58,7 @@ static int ae350_system_reset_check(u32 type, u32 reason)
>
>  static void ae350_system_reset(u32 type, u32 reason)
>  {
> -       const struct sbi_platform *plat = sbi_platform_thishart_ptr();
> -
> -       for (int i = 0; i < sbi_platform_hart_count(plat); i++)
> +       for_each_hartindex(i)
>                 if (smu_set_reset_vector(&smu, FLASH_BASE, i))
>                         goto fail;
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 14cbf08e..b2f29e8b 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -367,7 +367,7 @@ static u32 generic_tlb_num_entries(void)
>  {
>         if (generic_plat && generic_plat->tlb_num_entries)
>                 return generic_plat->tlb_num_entries(generic_plat_match);
> -       return sbi_scratch_last_hartindex() + 1;
> +       return sbi_hart_count();
>  }
>
>  static int generic_pmu_init(void)
> --
> 2.47.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

