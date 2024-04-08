From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon,  8 Apr 2024 09:29:04 +0200
Subject: [PATCH 1/1] lib: sbi: sse_event_get() may return NULL
Message-ID: <20240408072904.48833-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sse_event_get() may return NULL. We should not dereference the return value
in sbi_sse_exit() without checking.

Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_sse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index a686692..f0729f9 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1119,7 +1119,7 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
 	for (i = 0; i < EVENT_COUNT; i++) {
 		e = sse_event_get(supported_events[i]);
 
-		if (e->attrs.hartid != current_hartid())
+		if (!e || e->attrs.hartid != current_hartid())
 			continue;
 
 		if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
-- 
2.43.0


