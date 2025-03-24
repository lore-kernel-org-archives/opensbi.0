From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 24 Mar 2025 13:15:31 +0800
Subject: [PATCH 1/1] lib: sbi: Allow programmable counters to monitor cycle/instret events for Andes PMU
Message-ID: <20250324051531.2592949-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Referencing commit 0c304b661965
("lib: sbi: Allow programmable counters to monitor cycle/instret events")
to support this functionality for Andes PMU.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 lib/sbi/sbi_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 40b898f..1873f07 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -737,7 +737,8 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 	 */
 	fixed_ctr = pmu_ctr_find_fixed_hw(event_idx);
 	if (fixed_ctr >= 0 &&
-	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF) &&
+	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_XANDESPMU))
 		return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
-- 
2.34.1


