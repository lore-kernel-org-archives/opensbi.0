From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 16 Dec 2020 04:44:21 +0000
Subject: [PATCH 4/4] lib: sbi: Remove domain_get() platform callback
 function
In-Reply-To: <CAOnJCUL_kHw284o4=Un0iqiWeTOT41K+MErnnK_Y+BXoENrZ1g@mail.gmail.com>
References: <20201214044431.76677-1-anup.patel@wdc.com>
 <20201214044431.76677-5-anup.patel@wdc.com>
 <CAOnJCUL_kHw284o4=Un0iqiWeTOT41K+MErnnK_Y+BXoENrZ1g@mail.gmail.com>
Message-ID: <DM6PR04MB620194108F9FD733421AD7508DC50@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 16 December 2020 08:02
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH 4/4] lib: sbi: Remove domain_get() platform callback
> function
> 
> On Sun, Dec 13, 2020 at 8:45 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The domain_get() platform callback function is now redundant because
> > fdt_domain_populate() register new domain explicitly using the
> > sbi_domain_register() function.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_platform.h | 18 ---------
> >  lib/sbi/sbi_domain.c       | 78 ++------------------------------------
> >  2 files changed, 3 insertions(+), 93 deletions(-)
> >
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index 3681a78..58aba71 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -93,8 +93,6 @@ struct sbi_platform_operations {
> >
> >         /** Initialize (or populate) domains for the platform */
> >         int (*domains_init)(void);
> > -       /** Get domain pointer for given HART id */
> > -       struct sbi_domain *(*domain_get)(u32 hartid);
> >
> >         /** Write a character to the platform console output */
> >         void (*console_putc)(char ch); @@ -467,22 +465,6 @@ static
> > inline int sbi_platform_domains_init(const struct sbi_platform *plat)
> >         return 0;
> >  }
> >
> > -/**
> > - * Get domain pointer for given HART
> > - *
> > - * @param plat pointer to struct sbi_platform
> > - * @param hartid shorthand letter for CPU extensions
> > - *
> > - * @return non-NULL domain pointer on success and NULL on failure
> > - */
> > -static inline struct sbi_domain *sbi_platform_domain_get(
> > -                               const struct sbi_platform *plat, u32 hartid)
> > -{
> > -       if (plat && sbi_platform_ops(plat)->domain_get)
> > -               return sbi_platform_ops(plat)->domain_get(hartid);
> > -       return NULL;
> > -}
> > -
> >  /**
> >   * Write a character to the platform console output
> >   *
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> > d22fb90..6d4c608 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -441,12 +441,11 @@ int sbi_domain_register(struct sbi_domain *dom,
> > int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
> > {
> >         int rc;
> > -       u32 i, j, dhart;
> > -       bool dom_exists;
> > -       struct sbi_domain *dom, *tdom;
> > +       u32 i, dhart;
> > +       struct sbi_domain *dom;
> >         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >
> > -       /* Initialize domains for the platform */
> > +       /* Initialize and populate domains for the platform */
> >         rc = sbi_platform_domains_init(plat);
> >         if (rc) {
> >                 sbi_printf("%s: platform domains_init() failed (error
> > %d)\n", @@ -454,77 +453,6 @@ int sbi_domain_finalize(struct sbi_scratch
> *scratch, u32 cold_hartid)
> >                 return rc;
> >         }
> >
> > -       /* Discover domains */
> > -       for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> > -               /* Ignore invalid HART */
> > -               if (sbi_platform_hart_invalid(plat, i))
> > -                       continue;
> > -
> > -               /* Get domain assigned to HART */
> > -               dom = sbi_platform_domain_get(plat, i);
> > -               if (!dom)
> > -                       continue;
> > -
> > -               /* Check if domain already discovered */
> > -               dom_exists = FALSE;
> > -               sbi_domain_for_each(j, tdom) {
> > -                       if (tdom == dom) {
> > -                               dom_exists = TRUE;
> > -                               break;
> > -                       }
> > -               }
> > -
> > -               /* Newly discovered domain */
> > -               if (!dom_exists) {
> > -                       /*
> > -                        * Ensure that we have room for Domain Index to
> > -                        * HART ID mapping
> > -                        */
> > -                       if (SBI_DOMAIN_MAX_INDEX <= domain_count) {
> > -                               sbi_printf("%s: No room for %s\n",
> > -                                          __func__, dom->name);
> > -                               return SBI_ENOSPC;
> > -                       }
> > -
> > -                       /* Sanitize discovered domain */
> > -                       rc = sanitize_domain(plat, dom);
> > -                       if (rc) {
> > -                               sbi_printf("%s: sanity checks failed for"
> > -                                          " %s (error %d)\n", __func__,
> > -                                          dom->name, rc);
> > -                               return rc;
> > -                       }
> > -
> > -                       /* Assign index to domain */
> > -                       dom->index = domain_count++;
> > -                       domidx_to_domain_table[dom->index] = dom;
> > -
> > -                       /* Clear assigned HARTs of domain */
> > -                       sbi_hartmask_clear_all(&dom->assigned_harts);
> > -               }
> > -
> > -               /* Assign domain to HART if HART is a possible HART */
> > -               if (sbi_hartmask_test_hart(i, dom->possible_harts)) {
> > -                       tdom = hartid_to_domain_table[i];
> > -                       if (tdom)
> > -                               sbi_hartmask_clear_hart(i,
> > -                                               &tdom->assigned_harts);
> > -                       hartid_to_domain_table[i] = dom;
> > -                       sbi_hartmask_set_hart(i, &dom->assigned_harts);
> > -
> > -                       /*
> > -                        * If cold boot HART is assigned to this domain then
> > -                        * override boot HART of this domain.
> > -                        */
> > -                       if (i == cold_hartid &&
> > -                           dom->boot_hartid != cold_hartid) {
> > -                               sbi_printf("Domain%d Boot HARTID forced to"
> > -                                          " %d\n", dom->index, cold_hartid);
> > -                               dom->boot_hartid = cold_hartid;
> > -                       }
> > -               }
> > -       }
> > -
> >         /* Startup boot HART of domains */
> >         sbi_domain_for_each(i, dom) {
> >                 /* Domain boot HART */
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
