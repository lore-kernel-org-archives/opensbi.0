From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 21 Jun 2024 10:41:38 -0700
Subject: [PATCH] lib: sbi: Enable Control Transfer Records (CTR) Ext using xstateen.
In-Reply-To: <CAAhSdy2vG37rGdb9avFvp7pXP1p83tPfuxB5szMttUgQf2Rv+g@mail.gmail.com>
References: <20240529150210.125200-1-rkanwal@rivosinc.com> <CAAhSdy14BLF=foVd_ByojzFO=tzYSKGGfVDOD_TWtunBBfxq=A@mail.gmail.com>
 <CAHBxVyGECqgH-RFzaGt-cNJR4jSpLCgBSUm+1B6Emwb2Watbfg@mail.gmail.com> <CAAhSdy2vG37rGdb9avFvp7pXP1p83tPfuxB5szMttUgQf2Rv+g@mail.gmail.com>
Message-ID: <CAHBxVyGcJmAzBGxtwkMsC48rsjAWCKuNZKgk8jSU8a+hP_azEQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 4:44?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jun 20, 2024 at 5:33?AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
> >
> > On Tue, Jun 18, 2024 at 3:40?AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > Hi Rajnesh,
> > >
> > > On Wed, May 29, 2024 at 8:32?PM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
> > > >
> > > > The Control Transfer Records (CTR) extension provides a method to
> > > > record a limited branch history in register-accessible internal chip
> > > > storage.
> > > >
> > > > This extension is similar to Arch LBR in x86 and BRBE in ARM.
> > > > The Extension has been stable and the latest release can be found here
> > > > https://github.com/riscv/riscv-control-transfer-records/release
> > > >
> > > > Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> > >
> >
> > +Beeman Strong
> >
> > > We will be needing a SBI FWFT extension feature to explicitly
> > > enable/disable CTR because:
> > > 1) Hypervisors (such as KVM) needs a way to know when
> > > Guest/VM starts/stops using CTR. This information will allow
> > > hypervisors to optimize Guest/VM world switch when CTR is
> > > available.
> >
> > Yes. This will be useful for virtualization but it will add more costs
> > when non-virtualization scenarios.
> > Because you have to enable/disable CTR at every context switch.
>
> Well, it is not on every context switch. The CTR will be enabled only
> when task using CTR is scheduled-in and CTR will be disabled
> only when a task using CTR is schedule-out.
>

I meant context switch for a process using CTR. So we are saying the same thing.
I think we can do better by disabling it while context switching in if
the next process
is not going to use CTR. We already check that while clearing the CTR entries.

We need to check if it will work if perf is going to be attached to an
already running process.

> > If SBI PMU is in use, the cost probably won't matter as we have tons
> > of SBI calls for other PMU functionality anyways.
> > However, it adds extra cost if counter delegation is in use.
> >
> > To avoid this cost, the PMU driver can enable/disable CTR only if
> > SBI_PMU is in use. This will work for virtualization as well
> > SBI PMU is the only way to get PMU working reliably if virtualization
> > is enabled. Thoughts ?
>
> We can't decide to enable/disable CTR in Linux based on SBI
> PMU usage because there will be platforms where SBI PMU
> is used natively and inside Guest/VM.
>
> Instead, I suggest that SBI implementation (such as OpenSBI)
> which prefer keeping CTR always enabled should implement
> CTR firmware feature as though it is always-enabled and can't
> be disabled. In other words, for such SBI implementations the
> sbi_fwft_set() for CTR firmware feature will always return
> SBI_ERR_DENIED.
>
> Similarly, SBI implementations (such KVM) which prefer lazy
> context-switching of CTR will keep CTR disabled by default
> and will expect the supervisor to explicitly enable/disable
> CTR using sbi_fwft_set().
>
> Using the above, PMU drivers (both SBI PMU based and
> counter delegation based) can decide whether enabling/disabling
> CTR upon sched-in/sched-out is required or not.
>

Makes sense. This is a better scheme. Thanks!

