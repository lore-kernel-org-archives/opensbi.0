From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:33 -0700
Subject: [PATCH v2 04/15] lib: sbi: Detect number of bits implemented in
 mhpmcounter
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-5-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V privilege specification allows the implementation to have less
than 64 bits.

Add a function to detect the number of implemented bits in mhpmcounter
dynamically at runtime.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_hart.h |  1 +
 lib/sbi/sbi_hart.c     | 49 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 9e317c52008c..0c18ef9325b2 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -44,6 +44,7 @@ void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
 unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
+unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
 bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
 void sbi_hart_get_features_str(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e5e5781ff412..0d5b7b8d3509 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -33,6 +33,7 @@ struct hart_features {
 	unsigned int pmp_addr_bits;
 	unsigned long pmp_gran;
 	unsigned int mhpm_count;
+	unsigned int mhpm_bits;
 };
 static unsigned long hart_features_offset;
 
@@ -177,6 +178,14 @@ unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
 	return hfeatures->pmp_addr_bits;
 }
 
+unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
+{
+	struct hart_features *hfeatures =
+			sbi_scratch_offset_ptr(scratch, hart_features_offset);
+
+	return hfeatures->mhpm_bits;
+}
+
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
 	struct sbi_domain_memregion *reg;
@@ -330,6 +339,37 @@ static unsigned long hart_pmp_get_allowed_addr(void)
 	return val;
 }
 
+static int hart_pmu_get_allowed_bits(void)
+{
+	unsigned long val = ~(0UL);
+	struct sbi_trap_info trap = {0};
+	int num_bits = 0;
+
+	/**
+	 * It is assumed that platforms will implement same number of bits for
+	 * all the performance counters including mcycle/minstret.
+	 */
+	csr_write_allowed(CSR_MHPMCOUNTER3, (ulong)&trap, val);
+	if (!trap.cause) {
+		val = csr_read_allowed(CSR_MHPMCOUNTER3, (ulong)&trap);
+		if (trap.cause)
+			return 0;
+	}
+	num_bits = __fls(val) + 1;
+#if __riscv_xlen == 32
+	csr_write_allowed(CSR_MHPMCOUNTER3H, (ulong)&trap, val);
+	if (!trap.cause) {
+		val = csr_read_allowed(CSR_MHPMCOUNTER3H, (ulong)&trap);
+		if (trap.cause)
+			return num_bits;
+	}
+	num_bits += __fls(val) + 1;
+
+#endif
+
+	return num_bits;
+}
+
 static void hart_detect_features(struct sbi_scratch *scratch)
 {
 	struct sbi_trap_info trap = {0};
@@ -394,10 +434,19 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 __pmp_skip:
 
 	/* Detect number of MHPM counters */
+	trap.cause = 0;
 	__check_csr(CSR_MHPMCOUNTER3, 0, 1UL, mhpm_count, __mhpm_skip);
+	hfeatures->mhpm_bits = hart_pmu_get_allowed_bits();
+
 	__check_csr_4(CSR_MHPMCOUNTER4, 0, 1UL, mhpm_count, __mhpm_skip);
 	__check_csr_8(CSR_MHPMCOUNTER8, 0, 1UL, mhpm_count, __mhpm_skip);
 	__check_csr_16(CSR_MHPMCOUNTER16, 0, 1UL, mhpm_count, __mhpm_skip);
+
+	/**
+	 * No need to check for MHPMCOUNTERH for RV32 as they are expected to be
+	 * implemented if MHPMCOUNTER is implemented.
+	 */
+
 __mhpm_skip:
 
 #undef __check_csr_64
-- 
2.25.1


