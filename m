From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Sep 2024 17:54:08 +0530
Subject: [PATCH] lib: sbi: fwft: add support for SBI_FWFT_POINTER_MASKING_PMLEN
In-Reply-To: <20240814084037.967027-1-samuel.holland@sifive.com>
References: <20240814084037.967027-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2kx=Lg08ZrrmhYiEQ0hCMRyr1zNKjLNHUx=q5YqEV2UQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 14, 2024 at 3:15?PM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Add support for controlling the pointer masking mode on harts which
> support the Smnpm extension. This extension can only exist on harts
> where XLEN >= 64 bits. This implementation selects the mode with the
> smallest PMLEN that satisfies the caller's requested lower bound.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> This patch implements the API I originally suggested while the FWFT
> extension was a draft and also submitted here:
> https://github.com/riscv-non-isa/riscv-sbi-doc/pull/161
>
>  include/sbi/riscv_encoding.h      |  4 ++
>  include/sbi/sbi_ecall_interface.h |  3 +-
>  include/sbi/sbi_hart.h            |  2 +
>  lib/sbi/sbi_fwft.c                | 67 +++++++++++++++++++++++++++++++
>  lib/sbi/sbi_hart.c                |  1 +
>  5 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 2ed05f24..beb874af 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -213,6 +213,10 @@
>  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
>  #define ENVCFG_ADUE                    (_ULL(1) << 61)
>  #define ENVCFG_CDE                     (_ULL(1) << 60)
> +#define ENVCFG_PMM                     (_ULL(0x3) << 32)
> +#define ENVCFG_PMM_PMLEN_0             (_ULL(0x0) << 32)
> +#define ENVCFG_PMM_PMLEN_7             (_ULL(0x2) << 32)
> +#define ENVCFG_PMM_PMLEN_16            (_ULL(0x3) << 32)
>  #define ENVCFG_CBZE                    (_UL(1) << 7)
>  #define ENVCFG_CBCFE                   (_UL(1) << 6)
>  #define ENVCFG_CBIE_SHIFT              4
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index e9a81677..2958b418 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -128,7 +128,8 @@ enum sbi_fwft_feature_t {
>         SBI_FWFT_SHADOW_STACK                   = 0x2,
>         SBI_FWFT_DOUBLE_TRAP                    = 0x3,
>         SBI_FWFT_PTE_AD_HW_UPDATING             = 0x4,
> -       SBI_FWFT_LOCAL_RESERVED_START           = 0x5,
> +       SBI_FWFT_POINTER_MASKING_PMLEN          = 0x5,
> +       SBI_FWFT_LOCAL_RESERVED_START           = 0x6,
>         SBI_FWFT_LOCAL_RESERVED_END             = 0x3fffffff,
>         SBI_FWFT_LOCAL_PLATFORM_START           = 0x40000000,
>         SBI_FWFT_LOCAL_PLATFORM_END             = 0x7fffffff,
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 81ec061d..32545f41 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -67,6 +67,8 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_SVADE,
>         /** Hart has Svadu extension */
>         SBI_HART_EXT_SVADU,
> +       /** Hart has Smnpm extension */
> +       SBI_HART_EXT_SMNPM,
>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index ef881ef5..c5803300 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -59,6 +59,7 @@ static const unsigned long fwft_defined_features[] = {
>         SBI_FWFT_SHADOW_STACK,
>         SBI_FWFT_DOUBLE_TRAP,
>         SBI_FWFT_PTE_AD_HW_UPDATING,
> +       SBI_FWFT_POINTER_MASKING_PMLEN,
>  };
>
>  static bool fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
> @@ -145,6 +146,64 @@ static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
>         return SBI_OK;
>  }
>
> +#if __riscv_xlen > 32
> +static int fwft_pmlen_supported(struct fwft_config *conf)
> +{
> +       if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
> +                                   SBI_HART_EXT_SMNPM))
> +               return SBI_ENOTSUPP;
> +
> +       return SBI_OK;
> +}
> +
> +static bool fwft_try_to_set_pmm(unsigned long pmm)
> +{
> +       csr_set(CSR_MENVCFG, pmm);
> +       return (csr_read(CSR_MENVCFG) & ENVCFG_PMM) == pmm;
> +}
> +
> +static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
> +{
> +       unsigned long prev;
> +
> +       if (value > 16)
> +               return SBI_EINVAL;
> +
> +       prev = csr_read_clear(CSR_MENVCFG, ENVCFG_PMM);
> +       if (value == 0)
> +               return SBI_OK;
> +       if (value <= 7) {
> +               if (fwft_try_to_set_pmm(ENVCFG_PMM_PMLEN_7))
> +                       return SBI_OK;
> +               csr_clear(CSR_MENVCFG, ENVCFG_PMM);
> +       }
> +       if (fwft_try_to_set_pmm(ENVCFG_PMM_PMLEN_16))
> +               return SBI_OK;
> +       csr_write(CSR_MENVCFG, prev);
> +
> +       return SBI_EINVAL;
> +}
> +
> +static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
> +{
> +       switch (csr_read(CSR_MENVCFG) & ENVCFG_PMM) {
> +       case ENVCFG_PMM_PMLEN_0:
> +               *value = 0;
> +               break;
> +       case ENVCFG_PMM_PMLEN_7:
> +               *value = 7;
> +               break;
> +       case ENVCFG_PMM_PMLEN_16:
> +               *value = 16;
> +               break;
> +       default:
> +               return SBI_EFAIL;
> +       }
> +
> +       return SBI_OK;
> +}
> +#endif
> +
>  static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>  {
>         int i;
> @@ -236,6 +295,14 @@ static const struct fwft_feature features[] =
>                 .set = fwft_set_adue,
>                 .get = fwft_get_adue,
>         },
> +#if __riscv_xlen > 32
> +       {
> +               .id = SBI_FWFT_POINTER_MASKING_PMLEN,
> +               .supported = fwft_pmlen_supported,
> +               .set = fwft_set_pmlen,
> +               .get = fwft_get_pmlen,
> +       },
> +#endif
>  };
>
>  int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c3667019..8c5bcf85 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -680,6 +680,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
>         __SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
>         __SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
>         __SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
> +       __SBI_HART_EXT_DATA(smnpm, SBI_HART_EXT_SMNPM),
>  };
>
>  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

