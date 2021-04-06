From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Apr 2021 10:34:14 +0530
Subject: [PATCH v3 3/3] spinlocks: Replace test-and-set locks by ticket
 locks
In-Reply-To: <d8e54a2827c191363f874280f7d9372284224601.camel@126.com>
References: <20210406015354.332780-1-cmuellner@linux.com>
 <20210406015354.332780-4-cmuellner@linux.com>
 <d8e54a2827c191363f874280f7d9372284224601.camel@126.com>
Message-ID: <CAAhSdy3MhRS_5mjSazMhG2Jt6soQuV-JWtVV4vR-FAPh++pjvQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 6, 2021 at 8:45 AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2021-04-06?? 03:53 +0200?Christoph Muellner???
> > Replace the test-and-set spinlock implementation with ticket locks
> > in order to get fairness (in form of FIFO order).
> >
> > The implementation uses a 32-bit wide struct, which consists of
> > two 16-bit counters (owner and next). This is inspired by similar
> > spinlock implementations on other architectures.
> > This allows that the code works for both, RV32 and RV64.
> >
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > ---
> >  include/sbi/riscv_locks.h | 33 ++++++++++++-------
> >  lib/sbi/riscv_locks.c     | 67 +++++++++++++++++++++++++++++------
> > ----
> >  2 files changed, 72 insertions(+), 28 deletions(-)
> >
> > diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h
> > index faa9676..492935f 100644
> > --- a/include/sbi/riscv_locks.h
> > +++ b/include/sbi/riscv_locks.h
> > @@ -2,26 +2,37 @@
> >   * SPDX-License-Identifier: BSD-2-Clause
> >   *
> >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> > - *
> > - * Authors:
> > - *   Anup Patel <anup.patel@wdc.com>
> > + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
> >   */
> >
> >  #ifndef __RISCV_LOCKS_H__
> >  #define __RISCV_LOCKS_H__
> >
> > +#include <sbi/sbi_types.h>
> > +
> > +#define TICKET_SHIFT 16
> > +
> >  typedef struct {
> > -     volatile long lock;
> > -} spinlock_t;
> > +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> > +       u16 next;
> > +       u16 owner;
> > +#else
> > +       u16 owner;
> > +       u16 next;
> > +#endif
> > +} __aligned(4) spinlock_t;
> > +
> > +#define __SPIN_LOCK_UNLOCKED \
> > +     (spinlock_t) { 0, 0 }
> >
> > -#define __RISCV_SPIN_UNLOCKED 0
> > +#define SPIN_LOCK_INIT(x)    \
> > +     x = __SPIN_LOCK_UNLOCKED
> >
> > -#define SPIN_LOCK_INIT(x) (x).lock = __RISCV_SPIN_UNLOCKED
> > +#define SPIN_LOCK_INITIALIZER        \
> > +     __SPIN_LOCK_UNLOCKED
> >
> > -#define SPIN_LOCK_INITIALIZER                  \
> > -     {                                      \
> > -             .lock = __RISCV_SPIN_UNLOCKED, \
> > -     }
> > +#define DEFINE_SPIN_LOCK(x)  \
> > +     spinlock_t SPIN_LOCK_INIT(x)
> >
> >  int spin_lock_check(spinlock_t *lock);
> >
> > diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
> > index 4d1d9c0..7e607b0 100644
> > --- a/lib/sbi/riscv_locks.c
> > +++ b/lib/sbi/riscv_locks.c
> > @@ -2,44 +2,77 @@
> >   * SPDX-License-Identifier: BSD-2-Clause
> >   *
> >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> > - *
> > - * Authors:
> > - *   Anup Patel <anup.patel@wdc.com>
> > + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
> >   */
> >
> >  #include <sbi/riscv_barrier.h>
> >  #include <sbi/riscv_locks.h>
> >
> > -int spin_lock_check(spinlock_t *lock)
> > +static inline int spin_lock_unlocked(spinlock_t lock)
> >  {
> > -     return (lock->lock == __RISCV_SPIN_UNLOCKED) ? 0 : 1;
> > +        return lock.owner == lock.next;
> > +}
> > +
> > +bool spin_lock_check(spinlock_t *lock)
> > +{
> > +     RISCV_FENCE(r, rw);
> > +     return !spin_lock_unlocked(*lock);
> >  }
> >
> >  int spin_trylock(spinlock_t *lock)
> >  {
> > -     int tmp = 1, busy;
> > +     unsigned long inc = 1u << TICKET_SHIFT;
> > +     unsigned long mask = 0xffffu << TICKET_SHIFT;
> > +     u32 l0, tmp1, tmp2;
> >
> >       __asm__ __volatile__(
> > -             "       amoswap.w %0, %2, %1\n" RISCV_ACQUIRE_BARRIER
> > -             : "=r"(busy), "+A"(lock->lock)
> > -             : "r"(tmp)
> > +             /* Get the current lock counters. */
> > +             "1:     lr.w.aq %0, %3\n"
> > +             "       slli    %2, %0, %6\n"
> > +             "       and     %2, %2, %5\n"
> > +             "       and     %1, %0, %5\n"
> > +             /* Is the lock free right now? */
> > +             "       bne     %1, %2, 2f\n"
> > +             "       add     %0, %0, %4\n"
> > +             /* Acquire the lock. */
> > +             "       sc.w.rl %0, %0, %3\n"
> > +             "       bnez    %0, 1b\n"
> > +             "2:"
> > +             : "=&r"(l0), "=&r"(tmp1), "=&r"(tmp2), "+A"(*lock)
> > +             : "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
> >               : "memory");
> >
> > -     return !busy;
> > +     return !l0;
> >  }
> >
> >  void spin_lock(spinlock_t *lock)
> >  {
> > -     while (1) {
> > -             if (spin_lock_check(lock))
> > -                     continue;
> > +     unsigned long inc = 1u << TICKET_SHIFT;
> > +     unsigned long mask = 0xffffu;
> > +     u32 l0, tmp1, tmp2;
> >
> > -             if (spin_trylock(lock))
> > -                     break;
> > -     }
> > +     __asm__ __volatile__(
> > +             /* Atomically increment the next ticket. */
> > +             "       amoadd.w.aqrl   %0, %4, %3\n"
> > +
> > +             /* Did we get the lock? */
> > +             "       srli    %1, %0, %6\n"
> > +             "       and     %1, %1, %5\n"
> > +             "1:     and     %2, %0, %5\n"
> What we need to keep re-reading should be 'owner'

Yes, the code is already doing that.

The "owner" is lower 16bits so "and     %2, %0, %5\n" will
extract "owner" in %2. The %1 already has assigned ticket
number.

Regards,
Anup

