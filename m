From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 04 Dec 2024 16:43:46 -0800
Subject: [PATCH 1/2] lib: sbi_pmu: Fix the sanity check condition for hw
 event map
In-Reply-To: <20241204-pmu_event_info_fixes-v1-0-05c484c7345b@rivosinc.com>
References: <20241204-pmu_event_info_fixes-v1-0-05c484c7345b@rivosinc.com>
Message-ID: <20241204-pmu_event_info_fixes-v1-1-05c484c7345b@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hardware event map function invoked from platform code should
exclude any raw events as there is a separate function for the raw
events.

Fixes: d8a483fc7fd0 ("lib: sbi_pmu: PMU raw event v2 support")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 0696ab5e568a..dca52eb1edbe 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -293,8 +293,8 @@ reset_event:
  */
 int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
 {
-	if ((eidx_start > eidx_end) || eidx_start >= SBI_PMU_EVENT_RAW_V2_IDX ||
-	     eidx_end >= SBI_PMU_EVENT_RAW_V2_IDX)
+	if ((eidx_start > eidx_end) || eidx_start >= SBI_PMU_EVENT_RAW_IDX ||
+	     eidx_end >= SBI_PMU_EVENT_RAW_IDX)
 		return SBI_EINVAL;
 
 	return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0, 0);

-- 
2.34.1


