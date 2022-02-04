From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Feb 2022 10:17:02 +0530
Subject: [PATCH v1 2/3] lib: sbi: Disable interrupt during config matching
In-Reply-To: <CAAhSdy0gDGR3X-HuNzpRKOm_WOoVk4KUnGOfmQQzk4uS2P-w5Q@mail.gmail.com>
References: <20220107185409.1172221-1-atishp@rivosinc.com>
 <20220107185409.1172221-3-atishp@rivosinc.com>
 <CAAhSdy0gDGR3X-HuNzpRKOm_WOoVk4KUnGOfmQQzk4uS2P-w5Q@mail.gmail.com>
Message-ID: <CAAhSdy2uGGxyXQds8V2dZG5OQV=k70CxAfFotjwOSnN7+E+N3Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 10:21 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Jan 8, 2022 at 12:24 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > PMU overflow interrupt should be disabled durinig initial configuration of
> > counters. They should be enabled while starting counters.
> >
> > Fixes: 730f01bb41a6 ("lib: sbi: Support sscofpmf extension in OpenSBI")
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Overall, this patch looks good but I agree that for debugging purposes
> we need an option in FW_OPTIONS which can allow monitoring events
> in M-mode (i.e. MINH=0). The actual behaviour of the option is a separate
> topic/patch.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/openbis repo.

Regards,
Anup

>
> Regards,
> Anup
>
> > ---
> >  include/sbi/riscv_encoding.h |  3 ++-
> >  lib/sbi/sbi_pmu.c            | 10 +++++++---
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> > index 8a29f8e05c9a..ac8590d72e4f 100644
> > --- a/include/sbi/riscv_encoding.h
> > +++ b/include/sbi/riscv_encoding.h
> > @@ -181,13 +181,14 @@
> >  #define MHPMEVENT_VSINH                        (_UL(1) << 59)
> >  #define MHPMEVENT_VUINH                        (_UL(1) << 58)
> >  #else
> > -#define MHPMEVENTH_OF                  (_UL(1) << 31)
> > +#define MHPMEVENTH_OF                  (_ULL(1) << 31)
> >  #define MHPMEVENTH_MINH                        (_ULL(1) << 30)
> >  #define MHPMEVENTH_SINH                        (_ULL(1) << 29)
> >  #define MHPMEVENTH_UINH                        (_ULL(1) << 28)
> >  #define MHPMEVENTH_VSINH               (_ULL(1) << 27)
> >  #define MHPMEVENTH_VUINH               (_ULL(1) << 26)
> >
> > +#define MHPMEVENT_OF                   (MHPMEVENTH_OF << 32)
> >  #define MHPMEVENT_MINH                 (MHPMEVENTH_MINH << 32)
> >  #define MHPMEVENT_SINH                 (MHPMEVENTH_SINH << 32)
> >  #define MHPMEVENT_UINH                 (MHPMEVENTH_UINH << 32)
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 376afec13491..a209c8e266d6 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -256,7 +256,7 @@ static int pmu_ctr_enable_irq_hw(int ctr_idx)
> >
> >  #if __riscv_xlen == 32
> >         mhpmevent_csr = CSR_MHPMEVENT3H  + ctr_idx - 3;
> > -       of_mask = ~MHPMEVENTH_OF;
> > +       of_mask = (uint32_t)~MHPMEVENTH_OF;
> >  #else
> >         mhpmevent_csr = CSR_MHPMEVENT3 + ctr_idx - 3;
> >         of_mask = ~MHPMEVENT_OF;
> > @@ -470,9 +470,13 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
> >         if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
> >                 return SBI_EFAIL;
> >
> > -       /* Always clear the OVF bit and inhibit countin of events in M-mode */
> > +       /**
> > +        * Always set the OVF bit(disable interrupts) and inhibit counting of
> > +        * events in M-mode. The OVF bit should be enabled during the start call.
> > +        */
> >         if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
> > -               mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) | MHPMEVENT_MINH;
> > +               mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
> > +                                MHPMEVENT_MINH | MHPMEVENT_OF;
> >
> >         /* Update the inhibit flags based on inhibit flags received from supervisor */
> >         pmu_update_inhibit_flags(flags, &mhpmevent_val);
> > --
> > 2.30.2
> >

