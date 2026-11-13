Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B288606A321
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JCquvIm5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IibuxA/GVp9Cx9q69PBEGWhKc5ePPsDROp0KPIhVVMY=; b=JCquvIm5N7h82Gd8m1tX2UL5jN
	FzFTK4PyvVHgSRZOrBNkdQjQaSrT/eDt8luainJjCWjvpSdey++J6l8Z+bXzp8iIHXFHbLCB8WLqL
	r4GLlUJ4ZjYAnBOfyWasDDnjRATKL2MQRTEKS/+1qcH1aG6KsOrXJNDWFqp3ed4HGVxY/XiwNWmKl
	G/WF9CShspLnp7o7M57jrrrATEpZyV9ZrLZvPyxa/gB2lgYd3/2qsrltDZYF/Uz6e2JLjrDNRTR1U
	9hoGqsv6FgdFYRuii5ERTl9yCK/HLZszWSkDsfAQvARLJTFx8PwH9+tIVqTY9eaJ4u3MEjY0glX2e
	W89WjpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRneb-0000000CEA7-2Jv3;
	Fri, 13 Nov 2026 09:33:05 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRneW-0000000CE9c-4Bty
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:33:03 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WJic020971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 17:32:19 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 17:32:19 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 17:32:19 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 1/5] lib: utils: add a PMA framework
Date: Fri, 13 Nov 2026 17:32:08 +0800
Message-ID: <20261113093212.3816428-2-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113093212.3816428-1-randolph@andestech.com>
References: <20261113093212.3816428-1-randolph@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD9WJic020971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013301_437751_E416B171 
X-CRM114-Status: GOOD (  26.36  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Samuel Holland <samuel.holland@sifive.com>, Randolph Lin <randolph@andestech.com>, Randolph Lin <randolph.sklin@gmail.com>, Jun Chang <jun.chang@metanoia-comm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several platforms set physical memory attributes (PMA) at boot, each in
its own way: RZ/Five and MT2824 from C tables, and MIPS and SpacemiT K3
by writing their PMA CSRs. Add a small framework, so that a platform
registers a PMA device and common code decides the regions.

The cold boot hart adds the regions. The framework checks that each
region is naturally aligned to its power-of-2 size and does not overlap
another region, and the device checks the rest. Every hart then sets the
regions, because the PMA settings are per hart.

The attributes of a region use the encoding of the flags in the
"riscv,physical-memory-regions" DT binding proposed for Linux, limited
to the memory type: ordering, idempotency, cacheability, coherence and
the unsafe flag. Each vendor encodes PMAs differently, so the device
maps the attributes to its own format, and it rejects a region whose
attributes it cannot set.

Bits 19:16 of the attributes, which that encoding does not use, choose
among the memory types that a device may offer for the same attributes:
bufferable, write-through, and no read or no write allocate. Zero means
non-bufferable, and a cacheable region is write-back with read and write
allocate.

Link: https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 include/sbi_utils/pma/pma.h | 119 ++++++++++++++++++++++++++++++++++++
 lib/utils/Kconfig           |   2 +
 lib/utils/pma/Kconfig       |   9 +++
 lib/utils/pma/objects.mk    |   7 +++
 lib/utils/pma/pma.c         |  80 ++++++++++++++++++++++++
 5 files changed, 217 insertions(+)
 create mode 100644 include/sbi_utils/pma/pma.h
 create mode 100644 lib/utils/pma/Kconfig
 create mode 100644 lib/utils/pma/objects.mk
 create mode 100644 lib/utils/pma/pma.c

diff --git a/include/sbi_utils/pma/pma.h b/include/sbi_utils/pma/pma.h
new file mode 100644
index 00000000..eee02c4a
--- /dev/null
+++ b/include/sbi_utils/pma/pma.h
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Andes Technology Corporation
+ */
+
+#ifndef __PMA_H__
+#define __PMA_H__
+
+#include <sbi/sbi_types.h>
+
+/*
+ * Region attributes. Bits 15:8 use the encoding of the flags in the
+ * "riscv,physical-memory-regions" DT binding proposed for Linux, which
+ * describe the memory type. The access types and the alias fields of that
+ * encoding do not apply.
+ */
+#define PMA_ORDER_MASK			(3 << 8)
+#define PMA_ORDER_IO_RELAXED		(0 << 8)
+#define PMA_ORDER_IO_STRONG		(1 << 8)
+#define PMA_ORDER_MEMORY		(2 << 8)
+#define PMA_READ_IDEMPOTENT		(1 << 10)
+#define PMA_WRITE_IDEMPOTENT		(1 << 11)
+#define PMA_CACHEABLE			(1 << 12)
+#define PMA_COHERENT			(1 << 13)
+#define PMA_UNSAFE			(1 << 15)
+
+#define PMA_IO				(PMA_ORDER_IO_RELAXED)
+#define PMA_NONCACHEABLE_MEMORY		(PMA_ORDER_MEMORY | PMA_READ_IDEMPOTENT | \
+					 PMA_WRITE_IDEMPOTENT)
+#define PMA_NONCOHERENT_MEMORY		(PMA_NONCACHEABLE_MEMORY | PMA_CACHEABLE)
+#define PMA_NORMAL_MEMORY		(PMA_NONCOHERENT_MEMORY | PMA_COHERENT)
+
+/*
+ * Bits 19:16 choose among the memory types that a device may offer for the
+ * same attributes. Zero means non-bufferable, and for a cacheable region,
+ * write-back with read and write allocate.
+ */
+#define PMA_BUFFERABLE			(1 << 16)
+#define PMA_WRITE_THROUGH		(1 << 17)
+#define PMA_NO_READ_ALLOC		(1 << 18)
+#define PMA_NO_WRITE_ALLOC		(1 << 19)
+
+#define PMA_NO_ALLOC			(PMA_NO_READ_ALLOC | PMA_NO_WRITE_ALLOC)
+
+#define PMA_ATTR_MASK			(PMA_ORDER_MASK | PMA_READ_IDEMPOTENT | \
+					 PMA_WRITE_IDEMPOTENT | PMA_CACHEABLE | \
+					 PMA_COHERENT | PMA_UNSAFE | \
+					 PMA_BUFFERABLE | PMA_WRITE_THROUGH | \
+					 PMA_NO_ALLOC)
+
+/** A region whose physical memory attributes (PMA) are set at boot **/
+struct pma_region {
+	/** Start address, aligned to the size **/
+	unsigned long base;
+	/** Size in bytes, a power of 2 **/
+	unsigned long size;
+	/** PMA_* attributes **/
+	u32 attr;
+};
+
+struct pma_device;
+
+struct pma_ops {
+	/**
+	 * Check whether the device can set a region (optional). A device
+	 * that cannot set the attributes of the region must reject it.
+	 **/
+	int (*region_check)(struct pma_device *dev,
+			    const struct pma_region *region);
+	/**
+	 * Set the regions on the calling hart. The regions must stay set
+	 * until the hart resets: the device must not let other users, such
+	 * as a vendor SBI extension, change or free them.
+	 **/
+	int (*regions_set)(struct pma_device *dev,
+			   const struct pma_region *regions,
+			   unsigned int count);
+};
+
+struct pma_device {
+	/** Maximum number of regions **/
+	unsigned int max_regions;
+	/** PMA operations **/
+	const struct pma_ops *ops;
+};
+
+/**
+ * Set the PMA device of the platform
+ *
+ * @param dev the PMA device
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int pma_set_device(struct pma_device *dev);
+
+/**
+ * Add a region to the regions that every hart sets at boot
+ *
+ * Call it on the cold boot hart only, before any hart calls
+ * pma_setup_regions().
+ *
+ * @param region the region to add
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int pma_add_region(const struct pma_region *region);
+
+/**
+ * Set the added regions on the calling hart
+ *
+ * The PMA settings are per hart, so every hart must call it.
+ *
+ * @return 0 on success or if no region was added, or a negative error code
+ *	   on failure
+ */
+int pma_setup_regions(void);
+
+#endif
diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig
index 5a5b3b1e..465d10ac 100644
--- a/lib/utils/Kconfig
+++ b/lib/utils/Kconfig
@@ -22,6 +22,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/libfdt/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/mailbox/Kconfig"
 
