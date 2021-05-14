From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 14 May 2021 11:42:24 +0000
Subject: [PATCH v1 1/1] lib: sbi: Have spinlock checks return bool
In-Reply-To: <20210513045235.1602-1-git@danielschaefer.me>
References: <20210513045235.1602-1-git@danielschaefer.me>
Message-ID: <CO6PR04MB7812EC333A770FC1CC26794D8D509@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Daniel
> Schaefer
> Sent: 13 May 2021 10:23
> To: opensbi at lists.infradead.org
> Cc: Abner Chang <abner.chang@hpe.com>; Anup Patel
> <Anup.Patel@wdc.com>
> Subject: [PATCH v1 1/1] lib: sbi: Have spinlock checks return bool
> 
> spin_lock_check already returned bool in the source file but not in the
> header. With some toolchains that causes an error, as it should.
> 
> Because it and related functions all essentially return a bool, we can use this
> opportunity to change them.
> 
> Cc: Abner Chang <abner.chang@hpe.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Daniel Schaefer <git@danielschaefer.me>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  include/sbi/riscv_locks.h | 4 ++--
>  lib/sbi/riscv_locks.c     | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sbi/riscv_locks.h b/include/sbi/riscv_locks.h index
> 492935f5d60b..38d9cbeb7b2a 100644
> --- a/include/sbi/riscv_locks.h
> +++ b/include/sbi/riscv_locks.h
> @@ -34,9 +34,9 @@ typedef struct {
>  #define DEFINE_SPIN_LOCK(x)	\
>  	spinlock_t SPIN_LOCK_INIT(x)
> 
> -int spin_lock_check(spinlock_t *lock);
> +bool spin_lock_check(spinlock_t *lock);
> 
> -int spin_trylock(spinlock_t *lock);
> +bool spin_trylock(spinlock_t *lock);
> 
>  void spin_lock(spinlock_t *lock);
> 
> diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c index
> 75b443bd35b8..acab7769240b 100644
> --- a/lib/sbi/riscv_locks.c
> +++ b/lib/sbi/riscv_locks.c
> @@ -8,7 +8,7 @@
>  #include <sbi/riscv_barrier.h>
>  #include <sbi/riscv_locks.h>
> 
> -static inline int spin_lock_unlocked(spinlock_t lock)
> +static inline bool spin_lock_unlocked(spinlock_t lock)
>  {
>  	return lock.owner == lock.next;
>  }
> @@ -19,7 +19,7 @@ bool spin_lock_check(spinlock_t *lock)
>  	return !spin_lock_unlocked(*lock);
>  }
> 
> -int spin_trylock(spinlock_t *lock)
> +bool spin_trylock(spinlock_t *lock)
>  {
>  	unsigned long inc = 1u << TICKET_SHIFT;
>  	unsigned long mask = 0xffffu << TICKET_SHIFT; @@ -42,7 +42,7 @@
> int spin_trylock(spinlock_t *lock)
>  		: "r"(inc), "r"(mask), "I"(TICKET_SHIFT)
>  		: "memory");
> 
> -	return !l0;
> +	return l0 == 0;
>  }
> 
>  void spin_lock(spinlock_t *lock)
> --
> 2.30.1
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

