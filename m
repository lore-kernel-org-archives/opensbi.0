From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 11:21:08 +0530
Subject: [PATCH v3 4/8] lib: sbi_pmu: Rename fw_counter_value
In-Reply-To: <20230309055112.1516581-1-mchitale@ventanamicro.com>
References: <20230309055112.1516581-1-mchitale@ventanamicro.com>
Message-ID: <20230309055112.1516581-5-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename and reuse fw_counter_value arrary to save both the counter values
for the SBI firmware events and event data for the SBI platform specific
firmware events.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a99c045..1a3c44d 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -65,8 +65,12 @@ static uint32_t active_events[SBI_HARTMASK_MAX_BITS][SBI_PMU_HW_CTR_MAX + SBI_PM
 #endif
 static unsigned long fw_counters_started[SBI_HARTMASK_MAX_BITS];
 
-/* Values of firmwares counters on each HART */
-static uint64_t fw_counters_value[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
+/*
+ * Counter values for SBI firmware events and event codes for platform
+ * firmware events. Both are mutually exclusive and hence can optimally share
+ * the same memory.
+ */
+static uint64_t fw_counters_data[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
 
 /* Maximum number of hardware events available */
 static uint32_t num_hw_events;
@@ -185,10 +189,10 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 
 	if (SBI_PMU_FW_MAX <= event_code &&
 	    pmu_dev && pmu_dev->fw_counter_read_value)
-		fw_counters_value[hartid][cidx - num_hw_ctrs] =
+		fw_counters_data[hartid][cidx - num_hw_ctrs] =
 			pmu_dev->fw_counter_read_value(cidx - num_hw_ctrs);
 
-	*cval = fw_counters_value[hartid][cidx - num_hw_ctrs];
+	*cval = fw_counters_data[hartid][cidx - num_hw_ctrs];
 
 	return 0;
 }
@@ -372,7 +376,7 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 	}
 
 	if (ival_update)
-		fw_counters_value[hartid][cidx - num_hw_ctrs] = ival;
+		fw_counters_data[hartid][cidx - num_hw_ctrs] = ival;
 	fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
 
 	return 0;
@@ -711,13 +715,13 @@ skip_match:
 			pmu_ctr_start_hw(ctr_idx, 0, false);
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
-			fw_counters_value[hartid][ctr_idx - num_hw_ctrs] = 0;
+			fw_counters_data[hartid][ctr_idx - num_hw_ctrs] = 0;
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
 			if (SBI_PMU_FW_MAX <= event_code &&
 			    pmu_dev && pmu_dev->fw_counter_start) {
 				ret = pmu_dev->fw_counter_start(
 					ctr_idx - num_hw_ctrs, event_code,
-					fw_counters_value[hartid][ctr_idx - num_hw_ctrs],
+					fw_counters_data[hartid][ctr_idx - num_hw_ctrs],
 					true);
 				if (ret)
 					return ret;
@@ -743,7 +747,7 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
 	for (cidx = num_hw_ctrs; cidx < total_ctrs; cidx++) {
 		if (get_cidx_code(active_events[hartid][cidx]) == fw_id &&
 		    (fw_counters_started[hartid] & BIT(cidx - num_hw_ctrs))) {
-			fcounter = &fw_counters_value[hartid][cidx - num_hw_ctrs];
+			fcounter = &fw_counters_data[hartid][cidx - num_hw_ctrs];
 			break;
 		}
 	}
@@ -803,7 +807,7 @@ static void pmu_reset_event_map(u32 hartid)
 	for (j = 3; j < total_ctrs; j++)
 		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
 	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
-		fw_counters_value[hartid][j] = 0;
+		fw_counters_data[hartid][j] = 0;
 	fw_counters_started[hartid] = 0;
 }
 
-- 
2.34.1