> >
> > > 2) Keeping is CTR enabled by default opens a side-channel
> > > between multiple OpenSBI domains or between multiple
> > > Guest/VM.
> > >
> >
> > We must clear the CTR buffer on domain context switch to avoid this.
> > For the process context switch path, we clear the entries.
> >
> > For Guest/VM, we probably should do something like that in KVM as well.
>
> Yes, I agree. This is straight forward.
>
> Regards,
> Anup
>
> >
> > > Based on the above, I suggest you propose a new feature for
> > > SBI FWFT extension in PRS TG and update this series accordingly.
> > >
> > > Regards,
> > > Anup
> > >
> > > > ---
> > > >  include/sbi/riscv_encoding.h | 13 +++++++++++++
> > > >  include/sbi/sbi_hart.h       |  4 ++++
> > > >  lib/sbi/sbi_hart.c           | 13 +++++++++++++
> > > >  3 files changed, 30 insertions(+)
> > > >
> > > > diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> > > > index d914828..eb3361c 100644
> > > > --- a/include/sbi/riscv_encoding.h
> > > > +++ b/include/sbi/riscv_encoding.h
> > > > @@ -357,6 +357,17 @@
> > > >  #define CSR_SSTATEEN2                  0x10E
> > > >  #define CSR_SSTATEEN3                  0x10F
> > > >
> > > > +/* Machine-Level Control transfer records CSRs */
> > > > +#define CSR_MCTRCTL                     0x34e
> > > > +
> > > > +/* Supervisor-Level Control transfer records CSRs */
> > > > +#define CSR_SCTRCTL                     0x14e
> > > > +#define CSR_SCTRSTATUS                  0x14f
> > > > +#define CSR_SCTRDEPTH                   0x15f
> > > > +
> > > > +/* VS-Level Control transfer records CSRs */
> > > > +#define CSR_VSCTRCTL                    0x24e
> > > > +
> > > >  /* ===== Hypervisor-level CSRs ===== */
> > > >
> > > >  /* Hypervisor Trap Setup (H-extension) */
> > > > @@ -773,6 +784,8 @@
> > > >  #define SMSTATEEN0_CS                  (_ULL(1) << SMSTATEEN0_CS_SHIFT)
> > > >  #define SMSTATEEN0_FCSR_SHIFT          1
> > > >  #define SMSTATEEN0_FCSR                        (_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
> > > > +#define SMSTATEEN0_CTR_SHIFT           54
> > > > +#define SMSTATEEN0_CTR                 (_ULL(1) << SMSTATEEN0_CTR_SHIFT)
> > > >  #define SMSTATEEN0_CONTEXT_SHIFT       57
> > > >  #define SMSTATEEN0_CONTEXT             (_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
> > > >  #define SMSTATEEN0_IMSIC_SHIFT         58
> > > > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > > > index cc78eec..c4eddb4 100644
> > > > --- a/include/sbi/sbi_hart.h
> > > > +++ b/include/sbi/sbi_hart.h
> > > > @@ -63,6 +63,10 @@ enum sbi_hart_extensions {
> > > >         SBI_HART_EXT_SSCSRIND,
> > > >         /** Hart has Ssccfg extension */
> > > >         SBI_HART_EXT_SSCCFG,
> > > > +       /** HART has CTR M-mode CSRs */
> > > > +       SBI_HART_EXT_SMCTR,
> > > > +       /** HART has CTR S-mode CSRs */
> > > > +       SBI_HART_EXT_SSCTR,
> > > >
> > > >         /** Maximum index of Hart extension */
> > > >         SBI_HART_EXT_MAX,
> > > > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > > > index cd974cc..db2f157 100644
> > > > --- a/lib/sbi/sbi_hart.c
> > > > +++ b/lib/sbi/sbi_hart.c
> > > > @@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
> > > >                 else
> > > >                         mstateen_val &= ~(SMSTATEEN0_SVSLCT);
> > > >
> > > > +               if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCTR))
> > > > +                       mstateen_val |= SMSTATEEN0_CTR;
> > > > +               else
> > > > +                       mstateen_val &= ~SMSTATEEN0_CTR;
> > > > +
> > > >                 csr_write(CSR_MSTATEEN0, mstateen_val);
> > > >  #if __riscv_xlen == 32
> > > >                 csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
> > > > @@ -668,6 +673,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
> > > >         __SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
> > > >         __SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
> > > >         __SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
> > > > +       __SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
> > > > +       __SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
> > > >  };
> > > >
> > > >  _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
> > > > @@ -921,6 +928,12 @@ __pmp_skip:
> > > >         /* Save trap based detection of Zicntr */
> > > >         has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
> > > >
> > > > +       /* Detect if hart has Control Transfer Record CSRs */
> > > > +       csr_read_allowed(CSR_MCTRCTL, (unsigned long)&trap);
> > > > +       if (!trap.cause)
> > > > +               __sbi_hart_update_extension(hfeatures, SBI_HART_EXT_SMCTR,
> > > > +                                           true);
> > > > +
> > > >         /* Let platform populate extensions */
> > > >         rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
> > > >                                           hfeatures);
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi

