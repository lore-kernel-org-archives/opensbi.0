From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 18 Apr 2024 17:31:56 -0500
Subject: [RFC PATCH 3/4] lib: sbi: implement SBI_FWFT_DOUBLE_TRAP_ENABLE
In-Reply-To: <20240418135421.1452709-4-cleger@rivosinc.com>
References: <20240418135421.1452709-1-cleger@rivosinc.com>
 <20240418135421.1452709-4-cleger@rivosinc.com>
Message-ID: <bb461687-90ae-4d0b-b5f4-e2889a879f51@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Cl?ment,

On 2024-04-18 8:54 AM, Cl?ment L?ger wrote:
> Add support for double trap firmware feature
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_fwft.c | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index 78fbd45..965d47a 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -34,7 +34,7 @@ static unsigned long fwft_ptr_offset;
>  
>  #define MIS_DELEG (1UL << CAUSE_MISALIGNED_LOAD | 1UL << CAUSE_MISALIGNED_STORE)
>  
> -#define SUPPORTED_FEATURE_COUNT	3
> +#define SUPPORTED_FEATURE_COUNT	4
>  
>  struct fwft_config;
>  
> @@ -149,6 +149,51 @@ static int sbi_get_adue(struct fwft_config *conf, unsigned long *value)
>  	return SBI_OK;
>  }
>  
> +#if __riscv_xlen == 32
> +# define CSR_MENVCFG_DBLTRP	CSR_MENVCFGH
> +# define DBLTRP_DTE	(ENVCFG_DTE >> 32)
> +#else
> +# define CSR_MENVCFG_DBLTRP	CSR_MENVCFG
> +# define DBLTRP_DTE	ENVCFG_DTE
> +#endif
> +
> +static int sbi_double_trap_supported(struct fwft_config *conf)
> +{
> +	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
> +				    SBI_HART_EXT_SSDBLTRP))
> +		return SBI_ENOTSUPP;
> +
> +	return SBI_OK;
> +}
> +
> +static int sbi_set_double_trap_enable(struct fwft_config *conf,
> +				      unsigned long value)
> +{
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSDBLTRP))
> +		return SBI_ENOTSUPP;
> +
> +	if (value)
> +		csr_set(CSR_MENVCFG_DBLTRP, DBLTRP_DTE);
> +	else
> +		csr_clear(CSR_MENVCFG_DBLTRP, DBLTRP_DTE);

This configuration will be lost after hart non-retentive suspend. Probably
mstatus_init() should only be called during boot and the registers
saved/restored across hart suspend. Looking at your branch, the other FWFT
features have the same problem.

Regards,
Samuel

> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int sbi_get_double_trap_enable(struct fwft_config *conf,
> +				      unsigned long *value)
> +{
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSDBLTRP))
> +		return SBI_ENOTSUPP;
> +
> +	*value = (csr_read(CSR_MENVCFG_DBLTRP) & DBLTRP_DTE) != 0;
> +
> +	return SBI_SUCCESS;
> +}
>  
>  static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>  {
> @@ -223,6 +268,12 @@ static const struct fwft_feature features[] =
>  		.set = sbi_set_misaligned_delegation,
>  		.get = sbi_get_misaligned_delegation,
>  	},
> +	{
> +		.id = SBI_FWFT_DOUBLE_TRAP,
> +		.supported = sbi_double_trap_supported,
> +		.set = sbi_set_double_trap_enable,
> +		.get = sbi_get_double_trap_enable,
> +	},
>  	{
>  		.id = SBI_FWFT_USEED,
>  		.supported = sbi_useed_supported,


