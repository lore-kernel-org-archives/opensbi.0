From: Atish Patra <atish.patra@wdc.com>
Date: Mon, 25 Oct 2021 12:44:55 -0700
Subject: [PATCH v2 10/10] lib: sbi: Enable PMU extension for platforms without
 mcountinhibit
In-Reply-To: <20211025194455.232828-1-atish.patra@wdc.com>
References: <20211025194455.232828-1-atish.patra@wdc.com>
Message-ID: <20211025194455.232828-11-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platforms such as hifive unmatched doesn't implement mcountinhibit
csr. However, it has hardware events that can monitored using 2 hpmcounter
it has (i.e. mhpmcounter3 & mhpmcounter4).

Currently, PMU extension disabled if mcountinhibit is present. That's not
really necessary as long as the supervisor OS keeps track of the delta
value of the counters. Without mcountinhibit, the delta value won't be
entirely accurate because the counters are freely running. However, that
should be fine to produce an approximate counter value which can help
performance analysis. Perf sampling won't work though as sscof extension
is not present in hifive unmatched.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_ecall_pmu.c | 10 ++-------
 lib/sbi/sbi_pmu.c       | 50 ++++++++++++++++++++++++++++-------------
 lib/utils/fdt/fdt_pmu.c |  4 ++++
 3 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 39d3857680c1..9ee9e81802e7 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -74,14 +74,8 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 
 static int sbi_ecall_pmu_probe(unsigned long extid, unsigned long *out_val)
 {
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-
-	/* SBI PMU extension is useless without mcount inhibit features */
-	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
-		*out_val = 1;
-	else
-		*out_val = 0;
-
+	/* PMU extension is always enabled */
+	*out_val = 1;
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index d728529488dc..6948a712f739 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -279,13 +279,21 @@ static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
 
 static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 {
-	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long mctr_inhbt;
 
 	/* Make sure the counter index lies within the range and is not TM bit */
 	if (cidx > num_hw_ctrs || cidx == 1)
 		return SBI_EINVAL;
 
+	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		goto skip_inhbit_update;
+
+	/*
+	 * Some of the hardware may not support mcountinhibit but perf stat
+	 * still can work if supervisor mode programs the initial value.
+	 */
+	mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
 	if (!__test_bit(cidx, &mctr_inhbt))
 		return SBI_EALREADY_STARTED;
 
@@ -295,6 +303,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 		pmu_ctr_enable_irq_hw(cidx);
 	csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
 
+skip_inhbit_update:
 	if (ival_update)
 		pmu_ctr_write_hw(cidx, ival);
 
@@ -390,6 +399,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	int event_idx_type;
 	uint32_t event_code;
 	unsigned long ctr_mask = cmask << cbase;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (__fls(ctr_mask) >= total_ctrs)
 		return SBI_EINVAL;
@@ -402,8 +412,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
 			ret = pmu_ctr_stop_fw(cbase, event_code);
-		else
+		else if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
 			ret = pmu_ctr_stop_hw(cbase);
+		else
+			ret = 0;
 
 		if (flag & SBI_PMU_STOP_FLAG_RESET) {
 			active_events[hartid][cbase] = SBI_PMU_EVENT_IDX_INVALID;
@@ -473,7 +485,8 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 	unsigned long ctr_mask;
 	int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
 	struct sbi_pmu_hw_event *temp;
-	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
+	unsigned long mctr_inhbt;
+	u32 hartid = current_hartid();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	bool sscof_present = sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOF);
 
@@ -488,6 +501,8 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 	if (fixed_ctr >= 0 && !sscof_present)
 		return fixed_ctr;
 
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
 	for (i = 0; i < num_hw_events; i++) {
 		temp = &hw_event_map[i];
 		if ((temp->start_idx > event_idx && event_idx < temp->end_idx) ||
@@ -499,12 +514,21 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 			continue;
 
 		/* Fixed counters should not be part of the search */
-		ctr_mask = temp->counters & (cmask << cbase) & (~SBI_PMU_FIXED_CTR_MASK);
+		ctr_mask = temp->counters & (cmask << cbase) &
+			   (~SBI_PMU_FIXED_CTR_MASK);
 		for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
-			if (__test_bit(cbase, &mctr_inhbt)) {
-				ctr_idx = cbase;
-				break;
-			}
+			/**
+			 * Some of the platform may not support mcountinhibit.
+			 * Checking the active_events is enough for them
+			 */
+			if (active_events[hartid][cbase] != SBI_PMU_EVENT_IDX_INVALID)
+				continue;
+			/* If mcountinhibit is supported, the bit must be enabled */
+			if ((sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT)) &&
+			    !__test_bit(cbase, &mctr_inhbt))
+				continue;
+			/* We found a valid counter that is not started yet.*/
+			ctr_idx = cbase;
 		}
 	}
 
@@ -676,11 +700,9 @@ void sbi_pmu_exit(struct sbi_scratch *scratch)
 {
 	u32 hartid = current_hartid();
 
-	/* SBI PMU is not supported if mcountinhibit is not available */
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
-		return;
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
 
-	csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
 	csr_write(CSR_MCOUNTEREN, -1);
 	pmu_reset_event_map(hartid);
 }
@@ -690,10 +712,6 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 	const struct sbi_platform *plat;
 	u32 hartid = current_hartid();
 
-	/* SBI PMU is not supported if mcountinhibit is not available */
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
-		return 0;
-
 	if (cold_boot) {
 		plat = sbi_platform_ptr(scratch);
 		/* Initialize hw pmu events */
diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index 9ebf1c225017..4d86e775bcdb 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -9,6 +9,7 @@
  */
 
 #include <libfdt.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -40,6 +41,7 @@ uint64_t fdt_pmu_get_select_value(uint32_t event_idx)
 int fdt_pmu_fixup(void *fdt)
 {
 	int pmu_offset;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (!fdt)
 		return SBI_EINVAL;
@@ -51,6 +53,8 @@ int fdt_pmu_fixup(void *fdt)
 	fdt_delprop(fdt, pmu_offset, "pmu,event-to-mhpmcounters");
 	fdt_delprop(fdt, pmu_offset, "pmu,event-to-mhpmevent");
 	fdt_delprop(fdt, pmu_offset, "pmu,raw-event-to-mhpmcounters");
+	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		fdt_delprop(fdt, pmu_offset, "interrupts-extended");
 
 	return 0;
 }
-- 
2.31.1


