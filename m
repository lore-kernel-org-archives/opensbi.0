From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 9 Jan 2025 17:44:45 -0800
Subject: [PATCH] Add a dummy register to sbi_trap_regs
In-Reply-To: <6AAED77F-C41F-4850-8CB3-43C3AB40F2D7@jrtc27.com>
References: <20250109235219.2568-1-cfu@mips.com> <6AAED77F-C41F-4850-8CB3-43C3AB40F2D7@jrtc27.com>
Message-ID: <CAM1rFzEHBBvkhmjKRnS=DQhSvfoamOOXdJOfJhBowE9bTL6+iA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025 at 4:30?PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 9 Jan 2025, at 23:52, Chao-ying Fu <icebergfu@gmail.com> wrote:
> >
> > SBI_TRAP_CONTEXT_SIZE becomes a multiple of 8 bytes for RV32
> > or 16 bytes for RV64, so we have sp aligned to 8 or 16 bytes
> > to have better performance on some platforms,
> > ---
> > include/sbi/sbi_trap.h | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> > index d5182bf..df99d8e 100644
> > --- a/include/sbi/sbi_trap.h
> > +++ b/include/sbi/sbi_trap.h
> > @@ -84,8 +84,10 @@
> > #define SBI_TRAP_REGS_mstatus 33
> > /** Index of mstatusH member in sbi_trap_regs */
> > #define SBI_TRAP_REGS_mstatusH 34
> > +/** Index of a dummy register */
> > +#define SBI_TRAP_REGS_dummy 35
> > /** Last member index in sbi_trap_regs */
> > -#define SBI_TRAP_REGS_last 35
> > +#define SBI_TRAP_REGS_last 36
> >
> > /** Index of cause member in sbi_trap_info */
> > #define SBI_TRAP_INFO_cause 0
> > @@ -194,6 +196,8 @@ struct sbi_trap_regs {
> > unsigned long mstatus;
> > /** mstatusH register state (only for 32-bit) */
> > unsigned long mstatusH;
> > + /** a dummy register */
> > + unsigned long dummy;
>
> This is ugly and fragile for when changes are made to the structure.
> Either make SBI_TRAP_CONTEXT_SIZE round up the size or, if for some
> reason that doesn?t work, you can always make the struct type
> overaligned.
>
> Also, sp is aligned to 16 bytes anyway, that?s mandated by the ABI. So
> I don?t understand your justification.
>
> Strong NAK.
>
> Jess
>
Yes. The patch can be revised to be more solid. We can just change the
define for SBI_TRAP_CONTEXT_SIZE to 16*x bytes for RV64, for example.
Note that the original sp is aligned to 16 bytes. However, there is
code in fw_base.S as follows.
        /*
         * Set T0 to appropriate exception stack
         *
         * Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
         * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
         *
         * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
         * Came_From_M_Mode = -1   ==>    Exception_Stack = SP
         */
        csrr    t0, CSR_MSTATUS
        srl     t0, t0, MSTATUS_MPP_SHIFT
        and     t0, t0, PRV_M
        slti    t0, t0, PRV_M
        add     t0, t0, -1
        xor     sp, sp, tp
        and     t0, t0, sp
        xor     sp, sp, tp
        xor     t0, tp, t0

        /* Save original SP on exception stack */
        REG_S   sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_CONTEXT_SIZE)(t0)

        /* Set SP to exception stack and make room for trap context */
        add     sp, t0, -(SBI_TRAP_CONTEXT_SIZE)

After this add instruction, sp may not be aligned to 16 bytes any more.
Thanks!

