From: Clément Léger <cleger@rivosinc.com>
Date: Fri,  6 Dec 2024 21:59:55 +0100
Subject: [PATCH 1/3] lib: sbi: sse: Return a value from the register callback
In-Reply-To: <20241206205958.1055770-1-cleger@rivosinc.com>
References: <20241206205958.1055770-1-cleger@rivosinc.com>
Message-ID: <20241206205958.1055770-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some events might not be available to registration due to missing
dependencies (ISA extensions for instance). Return an 'int' from the
register_cb() callback so that this can be handled.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_sse.h |  2 +-
 lib/sbi/sbi_sse.c     | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
index 7419698a..58bd2ae0 100644
--- a/include/sbi/sbi_sse.h
+++ b/include/sbi/sbi_sse.h
@@ -36,7 +36,7 @@ struct sbi_sse_cb_ops {
 	/**
 	 * Called when the SBI_EXT_SSE_REGISTER is invoked on the event.
 	 */
-	void (*register_cb)(uint32_t event_id);
+	int (*register_cb)(uint32_t event_id);
 
 	/**
 	 * Called when the SBI_EXT_SSE_UNREGISTER is invoked on the event.
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index bf5620e8..5679c26f 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -50,6 +50,15 @@ static const uint32_t supported_events[] = {
 
 #define EVENT_COUNT array_size(supported_events)
 
+#define sse_event_invoke_cb_ret(_event, _cb, ...)                             \
+	({                                                                    \
+		int __ret = 0;                                                \
+		if (_event->cb_ops && _event->cb_ops->_cb)                    \
+			__ret = _event->cb_ops->_cb(_event->event_id,         \
+						   ##__VA_ARGS__);            \
+		__ret;							      \
+	})
+
 #define sse_event_invoke_cb(_event, _cb, ...)                                 \
 	{                                                                     \
 		if (_event->cb_ops && _event->cb_ops->_cb)                    \
@@ -423,16 +432,19 @@ static int sse_event_register(struct sbi_sse_event *e,
 			      unsigned long handler_entry_pc,
 			      unsigned long handler_entry_arg)
 {
+	int ret;
 	if (sse_event_state(e) != SBI_SSE_STATE_UNUSED)
 		return SBI_EINVALID_STATE;
 
+	ret = sse_event_invoke_cb_ret(e, register_cb);
+	if (ret)
+		return ret;
+
 	e->attrs.entry.pc = handler_entry_pc;
 	e->attrs.entry.arg = handler_entry_arg;
 
 	sse_event_set_state(e, SBI_SSE_STATE_REGISTERED);
 
-	sse_event_invoke_cb(e, register_cb);
-
 	return 0;
 }
 
-- 
2.45.2


