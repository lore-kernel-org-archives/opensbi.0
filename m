From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon,  3 Jul 2023 15:43:18 +0200
Subject: [PATCH 1/1] lib: sbi_pmu: Avoid out of bounds access
Message-ID: <20230703134318.109435-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On a misconfigured system we could access phs->active_events[] out of
bounds. Check that num_hw_ctrs is less or equal SBI_PMU_HW_CTR_MAX.

Addresses-Coverity-ID: 1566113 ("Out-of-bounds read")
Addresses-Coverity-ID: 1566114 ("Out-of-bounds write")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index c73e6ef..7213a53 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -933,6 +933,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 
 		/* mcycle & minstret is available always */
 		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
+		if (num_hw_ctrs > SBI_PMU_HW_CTR_MAX)
+			return SBI_EINVAL;
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 	}
 
-- 
2.40.1


