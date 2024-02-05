From: Nam Cao <namcao@linutronix.de>
Date: Mon, 5 Feb 2024 09:31:22 +0100
Subject: [PATCH v3 4/7] platform: starfive: rename
 "stf,axp15060-regulator" -> "x-powers,axp15060"
In-Reply-To: <SHXPR01MB0863C62431DF20ABB8779D54E640A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <cover.1706880734.git.namcao@linutronix.de>
	<e885fedc2fb483d5349eda4170890ed7dbabe510.1706880734.git.namcao@linutronix.de>
	<SHXPR01MB0863C62431DF20ABB8779D54E640A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Message-ID: <20240205093122.36c34f4a@namcao>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04/Feb/2024 Minda Chen wrote:
> > 
> > OpenSBI uses the device tree compatible string "stf,axp15060-regulator"
> > for the regulator node. However, the string used by U-Boot (and Linux) is
> > actually "x-powers,axp15060". As OpenSBI gets the device tree from U-Boot,
> > this causes the regulator device to be undetected, and OpenSBI does not use
> > this device to perform board reset/shutdown.
> > 
> > Rename this device tree compatible string to match U-Boot (and Linux).
> > 
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> >  platform/generic/starfive/jh7110.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/platform/generic/starfive/jh7110.c
> > b/platform/generic/starfive/jh7110.c
> > index d3647c2..385e09c 100644
> > --- a/platform/generic/starfive/jh7110.c
> > +++ b/platform/generic/starfive/jh7110.c
> > @@ -224,7 +224,7 @@ static int pm_reset_init(void *fdt, int nodeoff,  }
> > 
> >  static const struct fdt_match pm_reset_match[] = {
> > -	{ .compatible = "stf,axp15060-regulator", .data = (void *)true },
> > +	{ .compatible = "x-powers,axp15060", .data = (void *)true },
> >  	{ },
> >  };
> >   
> It is OK.
> But upstream u-boot jh7110 dts file do not contain this compatible?
> Can you also upstream this in u-boot? or I will do this myself

It is in upstream U-Boot, just a few days ago:
https://source.denx.de/u-boot/u-boot/-/commit/6882255ac3107c58e1153311df8a8270087f8cb3

Best regards,
Nam


