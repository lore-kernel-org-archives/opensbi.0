From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 10:52:06 -0800
Subject: [PATCH v1 2/2] lib: sbi: Implement Sstc extension
In-Reply-To: <17C1041E-B6B4-406F-8DB7-B703F74E8400@jrtc27.com>
References: <20220228082604.3649231-1-atishp@rivosinc.com>
 <20220228082604.3649231-3-atishp@rivosinc.com>
 <17C1041E-B6B4-406F-8DB7-B703F74E8400@jrtc27.com>
Message-ID: <CAHBxVyGvj+7Z=9mxdyayP-xc+=_QNRVznsqXX7wBPDCRecpxvQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 28, 2022 at 9:03 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 28 Feb 2022, at 08:26, Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Recently, Sstc extension was ratified. It defines stimecmp which allows
> > the supervisor mode to directly update the timecmp value without the
> > need of the SBI call. The hardware also can inject the S-mode timer
> > interrupt direclty to the supervisor without going through the M-mode.
> > To maintain backward compatibility with the older software, SBI call
> > now uses stimecmp directly if the hardware supports.
> >
> > Implement the Sstc extension.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> M-mode changing behaviour and clobbering S-mode state seems wrong; how
> do you know Sstimecmp isn?t in use too?

<Fixed Anup's email address>

Because, S-mode will either use the stimecmp or SBI call. It will not
use both randomly.
This is also suggested in the sstc spec[1] as well.

In systems in which a supervisor execution environment (SEE) provides
timer facilities via an SBI
function call, this SBI call will continue to support requests to
schedule a timer interrupt. The SEE
will simply make use of stimecmp, changing its value as appropriate.
This ensures compatibility
with existing S-mode software that uses this SEE facility, while new
S-mode software takes
advantage of stimecmp directly.)

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view

