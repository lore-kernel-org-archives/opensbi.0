Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B05606A336
	for <opensbi@archiver.kernel.org>; Fri, 13 Nov 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b+YaD8RU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iOlKua11Ak9PXt0CfTXm+8vb5qHAhqy/WR4hpJ8kfsA=; b=b+YaD8RUy47Hp6C8uAHPtzP1Uo
	QZxRHVHVkmEuPJQxOfKLhVLkVyzsbnWcbM3lfeUMGLlhA7vnrJ3d2JrO1vNpxlmW2Ui64+g8AA2iY
	QoTvPokkd4zD4JLmGje68rRglYCSE9R9NmcthqQlNErmeP6Lm4GT7j8TRdqbPehSbuQJqEq+ff5lk
	r7dMkW3S2NypKlQuSlb3tkX2mhcPAZi3Eq2i1vsz22yPoQnKHy5S6N0WMkLysbuApDrLleMU4zBGs
	G6pX3e8aq8a+fs88hvZ/sLA7Tm981HPwNwOqYuhmDhLFnE5OEd+bOPgtG4sVTgsZomCo3m64Srof/
	pQJHJ87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfW-0000000CEJc-1Hoy;
	Fri, 13 Nov 2026 09:34:02 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnfS-0000000CEIn-3BqP
	for opensbi@lists.infradead.org;
	Fri, 13 Nov 2026 09:34:00 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD9WJVh020972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 17:32:20 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 17:32:20 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 17:32:19 +0800
From: Randolph Lin <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [RFC PATCH 2/5] lib: utils/pma: set PMA regions from the device tree
Date: Fri, 13 Nov 2026 17:32:09 +0800
Message-ID: <20261113093212.3816428-3-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113093212.3816428-1-randolph@andestech.com>
References: <20261113093212.3816428-1-randolph@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD9WJVh020972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013359_282882_3383CA21 
X-CRM114-Status: GOOD (  24.39  )
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

Add fdt_pma_init(), which reads the PMA regions from a
"riscv,pma-regions" DT node, so that a board describes them without
its own platform code.

Each subnode describes a region with "base", "order" and "attr". As with
PMP regions, the order gives the size, so a region is always NAPOT.
"attr" holds the PMA_* attributes. The cold boot hart parses the node
and then deletes it, like the other OpenSBI configuration nodes. Every
hart then sets the regions.

The generic platform calls it from generic_final_init() on every hart.
Without the node, it does nothing. With the node but no PMA device, the
boot fails with a message that says so, because S-mode would otherwise
use the regions with the wrong attributes. The cold boot hart prints
each region and what its attributes mean, because S-mode cannot see the
node. A hart that fails to set the regions prints its hart ID and the
error.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 include/sbi_utils/pma/fdt_pma.h    |  33 ++++++
 lib/utils/pma/Kconfig              |   6 ++
 lib/utils/pma/fdt_pma.c            | 167 +++++++++++++++++++++++++++++
 lib/utils/pma/objects.mk           |   2 +
 platform/generic/configs/defconfig |   1 +
 platform/generic/platform.c        |   6 ++
 6 files changed, 215 insertions(+)
 create mode 100644 include/sbi_utils/pma/fdt_pma.h
 create mode 100644 lib/utils/pma/fdt_pma.c

diff --git a/include/sbi_utils/pma/fdt_pma.h b/include/sbi_utils/pma/fdt_pma.h
new file mode 100644
index 00000000..3db12087
--- /dev/null
+++ b/include/sbi_utils/pma/fdt_pma.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Andes Technology Corporation
+ */
+
+#ifndef __FDT_PMA_H__
+#define __FDT_PMA_H__
+
+#include <sbi/sbi_types.h>
+
+#ifdef CONFIG_FDT_PMA
+
+/**
+ * Set the PMA regions in the "riscv,pma-regions" DT node
+ *
+ * The cold boot hart parses the node and then deletes it from the DT. The
+ * PMA settings are per hart, so every hart must call it.
+ *
+ * @param cold_boot cold init or warm init
+ *
+ * @return 0 on success or if the DT has no such node, or a negative error
+ *	   code on failure
+ */
+int fdt_pma_init(bool cold_boot);
+
+#else
+
+static inline int fdt_pma_init(bool cold_boot) { return 0; }
+
+#endif
+
+#endif
diff --git a/lib/utils/pma/Kconfig b/lib/utils/pma/Kconfig
index 73523ab0..a7666942 100644
--- a/lib/utils/pma/Kconfig
+++ b/lib/utils/pma/Kconfig
@@ -2,6 +2,12 @@
 
 menu "PMA Support"
 
