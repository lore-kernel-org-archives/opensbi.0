From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 11 Aug 2023 08:24:43 +0800
Subject: [PATCH] lib: sbi_pmu: remove mhpm_count field in hart feature
Message-ID: <IA1PR20MB49535E7470BE1E4AD933B2F7BB10A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After supporting noncontigous hpm event and counters in opensbi, the
number of hpm counters can be calculated by the mhpm_mask. So this field
is unnecessary and can be removed to save some space.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
This patch needs the V2 patch which fixup D1 mhpm_mask.
---
 include/sbi/sbi_bitops.h  | 16 ++++++++++++++
 include/sbi/sbi_hart.h    |  2 --
 lib/sbi/sbi_emulate_csr.c |  2 +-
 lib/sbi/sbi_hart.c        | 46 +++++++++++++++------------------------
 lib/sbi/sbi_init.c        |  5 ++---
 5 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
index 2e08947..48a2090 100644
--- a/include/sbi/sbi_bitops.h
+++ b/include/sbi/sbi_bitops.h
@@ -112,6 +112,22 @@ static inline unsigned long sbi_fls(unsigned long word)
 	return num;
 }

+/**
+ * sbi_popcount - find the number of set bit in a long word
+ * @word: the word to search
+ */
+static inline unsigned long sbi_popcount(unsigned long word)
+{
+	unsigned long count = 0;
+
+	while (word) {
+		word &= word - 1;
+		count++;
+	}
+
+	return count;
+}
+
 #define for_each_set_bit(bit, addr, size) \
 	for ((bit) = find_first_bit((addr), (size));		\
 	     (bit) < (size);					\
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 1310198..3a78266 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -67,7 +67,6 @@ struct sbi_hart_features {
 	unsigned int pmp_count;
 	unsigned int pmp_addr_bits;
 	unsigned long pmp_gran;
-	unsigned int mhpm_count;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
 };
@@ -83,7 +82,6 @@ static inline ulong sbi_hart_expected_trap_addr(void)
 	return (ulong)sbi_hart_expected_trap;
 }

-unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
 void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
 			      const char *prefix, const char *suffix);
diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index da81165..5f3b111 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -109,7 +109,7 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,

 #define switchcase_hpm(__uref, __mref, __csr)				\
 	case __csr:							\
-		if ((sbi_hart_mhpm_count(scratch) + 3) <= (__csr - __uref))\
+		if (sbi_hart_mhpm_mask(scratch) & (1 << (__csr - __uref)))\
 			return SBI_ENOTSUPP;				\
 		if (!hpm_allowed(__csr - __uref, prev_mode, virt))	\
 			return SBI_ENOTSUPP;				\
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 252f33d..6179594 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -253,14 +253,6 @@ unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_mask;
 }

-unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
-{
-	struct sbi_hart_features *hfeatures =
-			sbi_scratch_offset_ptr(scratch, hart_features_offset);
-
-	return hfeatures->mhpm_count;
-}
-
 unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
@@ -723,31 +715,29 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	/* Clear hart features */
 	hfeatures->extensions = 0;
 	hfeatures->pmp_count = 0;
-	hfeatures->mhpm_count = 0;
 	hfeatures->mhpm_mask = 0;

-#define __check_hpm_csr(__csr, __count, __mask) 			  \
+#define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, (ulong)&trap);			  \
 	if (!trap.cause) {						  \
 		csr_write_allowed(__csr, (ulong)&trap, 1UL);		  \
 		if (!trap.cause && csr_swap(__csr, oldval) == 1UL) {	  \
-			(hfeatures->__count)++;				  \
 			(hfeatures->__mask) |= 1 << (__csr - CSR_MCYCLE); \
 		}							  \
 	}

