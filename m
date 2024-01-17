From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 19:32:06 +0800
Subject: [PATCH 1/2] platform: starfive: correct system clock device
 tree node
In-Reply-To: <088ccae83cf0165d1390627d7e2e782d74941e62.1705490088.git.namcao@linutronix.de>
References: <088ccae83cf0165d1390627d7e2e782d74941e62.1705490088.git.namcao@linutronix.de>
Message-ID: <a0d913ba9ad4283ef2873f08e7bb379c45642306.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-17???? 12:16 +0100?Nam Cao???
> Starfive names the system clock device tree node "starfive,jh7110-clkgen"
> in all their git repositories. However, a different name is used in
> upstream U-Boot (and also Linux): "starfive,jh7110-syscrg". Since
> OpenSBI gets the device tree from U-Boot, this inconsistency leads the
> problem that OpenSBI doesn't know the system clock device exists.
> 
> Correct this name to keep the consistency.
This sounds like a problem of u-boot. Directly replacing compatible strings is 
not a good way. It is best to try another compatible string after the search
fails.

Regards,
Xiang W
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> ?platform/generic/starfive/jh7110.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
> index dcd6306..4b22175 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -252,7 +252,7 @@ static int starfive_jh7110_inst_init(void *fdt)
> ?		jh7110_inst.pmu_reg_base = addr;
> ?	}
> ?
> -	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-clkgen");
> +	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-syscrg");
> ?	if (-1 < noff) {
> ?		rc = fdt_get_node_addr_size(fdt, noff, 0, &addr, NULL);
> ?		if (rc)
> -- 
> 2.39.2
> 
> 


