From: Xiang W <wxjstz@126.com>
Date: Fri,  3 May 2024 21:53:34 +0800
Subject: [PATCH v3 2/6] lib: sbi: Removal unnecessary check dbtr_thishart_state_ptr
In-Reply-To: <20240503135340.310030-1-wxjstz@126.com>
References: <20240503135340.310030-1-wxjstz@126.com>
Message-ID: <20240503135340.310030-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After getting hart_shmem_base, dbtr_thishart_state_ptr cannot be
empty. So remove check code.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_dbtr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5b07285..3cc1ef8 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -684,8 +684,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base();
 	hs = dbtr_thishart_state_ptr();
-	if (!hs)
-		return SBI_ERR_FAILED;
 
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
-- 
2.43.0


