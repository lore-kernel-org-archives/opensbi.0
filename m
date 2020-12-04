From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Dec 2020 18:05:05 +0530
Subject: [PATCH 08/11] include: sbi: Add domains_init() platform operation
In-Reply-To: <CAOnJCULYwOMJ_L14NocsSVL7KfPVht1dP_DisazHH2wShDHsUg@mail.gmail.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
 <20201121094756.4154728-9-anup.patel@wdc.com>
 <CAOnJCULYwOMJ_L14NocsSVL7KfPVht1dP_DisazHH2wShDHsUg@mail.gmail.com>
Message-ID: <CAAhSdy2Muuj_zSS2knC5Xmwjyfcaymf73KNA5DQWc062nkMFeQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 4, 2020 at 11:57 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Nov 21, 2020 at 2:53 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We introduce domains_init() platform operation which can be used by
> > platform support to initialize/populate domains in the coldboot path.
> >
> > The domains_init() is called late in the coldboot sequence from the
> > sbi_domain_finalize() so sbi_printf() can be used by platform support
> > to print errors/warings at time of populating domains.
> >
>
> /s/warings/warnings

Okay, will update.

>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_platform.h | 16 ++++++++++++++++
> >  lib/sbi/sbi_domain.c       |  8 ++++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index e1355d8..7a8c113 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -90,6 +90,8 @@ struct sbi_platform_operations {
> >          */
> >         int (*misa_get_xlen)(void);
> >
> > +       /** Initialize (or populate) domains for the platform */
> > +       int (*domains_init)(void);
> >         /** Get domain pointer for given HART id */
> >         struct sbi_domain *(*domain_get)(u32 hartid);
> >
> > @@ -451,6 +453,20 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
> >         return -1;
> >  }
> >
> > +/**
> > + * Initialize (or populate) domains for the platform
> > + *
> > + * @param plat pointer to struct sbi_platform
> > + *
> > + * @return 0 on success and negative error code on failure
> > + */
> > +static inline int sbi_platform_domains_init(const struct sbi_platform *plat)
> > +{
> > +       if (plat && sbi_platform_ops(plat)->domains_init)
> > +               return sbi_platform_ops(plat)->domains_init();
> > +       return 0;
> > +}
> > +
> >  /**
> >   * Get domain pointer for given HART
> >   *
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> > index 639e016..1a3651b 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -375,6 +375,14 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
> >         struct sbi_domain *dom, *tdom;
> >         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >
> > +       /* Initialize domains for the platform */
> > +       rc = sbi_platform_domains_init(plat);
> > +       if (rc) {
> > +               sbi_printf("%s: platform domains_init() failed (error %d)\n",
> > +                          __func__, rc);
> > +               return rc;
> > +       }
> > +
> >         /* Discover domains */
> >         for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> >                 /* Ignore invalid HART */
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> --
> Regards,
> Atish

Regards,
Anup

