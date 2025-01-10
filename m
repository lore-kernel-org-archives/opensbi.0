From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 10 Jan 2025 14:15:54 +0100
Subject: [PATCH v6 5/7] lib: sbi: sse: allow adding new events
In-Reply-To: <20250110131557.3261411-1-cleger@rivosinc.com>
References: <20250110131557.3261411-1-cleger@rivosinc.com>
Message-ID: <20250110131557.3261411-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to allow events to be dynamically added, remove the existing
static array of events and use a simply linked list of supported events.
This allows us to move the cb_ops into this list and associated it with
an event_id. Drivers can now register cb_ops before bringing up the sse
core to handle additional events (platform ones for instance).

sbi_sse_init() now allocates as many events as present in the linked
list. Events can now be added with sbi_sse_add_event() which allows to
add new supported events with some callback operations if any. If an
event is not to be supported, then sbi_sse_add_event() should not be
called. This approach currently consider that local events are to be
supported on all harts (ie, they all support the same ISA or
dependencies). If per-hart event availability needs to be supported,
then, an is_supported() callback could be added later and called for
each hart.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/sbi_sse.h     |   8 +--
 lib/sbi/sbi_double_trap.c |   7 +++
 lib/sbi/sbi_init.c        |  27 +++++----
 lib/sbi/sbi_pmu.c         |   4 +-
 lib/sbi/sbi_sse.c         | 119 ++++++++++++++++++++++++--------------
 5 files changed, 106 insertions(+), 59 deletions(-)

diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
index 7419698a..fb796545 100644
--- a/include/sbi/sbi_sse.h
+++ b/include/sbi/sbi_sse.h
@@ -54,12 +54,12 @@ struct sbi_sse_cb_ops {
 	void (*disable_cb)(uint32_t event_id);
 };
 
-/* Set the callback operations for an event
- * @param event_id Event identifier (SBI_SSE_EVENT_*)
- * @param cb_ops Callback operations
+/* Add a supported event with associated callback operations
+ * @param event_id Event identifier (SBI_SSE_EVENT_* or a custom platform one)
+ * @param cb_ops Callback operations (Can be NULL if any)
  * @return 0 on success, error otherwise
  */
