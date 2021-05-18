From: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
Date: Tue, 18 May 2021 00:36:24 +0000
Subject: [PATCH v1 2/3] lib: fdt: Don't use sbi_string functions
In-Reply-To: <1000a99faae4bc0d72d67a4ff06501bc52ce669f.camel@126.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
 <20210517113319.25855-3-daniel.schaefer@hpe.com>
 <1000a99faae4bc0d72d67a4ff06501bc52ce669f.camel@126.com>
Message-ID: <CS1PR8401MB1144559EFCB1A5FCC4E3BDFBFF2C9@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After addressing Xiang's comment.

Reviewed-by: Abner Chang <abner.chang@hpe.com>

> -----Original Message-----
> From: Xiang W [mailto:wxjstz at 126.com]
> Sent: Monday, May 17, 2021 9:54 PM
> To: Schaefer, Daniel <daniel.schaefer@hpe.com>; opensbi at lists.infradead.org
> Cc: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>; Anup
> Patel <Anup.Patel@wdc.com>
> Subject: Re: [PATCH v1 2/3] lib: fdt: Don't use sbi_string functions
> 
> ? 2021-05-17?? 19:33 +0800?Daniel Schaefer???
> > When SBI is built by external firmware, we need to use their
> > functions,
> > defined in libfdt_env.h.
> > Just like 2cfd2fc9048806353298a1b967abf985901e36e8
> >
> > Cc: Abner Chang <abner.chang@hpe.com>
> > Cc: Anup Patel <Anup.Patel@wdc.com>
> > Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> Look good to me.
> 
> but lost sbi_memcpy in line 340.
> 
> Regards
> Xiang W
> > ---
> >  lib/utils/fdt/fdt_domain.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> > index 95c195d65238..c1f6a8c8a10b 100644
> > --- a/lib/utils/fdt/fdt_domain.c
> > +++ b/lib/utils/fdt/fdt_domain.c
> > @@ -9,6 +9,7 @@
> >   */
> >
> >  #include <libfdt.h>
> > +#include <libfdt_env.h>
> >  #include <sbi/sbi_domain.h>
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_hartmask.h>
> > @@ -95,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt,
> > int doff, void *p)
> >  {
> >  	struct __fixup_find_domain_offset_info *fdo = p;
> >
> > -	if (!sbi_strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> > +	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> >  		*fdo->doffset = doff;
> >
> >  	return 0;
> > @@ -287,7 +288,7 @@ static int __fdt_parse_domain(void *fdt, int
> > domain_offset, void *opaque)
> >  	regions = &fdt_regions[fdt_domains_count][0];
> >
> >  	/* Read DT node name */
> > -	sbi_strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
> > +	strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
> >  		    sizeof(dom->name));
> >  	dom->name[sizeof(dom->name) - 1] = '\0';
> >
> > @@ -313,7 +314,7 @@ static int __fdt_parse_domain(void *fdt, int
> > domain_offset, void *opaque)
> >
> >  	/* Setup memregions from DT */
> >  	val32 = 0;
> > -	sbi_memset(regions, 0,
> > +	memset(regions, 0,
> >  		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT +
> > 1));
> >  	dom->regions = regions;
> >  	err = fdt_iterate_each_memregion(fdt, domain_offset, &val32,
> > --
> > 2.30.1
> >
> >

