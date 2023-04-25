From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:17 +0530
Subject: [PATCH 04/17] lib: sbi_pmu: Use heap for per-HART PMU state
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array for per-HART PMU state, we should
use heap to on-demand allocate per-HART PMU state when the HART
is initialized in cold boot or warm boot path.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 221 ++++++++++++++++++++++++++++------------------
 1 file changed, 133 insertions(+), 88 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 939f29d..71562e4 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -12,7 +12,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
-#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
@@ -50,27 +50,49 @@ union sbi_pmu_ctr_info {
 	};
 };
 
-/* Platform specific PMU device */
-static const struct sbi_pmu_device *pmu_dev = NULL;
-
-/* Mapping between event range and possible counters  */
-static struct sbi_pmu_hw_event hw_event_map[SBI_PMU_HW_EVENT_MAX] = {0};
-
-/* counter to enabled event mapping */
-static uint32_t active_events[SBI_HARTMASK_MAX_BITS][SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX];
-
-/* Bitmap of firmware counters started on each HART */
 #if SBI_PMU_FW_CTR_MAX >= BITS_PER_LONG
 #error "Can't handle firmware counters beyond BITS_PER_LONG"
 #endif
-static unsigned long fw_counters_started[SBI_HARTMASK_MAX_BITS];
 
-/*
- * Counter values for SBI firmware events and event codes for platform
- * firmware events. Both are mutually exclusive and hence can optimally share
- * the same memory.
- */
-static uint64_t fw_counters_data[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
+/** Per-HART state of the PMU counters */
+struct sbi_pmu_hart_state {
+	/* HART to which this state belongs */
+	uint32_t hartid;
+	/* Counter to enabled event mapping */
+	uint32_t active_events[SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX];
+	/* Bitmap of firmware counters started */
+	unsigned long fw_counters_started;
+	/*
+	 * Counter values for SBI firmware events and event codes
+	 * for platform firmware events. Both are mutually exclusive
+	 * and hence can optimally share the same memory.
+	 */
+	uint64_t fw_counters_data[SBI_PMU_FW_CTR_MAX];
+};
+
+/** Offset of pointer to PMU HART state in scratch space */
+static unsigned long phs_ptr_offset;
+
+#define pmu_get_hart_state_ptr(__scratch)				\
+({									\
+	(void *)(*((ulong *)sbi_scratch_offset_ptr((__scratch),		\
+						   phs_ptr_offset)));	\
+})
+
+#define pmu_thishart_state_ptr()					\
+	pmu_get_hart_state_ptr(sbi_scratch_thishart_ptr())
+
+#define pmu_set_hart_state_ptr(__scratch, __phs)			\
+do {									\
+	*((ulong *)sbi_scratch_offset_ptr((__scratch), phs_ptr_offset))	\
+					= (ulong)(__phs);		\
+} while (0)
+
+/* Platform specific PMU device */
+static const struct sbi_pmu_device *pmu_dev = NULL;
+
+/* Mapping between event range and possible counters  */
+static struct sbi_pmu_hw_event *hw_event_map;
 
 /* Maximum number of hardware events available */
 static uint32_t num_hw_events;
@@ -111,13 +133,13 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
 	return false;
 }
 
