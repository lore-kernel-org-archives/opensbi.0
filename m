From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 16 Dec 2024 22:21:41 +0100
Subject: [PATCH v4 4/5] lib: sbi: sse: return SBI_ENOTSUPP for unsupported events
In-Reply-To: <20241216212144.3379890-1-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
Message-ID: <20241216212144.3379890-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a standard event was not found in the list of events that are handled
by harts but belongs to the standard event list defined by the
specification, return SBI_ENOTSUPP. Without that, we can not
distinguish a non implemented standard event from a non valid one.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 665dc693..02489a62 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -187,6 +187,31 @@ struct sse_event_info local_software_event = {
 
 static struct sse_event_info *supported_events = &local_software_event;
 
+/*
+ * This array is used to distinguish between standard event and platform
+ * events in order to return SBI_ERR_NOT_SUPPORTED for them.
+ */
+static const uint32_t standard_events[] = {
+	SBI_SSE_EVENT_LOCAL_RAS,
+	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
+	SBI_SSE_EVENT_GLOBAL_RAS,
+	SBI_SSE_EVENT_LOCAL_PMU,
+	SBI_SSE_EVENT_LOCAL_SOFTWARE,
+	SBI_SSE_EVENT_GLOBAL_SOFTWARE,
+};
+
+static bool sse_is_standard_event(uint32_t event_id)
+{
+	int i;
+
+	for (i = 0; i < array_size(standard_events); i++) {
+		if (event_id == standard_events[i])
+			return true;
+	}
+
+	return false;
+}
+
 static struct sse_event_info *sse_event_info_get(uint32_t event_id)
 {
 	struct sse_event_info *info;
@@ -292,6 +317,11 @@ static int sse_event_get(uint32_t event_id, struct sbi_sse_event **eret)
 		}
 	}
 
+	/* Check if the event is a standard one but not supported */
+	if (sse_is_standard_event(event_id))
+		return SBI_ENOTSUPP;
+
+	/* If not supported nor a standard event, it is invalid */
 	return SBI_EINVAL;
 }
 
-- 
2.45.2


