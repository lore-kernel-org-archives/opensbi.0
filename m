From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 19 May 2021 12:54:38 +0000
Subject: [PATCH v2 2/3] lib: fdt: Don't use sbi_string functions
In-Reply-To: <CO6PR04MB78129E962CC2DA2DCE78E7E28D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <20210519075410.8520-1-daniel.schaefer@hpe.com>
 <20210519075410.8520-3-daniel.schaefer@hpe.com>
 <8e1212688524fa1af03b4897a8126415531ff1ad.camel@126.com>
 <CO6PR04MB78129E962CC2DA2DCE78E7E28D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
Message-ID: <CO6PR04MB78122708BD281D464910BA7E8D2B9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 19 May 2021 18:22
> To: 'Xiang W' <wxjstz@126.com>; Daniel Schaefer
> <daniel.schaefer@hpe.com>; opensbi at lists.infradead.org
> Cc: Abner Chang <abner.chang@hpe.com>
> Subject: RE: [PATCH v2 2/3] lib: fdt: Don't use sbi_string functions
> 
> 
> 
> > -----Original Message-----
> > From: Xiang W <wxjstz@126.com>
> > Sent: 19 May 2021 14:09
> > To: Daniel Schaefer <daniel.schaefer@hpe.com>;
> > opensbi at lists.infradead.org
> > Cc: Abner Chang <abner.chang@hpe.com>; Anup Patel
> <Anup.Patel@wdc.com>
> > Subject: Re: [PATCH v2 2/3] lib: fdt: Don't use sbi_string functions
> >
> > ? 2021-05-19?? 15:54 +0800?Daniel Schaefer???
> > > When SBI is built by external firmware, we need to use their
> > > functions, defined in libfdt_env.h.
> > > Just like 2cfd2fc9048806353298a1b967abf985901e36e8
> > >
> > > Cc: Abner Chang <abner.chang@hpe.com>
> > > Cc: Anup Patel <Anup.Patel@wdc.com>
> > > Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> > > Reviewed-by: Abner Chang <abner.chang@hpe.com>
> >
> > Reviewed-by: Xiang W <wxjstz@126.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Forgot to mention that I have applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> 
> Regards,
> Anup
> 
> >
> > > ---
> > >  lib/utils/fdt/fdt_domain.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> > > index 95c195d65238..fc8ad423eb88 100644
> > > --- a/lib/utils/fdt/fdt_domain.c
> > > +++ b/lib/utils/fdt/fdt_domain.c
> > > @@ -9,6 +9,7 @@
> > >   */
> > >
> > >  #include <libfdt.h>
> > > +#include <libfdt_env.h>
> > >  #include <sbi/sbi_domain.h>
> > >  #include <sbi/sbi_error.h>
> > >  #include <sbi/sbi_hartmask.h>
> > > @@ -95,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt,
> > > int doff, void *p)  {
> > >  	struct __fixup_find_domain_offset_info *fdo = p;
> > >
> > > -	if (!sbi_strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> > > +	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> > >  		*fdo->doffset = doff;
> > >
> > >  	return 0;
> > > @@ -287,7 +288,7 @@ static int __fdt_parse_domain(void *fdt, int
> > > domain_offset, void *opaque)
> > >  	regions = &fdt_regions[fdt_domains_count][0];
> > >
> > >  	/* Read DT node name */
> > > -	sbi_strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
> > > +	strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
> > >  		    sizeof(dom->name));
> > >  	dom->name[sizeof(dom->name) - 1] = '\0';
> > >
> > > @@ -313,7 +314,7 @@ static int __fdt_parse_domain(void *fdt, int
> > > domain_offset, void *opaque)
> > >
> > >  	/* Setup memregions from DT */
> > >  	val32 = 0;
> > > -	sbi_memset(regions, 0,
> > > +	memset(regions, 0,
> > >  		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT +
> > 1));
> > >  	dom->regions = regions;
> > >  	err = fdt_iterate_each_memregion(fdt, domain_offset, &val32, @@
> > > -337,7 +338,7 @@ static int __fdt_parse_domain(void *fdt, int
> > > domain_offset, void *opaque)
> > >  			continue;
> > >  		if (FDT_DOMAIN_REGION_MAX_COUNT <= val32)
> > >  			return SBI_EINVAL;
> > > -		sbi_memcpy(&regions[val32++], reg, sizeof(*reg));
> > > +		memcpy(&regions[val32++], reg, sizeof(*reg));
> > >  	}
> > >
> > >  	/* Read "boot-hart" DT property */
> > > --
> > > 2.30.1
> > >
> > >

