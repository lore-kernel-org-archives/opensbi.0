From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 18:43:57 +0530
Subject: [PATCH v4 7/8] lib: sbi_pmu: Introduce fw_counter_write_value API
In-Reply-To: <20230309131358.2259923-1-mchitale@ventanamicro.com>
References: <20230309131358.2259923-1-mchitale@ventanamicro.com>
Message-ID: <20230309131358.2259923-8-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add fw_counter_write_value API for platform specific firmware events
which separates setting the counter's initial value from starting the
counter. This is required so that the fw_event_data array can be reused
to save the event data received.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_pmu.h | 11 ++++++++---
 lib/sbi/sbi_pmu.c     | 25 +++++++++++++------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 3232e14..53f2700 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -51,14 +51,19 @@ struct sbi_pmu_device {
 	 */
 	uint64_t (*fw_counter_read_value)(uint32_t counter_index);
 
+	/**
+	 * Write value to custom firmware counter
+	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
+	 */
+	void (*fw_counter_write_value)(uint32_t counter_index,
+				       uint64_t value);
+
 	/**
 	 * Start custom firmware counter
-	 * Note: SBI_PMU_FW_MAX <= event_idx_code
 	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
 	 */
 	int (*fw_counter_start)(uint32_t counter_index,
-				uint64_t event_data,
-				uint64_t init_val, bool init_val_update);
+				uint64_t event_data);
 
 	/**
 	 * Stop custom firmware counter
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index d083198..00a2c3e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -376,7 +376,6 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 			    uint64_t event_data, uint64_t ival,
 			    bool ival_update)
 {
-	int ret;
 	u32 hartid = current_hartid();
 
 	if ((event_code >= SBI_PMU_FW_MAX &&
@@ -386,19 +385,22 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 
 	if (SBI_PMU_FW_PLATFORM == event_code) {
 		if (!pmu_dev ||
+		    !pmu_dev->fw_counter_write_value ||
 		    !pmu_dev->fw_counter_start) {
 			return SBI_EINVAL;
 		    }
 
-		ret = pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
-						event_data,
-						ival, ival_update);
-		if (ret)
-			return ret;
+		if (ival_update)
+			pmu_dev->fw_counter_write_value(cidx - num_hw_ctrs,
+							ival);
+
+		return pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
+						 event_data);
+	} else {
+		if (ival_update)
+			fw_counters_data[hartid][cidx - num_hw_ctrs] = ival;
 	}
 
-	if (ival_update)
-		fw_counters_data[hartid][cidx - num_hw_ctrs] = ival;
 	fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
 
 	return 0;
@@ -762,10 +764,9 @@ skip_match:
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
 			if (SBI_PMU_FW_PLATFORM == event_code &&
 			    pmu_dev && pmu_dev->fw_counter_start) {
-				ret = pmu_dev->fw_counter_start(
-					ctr_idx - num_hw_ctrs, event_data,
-					fw_counters_data[hartid][ctr_idx - num_hw_ctrs],
-					true);
+				ret = pmu_dev->fw_counter_start(ctr_idx -
+								num_hw_ctrs,
+								event_data);
 				if (ret)
 					return ret;
 			}
-- 
2.34.1


