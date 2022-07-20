From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 20 Jul 2022 14:50:34 -0700
Subject: [PATCH v3  3/4] lib: sbi: Fix possible buffer overrun in counter validation
In-Reply-To: <20220720215035.3453553-1-atishp@rivosinc.com>
References: <20220720215035.3453553-1-atishp@rivosinc.com>
Message-ID: <20220720215035.3453553-4-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The active_events array is accessed with counter ID passed from the supervisor
software before the counter ID bound check. This may cause a buffer overrun
if a supervisor passes an invalid counter ID.

Fix this by moving the access part after the bound check.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index bd1ef8665a70..ae3c00374058 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -151,13 +151,13 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
 	uint32_t event_idx_type;
 	u32 hartid = current_hartid();
 
-	event_idx_val = active_events[hartid][cidx];
-
-	if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
+	if (cidx >= total_ctrs)
 		return SBI_EINVAL;
 
+	event_idx_val = active_events[hartid][cidx];
 	event_idx_type = get_cidx_type(event_idx_val);
-	if (event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
+	if (event_idx_val == SBI_PMU_EVENT_IDX_INVALID ||
+	    event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
 		return SBI_EINVAL;
 
 	*event_idx_code = get_cidx_code(event_idx_val);
-- 
2.25.1