-int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
+int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
 
 /* Inject an event to the current hard
  * @param event_id Event identifier (SBI_SSE_EVENT_*)
diff --git a/lib/sbi/sbi_double_trap.c b/lib/sbi/sbi_double_trap.c
index bab96fb7..d0ddb493 100644
--- a/lib/sbi/sbi_double_trap.c
+++ b/lib/sbi/sbi_double_trap.c
@@ -10,6 +10,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_trap.h>
 
@@ -28,3 +29,9 @@ int sbi_double_trap_handler(struct sbi_trap_context *tcntx)
 
 	return sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP);
 }
+
+void sbi_double_trap_init(struct sbi_scratch *scratch)
+{
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSDBLTRP))
+		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, NULL);
+}
\ No newline at end of file
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 58030cf2..3f654c80 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_cppc.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_double_trap.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_fwft.h>
 #include <sbi/sbi_hart.h>
@@ -266,12 +267,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_sse_init(scratch, true);
-	if (rc) {
-		sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
-		sbi_hart_hang();
-	}
-
 	rc = sbi_pmu_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: pmu init failed (error %d)\n",
@@ -285,6 +280,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_boot_print_banner(scratch);
 
+	sbi_double_trap_init(scratch);
+
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
@@ -346,6 +343,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
+	/*
+	 * Note: SSE events callbacks can be registered by other drivers so
+	 * sbi_sse_init() needs to be called after all drivers have been probed.
+	 */
+	rc = sbi_sse_init(scratch, true);
+	if (rc) {
+		sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
+		sbi_hart_hang();
+	}
+
 	/*
 	 * Note: Ecall initialization should be after platform final
 	 * initialization so that all available platform devices are
@@ -408,10 +415,6 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_sse_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
 	rc = sbi_pmu_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
@@ -444,6 +447,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_sse_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	/*
 	 * Configure PMP at last because if SMEPMP is detected,
 	 * M-mode access to the S/U space will be rescinded.
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index c6df45a7..6e69a4dc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1164,9 +1164,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 			return SBI_EINVAL;
 
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
-	}
 
-	sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+	}
 
 	phs = pmu_get_hart_state_ptr(scratch);
 	if (!phs) {
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index f710338e..005eb56e 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -23,6 +23,7 @@
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_slist.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 
@@ -39,21 +40,11 @@
 
 #define EVENT_IS_GLOBAL(__event_id) ((__event_id) & SBI_SSE_EVENT_GLOBAL_BIT)
 
-static const uint32_t supported_events[] = {
-	SBI_SSE_EVENT_LOCAL_RAS,
-	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
-	SBI_SSE_EVENT_GLOBAL_RAS,
-	SBI_SSE_EVENT_LOCAL_PMU,
-	SBI_SSE_EVENT_LOCAL_SOFTWARE,
-	SBI_SSE_EVENT_GLOBAL_SOFTWARE,
-};
-
-#define EVENT_COUNT array_size(supported_events)
-
 #define sse_event_invoke_cb(_event, _cb, ...)                                 \
 	{                                                                     \
-		if (_event->cb_ops && _event->cb_ops->_cb)                    \
-			_event->cb_ops->_cb(_event->event_id, ##__VA_ARGS__); \
+		const struct sbi_sse_cb_ops *__ops = _event->info->cb_ops;    \
+		if (__ops && __ops->_cb)                                      \
+			__ops->_cb(_event->event_id, ##__VA_ARGS__);          \
 	}
 
 struct sse_entry_state {
@@ -110,7 +101,7 @@ struct sbi_sse_event {
 	struct sbi_sse_event_attrs attrs;
 	uint32_t event_id;
 	u32 hartindex;
-	const struct sbi_sse_cb_ops *cb_ops;
+	struct sse_event_info *info;
 	struct sbi_dlist node;
 };
 
@@ -167,6 +158,12 @@ struct sse_global_event {
 	spinlock_t lock;
 };
 
+struct sse_event_info {
+	uint32_t event_id;
+	const struct sbi_sse_cb_ops *cb_ops;
+	SBI_SLIST_NODE(sse_event_info);
+};
+
 static unsigned int local_event_count;
 static unsigned int global_event_count;
 static struct sse_global_event *global_events;
@@ -180,6 +177,31 @@ static u32 sse_ipi_inject_event = SBI_IPI_EVENT_MAX;
 
 static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id);
 
+struct sse_event_info global_software_event = {
+	.event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE,
+	SBI_SLIST_NODE_INIT(NULL),
+};
+
+struct sse_event_info local_software_event = {
+	.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE,
+	SBI_SLIST_NODE_INIT(&global_software_event),
+};
+
+static SBI_SLIST_HEAD(supported_events, sse_event_info) =
+				SBI_SLIST_HEAD_INIT(&local_software_event);
+
+static struct sse_event_info *sse_event_info_get(uint32_t event_id)
+{
+	struct sse_event_info *info;
+
+	SBI_SLIST_FOR_EACH_ENTRY(info, supported_events) {
+		if (info->event_id == event_id)
+			return info;
+	}
+
+	return NULL;
+}
+
 static unsigned long sse_event_state(struct sbi_sse_event *e)
 {
 	return e->attrs.status & SBI_SSE_ATTR_STATUS_STATE_MASK;
@@ -867,20 +889,26 @@ int sbi_sse_inject_event(uint32_t event_id)
 	return sse_inject_event(event_id, current_hartid());
 }
 
-int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
+int sbi_sse_add_event(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
 {
-	int ret;
-	struct sbi_sse_event *e;
+	struct sse_event_info *info;
 
-	if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
+	/* Do not allow adding an event twice */
+	info = sse_event_info_get(event_id);
+	if (info)
 		return SBI_EINVAL;
 
-	ret = sse_event_get(event_id, &e);
-	if (ret)
-		return ret;
+	if (cb_ops && cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
+		return SBI_EINVAL;
 
-	e->cb_ops = cb_ops;
-	sse_event_put(e);
+	info = sbi_zalloc(sizeof(*info));
+	if (!info)
+		return SBI_ENOMEM;
+
+	info->cb_ops = cb_ops;
+	info->event_id = event_id;
+
+	SBI_SLIST_ADD(info, supported_events);
 
 	return SBI_OK;
 }
@@ -1063,9 +1091,10 @@ int sbi_sse_unregister(uint32_t event_id)
 	return ret;
 }
 
