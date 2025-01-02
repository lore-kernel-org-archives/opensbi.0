From: Clément Léger <cleger@rivosinc.com>
Date: Thu,  2 Jan 2025 14:39:10 +0100
Subject: [PATCH v5 1/6] lib: sbi: pmu: fix usage of sbi_pmu_irq_bit()
In-Reply-To: <20250102133916.413899-1-cleger@rivosinc.com>
References: <20250102133916.413899-1-cleger@rivosinc.com>
Message-ID: <20250102133916.413899-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While sbi_pmu_irq_bit() was used to delegate irq to S-mode, LCOFIP usage
was still hardcoded in various places. This led to change the returned
value of sbi_pmu_irq_bit() to be a bit number rather than a bit mask
since it returns an 'int' and we need to obtain the bit number itself to
handle it in the IRQs handlers. Add a similar function to return the
irq mask which can also be used where the mask is required rather than
the bit itself.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_pmu.h                         |  3 ++
 lib/sbi/sbi_hart.c                            |  2 +-
 lib/sbi/sbi_pmu.c                             | 42 ++++++++++++-------
 lib/sbi/sbi_trap.c                            | 15 ++++---
 .../generic/include/thead/c9xx_encoding.h     |  1 -
 platform/generic/thead/thead_c9xx_pmu.c       |  2 +-
 6 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 3649d476..c0e25f5a 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -114,6 +114,9 @@ void sbi_pmu_exit(struct sbi_scratch *scratch);
 /** Return the pmu irq bit depending on extension existence */
 int sbi_pmu_irq_bit(void);
 
+/** Return the pmu irq mask or 0 if the pmu overflow irq is not supported */
+unsigned long sbi_pmu_irq_mask(void);
+
 /**
  * Add the hardware event to counter mapping information. This should be called
  * from the platform code to update the mapping table.
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0451fcb5..8e2979b5 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -203,7 +203,7 @@ static int delegate_traps(struct sbi_scratch *scratch)
 
 	/* Send M-mode interrupts and most exceptions to S-mode */
 	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
-	interrupts |= sbi_pmu_irq_bit();
+	interrupts |= sbi_pmu_irq_mask();
 
 	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
 		     (1U << CAUSE_USER_ECALL);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 73ef0ca0..c6df45a7 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -309,10 +309,10 @@ int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32
 void sbi_pmu_ovf_irq()
 {
 	/*
-	 * We need to disable LCOFIP before returning to S-mode or we will loop
-	 * on LCOFIP being triggered
+	 * We need to disable the overflow irq before returning to S-mode or we will loop
+	 * on an irq being triggered
 	 */
-	csr_clear(CSR_MIE, MIP_LCOFIP);
+	csr_clear(CSR_MIE, sbi_pmu_irq_mask());
 	sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_PMU);
 }
 
@@ -344,7 +344,7 @@ static int pmu_ctr_enable_irq_hw(int ctr_idx)
 	 * Otherwise, there will be race conditions where we may clear the bit
 	 * the software is yet to handle the interrupt.
 	 */
-	if (!(mip_val & MIP_LCOFIP)) {
+	if (!(mip_val & sbi_pmu_irq_mask())) {
 		mhpmevent_curr &= of_mask;
 		csr_write_num(mhpmevent_csr, mhpmevent_curr);
 	}
@@ -405,11 +405,21 @@ int sbi_pmu_irq_bit(void)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		return MIP_LCOFIP;
+		return IRQ_PMU_OVF;
 	if (pmu_dev && pmu_dev->hw_counter_irq_bit)
 		return pmu_dev->hw_counter_irq_bit();
 
-	return 0;
+	return -1;
+}
+
+unsigned long sbi_pmu_irq_mask(void)
+{
+	int irq_bit = sbi_pmu_irq_bit();
+
+	if (irq_bit < 0)
+		return 0;
+
+	return BIT(irq_bit);
 }
 
 static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
@@ -591,9 +601,9 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		}
 	}
 
-	/* Clear MIP_LCOFIP to avoid spurious interrupts */
+	/* Clear PMU overflow interrupt to avoid spurious ones */
 	if (phs->sse_enabled)
