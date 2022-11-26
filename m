From: Xiang W <wxjstz@126.com>
Date: Sat, 26 Nov 2022 20:54:54 +0800
Subject: [PATCH 2/5] lib: simplify fdt_parse_plicsw_node()
In-Reply-To: <20221125140827.47018-3-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
	 <20221125140827.47018-3-heinrich.schuchardt@canonical.com>
Message-ID: <0f2d09d80f80ef296edd6be11a7f2c5c6d865200.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-25???? 15:08 +0100?Heinrich Schuchardt???
> We should not check !plicsw_base || !size twice.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Look good to me

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/utils/fdt/fdt_helper.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index dbd7484..57c0248 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -868,7 +868,7 @@ int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
> ?
> ????????rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> ??????????????????????????????????? &reg_addr, &reg_size);
> -???????if (rc < 0 || !plicsw_base || !size)
> +???????if (rc < 0)
> ????????????????return SBI_ENODEV;
> ????????*plicsw_base = reg_addr;
> ????????*size = reg_size;
> -- 
> 2.37.2
> 
> 



