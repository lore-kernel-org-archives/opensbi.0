From: Xiang W <wxjstz@126.com>
Date: Sat, 26 Nov 2022 20:54:37 +0800
Subject: [PATCH 1/5] lib: simplify fdt_parse_plmt_node()
In-Reply-To: <20221125140827.47018-2-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
	 <20221125140827.47018-2-heinrich.schuchardt@canonical.com>
Message-ID: <8b7f158aee9ba2dcbd8751e8bd403cd82c804607.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-25???? 15:08 +0100?Heinrich Schuchardt???
> We should not check !plmt_base || !plmt_size twice.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Look good to me

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/utils/fdt/fdt_helper.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 89b8bba..dbd7484 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -814,7 +814,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
> ?
> ????????rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> ??????????????????????????????????? &reg_addr, &reg_size);
> -???????if (rc < 0 || !plmt_base || !plmt_size)
> +???????if (rc < 0)
> ????????????????return SBI_ENODEV;
> ????????*plmt_base = reg_addr;
> ????????*plmt_size = reg_size;
> -- 
> 2.37.2
> 
> 



