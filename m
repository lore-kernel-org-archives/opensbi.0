From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 04 Dec 2024 16:43:47 -0800
Subject: [PATCH 2/2] lib: sbi_pmu: Verify the raw events first during event
 info
In-Reply-To: <20241204-pmu_event_info_fixes-v1-0-05c484c7345b@rivosinc.com>
References: <20241204-pmu_event_info_fixes-v1-0-05c484c7345b@rivosinc.com>
Message-ID: <20241204-pmu_event_info_fixes-v1-2-05c484c7345b@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The raw events have same event_idx. Thus, the event info sanity check
only relies on the select mask. The raw event check should be done first
so that regular hardware events can be verified using event idx range
check.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index dca52eb1edbe..73ef0ca00d86 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1014,20 +1014,19 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		} else {
 			for (j = 0; j < num_hw_events; j++) {
 				temp = &hw_event_map[j];
-				if (temp->start_idx <= event_idx && event_idx <= temp->end_idx) {
-					found = true;
-					break;
-				}
 				/* For raw events, event data is used as the select value */
 				if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
 					event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
-					uint64_t select_mask = temp->select_mask;
-
 					/* just match the selector */
-					if (temp->select == (einfo[i].event_data & select_mask)) {
+					if (temp->select == (einfo[i].event_data &
+									temp->select_mask)) {
 						found = true;
 						break;
 					}
+				} else if (temp->start_idx <= event_idx &&
+					   event_idx <= temp->end_idx) {
+					found = true;
+					break;
 				}
 			}
 			if (found)

-- 
2.34.1


