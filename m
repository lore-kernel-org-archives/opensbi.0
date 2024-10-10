From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:57 +0530
Subject: [PATCH v2 8/9] lib: sbi_domain: Use domain data support for per-domain hart context
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The per-domain hartindex_to_context_table[] is yet another per-domain
data required for implementing hart entry into (or exit from) domain.

Use the recently added domain data support for per-domain hart context
so that a dedicated hartindex_to_context_table[] in struct sbi_domain
is not needed.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_domain.h         |   2 -
 include/sbi/sbi_domain_context.h |  56 +++--------------
 lib/sbi/sbi_domain.c             |   9 ++-
 lib/sbi/sbi_domain_context.c     | 104 +++++++++++++++++++++++++++----
 4 files changed, 109 insertions(+), 62 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index cf09344f..8a2b123d 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -176,8 +176,6 @@ struct sbi_domain {
 	char name[64];
 	/** Possible HARTs in this domain */
 	const struct sbi_hartmask *possible_harts;
-	/** Contexts for possible HARTs indexed by hartindex */
-	struct sbi_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
 	/** Array of memory regions terminated by a region with order zero */
 	struct sbi_domain_memregion *regions;
 	/** HART id of the HART booting this domain */
diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
index 1f5a4f56..31a3a7f8 100644
--- a/include/sbi/sbi_domain_context.h
+++ b/include/sbi/sbi_domain_context.h
@@ -8,55 +8,9 @@
 #define __SBI_DOMAIN_CONTEXT_H__
 
 #include <sbi/sbi_types.h>
-#include <sbi/sbi_trap.h>
 
 struct sbi_domain;
 
-/** Context representation for a hart within a domain */
-struct sbi_context {
-	/** Trap-related states such as GPRs, mepc, and mstatus */
-	struct sbi_trap_context trap_ctx;
-
-	/** Supervisor status register */
-	unsigned long sstatus;
-	/** Supervisor interrupt enable register */
-	unsigned long sie;
-	/** Supervisor trap vector base address register */
-	unsigned long stvec;
-	/** Supervisor scratch register for temporary storage */
-	unsigned long sscratch;
-	/** Supervisor exception program counter register */
-	unsigned long sepc;
-	/** Supervisor cause register */
-	unsigned long scause;
-	/** Supervisor trap value register */
-	unsigned long stval;
-	/** Supervisor interrupt pending register */
-	unsigned long sip;
-	/** Supervisor address translation and protection register */
-	unsigned long satp;
-	/** Counter-enable register */
-	unsigned long scounteren;
-	/** Supervisor environment configuration register */
-	unsigned long senvcfg;
-
-	/** Reference to the owning domain */
-	struct sbi_domain *dom;
-	/** Previous context (caller) to jump to during context exits */
-	struct sbi_context *prev_ctx;
-	/** Is context initialized and runnable */
-	bool initialized;
-};
-
-/** Get the context pointer for a given hart index and domain */
-#define sbi_hartindex_to_domain_context(__hartindex, __d) \
-	(__d)->hartindex_to_context_table[__hartindex]
-
-/** Macro to obtain the current hart's context pointer */
-#define sbi_domain_context_thishart_ptr() \
-	sbi_hartindex_to_domain_context(current_hartindex(), \
-					sbi_domain_thishart_ptr())
-
 /**
  * Enter a specific domain context synchronously
  * @param dom pointer to domain
@@ -74,4 +28,14 @@ int sbi_domain_context_enter(struct sbi_domain *dom);
  */
 int sbi_domain_context_exit(void);
 
+/**
+ * Initialize domain context support
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_domain_context_init(void);
+
+/* Deinitialize domain context support */
+void sbi_domain_context_deinit(void);
+
 #endif // __SBI_DOMAIN_CONTEXT_H__
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 30eb88fc..7fdcf9d3 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -780,11 +780,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	if (!domain_hart_ptr_offset)
 		return SBI_ENOMEM;
 
+	/* Initialize domain context support */
+	rc = sbi_domain_context_init();
+	if (rc)
+		goto fail_free_domain_hart_ptr_offset;
+
 	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
 	if (!root_memregs) {
 		sbi_printf("%s: no memory for root regions\n", __func__);
 		rc = SBI_ENOMEM;
-		goto fail_free_domain_hart_ptr_offset;
+		goto fail_deinit_context;
 	}
 	root.regions = root_memregs;
 
@@ -849,6 +854,8 @@ fail_free_root_hmask:
 	sbi_free(root_hmask);
 fail_free_root_memregs:
 	sbi_free(root_memregs);
+fail_deinit_context:
+	sbi_domain_context_deinit();
 fail_free_domain_hart_ptr_offset:
 	sbi_scratch_free_offset(domain_hart_ptr_offset);
 	return rc;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 7cad4656..407c0d5c 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -15,6 +15,75 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_trap.h>
+
+/** Context representation for a hart within a domain */
+struct hart_context {
+	/** Trap-related states such as GPRs, mepc, and mstatus */
+	struct sbi_trap_context trap_ctx;
+
+	/** Supervisor status register */
+	unsigned long sstatus;
+	/** Supervisor interrupt enable register */
+	unsigned long sie;
+	/** Supervisor trap vector base address register */
+	unsigned long stvec;
+	/** Supervisor scratch register for temporary storage */
+	unsigned long sscratch;
+	/** Supervisor exception program counter register */
+	unsigned long sepc;
+	/** Supervisor cause register */
+	unsigned long scause;
+	/** Supervisor trap value register */
+	unsigned long stval;
+	/** Supervisor interrupt pending register */
+	unsigned long sip;
+	/** Supervisor address translation and protection register */
+	unsigned long satp;
+	/** Counter-enable register */
+	unsigned long scounteren;
+	/** Supervisor environment configuration register */
+	unsigned long senvcfg;
+
+	/** Reference to the owning domain */
+	struct sbi_domain *dom;
+	/** Previous context (caller) to jump to during context exits */
+	struct hart_context *prev_ctx;
+	/** Is context initialized and runnable */
+	bool initialized;
+};
+
+struct domain_context_priv {
+	/** Contexts for possible HARTs indexed by hartindex */
+	struct hart_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
+};
+
+static struct sbi_domain_data dcpriv = {
+	.data_size = sizeof(struct domain_context_priv),
+};
+
+static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
+						    u32 hartindex)
+{
+	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
+
+	return (dcp && hartindex < SBI_HARTMASK_MAX_BITS) ?
+		dcp->hartindex_to_context_table[hartindex] : NULL;
+}
+
+static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
+			     struct hart_context *hc)
+{
+	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
+
+	if (dcp && hartindex < SBI_HARTMASK_MAX_BITS)
+		dcp->hartindex_to_context_table[hartindex] = hc;
+}
+
+/** Macro to obtain the current hart's context pointer */
+#define hart_context_thishart_get()					\
+	hart_context_get(sbi_domain_thishart_ptr(),			\
+			 current_hartindex())
 
 /**
  * Switches the HART context from the current domain to the target domain.
@@ -24,8 +93,8 @@
  * @param ctx pointer to the current HART context
  * @param dom_ctx pointer to the target domain context
  */
