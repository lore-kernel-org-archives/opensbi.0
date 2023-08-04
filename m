From: mchitale@ventanamicro.com <mchitale@ventanamicro.com>
Date: Fri, 04 Aug 2023 10:22:16 +0530
Subject: [PATCH] lib: utils/fdt: Fix fdt_parse_isa_extensions()
 implementation
In-Reply-To: <20230803071101.352061-1-apatel@ventanamicro.com>
References: <20230803071101.352061-1-apatel@ventanamicro.com>
Message-ID: <95b3c58a4eb9df659944962204f97c9b282f4a7a.camel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2023-08-03 at 12:41 +0530, Anup Patel wrote:
> Currently, the fdt_parse_isa_extensions() tries to parse the ISA
> string once for each HART. This ISA string parsing can fail for
> secondary HARTs if the FDT memory is already overwritten by the
> supervisor OS.
> 
> To tackle this issue, we improve the fdt_parse_isa_extensions()
> implementation to pre-parse ISA string for all HARTs during
> cold boot.
> 
> Fixes: d72f5f17478d ("lib: utils: Add detection of Smepmp from ISA
> string in FDT")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 122 ++++++++++++++++++++++++-----------
> --
>  1 file changed, 79 insertions(+), 43 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 61a4100..c97f09d 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -314,54 +314,14 @@ int fdt_parse_timebase_frequency(void *fdt,
> unsigned long *freq)
>  	return 0;
>  }
>  
> -static int fdt_get_isa_string(void *fdt, unsigned int hartid,
> -			const char **isa_string)
> -{
> -	int err, cpu_offset, cpus_offset, len;
> -	u32 c_hartid;
> -	const fdt32_t *val;
> -
> -	if (!fdt)
> -		return SBI_EINVAL;
> -
> -	cpus_offset = fdt_path_offset(fdt, "/cpus");
> -	if (cpus_offset < 0)
> -		return cpus_offset;
> -
> -	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> -		err = fdt_parse_hart_id(fdt, cpu_offset, &c_hartid);
> -		if (err)
> -			continue;
> -
> -		if (!fdt_node_is_enabled(fdt, cpu_offset))
> -			continue;
> -
> -		if (c_hartid == hartid) {
> -			val = fdt_getprop(fdt, cpu_offset, "riscv,isa",
> &len);
> -			if (val && len > 0) {
> -				*isa_string = (const char *)val;
> -				return 0;
> -			}
> -		}
> -	}
> -
> -	return SBI_EINVAL;
> -}
> -
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
>  
> -int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
> -			unsigned long *extensions)
> +static unsigned long fdt_isa_bitmap_offset;
> +
> +static int fdt_parse_isa_one_hart(const char *isa, unsigned long
> *extensions)
>  {
>  	size_t i, j, isa_len;
>  	char mstr[RISCV_ISA_EXT_NAME_LEN_MAX];
> -	const char *isa = NULL;
> -
> -	if (fdt_get_isa_string(fdt, hartid, &isa))
> -		return SBI_EINVAL;
> -
> -	if (!isa)
> -		return SBI_EINVAL;
>  
>  	i = 0;
>  	isa_len = strlen(isa);
> @@ -424,6 +384,82 @@ int fdt_parse_isa_extensions(void *fdt, unsigned
> int hartid,
>  	return 0;
>  }
>  
> +static int fdt_parse_isa_all_harts(void *fdt)
> +{
> +	u32 hartid;
> +	const fdt32_t *val;
> +	unsigned long *hart_exts;
> +	struct sbi_scratch *scratch;
> +	int err, cpu_offset, cpus_offset, len;
> +
> +	if (!fdt || !fdt_isa_bitmap_offset)
> +		return SBI_EINVAL;
> +
> +	cpus_offset = fdt_path_offset(fdt, "/cpus");
> +	if (cpus_offset < 0)
> +		return cpus_offset;
> +
> +	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
> +		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> +		if (err)
> +			continue;
> +
> +		if (!fdt_node_is_enabled(fdt, cpu_offset))
> +			continue;
> +
> +		val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
> +		if (!val || len <= 0)
> +			return SBI_ENOENT;
> +
> +		scratch = sbi_hartid_to_scratch(hartid);
> +		if (!scratch)
> +			return SBI_ENOENT;
> +
> +		hart_exts = sbi_scratch_offset_ptr(scratch,
> +						   fdt_isa_bitmap_offse
> t);
> +		if (!hart_exts)
> +			return SBI_ENOENT;
> +
> +		err = fdt_parse_isa_one_hart((const char *)val,
> hart_exts);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
> +			unsigned long *extensions)
> +{
> +	int rc, i;
> +	unsigned long *hart_exts;
> +	struct sbi_scratch *scratch;
> +
> +	if (!fdt_isa_bitmap_offset) {
> +		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
> +					sizeof(*hart_exts) *
> +					BITS_TO_LONGS(SBI_HART_EXT_MAX)
> );
> +		if (!fdt_isa_bitmap_offset)
> +			return SBI_ENOMEM;
> +
> +		rc = fdt_parse_isa_all_harts(fdt);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	scratch = sbi_hartid_to_scratch(hartid);
> +	if (!scratch)
> +		return SBI_ENOENT;
> +
> +	hart_exts = sbi_scratch_offset_ptr(scratch,
> fdt_isa_bitmap_offset);
> +	if (!hart_exts)
> +		return SBI_ENOENT;
> +
> +	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
> +		extensions[i] |= hart_exts[i];
> +	return 0;
> +}
> +
>  static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
>  				      struct platform_uart_data *uart,
>  				      unsigned long default_freq,
> -- 
> 2.34.1
> 
> 
Works on SiFive HiFive Unmatched A00.
Tested-By : Mayuresh Chitale<mchitale@ventanamicro.com>


