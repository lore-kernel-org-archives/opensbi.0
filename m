From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 16 Oct 2020 03:52:57 +0000
Subject: [PATCH 1/2] lib: utils: Implement "ranges" property parsing
In-Reply-To: <20201016002447.4148184-1-atish.patra@wdc.com>
References: <20201016002447.4148184-1-atish.patra@wdc.com>
Message-ID: <DM6PR04MB6201544B0327FF0D6FE87DA48D030@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 16 October 2020 05:55
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> Subject: [PATCH 1/2] lib: utils: Implement "ranges" property parsing
> 
> The "reg" property in a device node may not be the correct address always.
> If a parent node defines a "ranges" property, the child address need to be
> translated with respect to parents address. If the ranges property is not
> present, it will just use 1:1 translation.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c index
> aec73a0598d7..8e1d1800d4de 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -74,10 +74,10 @@ int fdt_find_match(void *fdt, int startoff,  int
> fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
>  			   unsigned long *size)
>  {
> -	int parent, len, i;
> +	int parent, len, i, rlen;
>  	int cell_addr, cell_size;
> -	const fdt32_t *prop_addr, *prop_size;
> -	uint64_t temp = 0;
> +	const fdt32_t *prop_addr, *prop_size, *ranges;
> +	uint64_t temp = 0, offset = 0, caddr = 0, paddr = 0, rsize = 0;
> 
>  	parent = fdt_parent_offset(fdt, node);
>  	if (parent < 0)
> @@ -98,7 +98,24 @@ int fdt_get_node_addr_size(void *fdt, int node,
> unsigned long *addr,
>  	if (addr) {
>  		for (i = 0; i < cell_addr; i++)
>  			temp = (temp << 32) | fdt32_to_cpu(*prop_addr++);
> -		*addr = temp;
> +		ranges = fdt_getprop(fdt, parent, "ranges", &rlen);

We can have multiple "ranges" property in the ancestry of a node.

Please update this logic accordingly. You might need a separate
static recursive function to do the translation based on "ranges".

> +		if (ranges && rlen > 0) {
> +			for (i = 0; i < cell_addr; i++)
> +				caddr = (caddr << 32) |
> fdt32_to_cpu(*ranges++);
> +			for (i = 0; i < cell_addr; i++)
> +				paddr = (paddr << 32) |
> fdt32_to_cpu(*ranges++);
> +			for (i = 0; i < cell_size; i++)
> +				rsize = (rsize << 32) |
> fdt32_to_cpu(*ranges++);
> +			if (temp < caddr || caddr >= (temp + rsize )) {
> +				sbi_dprintf("invalid address translation reg
> [%lx] : ca [%lx]\n",temp, caddr);
> +				return SBI_ENODEV;
> +			}
> +			offset = temp - caddr;
> +			*addr = paddr + offset;
> +		} else {
> +			/* No translation required */
> +			*addr = temp;
> +		}
>  	}
>  	temp = 0;
> 
> --
> 2.25.1

Regards,
Anup