-#define __check_hpm_csr_2(__csr, __count, __mask)	 		  \
-	__check_hpm_csr(__csr + 0, __count, __mask)	 		  \
-	__check_hpm_csr(__csr + 1, __count, __mask)
-#define __check_hpm_csr_4(__csr, __count, __mask)	 		  \
-	__check_hpm_csr_2(__csr + 0, __count, __mask) 			  \
-	__check_hpm_csr_2(__csr + 2, __count, __mask)
-#define __check_hpm_csr_8(__csr, __count, __mask)	 		  \
-	__check_hpm_csr_4(__csr + 0, __count, __mask) 			  \
-	__check_hpm_csr_4(__csr + 4, __count, __mask)
-#define __check_hpm_csr_16(__csr, __count, __mask)	 		  \
-	__check_hpm_csr_8(__csr + 0, __count, __mask) 			  \
-	__check_hpm_csr_8(__csr + 8, __count, __mask)
+#define __check_hpm_csr_2(__csr, __mask)	 		  \
+	__check_hpm_csr(__csr + 0, __mask)	 		  \
+	__check_hpm_csr(__csr + 1, __mask)
+#define __check_hpm_csr_4(__csr, __mask)	 		  \
+	__check_hpm_csr_2(__csr + 0, __mask) 			  \
+	__check_hpm_csr_2(__csr + 2, __mask)
+#define __check_hpm_csr_8(__csr, __mask)	 		  \
+	__check_hpm_csr_4(__csr + 0, __mask) 			  \
+	__check_hpm_csr_4(__csr + 4, __mask)
+#define __check_hpm_csr_16(__csr, __mask)	 		  \
+	__check_hpm_csr_8(__csr + 0, __mask) 			  \
+	__check_hpm_csr_8(__csr + 8, __mask)

 #define __check_csr(__csr, __rdonly, __wrval, __field, __skip)	\
 	oldval = csr_read_allowed(__csr, (ulong)&trap);			\
@@ -800,11 +790,11 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	}
 __pmp_skip:
 	/* Detect number of MHPM counters */
-	__check_hpm_csr(CSR_MHPMCOUNTER3, mhpm_count, mhpm_mask);
+	__check_hpm_csr(CSR_MHPMCOUNTER3, mhpm_mask);
 	hfeatures->mhpm_bits = hart_mhpm_get_allowed_bits();
-	__check_hpm_csr_4(CSR_MHPMCOUNTER4, mhpm_count, mhpm_mask);
-	__check_hpm_csr_8(CSR_MHPMCOUNTER8, mhpm_count, mhpm_mask);
-	__check_hpm_csr_16(CSR_MHPMCOUNTER16, mhpm_count, mhpm_mask);
+	__check_hpm_csr_4(CSR_MHPMCOUNTER4, mhpm_mask);
+	__check_hpm_csr_8(CSR_MHPMCOUNTER8, mhpm_mask);
+	__check_hpm_csr_16(CSR_MHPMCOUNTER16, mhpm_mask);

 	/**
 	 * No need to check for MHPMCOUNTERH for RV32 as they are expected to be
@@ -879,7 +869,7 @@ __pmp_skip:
 		return rc;

 	/* Extensions implied by other extensions and features */
-	if (hfeatures->mhpm_count)
+	if (hfeatures->mhpm_mask)
 		__sbi_hart_update_extension(hfeatures,
 					SBI_HART_EXT_ZIHPM, true);

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index eae4f28..252b41a 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -180,9 +180,8 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 		   sbi_hart_pmp_granularity(scratch));
 	sbi_printf("Boot HART PMP Address Bits: %d\n",
 		   sbi_hart_pmp_addrbits(scratch));
-	sbi_printf("Boot HART MHPM Count      : %d\n",
-		   sbi_hart_mhpm_count(scratch));
-	sbi_printf("Boot HART MHPM Mask       : 0x%x\n",
+	sbi_printf("Boot HART MHPM Info       : %lu (0x%08x)\n",
+		   sbi_popcount(sbi_hart_mhpm_mask(scratch)),
 		   sbi_hart_mhpm_mask(scratch));
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
 }
--
2.41.0


