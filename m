From: Christoph Müllner <cmuellner@linux.com>
Date: Mon, 5 Apr 2021 16:54:29 +0200
Subject: [PATCH] spinlocks: Replace test-and-set locks by ticket locks
In-Reply-To: <MN2PR04MB620726552CD3D1405A6D96DC8D779@MN2PR04MB6207.namprd04.prod.outlook.com>
References: <20210403162315.1595501-1-cmuellner@linux.com>
 <DM6PR04MB6201FD0A9480023626A514708D789@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAJF2gTRrpG+tRL6TkoY5NxeSwzJBOiuDUBnO=MH_2s--XUqK+g@mail.gmail.com>
 <MN2PR04MB620701B2FD80D25DCA8E49AB8D779@MN2PR04MB6207.namprd04.prod.outlook.com>
 <CAJF2gTTR6=RJqxot=EKWDCqUoZ2j7OgV+t5MCgFbwkPYz-BYoQ@mail.gmail.com>
 <MN2PR04MB620726552CD3D1405A6D96DC8D779@MN2PR04MB6207.namprd04.prod.outlook.com>
Message-ID: <CAHB2gtS3mq3APeN2FccbSEc3Ktwqt_PBLwmk9c5fjpiShRREyQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for all the input!

I've just sent out a v2, which got proper testing and is thus reaching
the minium
requirement of being correct on RV32/RV64 with qemu:
http://lists.infradead.org/pipermail/opensbi/2021-April/000783.html

Regarding the trylock() question: I'd keep it, because having that is
a valid expectation
of a programmer.

The idea with AMOADD for spin_lock() is good. I will use that in a v3.

Thanks,
Christoph




