From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 28 Nov 2022 07:50:22 +0000
Subject: [PATCH 1/5] lib: simplify fdt_parse_plmt_node()
In-Reply-To: <20221125140827.47018-2-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
 <20221125140827.47018-2-heinrich.schuchardt@canonical.com>
Message-ID: <Y4RoPh9nle+sLOmY@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 25, 2022 at 03:08:23PM +0100, Heinrich Schuchardt wrote:
> We should not check !plmt_base || !plmt_size twice.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

> ---
>  lib/utils/fdt/fdt_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 89b8bba..dbd7484 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -814,7 +814,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
>  
>  	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
>  				    &reg_addr, &reg_size);
> -	if (rc < 0 || !plmt_base || !plmt_size)
> +	if (rc < 0)
>  		return SBI_ENODEV;
>  	*plmt_base = reg_addr;
>  	*plmt_size = reg_size;
> -- 
> 2.37.2

