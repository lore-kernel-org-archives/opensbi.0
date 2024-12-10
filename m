From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 18:05:49 +0100
Subject: [PATCH v2 1/4] lib: sbi: sse: return an error value from sse_event_get()
In-Reply-To: <20241210170553.1034872-1-cleger@rivosinc.com>
References: <20241210170553.1034872-1-cleger@rivosinc.com>
Message-ID: <20241210170553.1034872-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since event support will be checked in the next commits, return a value
from sse_event_get() to allow propagating it. This will be used to
report SBI_ERR_NOT_SUPPORTED when an event isn't supported.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 69 ++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index c9f9a9dd..ed07844a 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -244,7 +244,7 @@ static void sse_event_set_state(struct sbi_sse_event *e,
 	e->attrs.status |= new_state;
 }
 
-static struct sbi_sse_event *sse_event_get(uint32_t event_id)
+static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
 {
 	unsigned int i;
 	struct sbi_sse_event *e;
@@ -255,19 +255,22 @@ static struct sbi_sse_event *sse_event_get(uint32_t event_id)
 			e = &global_events[i].event;
 			if (e->event_id == event_id) {
 				spin_lock(&global_events[i].lock);
-				return e;
+				*eret = e;
+				return SBI_SUCCESS;
 			}
 		}
 	} else {
 		shs = sse_thishart_state_ptr();
 		for (i = 0; i < local_event_count; i++) {
 			e = &shs->local_events[i];
-			if (e->event_id == event_id)
-				return e;
+			if (e->event_id == event_id) {
+				*eret = e;
+				return SBI_SUCCESS;
+			}
 		}
 	}
 
-	return NULL;
+	return SBI_EINVAL;
 }
 
 static void sse_event_put(struct sbi_sse_event *e)
@@ -653,8 +656,7 @@ static void sse_ipi_inject_process(struct sbi_scratch *scratch)
 
 	/* Mark all queued events as pending */
 	while (!sbi_fifo_dequeue(sse_inject_fifo_r, &evt)) {
-		e = sse_event_get(evt.event_id);
-		if (!e)
+		if (sse_event_get(evt.event_id, &e))
 			continue;
 
 		sse_event_set_pending(e);
@@ -696,10 +698,9 @@ static int sse_inject_event(uint32_t event_id, unsigned long hartid)
 	int ret;
 	struct sbi_sse_event *e;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
-
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	/* In case of global event, provided hart_id is ignored */
 	if (sse_event_is_global(e))
@@ -788,9 +789,9 @@ int sbi_sse_enable(uint32_t event_id)
 	int ret;
 	struct sbi_sse_event *e;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	sse_enabled_event_lock(e);
 	ret = sse_event_enable(e);
@@ -805,9 +806,9 @@ int sbi_sse_disable(uint32_t event_id)
 	int ret;
 	struct sbi_sse_event *e;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	sse_enabled_event_lock(e);
 	ret = sse_event_disable(e);
@@ -865,14 +866,15 @@ int sbi_sse_inject_event(uint32_t event_id)
 
 int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
 {
+	int ret;
 	struct sbi_sse_event *e;
 
 	if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
 		return SBI_EINVAL;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	e->cb_ops = cb_ops;
 	sse_event_put(e);
@@ -943,9 +945,9 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	sbi_hart_map_saddr(output_phys_lo, sizeof(unsigned long) * attr_count);
 
@@ -1008,9 +1010,9 @@ int sbi_sse_write_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	ret = sse_write_attrs(e, base_attr_id, attr_count, input_phys_lo);
 	sse_event_put(e);
@@ -1033,9 +1035,9 @@ int sbi_sse_register(uint32_t event_id, unsigned long handler_entry_pc,
 					 SBI_DOMAIN_EXECUTE))
 		return SBI_EINVALID_ADDR;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	ret = sse_event_register(e, handler_entry_pc, handler_entry_arg);
 	sse_event_put(e);
@@ -1048,9 +1050,9 @@ int sbi_sse_unregister(uint32_t event_id)
 	int ret;
 	struct sbi_sse_event *e;
 
-	e = sse_event_get(event_id);
-	if (!e)
-		return SBI_EINVAL;
+	ret = sse_event_get(event_id, &e);
+	if (ret)
+		return ret;
 
 	ret = sse_event_unregister(e);
 	sse_event_put(e);
@@ -1192,8 +1194,7 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
 	struct sbi_sse_event *e;
 
 	for (i = 0; i < EVENT_COUNT; i++) {
-		e = sse_event_get(supported_events[i]);
-		if (!e)
+		if (sse_event_get(supported_events[i], &e))
 			continue;
 
 		if (e->attrs.hartid != current_hartid())
-- 
2.45.2


