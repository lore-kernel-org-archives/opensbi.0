From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Feb 2022 17:10:26 +0530
Subject: [PATCH 03/13] lib: sbi: Use AIA CSRs for local interrupts when
 available
In-Reply-To: <58551da7a19f079d83c21bd526280968947e811f.camel@126.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
 <58551da7a19f079d83c21bd526280968947e811f.camel@126.com>
Message-ID: <CAAhSdy2_QZ9+u1aqOT8YimXwFtiKufomD3g9JfyhAgneZocp5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 19, 2022 at 9:27 PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2022-01-04???? 15:43 +0530?Anup Patel???
> > We should use AIA CSRs to process local interrupts whenever AIA
> > is available.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> The interrupts triggered by AIA should all be external interrupts. For
> platforms that support AIA, mcause should only receive external
> interrupts, and then handle timers and software interrupts in external
> interrupts. We shouldn't need two versions of sbi_trap_irq

The way external interrupts are to be handled using AIA local interrupt
CSRs is different from traditional (i.e. non-AIA) way of handling external
interrupt. With AIA local interrupt CSRs, we can handle multiple local
interrupts (using MTOPI) in the same interrupt handling context whereas
without AIA we can only handle one local interrupt (using MCAUSE) in
the same interrupt handle context.

Also with AIA IMSIC, the IPIs can be handles via IMSIC as external
interrupts and platforms don't need to provide special M-mode IPI device
when AIA IMSIC is present.

The AIA IMSIC does not provide any alternative way for timer interrupts
so these have to be handled as local interrupts.

Regards,
Anup

>
> Regards,
> Xiang W
> > ---
> >  lib/sbi/sbi_trap.c | 57 +++++++++++++++++++++++++++++++++++++--------
> > -
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> > index 8d20e04..bc8961f 100644
> > --- a/lib/sbi/sbi_trap.c
> > +++ b/lib/sbi/sbi_trap.c
> > @@ -195,6 +195,44 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
> >         return 0;
> >  }
> >
> > +static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong
> > mcause)
> > +{
> > +       mcause &= ~(1UL << (__riscv_xlen - 1));
> > +       switch (mcause) {
> > +       case IRQ_M_TIMER:
> > +               sbi_timer_process();
> > +               break;
> > +       case IRQ_M_SOFT:
> > +               sbi_ipi_process();
> > +               break;
> > +       default:
> > +               return SBI_ENOENT;
> > +       };
> > +
> > +       return 0;
> > +}
> > +
> > +static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
> > +{
> > +       unsigned long mtopi;
> > +
> > +       while ((mtopi = csr_read(CSR_MTOPI))) {
> > +               mtopi = mtopi >> TOPI_IID_SHIFT;
> > +               switch (mtopi) {
> > +               case IRQ_M_TIMER:
> > +                       sbi_timer_process();
> > +                       break;
> > +               case IRQ_M_SOFT:
> > +                       sbi_ipi_process();
> > +                       break;
> > +               default:
> > +                       return SBI_ENOENT;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * Handle trap/interrupt
> >   *
> > @@ -225,18 +263,15 @@ struct sbi_trap_regs *sbi_trap_handler(struct
> > sbi_trap_regs *regs)
> >         }
> >
> >         if (mcause & (1UL << (__riscv_xlen - 1))) {
> > -               mcause &= ~(1UL << (__riscv_xlen - 1));
> > -               switch (mcause) {
> > -               case IRQ_M_TIMER:
> > -                       sbi_timer_process();
> > -                       break;
> > -               case IRQ_M_SOFT:
> > -                       sbi_ipi_process();
> > -                       break;
> > -               default:
> > -                       msg = "unhandled external interrupt";
> > +               if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(),
> > +                                        SBI_HART_HAS_AIA))
> > +                       rc = sbi_trap_aia_irq(regs, mcause);
> > +               else
> > +                       rc = sbi_trap_nonaia_irq(regs, mcause);
> > +               if (rc) {
> > +                       msg = "unhandled local interrupt";
> >                         goto trap_error;
> > -               };
> > +               }
> >                 return regs;
> >         }
> >
> > --
> > 2.25.1
> >
> >
>
>

