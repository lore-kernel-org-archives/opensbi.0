From: WeiLiang Lim <weiliang.lim@starfivetech.com>
Date: Thu, 22 Dec 2022 10:49:43 +0000
Subject: [PATCH v5 1/4] lib: sbi: Allow platform to influence cold boot
 HART selection
In-Reply-To: <CAEUhbmVhBo=3hDqFXcbyEs-TpRLQhHAjpiL5hrpO2RYKXA+BCw@mail.gmail.com>
References: <20221222084444.224301-1-weiliang.lim@starfivetech.com>
 <20221222084444.224301-2-weiliang.lim@starfivetech.com>
 <CAEUhbmVhBo=3hDqFXcbyEs-TpRLQhHAjpiL5hrpO2RYKXA+BCw@mail.gmail.com>
Message-ID: <d9655dc839054d54a6db2a625b966192@EXMBX163.cuchost.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: Thursday, December 22, 2022 5:22 PM
> To: WeiLiang Lim <weiliang.lim@starfivetech.com>
> Cc: opensbi at lists.infradead.org; apatel at ventanamicro.com; Cheehong Ang
> <cheehong.ang@starfivetech.com>; JunLiang Tan
> <junliang.tan@starfivetech.com>
> Subject: Re: [PATCH v5 1/4] lib: sbi: Allow platform to influence cold boot
> HART selection
> 
> On Thu, Dec 22, 2022 at 4:48 PM Wei Liang Lim
> <weiliang.lim@starfivetech.com> wrote:
> >
> > From: Anup Patel <apatel@ventanamicro.com>
> >
> > We add an optional cold_boot_allowed() platform callback which allows
> > platform support to decide which HARTs can do cold boot initialization.
> >
> > If this platform callback is not available then any HART can do cold
> > boot initialization.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_platform.h | 20 ++++++++++++++++++++
> >  lib/sbi/sbi_init.c         |  7 +++++--
> >  2 files changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 722f27a..566eee3 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -65,6 +65,9 @@ enum sbi_platform_features {
> >
> >  /** Platform functions */
> >  struct sbi_platform_operations {
> > +       /* Check if specified HART is allowed to do cold boot */
> > +       bool (*cold_boot_allowed)(u32 hartid);
> > +
> >         /* Platform nascent initialization */
> >         int (*nascent_init)(void);
> >
> > @@ -356,6 +359,23 @@ static inline bool sbi_platform_hart_invalid(const
> struct sbi_platform *plat,
> >         return FALSE;
> >  }
> >
> > +/**
> > + * Check whether given HART is allowed to do cold boot
> > + *
> > + * @param plat pointer to struct sbi_platform
> > + * @param hartid HART ID
> > + *
> > + * @return TRUE if HART is allowed to do cold boot and FALSE
> > +otherwise
> 
> Previous comments were not addressed.
> 
> s/TRUE/true/g
> s/FALSE/false/g

Should this changes applied to this patch alone or all the patches?

> 
> Please also include a changelog when you send a new version.
> 
> The tags (RB, TB, etc) should be carried forward if there are no significant
> changes.
> 
> > + */
> > +static inline bool sbi_platform_cold_boot_allowed(
> > +                                       const struct sbi_platform *plat,
> > +                                       u32 hartid) {
> > +       if (plat && sbi_platform_ops(plat)->cold_boot_allowed)
> > +               return sbi_platform_ops(plat)->cold_boot_allowed(hartid);
> > +       return TRUE;
> > +}
> > +
> >  /**
> >   * Nascent (very early) initialization for current HART
> >   *
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> > a8500e5..d4902d9 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -498,8 +498,11 @@ void __noreturn sbi_init(struct sbi_scratch
> *scratch)
> >          * HARTs which satisfy above condition.
> >          */
> >
> > -       if (next_mode_supported && atomic_xchg(&coldboot_lottery, 1) == 0)
> > -               coldboot = TRUE;
> > +       if (sbi_platform_cold_boot_allowed(plat, hartid)) {
> > +               if (next_mode_supported &&
> > +                   atomic_xchg(&coldboot_lottery, 1) == 0)
> > +                       coldboot = TRUE;
> > +       }
> >
> >         /*
> >          * Do platform specific nascent (very early) initialization so
> > --
> 
> Regards,
> Bin
