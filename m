From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:42 +0530
Subject: [PATCH 5/7] lib: sbi_pmu: Add custom PMU device operations
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend SBI PMU implementation to allow custom PMU device operations
which a platform can use for platform specific quirks.

The custom PMU device operations added by this patch include:
1) Operations to allow a platform implement custom firmware events.
   These custom firmware events can be SBI vendor extension related
   events or platform specific per-HART events are not possible to
   count through HPM CSRs.
2) Operations to allow a platform implement custom way for enabling
   (or disabling) an overflow interrupt (e.g. T-Head C9xx).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_pmu.h |  57 ++++++++++++++++++++++
 lib/sbi/sbi_pmu.c     | 108 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 144 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 39cf007..d787575 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -25,6 +25,63 @@
 #define SBI_PMU_CTR_MAX	   (SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
 #define SBI_PMU_FIXED_CTR_MASK 0x07
 
+struct sbi_pmu_device {
+	/** Name of the PMU platform device */
+	char name[32];
+
+	/**
+	 * Validate event code of custom firmware event
+	 * Note: SBI_PMU_FW_MAX <= event_idx_code
+	 */
+	int (*fw_event_validate_code)(uint32_t event_idx_code);
+
+	/**
+	 * Match custom firmware counter with custom firmware event
+	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
+	 */
+	bool (*fw_counter_match_code)(uint32_t counter_index,
+				      uint32_t event_idx_code);
+
+	/**
+	 * Read value of custom firmware counter
+	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
+	 */
+	uint64_t (*fw_counter_read_value)(uint32_t counter_index);
+
+	/**
+	 * Start custom firmware counter
+	 * Note: SBI_PMU_FW_MAX <= event_idx_code
+	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
+	 */
+	int (*fw_counter_start)(uint32_t counter_index,
+				uint32_t event_idx_code,
+				uint64_t init_val, bool init_val_update);
+
+	/**
+	 * Stop custom firmware counter
+	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
+	 */
+	int (*fw_counter_stop)(uint32_t counter_index);
+
+	/**
+	 * Custom enable irq for hardware counter
+	 * Note: 0 <= counter_index < SBI_PMU_HW_CTR_MAX
+	 */
+	void (*hw_counter_enable_irq)(uint32_t counter_index);
+
+	/**
+	 * Custom disable irq for hardware counter
+	 * Note: 0 <= counter_index < SBI_PMU_HW_CTR_MAX
+	 */
+	void (*hw_counter_disable_irq)(uint32_t counter_index);
+};
+
+/** Get the PMU platform device */
+const struct sbi_pmu_device *sbi_pmu_get_device(void);
+
+/** Set the PMU platform device */
+void sbi_pmu_set_device(const struct sbi_pmu_device *dev);
+
 /** Initialize PMU */
 int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
 
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 26c9406..87e1ff8 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -48,6 +48,9 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Platform specific PMU device */
+static const struct sbi_pmu_device *pmu_dev = NULL;
+
 /* Mapping between event range and possible counters  */
 static struct sbi_pmu_hw_event hw_event_map[SBI_PMU_HW_EVENT_MAX] = {0};
 
@@ -113,7 +116,11 @@ static int pmu_event_validate(unsigned long event_idx)
 		event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
-		event_idx_code_max = SBI_PMU_FW_MAX;
+		if (SBI_PMU_FW_MAX <= event_idx_code &&
+		    pmu_dev && pmu_dev->fw_event_validate_code)
+			return pmu_dev->fw_event_validate_code(event_idx_code);
+		else
+			event_idx_code_max = SBI_PMU_FW_MAX;
 		break;
 	case SBI_PMU_EVENT_TYPE_HW_CACHE:
 		cache_ops_result = event_idx_code &
@@ -174,6 +181,11 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
 
+	if (SBI_PMU_FW_MAX <= event_code &&
+	    pmu_dev && pmu_dev->fw_counter_read_value)
+		fw_counters_value[hartid][cidx - num_hw_ctrs] =
+			pmu_dev->fw_counter_read_value(cidx - num_hw_ctrs);
+
 	*cval = fw_counters_value[hartid][cidx - num_hw_ctrs];
 
 	return 0;
@@ -319,6 +331,8 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		pmu_ctr_enable_irq_hw(cidx);
+	if (pmu_dev && pmu_dev->hw_counter_enable_irq)
+		pmu_dev->hw_counter_enable_irq(cidx);
 	csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
 
 skip_inhibit_update:
@@ -328,10 +342,21 @@ skip_inhibit_update:
 	return 0;
 }
 
-static int pmu_ctr_start_fw(uint32_t cidx, uint64_t ival, bool ival_update)
+static int pmu_ctr_start_fw(uint32_t cidx, uint32_t event_code,
+			    uint64_t ival, bool ival_update)
 {
+	int ret;
 	u32 hartid = current_hartid();
 
+	if (SBI_PMU_FW_MAX <= event_code &&
+	    pmu_dev && pmu_dev->fw_counter_start) {
+		ret = pmu_dev->fw_counter_start(cidx - num_hw_ctrs,
+						event_code,
+						ival, ival_update);
+		if (ret)
+			return ret;
+	}
+
 	if (ival_update)
 		fw_counters_value[hartid][cidx - num_hw_ctrs] = ival;
 	fw_counters_started[hartid] |= BIT(cidx - num_hw_ctrs);
@@ -361,7 +386,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 			/* Continue the start operation for other counters */
 			continue;
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_start_fw(cidx, ival, bUpdate);
+			ret = pmu_ctr_start_fw(cidx, event_code, ival, bUpdate);
 		else
 			ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
 	}
