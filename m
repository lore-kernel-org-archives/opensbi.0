From: Minda Chen <minda.chen@starfivetech.com>
Date: Sun, 4 Feb 2024 01:12:27 +0000
Subject: [PATCH v3 4/7] platform: starfive: rename
 "stf,axp15060-regulator" -> "x-powers,axp15060"
In-Reply-To: <e885fedc2fb483d5349eda4170890ed7dbabe510.1706880734.git.namcao@linutronix.de>
References: <cover.1706880734.git.namcao@linutronix.de>
 <e885fedc2fb483d5349eda4170890ed7dbabe510.1706880734.git.namcao@linutronix.de>
Message-ID: <SHXPR01MB0863C62431DF20ABB8779D54E640A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> 
> OpenSBI uses the device tree compatible string "stf,axp15060-regulator"
> for the regulator node. However, the string used by U-Boot (and Linux) is
> actually "x-powers,axp15060". As OpenSBI gets the device tree from U-Boot,
> this causes the regulator device to be undetected, and OpenSBI does not use
> this device to perform board reset/shutdown.
> 
> Rename this device tree compatible string to match U-Boot (and Linux).
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  platform/generic/starfive/jh7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/platform/generic/starfive/jh7110.c
> b/platform/generic/starfive/jh7110.c
> index d3647c2..385e09c 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -224,7 +224,7 @@ static int pm_reset_init(void *fdt, int nodeoff,  }
> 
>  static const struct fdt_match pm_reset_match[] = {
> -	{ .compatible = "stf,axp15060-regulator", .data = (void *)true },
> +	{ .compatible = "x-powers,axp15060", .data = (void *)true },
>  	{ },
>  };
> 
It is OK.
But upstream u-boot jh7110 dts file do not contain this compatible?
Can you also upstream this in u-boot? or I will do this myself
> --
> 2.39.2

