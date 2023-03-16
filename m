From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 16 Mar 2023 19:03:56 +0530
Subject: [PATCH v2] lib: sbi: Fix how to check whether the domain
 contains fw_region
In-Reply-To: <20230316121111.122741-1-wxjstz@126.com>
References: <20230316121111.122741-1-wxjstz@126.com>
Message-ID: <ZBMaxFaz2j2x0SbG@xubuntu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 16, 2023 at 08:11:11PM +0800, Xiang W wrote:
> Because firmware is split into rw/rx segments, it cannot be recorded
> by a root_fw_region. This problem is solved by adding a flag
> fw_region_inited to sbi_domain.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

> ---
> v2 changes: Remove unused have_fw_reg
> 
>  include/sbi/sbi_domain.h   |  2 ++
>  lib/sbi/sbi_domain.c       | 28 +++++++---------------------
>  lib/utils/fdt/fdt_domain.c |  1 +
>  3 files changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index eaca7f0..124ea90 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -122,6 +122,8 @@ struct sbi_domain {
>  	bool system_reset_allowed;
>  	/** Is domain allowed to suspend the system */
>  	bool system_suspend_allowed;
> +	/** Identifies whether to include the firmware region */
> +	bool fw_region_inited;
>  };
>  
>  /** The root domain instance */
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4d7b80a..d6e9ff6 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -30,7 +30,6 @@ static struct sbi_hartmask root_hmask = { 0 };
>  
>  #define ROOT_REGION_MAX	16
>  static u32 root_memregs_count = 0;
> -static struct sbi_domain_memregion root_fw_region;
>  static struct sbi_domain_memregion root_memregs[ROOT_REGION_MAX + 1] = { 0 };
>  
>  struct sbi_domain root = {
> @@ -39,6 +38,7 @@ struct sbi_domain root = {
>  	.regions = root_memregs,
>  	.system_reset_allowed = true,
>  	.system_suspend_allowed = true,
> +	.fw_region_inited = false,
>  };
>  
>  bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
> @@ -69,14 +69,6 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
>  	return ret;
>  }
>  
> -static void domain_memregion_initfw(struct sbi_domain_memregion *reg)
> -{
> -	if (!reg)
> -		return;
> -
> -	sbi_memcpy(reg, &root_fw_region, sizeof(*reg));
> -}
> -
>  void sbi_domain_memregion_init(unsigned long addr,
>  				unsigned long size,
>  				unsigned long flags,
> @@ -255,7 +247,6 @@ static int sanitize_domain(const struct sbi_platform *plat,
>  			   struct sbi_domain *dom)
>  {
>  	u32 i, j, count;
> -	bool have_fw_reg;
>  	struct sbi_domain_memregion treg, *reg, *reg1;
>  
>  	/* Check possible HARTs */
> @@ -288,17 +279,11 @@ static int sanitize_domain(const struct sbi_platform *plat,
>  		}
>  	}
>  
> -	/* Count memory regions and check presence of firmware region */
> +	/* Count memory regions */
>  	count = 0;
> -	have_fw_reg = false;
> -	sbi_domain_for_each_memregion(dom, reg) {
> -		if (reg->order == root_fw_region.order &&
> -		    reg->base == root_fw_region.base &&
> -		    reg->flags == root_fw_region.flags)
> -			have_fw_reg = true;
> +	sbi_domain_for_each_memregion(dom, reg)
>  		count++;
> -	}
> -	if (!have_fw_reg) {
> +	if (!dom->fw_region_inited) {
>  		sbi_printf("%s: %s does not have firmware region\n",
>  			   __func__, dom->name);
>  		return SBI_EINVAL;
> @@ -732,8 +717,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>  	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
>  				  (SBI_DOMAIN_MEMREGION_M_READABLE |
>  				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
> -				  &root_fw_region);
> -	domain_memregion_initfw(&root_memregs[root_memregs_count++]);
> +				  &root_memregs[root_memregs_count++]);
>  
>  	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
>  				  (scratch->fw_size - scratch->fw_rw_offset),
> @@ -741,6 +725,8 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>  				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
>  				  &root_memregs[root_memregs_count++]);
>  
> +	root.fw_region_inited = true;
> +
>  	/* Root domain allow everything memory region */
>  	sbi_domain_memregion_init(0, ~0UL,
>  				  (SBI_DOMAIN_MEMREGION_READABLE |
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index adcb94b..bb6d17d 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -358,6 +358,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
>  			return SBI_EINVAL;
>  		memcpy(&regions[val32++], reg, sizeof(*reg));
>  	}
> +	dom->fw_region_inited = root.fw_region_inited;
>  
>  	/* Read "boot-hart" DT property */
>  	val32 = -1U;
> -- 
> 2.39.2
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

