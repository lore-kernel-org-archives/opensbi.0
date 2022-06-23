From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 23 Jun 2022 17:13:35 +0300
Subject: [PATCH 1/1] lib: pmu: allow to use the highest available counter
Message-ID: <20220623141335.360952-1-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Both OpenSBI and OS explicitly assume that there is no hardware counter
with index 1: hardware uses that bit for TM control. So OpenSBI filters
out that index in sanity checks. However the range sanity checks do not
treat that index in a special way. As a result, OpenSBI does not allow
to use the firmware counter with the highest index. This change modifies
range checks to allow access to the highest index firmware counter.

The simple test is to make sure that there is no counter multiplexing
in the following command:

$ perf stat -e \
	r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
	r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
	r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
	r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
	ls

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

---

Note that perf RISC-V SBI Linux driver is adapted for the current OpenSBI
behavior: it passes counters mask with exluded highest valid index. So the
accompanying fix is also required for Linux, see the patches posted to
the risc-v mailing list:

https://lore.kernel.org/linux-riscv/20220623112735.357093-1-geomatsi at gmail.com/T/#m4811c83cf767cdaaeb31e2530d4a51034fcf6c3c

 lib/sbi/sbi_pmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 3ecf536..b386d33 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -115,7 +115,7 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
 
 	event_idx_val = active_events[hartid][cidx];
 
-	if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
+	if (cidx > total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
 		return SBI_EINVAL;
 
 	event_idx_type = get_cidx_type(event_idx_val);
@@ -347,13 +347,13 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	int ret = SBI_EINVAL;
 	bool bUpdate = FALSE;
 
-	if (sbi_fls(ctr_mask) >= total_ctrs)
+	if (sbi_fls(ctr_mask) > total_ctrs)
 		return ret;
 
 	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
 		bUpdate = TRUE;
 
-	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
+	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs + 1) {
 		event_idx_type = pmu_ctr_validate(cbase, &event_code);
 		if (event_idx_type < 0)
 			/* Continue the start operation for other counters */
@@ -423,10 +423,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	uint32_t event_code;
 	unsigned long ctr_mask = cmask << cbase;
 
-	if (sbi_fls(ctr_mask) >= total_ctrs)
+	if (sbi_fls(ctr_mask) > total_ctrs)
 		return SBI_EINVAL;
 
-	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
+	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs + 1) {
 		event_idx_type = pmu_ctr_validate(cbase, &event_code);
 		if (event_idx_type < 0)
 			/* Continue the stop operation for other counters */
@@ -598,7 +598,7 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask, u32 hartid)
 	else
 		fw_base = cbase;
 
-	for (i = fw_base; i < total_ctrs; i++)
+	for (i = fw_base; i <= total_ctrs; i++)
 		if ((active_events[hartid][i] == SBI_PMU_EVENT_IDX_INVALID) &&
 		    ((1UL << i) & ctr_mask))
 			return i;
@@ -618,7 +618,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	unsigned long tmp = cidx_mask << cidx_base;
 
 	/* Do a basic sanity check of counter base & mask */
-	if (sbi_fls(tmp) >= total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
+	if (sbi_fls(tmp) > total_ctrs || event_type >= SBI_PMU_EVENT_TYPE_MAX)
 		return SBI_EINVAL;
 
 	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
@@ -690,7 +690,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* Sanity check. Counter1 is not mapped at all */
-	if (cidx >= total_ctrs || cidx == 1)
+	if (cidx > total_ctrs || cidx == 1)
 		return SBI_EINVAL;
 
 	/* We have 31 HW counters with 31 being the last index(MHPMCOUNTER31) */
@@ -719,7 +719,7 @@ static void pmu_reset_event_map(u32 hartid)
 	int j;
 
 	/* Initialize the counter to event mapping table */
-	for (j = 3; j < total_ctrs; j++)
+	for (j = 3; j <= total_ctrs; j++)
 		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
 	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
 		sbi_memset(&fw_event_map[hartid][j], 0,
-- 
2.36.1


