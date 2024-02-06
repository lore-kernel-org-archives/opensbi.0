From: Nam Cao <namcao@linutronix.de>
Date: Tue, 6 Feb 2024 11:56:47 +0100
Subject: [PATCH v3 7/7] platform: starfive: call
 starfive_jh7110_inst_init() in pm_reset_init()
In-Reply-To: <SHXPR01MB08635C8CF48CE8DA7C0353A2E647A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <cover.1706880734.git.namcao@linutronix.de>
	<5e478ee9042b05c53ff4d38a65bd5842591f960d.1706880734.git.namcao@linutronix.de>
	<SHXPR01MB08635C8CF48CE8DA7C0353A2E647A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Message-ID: <20240206115647.1d144f11@namcao>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05/Feb/2024 Minda Chen wrote:
> > 
> > The function starfive_jh7110_inst_init() initialize some power management unit
> > address and clock addresses, needed for the reset driver. It doesn't do anything
> > else, and also the reset driver doesn't work without calling this function. Thus, it
> > does not make much sense that this function is independent from
> > pm_reset_init().
> > 
> > Delete the separate call to starfive_jh7110_inst_init(), and instead just call this
> > function inside pm_reset_init().
> > 
> > Doing this also fixes another problem: if starfive_jh7110_inst_init() returns an
> > error code, it gets propagated to final_init() and OpenSBI hangs. This hang is not
> > necessary, because failures within
> > starfive_jh7110_inst_init() only mean OpenSBI cannot perform reboot or
> > shutdown, but the system can still function normally.
> > 
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> >  platform/generic/starfive/jh7110.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/platform/generic/starfive/jh7110.c
> > b/platform/generic/starfive/jh7110.c
> > index 63baddb..1577cb4 100644
> > --- a/platform/generic/starfive/jh7110.c
> > +++ b/platform/generic/starfive/jh7110.c
> > @@ -191,6 +191,8 @@ static struct sbi_system_reset_device pm_reset = {
> >  	.system_reset = pm_system_reset
> >  };
> > 
> > +static int starfive_jh7110_inst_init(void *fdt);
> > +
> >  static int pm_reset_init(void *fdt, int nodeoff,
> >  			 const struct fdt_match *match)
> >  {
> > @@ -216,6 +218,10 @@ static int pm_reset_init(void *fdt, int nodeoff,
> > 
> >  	pmic_inst.adapter = adapter;
> > 
> > +	rc = starfive_jh7110_inst_init(fdt);
> > +	if (rc)
> > +		return rc;
> > +
> >  	sbi_system_reset_add_device(&pm_reset);
> > 
> >  	return 0;
> > @@ -279,7 +285,6 @@ static int starfive_jh7110_final_init(bool cold_boot,
> > 
> >  	if (cold_boot) {
> >  		fdt_reset_driver_init(fdt, &fdt_reset_pmic);
> > -		return starfive_jh7110_inst_init(fdt);
> >  	}
> > 
> >  	return 0;
> > --
> > 2.39.2  
> 
> Test with this series patch? function is work fine.

Can I have your Tested-by tag?

Best regards,
Nam


