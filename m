From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 20 Mar 2023 11:09:57 +0100
Subject: [PATCH 1/2] lib: sbi: Do not clear active_events for cycle/instret when stopping
Message-ID: <20230320100958.16831-1-alexghiti@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Those events are enabled by default and should not be reset afterwards
since when using SBI_PMU_CFG_FLAG_SKIP_MATCH, it leads to unaccessible
counters after the first use.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 74d6912..2176cc7 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -531,7 +531,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
-		if (flag & SBI_PMU_STOP_FLAG_RESET) {
+		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
 			active_events[hartid][cidx] = SBI_PMU_EVENT_IDX_INVALID;
 			pmu_reset_hw_mhpmevent(cidx);
 		}
-- 
2.37.2


