From: Atish Patra <atish.patra@wdc.com>
Date: Tue,  2 Nov 2021 08:09:57 -0700
Subject: [PATCH v3 09/11] lib: sbi: Counter info width should be zero indexed
In-Reply-To: <20211102150959.492991-1-atish.patra@wdc.com>
References: <20211102150959.492991-1-atish.patra@wdc.com>
Message-ID: <20211102150959.492991-10-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The mhpm bits represent the number of bits available in mhpmcounter
while counter width describes a zero indexed value. Fix the counter width
calculation.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 2d1de1d58f3b..d728529488dc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -647,7 +647,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
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


