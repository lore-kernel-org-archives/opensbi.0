From: Xiang W <wxjstz@126.com>
Date: Tue, 23 Apr 2024 22:51:41 +0800
Subject: [PATCH 3/5] lib: sbi: Removal unnecessary check dbtr_thishart_state_ptr
In-Reply-To: <20240423145147.391425-1-wxjstz@126.com>
References: <20240423145147.391425-1-wxjstz@126.com>
Message-ID: <20240423145147.391425-4-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After getting hart_shmem_base, dbtr_thishart_state_ptr cannot be
empty. So remove check code.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 478852e..9e0bdf6 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -683,8 +683,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	hs = dbtr_thishart_state_ptr();
-	if (!hs)
-		return SBI_ERR_FAILED;
 
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
-- 
2.43.0


