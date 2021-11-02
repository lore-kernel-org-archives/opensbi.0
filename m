From: Atish Patra <atish.patra@wdc.com>
Date: Tue,  2 Nov 2021 08:09:55 -0700
Subject: [PATCH v3 07/11] lib: sbi: Allow programmable counters to monitor
 cycle/instret events
In-Reply-To: <20211102150959.492991-1-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
Message-ID: <20211102150959.492991-8-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A platform may use programmable counters for cycle/instret events.
The priv spec allows that provided that cycle/instret also report those
events in addition to the programmable counters. We should allow that
functionality in OpenSBI.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_pmu.h |  1 +
 lib/sbi/sbi_pmu.c     | 59 +++++++++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index b3010cc5c1ce..f0185566cd6d 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -26,6 +26,7 @@
 #define SBI_PMU_FW_CTR_MAX 16
 #define SBI_PMU_HW_CTR_MAX 32
 #define SBI_PMU_CTR_MAX	   (SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
+#define SBI_PMU_FIXED_CTR_MASK 0x07
 
 /** Initialize PMU */
 int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index b7bd120a6f68..9d97014eed88 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -175,9 +175,7 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
 	struct sbi_pmu_hw_event *event = &hw_event_map[num_hw_events];
 
 	/* The first two counters are reserved by priv spec */
-	if ((eidx_start == SBI_PMU_HW_CPU_CYCLES && cmap != 0x1) ||
-	    (eidx_start == SBI_PMU_HW_INSTRUCTIONS && cmap != 0x4) ||
-	    (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & 0x07)))
+	if (eidx_start > SBI_PMU_HW_INSTRUCTIONS && (cmap & SBI_PMU_FIXED_CTR_MASK))
 		return SBI_EDENIED;
 
 	if (num_hw_events >= SBI_PMU_HW_EVENT_MAX - 1) {
@@ -188,8 +186,6 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
 
 	event->start_idx = eidx_start;
 	event->end_idx = eidx_end;
-	event->counters = cmap;
-	event->select = select;
 
 	/* Sanity check */
 	for (i = 0; i < num_hw_events; i++) {
@@ -199,11 +195,19 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
 		else
 			is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
 		if (is_overlap)
-			return SBI_EINVALID_ADDR;
+			goto reset_event;
 	}
+
+	event->counters = cmap;
+	event->select = select;
 	num_hw_events++;
 
 	return 0;
+
+reset_event:
+	event->start_idx = 0;
+	event->end_idx = 0;
+	return SBI_EINVAL;
 }
 
 /**
@@ -436,23 +440,37 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 	return 0;
 }
 
+static int pmu_ctr_find_fixed_fw(unsigned long evt_idx_code)
+{
+	/* Non-programmables counters are enabled always. No need to do lookup */
+	if (evt_idx_code == SBI_PMU_HW_CPU_CYCLES)
+		return 0;
+	else if (evt_idx_code == SBI_PMU_HW_INSTRUCTIONS)
+		return 2;
+	else
+		return SBI_EINVAL;
+}
+
 static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned long flags,
 			   unsigned long event_idx, uint64_t data)
 {
 	unsigned long ctr_mask;
-	int i, ret = 0, ctr_idx = SBI_ENOTSUPP;
+	int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
 	struct sbi_pmu_hw_event *temp;
 	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
-	int evt_idx_code = get_cidx_code(event_idx);
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	bool sscof_present = sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOF);
 
 	if (cbase > num_hw_ctrs)
 		return SBI_EINVAL;
 
-	/* Non-programmables counters are enabled always. No need to do lookup */
-	if (evt_idx_code == SBI_PMU_HW_CPU_CYCLES)
-		return 0;
-	else if (evt_idx_code == SBI_PMU_HW_INSTRUCTIONS)
-		return 2;
+	/**
+	 * If Sscof is present try to find the programmable counter for
+	 * cycle/instret as well.
+	 */
+	fixed_ctr = pmu_ctr_find_fixed_fw(event_idx);
+	if (fixed_ctr >= 0 && !sscof_present)
+		return fixed_ctr;
 
 	for (i = 0; i < num_hw_events; i++) {
 		temp = &hw_event_map[i];
@@ -464,7 +482,8 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 		if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
 			continue;
 
-		ctr_mask = temp->counters & (cmask << cbase);
+		/* Fixed counters should not be part of the search */
+		ctr_mask = temp->counters & (cmask << cbase) & (~SBI_PMU_FIXED_CTR_MASK);
 		for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
 			if (__test_bit(cbase, &mctr_inhbt)) {
 				ctr_idx = cbase;
@@ -473,8 +492,16 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 		}
 	}
 
-	if (ctr_idx == SBI_ENOTSUPP)
-		return SBI_EFAIL;
+	if (ctr_idx == SBI_ENOTSUPP) {
+		/**
+		 * We can't find any programmable counters for cycle/instret.
+		 * Return the fixed counter as they are mandatory anyways.
+		 */
+		if (fixed_ctr >= 0)
+			return fixed_ctr;
+		else
+			return SBI_EFAIL;
+	}
 
 	ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
 
-- 
2.31.1


