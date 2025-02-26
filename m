From: Xiang W <wxjstz@126.com>
Date: Wed, 26 Feb 2025 21:22:38 +0800
Subject: [PATCH v2] Emit lr and sc instructions based on -march flags
In-Reply-To: <20250225230010.10634-1-cfu@mips.com>
References: <CAAhSdy3HioW4E2=6g2ZPJ5ser0+UNVDf+Zon_T4ZFo7-L5pSZA@mail.gmail.com>
	 <20250225230010.10634-1-cfu@mips.com>
Message-ID: <4a4417e6a3406300b39fc799eeb4293998281781.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-02-25?? 15:00 -0800?Chao-ying Fu???
> When -march=rv64im_zalrsc_zicsr is used, we provide implementation
> that uses lr and sc instructions only.
> When -march=rv64ima_zicsr is used, we have the original implementation.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>

docs/platform_requirements.md needs to be updated

Regards,
Xiang W
> ---
> Changes in v2:
> ? Remove the config flag that controls lr/sc.
> ? Use addw to implement amoadd.w.
> ---
> ?firmware/fw_base.S??????????? | 10 ++++++
> ?firmware/payloads/test_head.S | 11 +++++++
> ?lib/sbi/riscv_atomic.c??????? | 60 ++++++++++++++++++++++++++++++++++-
> ?lib/sbi/riscv_locks.c???????? |? 9 ++++++
> ?4 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 536bcd2..2498797 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -59,8 +59,18 @@ _try_lottery:
> ?	/* Jump to relocation wait loop if we don't get relocation lottery */
> ?	lla	a6, _boot_lottery
> ?	li	a7, BOOT_LOTTERY_ACQUIRED
> +#ifdef __riscv_atomic
> ?	amoswap.w a6, a7, (a6)
> ?	bnez	a6, _wait_for_boot_hart
> +#elif __riscv_zalrsc
> +_sc_fail:
> +	lr.w	t0, (a6)
> +	sc.w	t1, a7, (a6)
> +	bnez	t1, _sc_fail
> +	bnez	t0, _wait_for_boot_hart
> +#else
> +#error "need a or zalrsc"
> +#endif
> ?
> ?	/* relocate the global table content */
> ?	li	t0, FW_TEXT_START	/* link start */
> diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
> index 7a2ac12..7d25e07 100644
> --- a/firmware/payloads/test_head.S
> +++ b/firmware/payloads/test_head.S
> @@ -30,7 +30,18 @@ _start:
> ?	/* Pick one hart to run the main boot sequence */
> ?	lla	a3, _hart_lottery
> ?	li	a2, 1
> +#ifdef __riscv_atomic
> ?	amoadd.w a3, a2, (a3)
> +#elif __riscv_zalrsc
> +_sc_fail:
> +	lr.w	t0, (a3)
> +	addw	t1, t0, a2
> +	sc.w	t1, t1, (a3)
> +	bnez	t1, _sc_fail
> +	move	a3, t0
> +#else
> +#error "need a or zalrsc"
> +#endif
> ?	bnez	a3, _start_hang
> ?
> ?	/* Save a0 and a1 */
> diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
> index 32cf3f0..df16a2e 100644
> --- a/lib/sbi/riscv_atomic.c
> +++ b/lib/sbi/riscv_atomic.c
> @@ -12,7 +12,7 @@
> ?#include <sbi/riscv_atomic.h>
> ?#include <sbi/riscv_barrier.h>
> ?
> -#ifndef __riscv_atomic
> +#if !defined(__riscv_atomic) && !defined(__riscv_zalrsc)
> ?#error "opensbi strongly relies on the A extension of RISC-V"
> ?#endif
> ?
> @@ -31,6 +31,7 @@ void atomic_write(atomic_t *atom, long value)
> ?
> ?long atomic_add_return(atomic_t *atom, long value)
> ?{
> +#ifdef __riscv_atomic
> ?	long ret;
> ?#if __SIZEOF_LONG__ == 4
> ?	__asm__ __volatile__("	amoadd.w.aqrl? %1, %2, %0"
> @@ -43,6 +44,29 @@ long atomic_add_return(atomic_t *atom, long value)
> ?			???? : "r"(value)
> ?			???? : "memory");
> ?#endif
> +#elif __riscv_zalrsc
> +	long ret, temp;
> +#if __SIZEOF_LONG__ == 4
> +	__asm__ __volatile__("1:lr.w.aqrl	%1,%0\n"
> +			???? "? addw	%2,%1,%3\n"
> +			???? "? sc.w.aqrl	%2,%2,%0\n"
> +			???? "? bnez	%2,1b"
> +			???? : "+A"(atom->counter), "=&r"(ret), "=&r"(temp)
> +			???? : "r"(value)
> +			???? : "memory");
> +#elif __SIZEOF_LONG__ == 8
> +	__asm__ __volatile__("1:lr.d.aqrl	%1,%0\n"
> +			???? "? add	%2,%1,%3\n"
> +			???? "? sc.d.aqrl	%2,%2,%0\n"
> +			???? "? bnez	%2,1b"
> +			???? : "+A"(atom->counter), "=&r"(ret), "=&r"(temp)
> +			???? : "r"(value)
> +			???? : "memory");
> +#endif
> +#else
> +#error "need a or zalrsc"
> +#endif
> +
> ?	return ret + value;
> ?}
> ?
> @@ -51,6 +75,7 @@ long atomic_sub_return(atomic_t *atom, long value)
> ?	return atomic_add_return(atom, -value);
> ?}
> ?
> +#ifdef __riscv_atomic
> ?#define __axchg(ptr, new, size)							\
> ?	({									\
> ?		__typeof__(ptr) __ptr = (ptr);					\
> @@ -76,6 +101,39 @@ long atomic_sub_return(atomic_t *atom, long value)
> ?		}								\
> ?		__ret;								\
> ?	})
> +#elif __riscv_zalrsc
> +#define __axchg(ptr, new, size)							\
> +	({									\
> +		__typeof__(ptr) __ptr = (ptr);					\
> +		__typeof__(new) __new = (new);					\
> +		__typeof__(*(ptr)) __ret, __temp;					\
> +		switch (size) {							\
> +		case 4:								\
> +			__asm__ __volatile__ (					\
> +				"1:	lr.w.aqrl %0, %1\n"			\
> +				"	sc.w.aqrl %2, %3, %1\n"			\
> +				"	bnez	? %2, 1b\n"			\
> +				: "=&r" (__ret), "+A" (*__ptr), "=&r" (__temp)	\
> +				: "r" (__new)					\
> +				: "memory");					\
> +			break;							\
> +		case 8:								\
> +			__asm__ __volatile__ (					\
> +				"1:	lr.d.aqrl %0, %1\n"			\
> +				"	sc.d.aqrl %2, %3, %1\n"			\
> +				"	bnez	? %2, 1b\n"			\
> +				: "=&r" (__ret), "+A" (*__ptr), "=&r" (__temp)	\
> +				: "r" (__new)					\
> +				: "memory");					\
> +			break;							\
> +		default:							\
> +			break;							\
> +		}								\
> +		__ret;								\
> +	})
> +#else
> +#error "need a or zalrsc"
> +#endif
> ?
> ?#define axchg(ptr, x)								\
> ?	({									\
> diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
> index acab776..41e8fab 100644
> --- a/lib/sbi/riscv_locks.c
> +++ b/lib/sbi/riscv_locks.c
> @@ -53,7 +53,16 @@ void spin_lock(spinlock_t *lock)
> ?
> ?	__asm__ __volatile__(
> ?		/* Atomically increment the next ticket. */
> +#ifdef __riscv_atomic
> ?		"	amoadd.w.aqrl	%0, %4, %3\n"
> +#elif __riscv_zalrsc
> +		"3:	lr.w.aqrl	%0, %3\n"
> +		"	addw	%1, %0, %4\n"
> +		"	sc.w.aqrl	%1, %1, %3\n"
> +		"	bnez	%1, 3b\n"
> +#else
> +#error "need a or zalrsc"
> +#endif
> ?
> ?		/* Did we get the lock? */
> ?		"	srli	%1, %0, %6\n"
> -- 
> 2.47.1
> 
> 


