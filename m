From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Jan 2024 11:44:55 +0100
Subject: [RFC PATCH v2 3/4] lib: sbi: trigger SSE PMU event on PMU overflow IRQ
In-Reply-To: <20240109104500.2080121-1-cleger@rivosinc.com>
References: <20240109104500.2080121-1-cleger@rivosinc.com>
Message-ID: <20240109104500.2080121-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to send SSE local PMU event and receive PMU interrupt in
openSBI, we need to disable interrupt delegation for PMU interrupts
and send the SSE event upon LCOFIP IRQ.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_pmu.h |  3 +++
 lib/sbi/sbi_pmu.c     | 49 +++++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_trap.c    |  6 ++++++
 3 files changed, 58 insertions(+)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 7d32a4d..c5b4e51 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -11,6 +11,7 @@
 #define __SBI_PMU_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_trap.h>
 
 struct sbi_scratch;
 
@@ -150,4 +151,6 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 
 int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id);
 
+void sbi_pmu_ovf_irq(struct sbi_trap_regs *regs);
+
 #endif
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 6209ccc..fe2eda1 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_sse.h>
 
 /** Information about hardware counters */
 struct sbi_pmu_hw_event {
@@ -62,6 +63,8 @@ struct sbi_pmu_hart_state {
 	uint32_t active_events[SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX];
 	/* Bitmap of firmware counters started */
 	unsigned long fw_counters_started;
+	/* if true, SSE is enabled */
+	bool sse_enabled;
 	/*
 	 * Counter values for SBI firmware events and event codes
 	 * for platform firmware events. Both are mutually exclusive
@@ -297,6 +300,22 @@ int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32
 				    SBI_PMU_EVENT_RAW_IDX, cmap, select, select_mask);
 }
 
+void sbi_pmu_irq_clear(void)
+{
+	csr_set(CSR_MIE, MIP_LCOFIP);
+	csr_clear(CSR_MIP, MIP_LCOFIP);
+}
+
+void sbi_pmu_ovf_irq(struct sbi_trap_regs *regs)
+{
+	/*
+	 * We need to disable LCOFIP before returning to S-mode or we will loop
+	 * on LCOFIP being triggered
+	 */
+	csr_clear(CSR_MIE, MIP_LCOFIP);
+	sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_PMU, regs);
+}
+
 static int pmu_ctr_enable_irq_hw(int ctr_idx)
 {
 	unsigned long mhpmevent_csr;
@@ -564,6 +583,9 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		}
 	}
 
+	if (phs->sse_enabled)
+		sbi_pmu_irq_clear();
+
 	return ret;
 }
 
@@ -944,6 +966,7 @@ static void pmu_reset_event_map(struct sbi_pmu_hart_state *phs)
 	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
 		phs->fw_counters_data[j] = 0;
 	phs->fw_counters_started = 0;
+	phs->sse_enabled = 0;
 }
 
 const struct sbi_pmu_device *sbi_pmu_get_device(void)
@@ -970,6 +993,30 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
 	pmu_reset_event_map(pmu_get_hart_state_ptr(scratch));
 }
 
+static void pmu_sse_enable(uint32_t event_id)
+{
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+
+	phs->sse_enabled = true;
+	csr_clear(CSR_MIDELEG, sbi_pmu_irq_bit());
+	csr_clear(CSR_MIP, MIP_LCOFIP);
+	csr_set(CSR_MIE, MIP_LCOFIP);
+}
+
+static void pmu_sse_disable(uint32_t event_id)
+{
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+
+	phs->sse_enabled = false;
+	csr_clear(CSR_MIE, MIP_LCOFIP);
+	csr_set(CSR_MIDELEG, sbi_pmu_irq_bit());
+}
+
+static const struct sbi_sse_cb_ops pmu_sse_cb_ops = {
+	.enable_cb = pmu_sse_enable,
+	.disable_cb = pmu_sse_disable,
+};
+
 int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int hpm_count = sbi_fls(sbi_hart_mhpm_mask(scratch));
@@ -1009,6 +1056,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 	}
 
+	sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+
 	phs = pmu_get_hart_state_ptr(scratch);
 	if (!phs) {
 		phs = sbi_zalloc(sizeof(*phs));
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index d574ab1..10117b7 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -208,6 +208,9 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 	case IRQ_M_SOFT:
 		sbi_ipi_process(regs);
 		break;
+	case IRQ_PMU_OVF:
+		sbi_pmu_ovf_irq(regs);
+		break;
 	case IRQ_M_EXT:
 		return sbi_irqchip_process(regs);
 	default:
@@ -231,6 +234,9 @@ static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
 		case IRQ_M_SOFT:
 			sbi_ipi_process(regs);
 			break;
+		case IRQ_PMU_OVF:
+			sbi_pmu_ovf_irq(regs);
+			break;
 		case IRQ_M_EXT:
 			rc = sbi_irqchip_process(regs);
 			if (rc)
-- 
2.43.0


