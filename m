From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue,  2 Jan 2024 22:16:24 +0530
Subject: [PATCH] lib: sbi: Use mask to check the free bit during trigger allocation
Message-ID: <20240102164624.85482-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The trigger allocation function uses bit shift instead of mask to check the
mapped status of the triggers. This causes index 0 to be return always. As a
result, the older triggers are overwritten.

Use the mask for MAPPED field in state word to check if the trigger is mapped.

Fixes: 97f234f15 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 019e702..7142fed 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -129,7 +129,7 @@ static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
 
 	for (i = 0; i < hart_state->total_trigs; i++) {
 		f_trig = INDEX_TO_TRIGGER(i);
-		if (f_trig->state & RV_DBTR_BIT(TS, MAPPED))
+		if (f_trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))
 			continue;
 		hart_state->available_trigs--;
 		break;
-- 
2.42.0


