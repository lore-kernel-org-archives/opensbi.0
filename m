From: Zhang Runmin <runmin.zhang@ingenic.com>
Date: Wed, 14 Aug 2024 21:23:01 +0800
Subject: [PATCHv3] lib: Delete redundant `ulong`
In-Reply-To: <6c54d5461bc49b803c8d00552c56f46d2bb77744.1723640100.git.runmin.zhang@ingenic.com>
References: <6c54d5461bc49b803c8d00552c56f46d2bb77744.1723640100.git.runmin.zhang@ingenic.com>
Message-ID: <6ec68ac059535474f9bb04a7f5496bd2cf04a9c9.1723641333.git.runmin.zhang@ingenic.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Zhang RunMin <runmin.zhang@ingenic.com>

In `csr_read_allowed` and `csr_write_allowed` macros, has already
converted second param to `ulong`. So delete redundant `ulong`
where uses csr_read/write_allowed macros.

Signed-off-by: Zhang RunMin <runmin.zhang@ingenic.com>
---
v3:
- Fix the formatting problems caused by deleting ulong
v2:
- Fix similar problems in:
  lib/sbi/sbi_hart.c
  lib/utils/irqchip/imsic.c
v1:
- Delete redundant ulong in:
  lib/sbi/sbi_dbtr.c
---
 lib/sbi/sbi_dbtr.c        |  9 +++++----
 lib/sbi/sbi_hart.c        | 28 ++++++++++++++--------------
 lib/utils/irqchip/imsic.c |  2 +-
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 27a8b91..60c37b4 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -167,11 +167,12 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 		goto _probed;
 
 	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-		csr_write_allowed(CSR_TSELECT, (ulong)&trap, i);
+		// CSR_TESLECT 0x7a0
+		csr_write_allowed(CSR_TSELECT, &trap, i);
 		if (trap.cause)
 			break;
 
-		val = csr_read_allowed(CSR_TSELECT, (ulong)&trap);
+		val = csr_read_allowed(CSR_TSELECT, &trap);
 		if (trap.cause)
 			break;
 
@@ -182,7 +183,7 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 		if (val != i)
 			break;
 
-		val = csr_read_allowed(CSR_TINFO, (ulong)&trap);
+		val = csr_read_allowed(CSR_TINFO, &trap);
 		if (trap.cause) {
 			/*
 			 * If reading tinfo caused an exception, the
@@ -190,7 +191,7 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 			 * type.
 			 */
 			tdata1 = csr_read_allowed(CSR_TDATA1,
-						  (ulong)&trap);
+						  &trap);
 			if (trap.cause)
 				break;
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c366701..cc364fa 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -723,13 +723,13 @@ static unsigned long hart_pmp_get_allowed_addr(void)
 	unsigned long val = 0;
 	struct sbi_trap_info trap = {0};
 
-	csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
+	csr_write_allowed(CSR_PMPCFG0, &trap, 0);
 	if (trap.cause)
 		return 0;
 
-	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);
+	csr_write_allowed(CSR_PMPADDR0, &trap, PMP_ADDR_MASK);
 	if (!trap.cause) {
-		val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
+		val = csr_read_allowed(CSR_PMPADDR0, &trap);
 		if (trap.cause)
 			val = 0;
 	}
@@ -747,17 +747,17 @@ static int hart_mhpm_get_allowed_bits(void)
 	 * It is assumed that platforms will implement same number of bits for
 	 * all the performance counters including mcycle/minstret.
 	 */
-	csr_write_allowed(CSR_MHPMCOUNTER3, (ulong)&trap, val);
+	csr_write_allowed(CSR_MHPMCOUNTER3, &trap, val);
 	if (!trap.cause) {
-		val = csr_read_allowed(CSR_MHPMCOUNTER3, (ulong)&trap);
+		val = csr_read_allowed(CSR_MHPMCOUNTER3, &trap);
 		if (trap.cause)
 			return 0;
 	}
 	num_bits = sbi_fls(val) + 1;
 #if __riscv_xlen == 32
-	csr_write_allowed(CSR_MHPMCOUNTER3H, (ulong)&trap, val);
+	csr_write_allowed(CSR_MHPMCOUNTER3H, &trap, val);
 	if (!trap.cause) {
-		val = csr_read_allowed(CSR_MHPMCOUNTER3H, (ulong)&trap);
+		val = csr_read_allowed(CSR_MHPMCOUNTER3H, &trap);
 		if (trap.cause)
 			return num_bits;
 	}
@@ -788,9 +788,9 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
 #define __check_hpm_csr(__csr, __mask) 					  \
-	oldval = csr_read_allowed(__csr, (ulong)&trap);			  \
+	oldval = csr_read_allowed(__csr, &trap);			  \
 	if (!trap.cause) {						  \
-		csr_write_allowed(__csr, (ulong)&trap, 1UL);		  \
+		csr_write_allowed(__csr, &trap, 1UL);			  \
 		if (!trap.cause && csr_swap(__csr, oldval) == 1UL) {	  \
 			(hfeatures->__mask) |= 1 << (__csr - CSR_MCYCLE); \
 		}							  \
@@ -809,13 +809,13 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	__check_hpm_csr_8(__csr + 0, __mask) 			  \
 	__check_hpm_csr_8(__csr + 8, __mask)
 
-#define __check_csr(__csr, __rdonly, __wrval, __field, __skip)	\
-	oldval = csr_read_allowed(__csr, (ulong)&trap);			\
+#define __check_csr(__csr, __rdonly, __wrval, __field, __skip)		\
+	oldval = csr_read_allowed(__csr, &trap);			\
 	if (!trap.cause) {						\
 		if (__rdonly) {						\
 			(hfeatures->__field)++;				\
 		} else {						\
-			csr_write_allowed(__csr, (ulong)&trap, __wrval);\
+			csr_write_allowed(__csr, &trap, __wrval);	\
 			if (!trap.cause) {				\
 				if (csr_swap(__csr, oldval) == __wrval)	\
 					(hfeatures->__field)++;		\
@@ -880,7 +880,7 @@ __pmp_skip:
 
 
 #define __check_priv(__csr, __base_priv, __priv)			\
-	val = csr_read_allowed(__csr, (ulong)&trap);			\
+	val = csr_read_allowed(__csr, &trap);				\
 	if (!trap.cause && (hfeatures->priv_version >= __base_priv)) {	\
 		hfeatures->priv_version = __priv;			\
 	}
@@ -899,7 +899,7 @@ __pmp_skip:
 
 #define __check_ext_csr(__base_priv, __csr, __ext)			\
 	if (hfeatures->priv_version >= __base_priv) {			\
-		csr_read_allowed(__csr, (ulong)&trap);			\
+		csr_read_allowed(__csr, &trap);				\
 		if (!trap.cause)					\
 			__sbi_hart_update_extension(hfeatures,		\
 						    __ext, true);	\
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 7d6993e..bac72d2 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -241,7 +241,7 @@ void imsic_local_irqchip_init(void)
 	 */
 
 	/* If Smaia not available then do nothing */
-	csr_read_allowed(CSR_MTOPI, (ulong)&trap);
+	csr_read_allowed(CSR_MTOPI, &trap);
 	if (trap.cause)
 		return;
 
-- 
2.25.1


