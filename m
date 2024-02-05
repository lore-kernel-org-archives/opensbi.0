From: Nam Cao <namcao@linutronix.de>
Date: Mon, 5 Feb 2024 10:00:04 +0100
Subject: =?UTF-8?B?5Zue5aSNOg==?= [PATCH v3 5/7] platform: starfive:
 drop "compatible" from struct pmic
In-Reply-To: <SHXPR01MB08637BB7F20B80AC504FF34FE647A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <cover.1706880734.git.namcao@linutronix.de>
	<ab05513e09ddbef539fedd7e9da7a1cecf526971.1706880734.git.namcao@linutronix.de>
	<SHXPR01MB08637BB7F20B80AC504FF34FE647A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Message-ID: <20240205100004.737f5b64@namcao>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05/Feb/2024 Minda Chen wrote:
> > The member "compatible" of struct pmic is not used. Delete it.
> > 
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> >  platform/generic/starfive/jh7110.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/platform/generic/starfive/jh7110.c
> > b/platform/generic/starfive/jh7110.c
> > index 385e09c..f64e016 100644
> > --- a/platform/generic/starfive/jh7110.c
> > +++ b/platform/generic/starfive/jh7110.c
> > @@ -23,7 +23,6 @@
> >  struct pmic {
> >  	struct i2c_adapter *adapter;
> >  	u32 dev_addr;
> > -	const char *compatible;
> >  };
> > 
> >  struct jh7110 {
> > @@ -205,7 +204,6 @@ static int pm_reset_init(void *fdt, int nodeoff,
> >  		return rc;
> > 
> >  	pmic_inst.dev_addr = addr;
> > -	pmic_inst.compatible = match->compatible;
> > 
> >  	i2c_bus = fdt_parent_offset(fdt, nodeoff);
> >  	if (i2c_bus < 0)
> > --
> > 2.39.2  
> Maybe this patch can be squash to 3rd patch. It is my sugguestion.

Makes sense. Unfortunately I just sent a v4 a few seconds before this. I
think it's not too important, so I don't really want to send a new series
just for this.

If okay with you, I will wait and see if there are any other comments. If
v5 is needed, I will squash them then.

Best regards,
Nam


