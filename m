From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 18:43:55 +0530
Subject: [PATCH v4 5/8] lib: sbi_pmu: Update sbi_pmu dev ops
In-Reply-To: <20230309131358.2259923-1-mchitale@ventanamicro.com>
References: <20230309131358.2259923-1-mchitale@ventanamicro.com>
Message-ID: <20230309131358.2259923-6-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update fw_event_validate_code, fw_counter_match_code and fw_counter_start
ops which used a 32 bit event code to use the 64 bit event data instead.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_pmu.h |  9 ++++-----
 lib/sbi/sbi_pmu.c     | 30 +++++++++++++++++-------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index b3b75c1..3232e14 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -30,16 +30,15 @@ struct sbi_pmu_device {
 
 	/**
 	 * Validate event code of custom firmware event
-	 * Note: SBI_PMU_FW_MAX <= event_idx_code
 	 */
-	int (*fw_event_validate_code)(uint32_t event_idx_code);
+	int (*fw_event_validate_encoding)(uint64_t event_data);
 
 	/**
 	 * Match custom firmware counter with custom firmware event
 	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
 	 */
-	bool (*fw_counter_match_code)(uint32_t counter_index,
-				      uint32_t event_idx_code);
+	bool (*fw_counter_match_encoding)(uint32_t counter_index,
+					  uint64_t event_data);
 
 	/**
 	 * Fetch the max width of this counter in number of bits.
@@ -58,7 +57,7 @@ struct sbi_pmu_device {
 	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
 	 */
 	int (*fw_counter_start)(uint32_t counter_index,
-				uint32_t event_idx_code,
+				uint64_t event_data,
 				uint64_t init_val, bool init_val_update);
 
 	/**
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 1a3c44d..1169ef2 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -110,7 +110,7 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
 	return false;
 }
 
-static int pmu_event_validate(unsigned long event_idx)
+static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
 {
 	uint32_t event_idx_type = get_cidx_type(event_idx);
 	uint32_t event_idx_code = get_cidx_code(event_idx);
@@ -123,8 +123,8 @@ static int pmu_event_validate(unsigned long event_idx)
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (SBI_PMU_FW_MAX <= event_idx_code &&
-		    pmu_dev && pmu_dev->fw_event_validate_code)
-			return pmu_dev->fw_event_validate_code(event_idx_code);
+		    pmu_dev && pmu_dev->fw_event_validate_encoding)
+			return pmu_dev->fw_event_validate_encoding(edata);
 		else
 			event_idx_code_max = SBI_PMU_FW_MAX;
 		break;
@@ -361,7 +361,8 @@ int sbi_pmu_irq_bit(void)
 }
 
 static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
-			    uint64_t ival, bool ival_update)
+			    uint64_t event_data, uint64_t ival,
+			    bool ival_update)
 {
 	int ret;
 	u32 hartid = current_hartid();
@@ -369,7 +370,7 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 	if (SBI_PMU_FW_MAX <= event_code &&
 	    pmu_dev && pmu_dev->fw_counter_start) {
 		ret = pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
-						event_code,
+						event_data,
 						ival, ival_update);
 		if (ret)
 			return ret;
@@ -390,6 +391,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	int ret = SBI_EINVAL;
 	bool bUpdate = false;
 	int i, cidx;
+	uint64_t edata = 0;
 
 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return ret;
@@ -404,7 +406,8 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 			/* Continue the start operation for other counters */
 			continue;
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_start_fw(cidx, event_code, ival, bUpdate);
+			ret = pmu_ctr_start_fw(cidx, event_code, edata, ival,
+					       bUpdate);
 		else
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
 	}
@@ -644,7 +647,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
  * check.
  */
 static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
-			   uint32_t event_code, u32 hartid)
+			   uint32_t event_code, u32 hartid, uint64_t edata)
 {
 	int i, cidx;
 
@@ -655,9 +658,9 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
 		if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
 			continue;
 		if (SBI_PMU_FW_MAX <= event_code &&
-		    pmu_dev && pmu_dev->fw_counter_match_code) {
-			if (!pmu_dev->fw_counter_match_code(cidx - num_hw_ctrs,
-							    event_code))
+		    pmu_dev && pmu_dev->fw_counter_match_encoding) {
+			if (!pmu_dev->fw_counter_match_encoding(cidx - num_hw_ctrs,
+								edata))
 				continue;
 		}
 
@@ -679,7 +682,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
 		return SBI_EINVAL;
 
-	event_type = pmu_event_validate(event_idx);
+	event_type = pmu_event_validate(event_idx, event_data);
 	if (event_type < 0)
 		return SBI_EINVAL;
 	event_code = get_cidx_code(event_idx);
@@ -697,7 +700,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 
 	if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		/* Any firmware counter can be used track any firmware event */
-		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code, hartid);
+		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code,
+					  hartid, event_data);
 	} else {
 		ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
 					  event_data);
@@ -720,7 +724,7 @@ skip_match:
 			if (SBI_PMU_FW_MAX <= event_code &&
 			    pmu_dev && pmu_dev->fw_counter_start) {
 				ret = pmu_dev->fw_counter_start(
-					ctr_idx - num_hw_ctrs, event_code,
+					ctr_idx - num_hw_ctrs, event_data,
 					fw_counters_data[hartid][ctr_idx - num_hw_ctrs],
 					true);
 				if (ret)
-- 
2.34.1


