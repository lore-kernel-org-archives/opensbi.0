From: Anup Patel <anup@brainfault.org>
Date: Tue, 11 Aug 2020 08:40:50 +0530
Subject: [PATCH] firmware: fw_base: Improve exception stack setup in trap
 handler
In-Reply-To: <DCB6D7D1-D9E1-4C50-8617-D80462EF6693@jrtc27.com>
References: <20200810135245.230600-1-anup.patel@wdc.com>
 <DCB6D7D1-D9E1-4C50-8617-D80462EF6693@jrtc27.com>
Message-ID: <CAAhSdy0E0gNP_=JswM2RF=_RLeR4UviewcgTi7KGW2FVVR2Vfg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2020 at 7:35 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 10 Aug 2020, at 14:52, Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> > Currently, the low-level trap handler (i.e. _trap_handler()) uses
> > branch instructions to conditionally setup exception stack based
> > on which mode trap occured.
> >
> > This patch implements exception stack setup using xor instructions
> > which is 2 instructions less compared to previous approach and faster
> > due to lack of branch instructions.
> >
> > The new exception stack setup approach can be best described by the
> > following pseudocode:
> >
> > Came_From_M_Mode = (MSTATUS.MPP & 0x2) >> 1
>
> This relies on PRIV 0b10 currently being unallocated, which doesn't
> make me feel warm and fuzzy inside.

The PRIV 0b10 mode is not used by any of the upcoming extensions. In future,
we will require really strong justification in future to use the
unused 0b10 mode.
Even H-extension has cleanly avoided using PRIV 0b10 mode.

In any case, we should document this assumption.

>
> > Exception_Stack = TP ^ (Came_From_M_Mode * (SP ^ TP))
>
> This relies on MUL with 0/1 being fast, but that may well be a different

The MUL can be replaced with AND instruction but it was taking one
additional instruction. See below.

    /*
     * Set T0 to appropriate exception stack
     *
     * Came_From_M_Mode = ((MSTATUS.MPP & 0x2) >> 1) - 1
     * Exception_Stack = SP ^ (Came_From_M_Mode & (TP ^ SP))
     *
     * Came_From_M_Mode = -1UL   ==>    Exception_Stack = TP
     * Came_From_M_Mode = 0UL    ==>    Exception_Stack = SP
     */
    csrr    t0, CSR_MSTATUS
    srl    t0, t0, (MSTATUS_MPP_SHIFT + 1)
    and    t0, t0, 0x1
    add    t0, t0, -1
    xor    tp, tp, sp
    and    t0, t0, tp
    xor    tp, tp, sp
    xor    t0, sp, t0

> pipeline in your processor (in an OoO core) with fewer available, or a
> higher-latency path to an M-box in a simpler in-order pipeline. The MUL
> is also not compressible. You probably do want a branch, but in a way
> that macro-op fusion will hopefully turn it into a conditional move:
>
>     mv Exception_Stack, tp
>     beqz Came_From_M_Mode, 1f
>     mv Exception_Stack, sp
> 1:

Actually, I had started off with branches but code without branches (this
patch) is performing better on QEMU (because fewer TCG blocks required
for translating _trap_handler()). This code (this patch) will be much faster
on real HW because branch misses can cause bubbles in the instruction
pipeline.

The code with branches is as follows:
    csrr    t0, CSR_MSTATUS
    srl    t0, t0, (MSTATUS_MPP_SHIFT + 1)
    and    t0, t0, 0x1
    beq    t0, zero, _trap_stack_s_mode
_trap_stack_m_mode:
    add    t0, sp, zero
    j    _trap_stack_done
_trap_stack_s_mode:
    add    t0, tp, zero
_trap_stack_done:

>
> Same number of instructions, but all compressible, no multiplications
> required and the lone branch can be macro-op fused.

Overall, the key thing is having no (or fewer) branches in _trap_handler()
with the same number of (or fewer) instructions.

Regards,
Anup

>
> Jess
>
> > Came_From_M_Mode = 0    ==>    Exception_Stack = TP
> > Came_From_M_Mode = 1    ==>    Exception_Stack = SP
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > firmware/fw_base.S | 49 ++++++++++++++++++++--------------------------
> > 1 file changed, 21 insertions(+), 28 deletions(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index b66ac41..53a9a48 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -490,35 +490,28 @@ _trap_handler:
> >       /* Save T0 in scratch space */
> >       REG_S   t0, SBI_SCRATCH_TMP0_OFFSET(tp)
> >
> > -     /* Check which mode we came from */
> > +     /*
> > +      * Set T0 to appropriate exception stack
> > +      *
> > +      * Came_From_M_Mode = (MSTATUS.MPP & 0x2) >> 1
> > +      * Exception_Stack = TP ^ (Came_From_M_Mode * (SP ^ TP))
> > +      *
> > +      * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
> > +      * Came_From_M_Mode = 1    ==>    Exception_Stack = SP
> > +      */
> >       csrr    t0, CSR_MSTATUS
> > -     srl     t0, t0, MSTATUS_MPP_SHIFT
> > -     and     t0, t0, PRV_M
> > -     xori    t0, t0, PRV_M
> > -     beq     t0, zero, _trap_handler_m_mode
> > -
> > -     /* We came from S-mode or U-mode */
> > -_trap_handler_s_mode:
> > -     /* Set T0 to original SP */
> > -     add     t0, sp, zero
> > -
> > -     /* Setup exception stack */
> > -     add     sp, tp, -(SBI_TRAP_REGS_SIZE)
> > -
> > -     /* Jump to code common for all modes */
> > -     j       _trap_handler_all_mode
> > -
> > -     /* We came from M-mode */
> > -_trap_handler_m_mode:
> > -     /* Set T0 to original SP */
> > -     add     t0, sp, zero
> > -
> > -     /* Re-use current SP as exception stack */
> > -     add     sp, sp, -(SBI_TRAP_REGS_SIZE)
> > -
> > -_trap_handler_all_mode:
> > -     /* Save original SP (from T0) on stack */
> > -     REG_S   t0, SBI_TRAP_REGS_OFFSET(sp)(sp)
> > +     srl     t0, t0, (MSTATUS_MPP_SHIFT + 1)
> > +     and     t0, t0, 0x1
> > +     xor     sp, sp, tp
> > +     mul     t0, t0, sp
> > +     xor     sp, sp, tp
> > +     xor     t0, tp, t0
> > +
> > +     /* Save original SP on exception stack */
> > +     REG_S   sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_REGS_SIZE)(t0)
> > +
> > +     /* Set SP to exception stack and make room for trap registers */
> > +     add     sp, t0, -(SBI_TRAP_REGS_SIZE)
> >
> >       /* Restore T0 from scratch space */
> >       REG_L   t0, SBI_SCRATCH_TMP0_OFFSET(tp)
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

