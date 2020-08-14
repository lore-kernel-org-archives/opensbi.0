From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 14 Aug 2020 09:15:39 +0000
Subject: [PATCH v2] firmware: fw_base: Improve exception stack setup in
 trap handler
In-Reply-To: <CAOnJCUJ+7_1Mb0Tb7aJ_fkSibADR12QZuXN65aU5xLR+_X4T3w@mail.gmail.com>
References: <20200812132653.262468-1-anup.patel@wdc.com>
 <CAOnJCUJ+7_1Mb0Tb7aJ_fkSibADR12QZuXN65aU5xLR+_X4T3w@mail.gmail.com>
Message-ID: <DM6PR04MB6201EB40FE8A8E5E7F4F04908D400@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 12 August 2020 23:21
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH v2] firmware: fw_base: Improve exception stack setup
> in trap handler
> 
> On Wed, Aug 12, 2020 at 6:27 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > Currently, the low-level trap handler (i.e. _trap_handler()) uses
> > branch instructions to conditionally setup exception stack based on
> > which mode trap occured.
> >
> > This patch implements exception stack setup using xor instructions
> > which is faster with same number of instructions due to lack of branch
> > instructions.
> >
> > The new exception stack setup approach can be best described by the
> > following pseudocode:
> >
> >  Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
> > Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
> >
> >  Came_From_M_Mode = 0    ==>    Exception_Stack = TP
> >  Came_From_M_Mode = -1   ==>    Exception_Stack = SP
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > Changes since v1:
> > - Don't assume that 0b10 privilege mode will never be used
> > - Use AND operation in-place of MUL operation
> > ---
> >  firmware/fw_base.S | 47
> > +++++++++++++++++++++-------------------------
> >  1 file changed, 21 insertions(+), 26 deletions(-)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S index
> > b66ac41..0271d9a 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -490,35 +490,30 @@ _trap_handler:
> >         /* Save T0 in scratch space */
> >         REG_S   t0, SBI_SCRATCH_TMP0_OFFSET(tp)
> >
> > -       /* Check which mode we came from */
> > +       /*
> > +        * Set T0 to appropriate exception stack
> > +        *
> > +        * Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
> > +        * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
> > +        *
> > +        * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
> > +        * Came_From_M_Mode = -1   ==>    Exception_Stack = SP
> > +        */
> >         csrr    t0, CSR_MSTATUS
> >         srl     t0, t0, MSTATUS_MPP_SHIFT
> >         and     t0, t0, PRV_M
> > -       xori    t0, t0, PRV_M
> > -       beq     t0, zero, _trap_handler_m_mode
> > -
> > -       /* We came from S-mode or U-mode */
> > -_trap_handler_s_mode:
> > -       /* Set T0 to original SP */
> > -       add     t0, sp, zero
> > -
> > -       /* Setup exception stack */
> > -       add     sp, tp, -(SBI_TRAP_REGS_SIZE)
> > -
> > -       /* Jump to code common for all modes */
> > -       j       _trap_handler_all_mode
> > -
> > -       /* We came from M-mode */
> > -_trap_handler_m_mode:
> > -       /* Set T0 to original SP */
> > -       add     t0, sp, zero
> > -
> > -       /* Re-use current SP as exception stack */
> > -       add     sp, sp, -(SBI_TRAP_REGS_SIZE)
> > -
> > -_trap_handler_all_mode:
> > -       /* Save original SP (from T0) on stack */
> > -       REG_S   t0, SBI_TRAP_REGS_OFFSET(sp)(sp)
> > +       slti    t0, t0, PRV_M
> > +       add     t0, t0, -1
> > +       xor     sp, sp, tp
> > +       and     t0, t0, sp
> > +       xor     sp, sp, tp
> > +       xor     t0, tp, t0
> > +
> > +       /* Save original SP on exception stack */
> > +       REG_S   sp, (SBI_TRAP_REGS_OFFSET(sp) - SBI_TRAP_REGS_SIZE)(t0)
> > +
> > +       /* Set SP to exception stack and make room for trap registers */
> > +       add     sp, t0, -(SBI_TRAP_REGS_SIZE)
> >
> >         /* Restore T0 from scratch space */
> >         REG_L   t0, SBI_SCRATCH_TMP0_OFFSET(tp)
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Looks good to me.
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
