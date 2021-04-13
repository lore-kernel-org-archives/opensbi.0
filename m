From: Xiang W <wxjstz@126.com>
Date: Tue, 13 Apr 2021 12:22:22 +0800
Subject: [PATCH v2 3/7] lib: sbi: Add sbi_domain_root_add_memregion() API
In-Reply-To: <20210412121617.933493-4-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
 <20210412121617.933493-4-anup.patel@wdc.com>
Message-ID: <9abb59217c213c8ce7aa0320975468500da52e95.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-04-12?? 17:46 +0530?Anup Patel???
> We should allow platform support to add more root memory regions
> before domains are finalized. This will help platform support to
> protect critical M-mode only resources.
> 
> This patch adds sbi_domain_root_add_memregion() API for above
> described purpose.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
Looks good to me.

Reviewed-by: Xiang W <wxjstz@126.com>

Regards,
Xiang W
> ---
>  include/sbi/sbi_domain.h |  8 ++++
>  lib/sbi/sbi_domain.c     | 83 ++++++++++++++++++++++++++++++++++--
> ----
>  2 files changed, 80 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index f9f4f7d..84d17da 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -170,6 +170,14 @@ void sbi_domain_dump_all(const char *suffix);
>  int sbi_domain_register(struct sbi_domain *dom,
>  			const struct sbi_hartmask *assign_mask);
>  
> +/**
> + * Add a memory region to the root domain
> + * @param reg pointer to the memory region to be added
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_domain_root_add_memregion(const struct sbi_domain_memregion
> *reg);
> +
>  /** Finalize domain tables and startup non-root domains */
>  int sbi_domain_finalize(struct sbi_scratch *scratch, u32
> cold_hartid);
>  
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 164f35c..4b5a89f 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -24,10 +24,10 @@ static bool domain_finalized = false;
>  
>  static struct sbi_hartmask root_hmask = { 0 };
>  
> -#define ROOT_FW_REGION		0
> -#define ROOT_ALL_REGION	1
> -#define ROOT_END_REGION	2
> -static struct sbi_domain_memregion root_memregs[ROOT_END_REGION + 1]
> = { 0 };
> +#define ROOT_REGION_MAX	16
> +static u32 root_memregs_count = 0;
> +static struct sbi_domain_memregion root_fw_region;
> +static struct sbi_domain_memregion root_memregs[ROOT_REGION_MAX + 1]
> = { 0 };
>  
>  static struct sbi_domain root = {
>  	.name = "root",
> @@ -69,7 +69,7 @@ void sbi_domain_memregion_initfw(struct
> sbi_domain_memregion *reg)
>  	if (!reg)
>  		return;
>  
> -	sbi_memcpy(reg, &root_memregs[ROOT_FW_REGION], sizeof(*reg));
> +	sbi_memcpy(reg, &root_fw_region, sizeof(*reg));
>  }
>  
>  void sbi_domain_memregion_init(unsigned long addr,
> @@ -236,9 +236,9 @@ static int sanitize_domain(const struct
> sbi_platform *plat,
>  	count = 0;
>  	have_fw_reg = FALSE;
>  	sbi_domain_for_each_memregion(dom, reg) {
> -		if (reg->order == root_memregs[ROOT_FW_REGION].order &&
> -		    reg->base == root_memregs[ROOT_FW_REGION].base &&
> -		    reg->flags == root_memregs[ROOT_FW_REGION].flags)
> +		if (reg->order == root_fw_region.order &&
> +		    reg->base == root_fw_region.base &&
> +		    reg->flags == root_fw_region.flags)
>  			have_fw_reg = TRUE;
>  		count++;
>  	}
> @@ -468,6 +468,66 @@ int sbi_domain_register(struct sbi_domain *dom,
>  	return 0;
>  }
>  
> +int sbi_domain_root_add_memregion(const struct sbi_domain_memregion
> *reg)
> +{
> +	int rc;
> +	bool reg_merged;
> +	struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
> +	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
> +
> +	/* Sanity checks */
> +	if (!reg || domain_finalized ||
> +	    (root.regions != root_memregs) ||
> +	    (ROOT_REGION_MAX <= root_memregs_count))
> +		return SBI_EINVAL;
> +
> +	/* Check for conflicts */
> +	sbi_domain_for_each_memregion(&root, nreg) {
> +		if (is_region_conflict(reg, nreg))
> +			return SBI_EINVAL;
> +	}
> +
> +	/* Append the memregion to root memregions */
> +	nreg = &root_memregs[root_memregs_count];
> +	sbi_memcpy(nreg, reg, sizeof(*reg));
> +	root_memregs_count++;
> +	root_memregs[root_memregs_count].order = 0;
> +
> +	/* Sort and optimize root regions */
> +	do {
> +		/* Sanitize the root domain so that memregions are
> sorted */
> +		rc = sanitize_domain(plat, &root);
> +		if (rc) {
> +			sbi_printf("%s: sanity checks failed for"
> +				   " %s (error %d)\n", __func__,
> +				   root.name, rc);
> +			return rc;
> +		}
> +
> +		/* Merge consecutive memregions with same order and
> flags */
> +		reg_merged = false;
> +		sbi_domain_for_each_memregion(&root, nreg) {
> +			nreg1 = nreg + 1;
> +			if (!nreg1->order)
> +				continue;
> +
> +			if ((nreg->base + BIT(nreg->order)) == nreg1-
> >base &&
> +			    nreg->order == nreg1->order &&
> +			    nreg->flags == nreg1->flags) {
> +				nreg->order++;
> +				while (nreg1->order) {
> +					nreg2 = nreg1 + 1;
> +					sbi_memcpy(nreg1, nreg2,
> sizeof(*nreg1));
> +					nreg1++;
> +				}
> +				reg_merged = true;
> +			}
> +		}
> +	} while (reg_merged);
> +
> +	return 0;
> +}
> +
>  int sbi_domain_finalize(struct sbi_scratch *scratch, u32
> cold_hartid)
>  {
>  	int rc;
> @@ -537,17 +597,18 @@ int sbi_domain_init(struct sbi_scratch
> *scratch, u32 cold_hartid)
>  
>  	/* Root domain firmware memory region */
>  	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
> 0,
> -				  &root_memregs[ROOT_FW_REGION]);
> +				  &root_fw_region);
> +	sbi_domain_memregion_initfw(&root_memregs[root_memregs_count++]
> );
>  
>  	/* Root domain allow everything memory region */
>  	sbi_domain_memregion_init(0, ~0UL,
>  				  (SBI_DOMAIN_MEMREGION_READABLE |
>  				   SBI_DOMAIN_MEMREGION_WRITEABLE |
>  				   SBI_DOMAIN_MEMREGION_EXECUTABLE),
> -				  &root_memregs[ROOT_ALL_REGION]);
> +				  &root_memregs[root_memregs_count++]);
>  
>  	/* Root domain memory region end */
> -	root_memregs[ROOT_END_REGION].order = 0;
> +	root_memregs[root_memregs_count].order = 0;
>  
>  	/* Use platform specific root memory regions when available */
>  	memregs = sbi_platform_domains_root_regions(plat);
> -- 
> 2.25.1
> 
> 