On Mon, Apr 5, 2021 at 9:45 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Guo Ren <guoren@kernel.org>
> > Sent: 05 April 2021 12:23
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Christoph Muellner <cmuellner@linux.com>; opensbi at lists.infradead.org
> > Subject: Re: [PATCH] spinlocks: Replace test-and-set locks by ticket locks
> >
> > On Mon, Apr 5, 2021 at 2:03 PM Anup Patel <Anup.Patel@wdc.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Guo Ren <guoren@kernel.org>
> > > > Sent: 05 April 2021 11:09
> > > > To: Anup Patel <Anup.Patel@wdc.com>
> > > > Cc: Christoph Muellner <cmuellner@linux.com>;
> > > > opensbi at lists.infradead.org
> > > > Subject: Re: [PATCH] spinlocks: Replace test-and-set locks by ticket
> > > > locks
> > > >
> > > > On Sun, Apr 4, 2021 at 2:05 PM Anup Patel <Anup.Patel@wdc.com>
> > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Christoph Muellner <cmuellner@linux.com>
> > > > > > Sent: 03 April 2021 21:53
> > > > > > To: opensbi at lists.infradead.org; Anup Patel <Anup.Patel@wdc.com>
> > > > > > Cc: Christoph Muellner <cmuellner@linux.com>
> > > > > > Subject: [PATCH] spinlocks: Replace test-and-set locks by ticket
> > > > > > locks
> > > > > >
> > > > > > Test-and-set locks don't provide fairness and are
> > > > > > non-deterministic
> > > > (w.r.t.
> > > > > > the prediction of the future holder of a lock).
> > > > > > This can be a performance problem in case of lock contention.
> > > > > >
> > > > > > Let's change the implementation to use ticket locks, which
> > > > > > guarantee a fair locking order (FIFO ordering).
> > > > > >
> > > > > > Ticket locks have two counters 'owner' and 'next'.
> > > > > > The counter 'owner' holds the ticket number of the current lock
> > owner.
> > > > > > The counter 'next' holds the latest free ticket number.
> > > > > >
> > > > > > The lock is free if both counters are equal. To acquire the lock, the
> > 'next'
> > > > > > counter is atomically incremented to obtain a new ticket.
> > > > > > The counter 'owner' is then polled until it becomes equal to the
> > > > > > new
> > > > ticket.
> > > > > > To release a lock, one atomically increments the 'owner'
> > > > > > counter.
> > > > > >
> > > > > > The implementation uses a 32-bit wide struct, which consists of
> > > > > > two 16-bit counters (owner and next). This is inspired by
> > > > > > similar spinlock implementations on other architectures.
> > > > > >
> > > > > > Note, that RISC-V lacks sub-word atomics, therefore we need to
> > > > > > circumvent this limitation with additional instructions.
> > > > > > This implementation aims to reduce the instructions between the
> > > > > > LR/SC pairs to minimize the chances of failing SCs. The cost of
> > > > > > this approach is, that we spill more registers than necessary.
> > > > >
> > > > > The spin_trylock() can be tricky to implement with ticket approach.
> > > > > Since the
> > > > > spin_trylock() is currently not used anywhere in OpenSBI, I suggest:
> > > > >
> > > > > 1) We can drop the spin_trylock() API as separate patch
> > > > > 2) Implement classic ticket spinlock approach as described in Wikipedia
> > > > >     using AMOADD instructions and barriers.
> > > > Do you prefer AMOADD? I think it's a better idea (csky only has
> > > > lr.w/sc.w, so it's my habit :P), I will update the Linux ticket-lock
> > > > patch:
> > > > https://lore.kernel.org/linux-riscv/1617201040-83905-4-git-send-emai
> > > > l-
> > > > guoren at kernel.org/T/#u
> > >
> > > It's generally easier to think in-terms of LR/SC on any architecture
> > > but the AMO instructions always scale better in-terms of HW
> > implementation.
> > >
> > > >
> > > > with:
> > > >
> > > > diff --git a/arch/riscv/include/asm/spinlock.h
> > > > b/arch/riscv/include/asm/spinlock.h
> > > > index 90b7eaa950cf..435286ad342b 100644
> > > > --- a/arch/riscv/include/asm/spinlock.h
> > > > +++ b/arch/riscv/include/asm/spinlock.h
> > > > @@ -22,15 +22,10 @@
> > > >  static inline void arch_spin_lock(arch_spinlock_t *lock)  {
> > > >         arch_spinlock_t lockval;
> > > > -       u32 tmp;
> > > >
> > > >         asm volatile (
> > > > -               "1:     lr.w    %0, %2          \n"
> > > > -               "       mv      %1, %0          \n"
> > > > -               "       addw    %0, %0, %3      \n"
> > > > -               "       sc.w    %0, %0, %2      \n"
> > > > -               "       bnez    %0, 1b          \n"
> > > > -               : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> > > > +               "   amoadd.w    %0, %2, %1      \n"
> > > > +               : "=&r" (lockval), "+A" (lock->lock)
> > > >                 : "r" (1 << TICKET_NEXT)
> > > >                 : "memory");
> > > >
> > > > Thx for the tip :)
> > >
> > > I was going to comment in LKML after we had it working here but it's
> > > good that you already noticed it.
> > >
> > > I did not think much about spin_trylock() using atomic instructions
> > > but it will be nice if you can attempt that as well in your Linux patches.
> > All riscv amo instructions will write to the target address unconditionally and
> > there is no cas instruction in riscv A-extension.
> > So "lr/sc" is the only way for riscv to implement trylock.
>
> spin_trylock() is not so common in Linux so I guess using LR/SC just
> for spin_trylock() should be fine. For other arch_spin_xyz() functions,
> we should prefer AMO instructions as much as possible.
>
> >
> > look the codes below:
> > static inline int arch_spin_trylock(arch_spinlock_t *lock) {
> >         u32 tmp, contended, res;
> >
> >         do {
> >                 asm volatile (
> >                 "       lr.w    %0, %3          \n"
> >                 __ASM_SRLIW    "%1, %0, %5      \n"
> >                 __ASM_SLLIW    "%2, %0, %5      \n"
> >                 "       or      %1, %2, %1      \n"
> >                 "       li      %2, 0           \n"
> >                 "       sub     %1, %1, %0      \n"
> >                 "       bnez    %1, 1f          \n"
> >                 "       addw    %0, %0, %4      \n"
> >                 "       sc.w    %2, %0, %3      \n"
> >                 "1:                             \n"
> >                 : "=&r" (tmp), "=&r" (contended), "=&r" (res),
> >                   "+A" (lock->lock)
> >                 : "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
> >                 : "memory");
> >         } while (res);
> >
> >         if (!contended)
> >                 __atomic_acquire_fence();
> >
> >         return !contended;
> > }
> >
> > When lock is up, trylock'll fail and the instructions progress is:
> >                 "       lr.w    %0, %3          \n"
> >                 "       srliw    "%1, %0, %5      \n"
> >                 "       slliw    "%2, %0, %5      \n"
> >                 "       or      %1, %2, %1      \n"
> >                 "       li      %2, 0           \n"
> >                 "       sub     %1, %1, %0      \n"
> >                 "       bnez    %1, 1f          \n"
> >                 "1:"
> >                 return !contented;
> >
> > 1 lr.w + 5 ALUs + branch = 7 instructions The most inconvenient about RISC-V
> > is that there is no rotate shift instruction, I must use more instructions and
> > registers to implement compare operation for the owner:next-ticket.
>
> You will not require shift instruction if "next_ticket" and "owner" are not
> packed into one word.
>
> Regards,
> Anup
>
> >
> > >
> > > >
> > > > > 3) We don't need to pack next_ticket and owner into one word
> > because
> > > > >      these can be separate "unsigned long" in spinlock_t. I believe that
> > > > >      this packing only helps in implementing spin_trylock(), Right ??
> > > > >
> > > > > Regards,
> > > > > Anup
> > > > >
> > > > > >
> > > > > > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > > > > > ---
> > > > > >  include/sbi/riscv_locks.h | 33 ++++++++++++-------
> > > > > >  lib/sbi/riscv_locks.c     | 67 +++++++++++++++++++++++++++++------
> > ----
> > > > > >  2 files changed, 72 insertions(+), 28 deletions(-)
> > > > > >
> > > > > > diff --git a/include/sbi/riscv_locks.h
> > > > > > b/include/sbi/riscv_locks.h index
> > > > > > faa9676..59e6af9 100644
> > > > > > --- a/include/sbi/riscv_locks.h
> > > > > > +++ b/include/sbi/riscv_locks.h
> > > > > > @@ -2,26 +2,37 @@
> > > > > >   * SPDX-License-Identifier: BSD-2-Clause
> > > > > >   *
> > > > > >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> > > > > > - *
> > > > > > - * Authors:
> > > > > > - *   Anup Patel <anup.patel@wdc.com>
> > > > > > + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
> > > > > >   */
> > > > > >
> > > > > >  #ifndef __RISCV_LOCKS_H__
> > > > > >  #define __RISCV_LOCKS_H__
> > > > > >
> > > > > > +#include <sbi/sbi_types.h>
> > > > > > +
> > > > > > +#define TICKET_SHIFT 16
> > > > > > +
> > > > > >  typedef struct {
> > > > > > -     volatile long lock;
> > > > > > -} spinlock_t;
> > > > > > +#ifdef __BIG_ENDIAN
> > > > > > +       u16 next;
> > > > > > +       u16 owner;
> > > > > > +#else
> > > > > > +       u16 owner;
> > > > > > +       u16 next;
> > > > > > +#endif
> > > > > > +} __aligned(4) spinlock_t;
> > > > > > +
> > > > > > +#define __SPIN_LOCK_UNLOCKED \
> > > > > > +     (spinlock_t) { 0, 0 }
> > > > > >
> > > > > > -#define __RISCV_SPIN_UNLOCKED 0
> > > > > > +#define SPIN_LOCK_INIT(x)    \
> > > > > > +     x = __SPIN_LOCK_UNLOCKED
> > > > > >
> > > > > > -#define SPIN_LOCK_INIT(x) (x).lock = __RISCV_SPIN_UNLOCKED
> > > > > > +#define SPIN_LOCK_INITIALIZER        \
> > > > > > +     __SPIN_LOCK_UNLOCKED
> > > > > >
> > > > > > -#define SPIN_LOCK_INITIALIZER                  \
> > > > > > -     {                                      \
> > > > > > -             .lock = __RISCV_SPIN_UNLOCKED, \
> > > > > > -     }
> > > > > > +#define DEFINE_SPIN_LOCK(x)  \
> > > > > > +     spinlock_t SPIN_LOCK_INIT(x)
> > > > > >
> > > > > >  int spin_lock_check(spinlock_t *lock);
> > > > > >
> > > > > > diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c index
> > > > > > 4d1d9c0..7d86742
> > > > > > 100644
> > > > > > --- a/lib/sbi/riscv_locks.c
> > > > > > +++ b/lib/sbi/riscv_locks.c
> > > > > > @@ -2,44 +2,77 @@
> > > > > >   * SPDX-License-Identifier: BSD-2-Clause
> > > > > >   *
> > > > > >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> > > > > > - *
> > > > > > - * Authors:
> > > > > > - *   Anup Patel <anup.patel@wdc.com>
> > > > > > + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
> > > > > >   */
> > > > > >
> > > > > >  #include <sbi/riscv_barrier.h>
> > > > > >  #include <sbi/riscv_locks.h>
> > > > > >
> > > > > > -int spin_lock_check(spinlock_t *lock)
> > > > > > +static inline int spin_lock_unlocked(spinlock_t lock)
> > > > > >  {
> > > > > > -     return (lock->lock == __RISCV_SPIN_UNLOCKED) ? 0 : 1;
> > > > > > +        return lock.owner == lock.next; }
> > > > > > +
> > > > > > +bool spin_lock_check(spinlock_t *lock) {
> > > > > > +     RISCV_FENCE(r, rw);
> > > > > > +     return !spin_lock_unlocked(*lock);
> > > > > >  }
> > > > > >
> > > > > >  int spin_trylock(spinlock_t *lock)  {
> > > > > > -     int tmp = 1, busy;
> > > > > > +     u32 inc = 1u << TICKET_SHIFT;
> > > > > > +     u32 mask = 0xffffu << TICKET_SHIFT;
> > > > > > +     u32 l0, tmp1, tmp2;
> > > > > >
> > > > > >       __asm__ __volatile__(
> > > > > > -             "       amoswap.w %0, %2, %1\n"
> > > > > > RISCV_ACQUIRE_BARRIER
> > > > > > -             : "=r"(busy), "+A"(lock->lock)
> > > > > > -             : "r"(tmp)
> > > > > > +             /* Get the current lock counters. */
> > > > > > +             "1:     lr.w.aq %0, %3\n"
> > > > > > +             "       slliw   %2, %0, %6\n"
> > > > > > +             "       and     %1, %0, %5\n"
> > > > > > +             /* Is the lock free right now? */
> > > > > > +             "       bne     %1, %2, 2f\n"
> > > > > > +             "       addw    %0, %0, %4\n"
> > > > > > +             /* Acquire the lock. */
> > > > > > +             "       sc.w.rl %0, %0, %3\n"
> > > > > > +             "       bnez    %0, 1b\n"
> > > > > > +             "2:"
> > > > > > +             : "=&r"(l0), "=&r"(tmp1), "=&r"(tmp2), "+A"(*lock)
> > > > > > +             : "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
> > > > > >               : "memory");
> > > > > >
> > > > > > -     return !busy;
> > > > > > +     return !l0;
> > > > > >  }
> > > > > >
> > > > > >  void spin_lock(spinlock_t *lock)  {
> > > > > > -     while (1) {
> > > > > > -             if (spin_lock_check(lock))
> > > > > > -                     continue;
> > > > > > +     u32 inc = 1u << TICKET_SHIFT;
> > > > > > +     u32 mask = 0xffffu << TICKET_SHIFT;
> > > > > > +     u32 l0, tmp1, tmp2;
> > > > > >
> > > > > > -             if (spin_trylock(lock))
> > > > > > -                     break;
> > > > > > -     }
> > > > > > +     __asm__ __volatile__(
> > > > > > +             /* Atomically increment the next ticket. */
> > > > > > +             "0:     lr.w.aq %0, %3\n"
> > > > > > +             "       addw    %0, %0, %4\n"
> > > > > > +             "       sc.w.rl %0, %0, %3\n"
> > > > > > +             "       bnez    %0, 0b\n"
> > > > > > +
> > > > > > +             /* Did we get the lock? */
> > > > > > +             "1:     slliw   %2, %0, %6\n"
> > > > > > +             "       and     %1, %0, %5\n"
> > > > > > +             "       beq     %1, %2, 2f\n"
> > > > > > +
> > > > > > +             /* No, let's spin on the lock. */
> > > > > > +             "       lr.w.aq %0, %3\n"
> > > > > > +             "       j       1b\n"
> > > > > > +             "2:"
> > > > > > +             : "=&r"(l0), "=&r"(tmp1), "=&r"(tmp2), "+A"(*lock)
> > > > > > +             : "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
> > > > > > +             : "memory");
> > > > > >  }
> > > > > >
> > > > > >  void spin_unlock(spinlock_t *lock)  {
> > > > > > -     __smp_store_release(&lock->lock, __RISCV_SPIN_UNLOCKED);
> > > > > > +     __smp_store_release(&lock->owner, lock->owner + 1);
> > > > > >  }
> > > > > > +
> > > > > > --
> > > > > > 2.30.2
> > > > >
> > > > > --
> > > > > opensbi mailing list
> > > > > opensbi at lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > >  Guo Ren
> > > >
> > > > ML: https://lore.kernel.org/linux-csky/
> > >
> > > Regards,
> > > Anup
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/

