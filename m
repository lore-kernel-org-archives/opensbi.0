From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:41 +0530
Subject: [PATCH 4/7] lib: sbi_pmu: Simplify FW counters to reduce memory usage
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we have 32 elements (i.e. SBI_PMU_FW_EVENT_MAX) array of
"struct sbi_pmu_fw_event" for each of 128 possible HARTs
(i.e. SBI_HARTMASK_MAX_BITS).

To reduce memory usage of OpenSBI, we update FW counter implementation
as follows:
1) Remove SBI_PMU_FW_EVENT_MAX
2) Remove "struct sbi_pmu_fw_event"
3) Create per-HART bitmap of XLEN bits to track FW counters
   which are started on each HART
4) Create per-HART uint64_t array to track values of FW
   counters on each HART.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_pmu.h |  3 --
 lib/sbi/sbi_pmu.c     | 78 ++++++++++++++++++++-----------------------
 2 files changed, 36 insertions(+), 45 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 34336f7..39cf007 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -19,9 +19,6 @@
 /* Maximum number of hardware events that can mapped by OpenSBI */
 #define SBI_PMU_HW_EVENT_MAX 256
 
-/* Maximum number of firmware events that can mapped by OpenSBI */
-#define SBI_PMU_FW_EVENT_MAX 32
-
 /* Counter related macros */
 #define SBI_PMU_FW_CTR_MAX 16
 #define SBI_PMU_HW_CTR_MAX 32
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 1c01d34..26c9406 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -33,15 +33,6 @@ struct sbi_pmu_hw_event {
 	uint64_t select_mask;
 };
 
-/** Representation of a firmware event */
-struct sbi_pmu_fw_event {
-	/* Current value of the counter */
-	uint64_t curr_count;
-
-	/* A flag indicating pmu event monitoring is started */
-	bool bStarted;
-};
-
 /* Information about PMU counters as per SBI specification */
 union sbi_pmu_ctr_info {
 	unsigned long value;
@@ -63,8 +54,14 @@ static struct sbi_pmu_hw_event hw_event_map[SBI_PMU_HW_EVENT_MAX] = {0};
 /* counter to enabled event mapping */
 static uint32_t active_events[SBI_HARTMASK_MAX_BITS][SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX];
 
-/* Contains all the information about firmwares events */
-static struct sbi_pmu_fw_event fw_event_map[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_EVENT_MAX] = {0};
+/* Bitmap of firmware counters started on each HART */
+#if SBI_PMU_FW_CTR_MAX >= BITS_PER_LONG
+#error "Can't handle firmware counters beyond BITS_PER_LONG"
+#endif
+static unsigned long fw_counters_started[SBI_HARTMASK_MAX_BITS];
+
+/* Values of firmwares counters on each HART */
+static uint64_t fw_counters_value[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_CTR_MAX] = {0};
 
 /* Maximum number of hardware events available */
 static uint32_t num_hw_events;
@@ -172,14 +169,12 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 	int event_idx_type;
 	uint32_t event_code;
 	u32 hartid = current_hartid();
-	struct sbi_pmu_fw_event *fevent;
 
 	event_idx_type = pmu_ctr_validate(cidx, &event_code);
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
 
-	fevent = &fw_event_map[hartid][event_code];
-	*cval = fevent->curr_count;
+	*cval = fw_counters_value[hartid][cidx - num_hw_ctrs];
 
 	return 0;
 }
@@ -333,16 +328,13 @@ skip_inhibit_update:
 	return 0;
 }
 
-static int pmu_ctr_start_fw(uint32_t cidx, uint32_t fw_evt_code,
-			    uint64_t ival, bool ival_update)
+static int pmu_ctr_start_fw(uint32_t cidx, uint64_t ival, bool ival_update)
 {
 	u32 hartid = current_hartid();
-	struct sbi_pmu_fw_event *fevent;
 
-	fevent = &fw_event_map[hartid][fw_evt_code];
 	if (ival_update)
-		fevent->curr_count = ival;
-	fevent->bStarted = TRUE;
+		fw_counters_value[hartid][cidx - num_hw_ctrs] = ival;
+	fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
 
 	return 0;
 }
@@ -369,7 +361,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 			/* Continue the start operation for other counters */
 			continue;
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_start_fw(cidx, event_code, ival, bUpdate);
+			ret = pmu_ctr_start_fw(cidx, ival, bUpdate);
 		else
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
 	}
@@ -399,11 +391,9 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
 		return SBI_EALREADY_STOPPED;
 }
 
-static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t fw_evt_code)
+static int pmu_ctr_stop_fw(uint32_t cidx)
 {
-	u32 hartid = current_hartid();
-
-	fw_event_map[hartid][fw_evt_code].bStarted = FALSE;
+	fw_counters_started[current_hartid()] &= ~BIT(cidx - num_hw_ctrs);
 
 	return 0;
 }
@@ -444,7 +434,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 			continue;
 
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_stop_fw(cidx, event_code);
+			ret = pmu_ctr_stop_fw(cidx);
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
@@ -624,8 +614,6 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	int ctr_idx = SBI_ENOTSUPP;
 	u32 hartid = current_hartid();
 	int event_type;
-	struct sbi_pmu_fw_event *fevent;
-	uint32_t fw_evt_code;
 
 	/* Do a basic sanity check of counter base & mask */
 	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
@@ -665,30 +653,36 @@ skip_match:
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
 			pmu_ctr_start_hw(ctr_idx, 0, false);
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
-		fw_evt_code = get_cidx_code(event_idx);
-		fevent = &fw_event_map[hartid][fw_evt_code];
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
-			fevent->curr_count = 0;
+			fw_counters_value[hartid][ctr_idx - num_hw_ctrs] = 0;
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
-			fevent->bStarted = TRUE;
+			fw_counters_started[hartid] |= BIT(ctr_idx - num_hw_ctrs);
 	}
 
 	return ctr_idx;
 }
 
-inline int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
+int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
 {
-	u32 hartid = current_hartid();
-	struct sbi_pmu_fw_event *fevent;
+	u32 cidx, hartid = current_hartid();
+	uint64_t *fcounter = NULL;
+
+	if (likely(!fw_counters_started[hartid]))
+		return 0;
 
 	if (unlikely(fw_id >= SBI_PMU_FW_MAX))
 		return SBI_EINVAL;
 
-	fevent = &fw_event_map[hartid][fw_id];
+	for (cidx = num_hw_ctrs; cidx < total_ctrs; cidx++) {
+		if (get_cidx_code(active_events[hartid][cidx]) == fw_id &&
+		    (fw_counters_started[hartid] & BIT(cidx - num_hw_ctrs))) {
+			fcounter = &fw_counters_value[hartid][cidx - num_hw_ctrs];
+			break;
+		}
+	}
 
-	/* PMU counters will be only enabled during performance debugging */
-	if (unlikely(fevent->bStarted))
-		fevent->curr_count++;
+	if (fcounter)
+		(*fcounter)++;
 
 	return 0;
 }
@@ -735,9 +729,9 @@ static void pmu_reset_event_map(u32 hartid)
 	/* Initialize the counter to event mapping table */
 	for (j = 3; j < total_ctrs; j++)
 		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
-	for (j = 0; j < SBI_PMU_FW_EVENT_MAX; j++)
-		sbi_memset(&fw_event_map[hartid][j], 0,
-			   sizeof(struct sbi_pmu_fw_event));
+	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
+		fw_counters_value[hartid][j] = 0;
+	fw_counters_started[hartid] = 0;
 }
 
 void sbi_pmu_exit(struct sbi_scratch *scratch)
-- 
2.34.1


