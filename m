From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:56 +0530
Subject: [PATCH v2 7/9] lib: sbi: Introduce domain data
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Different parts of OpenSBI require their own per-domain data so
introduce domain data (or sbi_domain_data) which can be registered
by any part of OpenSBI. Using the domain data, the domain framework
will create a data pointer for every domain which can be used to
maintain some per-domain state.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 include/sbi/sbi_domain.h      |   3 +
 include/sbi/sbi_domain_data.h |  93 +++++++++++++++++++++++
 lib/sbi/objects.mk            |   1 +
 lib/sbi/sbi_domain.c          |  11 +++
 lib/sbi/sbi_domain_data.c     | 138 ++++++++++++++++++++++++++++++++++
 5 files changed, 246 insertions(+)
 create mode 100644 include/sbi/sbi_domain_data.h
 create mode 100644 lib/sbi/sbi_domain_data.c

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index fc349820..cf09344f 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -15,6 +15,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_domain_data.h>
 
 struct sbi_scratch;
 
@@ -163,6 +164,8 @@ struct sbi_domain_memregion {
 struct sbi_domain {
 	/** Node in linked list of domains */
 	struct sbi_dlist node;
+	/** Internal state of per-domain data */
+	struct sbi_domain_data_priv data_priv;
 	/** Logical index of this domain */
 	u32 index;
 	/** HARTs assigned to this domain */
diff --git a/include/sbi/sbi_domain_data.h b/include/sbi/sbi_domain_data.h
new file mode 100644
index 00000000..7eeafdce
--- /dev/null
+++ b/include/sbi/sbi_domain_data.h
@@ -0,0 +1,93 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#ifndef __SBI_DOMAIN_DATA_H__
+#define __SBI_DOMAIN_DATA_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+struct sbi_domain;
+
+/** Maximum domain data per-domain */
+#define SBI_DOMAIN_MAX_DATA_PTRS		32
+
+/** Representation of per-domain data */
+struct sbi_domain_data_priv {
+	/** Array of domain data pointers indexed by domain data identifier */
+	void *idx_to_data_ptr[SBI_DOMAIN_MAX_DATA_PTRS];
+};
+
+/** Representation of a domain data */
+struct sbi_domain_data {
+	/**
+	 * Head is used for maintaining data list
+	 *
+	 * Note: initialized by domain framework
+	 */
+	struct sbi_dlist head;
+	/**
+	 * Identifier which used to locate per-domain data
+	 *
+	 * Note: initialized by domain framework
+	 */
+	unsigned long data_idx;
+	/** Size of per-domain data */
+	unsigned long data_size;
+	/** Optional callback to setup domain data */
+	int (*data_setup)(struct sbi_domain *dom,
+			  struct sbi_domain_data *data, void *data_ptr);
+	/** Optional callback to cleanup domain data */
+	void (*data_cleanup)(struct sbi_domain *dom,
+			     struct sbi_domain_data *data, void *data_ptr);
+};
+
+/**
+ * Get per-domain data pointer for a given domain
+ * @param dom pointer to domain
+ * @param data pointer to domain data
+ *
+ * @return per-domain data pointer
+ */
+void *sbi_domain_data_ptr(struct sbi_domain *dom, struct sbi_domain_data *data);
+
+/**
+ * Setup all domain data for a domain
+ * @param dom pointer to domain
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function is used internally within domain framework.
+ */
+int sbi_domain_setup_data(struct sbi_domain *dom);
+
+/**
+ * Cleanup all domain data for a domain
+ * @param dom pointer to domain
+ *
+ * Note: This function is used internally within domain framework.
+ */
+void sbi_domain_cleanup_data(struct sbi_domain *dom);
+
+/**
+ * Register a domain data
+ * @param hndl pointer to domain data
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function must be used only in cold boot path.
+ */
+int sbi_domain_register_data(struct sbi_domain_data *data);
+
+/**
+ * Unregister a domain data
+ * @param hndl pointer to domain data
+ *
+ * Note: This function must be used only in cold boot path.
+ */
+void sbi_domain_unregister_data(struct sbi_domain_data *data);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 535aa709..0b114bbd 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -65,6 +65,7 @@ libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
 libsbi-objs-y += sbi_domain_context.o
+libsbi-objs-y += sbi_domain_data.o
 libsbi-objs-y += sbi_domain.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index a1db1310..30eb88fc 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -586,6 +586,15 @@ int sbi_domain_register(struct sbi_domain *dom,
 		}
 	}
 
+	/* Setup data for the discovered domain */
+	rc = sbi_domain_setup_data(dom);
+	if (rc) {
+		sbi_printf("%s: domain data setup failed for %s (error %d)\n",
+			   __func__, dom->name, rc);
+		sbi_list_del(&dom->node);
+		return rc;
+	}
+
 	return 0;
 }
 
