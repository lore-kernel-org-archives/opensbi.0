From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 11:35:27 +0530
Subject: [PATCH 5/9] lib: utils/irqchip: Move per-hart data from fdt_plic
 to plic
In-Reply-To: <20241105041015.2949808-6-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com> <20241105041015.2949808-6-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3-3HVDj-H0A_J68yC6BYh=KLhGVuEjGToBmeTswDmb=g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 5, 2024 at 9:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> The per-hart PLIC pointer is not really specific to FDT platforms. Move
> it into the main driver and drop the extra wrapper functions.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  include/sbi_utils/irqchip/fdt_irqchip_plic.h | 19 --------
>  include/sbi_utils/irqchip/plic.h             |  8 ++--
>  lib/utils/irqchip/fdt_irqchip_plic.c         | 49 +-------------------
>  lib/utils/irqchip/plic.c                     | 49 ++++++++++++++++++--
>  platform/fpga/ariane/platform.c              |  2 +-
>  platform/fpga/openpiton/platform.c           |  2 +-
>  platform/generic/allwinner/sun20i-d1.c       |  8 ++--
>  platform/kendryte/k210/platform.c            |  2 +-
>  platform/nuclei/ux600/platform.c             |  2 +-
>  platform/template/platform.c                 |  2 +-
>  10 files changed, 60 insertions(+), 83 deletions(-)
>  delete mode 100644 include/sbi_utils/irqchip/fdt_irqchip_plic.h
>
> diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> deleted file mode 100644
> index fe769993..00000000
> --- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> - * Copyright (c) 2022 Samuel Holland <samuel@sholland.org>
> - */
> -
> -#ifndef __IRQCHIP_FDT_IRQCHIP_PLIC_H__
> -#define __IRQCHIP_FDT_IRQCHIP_PLIC_H__
> -
> -#include <sbi/sbi_types.h>
> -#include <sbi_utils/irqchip/plic.h>
> -
> -struct plic_data *fdt_plic_get(void);
> -
> -void fdt_plic_suspend(void);
> -
> -void fdt_plic_resume(void);
> -
> -#endif
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 29fe60c1..5c638e14 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -36,11 +36,13 @@ struct plic_data {
>
>  #define PLIC_IE_WORDS(__p)             ((__p)->num_src / 32 + 1)
>
> -void plic_suspend(const struct plic_data *plic);
> +struct plic_data *plic_get(void);
>
> -void plic_resume(const struct plic_data *plic);
> +void plic_suspend(void);
>
> -int plic_warm_irqchip_init(const struct plic_data *plic);
> +void plic_resume(void);
> +
> +int plic_warm_irqchip_init(void);
>
>  int plic_cold_irqchip_init(struct plic_data *plic);
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 3826d2ae..ebde7eec 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -18,48 +18,11 @@
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
>  #include <sbi_utils/irqchip/plic.h>
>
> -static unsigned long plic_ptr_offset;
> -
> -#define plic_get_hart_data_ptr(__scratch)                              \
> -       sbi_scratch_read_type((__scratch), void *, plic_ptr_offset)
> -
> -#define plic_set_hart_data_ptr(__scratch, __plic)                      \
> -       sbi_scratch_write_type((__scratch), void *, plic_ptr_offset, (__plic))
> -
> -struct plic_data *fdt_plic_get(void)
> -{
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -
> -       return plic_get_hart_data_ptr(scratch);
> -}
> -
> -void fdt_plic_suspend(void)
> -{
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -
> -       plic_suspend(plic_get_hart_data_ptr(scratch));
> -}
> -
> -void fdt_plic_resume(void)
> -{
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -
> -       plic_resume(plic_get_hart_data_ptr(scratch));
> -}
> -
> -static int irqchip_plic_warm_init(void)
> -{
> -       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> -
> -       return plic_warm_irqchip_init(plic_get_hart_data_ptr(scratch));
> -}
> -
>  static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
>                                            struct plic_data *pd)
>  {
>         const fdt32_t *val;
>         u32 phandle, hwirq, hartid, hartindex;
> -       struct sbi_scratch *scratch;
>         int i, err, count, cpu_offset, cpu_intc_offset;
>
>         val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
> @@ -84,11 +47,9 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
>                         continue;
>
>                 hartindex = sbi_hartid_to_hartindex(hartid);
> -               scratch = sbi_hartindex_to_scratch(hartindex);
> -               if (!scratch)
> +               if (hartindex == -1U)
>                         continue;
>
> -               plic_set_hart_data_ptr(scratch, pd);
>                 switch (hwirq) {
>                 case IRQ_M_EXT:
>                         pd->context_map[hartindex][PLIC_M_CONTEXT] = i / 2;
> @@ -110,12 +71,6 @@ static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
>         int rc;
>         struct plic_data *pd;
>
> -       if (!plic_ptr_offset) {
> -               plic_ptr_offset = sbi_scratch_alloc_type_offset(void *);
> -               if (!plic_ptr_offset)
> -                       return SBI_ENOMEM;
> -       }
> -
>         pd = sbi_zalloc(PLIC_DATA_SIZE(plat->hart_count));
>         if (!pd)
>                 return SBI_ENOMEM;
> @@ -153,6 +108,6 @@ static const struct fdt_match irqchip_plic_match[] = {
>  struct fdt_irqchip fdt_irqchip_plic = {
>         .match_table = irqchip_plic_match,
>         .cold_init = irqchip_plic_cold_init,
> -       .warm_init = irqchip_plic_warm_init,
> +       .warm_init = plic_warm_irqchip_init,
>         .exit = NULL,
>  };
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index ab58e390..ca506c4c 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -27,6 +27,21 @@
>
>  #define THEAD_PLIC_CTRL_REG 0x1ffffc
>
> +static unsigned long plic_ptr_offset;
> +
> +#define plic_get_hart_data_ptr(__scratch)                              \
> +       sbi_scratch_read_type((__scratch), void *, plic_ptr_offset)
> +
> +#define plic_set_hart_data_ptr(__scratch, __plic)                      \
> +       sbi_scratch_write_type((__scratch), void *, plic_ptr_offset, (__plic))
> +
> +struct plic_data *plic_get(void)
> +{
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       return plic_get_hart_data_ptr(scratch);
> +}
> +
>  static u32 plic_get_priority(const struct plic_data *plic, u32 source)
>  {
>         volatile void *plic_priority = (char *)plic->addr +
> @@ -109,8 +124,10 @@ static int plic_context_init(const struct plic_data *plic, int context_id,
>         return 0;
>  }
>
> -void plic_suspend(const struct plic_data *plic)
> +void plic_suspend(void)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       const struct plic_data *plic = plic_get_hart_data_ptr(scratch);
>         u32 ie_words = PLIC_IE_WORDS(plic);
>         u32 *data_word = plic->pm_data;
>         u8 *data_byte;
> @@ -138,8 +155,10 @@ void plic_suspend(const struct plic_data *plic)
>                 *data_byte++ = plic_get_priority(plic, i);
>  }
>
> -void plic_resume(const struct plic_data *plic)
> +void plic_resume(void)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       const struct plic_data *plic = plic_get_hart_data_ptr(scratch);
>         u32 ie_words = PLIC_IE_WORDS(plic);
>         u32 *data_word = plic->pm_data;
>         u8 *data_byte;
> @@ -170,8 +189,10 @@ void plic_resume(const struct plic_data *plic)
>         plic_delegate(plic);
>  }
>
> -int plic_warm_irqchip_init(const struct plic_data *plic)
> +int plic_warm_irqchip_init(void)
>  {
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       const struct plic_data *plic = plic_get_hart_data_ptr(scratch);
>         u32 hartindex = current_hartindex();
>         s16 m_cntx_id = plic->context_map[hartindex][PLIC_M_CONTEXT];
>         s16 s_cntx_id = plic->context_map[hartindex][PLIC_S_CONTEXT];
> @@ -201,11 +222,17 @@ int plic_warm_irqchip_init(const struct plic_data *plic)
>
>  int plic_cold_irqchip_init(struct plic_data *plic)
>  {
> -       int i;
> +       int i, ret;
>
>         if (!plic)
>                 return SBI_EINVAL;
>
> +       if (!plic_ptr_offset) {
> +               plic_ptr_offset = sbi_scratch_alloc_type_offset(void *);
> +               if (!plic_ptr_offset)
> +                       return SBI_ENOMEM;
> +       }
> +
>         if (plic->flags & PLIC_FLAG_ENABLE_PM) {
>                 unsigned long data_size = 0;
>
> @@ -237,7 +264,19 @@ int plic_cold_irqchip_init(struct plic_data *plic)
>
>         plic_delegate(plic);
>
> -       return sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
> +       ret = sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
>                                         (SBI_DOMAIN_MEMREGION_MMIO |
>                                          SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
> +       if (ret)
> +               return ret;
> +
> +       for (u32 i = 0; i <= sbi_scratch_last_hartindex(); i++) {
> +               if (plic->context_map[i][PLIC_M_CONTEXT] < 0 &&
> +                   plic->context_map[i][PLIC_S_CONTEXT] < 0)
> +                       continue;
> +
> +               plic_set_hart_data_ptr(sbi_hartindex_to_scratch(i), plic);
> +       }
> +
> +       return 0;
>  }
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index 79f6441f..c4ac0ae6 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -110,7 +110,7 @@ static int ariane_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic);
> +       return plic_warm_irqchip_init();
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index ae5b56c2..73429f88 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -143,7 +143,7 @@ static int openpiton_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic);
> +       return plic_warm_irqchip_init();
>  }
>
>  /*
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index c4b06d1a..b65013c2 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -17,7 +17,7 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_fixup.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> -#include <sbi_utils/irqchip/fdt_irqchip_plic.h>
> +#include <sbi_utils/irqchip/plic.h>
>
>  #define SUN20I_D1_CCU_BASE             ((void *)0x02001000)
>  #define SUN20I_D1_RISCV_CFG_BASE       ((void *)0x06010000)
> @@ -92,7 +92,7 @@ static void sun20i_d1_ppu_restore(void)
>
>  static void sun20i_d1_riscv_cfg_save(void)
>  {
> -       struct plic_data *plic = fdt_plic_get();
> +       struct plic_data *plic = plic_get();
>         u32 *plic_sie = plic->pm_data;
>
>         /* Enable MMIO access. Do not assume S-mode leaves the clock enabled. */
> @@ -136,7 +136,7 @@ static int sun20i_d1_hart_suspend(u32 suspend_type)
>         if (!(suspend_type & SBI_HSM_SUSP_NON_RET_BIT))
>                 return SBI_ENOTSUPP;
>
> -       fdt_plic_suspend();
> +       plic_suspend();
>         sun20i_d1_ppu_save();
>         sun20i_d1_riscv_cfg_save();
>         sun20i_d1_csr_save();
> @@ -156,7 +156,7 @@ static void sun20i_d1_hart_resume(void)
>         sun20i_d1_csr_restore();
>         sun20i_d1_riscv_cfg_restore();
>         sun20i_d1_ppu_restore();
> -       fdt_plic_resume();
> +       plic_resume();
>  }
>
>  static const struct sbi_hsm_device sun20i_d1_ppu = {
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index fa175667..e1808d17 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -146,7 +146,7 @@ static int k210_irqchip_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return plic_warm_irqchip_init(&plic);
> +       return plic_warm_irqchip_init();
>  }
>
>  static int k210_ipi_init(bool cold_boot)
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index cca12ead..12657bc0 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -200,7 +200,7 @@ static int ux600_irqchip_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return plic_warm_irqchip_init(&plic);
> +       return plic_warm_irqchip_init();
>  }
>
>  static int ux600_ipi_init(bool cold_boot)
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index 37674304..298301a4 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -100,7 +100,7 @@ static int platform_irqchip_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return plic_warm_irqchip_init(&plic);
> +       return plic_warm_irqchip_init();
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

