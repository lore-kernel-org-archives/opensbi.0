From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 10 Dec 2024 18:05:50 +0100
Subject: [PATCH v2 2/4] lib: sbi: sse: rework event availability
In-Reply-To: <20241210170553.1034872-1-cleger@rivosinc.com>
References: <20241210170553.1034872-1-cleger@rivosinc.com>
Message-ID: <20241210170553.1034872-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to detect events that are available and supported, add a per
event 'supported' property.

To make full use of that property, add a new struct sse_event_info which
contains the 'cb_ops' as well as a 'supported' boolean. The cb_ops are
now global for a specific event_id and can be filled by drivers before
calling sse init which will use the callback to determine which events
are available. Thanks to that, we can also allocate only the supported
events and defer sse probing. All events are declared as supported to
keep the existing behavior. Since the callback operations can now be
registered once for all harts, move the pmu sse_set_cb_ops() callback to
the cold_boot 'if'.

Checking the new additional 'supported' property is only done when we
fail from getting an event so that there is no performance cost.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_init.c |  20 ++++-----
 lib/sbi/sbi_pmu.c  |   4 +-
 lib/sbi/sbi_sse.c  | 104 ++++++++++++++++++++++++++++++++-------------
 3 files changed, 86 insertions(+), 42 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 0736345d..dd8b990f 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -262,12 +262,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
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
@@ -317,6 +311,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_printf("%s: mpxy init failed (error %d)\n", __func__, rc);
 		sbi_hart_hang();
 	}
