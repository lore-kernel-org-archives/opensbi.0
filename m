From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 20 Feb 2025 14:44:41 +0530
Subject: [PATCH] lib: sbi: Return SBI_EALREADY error code if SSE event is present
Message-ID: <20250220091441.33730-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Return SBI_EALREADY error code instead of SBI_INVAL, in case an
event is already added to the supported list.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/sbi/sbi_sse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 9f22375..295d9bc 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -926,7 +926,7 @@ int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
 	/* Do not allow adding an event twice */
 	info = sse_event_info_get(event_id);
 	if (info)
-		return SBI_EINVAL;
+		return SBI_EALREADY;
 
 	if (cb_ops && cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
 		return SBI_EINVAL;
-- 
2.43.0


