From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 22 Nov 2023 15:36:15 +0800
Subject: [PATCH v3 13/15] lib: utils: fdt_pmu: Do not iterate over the fdt_pmu_evt_select table
In-Reply-To: <20231122073617.379441-1-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com>
Message-ID: <20231122073617.379441-14-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The valid entry count is tracking by hw_event_count so there
is no need to check the whole table.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v2 -> v3:
  - New patch
---
 lib/utils/fdt/fdt_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index cf3220f..c531b9a 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -25,7 +25,7 @@ uint64_t fdt_pmu_get_select_value(uint32_t event_idx)
 	int i;
 	struct fdt_pmu_hw_event_select_map *event;
 
-	for (i = 0; i < SBI_PMU_HW_EVENT_MAX; i++) {
+	for (i = 0; i < hw_event_count; i++) {
 		event = &fdt_pmu_evt_select[i];
 		if (event->eidx == event_idx)
 			return event->select;
-- 
2.34.1