@@ -752,6 +761,8 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	struct sbi_domain_memregion *root_memregs;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	SBI_INIT_LIST_HEAD(&domain_list);
+
 	if (scratch->fw_rw_offset == 0 ||
 	    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
 		sbi_printf("%s: fw_rw_offset is not a power of 2 (0x%lx)\n",
diff --git a/lib/sbi/sbi_domain_data.c b/lib/sbi/sbi_domain_data.c
new file mode 100644
index 00000000..04f0edf9
--- /dev/null
+++ b/lib/sbi/sbi_domain_data.c
@@ -0,0 +1,138 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+
+static SBI_LIST_HEAD(data_list);
+static DECLARE_BITMAP(data_idx_bmap, SBI_DOMAIN_MAX_DATA_PTRS);
+
+void *sbi_domain_data_ptr(struct sbi_domain *dom, struct sbi_domain_data *data)
+{
+	if (dom && data && data->data_idx < SBI_DOMAIN_MAX_DATA_PTRS)
+		return dom->data_priv.idx_to_data_ptr[data->data_idx];
+
+	return NULL;
+}
+
+static int domain_setup_data_one(struct sbi_domain *dom,
+				 struct sbi_domain_data *data)
+{
+	struct sbi_domain_data_priv *priv = &dom->data_priv;
+	void *data_ptr;
+	int rc;
+
+	if (priv->idx_to_data_ptr[data->data_idx])
+		return SBI_EALREADY;
+
+	data_ptr = sbi_zalloc(data->data_size);
+	if (!data_ptr) {
+		sbi_domain_cleanup_data(dom);
+		return SBI_ENOMEM;
+	}
+
+	if (data->data_setup) {
+		rc = data->data_setup(dom, data, data_ptr);
+		if (rc) {
+			sbi_free(data_ptr);
+			return rc;
+		}
+	}
+
+	priv->idx_to_data_ptr[data->data_idx] = data_ptr;
+	return 0;
+}
+
+static void domain_cleanup_data_one(struct sbi_domain *dom,
+				    struct sbi_domain_data *data)
+{
+	struct sbi_domain_data_priv *priv = &dom->data_priv;
+	void *data_ptr;
+
+	data_ptr = priv->idx_to_data_ptr[data->data_idx];
+	if (!data_ptr)
+		return;
+
+	if (data->data_cleanup)
+		data->data_cleanup(dom, data, data_ptr);
+
+	sbi_free(data_ptr);
+	priv->idx_to_data_ptr[data->data_idx] = NULL;
+}
+
+int sbi_domain_setup_data(struct sbi_domain *dom)
+{
+	struct sbi_domain_data *data;
+	int rc;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(data, &data_list, head) {
+		rc = domain_setup_data_one(dom, data);
+		if (rc) {
+			sbi_domain_cleanup_data(dom);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+void sbi_domain_cleanup_data(struct sbi_domain *dom)
+{
+	struct sbi_domain_data *data;
+
+	if (!dom)
+		return;
+
+	sbi_list_for_each_entry(data, &data_list, head)
+		domain_cleanup_data_one(dom, data);
+}
+
+int sbi_domain_register_data(struct sbi_domain_data *data)
+{
+	struct sbi_domain *dom;
+	u32 data_idx;
+	int rc;
+
+	if (!data || !data->data_size)
+		return SBI_EINVAL;
+
+	for (data_idx = 0; data_idx < SBI_DOMAIN_MAX_DATA_PTRS; data_idx++) {
+		if (!bitmap_test(data_idx_bmap, data_idx))
+			break;
+	}
+	if (SBI_DOMAIN_MAX_DATA_PTRS <= data_idx)
+		return SBI_ENOSPC;
+	bitmap_set(data_idx_bmap, data_idx, 1);
+
+	data->data_idx = data_idx;
+	sbi_list_add_tail(&data->head, &data_list);
+
+	sbi_domain_for_each(dom) {
+		rc = domain_setup_data_one(dom, data);
+		if (rc) {
+			sbi_domain_unregister_data(data);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+void sbi_domain_unregister_data(struct sbi_domain_data *data)
+{
+	struct sbi_domain *dom;
+
+	sbi_domain_for_each(dom)
+		domain_cleanup_data_one(dom, data);
+
+	sbi_list_del(&data->head);
+	bitmap_clear(data_idx_bmap, data->data_idx, 1);
+}
-- 
2.43.0


