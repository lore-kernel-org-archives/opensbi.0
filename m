From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Mar 2024 13:13:41 +0530
Subject: [PATCH 0/9] Improve trap handling for nested traps
In-Reply-To: <2b413a95-2aa9-daa8-d960-0e7134b9ae74@gmail.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
 <32748c25-1331-8324-0a15-0000d763caee@gmail.com> <CAAhSdy1GhzLu-tgTfsGkvVcMGKioF23zZ-n+vMaM2QJRnGR0kg@mail.gmail.com>
 <8d651bf3-eb4d-f37e-fa1f-07576afdc32c@gmail.com> <CAAhSdy0-rRR63cTmRJ_-aCSNjM_=r6VwX37kqdby3sr2=++8iw@mail.gmail.com>
 <2b413a95-2aa9-daa8-d960-0e7134b9ae74@gmail.com>
Message-ID: <CAAhSdy3PVd9P78q6HwqZd4PXwAqyggjD6OC2wS-iLgE-OfaSmA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 12, 2024 at 11:11?AM Bo Gan <ganboing@gmail.com> wrote:
>
> On 3/11/24 10:18 PM, Anup Patel wrote:
> > On Tue, Mar 12, 2024 at 10:03?AM Bo Gan <ganboing@gmail.com> wrote:
> >>
> >> On 3/11/24 8:43 PM, Anup Patel wrote:
> >>> On Tue, Mar 12, 2024 at 6:31?AM Bo Gan <ganboing@gmail.com> wrote:
> >>>>
> >>>> On 3/11/24 9:09 AM, Anup Patel wrote:
> >>>>> Nested traps will be a common when dealing with RAS error traps so
> >>>>> this series improves trap handling for nested traps by introducing
> >>>>> a linked-list based trap context chain.
> >>>>>
> >>>>> These patches can also be found the trap_handling_imp_v1 branch at
> >>>>> https://github.com/avpatel/opensbi.git
> >>>>>
> >>>>> Anup Patel (9):
> >>>>>      lib: sbi: Remove sbi_trap_exit() and related code
> >>>>>      include: sbi: Add trap_context pointer in struct sbi_scratch
> >>>>>      lib: sbi: Introduce trap context
> >>>>>      lib: sbi: Simplify parameters of misaligned and access fault handlers
> >>>>>      lib: sbi: Simplify parameters of sbi_illegal_insn_handler()
> >>>>>      lib: sbi: Remove regs paramter of sbi_irqchip_process()
> >>>>>      lib: sbi: Remove regs parameter from trap irq handling functions
> >>>>>      lib: sbi: Pass trap context pointer to sbi_ecall_handler()
> >>>>>      lib: sbi: Extend sbi_trap_error() to dump state in a nested trap
> >>>>>
> >>>>>     firmware/fw_base.S             |  14 +--
> >>>>>     include/sbi/sbi_ecall.h        |   4 +-
> >>>>>     include/sbi/sbi_illegal_insn.h |   4 +-
> >>>>>     include/sbi/sbi_irqchip.h      |   5 +-
> >>>>>     include/sbi/sbi_scratch.h      |  14 +--
> >>>>>     include/sbi/sbi_trap.h         |  24 ++++-
> >>>>>     include/sbi/sbi_trap_ldst.h    |  12 +--
> >>>>>     lib/sbi/sbi_ecall.c            |   3 +-
> >>>>>     lib/sbi/sbi_illegal_insn.c     |  14 +--
> >>>>>     lib/sbi/sbi_irqchip.c          |  10 +-
> >>>>>     lib/sbi/sbi_trap.c             | 186 +++++++++++++++++----------------
> >>>>>     lib/sbi/sbi_trap_ldst.c        |  67 ++++++------
> >>>>>     lib/utils/irqchip/imsic.c      |   2 +-
> >>>>>     13 files changed, 185 insertions(+), 174 deletions(-)
> >>>>>
> >>>>
> >>>> Hi Anup,
> >>>>
> >>>> Can you help providing an example for nested traps and the RAS extension?
> >>>> The closest spec I can find (https://github.com/riscv/riscv-ssrastraps) is
> >>>> still empty. I'm wondering where I can find the related documentation.
> >>>
> >>> Refer, "3.1.15. Machine Cause Register" of the draft Priv v1.13 specification.
> >>> https://github.com/riscv/riscv-isa-manual/releases/download/riscv-isa-release-157641b-2024-03-12/priv-isa-asciidoc.pdf
> >>>
> >>> Regards,
> >>> Anup
> >>>
> >>
> >>
> >> Hi Anup, Thanks for the pointer. I know what nested trap is. My concern is when do
> >> we expect such trap to happen? Does it mean for every memory access in M mode, it
> >> might trigger a RAS fault, causing a nested trap? Or even the fault can be delivered
> >> asynchronously?
> >
> > RAS error can occur at any time. A synchronous RAS errors will be taken
> > as an exception (mcause = 19) whereas asynchronous RAS errors will be
> > taken as RAS local interrupt or RAS external interrupt (through interrupt
> > controller).
> >
> > Only RAS synchronous errors can cause nested trap.
> >
> >> If that's the case, how can we even safely handle nested traps? E.g.,
> >> The entry of _trap_handler doesn't look like reentrant-safe to me. Perhaps you plan
> >> to enhance it in later patches.
> >>
> >
> > The _trap_handler pushes the register state on stack. It already takes care
> > of nesting by continuing the same SP if the trap was taken while in M-mode.
> >
> > If _trap_handler() did not support nesting then I would not be able to test
> > this series.
> >
> > Refer, TRAP_SAVE_AND_SETUP_SP_T0() in fw_base.S
> >
> > Regards,
> > Anup
> >
>
> I'm looking at the exact code you are pointing.
>
> > .macro TRAP_SAVE_AND_SETUP_SP_T0
> >       /* Swap TP and MSCRATCH */
> >       csrrw   tp, CSR_MSCRATCH, tp
>
> ===> what if RAS exception gets triggered here?
>
> >       /* Save T0 in scratch space */
> >       REG_S   t0, SBI_SCRATCH_TMP0_OFFSET(tp)
> >
>
> ===> Or here?
>
> >       /*
> >        * Set T0 to appropriate exception stack
> >        *
> >        * Came_From_M_Mode = ((MSTATUS.MPP < PRV_M) ? 1 : 0) - 1;
> >        * Exception_Stack = TP ^ (Came_From_M_Mode & (SP ^ TP))
> >        *
> >        * Came_From_M_Mode = 0    ==>    Exception_Stack = TP
> >        * Came_From_M_Mode = -1   ==>    Exception_Stack = SP
> >        */
>
> ===> Or somewhere below?
>
> >       csrr    t0, CSR_MSTATUS
> >       srl     t0, t0, MSTATUS_MPP_SHIFT
> >       and     t0, t0, PRV_M
> .....
>
> We only have one spare register CSR_MSCRATCH to work with before we
> can work on stack. How are we suppose to do the nested trap safely?
> Am i missing something?
>

If we get a nested trap before _trap_handler() gets a chance to save
state then nested trap handling will not work.

The _trap_handler() functionally supports nesting but it is certainly
not 100% safe due to lack of additional HW support.

The upcoming double trap extensions (particularly Smdbltrp) will
help us provide 100% safety in the low-level _trap_handler().
(Refer, https://wiki.riscv.org/display/HOME/RISC-V+Specification+Status)

Think of this series as preparatory work for using double trap
extension in OpenSBI.

Regards,
Anup

