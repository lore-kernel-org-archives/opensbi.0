From: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
Date: Tue, 18 May 2021 00:34:27 +0000
Subject: [PATCH v1 3/3] lib: utils: Replace strcmp with strcmp
In-Reply-To: <923244c5798fb3d9f5b66b83ec273103ce75e791.camel@126.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
 <20210517113319.25855-4-daniel.schaefer@hpe.com>
 <923244c5798fb3d9f5b66b83ec273103ce75e791.camel@126.com>
Message-ID: <CS1PR8401MB1144E2D03274FE5303E177D8FF2C9@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Abner Chang <abner.chang@hpe.com>

> -----Original Message-----
> From: Xiang W [mailto:wxjstz at 126.com]
> Sent: Monday, May 17, 2021 9:58 PM
> To: Schaefer, Daniel <daniel.schaefer@hpe.com>; opensbi at lists.infradead.org
> Cc: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>; Anup
> Patel <Anup.Patel@wdc.com>
> Subject: Re: [PATCH v1 3/3] lib: utils: Replace strcmp with strcmp
> 
> ? 2021-05-17?? 19:33 +0800?Daniel Schaefer???
> > Cc: Abner Chang <abner.chang@hpe.com>
> > Cc: Anup Patel <Anup.Patel@wdc.com>
> > Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
> Look good to me.
> 
> Reviewed-by: Xiang W <wxjstz@126.com>
> > ---
> >  lib/utils/fdt/fdt_domain.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> > index c1f6a8c8a10b..a9ebbdca3c52 100644
> > --- a/lib/utils/fdt/fdt_domain.c
> > +++ b/lib/utils/fdt/fdt_domain.c
> > @@ -96,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt,
> > int doff, void *p)
> >  {
> >  	struct __fixup_find_domain_offset_info *fdo = p;
> >
> > -	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
> > +	if (!strncmp(fdo->name, fdt_get_name(fdt, doff, NULL),
> > strlen(fdo->name)))
> >  		*fdo->doffset = doff;
> >
> >  	return 0;
> > --
> > 2.30.1
> >
> >

