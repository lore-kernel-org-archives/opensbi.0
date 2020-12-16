From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 16 Dec 2020 04:42:58 +0000
Subject: [PATCH 2/4] lib: sbi: Add function to register new domain
In-Reply-To: <CAOnJCUKLqgAEZ6jEiYSXeNxt8_XghbW-et4rt5idzf-B=TzEUw@mail.gmail.com>
References: <20201214044431.76677-1-anup.patel@wdc.com>
 <20201214044431.76677-3-anup.patel@wdc.com>
 <CAOnJCUKLqgAEZ6jEiYSXeNxt8_XghbW-et4rt5idzf-B=TzEUw@mail.gmail.com>
Message-ID: <DM6PR04MB6201CAAF2C3A936F3E08D13A8DC50@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 16 December 2020 07:48
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 2/4] lib: sbi: Add function to register new domain
> 
> On Sun, Dec 13, 2020 at 8:45 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We add sbi_domain_register() function to help platform code register a
> > new domain explicitly instead of depending on domain_get() platform
> > callback. This function will eventually help us completely remove the
> > domain_get() platform callback.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_domain.h | 10 ++++++
> >  lib/sbi/sbi_domain.c     | 71
> ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >
> > diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h index
> > a7cb61e..1f8b942 100644
> > --- a/include/sbi/sbi_domain.h
> > +++ b/include/sbi/sbi_domain.h
> > @@ -146,6 +146,16 @@ void sbi_domain_dump(const struct sbi_domain
> > *dom, const char *suffix);
> >  /** Dump all domain details on the console */  void
> > sbi_domain_dump_all(const char *suffix);
> >
> > +/**
> > + * Register a new domain
> > + * @param dom pointer to domain
> > + * @param assign_mask pointer to HART mask of HARTs assigned to the
> > +domain
> > + *
> > + * @return 0 on success and negative error code on failure  */ int
> > +sbi_domain_register(struct sbi_domain *dom,
> > +                       const struct sbi_hartmask *assign_mask);
> > +
> >  /** Finalize domain tables and startup non-root domains */  int
> > sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
> >
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> > 1a3651b..d22fb90 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -367,6 +367,77 @@ void sbi_domain_dump_all(const char *suffix)
> >         }
> >  }
> >
> > +int sbi_domain_register(struct sbi_domain *dom,
> > +                       const struct sbi_hartmask *assign_mask) {
> > +       u32 i;
> > +       int rc;
> > +       struct sbi_domain *tdom;
> > +       u32 cold_hartid = current_hartid();
> > +       const struct sbi_platform *plat = sbi_platform_thishart_ptr();
> > +
> > +       if (!dom || !assign_mask)
> > +               return SBI_EINVAL;
> > +
> > +       /* Check if domain already discovered */
> > +       sbi_domain_for_each(i, tdom) {
> > +               if (tdom == dom)
> > +                       return SBI_EALREADY;
> > +       }
> > +
> > +       /*
> > +        * Ensure that we have room for Domain Index to
> > +        * HART ID mapping
> > +        */
> > +       if (SBI_DOMAIN_MAX_INDEX <= domain_count) {
> > +               sbi_printf("%s: No room for %s\n",
> > +                          __func__, dom->name);
> > +               return SBI_ENOSPC;
> > +       }
> > +
> > +       /* Sanitize discovered domain */
> > +       rc = sanitize_domain(plat, dom);
> > +       if (rc) {
> > +               sbi_printf("%s: sanity checks failed for"
> > +                          " %s (error %d)\n", __func__,
> > +                          dom->name, rc);
> > +               return rc;
> > +       }
> > +
> > +       /* Assign index to domain */
> > +       dom->index = domain_count++;
> > +       domidx_to_domain_table[dom->index] = dom;
> > +
> > +       /* Clear assigned HARTs of domain */
> > +       sbi_hartmask_clear_all(&dom->assigned_harts);
> > +
> > +       /* Assign domain to HART if HART is a possible HART */
> > +       sbi_hartmask_for_each_hart(i, assign_mask) {
> > +               if (!sbi_hartmask_test_hart(i, dom->possible_harts))
> > +                       continue;
> > +
> > +               tdom = hartid_to_domain_table[i];
> > +               if (tdom)
> > +                       sbi_hartmask_clear_hart(i,
> > +                                       &tdom->assigned_harts);
> > +               hartid_to_domain_table[i] = dom;
> > +               sbi_hartmask_set_hart(i, &dom->assigned_harts);
> > +
> > +               /*
> > +                * If cold boot HART is assigned to this domain then
> > +                * override boot HART of this domain.
> > +                */
> > +               if (i == cold_hartid &&
> > +                   dom->boot_hartid != cold_hartid) {
> > +                       sbi_printf("Domain%d Boot HARTID forced to"
> > +                                  " %d\n", dom->index, cold_hartid);
> > +                       dom->boot_hartid = cold_hartid;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
> > {
> >         int rc;
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