> It?s owned by S-mode, leave it
> alone and use M-mode-only methods to implement the firmware calls.
>
> Jess
>
> > ---
> > include/sbi/riscv_encoding.h |  4 ++++
> > include/sbi/sbi_hart.h       |  4 +++-
> > lib/sbi/sbi_hart.c           | 28 ++++++++++++++++++++++++++++
> > lib/sbi/sbi_timer.c          | 25 ++++++++++++++++++++++---
> > 4 files changed, 57 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> > index c0020f43f022..cce66ddc8b12 100644
> > --- a/include/sbi/riscv_encoding.h
> > +++ b/include/sbi/riscv_encoding.h
> > @@ -312,6 +312,10 @@
> > #define CSR_STVAL                     0x143
> > #define CSR_SIP                               0x144
> >
> > +/* Sstc extension */
> > +#define CSR_STIMECMP                 0x14D
> > +#define CSR_STIMECMPH                        0x15D
> > +
> > /* Supervisor Protection and Translation */
> > #define CSR_SATP                      0x180
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > index 9e5a2b416017..93be7eddd6f1 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -28,9 +28,11 @@ enum sbi_hart_features {
> >       SBI_HART_HAS_AIA = (1 << 5),
> >       /** HART has MENVCFG CSR */
> >       SBI_HART_HAS_MENVCFG = (1 << 6),
> > +     /** HART has SSTC extension implemented in hardware */
> > +     SBI_HART_HAS_SSTC = (1 << 7),
> >
> >       /** Last index of Hart features*/
> > -     SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_MENVCFG,
> > +     SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
> > };
> >
> > struct sbi_scratch;
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index e08d9d32266a..8c9cad219c71 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -43,6 +43,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >       int cidx;
> >       unsigned int num_mhpm = sbi_hart_mhpm_count(scratch);
> >       uint64_t mhpmevent_init_val = 0;
> > +     unsigned long menvcfg_val = 0;
> >
> >       /* Enable FPU */
> >       if (misa_extension('D') || misa_extension('F'))
> > @@ -54,6 +55,23 @@ static void mstatus_init(struct sbi_scratch *scratch)
> >
> >       csr_write(CSR_MSTATUS, mstatus_val);
> >
> > +     /*
> > +      * The spec doesn't explicitly describe the reset value of menvcfg.
> > +      * Enable access to stimecmp if sstc extension is present in the
> > +      * hardware.
> > +      */
> > +     if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSTC)) {
> > +#if __riscv_xlen == 32
> > +             menvcfg_val = csr_read(CSR_MENVCFGH);
> > +             menvcfg_val |= MENVCFGH_STCE;
> > +             csr_write(CSR_MENVCFGH, menvcfg_val);
> > +#else
> > +             menvcfg_val = csr_read(CSR_MENVCFG);
> > +             menvcfg_val |= MENVCFG_STCE;
> > +             csr_write(CSR_MENVCFG, menvcfg_val);
> > +#endif
> > +     }
> > +
> >       /* Disable user mode usage of all perf counters except default ones (CY, TM, IR) */
> >       if (misa_extension('S') &&
> >           sbi_hart_has_feature(scratch, SBI_HART_HAS_SCOUNTEREN))
> > @@ -303,6 +321,8 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
> >               break;
> >       case SBI_HART_HAS_AIA:
> >               fstr = "aia";
> > +     case SBI_HART_HAS_SSTC:
> > +             fstr = "sstc";
> >               break;
> >       default:
> >               break;
> > @@ -533,6 +553,14 @@ __mhpm_skip:
> >       if (!trap.cause)
> >               hfeatures->features |= SBI_HART_HAS_MENVCFG;
> >
> > +     /**
> > +      * Detect if hart supports stimecmp CSR(Sstc extension) and menvcfg is
> > +      * implemented.
> > +      */
> > +     csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
> > +     if (!trap.cause && sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG))
> > +             hfeatures->features |= SBI_HART_HAS_SSTC;
> > +
> >       /* Detect if hart has AIA local interrupt CSRs */
> >       csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
> >       if (trap.cause)
> > diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> > index acdba922b1e9..c89c7ca51100 100644
> > --- a/lib/sbi/sbi_timer.c
> > +++ b/lib/sbi/sbi_timer.c
> > @@ -124,16 +124,35 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
> > void sbi_timer_event_start(u64 next_event)
> > {
> >       sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
> > -     if (timer_dev && timer_dev->timer_event_start)
> > +
> > +     /**
> > +      * Update the stimecmp directly if available. This allows
> > +      * the older software to leverage sstc extension on newer hardware.
> > +      */
> > +     if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC)) {
> > +#if __riscv_xlen == 32
> > +             csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
> > +             csr_write(CSR_STIMECMPH, next_event >> 32);
> > +#else
> > +             csr_write(CSR_STIMECMP, next_event);
> > +#endif
> > +     } else if (timer_dev && timer_dev->timer_event_start) {
> >               timer_dev->timer_event_start(next_event);
> > -     csr_clear(CSR_MIP, MIP_STIP);
> > +             csr_clear(CSR_MIP, MIP_STIP);
> > +     }
> >       csr_set(CSR_MIE, MIP_MTIP);
> > }
> >
> > void sbi_timer_process(void)
> > {
> >       csr_clear(CSR_MIE, MIP_MTIP);
> > -     csr_set(CSR_MIP, MIP_STIP);
> > +     /*
> > +      * If sstc extension is available, supervisor can receive the timer
> > +      * direclty without M-mode come in between. This function should
> > +      * only invoked if M-mode programs the timer for its own purpose.
> > +      */
> > +     if (!sbi_hart_has_feature(sbi_scratch_thishart_ptr(), SBI_HART_HAS_SSTC))
> > +             csr_set(CSR_MIP, MIP_STIP);
> > }
> >
> > const struct sbi_timer_device *sbi_timer_get_device(void)
> > --
> > 2.30.2
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>

