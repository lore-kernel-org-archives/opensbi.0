From: Clément Léger <cleger@rivosinc.com>
Date: Tue,  9 Apr 2024 12:02:06 +0200
Subject: [PATCH 5/7] lib: sbi: sse: call enable callback before sending IPI
In-Reply-To: <20240409100216.263256-1-cleger@rivosinc.com>
References: <20240409100216.263256-1-cleger@rivosinc.com>
Message-ID: <20240409100216.263256-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the enable callback call before sending the IPI. Even though the
event is locked and no race condition can happen, this is more logical.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reported-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_sse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 61d1f78..8b448bf 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -686,12 +686,12 @@ static int sse_event_enable(struct sbi_sse_event *e)
 	sse_event_set_state(e, SBI_SSE_STATE_ENABLED);
 	sse_event_add_to_list(e);
 
-	if (sse_event_pending(e))
+	sse_event_invoke_cb(e, enable_cb);
+
+	if (sse_event_is_global(e) && sse_event_pending(e))
 		sbi_ipi_send_many(1, e->attrs.hartid, sse_ipi_inject_event,
 				  NULL);
 
-	sse_event_invoke_cb(e, enable_cb);
-
 	return SBI_OK;
 }
 
-- 
2.43.0