+config FDT_PMA
+	bool "FDT based PMA regions"
+	depends on FDT
+	select PMA
+	default n
+
 config PMA
 	bool "PMA support"
 	default n
diff --git a/lib/utils/pma/fdt_pma.c b/lib/utils/pma/fdt_pma.c
new file mode 100644
index 00000000..420678ef
--- /dev/null
+++ b/lib/utils/pma/fdt_pma.c
@@ -0,0 +1,167 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Andes Technology Corporation
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/pma/fdt_pma.h>
+#include <sbi_utils/pma/pma.h>
+
+/*
+ * Each subnode describes a NAPOT region with "base" (the 64-bit physical
+ * address), "order" (the size as log2, i.e. size = BIT(order)) and "attr"
+ * (the PMA_* attributes).
+ */
+static int fdt_pma_parse_region(const void *fdt, int node,
+				struct pma_region *region)
+{
+	const fdt32_t *val;
+	u32 order;
+	u64 base;
+	int len;
+
+	val = fdt_getprop(fdt, node, "base", &len);
+	if (!val || len != 8)
+		return SBI_EINVAL;
+
+	base = fdt32_to_cpu(val[0]);
+	base = (base << 32) | fdt32_to_cpu(val[1]);
+	region->base = base;
+	if (region->base != base)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, node, "order", &len);
+	if (!val || len != 4)
+		return SBI_EINVAL;
+
+	order = fdt32_to_cpu(*val);
+	if (order >= __riscv_xlen)
+		return SBI_EINVAL;
+
+	region->size = BIT(order);
+
+	val = fdt_getprop(fdt, node, "attr", &len);
+	if (!val || len != 4)
+		return SBI_EINVAL;
+
+	region->attr = fdt32_to_cpu(*val);
+
+	return 0;
+}
+
+static void fdt_pma_print_region(unsigned int i,
+				 const struct pma_region *region)
+{
+	u32 attr = region->attr;
+
+	sbi_printf("PMA Region%02u                : 0x%" PRILX "-0x%" PRILX
+		   " attr 0x%x\n", i, region->base,
+		   region->base + region->size - 1, attr);
+
+	sbi_printf("PMA Region%02u Type           : ", i);
+	if (attr & PMA_UNSAFE) {
+		sbi_printf("unsafe, accesses fault\n");
+		return;
+	}
+
+	switch (attr & PMA_ORDER_MASK) {
+	case PMA_ORDER_MEMORY:
+		sbi_printf("memory");
+		if (!(attr & PMA_READ_IDEMPOTENT))
+			sbi_printf(", non-idempotent reads");
+		if (!(attr & PMA_WRITE_IDEMPOTENT))
+			sbi_printf(", non-idempotent writes");
+		break;
+	default:
+		sbi_printf("I/O, %s ordering",
+			   (attr & PMA_ORDER_MASK) == PMA_ORDER_IO_STRONG ?
+			   "strong" : "relaxed");
+		if (attr & PMA_READ_IDEMPOTENT)
+			sbi_printf(", idempotent reads");
+		if (attr & PMA_WRITE_IDEMPOTENT)
+			sbi_printf(", idempotent writes");
+		break;
+	}
+
+	if (!(attr & PMA_CACHEABLE)) {
+		sbi_printf(", non-cacheable, %s\n",
+			   (attr & PMA_BUFFERABLE) ? "bufferable" : "non-bufferable");
+		return;
+	}
+
+	sbi_printf(", cacheable, %s, %s",
+		   (attr & PMA_COHERENT) ? "coherent" : "non-coherent",
+		   (attr & PMA_WRITE_THROUGH) ? "write-through" : "write-back");
+
+	switch (attr & PMA_NO_ALLOC) {
+	case 0:
+		sbi_printf(", read and write allocate\n");
+		break;
+	case PMA_NO_WRITE_ALLOC:
+		sbi_printf(", read allocate\n");
+		break;
+	case PMA_NO_READ_ALLOC:
+		sbi_printf(", write allocate\n");
+		break;
+	default:
+		sbi_printf(", no allocate\n");
+		break;
+	}
+}
+
+static int fdt_pma_parse(void *fdt)
+{
+	struct pma_region region;
+	int parent, node, rc;
+	unsigned int i = 0;
+
+	parent = fdt_node_offset_by_compatible(fdt, -1, "riscv,pma-regions");
+	if (parent < 0)
+		return 0;
+
+	fdt_for_each_subnode(node, fdt, parent) {
+		rc = fdt_pma_parse_region(fdt, node, &region);
+		if (!rc)
+			rc = pma_add_region(&region);
+		if (rc == SBI_ENODEV) {
+			sbi_printf("%s: no PMA device, cannot set region %s\n",
+				   __func__, fdt_get_name(fdt, node, NULL));
+			return rc;
+		}
+		if (rc) {
+			sbi_printf("%s: failed to add region %s (error %d)\n",
+				   __func__, fdt_get_name(fdt, node, NULL), rc);
+			return rc;
+		}
+
+		fdt_pma_print_region(i++, &region);
+	}
+
+	/* Like the other OpenSBI configuration nodes, hide it from S-mode */
+	fdt_nop_node(fdt, parent);
+
+	return 0;
+}
+
+int fdt_pma_init(bool cold_boot)
+{
+	int rc;
+
+	if (cold_boot) {
+		rc = fdt_pma_parse(fdt_get_address_rw());
+		if (rc)
+			return rc;
+	}
+
+	rc = pma_setup_regions();
+	if (rc)
+		sbi_printf("%s: hart%u failed to set the PMA regions (error %d)\n",
+			   __func__, current_hartid(), rc);
+
+	return rc;
+}
diff --git a/lib/utils/pma/objects.mk b/lib/utils/pma/objects.mk
index a778d0b6..72cdd233 100644
--- a/lib/utils/pma/objects.mk
+++ b/lib/utils/pma/objects.mk
@@ -4,4 +4,6 @@
 # Copyright (c) 2026 Andes Technology Corporation
 #
 
+libsbiutils-objs-$(CONFIG_FDT_PMA) += pma/fdt_pma.o
+
 libsbiutils-objs-$(CONFIG_PMA) += pma/pma.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 687b4c35..80188a32 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -46,6 +46,7 @@ CONFIG_FDT_IRQCHIP_PLIC=y
 CONFIG_FDT_MAILBOX=y
 CONFIG_RPMI_MAILBOX=y
 CONFIG_FDT_MAILBOX_RPMI_SHMEM=y
+CONFIG_FDT_PMA=y
 CONFIG_FDT_REGMAP=y
 CONFIG_FDT_REGMAP_SYSCON=y
 CONFIG_FDT_RESET=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..bb0682b6 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -26,6 +26,7 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
+#include <sbi_utils/pma/fdt_pma.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/semihosting.h>
 #include <sbi_utils/timer/fdt_timer.h>
@@ -237,6 +238,11 @@ int generic_early_init(bool cold_boot)
 int generic_final_init(bool cold_boot)
 {
 	void *fdt = fdt_get_address_rw();
+	int rc;
+
+	rc = fdt_pma_init(cold_boot);
+	if (rc)
+		return rc;
 
 	if (!cold_boot)
 		return 0;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
