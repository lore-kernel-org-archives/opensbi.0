From: Xiang W <wxjstz@126.com>
Date: Wed, 26 Mar 2025 17:17:35 +0800
Subject: [PATCH] lib: sbi: Fix location of sbi_domain_context_init
Message-ID: <20250326091804.345785-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sbi_domain_context_init needs to assign context to each hart of each
domain, so it must be called after all the domains are registered.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 51c82a75..ad393644 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -765,6 +765,14 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 	 */
 	domain_finalized = true;
 
+	/* Initialize domain context support */
+	rc = sbi_domain_context_init();
+	if (rc) {
+		sbi_printf("%s: sbi_domain_context_init() failed (error %d)\n",
+			   __func__, rc);
+		return rc;
+	}
+
 	return 0;
 }
 
@@ -795,16 +803,11 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	if (!domain_hart_ptr_offset)
 		return SBI_ENOMEM;
 
-	/* Initialize domain context support */
-	rc = sbi_domain_context_init();
-	if (rc)
-		goto fail_free_domain_hart_ptr_offset;
-
 	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
 	if (!root_memregs) {
 		sbi_printf("%s: no memory for root regions\n", __func__);
 		rc = SBI_ENOMEM;
-		goto fail_deinit_context;
+		goto fail_free_domain_hart_ptr_offset;
 	}
 	root.regions = root_memregs;
 
@@ -869,8 +872,6 @@ fail_free_root_hmask:
 	sbi_free(root_hmask);
 fail_free_root_memregs:
 	sbi_free(root_memregs);
-fail_deinit_context:
-	sbi_domain_context_deinit();
 fail_free_domain_hart_ptr_offset:
 	sbi_scratch_free_offset(domain_hart_ptr_offset);
 	return rc;
-- 
2.47.2


