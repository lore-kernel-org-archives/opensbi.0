From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:20:04 +0200
Subject: [PATCH v2 5/5] lib: sbi_pmu: add t-head pmu support
In-Reply-To: <20220817112004.745776-1-heiko@sntech.de>
References: <20220817112004.745776-1-heiko@sntech.de>
Message-ID: <20220817112004.745776-6-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the T-HEAD C9XX cores being designed before or during ratification
of the SSCOFPMF extension, they implement a PMU extension that behaves
very similar but not equal to it by providing overflow interrupts though
in a slightly different registers format.

Use the presence of C9XX extension to adapt the pmu's behaviour
accordingly to enable the C9XX to leverage all the features the
SBI pmu interface provides.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 lib/sbi/sbi_hart.c | 15 +++++++++++++++
 lib/sbi/sbi_pmu.c  | 48 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 66bbc0b..c63c807 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_barrier.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/riscv_fp.h>
+#include <sbi/riscv_thead_c9xx.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
@@ -210,6 +211,8 @@ static int delegate_traps(struct sbi_scratch *scratch)
 	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		interrupts |= MIP_LCOFIP;
+	else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_THEAD_C9XX))
+		interrupts |= THEAD_C9XX_MIP_MOIP;
 
 	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
 		     (1U << CAUSE_USER_ECALL);
@@ -636,6 +639,18 @@ __mhpm_skip:
 #undef __check_csr_2
 #undef __check_csr
 
+	/**
+	 * On T-HEAD C9xx cores csr_swap on MHPMCOUNTERx behaves differently
+	 * which is a result of the csr_write not actually changing the value
+	 *@this time. Later on during pmu operation, setting MHPMCOUNTERx
+	 * values is possible, but so far it's unknown which setting changes
+	 * that. So for now override the settings statically.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_THEAD_C9XX)) {
+		hfeatures->mhpm_count = 29;
+		hfeatures->mhpm_bits = 64;
+	}
+
 	/* Detect if hart supports Priv v1.10 */
 	val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
 	if (!trap.cause)
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 3f5fd10..875c824 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -8,6 +8,7 @@
  */
 
 #include <sbi/riscv_asm.h>
+#include <sbi/riscv_thead_c9xx.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_hart.h>
@@ -244,6 +245,41 @@ int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32
 				    SBI_PMU_EVENT_RAW_IDX, cmap, select, select_mask);
 }
 
+static int pmu_ctr_enable_irq_hw_thead_c9xx(int ctr_idx)
+{
+	unsigned long val;
+	unsigned long mip_val;
+
+	if (ctr_idx >= SBI_PMU_HW_CTR_MAX)
+		return SBI_EFAIL;
+
+	mip_val = csr_read(CSR_MIP);
+	/**
+	 * Clear out the OF bit so that next interrupt can be enabled.
+	 * This should be done only when the corresponding overflow interrupt
+	 * bit is cleared. That indicates that software has already handled the
+	 * previous interrupts or the hardware yet to set an overflow interrupt.
+	 * Otherwise, there will be race conditions where we may clear the bit
+	 * the software is yet to handle the interrupt.
+	 */
+	if (!(mip_val & THEAD_C9XX_MIP_MOIP)) {
+		val = csr_read(THEAD_C9XX_CSR_MCOUNTEROF);
+		val &= ~(1 << ctr_idx);
+		csr_write(THEAD_C9XX_CSR_MCOUNTEROF, val);
+	}
+
+	/**
+	 * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
+	 * while the C9XX has designated enable bits.
+	 * So enable per-counter interrupt on C9xx here.
+	 */
+	val = csr_read(THEAD_C9XX_CSR_MCOUNTERINTEN);
+	val |= (1 << ctr_idx);
+	csr_write(THEAD_C9XX_CSR_MCOUNTERINTEN, val);
+
+	return 0;
+}
+
 static int pmu_ctr_enable_irq_hw(int ctr_idx)
 {
 	unsigned long mhpmevent_csr;
@@ -315,6 +351,9 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		pmu_ctr_enable_irq_hw(cidx);
+	else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_THEAD_C9XX))
+		pmu_ctr_enable_irq_hw_thead_c9xx(cidx);
+
 	csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
 
 skip_inhibit_update:
@@ -476,9 +515,16 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 	 * Always set the OVF bit(disable interrupts) and inhibit counting of
 	 * events in M-mode. The OVF bit should be enabled during the start call.
 	 */
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF)) {
 		mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
 				 MHPMEVENT_MINH | MHPMEVENT_OF;
+	} else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_THEAD_C9XX)) {
+		unsigned long val;
+
+		val = csr_read(THEAD_C9XX_CSR_MCOUNTERINTEN);
+		val &= ~(1 << ctr_idx);
+		csr_write(THEAD_C9XX_CSR_MCOUNTERINTEN, val);
+	}
 
 	/* Update the inhibit flags based on inhibit flags received from supervisor */
 	pmu_update_inhibit_flags(flags, &mhpmevent_val);
-- 
2.35.1


