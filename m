From: Xiang W <wxjstz@126.com>
Date: Tue, 31 Jan 2023 17:20:07 +0800
Subject: [PATCH 2/3] lib: sbi: Optimize sbi_ipi
In-Reply-To: <20230131092008.51078-1-wxjstz@126.com>
References: <20230131092008.51078-1-wxjstz@126.com>
Message-ID: <20230131092008.51078-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

the original sbI_ipi will be processed by hart by hart, after optimization,
send ipi first and finally wait together.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ipi.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 1bcc2e4..57d62a0 100644
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
@@ -75,6 +75,21 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 	return 0;
 }
 
+static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
+{
+	const struct sbi_ipi_event_ops *ipi_ops;
+
+	if ((SBI_IPI_EVENT_MAX <= event) ||
+	    !ipi_ops_array[event])
+		return SBI_EINVAL;
+	ipi_ops = ipi_ops_array[event];
+
+	if (ipi_ops->sync)
+		ipi_ops->sync(scratch);
+
+	return 0;
+}
+
 /**
  * As this this function only handlers scalar values of hart mask, it must be
  * set to all online harts if the intention is to send IPIs to all the harts.
@@ -93,18 +108,34 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 			return rc;
 		m &= hmask;
 
-		/* Send IPIs */
+		/* update IPIs */
 		for (i = hbase; m; i++, m >>= 1) {
 			if (m & 1UL)
-				sbi_ipi_send(scratch, i, event, data);
+				sbi_ipi_update(scratch, i, event, data);
+		}
+
+		/* sync IPIs */
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


