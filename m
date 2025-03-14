From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 14 Mar 2025 17:30:24 +0100
Subject: [PATCH 2/2] lib: sbi_ipi: Return error for invalid hartids
In-Reply-To: <20250314163021.154530-4-ajones@ventanamicro.com>
References: <20250314163021.154530-4-ajones@ventanamicro.com>
Message-ID: <20250314163021.154530-6-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sbi_send_ipi() should return SBI_ERR_INVALID_PARAM if even one hartid
constructed from hart_mask_base and hart_mask, is not valid.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_ipi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 52898d302376..2de459b089ff 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -116,6 +116,11 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
+	if (hmask == 0 && hbase != -1UL) {
+		/* Nothing to do, but it's not an error either. */
+		return 0;
+	}
+
 	/* Find the target harts */
 	rc = sbi_hsm_hart_interruptible_mask(dom, &target_mask);
 	if (rc)
@@ -123,6 +128,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 
 	if (hbase != -1UL) {
 		struct sbi_hartmask tmp_mask = { 0 };
+		int count = sbi_popcount(hmask);
 
 		for (i = hbase; hmask; i++, hmask >>= 1) {
 			if (hmask & 1UL)
@@ -130,6 +136,9 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 		}
 
 		sbi_hartmask_and(&target_mask, &target_mask, &tmp_mask);
+
+		if (sbi_hartmask_weight(&target_mask) != count)
+			return SBI_EINVAL;
 	}
 
 	/* Send IPIs */
-- 
2.48.1


