From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:36 -0800
Subject: [PATCH 2/5] lib: sbi_pmu: Remove redundant check for fw events
In-Reply-To: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
Message-ID: <20241119-pmu_event_info-v1-2-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pmu_validate_event already has the same check for fw events.
The validate function is called prior to the current function
to find a counter for firmware. That's why, the redudant
check can be removed from the find counter function.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 14d6a0da984c..1ed578bac23e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -796,11 +796,6 @@ static int pmu_ctr_find_fw(struct sbi_pmu_hart_state *phs,
 {
 	int i, cidx;
 
-	if ((event_code >= SBI_PMU_FW_MAX &&
-	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
-	    event_code > SBI_PMU_FW_PLATFORM)
-		return SBI_EINVAL;
-
 	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
 		if (cidx < num_hw_ctrs || total_ctrs <= cidx)

-- 
2.34.1


