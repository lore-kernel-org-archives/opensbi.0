From: Dong Du <Dd_nirvana@sjtu.edu.cn>
Date: Thu, 25 Nov 2021 18:38:17 +0800
Subject: [PATCH] lib: sbi: Resolve the uninitialized complaint in sbi_pmu
Message-ID: <20211125103817.6018-1-Dd_nirvana@sjtu.edu.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A recent commit (b28f0700) turns to read from CSR_MCOUNTINHIBIT after
checking the SBI_HART_HAS_MCOUNTINHIBIT HART feature, which leaves the
mctr_inhbt uninitialized in pmu_ctr_find_hw().
As a result, compiler will complain:
error: 'mctr_inhbt' may be used uninitialized in this function.

This commit resolves the issue by assigning an initial value to mctr_inhbt.

Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0eb359..5950a20 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -489,7 +489,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
 	unsigned long ctr_mask;
 	int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
 	struct sbi_pmu_hw_event *temp;
-	unsigned long mctr_inhbt;
+	unsigned long mctr_inhbt = 0;
 	u32 hartid = current_hartid();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-- 
2.33.1