+source "$(OPENSBI_SRC_DIR)/lib/utils/pma/Kconfig"
+
 source "$(OPENSBI_SRC_DIR)/lib/utils/regmap/Kconfig"
 
 source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"
diff --git a/lib/utils/pma/Kconfig b/lib/utils/pma/Kconfig
new file mode 100644
index 00000000..73523ab0
--- /dev/null
+++ b/lib/utils/pma/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+menu "PMA Support"
+
+config PMA
+	bool "PMA support"
+	default n
+
+endmenu
diff --git a/lib/utils/pma/objects.mk b/lib/utils/pma/objects.mk
new file mode 100644
index 00000000..a778d0b6
--- /dev/null
+++ b/lib/utils/pma/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2026 Andes Technology Corporation
+#
+
+libsbiutils-objs-$(CONFIG_PMA) += pma/pma.o
diff --git a/lib/utils/pma/pma.c b/lib/utils/pma/pma.c
new file mode 100644
index 00000000..f3f47ea0
--- /dev/null
+++ b/lib/utils/pma/pma.c
@@ -0,0 +1,80 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Andes Technology Corporation
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/pma/pma.h>
+
+static struct pma_device *pma_dev;
+static struct pma_region *pma_regions;
+static unsigned int pma_regions_count;
+
+int pma_set_device(struct pma_device *dev)
+{
+	if (!dev || !dev->ops || !dev->ops->regions_set || !dev->max_regions)
+		return SBI_EINVAL;
+
+	if (pma_dev)
+		return SBI_EALREADY;
+
+	pma_dev = dev;
+
+	return 0;
+}
+
+int pma_add_region(const struct pma_region *region)
+{
+	const struct pma_region *r;
+	unsigned int i;
+	int rc;
+
+	if (!pma_dev)
+		return SBI_ENODEV;
+
+	if (!region->size || (region->size & (region->size - 1)) ||
+	    (region->base & (region->size - 1)))
+		return SBI_EINVAL;
+
+	if ((region->attr & ~PMA_ATTR_MASK) ||
+	    (region->attr & PMA_ORDER_MASK) == PMA_ORDER_MASK)
+		return SBI_EINVAL;
+
+	for (i = 0; i < pma_regions_count; i++) {
+		r = &pma_regions[i];
+		if (region->base <= r->base + r->size - 1 &&
+		    r->base <= region->base + region->size - 1)
+			return SBI_EINVAL;
+	}
+
+	if (pma_regions_count == pma_dev->max_regions)
+		return SBI_ENOSPC;
+
+	if (pma_dev->ops->region_check) {
+		rc = pma_dev->ops->region_check(pma_dev, region);
+		if (rc)
+			return rc;
+	}
+
+	if (!pma_regions) {
+		pma_regions = sbi_calloc(pma_dev->max_regions,
+					 sizeof(*pma_regions));
+		if (!pma_regions)
+			return SBI_ENOMEM;
+	}
+
+	pma_regions[pma_regions_count++] = *region;
+
+	return 0;
+}
+
+int pma_setup_regions(void)
+{
+	if (!pma_regions_count)
+		return 0;
+
+	return pma_dev->ops->regions_set(pma_dev, pma_regions,
+					 pma_regions_count);
+}
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
