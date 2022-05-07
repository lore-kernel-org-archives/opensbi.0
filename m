From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 10:34:58 +0530
Subject: [PATCH 10/11] lib: sbi: Add sbi_hart_update_extension() function
In-Reply-To: <CAOnJCUJRTu8z_0G3qEjVkhPnipnd78ppk4FyqejGQ84wbBRYiA@mail.gmail.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-11-apatel@ventanamicro.com>
 <CAOnJCUJRTu8z_0G3qEjVkhPnipnd78ppk4FyqejGQ84wbBRYiA@mail.gmail.com>
Message-ID: <CAAhSdy1hH4ASHRL3jEGTEjWBAQ64Wsi6YHuNkpEt4pDcs74a4g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:33 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We add sbi_hart_update_extension() function which allow platforms
> > to enable/disable hart extensions.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >  include/sbi/sbi_hart.h |  3 +++
> >  lib/sbi/sbi_hart.c     | 43 +++++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 41 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index 8b21fd4..4661506 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -63,6 +63,9 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
> >  int sbi_hart_priv_version(struct sbi_scratch *scratch);
> >  void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> >                                    char *version_str, int nvstr);
> > +void sbi_hart_update_extension(struct sbi_scratch *scratch,
> > +                              enum sbi_hart_extensions ext,
> > +                              bool enable);
> >  bool sbi_hart_has_extension(struct sbi_scratch *scratch,
> >                             enum sbi_hart_extensions ext);
> >  void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 28a7e75..3fc8899 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -367,6 +367,34 @@ void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> >         sbi_snprintf(version_str, nvstr, "%s", temp);
> >  }
> >
> > +static inline void __sbi_hart_update_extension(
> > +                                       struct hart_features *hfeatures,
> > +                                       enum sbi_hart_extensions ext,
> > +                                       bool enable)
> > +{
> > +       if (enable)
> > +               hfeatures->extensions |= BIT(ext);
> > +       else
> > +               hfeatures->extensions &= ~BIT(ext);
> > +}
> > +
> > +/**
> > + * Enable/Disable a particular hart extension
> > + *
> > + * @param scratch pointer to the HART scratch space
> > + * @param ext the extension number to check
> > + * @param enable new state of hart extension
> > + */
> > +void sbi_hart_update_extension(struct sbi_scratch *scratch,
> > +                              enum sbi_hart_extensions ext,
> > +                              bool enable)
> > +{
> > +       struct hart_features *hfeatures =
> > +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > +
> > +       __sbi_hart_update_extension(hfeatures, ext, enable);
> > +}
> > +
> >  /**
> >   * Check whether a particular hart extension is available
> >   *
> > @@ -620,31 +648,36 @@ __mhpm_skip:
> >                 /* Detect if hart supports sscofpmf */
> >                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->extensions |= BIT(SBI_HART_EXT_SSCOFPMF);
> > +                       __sbi_hart_update_extension(hfeatures,
> > +                                       SBI_HART_EXT_SSCOFPMF, true);
> >         }
> >
> >         /* Detect if hart supports time CSR */
> >         csr_read_allowed(CSR_TIME, (unsigned long)&trap);
> >         if (!trap.cause)
> > -               hfeatures->extensions |= BIT(SBI_HART_EXT_TIME);
> > +               __sbi_hart_update_extension(hfeatures,
> > +                                       SBI_HART_EXT_TIME, true);
> >
> >         /* Detect if hart has AIA local interrupt CSRs */
> >         csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
> >         if (!trap.cause)
> > -               hfeatures->extensions |= BIT(SBI_HART_EXT_AIA);
> > +               __sbi_hart_update_extension(hfeatures,
> > +                                       SBI_HART_EXT_AIA, true);
> >
> >         /* Detect if hart supports stimecmp CSR(Sstc extension) */
> >         if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >                 csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->extensions |= BIT(SBI_HART_EXT_SSTC);
> > +                       __sbi_hart_update_extension(hfeatures,
> > +                                       SBI_HART_EXT_SSTC, true);
> >         }
> >
> >         /* Detect if hart supports mstateen CSRs */
> >         if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >                 val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->extensions |= BIT(SBI_HART_EXT_SMSTATEEN);
> > +                       __sbi_hart_update_extension(hfeatures,
> > +                                       SBI_HART_EXT_SMSTATEEN, true);
> >         }
> >
> >         /* Mark hart feature detection done */
> > --
> > 2.34.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

>
> --
> Regards,
> Atish

