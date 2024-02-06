From: Minda Chen <minda.chen@starfivetech.com>
Date: Tue, 6 Feb 2024 09:34:24 +0000
Subject: [PATCH v4 1/7] platform: starfive: correct system clock device
 tree node
In-Reply-To: <063d675dcf59e79892091b0ef085a6a2ca4f6bee.1707122766.git.namcao@linutronix.de>
References: <cover.1707122766.git.namcao@linutronix.de>
 <063d675dcf59e79892091b0ef085a6a2ca4f6bee.1707122766.git.namcao@linutronix.de>
Message-ID: <SHXPR01MB0863A03F132BD5ECE044572FE646A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> Starfive names the system clock device tree node "starfive,jh7110-clkgen"
> in all their git repositories. However, a different name is used in upstream
> U-Boot (and also Linux): "starfive,jh7110-syscrg". Since OpenSBI gets the device
> tree from U-Boot, this inconsistency leads the problem that OpenSBI doesn't
> know the system clock device exists.
> 
> Correct this name to keep the consistency.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  platform/generic/starfive/jh7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/platform/generic/starfive/jh7110.c
> b/platform/generic/starfive/jh7110.c
> index dcd6306..4b22175 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -252,7 +252,7 @@ static int starfive_jh7110_inst_init(void *fdt)
>  		jh7110_inst.pmu_reg_base = addr;
>  	}
> 
> -	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-clkgen");
> +	noff = fdt_node_offset_by_compatible(fdt, -1,
> +"starfive,jh7110-syscrg");
>  	if (-1 < noff) {
>  		rc = fdt_get_node_addr_size(fdt, noff, 0, &addr, NULL);
>  		if (rc)
> --
> 2.39.2
The clock compatible is the same with upstream uboot and linux
Acked-by: Minda Chen <minda.chen@starfivetech.com>

