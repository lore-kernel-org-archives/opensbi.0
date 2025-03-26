From: Alvin Chang <alvinga@andestech.com>
Date: Wed, 26 Mar 2025 14:20:51 +0800
Subject: [PATCH] lib: sbi_domain: Reduce memory usage of per-domain hart context
Message-ID: <20250326062051.3763530-1-alvinga@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In current implementation, the length of hartindex_to_context_table[]
array is fixed as SBI_HARTMASK_MAX_BITS. However, the number of harts
supported by the platform might not be SBI_HARTMASK_MAX_BITS and is
usually smaller than SBI_HARTMASK_MAX_BITS. This means it is unnecessary
to allocate such fixed-length array here.

Precisely, current implementation always allocates 1024 bytes for
hartindex_to_context_table[128] on RV64 platform. However, a platform
supports two harts only needs hartindex_to_context_table[2], which only
needs 16 bytes.

This commit calculates needed size of hartindex_to_context_table[]
according to supported number of harts on the platform when registering
per-domain data, so that memory usage of per-domain context data can be
reduced.

Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 lib/sbi/sbi_domain_context.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 407c0d5..0e5c1c2 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -53,31 +53,32 @@ struct hart_context {
 	bool initialized;
 };
 
-struct domain_context_priv {
-	/** Contexts for possible HARTs indexed by hartindex */
-	struct hart_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
-};
-
 static struct sbi_domain_data dcpriv = {
-	.data_size = sizeof(struct domain_context_priv),
+
 };
 
 static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
 						    u32 hartindex)
 {
-	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
+	struct hart_context **dom_hartindex_to_context_table;
+
+	dom_hartindex_to_context_table = sbi_domain_data_ptr(dom, &dcpriv);
+	if (!dom_hartindex_to_context_table || !sbi_hartindex_valid(hartindex))
+		return NULL;
 
-	return (dcp && hartindex < SBI_HARTMASK_MAX_BITS) ?
-		dcp->hartindex_to_context_table[hartindex] : NULL;
+	return dom_hartindex_to_context_table[hartindex];
 }
 
 static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
 			     struct hart_context *hc)
 {
-	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
+	struct hart_context **dom_hartindex_to_context_table;
 
-	if (dcp && hartindex < SBI_HARTMASK_MAX_BITS)
-		dcp->hartindex_to_context_table[hartindex] = hc;
+	dom_hartindex_to_context_table = sbi_domain_data_ptr(dom, &dcpriv);
+	if (!dom_hartindex_to_context_table || !sbi_hartindex_valid(hartindex))
+		return;
+
+	dom_hartindex_to_context_table[hartindex] = hc;
 }
 
 /** Macro to obtain the current hart's context pointer */
@@ -232,6 +233,14 @@ int sbi_domain_context_exit(void)
 
 int sbi_domain_context_init(void)
 {
+	/**
+	 * Allocate per-domain and per-hart context data.
+	 * The data type is "struct hart_context **" whose memory space will be
+	 * dynamically allocated by domain_setup_data_one(). Calculate needed
+	 * size of memory space here.
+	 */
+	dcpriv.data_size = sizeof(struct hart_context *) * sbi_hart_count();
+
 	return sbi_domain_register_data(&dcpriv);
 }
 
-- 
2.43.0


