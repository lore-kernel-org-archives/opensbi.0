From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Dec 2022 01:02:02 +0800
Subject: [PATCH 3/3] lib: fix irqchip_plic_update_hartid_table
In-Reply-To: <20221207140751.9135-4-heinrich.schuchardt@canonical.com>
References: <20221207140751.9135-1-heinrich.schuchardt@canonical.com>
	 <20221207140751.9135-4-heinrich.schuchardt@canonical.com>
Message-ID: <ac369b610b6b2d385ee31efb84b2a5dc087a7beb.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-12-07???? 15:07 +0100?Heinrich Schuchardt???
> After determining cpu_offset we have to check this value.
> 
> Addresses-Coverity-ID: 1529706 ("Logically dead code")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/utils/irqchip/fdt_irqchip_plic.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index a6e185c..fe08836 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -86,7 +86,7 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
> ????????????????????????continue;
> ?
> ????????????????cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
> -???????????????if (cpu_intc_offset < 0)
> +???????????????if (cpu_offset < 0)
> ????????????????????????continue;
> ?
> ????????????????err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
> -- 
> 2.37.2
> 
> 



