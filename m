From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  8 Nov 2021 10:53:04 -0800
Subject: [PATCH v5 09/12] lib: sbi: Counter info width should be zero indexed
In-Reply-To: <20211108185307.389145-1-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
Message-ID: <20211108185307.389145-10-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The mhpm bits represent the number of bits available in mhpmcounter
while counter width describes a zero indexed value. Fix the counter width
calculation.

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 1bb3e49412b7..da8a37b1d34b 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -649,7 +649,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 		if (cidx == 0 || cidx == 2)
 			cinfo.width = 63;
 		else
-			cinfo.width = sbi_hart_mhpm_bits(scratch);
+			cinfo.width = sbi_hart_mhpm_bits(scratch) - 1;
 	} else {
 		/* it's a firmware counter */
 		cinfo.type = SBI_PMU_CTR_TYPE_FW;
-- 
2.31.1