-static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
+static void sse_event_init(struct sbi_sse_event *e, struct sse_event_info *info)
 {
-	e->event_id = event_id;
+	e->event_id = info->event_id;
+	e->info = info;
 	e->hartindex = current_hartindex();
 	e->attrs.hartid = current_hartid();
 	/* Declare all events as injectable */
@@ -1074,10 +1103,10 @@ static void sse_event_init(struct sbi_sse_event *e, uint32_t event_id)
 
 static void sse_event_count_init()
 {
-	unsigned int i;
+	struct sse_event_info *info;
 
-	for (i = 0; i < EVENT_COUNT; i++) {
-		if (EVENT_IS_GLOBAL(supported_events[i]))
+	SBI_SLIST_FOR_EACH_ENTRY(info, supported_events) {
+		if (EVENT_IS_GLOBAL(info->event_id))
 			global_event_count++;
 		else
 			local_event_count++;
@@ -1087,18 +1116,19 @@ static void sse_event_count_init()
 static int sse_global_init()
 {
 	struct sbi_sse_event *e;
-	unsigned int i, ev = 0;
+	unsigned int ev = 0;
+	struct sse_event_info *info;
 
 	global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
 	if (!global_events)
 		return SBI_ENOMEM;
 
-	for (i = 0; i < EVENT_COUNT; i++) {
-		if (!EVENT_IS_GLOBAL(supported_events[i]))
+	SBI_SLIST_FOR_EACH_ENTRY(info, supported_events) {
+		if (!EVENT_IS_GLOBAL(info->event_id))
 			continue;
 
 		e = &global_events[ev].event;
-		sse_event_init(e, supported_events[i]);
+		sse_event_init(e, info);
 		SPIN_LOCK_INIT(global_events[ev].lock);
 
 		ev++;
@@ -1109,16 +1139,16 @@ static int sse_global_init()
 
 static void sse_local_init(struct sse_hart_state *shs)
 {
-	unsigned int i, ev = 0;
+	unsigned int ev = 0;
+	struct sse_event_info *info;
 
 	SBI_INIT_LIST_HEAD(&shs->enabled_event_list);
 	SPIN_LOCK_INIT(shs->enabled_event_lock);
 
-	for (i = 0; i < EVENT_COUNT; i++) {
-		if (EVENT_IS_GLOBAL(supported_events[i]))
+	SBI_SLIST_FOR_EACH_ENTRY(info, supported_events) {
+		if (EVENT_IS_GLOBAL(info->event_id))
 			continue;
-
-		sse_event_init(&shs->local_events[ev++], supported_events[i]);
+		sse_event_init(&shs->local_events[ev++], info);
 	}
 }
 
@@ -1148,7 +1178,8 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 		}
 
 		sse_inject_fifo_mem_off = sbi_scratch_alloc_offset(
-			EVENT_COUNT * sizeof(struct sse_ipi_inject_data));
+			(global_event_count + local_event_count) *
+			sizeof(struct sse_ipi_inject_data));
 		if (!sse_inject_fifo_mem_off) {
 			sbi_scratch_free_offset(sse_inject_fifo_off);
 			sbi_scratch_free_offset(shs_ptr_off);
@@ -1185,7 +1216,8 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 	sse_inject_mem =
 		sbi_scratch_offset_ptr(scratch, sse_inject_fifo_mem_off);
 
-	sbi_fifo_init(sse_inject_q, sse_inject_mem, EVENT_COUNT,
+	sbi_fifo_init(sse_inject_q, sse_inject_mem,
+		      (global_event_count + local_event_count),
 		      sizeof(struct sse_ipi_inject_data));
 
 	return 0;
@@ -1193,18 +1225,19 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 
 void sbi_sse_exit(struct sbi_scratch *scratch)
 {
-	int i;
 	struct sbi_sse_event *e;
+	struct sse_event_info *info;
 
-	for (i = 0; i < EVENT_COUNT; i++) {
-		if (sse_event_get(supported_events[i], &e))
+	SBI_SLIST_FOR_EACH_ENTRY(info, supported_events) {
+		if (sse_event_get(info->event_id, &e))
 			continue;
 
 		if (e->attrs.hartid != current_hartid())
 			goto skip;
 
 		if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
-			sbi_printf("Event %d in invalid state at exit", i);
+			sbi_printf("Event %d in invalid state at exit",
+				   info->event_id);
 			sse_event_set_state(e, SBI_SSE_STATE_UNUSED);
 		}
 
-- 
2.47.1


