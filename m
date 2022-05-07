From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 10:34:19 +0530
Subject: [PATCH 08/11] lib: sbi: Convert hart features into hart extensions
In-Reply-To: <CAOnJCUKB4C0cm0EZy++5HStJtzWGmmR2WEYw-Y=80j-BufA21g@mail.gmail.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
 <20220429155151.314788-9-apatel@ventanamicro.com>
 <CAOnJCUKB4C0cm0EZy++5HStJtzWGmmR2WEYw-Y=80j-BufA21g@mail.gmail.com>
Message-ID: <CAAhSdy1hv12DT6Dgs0RpRTmu7-8xHsApj+q5rhw_8d=JFqTp+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:30 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Apr 29, 2022 at 8:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Since past few years, we have been using "hart features" in OpenSBI
> > to represent all optionalities and multi-letter extensions defined
> > by the RISC-V specifications.
> >
> > The RISC-V profiles specification has taken a different approach and
> > started assigning extension names for all optionalities which did not
> > have any extension name previously.
> > (Refer, https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc)
> >
> > Inspired from the RISC-V profiles specification, we convert OpenSBI
> > hart features into hart extensions. Going forward, we align the
> > extension naming with RISC-V profiles specification. Currently, only
> > "time CSR" and "AIA CSR" have not been assigned extension name but
> > for everything else we have a name.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/sbi/sbi_hart.h  |  35 ++++++------
> >  lib/sbi/sbi_hart.c      | 116 +++++++++++++++++++---------------------
> >  lib/sbi/sbi_init.c      |   4 +-
> >  lib/sbi/sbi_pmu.c       |   6 +--
> >  lib/sbi/sbi_timer.c     |   6 +--
> >  lib/sbi/sbi_trap.c      |   4 +-
> >  lib/utils/fdt/fdt_pmu.c |   2 +-
> >  7 files changed, 83 insertions(+), 90 deletions(-)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index c985674..8b21fd4 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -24,21 +24,21 @@ enum sbi_hart_priv_versions {
> >         SBI_HART_PRIV_VER_1_12 = 3,
> >  };
> >
> > -/** Possible feature flags of a hart */
> > -enum sbi_hart_features {
> > -       /** Hart has sscofpmf extension */
> > -       SBI_HART_HAS_SSCOFPMF = (1 << 0),
> > -       /** HART has timer csr implementation in hardware */
> > -       SBI_HART_HAS_TIME = (1 << 1),
> > -       /** HART has AIA local interrupt CSRs */
> > -       SBI_HART_HAS_AIA = (1 << 2),
> > -       /** HART has mstateen CSR **/
> > -       SBI_HART_HAS_SMSTATEEN = (1 << 3),
> > -       /** HART has SSTC extension implemented in hardware */
> > -       SBI_HART_HAS_SSTC = (1 << 4),
> > +/** Possible ISA extensions of a hart */
> > +enum sbi_hart_extensions {
> > +       /** Hart has Sscofpmt extension */
> > +       SBI_HART_EXT_SSCOFPMF = 0,
> > +       /** HART has HW time CSR (extension name not available) */
> > +       SBI_HART_EXT_TIME,
> > +       /** HART has AIA CSRs (extension name not available) */
> > +       SBI_HART_EXT_AIA,
> > +       /** HART has Smstateen CSR **/
> > +       SBI_HART_EXT_SMSTATEEN,
> > +       /** HART has Sstc extension */
> > +       SBI_HART_EXT_SSTC,
> >
> > -       /** Last index of Hart features*/
> > -       SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
> > +       /** Maximum index of Hart extension */
> > +       SBI_HART_EXT_MAX,
> >  };
> >
> >  struct sbi_scratch;
> > @@ -63,9 +63,10 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
> >  int sbi_hart_priv_version(struct sbi_scratch *scratch);
> >  void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> >                                    char *version_str, int nvstr);
> > -bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
> > -void sbi_hart_get_features_str(struct sbi_scratch *scratch,
> > -                              char *features_str, int nfstr);
> > +bool sbi_hart_has_extension(struct sbi_scratch *scratch,
> > +                           enum sbi_hart_extensions ext);
> > +void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
> > +                                char *extension_str, int nestr);
> >
> >  void __attribute__((noreturn)) sbi_hart_hang(void);
> >
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index fdfb6d9..956d185 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -29,7 +29,7 @@ void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
> >
> >  struct hart_features {
> >         int priv_version;
> > -       unsigned long features;
> > +       unsigned long extensions;
> >         unsigned int pmp_count;
> >         unsigned int pmp_addr_bits;
> >         unsigned long pmp_gran;
> > @@ -83,7 +83,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >         for (cidx = 0; cidx < num_mhpm; cidx++) {
> >  #if __riscv_xlen == 32
> >                 csr_write_num(CSR_MHPMEVENT3 + cidx, mhpmevent_init_val & 0xFFFFFFFF);
> > -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                         csr_write_num(CSR_MHPMEVENT3H + cidx,
> >                                       mhpmevent_init_val >> BITS_PER_LONG);
> >  #else
> > @@ -91,7 +91,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >  #endif
> >         }
> >
> > -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SMSTATEEN)) {
> > +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMSTATEEN)) {
> >                 mstateen_val = csr_read(CSR_MSTATEEN0);
> >  #if __riscv_xlen == 32
> >                 mstateen_val |= ((uint64_t)csr_read(CSR_MSTATEEN0H)) << 32;
> > @@ -99,7 +99,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >                 mstateen_val |= SMSTATEEN_STATEN;
> >                 mstateen_val |= SMSTATEEN0_HSENVCFG;
> >
> > -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
> > +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_AIA))
> >                         mstateen_val |= (SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT |
> >                                         SMSTATEEN0_IMSIC);
> >                 else
> > @@ -153,7 +153,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >                  * Enable access to stimecmp if sstc extension is present in the
> >                  * hardware.
> >                  */
> > -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSTC)) {
> > +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
> >  #if __riscv_xlen == 32
> >                         unsigned long menvcfgh_val;
> >                         menvcfgh_val = csr_read(CSR_MENVCFGH);
> > @@ -207,7 +207,7 @@ static int delegate_traps(struct sbi_scratch *scratch)
> >
> >         /* Send M-mode interrupts and most exceptions to S-mode */
> >         interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
> > -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                 interrupts |= MIP_LCOFIP;
> >
> >         exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
> > @@ -367,102 +367,94 @@ void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
> >  }
> >
> >  /**
> > - * Check whether a particular hart feature is available
> > + * Check whether a particular hart extension is available
> >   *
> >   * @param scratch pointer to the HART scratch space
> > - * @param feature the feature to check
> > - * @returns true (feature available) or false (feature not available)
> > + * @param ext the extension number to check
> > + * @returns true (available) or false (not available)
> >   */
> > -bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature)
> > +bool sbi_hart_has_extension(struct sbi_scratch *scratch,
> > +                           enum sbi_hart_extensions ext)
> >  {
> >         struct hart_features *hfeatures =
> >                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
> >
> > -       if (hfeatures->features & feature)
> > +       if (hfeatures->extensions & BIT(ext))
> >                 return true;
> >         else
> >                 return false;
> >  }
> >
> > -static unsigned long hart_get_features(struct sbi_scratch *scratch)
> > +static inline char *sbi_hart_extension_id2string(int ext)
> >  {
> > -       struct hart_features *hfeatures =
> > -                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > -
> > -       return hfeatures->features;
> > -}
> > -
> > -static inline char *sbi_hart_feature_id2string(unsigned long feature)
> > -{
> > -       char *fstr = NULL;
> > -
> > -       if (!feature)
> > -               return NULL;
> > +       char *estr = NULL;
> >
> > -       switch (feature) {
> > -       case SBI_HART_HAS_SSCOFPMF:
> > -               fstr = "sscofpmf";
> > +       switch (ext) {
> > +       case SBI_HART_EXT_SSCOFPMF:
> > +               estr = "sscofpmf";
> >                 break;
> > -       case SBI_HART_HAS_TIME:
> > -               fstr = "time";
> > +       case SBI_HART_EXT_TIME:
> > +               estr = "time";
> >                 break;
> > -       case SBI_HART_HAS_AIA:
> > -               fstr = "aia";
> > +       case SBI_HART_EXT_AIA:
> > +               estr = "aia";
> >                 break;
> > -       case SBI_HART_HAS_SSTC:
> > -               fstr = "sstc";
> > +       case SBI_HART_EXT_SSTC:
> > +               estr = "sstc";
> >                 break;
> > -       case SBI_HART_HAS_SMSTATEEN:
> > -               fstr = "smstateen";
> > +       case SBI_HART_EXT_SMSTATEEN:
> > +               estr = "smstateen";
> >                 break;
> >         default:
> >                 break;
> >         }
> >
> > -       return fstr;
> > +       return estr;
> >  }
> >
> >  /**
> > - * Get the hart features in string format
> > + * Get the hart extensions in string format
> >   *
> >   * @param scratch pointer to the HART scratch space
> > - * @param features_str pointer to a char array where the features string will be
> > - *                    updated
> > - * @param nfstr length of the features_str. The feature string will be truncated
> > - *             if nfstr is not long enough.
> > + * @param extensions_str pointer to a char array where the extensions string
> > + *                      will be updated
> > + * @param nestr length of the features_str. The feature string will be
> > + *             truncated if nestr is not long enough.
> >   */
> > -void sbi_hart_get_features_str(struct sbi_scratch *scratch,
> > -                              char *features_str, int nfstr)
> > +void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
> > +                                char *extensions_str, int nestr)
> >  {
> > -       unsigned long features, feat = 1UL;
> > +       struct hart_features *hfeatures =
> > +                       sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > +       int offset = 0, ext = 0;
> >         char *temp;
> > -       int offset = 0;
> >
> > -       if (!features_str || nfstr <= 0)
> > +       if (!extensions_str || nestr <= 0)
> >                 return;
> > -       sbi_memset(features_str, 0, nfstr);
> > +       sbi_memset(extensions_str, 0, nestr);
> >
> > -       features = hart_get_features(scratch);
> > -       if (!features)
> > +       if (!hfeatures->extensions)
> >                 goto done;
> >
> >         do {
> > -               if (features & feat) {
> > -                       temp = sbi_hart_feature_id2string(feat);
> > +               if (hfeatures->extensions & BIT(ext)) {
> > +                       temp = sbi_hart_extension_id2string(ext);
> >                         if (temp) {
> > -                               sbi_snprintf(features_str + offset, nfstr,
> > +                               sbi_snprintf(extensions_str + offset,
> > +                                            nestr - offset,
> >                                              "%s,", temp);
> >                                 offset = offset + sbi_strlen(temp) + 1;
> >                         }
> >                 }
> > -               feat = feat << 1;
> > -       } while (feat <= SBI_HART_HAS_LAST_FEATURE);
> > +
> > +               ext++;
> > +       } while (ext <= SBI_HART_EXT_MAX);
> >
>
> it should be ext < SBI_HART_EXT_MAX as SBI_HART_EXT_MAX is no longer
> the last extension.

Good catch. I have fixed it at the time of merging this patch.

>
> >  done:
> >         if (offset)
> > -               features_str[offset - 1] = '\0';
> > +               extensions_str[offset - 1] = '\0';
> >         else
> > -               sbi_strncpy(features_str, "none", nfstr);
> > +               sbi_strncpy(extensions_str, "none", nestr);
> >  }
> >
> >  static unsigned long hart_pmp_get_allowed_addr(void)
> > @@ -523,7 +515,7 @@ static void hart_detect_features(struct sbi_scratch *scratch)
> >
> >         /* Reset hart features */
> >         hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > -       hfeatures->features = 0;
> > +       hfeatures->extensions = 0;
> >         hfeatures->pmp_count = 0;
> >         hfeatures->mhpm_count = 0;
> >
> > @@ -623,31 +615,31 @@ __mhpm_skip:
> >                 /* Detect if hart supports sscofpmf */
> >                 csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->features |= SBI_HART_HAS_SSCOFPMF;
> > +                       hfeatures->extensions |= BIT(SBI_HART_EXT_SSCOFPMF);
> >         }
> >
> >         /* Detect if hart supports time CSR */
> >         csr_read_allowed(CSR_TIME, (unsigned long)&trap);
> >         if (!trap.cause)
> > -               hfeatures->features |= SBI_HART_HAS_TIME;
> > +               hfeatures->extensions |= BIT(SBI_HART_EXT_TIME);
> >
> >         /* Detect if hart has AIA local interrupt CSRs */
> >         csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
> >         if (!trap.cause)
> > -               hfeatures->features |= SBI_HART_HAS_AIA;
> > +               hfeatures->extensions |= BIT(SBI_HART_EXT_AIA);
> >
> >         /* Detect if hart supports stimecmp CSR(Sstc extension) */
> >         if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >                 csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->features |= SBI_HART_HAS_SSTC;
> > +                       hfeatures->extensions |= BIT(SBI_HART_EXT_SSTC);
> >         }
> >
> >         /* Detect if hart supports mstateen CSRs */
> >         if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >                 val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
> >                 if (!trap.cause)
> > -                       hfeatures->features |= SBI_HART_HAS_SMSTATEEN;
> > +                       hfeatures->extensions |= BIT(SBI_HART_EXT_SMSTATEEN);
> >         }
> >
> >         return;
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index c4def58..d57efa7 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -143,8 +143,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
> >         sbi_printf("Boot HART Priv Version    : %s\n", str);
> >         misa_string(xlen, str, sizeof(str));
> >         sbi_printf("Boot HART Base ISA        : %s\n", str);
> > -       sbi_hart_get_features_str(scratch, str, sizeof(str));
> > -       sbi_printf("Boot HART Features        : %s\n", str);
> > +       sbi_hart_get_extensions_str(scratch, str, sizeof(str));
> > +       sbi_printf("Boot HART ISA Extensions  : %s\n", str);
> >         sbi_printf("Boot HART PMP Count       : %d\n",
> >                    sbi_hart_pmp_count(scratch));
> >         sbi_printf("Boot HART PMP Granularity : %lu\n",
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 386bf4d..b60799e 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -313,7 +313,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
> >
> >         __clear_bit(cidx, &mctr_inhbt);
> >
> > -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                 pmu_ctr_enable_irq_hw(cidx);
> >         csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
> >
> > @@ -474,7 +474,7 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
> >          * Always set the OVF bit(disable interrupts) and inhibit counting of
> >          * events in M-mode. The OVF bit should be enabled during the start call.
> >          */
> > -       if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +       if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                 mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
> >                                  MHPMEVENT_MINH | MHPMEVENT_OF;
> >
> > @@ -521,7 +521,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
> >          */
> >         fixed_ctr = pmu_ctr_find_fixed_fw(event_idx);
> >         if (fixed_ctr >= 0 &&
> > -           !sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +           !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                 return fixed_ctr;
> >
> >         if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
> > diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> > index bf0f375..353886f 100644
> > --- a/lib/sbi/sbi_timer.c
> > +++ b/lib/sbi/sbi_timer.c
> > @@ -129,7 +129,7 @@ void sbi_timer_event_start(u64 next_event)
> >          * Update the stimecmp directly if available. This allows
> >          * the older software to leverage sstc extension on newer hardware.
> >          */
> > -       if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC)) {
> > +       if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
> >  #if __riscv_xlen == 32
> >                 csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
> >                 csr_write(CSR_STIMECMPH, next_event >> 32);
> > @@ -151,7 +151,7 @@ void sbi_timer_process(void)
> >          * directly without M-mode come in between. This function should
> >          * only invoked if M-mode programs the timer for its own purpose.
> >          */
> > -       if (!sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC))
> > +       if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
> >                 csr_set(CSR_MIP, MIP_STIP);
> >  }
> >
> > @@ -180,7 +180,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
> >                 if (!time_delta_off)
> >                         return SBI_ENOMEM;
> >
> > -               if (sbi_hart_has_feature(scratch, SBI_HART_HAS_TIME))
> > +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_TIME))
> >                         get_time_val = get_ticks;
> >         } else {
> >                 if (!time_delta_off)
> > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> > index 86bab6d..2c509e5 100644
> > --- a/lib/sbi/sbi_trap.c
> > +++ b/lib/sbi/sbi_trap.c
> > @@ -272,8 +272,8 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
> >         }
> >
> >         if (mcause & (1UL << (__riscv_xlen - 1))) {
> > -               if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(),
> > -                                        SBI_HART_HAS_AIA))
> > +               if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
> > +                                          SBI_HART_EXT_AIA))
> >                         rc = sbi_trap_aia_irq(regs, mcause);
> >                 else
> >                         rc = sbi_trap_nonaia_irq(regs, mcause);
> > diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
> > index a2b048f..8ba6b08 100644
> > --- a/lib/utils/fdt/fdt_pmu.c
> > +++ b/lib/utils/fdt/fdt_pmu.c
> > @@ -53,7 +53,7 @@ int fdt_pmu_fixup(void *fdt)
> >         fdt_delprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters");
> >         fdt_delprop(fdt, pmu_offset, "riscv,event-to-mhpmevent");
> >         fdt_delprop(fdt, pmu_offset, "riscv,raw-event-to-mhpmcounters");
> > -       if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > +       if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> >                 fdt_delprop(fdt, pmu_offset, "interrupts-extended");
> >
> >         return 0;
> > --
> > 2.34.1
> >
>
> Other than that, LGTM.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

>
> --
> Regards,
> Atish

