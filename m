From: Xiang W <wxjstz@126.com>
Date: Wed,  1 Feb 2023 23:06:40 +0800
Subject: [PATCH 2/4] lib: sbi: Optimize sbi_ipi
In-Reply-To: <20230201150642.161265-1-wxjstz@126.com>
References: <20230201150642.161265-1-wxjstz@126.com>
Message-ID: <20230201150642.161265-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

the original sbI_ipi will be processed by hart by hart, after optimization,
send ipi first and finally wait together.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ipi.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 1bcc2e4..92a33bd 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -31,7 +31,7 @@ static unsigned long ipi_data_off;
 static const struct sbi_ipi_device *ipi_dev = NULL;
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
-static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
+static int sbi_ipi_update(struct sbi_scratch *scratch, u32 remote_hartid,
 			u32 event, void *data)
 {
 	int ret;
@@ -69,6 +69,18 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
+	return 0;
+}
+
+static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
+{
+	const struct sbi_ipi_event_ops *ipi_ops;
+
+	if ((SBI_IPI_EVENT_MAX <= event) ||
+	    !ipi_ops_array[event])
+		return SBI_EINVAL;
+	ipi_ops = ipi_ops_array[event];
+
 	if (ipi_ops->sync)
 		ipi_ops->sync(scratch);
 
@@ -83,7 +95,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 {
 	int rc;
-	ulong i, m;
+	ulong i, m, n;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
@@ -92,19 +104,37 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		if (rc)
 			return rc;
 		m &= hmask;
+		n = m;
 
-		/* Send IPIs */
+		/* update IPIs */
 		for (i = hbase; m; i++, m >>= 1) {
 			if (m & 1UL)
-				sbi_ipi_send(scratch, i, event, data);
+				sbi_ipi_update(scratch, i, event, data);
+		}
+
+		/* sync IPIs */
+		m = n;
+		for (i = hbase; m; i++, m >>= 1) {
+			if (m & 1UL)
+				sbi_ipi_sync(scratch, event);
 		}
 	} else {
+		/* update IPIs */
+		hbase = 0;
+		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
+			for (i = hbase; m; i++, m >>= 1) {
+				if (m & 1UL)
+					sbi_ipi_update(scratch, i, event, data);
+			}
+			hbase += BITS_PER_LONG;
+		}
+
+		/* sync IPIs */
 		hbase = 0;
 		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
-			/* Send IPIs */
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
-					sbi_ipi_send(scratch, i, event, data);
+					sbi_ipi_sync(scratch, event);
 			}
 			hbase += BITS_PER_LONG;
 		}
-- 
2.39.0


