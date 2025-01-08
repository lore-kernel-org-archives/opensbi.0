From: Xiang W <wxjstz@126.com>
Date: Wed, 08 Jan 2025 10:25:38 +0800
Subject: [PATCH] lib: utils: Make the enforce permission bit
 configurable from DT
In-Reply-To: <20250107024314.28611-1-duchao@eswincomputing.com>
References: <20250107024314.28611-1-duchao@eswincomputing.com>
Message-ID: <5800798b82d700d7eead20b48e37e8836306cbf1.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-01-07?? 02:43 +0000?Chao Du???
> The domain_support.md documentation states that the enforce permission
> bit (BIT[6]) could be set in the "regions" property of a domain
> instance DT node. However, this bit is masked in the current
> implementation. This patch unmasks the bit to make it configurable
> from DT.
> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/utils/fdt/fdt_domain.c | 4 +++-
> ?1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 4bc7ed8..d7efc56 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -289,8 +289,10 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
> ?		return SBI_EINVAL;
> ?	order = val32;
> ?
> +	flags = region_access & (SBI_DOMAIN_MEMREGION_ACCESS_MASK
> +				| SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS);
> +
> ?	/* Read "mmio" DT property */
> -	flags = region_access & SBI_DOMAIN_MEMREGION_ACCESS_MASK;
> ?	if (fdt_get_property(fdt, region_offset, "mmio", NULL))
> ?		flags |= SBI_DOMAIN_MEMREGION_MMIO;
> ?
> -- 
> 2.34.1
> 
> 


