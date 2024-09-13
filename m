From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 13 Sep 2024 13:11:25 -0500
Subject: [PATCH v2 5/6] lib: sbi: implement firmware feature
 SBI_FWFT_DOUBLE_TRAP
In-Reply-To: <20240913143419.3258868-6-cleger@rivosinc.com>
References: <20240913143419.3258868-1-cleger@rivosinc.com>
 <20240913143419.3258868-6-cleger@rivosinc.com>
Message-ID: <833cc267-9f7e-44ac-ad7d-79a35a17c417@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-13 9:34 AM, Cl?ment L?ger wrote:
> Add support for double trap firmware feature.
> 
> Link: https://lists.riscv.org/g/tech-prs/message/985 [1]
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h |  3 ++-
>  lib/sbi/sbi_fwft.c           | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 5b3bbc5..1d83434 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -214,7 +214,8 @@
>  #define ENVCFG_ADUE_SHIFT		61
>  #define ENVCFG_ADUE			(_ULL(1) << ENVCFG_ADUE_SHIFT)
>  #define ENVCFG_CDE			(_ULL(1) << 60)
> -#define ENVCFG_DTE			(_ULL(1) << 59)
> +#define ENVCFG_DTE_SHIFT		59
> +#define ENVCFG_DTE			(_ULL(1) << ENVCFG_DTE_SHIFT)
>  #define ENVCFG_CBZE			(_UL(1) << 7)
>  #define ENVCFG_CBCFE			(_UL(1) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index c818afd..39bd592 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -155,6 +155,25 @@ static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
>  	return fwft_menvcfg_read_bit(value, ENVCFG_ADUE_SHIFT);
>  }
>  
> +static int fwft_double_trap_supported(struct fwft_config *conf)
> +{
> +	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
> +				    SBI_HART_EXT_SSDBLTRP))
> +		return SBI_ENOTSUPP;
> +
> +	return SBI_OK;
> +}
> +
> +static int fwft_set_double_trap(struct fwft_config *conf, unsigned long value)
> +{
> +	return fwft_menvcfg_set_bit(value, ENVCFG_DTE_SHIFT);
> +}
> +
> +static int fwft_get_double_trap(struct fwft_config *conf, unsigned long *value)
> +{
> +	return fwft_menvcfg_read_bit(value, ENVCFG_DTE_SHIFT);
> +}
> +

nit: to be sorted, these functions should go above fwft_adue_supported(). But
it's a trivial concern, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>  {
>  	int i;
> @@ -240,6 +259,12 @@ static const struct fwft_feature features[] =
>  		.set = fwft_set_misaligned_delegation,
>  		.get = fwft_get_misaligned_delegation,
>  	},
> +	{
> +		.id = SBI_FWFT_DOUBLE_TRAP,
> +		.supported = fwft_double_trap_supported,
> +		.set = fwft_set_double_trap,
> +		.get = fwft_get_double_trap,
> +	},
>  	{
>  		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
>  		.supported = fwft_adue_supported,


