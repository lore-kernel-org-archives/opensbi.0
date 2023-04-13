From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 13 Apr 2023 16:02:19 +0200
Subject: [PATCH v2 2/2] lib: sbi: Fix counter index calculation for SBI_PMU_CFG_FLAG_SKIP_MATCH
In-Reply-To: <20230413140219.189916-1-alexghiti@rivosinc.com>
References: <20230413140219.189916-1-alexghiti@rivosinc.com>
Message-ID: <20230413140219.189916-2-alexghiti@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As per the SBI specification, we should "unconditionally select the first
counter from the set of counters specified by the counter_idx_base and
counter_idx_mask", so implement this behaviour.

Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 2176cc7..f5dbe6d 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -735,10 +735,15 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 		/* The caller wants to skip the match because it already knows the
 		 * counter idx for the given event. Verify that the counter idx
 		 * is still valid.
+		 * As per the specification, we should "unconditionally select
+		 * the first counter from the set of counters specified by the
+		 * counter_idx_base and counter_idx_mask".
 		 */
-		if (active_events[hartid][cidx_base] == SBI_PMU_EVENT_IDX_INVALID)
+		unsigned long cidx_first = cidx_base + sbi_ffs(cidx_mask);
+
+		if (active_events[hartid][cidx_first] == SBI_PMU_EVENT_IDX_INVALID)
 			return SBI_EINVAL;
-		ctr_idx = cidx_base;
+		ctr_idx = cidx_first;
 		goto skip_match;
 	}
 
-- 
2.37.2


