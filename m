From: Xiang W <wxjstz@126.com>
Date: Thu,  1 Apr 2021 15:59:40 +0800
Subject: [PATCH] lib: fix csr detect support
Message-ID: <20210401075940.3538-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

csr_read_allowed/csr_read_allowed requires trap.case to detect the results,
but if no exception occurs, the value of trap.case will remain unchanged,
which makes the detection results unreliable. Add code to initialize
trap.case to 0.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_csr_detect.h | 3 +++
 lib/sbi/sbi_hart.c           | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_csr_detect.h b/include/sbi/sbi_csr_detect.h
index f294888..89ba294 100644
--- a/include/sbi/sbi_csr_detect.h
+++ b/include/sbi/sbi_csr_detect.h
@@ -12,6 +12,7 @@
 
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_trap.h>
 
 #define csr_read_allowed(csr_num, trap)					\
 	({								\
@@ -19,6 +20,7 @@
 	register ulong ttmp asm("a4");					\
 	register ulong mtvec = sbi_hart_expected_trap_addr();		\
 	register ulong ret = 0;						\
+	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
 		"add %[ttmp], %[tinfo], zero\n"				\
 		"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"	\
@@ -36,6 +38,7 @@
 	register ulong tinfo asm("a3") = (ulong)trap;			\
 	register ulong ttmp asm("a4");					\
 	register ulong mtvec = sbi_hart_expected_trap_addr();		\
+	((struct sbi_trap_info *)(trap))->cause = 0;			\
 	asm volatile(							\
 		"add %[ttmp], %[tinfo], zero\n"				\
 		"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"	\
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d91b08c..de59b14 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -406,7 +406,6 @@ __mhpm_skip:
 #undef __check_csr
 
 	/* Detect if hart supports SCOUNTEREN feature */
-	trap.cause = 0;
 	val = csr_read_allowed(CSR_SCOUNTEREN, (unsigned long)&trap);
 	if (!trap.cause) {
 		csr_write_allowed(CSR_SCOUNTEREN, (unsigned long)&trap, val);
@@ -415,7 +414,6 @@ __mhpm_skip:
 	}
 
 	/* Detect if hart supports MCOUNTEREN feature */
-	trap.cause = 0;
 	val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
 	if (!trap.cause) {
 		csr_write_allowed(CSR_MCOUNTEREN, (unsigned long)&trap, val);
@@ -424,7 +422,6 @@ __mhpm_skip:
 	}
 
 	/* Detect if hart supports time CSR */
-	trap.cause = 0;
 	csr_read_allowed(CSR_TIME, (unsigned long)&trap);
 	if (!trap.cause)
 		hfeatures->features |= SBI_HART_HAS_TIME;
-- 
2.20.1