+
+	rc = sbi_sse_init(scratch, true);
+	if (rc) {
+		sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
+		sbi_hart_hang();
+	}
 	/*
 	 * Note: Finalize domains after HSM initialization so that we
 	 * can startup non-root domains.
@@ -404,10 +404,6 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_sse_init(scratch, false);
-	if (rc)
-		sbi_hart_hang();
-
 	rc = sbi_pmu_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
@@ -440,6 +436,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
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
index 0696ab5e..6f192440 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1153,9 +1153,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 			return SBI_EINVAL;
 
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
-	}
 
-	sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+		sbi_sse_set_cb_ops(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+	}
 
 	phs = pmu_get_hart_state_ptr(scratch);
 	if (!phs) {
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index ed07844a..4c186a22 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -39,21 +39,28 @@
 
 #define EVENT_IS_GLOBAL(__event_id) ((__event_id) & SBI_SSE_EVENT_GLOBAL_BIT)
 
-static const uint32_t supported_events[] = {
-	SBI_SSE_EVENT_LOCAL_RAS,
-	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
-	SBI_SSE_EVENT_GLOBAL_RAS,
-	SBI_SSE_EVENT_LOCAL_PMU,
-	SBI_SSE_EVENT_LOCAL_SOFTWARE,
-	SBI_SSE_EVENT_GLOBAL_SOFTWARE,
+struct sse_event_info {
+	uint32_t event_id;
+	bool supported;
+	const struct sbi_sse_cb_ops *cb_ops;
+};
+
+static struct sse_event_info valid_events[] = {
+	{.event_id = SBI_SSE_EVENT_LOCAL_RAS, .supported = true},
+	{.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .supported = true},
+	{.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .supported = true},
+	{.event_id = SBI_SSE_EVENT_LOCAL_PMU, .supported = true},
+	{.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE, .supported = true},
+	{.event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE, .supported = true},
 };
 
-#define EVENT_COUNT array_size(supported_events)
+#define EVENT_COUNT array_size(valid_events)
 
 #define sse_event_invoke_cb(_event, _cb, ...)                                 \
 	{                                                                     \
-		if (_event->cb_ops && _event->cb_ops->_cb)                    \
-			_event->cb_ops->_cb(_event->event_id, ##__VA_ARGS__); \
+		const struct sbi_sse_cb_ops *__ops = _event->info->cb_ops;    \
+		if (__ops && __ops->_cb)                                          \
+			__ops->_cb(_event->event_id, ##__VA_ARGS__);            \
 	}
 
 struct sse_entry_state {
@@ -110,7 +117,7 @@ struct sbi_sse_event {
 	struct sbi_sse_event_attrs attrs;
 	uint32_t event_id;
 	u32 hartindex;
-	const struct sbi_sse_cb_ops *cb_ops;
+	struct sse_event_info *info;
 	struct sbi_dlist node;
 };
 
@@ -244,6 +251,30 @@ static void sse_event_set_state(struct sbi_sse_event *e,
 	e->attrs.status |= new_state;
 }
 
+static struct sse_event_info *sse_event_info_get(uint32_t event_id)
+{
+	struct sse_event_info *info;
+	int i;
+
+	for (i = 0; i < EVENT_COUNT; i++) {
+		info = &valid_events[i];
+		if (info->event_id == event_id)
+			return info;
+	}
+
+	return NULL;
+}
+
+static int sse_event_is_supported(uint32_t event_id)
+{
+	struct sse_event_info *info = sse_event_info_get(event_id);
+
+	if (!info)
+		return SBI_EINVAL;
+
+	return info->supported ? SBI_SUCCESS : SBI_ENOTSUPP;
+}
+
 static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
 {
 	unsigned int i;
@@ -270,7 +301,7 @@ static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
 		}
 	}
 
-	return SBI_EINVAL;
+	return sse_event_is_supported(event_id);
 }
 
 static void sse_event_put(struct sbi_sse_event *e)
@@ -866,18 +897,16 @@ int sbi_sse_inject_event(uint32_t event_id)
 
 int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
 {
-	int ret;
-	struct sbi_sse_event *e;
+	struct sse_event_info *info;
 
-	if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
+	info = sse_event_info_get(event_id);
+	if (!info)
 		return SBI_EINVAL;
 
-	ret = sse_event_get(event_id, &e);
-	if (ret)
-		return ret;
+	if (cb_ops->set_hartid_cb && !EVENT_IS_GLOBAL(event_id))
+		return SBI_EINVAL;
 
-	e->cb_ops = cb_ops;
-	sse_event_put(e);
+	info->cb_ops = cb_ops;
 
 	return SBI_OK;
 }
@@ -1060,21 +1089,27 @@ int sbi_sse_unregister(uint32_t event_id)
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
 	e->attrs.status |= BIT(SBI_SSE_ATTR_STATUS_INJECT_OFFSET);
 }
 
-static void sse_event_count_init()
+static void sse_event_info_init(void)
 {
 	unsigned int i;
+	struct sse_event_info *info;
 
 	for (i = 0; i < EVENT_COUNT; i++) {
-		if (EVENT_IS_GLOBAL(supported_events[i]))
+		info = &valid_events[i];
+		if (!info->supported)
+			continue;
+
+		if (EVENT_IS_GLOBAL(info->event_id))
 			global_event_count++;
 		else
 			local_event_count++;
@@ -1083,6 +1118,7 @@ static void sse_event_count_init()
 
 static int sse_global_init()
 {
+	struct sse_event_info *info;
 	struct sbi_sse_event *e;
 	unsigned int i, ev = 0;
 
@@ -1091,11 +1127,12 @@ static int sse_global_init()
 		return SBI_ENOMEM;
 
 	for (i = 0; i < EVENT_COUNT; i++) {
-		if (!EVENT_IS_GLOBAL(supported_events[i]))
+		info = &valid_events[i];
+		if (!info->supported || !EVENT_IS_GLOBAL(info->event_id))
 			continue;
 
 		e = &global_events[ev].event;
-		sse_event_init(e, supported_events[i]);
+		sse_event_init(e, info);
 		SPIN_LOCK_INIT(global_events[ev].lock);
 
 		ev++;
@@ -1106,16 +1143,18 @@ static int sse_global_init()
 
 static void sse_local_init(struct sse_hart_state *shs)
 {
+	struct sse_event_info *info;
 	unsigned int i, ev = 0;
 
 	SBI_INIT_LIST_HEAD(&shs->enabled_event_list);
 	SPIN_LOCK_INIT(shs->enabled_event_lock);
 
 	for (i = 0; i < EVENT_COUNT; i++) {
-		if (EVENT_IS_GLOBAL(supported_events[i]))
+		info = &valid_events[i];
+		if (!info->supported || EVENT_IS_GLOBAL(info->event_id))
 			continue;
 
-		sse_event_init(&shs->local_events[ev++], supported_events[i]);
+		sse_event_init(&shs->local_events[ev++], info);
 	}
 }
 
@@ -1127,7 +1166,7 @@ int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
 	struct sbi_fifo *sse_inject_q;
 
 	if (cold_boot) {
-		sse_event_count_init();
+		sse_event_info_init();
 
 		ret = sse_global_init();
 		if (ret)
@@ -1192,9 +1231,14 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
 {
 	int i;
 	struct sbi_sse_event *e;
+	struct sse_event_info *info;
 
 	for (i = 0; i < EVENT_COUNT; i++) {
-		if (sse_event_get(supported_events[i], &e))
+		info = &valid_events[i];
+		if (!info->supported)
+			continue;
+
+		if (sse_event_get(info->event_id, &e))
 			continue;
 
 		if (e->attrs.hartid != current_hartid())
-- 
2.45.2


