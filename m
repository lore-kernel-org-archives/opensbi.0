From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sat, 11 Nov 2023 16:14:07 +0100
Subject: [PATCH] lib: sbi: change sbi_hart_features.extensions as an array
In-Reply-To: <20231030164046.25108-1-wxjstz@126.com>
References: <20231030164046.25108-1-wxjstz@126.com>
Message-ID: <8e77c232-8fec-46ea-88a5-a72928930c61@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/30/23 17:39, Xiang W wrote:
> In the future there may be a lot of ISA extensions, a 'long' may not
> be able to accommodate, changed to an array for the future.
> 

Fixes: 6259b2ec2d09 ("lib: utils/fdt: Fix fdt_parse_isa_extensions() 
implementation")
Addresses-Coverity-ID: 1568357 Out-of-bounds access

> Signed-off-by: Xiang W <wxjstz@126.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   include/sbi/sbi_hart.h      |  3 ++-
>   lib/sbi/sbi_hart.c          | 32 ++++++++++++--------------------
>   platform/generic/platform.c |  2 +-
>   3 files changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index e60f415..3b73f63 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -11,6 +11,7 @@
>   #define __SBI_HART_H__
>   
>   #include <sbi/sbi_types.h>
> +#include <sbi/sbi_bitops.h>
>   
>   /** Possible privileged specification versions of a hart */
>   enum sbi_hart_priv_versions {
> @@ -65,7 +66,7 @@ enum sbi_hart_extensions {
>   struct sbi_hart_features {
>   	bool detected;
>   	int priv_version;
> -	unsigned long extensions;
> +	unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
>   	unsigned int pmp_count;
>   	unsigned int pmp_addr_bits;
>   	unsigned long pmp_gran;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 29d6481..f94eba5 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -614,9 +614,9 @@ static inline void __sbi_hart_update_extension(
>   					bool enable)
>   {
>   	if (enable)
> -		hfeatures->extensions |= BIT(ext);
> +		__set_bit(ext, hfeatures->extensions);
>   	else
> -		hfeatures->extensions &= ~BIT(ext);
> +		__clear_bit(ext, hfeatures->extensions);
>   }
>   
>   /**
> @@ -649,7 +649,7 @@ bool sbi_hart_has_extension(struct sbi_scratch *scratch,
>   	struct sbi_hart_features *hfeatures =
>   			sbi_scratch_offset_ptr(scratch, hart_features_offset);
>   
> -	if (hfeatures->extensions & BIT(ext))
> +	if (__test_bit(ext, hfeatures->extensions))
>   		return true;
>   	else
>   		return false;
> @@ -712,24 +712,16 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
>   		return;
>   	sbi_memset(extensions_str, 0, nestr);
>   
> -	if (!hfeatures->extensions)
> -		goto done;
> -
> -	do {
> -		if (hfeatures->extensions & BIT(ext)) {
> -			temp = sbi_hart_extension_id2string(ext);
> -			if (temp) {
> -				sbi_snprintf(extensions_str + offset,
> -					     nestr - offset,
> -					     "%s,", temp);
> -				offset = offset + sbi_strlen(temp) + 1;
> -			}
> +	for_each_set_bit(ext, hfeatures->extensions, SBI_HART_EXT_MAX) {
> +		temp = sbi_hart_extension_id2string(ext);
> +		if (temp) {
> +			sbi_snprintf(extensions_str + offset,
> +				     nestr - offset,
> +				     "%s,", temp);
> +			offset = offset + sbi_strlen(temp) + 1;
>   		}
> +	}
>   
> -		ext++;
> -	} while (ext < SBI_HART_EXT_MAX);
> -
> -done:
>   	if (offset)
>   		extensions_str[offset - 1] = '\0';
>   	else
> @@ -799,7 +791,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>   		return 0;
>   
>   	/* Clear hart features */
> -	hfeatures->extensions = 0;
> +	sbi_memset(hfeatures->extensions, 0, sizeof(hfeatures->extensions));
>   	hfeatures->pmp_count = 0;
>   	hfeatures->mhpm_mask = 0;
>   
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 66a0b77..9182faa 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -215,7 +215,7 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
>   
>   	/* Parse the ISA string from FDT and enable the listed extensions */
>   	rc = fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
> -				      &hfeatures->extensions);
> +				      hfeatures->extensions);
>   
>   	if (rc)
>   		return rc;


