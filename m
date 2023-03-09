From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  9 Mar 2023 11:21:10 +0530
Subject: [PATCH v3 6/8] lib: sbi_pmu: Use dedicated event code for platform firmware events
In-Reply-To: <20230309055112.1516581-1-mchitale@ventanamicro.com>
References: <20230309055112.1516581-1-mchitale@ventanamicro.com>
Message-ID: <20230309055112.1516581-7-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For all platform specific firmware event operations use the dedicated
event code (0xFFFF) when matching against the input firmware event.
Furthermore save the real platform specific firmware event code received as
the event data for future use.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 65 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 13 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 1169ef2..d083198 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -122,7 +122,12 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
 		event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
-		if (SBI_PMU_FW_MAX <= event_idx_code &&
+		if ((event_idx_code >= SBI_PMU_FW_MAX &&
+		    event_idx_code <= SBI_PMU_FW_RESERVED_MAX) ||
+		    event_idx_code > SBI_PMU_FW_PLATFORM)
+			return SBI_EINVAL;
+
+		if (SBI_PMU_FW_PLATFORM == event_idx_code &&
 		    pmu_dev && pmu_dev->fw_event_validate_encoding)
 			return pmu_dev->fw_event_validate_encoding(edata);
 		else
@@ -187,12 +192,19 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
 
-	if (SBI_PMU_FW_MAX <= event_code &&
-	    pmu_dev && pmu_dev->fw_counter_read_value)
-		fw_counters_data[hartid][cidx - num_hw_ctrs] =
-			pmu_dev->fw_counter_read_value(cidx - num_hw_ctrs);
+	if ((event_code >= SBI_PMU_FW_MAX &&
+	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
+	    event_code > SBI_PMU_FW_PLATFORM)
+		return SBI_EINVAL;
 
-	*cval = fw_counters_data[hartid][cidx - num_hw_ctrs];
+	if (SBI_PMU_FW_PLATFORM == event_code) {
+		if (pmu_dev && pmu_dev->fw_counter_read_value)
+			*cval = pmu_dev->fw_counter_read_value(cidx -
+							       num_hw_ctrs);
+		else
+			*cval = 0;
+	} else
+		*cval = fw_counters_data[hartid][cidx - num_hw_ctrs];
 
 	return 0;
 }
@@ -367,8 +379,17 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 	int ret;
 	u32 hartid = current_hartid();
 
-	if (SBI_PMU_FW_MAX <= event_code &&
-	    pmu_dev && pmu_dev->fw_counter_start) {
+	if ((event_code >= SBI_PMU_FW_MAX &&
+	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
+	    event_code > SBI_PMU_FW_PLATFORM)
+		return SBI_EINVAL;
+
+	if (SBI_PMU_FW_PLATFORM == event_code) {
+		if (!pmu_dev ||
+		    !pmu_dev->fw_counter_start) {
+			return SBI_EINVAL;
+		    }
+
 		ret = pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
 						event_data,
 						ival, ival_update);
@@ -386,12 +407,13 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 		      unsigned long flags, uint64_t ival)
 {
+	u32 hartid = current_hartid();
 	int event_idx_type;
 	uint32_t event_code;
 	int ret = SBI_EINVAL;
 	bool bUpdate = false;
 	int i, cidx;
-	uint64_t edata = 0;
+	uint64_t edata;
 
 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return ret;
@@ -405,9 +427,13 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 		if (event_idx_type < 0)
 			/* Continue the start operation for other counters */
 			continue;
-		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
+		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW) {
+			edata = (event_code == SBI_PMU_FW_PLATFORM) ?
+				 fw_counters_data[hartid][cidx - num_hw_ctrs]
+				 : 0x0;
 			ret = pmu_ctr_start_fw(cidx, event_code, edata, ival,
 					       bUpdate);
+		}
 		else
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
 	}
@@ -441,7 +467,12 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
 {
 	int ret;
 
-	if (SBI_PMU_FW_MAX <= event_code &&
+	if ((event_code >= SBI_PMU_FW_MAX &&
+	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
+	    event_code > SBI_PMU_FW_PLATFORM)
+		return SBI_EINVAL;
+
+	if (SBI_PMU_FW_PLATFORM == event_code &&
 	    pmu_dev && pmu_dev->fw_counter_stop) {
 		ret = pmu_dev->fw_counter_stop(cidx - num_hw_ctrs);
 		if (ret)
@@ -651,13 +682,18 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
 {
 	int i, cidx;
 
+	if ((event_code >= SBI_PMU_FW_MAX &&
+	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
+	    event_code > SBI_PMU_FW_PLATFORM)
+		return SBI_EINVAL;
+
 	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
 		if (cidx < num_hw_ctrs || total_ctrs <= cidx)
 			continue;
 		if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
 			continue;
-		if (SBI_PMU_FW_MAX <= event_code &&
+		if (SBI_PMU_FW_PLATFORM == event_code &&
 		    pmu_dev && pmu_dev->fw_counter_match_encoding) {
 			if (!pmu_dev->fw_counter_match_encoding(cidx - num_hw_ctrs,
 								edata))
@@ -702,6 +738,9 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		/* Any firmware counter can be used track any firmware event */
 		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code,
 					  hartid, event_data);
+		if (event_code == SBI_PMU_FW_PLATFORM)
+			fw_counters_data[hartid][ctr_idx - num_hw_ctrs] =
+								event_data;
 	} else {
 		ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
 					  event_data);
@@ -721,7 +760,7 @@ skip_match:
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			fw_counters_data[hartid][ctr_idx - num_hw_ctrs] = 0;
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
-			if (SBI_PMU_FW_MAX <= event_code &&
+			if (SBI_PMU_FW_PLATFORM == event_code &&
 			    pmu_dev && pmu_dev->fw_counter_start) {
 				ret = pmu_dev->fw_counter_start(
 					ctr_idx - num_hw_ctrs, event_data,
-- 
2.34.1


