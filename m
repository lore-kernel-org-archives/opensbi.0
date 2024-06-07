From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 7 Jun 2024 19:49:35 +0800
Subject: [RFC PATCH] sbi: sbi_domain_context: Add 'domain context switched' firmware event
Message-ID: <20240607114935.1291206-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Event codes 256-65534 are reserved for counting SBI-specific firmware events.
Allocate event code 256 as the 'domain context switched' firmware event. This
enables the perf tool to monitor trusted application invocations.

  $ perf stat -e r8000000000000100 optee_example_random
  Invoking TA to generate random UUID...
  TA generated UUID value = 0xd1dafb5b988373c9a14d1a85361b436

   Performance counter stats for 'optee_example_random':

                  96      r8000000000000100

         0.186135100 seconds time elapsed

         0.051499000 seconds user
         0.125070000 seconds sys

Also, factor out valid event code checking to the fw_event_code_valid()
function.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Alvin Chang <alvinga@andestech.com>
---
 include/sbi/sbi_ecall_interface.h |  9 +++++--
 lib/sbi/sbi_domain_context.c      |  3 +++
 lib/sbi/sbi_pmu.c                 | 43 +++++++++++++++++++------------
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index ec845c88..aff9ec4c 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -199,13 +199,18 @@ enum sbi_pmu_fw_event_code_id {
 	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
 	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
 	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
-	SBI_PMU_FW_MAX,
+	SBI_PMU_FW_LAST,
 	/*
 	 * Event codes 22 to 255 are reserved for future use.
+	 */
+	SBI_PMU_FW_MAX			= 255,
+	SBI_PMU_FW_DOMAIN_CONTEXT_SWITCHED = 256,
+	SBI_PMU_FW_IMPL_LAST,
+	/*
 	 * Event codes 256 to 65534 are reserved for SBI implementation
 	 * specific custom firmware events.
 	 */
-	SBI_PMU_FW_RESERVED_MAX = 0xFFFE,
+	SBI_PMU_FW_IMPL_MAX = 0xFFFE,
 	/*
 	 * Event code 0xFFFF is used for platform specific firmware
 	 * events where the event data contains any event specific information.
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index d9395490..d0b174c9 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain_context.h>
@@ -33,6 +34,8 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_DOMAIN_CONTEXT_SWITCHED);
+
 	/* Assign current hart to target domain */
 	spin_lock(&current_dom->assigned_harts_lock);
 	sbi_hartmask_clear_hartindex(hartindex, &current_dom->assigned_harts);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index b9e84543..fd3e70f2 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -130,6 +130,23 @@ static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
 	return false;
 }
 
+static bool fw_event_code_valid(uint32_t event_idx_code)
+{
+	/* Standard firmware events */
+	if ((0 <= event_idx_code) &&
+	    (event_idx_code < SBI_PMU_FW_LAST))
+		return true;
+	/* Implementation specific events */
+	if ((SBI_PMU_FW_MAX < event_idx_code) &&
+	    (event_idx_code < SBI_PMU_FW_IMPL_LAST))
+		return true;
+	/* Platform specific firmware events */
+	if (event_idx_code == SBI_PMU_FW_PLATFORM)
+		return true;
+
+	return false;
+}
+
 static int pmu_event_validate(struct sbi_pmu_hart_state *phs,
 			      unsigned long event_idx, uint64_t edata)
 {
@@ -143,9 +160,7 @@ static int pmu_event_validate(struct sbi_pmu_hart_state *phs,
 		event_idx_code_max = SBI_PMU_HW_GENERAL_MAX;
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
-		if ((event_idx_code >= SBI_PMU_FW_MAX &&
-		    event_idx_code <= SBI_PMU_FW_RESERVED_MAX) ||
-		    event_idx_code > SBI_PMU_FW_PLATFORM)
+		if (!fw_event_code_valid(event_idx_code))
 			return SBI_EINVAL;
 
 		if (SBI_PMU_FW_PLATFORM == event_idx_code &&
@@ -153,7 +168,7 @@ static int pmu_event_validate(struct sbi_pmu_hart_state *phs,
 			return pmu_dev->fw_event_validate_encoding(phs->hartid,
 							           edata);
 		else
-			event_idx_code_max = SBI_PMU_FW_MAX;
+			event_idx_code_max = SBI_PMU_FW_IMPL_MAX;
 		break;
 	case SBI_PMU_EVENT_TYPE_HW_CACHE:
 		cache_ops_result = event_idx_code &
@@ -217,9 +232,7 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
 
-	if ((event_code >= SBI_PMU_FW_MAX &&
-	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
-	    event_code > SBI_PMU_FW_PLATFORM)
+	if (!fw_event_code_valid(event_code))
 		return SBI_EINVAL;
 
 	if (SBI_PMU_FW_PLATFORM == event_code) {
@@ -414,9 +427,7 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 			    uint64_t event_data, uint64_t ival,
 			    bool ival_update)
 {
-	if ((event_code >= SBI_PMU_FW_MAX &&
-	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
-	    event_code > SBI_PMU_FW_PLATFORM)
+	if (!fw_event_code_valid(event_code))
 		return SBI_EINVAL;
 
 	if (SBI_PMU_FW_PLATFORM == event_code) {
@@ -518,9 +529,7 @@ static int pmu_ctr_stop_fw(struct sbi_pmu_hart_state *phs,
 {
 	int ret;
 
-	if ((event_code >= SBI_PMU_FW_MAX &&
-	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
-	    event_code > SBI_PMU_FW_PLATFORM)
+	if (!fw_event_code_valid(event_code))
 		return SBI_EINVAL;
 
 	if (SBI_PMU_FW_PLATFORM == event_code &&
@@ -792,9 +801,7 @@ static int pmu_ctr_find_fw(struct sbi_pmu_hart_state *phs,
 {
 	int i, cidx;
 
-	if ((event_code >= SBI_PMU_FW_MAX &&
-	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
-	    event_code > SBI_PMU_FW_PLATFORM)
+	if (!fw_event_code_valid(event_code))
 		return SBI_EINVAL;
 
 	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
@@ -907,8 +914,10 @@ int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
 	if (likely(!phs->fw_counters_started))
 		return 0;
 
-	if (unlikely(fw_id >= SBI_PMU_FW_MAX))
+	if (unlikely((fw_id == SBI_PMU_FW_PLATFORM) ||
+		     !fw_event_code_valid(fw_id))) {
 		return SBI_EINVAL;
+	}
 
 	for (cidx = num_hw_ctrs; cidx < total_ctrs; cidx++) {
 		if (get_cidx_code(phs->active_events[cidx]) == fw_id &&
-- 
2.34.1


