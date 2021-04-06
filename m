From: Xiang W <wxjstz@126.com>
Date: Tue, 06 Apr 2021 09:42:52 +0800
Subject: [PATCH v2] spinlocks: Replace test-and-set locks by ticket locks
In-Reply-To: <20210405144727.89369-1-cmuellner@linux.com>
References: <20210405144727.89369-1-cmuellner@linux.com>
Message-ID: <9da3f51c5255668b581ee44208c5e1beefe5b2c9.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-04-05?? 16:47 +0200?Christoph Muellner???
> Test-and-set locks don't provide fairness and are non-deterministic
> (w.r.t. the prediction of the future holder of a lock).
> This can be a performance problem in case of lock contention.
> 
> Let's change the implementation to use ticket locks, which guarantee
> a fair locking order (FIFO ordering).
> 
> Ticket locks have two counters 'owner' and 'next'.
> The counter 'owner' holds the ticket number of the current lock
> owner.
> The counter 'next' holds the latest free ticket number.
> 
> The lock is free if both counters are equal. To acquire the lock, the
> 'next' counter is atomically incremented to obtain a new ticket.
> The counter 'owner' is then polled until it becomes equal to the new
> ticket. To release a lock, one atomically increments the 'owner'
> counter.
> 
> The implementation uses a 32-bit wide struct, which consists of
> two 16-bit counters (owner and next). This is inspired by similar
> spinlock implementations on other architectures.
> 
> Note, that RISC-V lacks sub-word atomics, therefore we need to
> circumvent this limitation with additional instructions.
> This implementation aims to reduce the instructions between the
> LR/SC pairs to minimize the chances of failing SCs. The cost of
> this approach is, that we spill more registers than necessary.
> 
> This patch has been tested on RV64 and RV32 against self-written
> unit tests (to ensure the 16-bit overflow is correct) and against
> the Linux kernel (by exchanging the kernel's spinlock implementation
> with the one from this patch).
> 
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  include/sbi/riscv_locks.h | 33 ++++++++++++------
>  lib/sbi/riscv_locks.c     | 70 +++++++++++++++++++++++++++++------
> ----
>  2 files changed, 75 insertions(+), 28 deletions(-)
> 
> diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h
> index faa9676..492935f 100644
> --- a/include/sbi/riscv_locks.h
> +++ b/include/sbi/riscv_locks.h
> @@ -2,26 +2,37 @@
>   * SPDX-License-Identifier: BSD-2-Clause
>   *
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> - *
> - * Authors:
> - *   Anup Patel <anup.patel@wdc.com>
> + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
>   */
>  
>  #ifndef __RISCV_LOCKS_H__
>  #define __RISCV_LOCKS_H__
>  
> +#include <sbi/sbi_types.h>
> +
> +#define TICKET_SHIFT	16
> +
>  typedef struct {
> -	volatile long lock;
> -} spinlock_t;
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +       u16 next;
> +       u16 owner;
> +#else
> +       u16 owner;
> +       u16 next;
> +#endif
> +} __aligned(4) spinlock_t;
> +
> +#define __SPIN_LOCK_UNLOCKED	\
> +	(spinlock_t) { 0, 0 }
>  
> -#define __RISCV_SPIN_UNLOCKED 0
> +#define SPIN_LOCK_INIT(x)	\
> +	x = __SPIN_LOCK_UNLOCKED
>  
> -#define SPIN_LOCK_INIT(x) (x).lock = __RISCV_SPIN_UNLOCKED
> +#define SPIN_LOCK_INITIALIZER	\
> +	__SPIN_LOCK_UNLOCKED
>  
> -#define SPIN_LOCK_INITIALIZER                  \
> -	{                                      \
> -		.lock = __RISCV_SPIN_UNLOCKED, \
> -	}
> +#define DEFINE_SPIN_LOCK(x)	\
> +	spinlock_t SPIN_LOCK_INIT(x)
>  
>  int spin_lock_check(spinlock_t *lock);
>  
> diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
> index 4d1d9c0..04ee18a 100644
> --- a/lib/sbi/riscv_locks.c
> +++ b/lib/sbi/riscv_locks.c
> @@ -2,44 +2,80 @@
>   * SPDX-License-Identifier: BSD-2-Clause
>   *
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> - *
> - * Authors:
> - *   Anup Patel <anup.patel@wdc.com>
> + * Copyright (c) 2021 Christoph M?llner <cmuellner@linux.com>
>   */
>  
>  #include <sbi/riscv_barrier.h>
>  #include <sbi/riscv_locks.h>
>  
> -int spin_lock_check(spinlock_t *lock)
> +static inline int spin_lock_unlocked(spinlock_t lock)
>  {
> -	return (lock->lock == __RISCV_SPIN_UNLOCKED) ? 0 : 1;
> +        return lock.owner == lock.next;
> +}
> +
> +bool spin_lock_check(spinlock_t *lock)
> +{
> +	RISCV_FENCE(r, rw);
> +	return !spin_lock_unlocked(*lock);
>  }
>  
>  int spin_trylock(spinlock_t *lock)
>  {
> -	int tmp = 1, busy;
> +	unsigned long inc = 1u << TICKET_SHIFT;
> +	unsigned long mask = 0xffffu << TICKET_SHIFT;
> +	u32 l0, tmp1, tmp2;
>  
>  	__asm__ __volatile__(
> -		"	amoswap.w %0, %2, %1\n" RISCV_ACQUIRE_BARRIER
> -		: "=r"(busy), "+A"(lock->lock)
> -		: "r"(tmp)
> +		/* Get the current lock counters. */
> +		"1:	lr.w.aq	%0, %3\n"
> +		"	slli	%2, %0, %6\n"
> +		"	and	%2, %2, %5\n"
> +		"	and	%1, %0, %5\n"
> +		/* Is the lock free right now? */
> +		"	bne	%1, %2, 2f\n"
> +		"	add	%0, %0, %4\n"
> +		/* Acquire the lock. */
> +		"	sc.w.rl	%0, %0, %3\n"
> +		"	bnez	%0, 1b\n"
> +		"2:"
> +		: "=&r"(l0), "=&r"(tmp1), "=&r"(tmp2), "+A"(*lock)
> +		: "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
>  		: "memory");
>  
> -	return !busy;
> +	return !l0;
>  }
>  
>  void spin_lock(spinlock_t *lock)
>  {
> -	while (1) {
> -		if (spin_lock_check(lock))
> -			continue;
> +	unsigned long inc = 1u << TICKET_SHIFT;
> +	unsigned long mask = 0xffffu;
> +	u32 l0, tmp1, tmp2;
>  
> -		if (spin_trylock(lock))
> -			break;
> -	}
> +	__asm__ __volatile__(
> +		/* Atomically increment the next ticket. */
> +		"0:	lr.w.aq	%0, %3\n"
> +		"	add	%1, %0, %4\n"
> +		"	sc.w.rl	%2, %1, %3\n"
> +		"	bnez	%2, 0b\n"
> +
> +		/* Did we get the lock? */
> +		"	srli	%1, %0, %6\n"
> +		"	and	%1, %1, %5\n"
> +		"1:	and	%2, %0, %5\n"
> +		"	beq	%1, %2, 2f\n"
> +
> +		/* No, let's spin on the lock. */
> +		"	lw	%0, %3\n"
> +		RISCV_ACQUIRE_BARRIER
> +		"	j	1b\n"
> +		"2:"
> +		: "=&r"(l0), "=&r"(tmp1), "=&r"(tmp2), "+A"(*lock)
> +		: "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
> +		: "memory");
>  }
>  
>  void spin_unlock(spinlock_t *lock)
>  {
> -	__smp_store_release(&lock->lock, __RISCV_SPIN_UNLOCKED);
> +	__smp_store_release(&lock->owner, lock->owner + 1);
>  }
> +
This implementation does not increase the efficiency, next miss once,
the next time you have to wait at least 65535 times

The pseudo code I recommend is as follows

typedef struct {
	unsigned long owner;
	unsigned long next;
} spinlock_t;

void spin_lock(spinlock_t *lock)
{
	unsigned me = __atomic_add_fetch(&(lock->next), 1);
	while (lock->owner != next)
		asm volatile("": : :"memory");
}

void ticket_unlock(spinlock_t *lock)
{
	asm volatile("": : :"memory");
	lock->owner++;
}


