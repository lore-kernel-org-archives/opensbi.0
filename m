From: Anup Patel <anup@brainfault.org>
Date: Sun, 16 Aug 2020 19:45:33 +0530
Subject: [PATCH 2/2] lib: sbi: Handle the case were MTVAL has illegal
 instruction address
In-Reply-To: <D8443477-12DE-41EE-85FD-8FC6D206B5CE@jrtc27.com>
References: <20200815170055.286732-1-anup.patel@wdc.com>
 <20200815170055.286732-2-anup.patel@wdc.com>
 <D8443477-12DE-41EE-85FD-8FC6D206B5CE@jrtc27.com>
Message-ID: <CAAhSdy1+5U7xsx4GOzxMYBJ4bZf5UBCOu+N0DnGA5KjS-6rOdg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 16, 2020 at 1:21 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 15 Aug 2020, at 18:00, Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> > The Kendryte K210 follows RISC-V v1.9 spec so MTVAL has instruction
> > address (instead of instruction encoding) on illegal instruction trap.
> >
> > To handle above case, we fix sbi_illegal_insn_handler() without any
> > impact on RISC-V v1.10 (or higher) systems. This achieved by exploiting
> > the fact that program counter (and instruction address) is always 2-byte
> > aligned in RISC-V world.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > lib/sbi/sbi_illegal_insn.c | 21 +++++++++++++++------
> > 1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> > index 0e5523f..779a727 100644
> > --- a/lib/sbi/sbi_illegal_insn.c
> > +++ b/lib/sbi/sbi_illegal_insn.c
> > @@ -118,13 +118,22 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
> > {
> >       struct sbi_trap_info uptrap;
> >
> > +     /*
> > +      * We only deal with 32bit (or longer) illegal instructions. If we
> > +      * see instruction is zero OR instruction is 16bit then we fetch and
> > +      * check the instruction encoding using unprivilege access.
> > +      *
> > +      * The program counter (PC) in RISC-V world is always 2-byte aligned
> > +      * so handling only 32bit (or longer) illegal instructions also help
> > +      * the case where MTVAL CSR contains instruction address for illegal
> > +      * instruction trap.
> > +      */
> > +
> >       if (unlikely((insn & 3) != 3)) {
>
> Isn't `(insn & 3) == 1` also unambiguous? It's only ambiguous when the
> LSB is 0.

I did not understand your question.

The "(insn & 3) != 3" means either:
1. insn[1:0] == 0 hence it is Quadrant0 16bit instruction OR entire insn == 0
2. insn[1:0] == 1 hence it is Quadrant1 16bit instruction
3. insn[1:0] == 2 hence it is Quadrant2 16bit instruction

>
> I do also wonder if this would be better as a single boot-time quirk
> test (ie deliberately fault and see what the hart reports), so as to
> not overly penalise 1.10-implementing harts.

We are not penalising 1.10-implemetation because we are not
emulating any 16bit illegal instructions. In fact, we are removing
in "insn == 0" check for 1.10-implementation so we have removed
couple of instructions for 1.10-implementation.

>
> Jess
>
> > -             if (insn == 0) {
> > -                     insn = sbi_get_insn(regs->mepc, &uptrap);
> > -                     if (uptrap.cause) {
> > -                             uptrap.epc = regs->mepc;
> > -                             return sbi_trap_redirect(regs, &uptrap);
> > -                     }
> > +             insn = sbi_get_insn(regs->mepc, &uptrap);
> > +             if (uptrap.cause) {
> > +                     uptrap.epc = regs->mepc;
> > +                     return sbi_trap_redirect(regs, &uptrap);
> >               }
> >               if ((insn & 3) != 3)
> >                       return truly_illegal_insn(insn, regs);
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

