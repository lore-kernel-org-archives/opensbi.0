From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Aug 2024 17:25:24 +0530
Subject: [PATCH 2/4] platform: generic: andes: add a new Andes SBI call to
 probe Andes PMA feature
In-Reply-To: <20240723075728.587110-3-ben717@andestech.com>
References: <20240723075728.587110-1-ben717@andestech.com> <20240723075728.587110-3-ben717@andestech.com>
Message-ID: <CAAhSdy0tautAAmppVfwjf2Px_ucArtn91fweCwgWwDLu8jpAyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 23, 2024 at 1:27?PM Ben Zong-You Xie <ben717@andestech.com> wrote:
>
> Add a new Andes SBI call to check whether PPMA is supported by hardware
> or not.
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup


> ---
>  platform/generic/andes/ae350.c             |  2 ++
>  platform/generic/andes/andes_pma.c         |  8 ++++++--
>  platform/generic/andes/andes_sbi.c         |  5 +++++
>  platform/generic/include/andes/andes_pma.h | 12 ++++++++++++
>  4 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
> index 63c10bc..a1ab6b9 100644
> --- a/platform/generic/andes/ae350.c
> +++ b/platform/generic/andes/ae350.c
> @@ -19,6 +19,7 @@
>  #include <sbi/sbi_ipi.h>
>  #include <sbi/sbi_init.h>
>  #include <andes/andes.h>
> +#include <andes/andes_sbi.h>
>
>  static struct smu_data smu = { 0 };
>  extern void __ae350_enable_coherency_warmboot(void);
> @@ -120,4 +121,5 @@ const struct platform_override andes_ae350 = {
>         .final_init  = ae350_final_init,
>         .extensions_init = andes_pmu_extensions_init,
>         .pmu_init = andes_pmu_init,
> +       .vendor_ext_provider = andes_sbi_vendor_ext_provider,
>  };
> diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
> index 9c37720..a884bf7 100644
> --- a/platform/generic/andes/andes_pma.c
> +++ b/platform/generic/andes/andes_pma.c
> @@ -241,7 +241,6 @@ static int andes_fdt_reserved_memory_fixup(void *fdt,
>  int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
>                             unsigned int pma_regions_count)
>  {
> -       unsigned long mmsc = csr_read(CSR_MMSC_CFG);
>         unsigned int dt_populate_cnt;
>         unsigned int i, j;
>         unsigned long pa;
> @@ -254,7 +253,7 @@ int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
>         if (pma_regions_count > ANDES_MAX_PMA_REGIONS)
>                 return SBI_EINVAL;
>
> -       if ((mmsc & MMSC_CFG_PPMA_MASK) == 0)
> +       if (!andes_sbi_probe_pma())
>                 return SBI_ENOTSUPP;
>
>         /* Configure the PMA regions */
> @@ -290,3 +289,8 @@ int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
>
>         return 0;
>  }
> +
> +bool andes_sbi_probe_pma(void)
> +{
> +       return (csr_read(CSR_MMSC_CFG) & MMSC_CFG_PPMA_MASK) ? true : false;
> +}
> diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
> index 43bafdc..a7ca4a5 100644
> --- a/platform/generic/andes/andes_sbi.c
> +++ b/platform/generic/andes/andes_sbi.c
> @@ -5,12 +5,14 @@
>   */
>  #include <andes/andes.h>
>  #include <andes/andes_sbi.h>
> +#include <andes/andes_pma.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/sbi_error.h>
>
>  enum sbi_ext_andes_fid {
>         SBI_EXT_ANDES_FID0 = 0, /* Reserved for future use */
>         SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
> +       SBI_EXT_ANDES_PMA_PROBE,
>  };
>
>  static bool andes_cache_controllable(void)
> @@ -41,6 +43,9 @@ int andes_sbi_vendor_ext_provider(long funcid,
>         case SBI_EXT_ANDES_IOCP_SW_WORKAROUND:
>                 out->value = andes_apply_iocp_sw_workaround();
>                 break;
> +       case SBI_EXT_ANDES_PMA_PROBE:
> +               out->value = andes_sbi_probe_pma();
> +               break;
>
>         default:
>                 return SBI_EINVAL;
> diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
> index 5ea1247..147dca1 100644
> --- a/platform/generic/include/andes/andes_pma.h
> +++ b/platform/generic/include/andes/andes_pma.h
> @@ -47,4 +47,16 @@ struct andes_pma_region {
>  int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
>                             unsigned int pma_regions_count);
>
> +/**
> + * Programmable PMA(PPMA) is a feature for Andes. PPMA allows dynamic adjustment
> + * of memory attributes in the runtime. It contains a configurable amount of PMA
> + * entries implemented as CSRs to control the attributes of memory locations.
> + *
> + * Check if hardware supports PPMA
> + *
> + * @return true if PPMA is supported
> + * @return false if PPMA is not supported
> + */
> +bool andes_sbi_probe_pma(void);
> +
>  #endif /* _ANDES_PMA_H_ */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

