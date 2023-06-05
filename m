From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:38 +0530
Subject: [PATCH v2 07/18] lib: sbi: Use scratch space to save per-HART domain pointer
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array indexed by hartid, we should use
scratch space to save per-HART domain pointer.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_domain.h |  6 +----
 lib/sbi/sbi_domain.c     | 55 ++++++++++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 124ea90..b05bcf4 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -129,12 +129,8 @@ struct sbi_domain {
 /** The root domain instance */
 extern struct sbi_domain root;
 
-/** HART id to domain table */
-extern struct sbi_domain *hartid_to_domain_table[];
-
 /** Get pointer to sbi_domain from HART id */
-#define sbi_hartid_to_domain(__hartid) \
-	hartid_to_domain_table[__hartid]
+struct sbi_domain *sbi_hartid_to_domain(u32 hartid);
 
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 5800870..38a5902 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -23,7 +23,6 @@
  * the array to be null-terminated.
  */
 struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX + 1] = { 0 };
-struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = { 0 };
 static u32 domain_count = 0;
 static bool domain_finalized = false;
 
@@ -39,6 +38,30 @@ struct sbi_domain root = {
 	.fw_region_inited = false,
 };
 
+static unsigned long domain_hart_ptr_offset;
+
+struct sbi_domain *sbi_hartid_to_domain(u32 hartid)
+{
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch || !domain_hart_ptr_offset)
+		return NULL;
+
+	return sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
+}
+
+static void update_hartid_to_domain(u32 hartid, struct sbi_domain *dom)
+{
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch)
+		return;
+
+	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
+}
+
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid)
 {
 	if (dom)
@@ -519,11 +542,11 @@ int sbi_domain_register(struct sbi_domain *dom,
 		if (!sbi_hartmask_test_hart(i, dom->possible_harts))
 			continue;
 
-		tdom = hartid_to_domain_table[i];
+		tdom = sbi_hartid_to_domain(i);
 		if (tdom)
 			sbi_hartmask_clear_hart(i,
 					&tdom->assigned_harts);
-		hartid_to_domain_table[i] = dom;
+		update_hartid_to_domain(i, dom);
 		sbi_hartmask_set_hart(i, &dom->assigned_harts);
 
 		/*
@@ -715,18 +738,23 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 		return SBI_EINVAL;
 	}
 
+	domain_hart_ptr_offset = sbi_scratch_alloc_type_offset(void *);
+	if (!domain_hart_ptr_offset)
+		return SBI_ENOMEM;
+
 	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
 	if (!root_memregs) {
 		sbi_printf("%s: no memory for root regions\n", __func__);
-		return SBI_ENOMEM;
+		rc = SBI_ENOMEM;
+		goto fail_free_domain_hart_ptr_offset;
 	}
 	root.regions = root_memregs;
 
 	root_hmask = sbi_zalloc(sizeof(*root_hmask));
 	if (!root_hmask) {
 		sbi_printf("%s: no memory for root hartmask\n", __func__);
-		sbi_free(root_memregs);
-		return SBI_ENOMEM;
+		rc = SBI_ENOMEM;
+		goto fail_free_root_memregs;
 	}
 	root.possible_harts = root_hmask;
 
@@ -771,11 +799,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Finally register the root domain */
 	rc = sbi_domain_register(&root, root_hmask);
-	if (rc) {
-		sbi_free(root_hmask);
-		sbi_free(root_memregs);
-		return rc;
-	}
+	if (rc)
+		goto fail_free_root_hmask;
 
 	return 0;
+
+fail_free_root_hmask:
+	sbi_free(root_hmask);
+fail_free_root_memregs:
+	sbi_free(root_memregs);
+fail_free_domain_hart_ptr_offset:
+	sbi_scratch_free_offset(domain_hart_ptr_offset);
+	return rc;
 }
-- 
2.34.1


