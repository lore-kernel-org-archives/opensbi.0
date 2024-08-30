From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:08 -0700
Subject: [PATCH 04/12] lib: sbi_sse: Cache the event's target hart index
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This avoids needing to map the target hartid to a hart index when
enabling or disabling an event, and provides a net code size reduction.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_sse.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 52172fcd..365a878f 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -108,6 +108,7 @@ assert_field_offset(interrupted.a7, SBI_SSE_ATTR_INTERRUPTED_A7);
 struct sbi_sse_event {
 	struct sbi_sse_event_attrs attrs;
 	uint32_t event_id;
+	u32 hartindex;
 	const struct sbi_sse_cb_ops *cb_ops;
 	struct sbi_dlist node;
 };
@@ -197,7 +198,7 @@ static bool sse_event_is_local(struct sbi_sse_event *e)
  */
 static struct sse_hart_state *sse_get_hart_state(struct sbi_sse_event *e)
 {
-	struct sbi_scratch *s = sbi_hartid_to_scratch(e->attrs.hartid);
+	struct sbi_scratch *s = sbi_hartindex_to_scratch(e->hartindex);
 
 	return sse_get_hart_state_ptr(s);
 }
@@ -392,6 +393,7 @@ static void sse_event_set_attr(struct sbi_sse_event *e, uint32_t attr_id,
 		break;
 	case SBI_SSE_ATTR_PREFERRED_HART:
 		e->attrs.hartid = val;
+		e->hartindex = sbi_hartid_to_hartindex(val);
 		sse_event_invoke_cb(e, set_hartid_cb, val);
 		break;
 
@@ -1017,6 +1019,7 @@ int sbi_sse_unregister(uint32_t event_id)
 static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
 {
 	e->event_id = event_id;
+	e->hartindex = current_hartindex();
 	e->attrs.hartid = current_hartid();
 	/* Declare all events as injectable */
 	e->attrs.status |= BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET);
-- 
2.45.1


