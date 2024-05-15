From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 15 May 2024 09:20:32 +0200
Subject: [PATCH] lib: sbi: Issue a PAUSE hint between spins in spin_lock()
In-Reply-To: <CAAhSdy2aA+JwB0zU_m6WL8cgRvcfD4DmP1yu9iJw_mGSojEc0A@mail.gmail.com>
References: <20240423154250.3797276-1-christoph.muellner@vrull.eu> <CAAhSdy2aA+JwB0zU_m6WL8cgRvcfD4DmP1yu9iJw_mGSojEc0A@mail.gmail.com>
Message-ID: <CAEg0e7gi+CYX0r9s_SpnQAk+2ABDea2WEXZrDQYW9sO-Emm4QQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 15, 2024 at 8:31?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Apr 23, 2024 at 9:13?PM Christoph M?llner
> <christoph.muellner@vrull.eu> wrote:
> >
> > RISC-V's Zihintpause extension includes a PAUSE instruction that
> > is designed to reduce engergy consumption while executing spin-wait
> > code sequences.  It is encoded as a HINT, which means that it
> > behaves like a NOP on systems that don't implement Zihintpause.
> >
> > Binutils supports Zihintpause since 2.36, so this patch uses
> > the ".insn" directive to keep the code compatible with older
> > toolchains.
> >
> > Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
> > ---
> >  lib/sbi/riscv_locks.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
> > index acab776..3c26a77 100644
> > --- a/lib/sbi/riscv_locks.c
> > +++ b/lib/sbi/riscv_locks.c
> > @@ -61,7 +61,8 @@ void spin_lock(spinlock_t *lock)
> >                 "1:     and     %2, %0, %5\n"
> >                 "       beq     %1, %2, 2f\n"
> >
> > -               /* If not, then spin on the lock. */
> > +               /* If not, then issue a PAUSE hint and spin on the lock. */
> > +               "       .insn   i 0x0f, 0, x0, x0, 0x010\n"
>
> There are a lot of platforms without Zihintpause so we need
> instruction patching here.

PAUSE is encoded as a HINT instruction (FENCE instruction with pred=W,
succ=0, fm=0, rd=x0, and rs1=x0):
  https://github.com/riscv/riscv-isa-manual/blob/main/src/zihintpause.adoc
HINT instructions are part of rv32i (base):
  https://github.com/riscv/riscv-isa-manual/blob/main/src/rv32.adoc#rv32i-hints

I.e., if the platform does not have Zihintpause, then this will be a
HINT that behaves like a NOP.
But it is always a valid instruction (even if Zihintpause is not implemented).

>
> >                 "       lw      %0, %3\n"
> >                 RISCV_ACQUIRE_BARRIER
> >                 "       j       1b\n"
> > --
> > 2.44.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Regards,
> Anup