-static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
+static int pmu_event_validate(struct sbi_pmu_hart_state *phs,
+			      unsigned long event_idx, uint64_t edata)
 {
 	uint32_t event_idx_type = get_cidx_type(event_idx);
 	uint32_t event_idx_code = get_cidx_code(event_idx);
 	uint32_t event_idx_code_max = -1;
 	uint32_t cache_ops_result, cache_ops_id, cache_id;
-	u32 hartid = current_hartid();
 
 	switch(event_idx_type) {
 	case SBI_PMU_EVENT_TYPE_HW:
@@ -131,7 +153,7 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
 
 		if (SBI_PMU_FW_PLATFORM == event_idx_code &&
 		    pmu_dev && pmu_dev->fw_event_validate_encoding)
-			return pmu_dev->fw_event_validate_encoding(hartid,
+			return pmu_dev->fw_event_validate_encoding(phs->hartid,
 							           edata);
 		else
 			event_idx_code_max = SBI_PMU_FW_MAX;
@@ -165,16 +187,16 @@ static int pmu_event_validate(unsigned long event_idx, uint64_t edata)
 	return SBI_EINVAL;
 }
 
-static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
+static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
+			    uint32_t cidx, uint32_t *event_idx_code)
 {
 	uint32_t event_idx_val;
 	uint32_t event_idx_type;
-	u32 hartid = current_hartid();
 
 	if (cidx >= total_ctrs)
 		return SBI_EINVAL;
 
-	event_idx_val = active_events[hartid][cidx];
+	event_idx_val = phs->active_events[cidx];
 	event_idx_type = get_cidx_type(event_idx_val);
 	if (event_idx_val == SBI_PMU_EVENT_IDX_INVALID ||
 	    event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
@@ -189,9 +211,9 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 {
 	int event_idx_type;
 	uint32_t event_code;
-	u32 hartid = current_hartid();
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 
-	event_idx_type = pmu_ctr_validate(cidx, &event_code);
+	event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
 
@@ -202,13 +224,13 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 
 	if (SBI_PMU_FW_PLATFORM == event_code) {
 		if (pmu_dev && pmu_dev->fw_counter_read_value)
-			*cval = pmu_dev->fw_counter_read_value(hartid,
+			*cval = pmu_dev->fw_counter_read_value(phs->hartid,
 							       cidx -
 							       num_hw_ctrs);
 		else
 			*cval = 0;
 	} else
-		*cval = fw_counters_data[hartid][cidx - num_hw_ctrs];
+		*cval = phs->fw_counters_data[cidx - num_hw_ctrs];
 
 	return 0;
 }
@@ -376,12 +398,11 @@ int sbi_pmu_irq_bit(void)
 	return 0;
 }
 
-static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
+static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
+			    uint32_t cidx, uint32_t event_code,
 			    uint64_t event_data, uint64_t ival,
 			    bool ival_update)
 {
-	u32 hartid = current_hartid();
-
 	if ((event_code >= SBI_PMU_FW_MAX &&
 	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
 	    event_code > SBI_PMU_FW_PLATFORM)
@@ -395,18 +416,19 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 		    }
 
 		if (ival_update)
-			pmu_dev->fw_counter_write_value(hartid,
+			pmu_dev->fw_counter_write_value(phs->hartid,
 							cidx - num_hw_ctrs,
 							ival);
 
-		return pmu_dev->fw_counter_start(hartid, cidx - num_hw_ctrs,
+		return pmu_dev->fw_counter_start(phs->hartid,
+						 cidx - num_hw_ctrs,
 						 event_data);
 	} else {
 		if (ival_update)
-			fw_counters_data[hartid][cidx - num_hw_ctrs] = ival;
+			phs->fw_counters_data[cidx - num_hw_ctrs] = ival;
 	}
 
-	fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
+	phs->fw_counters_started |= BIT(cidx - num_hw_ctrs);
 
 	return 0;
 }
@@ -414,7 +436,7 @@ static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
 int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 		      unsigned long flags, uint64_t ival)
 {
-	u32 hartid = current_hartid();
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 	int event_idx_type;
 	uint32_t event_code;
 	int ret = SBI_EINVAL;
@@ -430,16 +452,16 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 
 	for_each_set_bit(i, &cmask, total_ctrs) {
 		cidx = i + cbase;
-		event_idx_type = pmu_ctr_validate(cidx, &event_code);
+		event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 		if (event_idx_type < 0)
 			/* Continue the start operation for other counters */
 			continue;
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW) {
 			edata = (event_code == SBI_PMU_FW_PLATFORM) ?
-				 fw_counters_data[hartid][cidx - num_hw_ctrs]
+				 phs->fw_counters_data[cidx - num_hw_ctrs]
 				 : 0x0;
-			ret = pmu_ctr_start_fw(cidx, event_code, edata, ival,
-					       bUpdate);
+			ret = pmu_ctr_start_fw(phs, cidx, event_code, edata,
+					       ival, bUpdate);
 		}
 		else
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
@@ -470,9 +492,9 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
 		return SBI_EALREADY_STOPPED;
 }
 
-static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
+static int pmu_ctr_stop_fw(struct sbi_pmu_hart_state *phs,
+			   uint32_t cidx, uint32_t event_code)
 {
-	u32 hartid = current_hartid();
 	int ret;
 
 	if ((event_code >= SBI_PMU_FW_MAX &&
@@ -482,12 +504,12 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
 
 	if (SBI_PMU_FW_PLATFORM == event_code &&
 	    pmu_dev && pmu_dev->fw_counter_stop) {
-		ret = pmu_dev->fw_counter_stop(hartid, cidx - num_hw_ctrs);
+		ret = pmu_dev->fw_counter_stop(phs->hartid, cidx - num_hw_ctrs);
 		if (ret)
 			return ret;
 	}
 
-	fw_counters_started[current_hartid()] &= ~BIT(cidx - num_hw_ctrs);
+	phs->fw_counters_started &= ~BIT(cidx - num_hw_ctrs);
 
 	return 0;
 }
@@ -511,7 +533,7 @@ static int pmu_reset_hw_mhpmevent(int ctr_idx)
 int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		     unsigned long flag)
 {
-	u32 hartid = current_hartid();
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 	int ret = SBI_EINVAL;
 	int event_idx_type;
 	uint32_t event_code;
@@ -522,18 +544,18 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 
 	for_each_set_bit(i, &cmask, total_ctrs) {
 		cidx = i + cbase;
-		event_idx_type = pmu_ctr_validate(cidx, &event_code);
+		event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 		if (event_idx_type < 0)
 			/* Continue the stop operation for other counters */
 			continue;
 
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_stop_fw(cidx, event_code);
+			ret = pmu_ctr_stop_fw(phs, cidx, event_code);
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
 		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
-			active_events[hartid][cidx] = SBI_PMU_EVENT_IDX_INVALID;
+			phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
 			pmu_reset_hw_mhpmevent(cidx);
 		}
 	}
@@ -604,14 +626,15 @@ static int pmu_ctr_find_fixed_fw(unsigned long evt_idx_code)
 		return SBI_EINVAL;
 }
 
-static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned long flags,
+static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
+			   unsigned long cbase, unsigned long cmask,
+			   unsigned long flags,
 			   unsigned long event_idx, uint64_t data)
 {
 	unsigned long ctr_mask;
 	int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
 	struct sbi_pmu_hw_event *temp;
 	unsigned long mctr_inhbt = 0;
-	u32 hartid = current_hartid();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (cbase >= num_hw_ctrs)
@@ -650,7 +673,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 			 * Some of the platform may not support mcountinhibit.
 			 * Checking the active_events is enough for them
 			 */
-			if (active_events[hartid][cbase] != SBI_PMU_EVENT_IDX_INVALID)
+			if (phs->active_events[cbase] != SBI_PMU_EVENT_IDX_INVALID)
 				continue;
 			/* If mcountinhibit is supported, the bit must be enabled */
 			if ((sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11) &&
@@ -685,8 +708,9 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
  * Thus, select the first available fw counter after sanity
  * check.
  */
-static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
-			   uint32_t event_code, u32 hartid, uint64_t edata)
+static int pmu_ctr_find_fw(struct sbi_pmu_hart_state *phs,
+			   unsigned long cbase, unsigned long cmask,
+			   uint32_t event_code, uint64_t edata)
 {
 	int i, cidx;
 
@@ -699,11 +723,11 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
 		cidx = i + cbase;
 		if (cidx < num_hw_ctrs || total_ctrs <= cidx)
 			continue;
-		if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
+		if (phs->active_events[i] != SBI_PMU_EVENT_IDX_INVALID)
 			continue;
 		if (SBI_PMU_FW_PLATFORM == event_code &&
 		    pmu_dev && pmu_dev->fw_counter_match_encoding) {
-			if (!pmu_dev->fw_counter_match_encoding(hartid,
+			if (!pmu_dev->fw_counter_match_encoding(phs->hartid,
 							    cidx - num_hw_ctrs,
 							    edata))
 				continue;
@@ -719,15 +743,15 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 			  unsigned long flags, unsigned long event_idx,
 			  uint64_t event_data)
 {
-	int ret, ctr_idx = SBI_ENOTSUPP;
-	u32 event_code, hartid = current_hartid();
-	int event_type;
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+	int ret, event_type, ctr_idx = SBI_ENOTSUPP;
+	u32 event_code;
 
 	/* Do a basic sanity check of counter base & mask */
 	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
 		return SBI_EINVAL;
 
-	event_type = pmu_event_validate(event_idx, event_data);
+	event_type = pmu_event_validate(phs, event_idx, event_data);
 	if (event_type < 0)
 		return SBI_EINVAL;
 	event_code = get_cidx_code(event_idx);
@@ -742,7 +766,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		 */
 		unsigned long cidx_first = cidx_base + sbi_ffs(cidx_mask);
 
-		if (active_events[hartid][cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
+		if (phs->active_events[cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
 			return SBI_EINVAL;
 		ctr_idx = cidx_first;
 		goto skip_match;
@@ -750,20 +774,20 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 
 	if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		/* Any firmware counter can be used track any firmware event */
-		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code,
-					  hartid, event_data);
+		ctr_idx = pmu_ctr_find_fw(phs, cidx_base, cidx_mask,
+					  event_code, event_data);
 		if (event_code == SBI_PMU_FW_PLATFORM)
-			fw_counters_data[hartid][ctr_idx - num_hw_ctrs] =
+			phs->fw_counters_data[ctr_idx - num_hw_ctrs] =
 								event_data;
 	} else {
-		ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
-					  event_data);
+		ctr_idx = pmu_ctr_find_hw(phs, cidx_base, cidx_mask, flags,
+					  event_idx, event_data);
 	}
 
 	if (ctr_idx < 0)
 		return SBI_ENOTSUPP;
 
-	active_events[hartid][ctr_idx] = event_idx;
+	phs->active_events[ctr_idx] = event_idx;
 skip_match:
 	if (event_type == SBI_PMU_EVENT_TYPE_HW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
@@ -772,16 +796,17 @@ skip_match:
 			pmu_ctr_start_hw(ctr_idx, 0, false);
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
-			fw_counters_data[hartid][ctr_idx - num_hw_ctrs] = 0;
+			phs->fw_counters_data[ctr_idx - num_hw_ctrs] = 0;
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
 			if (SBI_PMU_FW_PLATFORM == event_code &&
 			    pmu_dev && pmu_dev->fw_counter_start) {
-				ret = pmu_dev->fw_counter_start(hartid,
+				ret = pmu_dev->fw_counter_start(
+					phs->hartid,
 					ctr_idx - num_hw_ctrs, event_data);
 				if (ret)
 					return ret;
 			}
-			fw_counters_started[hartid] |= BIT(ctr_idx - num_hw_ctrs);
+			phs->fw_counters_started |= BIT(ctr_idx - num_hw_ctrs);
 		}
 	}
 
@@ -790,19 +815,20 @@ skip_match:
 
 int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
 {
-	u32 cidx, hartid = current_hartid();
+	u32 cidx;
 	uint64_t *fcounter = NULL;
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 
-	if (likely(!fw_counters_started[hartid]))
+	if (likely(!phs->fw_counters_started))
 		return 0;
 
 	if (unlikely(fw_id >= SBI_PMU_FW_MAX))
 		return SBI_EINVAL;
 
 	for (cidx = num_hw_ctrs; cidx < total_ctrs; cidx++) {
-		if (get_cidx_code(active_events[hartid][cidx]) == fw_id &&
-		    (fw_counters_started[hartid] & BIT(cidx - num_hw_ctrs))) {
-			fcounter = &fw_counters_data[hartid][cidx - num_hw_ctrs];
+		if (get_cidx_code(phs->active_events[cidx]) == fw_id &&
+		    (phs->fw_counters_started & BIT(cidx - num_hw_ctrs))) {
+			fcounter = &phs->fw_counters_data[cidx - num_hw_ctrs];
 			break;
 		}
 	}
@@ -854,16 +880,16 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 	return 0;
 }
 
-static void pmu_reset_event_map(u32 hartid)
+static void pmu_reset_event_map(struct sbi_pmu_hart_state *phs)
 {
 	int j;
 
 	/* Initialize the counter to event mapping table */
 	for (j = 3; j < total_ctrs; j++)
-		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
+		phs->active_events[j] = SBI_PMU_EVENT_IDX_INVALID;
 	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
-		fw_counters_data[hartid][j] = 0;
-	fw_counters_started[hartid] = 0;
+		phs->fw_counters_data[j] = 0;
+	phs->fw_counters_started = 0;
 }
 
 const struct sbi_pmu_device *sbi_pmu_get_device(void)
@@ -881,22 +907,32 @@ void sbi_pmu_set_device(const struct sbi_pmu_device *dev)
 
 void sbi_pmu_exit(struct sbi_scratch *scratch)
 {
-	u32 hartid = current_hartid();
-
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
 		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		csr_write(CSR_MCOUNTEREN, -1);
-	pmu_reset_event_map(hartid);
+
+	pmu_reset_event_map(pmu_get_hart_state_ptr(scratch));
 }
 
 int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 {
+	struct sbi_pmu_hart_state *phs;
 	const struct sbi_platform *plat;
-	u32 hartid = current_hartid();
 
 	if (cold_boot) {
+		hw_event_map = sbi_calloc(sizeof(*hw_event_map),
+					  SBI_PMU_HW_EVENT_MAX);
+		if (!hw_event_map)
+			return SBI_ENOMEM;
+
+		phs_ptr_offset = sbi_scratch_alloc_offset(sizeof(ulong));
+		if (!phs_ptr_offset) {
+			sbi_free(hw_event_map);
+			return SBI_ENOMEM;
+		}
+
 		plat = sbi_platform_ptr(scratch);
 		/* Initialize hw pmu events */
 		sbi_platform_pmu_init(plat);
@@ -906,14 +942,23 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 	}
 
-	pmu_reset_event_map(hartid);
+	phs = pmu_get_hart_state_ptr(scratch);
+	if (!phs) {
+		phs = sbi_zalloc(sizeof(*phs));
+		if (!phs)
+			return SBI_ENOMEM;
+		phs->hartid = current_hartid();
+		pmu_set_hart_state_ptr(scratch, phs);
+	}
+
+	pmu_reset_event_map(phs);
 
 	/* First three counters are fixed by the priv spec and we enable it by default */
-	active_events[hartid][0] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET |
-				   SBI_PMU_HW_CPU_CYCLES;
-	active_events[hartid][1] = SBI_PMU_EVENT_IDX_INVALID;
-	active_events[hartid][2] = SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET |
-				   SBI_PMU_HW_INSTRUCTIONS;
+	phs->active_events[0] = (SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET) |
+				SBI_PMU_HW_CPU_CYCLES;
+	phs->active_events[1] = SBI_PMU_EVENT_IDX_INVALID;
+	phs->active_events[2] = (SBI_PMU_EVENT_TYPE_HW << SBI_PMU_EVENT_IDX_TYPE_OFFSET) |
+				SBI_PMU_HW_INSTRUCTIONS;
 
 	return 0;
 }
-- 
2.34.1


