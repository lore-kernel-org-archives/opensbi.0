From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 10:27:59 +0530
Subject: [PATCH 01/11] lib: sbi: Detect and print privileged spec version
In-Reply-To: <CAOnJCUKPRKzbgoyskSDvyXcW2_RtbB1rkKNrF7Jv5RmmZ_eYjA@mail.gmail.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-2-apatel@ventanamicro.com>
 <CAOnJCUKPRKzbgoyskSDvyXcW2_RtbB1rkKNrF7Jv5RmmZ_eYjA@mail.gmail.com>
Message-ID: <CAAhSdy1rq1uWRfj1DJnEm_iL8N_Lf+V0T29Hny7PH=a-yriBjQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:12 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > It is possible to guess privileged spec versions based on the CSRs
> > that where introduced in different privleged spec versions. In future,
>
> /s/privleged/privileged
>
> > if we are not able guess privileged spec version then we can have
> > platform provide it.
> >
> > We add privileged spec version as per-hart feature and try to guess
> > it based on presense of mcounteren, mcountinhibit, and menvcfg CSRs.
> >
>
> /s/presense/presence
>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_hart.h | 15 ++++++++++++
> >  lib/sbi/sbi_hart.c     | 52 +++++++++++++++++++++++++++++++++++++-----
> >  lib/sbi/sbi_init.c     |  2 ++
> >  3 files changed, 63 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index 1d09374..3c37933 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -12,6 +12,18 @@
> >
> >  #include <sbi/sbi_types.h>
> >
> > +/** Possible privileged specification versions of a hart */
> > +enum sbi_hart_priv_versions {
> > +       /** Unknown privileged specification */
> > +       SBI_HART_PRIV_VER_UNKNOWN = 0,
> > +       /** Privileged specification v1.10 */
> > +       SBI_HART_PRIV_VER_1_10 = 1,
> > +       /** Privileged specification v1.11 */
> > +       SBI_HART_PRIV_VER_1_11 = 2,
> > +       /** Privileged specification v1.12 */
> > +       SBI_HART_PRIV_VER_1_12 = 3,
> > +};
> > +
> >  /** Possible feature flags of a hart */
> >  enum sbi_hart_features {
> >         /** Hart has S-mode counter enable */
> > @@ -56,6 +68,9 @@ unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
> >  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
> >  unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
> >  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
> > +int sbi_hart_priv_version(struct sbi_scratch *scratch);
> > +void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> > +                                  char *version_str, int nvstr);
> >  bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
> >  void sbi_hart_get_features_str(struct sbi_scratch *scratch,
> >                                char *features_str, int nfstr);
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 229c14a..ed4e631 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -28,6 +28,7 @@ extern void __sbi_expected_trap_hext(void);
> >  void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
> >
> >  struct hart_features {
> > +       int priv_version;
> >         unsigned long features;
> >         unsigned int pmp_count;
> >         unsigned int pmp_addr_bits;
> > @@ -334,6 +335,39 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
> >         return 0;
> >  }
> >
> > +int sbi_hart_priv_version(struct sbi_scratch *scratch)
> > +{
> > +       struct hart_features *hfeatures =
> > +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > +
> > +       return hfeatures->priv_version;
> > +}
> > +
> > +void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> > +                                  char *version_str, int nvstr)
> > +{
> > +       char *temp;
> > +       struct hart_features *hfeatures =
> > +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > +
> > +       switch (hfeatures->priv_version) {
> > +       case SBI_HART_PRIV_VER_1_10:
> > +               temp = "v1.10";
> > +               break;
> > +       case SBI_HART_PRIV_VER_1_11:
> > +               temp = "v1.11";
> > +               break;
> > +       case SBI_HART_PRIV_VER_1_12:
> > +               temp = "v1.12";
> > +               break;
> > +       default:
> > +               temp = "unknown";
> > +               break;
> > +       }
> > +
> > +       sbi_snprintf(version_str, nvstr, "%s", temp);
> > +}
> > +
> >  /**
> >   * Check whether a particular hart feature is available
> >   *
> > @@ -583,6 +617,7 @@ __mhpm_skip:
> >         /* Detect if hart supports SCOUNTEREN feature */
> >         val = csr_read_allowed(CSR_SCOUNTEREN, (unsigned long)&trap);
> >         if (!trap.cause) {
> > +               hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
> >                 csr_write_allowed(CSR_SCOUNTEREN, (unsigned long)&trap, val);
> >                 if (!trap.cause)
> >                         hfeatures->features |= SBI_HART_HAS_SCOUNTEREN;
> > @@ -591,6 +626,7 @@ __mhpm_skip:
> >         /* Detect if hart supports MCOUNTEREN feature */
> >         val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
> >         if (!trap.cause) {
> > +               hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
> >                 csr_write_allowed(CSR_MCOUNTEREN, (unsigned long)&trap, val);
> >                 if (!trap.cause)
> >                         hfeatures->features |= SBI_HART_HAS_MCOUNTEREN;
> > @@ -600,8 +636,17 @@ __mhpm_skip:
> >         val = csr_read_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap);
> >         if (!trap.cause) {
> >                 csr_write_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap, val);
> > -               if (!trap.cause)
> > +               if (!trap.cause) {
> > +                       hfeatures->priv_version = SBI_HART_PRIV_VER_1_11;
> >                         hfeatures->features |= SBI_HART_HAS_MCOUNTINHIBIT;
> > +               }
> > +       }
> > +
> > +       /* Detect if hart has menvcfg CSR */
> > +       csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
> > +       if (!trap.cause) {
> > +               hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
> > +               hfeatures->features |= SBI_HART_HAS_MENVCFG;
> >         }
> >
> >         /* Counter overflow/filtering is not useful without mcounter/inhibit */
> > @@ -625,11 +670,6 @@ __mhpm_skip:
> >         hfeatures->features |= SBI_HART_HAS_AIA;
> >  __aia_skip:
> >
> > -       /* Detect if hart has menvcfg CSR */
> > -       csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
> > -       if (!trap.cause)
> > -               hfeatures->features |= SBI_HART_HAS_MENVCFG;
> > -
> >         /**
> >          * Detect if hart supports stimecmp CSR(Sstc extension) and menvcfg is
> >          * implemented.
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index 2b9e5ae..660b11f 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -139,6 +139,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
> >         /* Boot HART details */
> >         sbi_printf("Boot HART ID              : %u\n", hartid);
> >         sbi_printf("Boot HART Domain          : %s\n", dom->name);
> > +       sbi_hart_get_priv_version_str(scratch, str, sizeof(str));
> > +       sbi_printf("Boot HART Priv Version    : %s\n", str);
> >         misa_string(xlen, str, sizeof(str));
> >         sbi_printf("Boot HART ISA             : %s\n", str);
> >         sbi_hart_get_features_str(scratch, str, sizeof(str));
> > --
> > 2.34.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I have taken care of the typos at the time of merging this patch.

Applied this patch to the riscv/opensbi repo

Regards,
Anup

>
> --
> Regards,
> Atish

