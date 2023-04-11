From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Apr 2023 12:56:19 +0800
Subject: [PATCH v5 2/4] lib: sbi: Optimize sbi_ipi
In-Reply-To: <20230411045621.60331-1-wxjstz@126.com>
References: <y>
 <20230411045621.60331-1-wxjstz@126.com>
Message-ID: <20230411045621.60331-3-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

the original sbi_ipi will be processed by hart by hart, after optimization,
send ipi first and finally wait together.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ipi.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index b9f6205..33bff7a 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
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
 
@@ -92,22 +104,40 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		if (rc)
 			return rc;
 		m &= hmask;
+		n = m;
 
-		/* Send IPIs */
+		/* update IPIs */
 		for (i = hbase; m; i++, m >>= 1) {
 			if (m & 1UL)
 				sbi_ipi_send(scratch, i, event, data);
 		}
+
+		/* sync IPIs */
+		m = n;
+		for (i = hbase; m; i++, m >>= 1) {
+			if (m & 1UL)
+				sbi_ipi_sync(scratch, event);
+		}
 	} else {
+		/* update IPIs */
 		hbase = 0;
 		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
-			/* Send IPIs */
 			for (i = hbase; m; i++, m >>= 1) {
 				if (m & 1UL)
 					sbi_ipi_send(scratch, i, event, data);
 			}
 			hbase += BITS_PER_LONG;
 		}
+
+		/* sync IPIs */
+		hbase = 0;
+		while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &m)) {
+			for (i = hbase; m; i++, m >>= 1) {
+				if (m & 1UL)
+					sbi_ipi_sync(scratch, event);
+			}
+			hbase += BITS_PER_LONG;
+		}
 	}
 
 	return 0;
-- 
2.39.2