-		csr_clear(CSR_MIP, MIP_LCOFIP);
+		csr_clear(CSR_MIP, sbi_pmu_irq_mask());
 
 	return ret;
 }
@@ -1087,26 +1097,28 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
 static void pmu_sse_enable(uint32_t event_id)
 {
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+	unsigned long irq_mask = sbi_pmu_irq_mask();
 
 	phs->sse_enabled = true;
-	csr_clear(CSR_MIDELEG, sbi_pmu_irq_bit());
-	csr_clear(CSR_MIP, MIP_LCOFIP);
-	csr_set(CSR_MIE, MIP_LCOFIP);
+	csr_clear(CSR_MIDELEG, irq_mask);
+	csr_clear(CSR_MIP, irq_mask);
+	csr_set(CSR_MIE, irq_mask);
 }
 
 static void pmu_sse_disable(uint32_t event_id)
 {
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+	unsigned long irq_mask = sbi_pmu_irq_mask();
 
-	csr_clear(CSR_MIE, MIP_LCOFIP);
-	csr_clear(CSR_MIP, MIP_LCOFIP);
-	csr_set(CSR_MIDELEG, sbi_pmu_irq_bit());
+	csr_clear(CSR_MIE, irq_mask);
+	csr_clear(CSR_MIP, irq_mask);
+	csr_set(CSR_MIDELEG, irq_mask);
 	phs->sse_enabled = false;
 }
 
 static void pmu_sse_complete(uint32_t event_id)
 {
-	csr_set(CSR_MIE, MIP_LCOFIP);
+	csr_set(CSR_MIE, sbi_pmu_irq_mask());
 }
 
 static const struct sbi_sse_cb_ops pmu_sse_cb_ops = {
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index d2de0c8f..242ffe9b 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -239,12 +239,13 @@ static int sbi_trap_nonaia_irq(unsigned long irq)
 	case IRQ_M_SOFT:
 		sbi_ipi_process();
 		break;
-	case IRQ_PMU_OVF:
-		sbi_pmu_ovf_irq();
-		break;
 	case IRQ_M_EXT:
 		return sbi_irqchip_process();
 	default:
+		if (irq == sbi_pmu_irq_bit()) {
+			sbi_pmu_ovf_irq();
+			return 0;
+		}
 		return SBI_ENOENT;
 	}
 
@@ -265,15 +266,17 @@ static int sbi_trap_aia_irq(void)
 		case IRQ_M_SOFT:
 			sbi_ipi_process();
 			break;
-		case IRQ_PMU_OVF:
-			sbi_pmu_ovf_irq();
-			break;
 		case IRQ_M_EXT:
 			rc = sbi_irqchip_process();
 			if (rc)
 				return rc;
 			break;
 		default:
+			if (mtopi == sbi_pmu_irq_bit()) {
+				sbi_pmu_ovf_irq();
+				break;
+			}
+
 			return SBI_ENOENT;
 		}
 	}
diff --git a/platform/generic/include/thead/c9xx_encoding.h b/platform/generic/include/thead/c9xx_encoding.h
index 58adbef0..a45b171e 100644
--- a/platform/generic/include/thead/c9xx_encoding.h
+++ b/platform/generic/include/thead/c9xx_encoding.h
@@ -122,6 +122,5 @@
 
 /* T-HEAD C9xx MIP CSR extension */
 #define THEAD_C9XX_IRQ_PMU_OVF		17
-#define THEAD_C9XX_MIP_MOIP		(_UL(1) << THEAD_C9XX_IRQ_PMU_OVF)
 
 #endif
diff --git a/platform/generic/thead/thead_c9xx_pmu.c b/platform/generic/thead/thead_c9xx_pmu.c
index d2058022..0b61e92a 100644
--- a/platform/generic/thead/thead_c9xx_pmu.c
+++ b/platform/generic/thead/thead_c9xx_pmu.c
@@ -53,7 +53,7 @@ static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
 
 static int thead_c9xx_pmu_irq_bit(void)
 {
-	return THEAD_C9XX_MIP_MOIP;
+	return THEAD_C9XX_IRQ_PMU_OVF;
 }
 
 static const struct sbi_pmu_device thead_c9xx_pmu_device = {
-- 
2.45.2


