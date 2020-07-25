From: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
Date: Sat, 25 Jul 2020 09:20:47 +0000
Subject: [PATCH 1/3] Use standard C string APIs in FDT helper
In-Reply-To: <CAOnJCU+aLrbKrLDpR3owSD9rx5y9NmMZ_HNaVgPatQfkfca=-A@mail.gmail.com>
References: <20200723015404.17667-1-abner.chang@hpe.com>
 <20200723015404.17667-2-abner.chang@hpe.com>
 <DM6PR04MB62013CB33346926A485E7F988D770@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CS1PR8401MB1144D601FEF91B742202E327FF770@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <CAOnJCU+aLrbKrLDpR3owSD9rx5y9NmMZ_HNaVgPatQfkfca=-A@mail.gmail.com>
Message-ID: <AT5PR8401MB1137A55FACCACB2BD64E0480FF740@AT5PR8401MB1137.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra [mailto:atishp at atishpatra.org]
> Sent: Saturday, July 25, 2020 1:21 PM
> To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
> Cc: Anup Patel <Anup.Patel@wdc.com>; opensbi at lists.infradead.org; Atish
> Patra <Atish.Patra@wdc.com>; Schaefer, Daniel (DualStudy)
> <daniel.schaefer@hpe.com>
> Subject: Re: [PATCH 1/3] Use standard C string APIs in FDT helper
> 
> On Thu, Jul 23, 2020 at 10:38 PM Chang, Abner (HPS SW/FW Technologist)
> <abner.chang@hpe.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Anup Patel [mailto:Anup.Patel at wdc.com]
> > > Sent: Friday, July 24, 2020 12:37 PM
> > > To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>;
> > > opensbi at lists.infradead.org
> > > Cc: Atish Patra <Atish.Patra@wdc.com>; Schaefer, Daniel (DualStudy)
> > > <daniel.schaefer@hpe.com>
> > > Subject: RE: [PATCH 1/3] Use standard C string APIs in FDT helper
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Abner Chang <abner.chang@hpe.com>
> > > > Sent: 23 July 2020 07:24
> > > > To: opensbi at lists.infradead.org
> > > > Cc: abner.chang at hpe.com; Atish Patra <Atish.Patra@wdc.com>; Anup
> > > Patel
> > > > <Anup.Patel@wdc.com>; Daniel Schaefer <daniel.schaefer@hpe.com>
> > > > Subject: [PATCH 1/3] Use standard C string APIs in FDT helper
> > > >
> > > > Use strncmp instead of using sbi_strcmp directly in fdthelp.c.
> > > > - This commit add implementation of sbi_strncmp.
> > > >
> > > > Signed-off-by: Abner Chang <abner.chang@hpe.com>
> > > >
> > > > Cc: Atish Patra <atish.patra@wdc.com>
> > > > Cc: Anup Patel <anup.patel@wdc.com>
> > > > Cc: Daniel Schaefer <daniel.schaefer@hpe.com>
> > > > ---
> > > >  include/sbi/sbi_string.h | 2 +-
> > > >  lib/sbi/sbi_string.c     | 4 ++--
> > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
> > > > index 338075f..5e7304f 100644
> > > > --- a/include/sbi/sbi_string.h
> > > > +++ b/include/sbi/sbi_string.h
> > > > @@ -12,7 +12,7 @@
> > > >
> > > >  #include <sbi/sbi_types.h>
> > > >
> > > > -int sbi_strcmp(const char *a, const char *b);
> > > > +int sbi_strncmp(const char *a, const char *b, size_t count);
> > > >
> > > >  size_t sbi_strlen(const char *str);
> > > >
> > > > diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c index
> > > > 38b700b..c29120a
> > > > 100644
> > > > --- a/lib/sbi/sbi_string.c
> > > > +++ b/lib/sbi/sbi_string.c
> > > > @@ -14,10 +14,10 @@
> > > >
> > > >  #include <sbi/sbi_string.h>
> > > >
> > > > -int sbi_strcmp(const char *a, const char *b)
> > > > +int sbi_strncmp(const char *a, const char *b, size_t count)
> > > >  {
> > > >     /* search first diff or end of string */
> > > > -   for (; *a == *b && *a != '\0'; a++, b++)
> > > > +   for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
> > > >             ;
> > > >
> > > >     return *a - *b;
> > > > --
> > > > 2.25.0
> > >
> > > I think we should keep both sbi_strcmp() and sbi_strncmp().
> > Hi Anup, do you think we should prevent people to use sbi_strcmp()?
> >
> The only reason we may want to keep the sbi_strcmp() just for
> completeness sake.
> In case, some of the libfdt functions use it in some revision.
> 
> If we decide to keep it, we should put a big comment on top sbi_strcmp
> clearly mentioning that it is not recommended to use sbi_strcmp at all.

Understand. I will keep it and resend the patch.
Thanks

> 
> > Thanks
> > Abner
> > >
> > > Otherwise looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > >
> > > Regards,
> > > Anup
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> 
> --
> Regards,
> Atish
