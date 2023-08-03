From: Kaiwen Xue <kaiwenx@rivosinc.com>
Date: Thu,  3 Aug 2023 11:34:15 -0700
Subject: [PATCH 1/1] lib: sbi: Fix typo for finding fixed event counter
Message-ID: <20230803183416.1468821-1-kaiwenx@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cycle and instructions are hardware events instead of firmware ones. Fix
the typo in the name of this function.

Signed-off-by: Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 7213a53..6d564e7 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -609,7 +609,7 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 	return 0;
 }
 
-static int pmu_ctr_find_fixed_fw(unsigned long evt_idx_code)
+static int pmu_ctr_find_fixed_hw(unsigned long evt_idx_code)
 {
 	/* Non-programmables counters are enabled always. No need to do lookup */
 	if (evt_idx_code == SBI_PMU_HW_CPU_CYCLES)
@@ -638,7 +638,7 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 	 * If Sscof is present try to find the programmable counter for
 	 * cycle/instret as well.
 	 */
-	fixed_ctr = pmu_ctr_find_fixed_fw(event_idx);
+	fixed_ctr = pmu_ctr_find_fixed_hw(event_idx);
 	if (fixed_ctr >= 0 &&
 	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		return fixed_ctr;
-- 
2.41.0


