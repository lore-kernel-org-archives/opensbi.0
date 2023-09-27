From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 27 Sep 2023 16:18:04 +0200
Subject: [PATCH 1/1] lib: sbi_pmu: check for index overflows
Message-ID: <20230927141804.51473-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sbi_pmu_ctr_cfg_match() receives data from a lower privilege level.
We must catch maliciously wrong values.

Addresses-Coverity-ID: 1566114 Out-of-bounds write
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 9694aae..4e30809 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -802,6 +802,10 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		 */
 		unsigned long cidx_first = cidx_base + sbi_ffs(cidx_mask);
 
+		if (ctr_idx < 0 ||
+		    ctr_idx >= SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
+			return SBI_ENOTSUPP;
+
 		if (phs->active_events[cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
 			return SBI_EINVAL;
 		ctr_idx = cidx_first;
@@ -820,7 +824,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 					  event_idx, event_data);
 	}
 
-	if (ctr_idx < 0)
+	if (ctr_idx < 0 || ctr_idx >= SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
 		return SBI_ENOTSUPP;
 
 	phs->active_events[ctr_idx] = event_idx;
-- 
2.40.1


