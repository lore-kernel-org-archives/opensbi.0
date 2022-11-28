From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 28 Nov 2022 08:05:27 +0000
Subject: [PATCH 2/5] lib: simplify fdt_parse_plicsw_node()
In-Reply-To: <20221125140827.47018-3-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
 <20221125140827.47018-3-heinrich.schuchardt@canonical.com>
Message-ID: <Y4RrxzbdtVvmxzao@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 25, 2022 at 03:08:24PM +0100, Heinrich Schuchardt wrote:
> We should not check !plicsw_base || !size twice.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index dbd7484..57c0248 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -868,7 +868,7 @@ int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
>  
>  	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
>  				    &reg_addr, &reg_size);
> -	if (rc < 0 || !plicsw_base || !size)
> +	if (rc < 0)
>  		return SBI_ENODEV;
>  	*plicsw_base = reg_addr;
>  	*size = reg_size;
> -- 
> 2.37.2
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

