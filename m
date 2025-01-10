From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu,  9 Jan 2025 16:24:47 -0800
Subject: [PATCH] Add RISCV_ISA_ZALRSC_ONLY to rewrite amo instructions via lr and sc
Message-ID: <20250110002447.2758-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platforms implement lr and sc in hardware, and emulate amo
instructions via the exception handler. To get better performance,
we use lr and sc only, when the config is defined.
---
 firmware/fw_base.S       |  8 ++++++
 lib/sbi/riscv_atomic.c   | 54 ++++++++++++++++++++++++++++++++++++++++
 lib/sbi/riscv_locks.c    |  7 ++++++
 platform/generic/Kconfig |  4 +++
 4 files changed, 73 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index d027e5e..835d64a 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -59,8 +59,16 @@ _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
 	lla	a6, _boot_lottery
 	li	a7, BOOT_LOTTERY_ACQUIRED
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
 	amoswap.w a6, a7, (a6)
 	bnez	a6, _wait_for_boot_hart
+#else
+_sc_fail:
+	lr.w	t0, (a6)
+	sc.w	t1, a7, (a6)
+	bnez	t1, _sc_fail
+	bnez	t0, _wait_for_boot_hart
+#endif
 
 	/* relocate the global table content */
 	li	t0, FW_TEXT_START	/* link start */
diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
index 32cf3f0..c5f47eb 100644
--- a/lib/sbi/riscv_atomic.c
+++ b/lib/sbi/riscv_atomic.c
@@ -31,6 +31,7 @@ void atomic_write(atomic_t *atom, long value)
 
 long atomic_add_return(atomic_t *atom, long value)
 {
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
 	long ret;
 #if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("	amoadd.w.aqrl  %1, %2, %0"
@@ -43,6 +44,27 @@ long atomic_add_return(atomic_t *atom, long value)
 			     : "r"(value)
 			     : "memory");
 #endif
+#else
+	long ret, temp;
+#if __SIZEOF_LONG__ == 4
+	__asm__ __volatile__("1:lr.w.aqrl	%1,%0\n"
+			     "  add	%2,%1,%3\n"
+			     "  sc.w.aqrl	%2,%2,%0\n"
+			     "  bnez	%2,1b"
+			     : "+A"(atom->counter), "=&r"(ret), "=&r"(temp)
+			     : "r"(value)
+			     : "memory");
+#elif __SIZEOF_LONG__ == 8
+	__asm__ __volatile__("1:lr.d.aqrl	%1,%0\n"
+			     "  add	%2,%1,%3\n"
+			     "  sc.d.aqrl	%2,%2,%0\n"
+			     "  bnez	%2,1b"
+			     : "+A"(atom->counter), "=&r"(ret), "=&r"(temp)
+			     : "r"(value)
+			     : "memory");
+#endif
+#endif
+
 	return ret + value;
 }
 
@@ -51,6 +73,7 @@ long atomic_sub_return(atomic_t *atom, long value)
 	return atomic_add_return(atom, -value);
 }
 
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
 #define __axchg(ptr, new, size)							\
 	({									\
 		__typeof__(ptr) __ptr = (ptr);					\
@@ -76,6 +99,37 @@ long atomic_sub_return(atomic_t *atom, long value)
 		}								\
 		__ret;								\
 	})
+#else
+#define __axchg(ptr, new, size)							\
+	({									\
+		__typeof__(ptr) __ptr = (ptr);					\
+		__typeof__(new) __new = (new);					\
+		__typeof__(*(ptr)) __ret, __temp;					\
+		switch (size) {							\
+		case 4:								\
+			__asm__ __volatile__ (					\
+				"1:	lr.w.aqrl %0, %1\n"			\
+				"	sc.w.aqrl %2, %3, %1\n"			\
+				"	bnez	  %2, 1b\n"			\
+				: "=&r" (__ret), "+A" (*__ptr), "=&r" (__temp)	\
+				: "r" (__new)					\
+				: "memory");					\
+			break;							\
+		case 8:								\
+			__asm__ __volatile__ (					\
+				"1:	lr.d.aqrl %0, %1\n"			\
+				"	sc.d.aqrl %2, %3, %1\n"			\
+				"	bnez	  %2, 1b\n"			\
+				: "=&r" (__ret), "+A" (*__ptr), "=&r" (__temp)	\
+				: "r" (__new)					\
+				: "memory");					\
+			break;							\
+		default:							\
+			break;							\
+		}								\
+		__ret;								\
+	})
+#endif
 
 #define axchg(ptr, x)								\
 	({									\
diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index acab776..11f87bf 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -53,7 +53,14 @@ void spin_lock(spinlock_t *lock)
 
 	__asm__ __volatile__(
 		/* Atomically increment the next ticket. */
+#ifndef CONFIG_RISCV_ISA_ZALRSC_ONLY
 		"	amoadd.w.aqrl	%0, %4, %3\n"
+#else
+		"3:	lr.w.aqrl	%0, %3\n"
+		"	add	%1, %0, %4\n"
+		"	sc.w.aqrl	%1, %1, %3\n"
+		"	bnez	%1, 3b\n"
+#endif
 
 		/* Did we get the lock? */
 		"	srli	%1, %0, %6\n"
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 688da3f..a5ecbd5 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -7,6 +7,10 @@ config PLATFORM_GENERIC
 	select FDT_PMU
 	default y
 
+config RISCV_ISA_ZALRSC_ONLY
+	bool "Use lr/sc only"
+	default n
+
 if PLATFORM_GENERIC
 
 config PLATFORM_GENERIC_NAME
-- 
2.47.1


