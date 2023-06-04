From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jun 2023 16:08:27 +0530
Subject: [PATCH 06/17] lib: sbi: Use scratch space to save per-HART domain pointer
In-Reply-To: <20230531-ace2a06252786f57e7952f36@orel>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-7-apatel@ventanamicro.com> <20230531-ace2a06252786f57e7952f36@orel>
Message-ID: <CAAhSdy2iMLH-k7Wk6FSYZdwA63gBaXAp62C4_RojjAzY-GgK1Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 31, 2023 at 6:09?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Apr 25, 2023 at 06:02:19PM +0530, Anup Patel wrote:
> > Instead of using a global array indexed by hartid, we should use
> > scratch space to save per-HART domain pointer.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_domain.h |  6 +-----
> >  lib/sbi/sbi_domain.c     | 38 +++++++++++++++++++++++++++++++++++---
> >  2 files changed, 36 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> > index 124ea90..b05bcf4 100644
> > --- a/include/sbi/sbi_domain.h
> > +++ b/include/sbi/sbi_domain.h
> > @@ -129,12 +129,8 @@ struct sbi_domain {
> >  /** The root domain instance */
> >  extern struct sbi_domain root;
> >
> > -/** HART id to domain table */
> > -extern struct sbi_domain *hartid_to_domain_table[];
> > -
> >  /** Get pointer to sbi_domain from HART id */
> > -#define sbi_hartid_to_domain(__hartid) \
> > -     hartid_to_domain_table[__hartid]
> > +struct sbi_domain *sbi_hartid_to_domain(u32 hartid);
> >
> >  /** Get pointer to sbi_domain for current HART */
> >  #define sbi_domain_thishart_ptr() \
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> > index b07d310..531737c 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -23,7 +23,6 @@
> >   * the array to be null-terminated.
> >   */
> >  struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX + 1] = { 0 };
> > -struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = { 0 };
> >  static u32 domain_count = 0;
> >  static bool domain_finalized = false;
> >
> > @@ -39,6 +38,32 @@ struct sbi_domain root = {
> >       .fw_region_inited = false,
> >  };
> >
> > +static unsigned long domain_hart_ptr_offset;
> > +
> > +struct sbi_domain *sbi_hartid_to_domain(u32 hartid)
> > +{
> > +     struct sbi_scratch *scratch;
> > +
> > +     scratch = sbi_hartid_to_scratch(hartid);
> > +     if (!scratch || !domain_hart_ptr_offset)
> > +             return NULL;
> > +
> > +     return (void *)(*((ulong *)sbi_scratch_offset_ptr(scratch,
> > +                                                domain_hart_ptr_offset)));
> > +}
> > +
> > +static void update_hartid_to_domain(u32 hartid, struct sbi_domain *dom)
> > +{
> > +     struct sbi_scratch *scratch;
> > +
> > +     scratch = sbi_hartid_to_scratch(hartid);
> > +     if (!scratch)
> > +             return;
> > +
> > +     *((ulong *)sbi_scratch_offset_ptr(scratch, domain_hart_ptr_offset))
> > +                                     = (ulong)dom;
> > +}
> > +
> >  bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
> >  {
> >       if (dom)
> > @@ -519,11 +544,11 @@ int sbi_domain_register(struct sbi_domain *dom,
> >               if (!sbi_hartmask_test_hart(i, dom->possible_harts))
> >                       continue;
> >
> > -             tdom = hartid_to_domain_table[i];
> > +             tdom = sbi_hartid_to_domain(i);
> >               if (tdom)
> >                       sbi_hartmask_clear_hart(i,
> >                                       &tdom->assigned_harts);
> > -             hartid_to_domain_table[i] = dom;
> > +             update_hartid_to_domain(i, dom);
> >               sbi_hartmask_set_hart(i, &dom->assigned_harts);
> >
> >               /*
> > @@ -715,9 +740,14 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
> >               return SBI_EINVAL;
> >       }
> >
> > +     domain_hart_ptr_offset = sbi_scratch_alloc_offset(sizeof(ulong));
> > +     if (!domain_hart_ptr_offset)
> > +             return SBI_ENOMEM;
> > +
> >       root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
> >       if (!root_memregs) {
> >               sbi_printf("%s: no memory for root regions\n", __func__);
> > +             sbi_scratch_free_offset(domain_hart_ptr_offset);
> >               return SBI_ENOMEM;
> >       }
> >       root.regions = root_memregs;
> > @@ -726,6 +756,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
> >       if (!root_hmask) {
> >               sbi_printf("%s: no memory for root hartmask\n", __func__);
> >               sbi_free(root_memregs);
> > +             sbi_scratch_free_offset(domain_hart_ptr_offset);
> >               return SBI_ENOMEM;
> >       }
> >       root.possible_harts = root_hmask;
> > @@ -774,6 +805,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
> >       if (rc) {
> >               sbi_free(root_hmask);
> >               sbi_free(root_memregs);
> > +             sbi_scratch_free_offset(domain_hart_ptr_offset);
> >               return rc;
> >       }
>
> Rather than duplicating all the free()'s we could use a sequence of error
> labels and gotos.

Okay, I will update.

>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

Regards,
Anup