-static void switch_to_next_domain_context(struct sbi_context *ctx,
-					  struct sbi_context *dom_ctx)
+static void switch_to_next_domain_context(struct hart_context *ctx,
+					  struct hart_context *dom_ctx)
 {
 	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
@@ -90,9 +159,8 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 
 int sbi_domain_context_enter(struct sbi_domain *dom)
 {
-	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
-	struct sbi_context *dom_ctx = sbi_hartindex_to_domain_context(
-		current_hartindex(), dom);
+	struct hart_context *ctx = hart_context_thishart_get();
+	struct hart_context *dom_ctx = hart_context_get(dom, current_hartindex());
 
 	/* Validate the domain context existence */
 	if (!dom_ctx)
@@ -110,8 +178,8 @@ int sbi_domain_context_exit(void)
 {
 	u32 hartindex = current_hartindex();
 	struct sbi_domain *dom;
-	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
-	struct sbi_context *dom_ctx, *tmp;
+	struct hart_context *ctx = hart_context_thishart_get();
+	struct hart_context *dom_ctx, *tmp;
 
 	/*
 	 * If it's first time to call `exit` on the current hart, no
@@ -124,16 +192,16 @@ int sbi_domain_context_exit(void)
 							 dom->possible_harts))
 				continue;
 
-			dom_ctx = sbi_zalloc(sizeof(struct sbi_context));
+			dom_ctx = sbi_zalloc(sizeof(struct hart_context));
 			if (!dom_ctx)
 				return SBI_ENOMEM;
 
 			/* Bind context and domain */
-			dom_ctx->dom				   = dom;
-			dom->hartindex_to_context_table[hartindex] = dom_ctx;
+			dom_ctx->dom = dom;
+			hart_context_set(dom, hartindex, dom_ctx);
 		}
 
-		ctx = sbi_domain_context_thishart_ptr();
+		ctx = hart_context_thishart_get();
 	}
 
 	dom_ctx = ctx->prev_ctx;
@@ -145,7 +213,7 @@ int sbi_domain_context_exit(void)
 			if (dom == &root || dom == sbi_domain_thishart_ptr())
 				continue;
 
-			tmp = sbi_hartindex_to_domain_context(hartindex, dom);
+			tmp = hart_context_get(dom, hartindex);
 			if (tmp && !tmp->initialized) {
 				dom_ctx = tmp;
 				break;
@@ -155,9 +223,19 @@ int sbi_domain_context_exit(void)
 
 	/* Take the root domain context if fail to find */
 	if (!dom_ctx)
-		dom_ctx = sbi_hartindex_to_domain_context(hartindex, &root);
+		dom_ctx = hart_context_get(&root, hartindex);
 
 	switch_to_next_domain_context(ctx, dom_ctx);
 
 	return 0;
 }
+
+int sbi_domain_context_init(void)
+{
+	return sbi_domain_register_data(&dcpriv);
+}
+
+void sbi_domain_context_deinit(void)
+{
+	sbi_domain_unregister_data(&dcpriv);
+}
-- 
2.43.0


