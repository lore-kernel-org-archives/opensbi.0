From: Kaiwen Xue <kaiwenx@rivosinc.com>
Date: Thu, 20 Jul 2023 14:07:02 -0700
Subject: [PATCH 1/1] lib: sbi: Add support for smcntrpmf
In-Reply-To: <cover.1689633697.git.kaiwenx@rivosinc.com>
References: <cover.1689633697.git.kaiwenx@rivosinc.com>
Message-ID: <de7cdbbee757929a84a11b86a00eb0aa82eaaf19.1689633697.git.kaiwenx@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds the support for ISA extension smcntrpmf. When some inhibit flags
are set by a lower privilege mode for new CSRs added by smcntrpmf, OpenSBI
sets the appropriate values correspondingly.

Signed-off-by: Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 include/sbi/riscv_encoding.h |  4 ++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/riscv_asm.c          | 12 +++++++++++
 lib/sbi/sbi_hart.c           | 11 ++++++++++
 lib/sbi/sbi_pmu.c            | 42 ++++++++++++++++++++++++++++++++++--
 5 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 50071ad..f09a89a 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -602,6 +602,8 @@
 
 /* Machine Counter Setup */
 #define CSR_MCOUNTINHIBIT		0x320
+#define CSR_MCYCLECFG			0x321
+#define CSR_MINSTRETCFG			0x322
 #define CSR_MHPMEVENT3			0x323
 #define CSR_MHPMEVENT4			0x324
 #define CSR_MHPMEVENT5			0x325
@@ -633,6 +635,8 @@
 #define CSR_MHPMEVENT31			0x33f
 
 /* For RV32 */
+#define CSR_MCYCLECFGH			0x721
+#define CSR_MINSTRETCFGH		0x722
 #define CSR_MHPMEVENT3H			0x723
 #define CSR_MHPMEVENT4H			0x724
 #define CSR_MHPMEVENT5H			0x725
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index c150b7e..4f9e146 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -40,6 +40,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZICNTR,
 	/** HART has Zihpm extension */
 	SBI_HART_EXT_ZIHPM,
+	/** Hart has Smcntrpmf extension */
+	SBI_HART_EXT_SMCNTRPMF,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 881dea3..05b8c7c 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -128,6 +128,8 @@ unsigned long csr_read_num(int csr_num)
 	switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
 	switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
 	switchcase_csr_read(CSR_MCOUNTINHIBIT, ret)
+	switchcase_csr_read(CSR_MCYCLECFG, ret)
+	switchcase_csr_read(CSR_MINSTRETCFG, ret)
 	switchcase_csr_read(CSR_MHPMEVENT3, ret)
 	switchcase_csr_read_4(CSR_MHPMEVENT4, ret)
 	switchcase_csr_read_8(CSR_MHPMEVENT8, ret)
@@ -139,6 +141,12 @@ unsigned long csr_read_num(int csr_num)
 	switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
 	switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
 	switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
+	/**
+	 * The CSR range M[CYCLE, INSTRET]CFGH are available only if smcntrpmf
+	 * extension is present. The caller must ensure that.
+	 */
+	switchcase_csr_read(CSR_MCYCLECFGH, ret)
+	switchcase_csr_read(CSR_MINSTRETCFGH, ret)
 	/**
 	 * The CSR range MHPMEVENT[3-16]H are available only if sscofpmf
 	 * extension is present. The caller must ensure that.
@@ -206,12 +214,16 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_4(CSR_MHPMCOUNTER4H, val)
 	switchcase_csr_write_8(CSR_MHPMCOUNTER8H, val)
 	switchcase_csr_write_16(CSR_MHPMCOUNTER16H, val)
+	switchcase_csr_write(CSR_MCYCLECFGH, val)
+	switchcase_csr_write(CSR_MINSTRETCFGH, val)
 	switchcase_csr_write(CSR_MHPMEVENT3H, val)
 	switchcase_csr_write_4(CSR_MHPMEVENT4H, val)
 	switchcase_csr_write_8(CSR_MHPMEVENT8H, val)
 	switchcase_csr_write_16(CSR_MHPMEVENT16H, val)
 #endif
 	switchcase_csr_write(CSR_MCOUNTINHIBIT, val)
+	switchcase_csr_write(CSR_MCYCLECFG, val)
+	switchcase_csr_write(CSR_MINSTRETCFG, val)
 	switchcase_csr_write(CSR_MHPMEVENT3, val)
 	switchcase_csr_write_4(CSR_MHPMEVENT4, val)
 	switchcase_csr_write_8(CSR_MHPMEVENT8, val)
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 7b5f380..aadb53c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -597,6 +597,9 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMEPMP:
 		estr = "smepmp";
 		break;
+	case SBI_HART_EXT_SMCNTRPMF:
+		estr = "smcntrpmf";
+		break;
 	default:
 		break;
 	}
@@ -844,6 +847,14 @@ __mhpm_skip:
 					SBI_HART_EXT_SMSTATEEN, true);
 	}
 
+	/* Detect if hart supports smcntrpmf */
+	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
+		csr_read_allowed(CSR_MCYCLECFG, (unsigned long)&trap);
+		if (!trap.cause)
+			__sbi_hart_update_extension(hfeatures,
+					SBI_HART_EXT_SMCNTRPMF, true);
+	}
+
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
 					  hfeatures);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 7213a53..a82f694 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -609,6 +609,44 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 	return 0;
 }
 
+static int pmu_fixed_ctr_update_inhibit_bits(int fixed_ctr, unsigned long flags)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	uint64_t cfg_val = 0, cfg_csr_no;
+#if __riscv_xlen == 32
+	uint64_t cfgh_csr_no;
+#endif
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCNTRPMF))
+		return fixed_ctr;
+
+	switch (fixed_ctr) {
+	case 0:
+		cfg_csr_no = CSR_MCYCLECFG;
+#if __riscv_xlen == 32
+		cfgh_csr_no = CSR_MCYCLECFGH;
+#endif
+		break;
+	case 2:
+		cfg_csr_no = CSR_MINSTRETCFG;
+#if __riscv_xlen == 32
+		cfgh_csr_no = CSR_MINSTRETCFGH;
+#endif
+		break;
+	default:
+		return SBI_EFAIL;
+	}
+
+	cfg_val |= MHPMEVENT_MINH;
+	pmu_update_inhibit_flags(flags, &cfg_val);
+#if __riscv_xlen == 32
+	csr_write_num(cfg_csr_no, cfg_val & 0xFFFFFFFF);
+	csr_write_num(cfgh_csr_no, cfg_val >> BITS_PER_LONG);
+#else
+	csr_write_num(cfg_csr_no, cfg_val);
+#endif
+	return fixed_ctr;
+}
+
 static int pmu_ctr_find_fixed_fw(unsigned long evt_idx_code)
 {
 	/* Non-programmables counters are enabled always. No need to do lookup */
@@ -641,7 +679,7 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 	fixed_ctr = pmu_ctr_find_fixed_fw(event_idx);
 	if (fixed_ctr >= 0 &&
 	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		return fixed_ctr;
+		return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
 		mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
@@ -684,7 +722,7 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 		 * Return the fixed counter as they are mandatory anyways.
 		 */
 		if (fixed_ctr >= 0)
-			return fixed_ctr;
+			return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
 		else
 			return SBI_EFAIL;
 	}
-- 
2.41.0