@@ -391,8 +416,17 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
 		return SBI_EALREADY_STOPPED;
 }
 
-static int pmu_ctr_stop_fw(uint32_t cidx)
+static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t event_code)
 {
+	int ret;
+
+	if (SBI_PMU_FW_MAX <= event_code &&
+	    pmu_dev && pmu_dev->fw_counter_stop) {
+		ret = pmu_dev->fw_counter_stop(cidx - num_hw_ctrs);
+		if (ret)
+			return ret;
+	}
+
 	fw_counters_started[current_hartid()] &= ~BIT(cidx - num_hw_ctrs);
 
 	return 0;
@@ -434,7 +468,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 			continue;
 
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-			ret = pmu_ctr_stop_fw(cidx);
+			ret = pmu_ctr_stop_fw(cidx, event_code);
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
@@ -481,6 +515,9 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 		mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
 				 MHPMEVENT_MINH | MHPMEVENT_OF;
 
+	if (pmu_dev && pmu_dev->hw_counter_disable_irq)
+		pmu_dev->hw_counter_disable_irq(ctr_idx);
+
 	/* Update the inhibit flags based on inhibit flags received from supervisor */
 	pmu_update_inhibit_flags(flags, &mhpmevent_val);
 
@@ -588,21 +625,26 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
  * Thus, select the first available fw counter after sanity
  * check.
  */
-static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask, u32 hartid)
+static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask,
+			   uint32_t event_code, u32 hartid)
 {
-	int i = 0;
-	int fw_base;
-	unsigned long ctr_mask = cmask << cbase;
+	int i, cidx;
 
-	if (cbase < num_hw_ctrs)
-		fw_base = num_hw_ctrs;
-	else
-		fw_base = cbase;
+	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
+		cidx = i + cbase;
+		if (cidx < num_hw_ctrs || total_ctrs <= cidx)
+			continue;
+		if (active_events[hartid][i] != SBI_PMU_EVENT_IDX_INVALID)
+			continue;
+		if (SBI_PMU_FW_MAX <= event_code &&
+		    pmu_dev && pmu_dev->fw_counter_match_code) {
+			if (!pmu_dev->fw_counter_match_code(cidx - num_hw_ctrs,
+							    event_code))
+				continue;
+		}
 
-	for (i = fw_base; i < total_ctrs; i++)
-		if ((active_events[hartid][i] == SBI_PMU_EVENT_IDX_INVALID) &&
-		    ((1UL << i) & ctr_mask))
-			return i;
+		return i;
+	}
 
 	return SBI_ENOTSUPP;
 }
@@ -611,8 +653,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 			  unsigned long flags, unsigned long event_idx,
 			  uint64_t event_data)
 {
-	int ctr_idx = SBI_ENOTSUPP;
-	u32 hartid = current_hartid();
+	int ret, ctr_idx = SBI_ENOTSUPP;
+	u32 event_code, hartid = current_hartid();
 	int event_type;
 
 	/* Do a basic sanity check of counter base & mask */
@@ -622,6 +664,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	event_type = pmu_event_validate(event_idx);
 	if (event_type < 0)
 		return SBI_EINVAL;
+	event_code = get_cidx_code(event_idx);
 
 	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
 		/* The caller wants to skip the match because it already knows the
@@ -636,7 +679,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 
 	if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		/* Any firmware counter can be used track any firmware event */
-		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, hartid);
+		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, event_code, hartid);
 	} else {
 		ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, flags, event_idx,
 					  event_data);
@@ -655,8 +698,18 @@ skip_match:
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			fw_counters_value[hartid][ctr_idx - num_hw_ctrs] = 0;
-		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
+		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
+			if (SBI_PMU_FW_MAX <= event_code &&
+			    pmu_dev && pmu_dev->fw_counter_start) {
+				ret = pmu_dev->fw_counter_start(
+					ctr_idx - num_hw_ctrs, event_code,
+					fw_counters_value[hartid][ctr_idx - num_hw_ctrs],
+					true);
+				if (ret)
+					return ret;
+			}
 			fw_counters_started[hartid] |= BIT(ctr_idx - num_hw_ctrs);
+		}
 	}
 
 	return ctr_idx;
@@ -734,6 +787,19 @@ static void pmu_reset_event_map(u32 hartid)
 	fw_counters_started[hartid] = 0;
 }
 
+const struct sbi_pmu_device *sbi_pmu_get_device(void)
+{
+	return pmu_dev;
+}
+
+void sbi_pmu_set_device(const struct sbi_pmu_device *dev)
+{
+	if (!dev || pmu_dev)
+		return;
+
+	pmu_dev = dev;
+}
+
 void sbi_pmu_exit(struct sbi_scratch *scratch)
 {
 	u32 hartid = current_hartid();
-- 
2.34.1


