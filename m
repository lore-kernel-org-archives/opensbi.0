From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 12 Dec 2024 21:34:21 +0100
Subject: [PATCH v3 5/5] lib: sbi: sse: set non-software events as unsupported
In-Reply-To: <20241212203422.1887665-1-cleger@rivosinc.com>
References: <20241212203422.1887665-1-cleger@rivosinc.com>
Message-ID: <20241212203422.1887665-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that a callback was added to check if events are supported, set all
non software events as unsupported by default. Drivers that wants to
enable them will need to register an is_supproted_cb() SSE callback.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index f2a9d791..4ec12052 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -51,10 +51,10 @@ static const struct sbi_sse_cb_ops supported_event_ops = {
 };
 
 static struct sse_event_info valid_events[] = {
-	{.event_id = SBI_SSE_EVENT_LOCAL_RAS, .cb_ops = &supported_event_ops},
-	{.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .cb_ops = &supported_event_ops},
-	{.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .cb_ops = &supported_event_ops},
-	{.event_id = SBI_SSE_EVENT_LOCAL_PMU, .cb_ops = &supported_event_ops},
+	{.event_id = SBI_SSE_EVENT_LOCAL_RAS, .cb_ops = NULL},
+	{.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .cb_ops = NULL},
+	{.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .cb_ops = NULL},
+	{.event_id = SBI_SSE_EVENT_LOCAL_PMU, .cb_ops = NULL},
 	{.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE, .cb_ops = &supported_event_ops},
 	{.event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE, .cb_ops = &supported_event_ops},
 };
-- 
2.45.2


