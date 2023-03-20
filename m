From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 20 Mar 2023 11:09:58 +0100
Subject: [PATCH 2/2] lib: sbi: Fix cidx_base check when SBI_PMU_CFG_FLAG_SKIP_MATCH is set
In-Reply-To: <20230320100958.16831-1-alexghiti@rivosinc.com>
References: <20230320100958.16831-1-alexghiti@rivosinc.com>
Message-ID: <20230320100958.16831-2-alexghiti@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When SBI_PMU_CFG_FLAG_SKIP_MATCH is set, cidx_base is used to represent
the counter index to match, so make sure we don't return an error in
this case.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 2176cc7..ffdbe65 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -722,8 +722,16 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	u32 event_code, hartid = current_hartid();
 	int event_type;
 
-	/* Do a basic sanity check of counter base & mask */
-	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
+	/*
+	 * Do a basic sanity check of counter base & mask but not when
+	 * flags has the skip match bit set since cidx_base has a
+	 * different meaning there.
+	 */
+	if ((flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) && cidx_base > total_ctrs)
+		return SBI_EINVAL;
+
+	if (!(flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) &&
+	    ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs))
 		return SBI_EINVAL;
 
 	event_type = pmu_event_validate(event_idx, event_data);
-- 
2.37.2


