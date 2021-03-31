From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 31 Mar 2021 04:55:34 +0000
Subject: [PATCH 3/3] lib/utils: Support fixing up the official DT bindings
 of PLIC
In-Reply-To: <20210327050527.15955-3-bmeng.cn@gmail.com>
References: <20210327050527.15955-1-bmeng.cn@gmail.com>
 <20210327050527.15955-3-bmeng.cn@gmail.com>
Message-ID: <DM6PR04MB62019EF33857AFCB4E5CAC5B8D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Bin
> Meng
> Sent: 27 March 2021 10:35
> To: opensbi at lists.infradead.org
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Subject: [PATCH 3/3] lib/utils: Support fixing up the official DT bindings of
> PLIC
> 
> Current fdt_plic_fixup() only does necessary fix-up against the legacy
> "riscv,plic0" node. The upstream Linux kernel defines its official DT bindings
> which uses "sifive,plic-1.0.0" as the compatible string and we should check
> that first, and if not present fall back to legacy.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
> 
>  lib/utils/fdt/fdt_fixup.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c index
> a306ff5..1465500 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -57,9 +57,12 @@ void fdt_plic_fixup(void *fdt)
>  	int i, cells_count;
>  	int plic_off;
> 
> -	plic_off = fdt_node_offset_by_compatible(fdt, 0, "riscv,plic0");
> -	if (plic_off < 0)
> -		return;
> +	plic_off = fdt_node_offset_by_compatible(fdt, 0, "sifive,plic-1.0.0");
> +	if (plic_off < 0) {
> +		plic_off = fdt_node_offset_by_compatible(fdt, 0,
> "riscv,plic0");
> +		if (plic_off < 0)
> +			return;
> +	}
> 
>  	cells = (u32 *)fdt_getprop(fdt, plic_off,
>  				   "interrupts-extended", &cells_count);
> --
> 2.25.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

