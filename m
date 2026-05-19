Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C094BCD4F5B
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR8FNrAaure1lP6i2hfWV6dpgSCqqEfesu+Ek8IlN5Y=; b=0pFeNUi0iqZu39
	3AeWgbCGc/Ycvc7s45FPrirFo1m99PYst07yRF7mSjrP/0W6owgmdWCQGGOcoWHbDsCJMqclVoeTf
	/xyC7phtpEYQ3ul0hXb5gOyweSWqM4uioUgNdpjr9Hx3iCdhcM/HtwZ1YpSAW20BBlUAWUunPBrcO
	pFjJJjpy4z3XLxgKaEmlEY5aEJ9JqBeDfcBn0jJlMvpXLAA6vrIh0Ox9K2wgf3zVfoNXaWJVkTGsY
	uq3ux1OK4BrAJrzXyRJf1hpkO4xBWa3zo0rxDAYR4XBaPSI0BZQdQv0vshAKmPleQKyVqO45XYkJF
	QAnJsEZgaRPRUVWmeysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8c-00000002j4B-1uTD;
	Tue, 19 May 2026 20:34:02 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8Y-00000002j1w-3r3a
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:34:00 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-899d6b7b073so50647776d6.2
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222838; x=1779827638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sJ8Yw+eU/ad58SRswQmstItDYgGMC7UPt3Nkez8FtI=;
        b=QrchqJV1IV0pVhXPdtZNf2PAQGlqBqZwqQ+Q/8MsqoiJTIbS1sKvW4uMdVV8cmahnR
         Jpgx7kIZ2Zg+XZkBNgu/04Hya02n6rlucfLJnlCLcHlu7ere2LO7mSKk/6J1wQ8iiViY
         F1XU08RHXv5TILTwIhJDf9cEzrZJ63aMTQErKl7VcNNKISptsOkqTKykDOe3G/uTd1Z+
         GhRneZsAccaP69G0ypVFDKOzhjyZFwEH6VZW/7W4QtpTtWOq2GQtXCo3TtWR6b5TtcWT
         VMOeNtYFhWVRxicnEBf2YbUdwbWKVNpFBQlrSCJ21FLZXMz65yZBEjBevy0617iFJfMY
         8b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222838; x=1779827638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2sJ8Yw+eU/ad58SRswQmstItDYgGMC7UPt3Nkez8FtI=;
        b=XzWyNF4CHAOIzK7N+zrtWLhCSc/cg3RElNL6Vm3uGYBzWLN84d2LwTgYyWIDP+meGW
         hJyBcOcUy/TgLlRI6y8HjOZiFuc4UcWCtG1STU6bCFCe1WS0CvGdp4PqPnNjA4HCNyDc
         4lN9oFrEui3q439UAlZDCaqH0gS8SGA34kj3LsbWQ9r7eZ57SYHMbWaMhzx1wcbyMG0C
         3/JoOtxGnAee2mQGsbJyFwdiNp8jg8MnKpbvFFOmo3xQvnNEkU5Z2WNYu1pMDOg26idu
         u+q0Lir0TdGhijx6NdjUoeovvQfqW6oZPEb4pwF7FWVLm+5fOBk7ZDEDMFyQJe6UceCl
         6bzA==
X-Gm-Message-State: AOJu0YxkUPsj7y/vDDDNHWZEtzmrvyqk6ZtWTIvD5GK/mokFFZGlTKkq
	dv917GTdojE8t1K0BY8FWVEDhUwrIdYLtCcybOeY0K5QqfhvE/kcu3YsZdLplw==
X-Gm-Gg: Acq92OHZh/HthCUEWr07PanmFGpv19C5EdONMWj49JDWR8qH7RYD9JPQXEnKwNJvHS8
	FEfqTUe5wgRzrnPV4xH77EVRRRdvDfYSblDSrJEBJ21P7Zn6qkiY/QxRPZ7uVT3+IbnUZsO/q3t
	78L50vwnvno0LBuXEBidxitXBIXImBSO50RyoAphFfg51dSMNDLJ5pcVXf8lYlr+5V2OwpMZiEs
	00q6N5eIJAuQQxlvyZSlhNunQL/iHdgMsYy92ZopmfLD+HmQxDQeL1Gy3U0t7VsFax/cgcMYWVt
	2hy3DL6QzBiG5mot1rpQf6F2BMPE86CWg3uFgQakdyaoln1Yyz35+lGghRT9uQ0fdlowQ2nCpAn
	/8g/JobjRH2PyEDFpcCQtazApReSlbArlzcyO4zY7YAX4CPQgNdWRTmC00+pt+QoZ/WIAjdWj1t
	FoarPaN5Pm/YImYSlcJlkJ8/aWkbBUIwpVri8ElY4T9tYL/NLzOJ4BwIkeppC85SBDlZTaOg0IS
	Ri9JyeMFw/ai9tu+X1ZPw==
X-Received: by 2002:a05:622a:5908:b0:50d:736a:6259 with SMTP id d75a77b69052e-51659fbe97cmr294351741cf.3.1779222837554;
        Tue, 19 May 2026 13:33:57 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:57 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 4/7] platform: generic: add WorldGuard hwiso support with wgchecker2
Date: Tue, 19 May 2026 16:33:28 -0400
Message-Id: <20260519203331.2773185-5-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133359_081786_04F6B9D4 
X-CRM114-Status: GOOD (  25.74  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Raymond Mao <raymond.mao@riscstar.com>

Add WorldGuard support for the hardware isolation framework on the
generic platform.

Implement boot-time parsing of sifive,wgchecker2 checker instances and
their subordinate resource permissions from the FDT, then program the
checker MMIO state according to the worldguard_cfg rules described for
each protected resource.

Add WorldGuard runtime support to parse per-hart CPU defaults and
per-domain WorldGuard metadata, and use that state to reprogram MLWID,
MWIDDELEG, and SLWID during domain transitions.

Keep the QEMU virt platform code as the integration layer that
registers the WorldGuard hardware isolation mechanism for the virt
platform.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 platform/generic/include/wgchecker2.h        |  55 ++
 platform/generic/include/worldguard.h        |  45 ++
 platform/generic/objects.mk                  |   3 +
 platform/generic/platform.c                  |  11 +
 platform/generic/virt/qemu_virt_worldguard.c |  42 ++
 platform/generic/wgchecker2.c                | 585 +++++++++++++++++++
 platform/generic/worldguard.c                | 522 +++++++++++++++++
 7 files changed, 1263 insertions(+)
 create mode 100644 platform/generic/include/wgchecker2.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker2.c
 create mode 100644 platform/generic/worldguard.c

diff --git a/platform/generic/include/wgchecker2.h b/platform/generic/include/wgchecker2.h
new file mode 100644
index 00000000..37b4bfe0
--- /dev/null
+++ b/platform/generic/include/wgchecker2.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __PLATFORM_GENERIC_WGCHECKER2_H__
+#define __PLATFORM_GENERIC_WGCHECKER2_H__
+
+#include <sbi/sbi_types.h>
+
+#define WGCHECKER2_COMPAT			"sifive,wgchecker2"
+#define WGCHECKER2_CFG_NODE			"worldguard_cfg"
+
+#define WGCHECKER2_PROP_SLOT_COUNT		"sifive,slot-count"
+#define WGCHECKER2_PROP_SUBORDINATES		"sifive,subordinates"
+#define WGCHECKER2_PROP_PERMS			"perms"
+
+/*
+ * The current wgchecker2 model uses a 64-bit permission register with
+ * 2 bits per world, so the current checker model tracks at most 32 WIDs.
+ */
+#define WGCHECKER2_MAX_WIDS			32
+
+/* The current wgchecker2 model requires 4 KiB slot alignment. */
+#define WGCHECKER2_MIN_ALIGN			0x1000ULL
+
+/* Current wgchecker2 MMIO register layout. */
+#define WGCHECKER2_MMIO_NSLOTS			0x008
+#define WGCHECKER2_MMIO_ERRCAUSE		0x010
+#define WGCHECKER2_MMIO_ERRADDR			0x018
+#define WGCHECKER2_MMIO_SLOT_BASE		0x020
+#define WGCHECKER2_MMIO_SLOT_STRIDE		0x020
+#define WGCHECKER2_MMIO_SLOT_ADDR		0x000
+#define WGCHECKER2_MMIO_SLOT_PERM		0x008
+#define WGCHECKER2_MMIO_SLOT_CFG		0x010
+
+/* Current wgchecker2 slot cfg.A[1:0] encoding. */
+#define WGCHECKER2_SLOT_CFG_A_MASK		0x3
+#define WGCHECKER2_SLOT_CFG_A_OFF		0x0
+#define WGCHECKER2_SLOT_CFG_A_TOR		0x1
+
+struct wgchecker2_range {
+	u64 base;
+	u64 size;
+	u64 perm;
+};
+
+u32 wgchecker2_count_platform_checkers(void *fdt);
+int wgchecker2_init(void *fdt);
+void wgchecker2_cleanup(void);
+u32 wgchecker2_checker_count(void);
+
+#endif
diff --git a/platform/generic/include/worldguard.h b/platform/generic/include/worldguard.h
new file mode 100644
index 00000000..ed1e70b8
--- /dev/null
+++ b/platform/generic/include/worldguard.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __PLATFORM_GENERIC_WORLDGUARD_H__
+#define __PLATFORM_GENERIC_WORLDGUARD_H__
+
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_types.h>
+
+#define WORLDGUARD_CPU_COMPAT		"riscv,wgcpu"
+#define WORLDGUARD_CPU_NODE		"worldguard"
+
+#define WORLDGUARD_PROP_WID		"worldguard,wid"
+#define WORLDGUARD_PROP_WIDLIST		"worldguard,widlist"
+#define WORLDGUARD_PROP_MWID		"mwid"
+#define WORLDGUARD_PROP_MWIDLIST	"mwidlist"
+
+struct wg_cpu_defaults {
+	u32 trusted_wid;
+	u32 nworlds;
+	u32 valid_wid_mask;
+};
+
+struct worldguard_domain_ctx {
+	bool has_wid;
+	u32 wid;
+	u32 widlist_mask;
+};
+
+int worldguard_register(void);
+const struct sbi_hwiso_ops *worldguard_ops_get(void);
+
+#ifdef CONFIG_SBIUNIT
+int worldguard_test_check_runtime_state(bool runtime_enabled);
+int worldguard_test_check_domain_state(const struct sbi_domain *dom,
+				       bool expect_ctx, u32 wid,
+				       u32 widlist_mask);
+#endif
+
+#endif
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 85aa723a..80bd65ea 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -20,6 +20,9 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 # Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.o
+platform-objs-y += worldguard.o
+platform-objs-y += wgchecker2.o
+platform-objs-y += virt/qemu_virt_worldguard.o
 
 # Blobs to build
 FW_TEXT_START=0x80000000
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index b76c2a2f..7326b709 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -11,6 +11,7 @@
 #include <platform_override.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
@@ -30,6 +31,8 @@
 #include <sbi_utils/rpxy/fdt_rpxy.h>
 #include <sbi_utils/serial/semihosting.h>
 
+extern int qemu_virt_worldguard_register(void *fdt);
+
 /* List of platform override modules generated at compile time */
 extern const struct platform_override *platform_override_modules[];
 extern unsigned long platform_override_modules_size;
@@ -222,9 +225,17 @@ static int generic_nascent_init(void)
 
 static int generic_early_init(bool cold_boot)
 {
+	int rc;
+
 	if (cold_boot)
 		fdt_reset_init();
 
+	if (cold_boot) {
+		rc = qemu_virt_worldguard_register(fdt_get_address());
+		if (rc && rc != SBI_EALREADY)
+			return rc;
+	}
+
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
 
diff --git a/platform/generic/virt/qemu_virt_worldguard.c b/platform/generic/virt/qemu_virt_worldguard.c
new file mode 100644
index 00000000..b5cdab81
--- /dev/null
+++ b/platform/generic/virt/qemu_virt_worldguard.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * QEMU virt WorldGuard registration shim
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hwiso_test.h>
+#include <worldguard.h>
+
+#ifdef CONFIG_SBIUNIT
+extern const struct sbi_hwiso_test_ops qemu_virt_worldguard_test_ops;
+#endif
+
+int qemu_virt_worldguard_register(void *fdt)
+{
+	int rc;
+
+	if (!fdt)
+		return 0;
+
+	if (fdt_node_check_compatible(fdt, 0, "riscv-virtio") &&
+	    fdt_node_check_compatible(fdt, 0, "qemu,virt"))
+		return 0;
+
+	rc = worldguard_register();
+	if (rc)
+		return rc;
+
+#ifdef CONFIG_SBIUNIT
+	rc = sbi_hwiso_test_register(worldguard_ops_get(),
+				     &qemu_virt_worldguard_test_ops);
+	if (rc && rc != SBI_EALREADY)
+		return rc;
+#endif
+
+	return 0;
+}
diff --git a/platform/generic/wgchecker2.c b/platform/generic/wgchecker2.c
new file mode 100644
index 00000000..bd3fab15
--- /dev/null
+++ b/platform/generic/wgchecker2.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * wgchecker2 model support
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_string.h>
+#include <wgchecker2.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct wgchecker2_checker {
+	char name[32];
+	u64 mmio_base;
+	u64 mmio_size;
+	u32 slot_count;
+	u32 subordinate_count;
+	bool full_checker_rule;
+	u64 full_checker_perm;
+	u32 range_count;
+	struct wgchecker2_range *ranges;
+};
+
+struct wgchecker2_platform_ctx {
+	u32 checker_count;
+	struct wgchecker2_checker *checkers;
+};
+
+static struct wgchecker2_platform_ctx *wgchecker2_platform;
+
+static void wgchecker2_free_platform_ctx(struct wgchecker2_platform_ctx *platform)
+{
+	u32 i;
+
+	if (!platform)
+		return;
+
+	for (i = 0; i < platform->checker_count; i++)
+		sbi_free(platform->checkers[i].ranges);
+
+	sbi_free(platform->checkers);
+	sbi_free(platform);
+}
+
+static u64 wgchecker2_read_cells(const fdt32_t *cells, int count)
+{
+	u64 val = 0;
+	int i;
+
+	for (i = 0; i < count; i++)
+		val = (val << 32) | fdt32_to_cpu(cells[i]);
+
+	return val;
+}
+
+static void wgchecker2_write64(u64 addr, u64 val)
+{
+#if __riscv_xlen != 32
+	writeq(val, (void *)(unsigned long)addr);
+#else
+	writel((u32)val, (void *)(unsigned long)addr);
+	writel((u32)(val >> 32), (void *)(unsigned long)(addr + 4));
+#endif
+}
+
+static void wgchecker2_write32(u64 addr, u32 val)
+{
+	writel(val, (void *)(unsigned long)addr);
+}
+
+static u64 wgchecker2_slot_addr_encode(u64 addr)
+{
+	return addr >> 2;
+}
+
+static bool wgchecker2_range_is_aligned(u64 base, u64 size)
+{
+	if (!size)
+		return false;
+
+	if (base & (WGCHECKER2_MIN_ALIGN - 1))
+		return false;
+	if (size & (WGCHECKER2_MIN_ALIGN - 1))
+		return false;
+
+	return true;
+}
+
+static void wgchecker2_sort_ranges(struct wgchecker2_checker *checker)
+{
+	struct wgchecker2_range tmp;
+	u32 i, j;
+
+	for (i = 1; i < checker->range_count; i++) {
+		tmp = checker->ranges[i];
+		j = i;
+		while (j > 0 && checker->ranges[j - 1].base > tmp.base) {
+			checker->ranges[j] = checker->ranges[j - 1];
+			j--;
+		}
+		checker->ranges[j] = tmp;
+	}
+}
+
+static int wgchecker2_compact_ranges(struct wgchecker2_checker *checker)
+{
+	struct wgchecker2_range *prev, *cur;
+	u64 prev_end, cur_end;
+	u32 i, out = 0;
+
+	if (!checker->range_count)
+		return 0;
+
+	wgchecker2_sort_ranges(checker);
+
+	for (i = 0; i < checker->range_count; i++) {
+		cur = &checker->ranges[i];
+		cur_end = cur->base + cur->size;
+		if (cur_end <= cur->base)
+			return SBI_EINVAL;
+
+		if (!out) {
+			checker->ranges[out++] = *cur;
+			continue;
+		}
+
+		prev = &checker->ranges[out - 1];
+		prev_end = prev->base + prev->size;
+		if (cur->base < prev_end)
+			return SBI_EINVAL;
+
+		if (cur->base == prev_end && cur->perm == prev->perm) {
+			prev->size += cur->size;
+			continue;
+		}
+
+		checker->ranges[out++] = *cur;
+	}
+
+	checker->range_count = out;
+	return 0;
+}
+
+static int wgchecker2_get_reg_cells(void *fdt, int resource_node,
+				     int *addr_cells, int *size_cells)
+{
+	int parent;
+
+	parent = fdt_parent_offset(fdt, resource_node);
+	if (parent < 0)
+		return SBI_EINVAL;
+
+	*addr_cells = fdt_address_cells(fdt, parent);
+	*size_cells = fdt_size_cells(fdt, parent);
+	if (*addr_cells <= 0 || *addr_cells > 2 || *size_cells <= 0 ||
+	    *size_cells > 2)
+		return SBI_EINVAL;
+
+	return 0;
+}
+
+static int wgchecker2_count_reg_entries(void *fdt, int resource_node,
+					int reg_node)
+{
+	const fdt32_t *reg;
+	int addr_cells, size_cells, entry_cells, len, rc;
+
+	rc = wgchecker2_get_reg_cells(fdt, resource_node, &addr_cells,
+					      &size_cells);
+	if (rc)
+		return rc;
+
+	reg = fdt_getprop(fdt, reg_node, "reg", &len);
+	if (!reg || len <= 0)
+		return 0;
+
+	entry_cells = addr_cells + size_cells;
+	if (len % (entry_cells * (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	return len / (entry_cells * (int)sizeof(fdt32_t));
+}
+
+static int wgchecker2_parse_perms(void *fdt, int cfg_node, u64 **out_perms,
+				  u32 *out_count)
+{
+	const fdt32_t *perms;
+	u64 *vals;
+	int len, i, count;
+
+	*out_perms = NULL;
+	*out_count = 0;
+
+	perms = fdt_getprop(fdt, cfg_node, WGCHECKER2_PROP_PERMS, &len);
+	if (!perms || len <= 0)
+		return 0;
+
+	if (len % (2 * (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	count = len / (2 * (int)sizeof(fdt32_t));
+	vals = sbi_calloc(sizeof(*vals), count);
+	if (!vals)
+		return SBI_ENOMEM;
+
+	for (i = 0; i < count; i++, perms += 2)
+		vals[i] = wgchecker2_read_cells(perms, 2);
+
+	*out_perms = vals;
+	*out_count = count;
+	return 0;
+}
+
+static int wgchecker2_fill_ranges(void *fdt, int resource_node, int reg_node,
+				  const u64 *perms, u32 perm_count,
+				  struct wgchecker2_range *ranges,
+				  u32 range_count)
+{
+	const fdt32_t *reg;
+	u64 base, size;
+	int addr_cells, size_cells, entry_cells, len, i, rc;
+
+	rc = wgchecker2_get_reg_cells(fdt, resource_node, &addr_cells,
+					      &size_cells);
+	if (rc)
+		return rc;
+
+	reg = fdt_getprop(fdt, reg_node, "reg", &len);
+	if (!reg || len <= 0)
+		return SBI_EINVAL;
+
+	entry_cells = addr_cells + size_cells;
+	for (i = 0; i < (int)range_count; i++, reg += entry_cells) {
+		base = wgchecker2_read_cells(reg, addr_cells);
+		size = wgchecker2_read_cells(reg + addr_cells, size_cells);
+		if (!wgchecker2_range_is_aligned(base, size))
+			return SBI_EINVAL;
+
+		ranges[i].base = base;
+		ranges[i].size = size;
+		ranges[i].perm = perms[(perm_count == 1) ? 0 : i];
+	}
+
+	return 0;
+}
+
+static int wgchecker2_parse_checker_rules(void *fdt, int checker_node,
+					  struct wgchecker2_checker *checker)
+{
+	const fdt32_t *subs;
+	u64 *perms = NULL;
+	int cfg_node, len, i, rc = 0, reg_count;
+	u32 perm_count = 0;
+	int child;
+
+	subs = fdt_getprop(fdt, checker_node, WGCHECKER2_PROP_SUBORDINATES, &len);
+	if (!subs || len <= 0)
+		return 0;
+	if (len % (int)sizeof(fdt32_t))
+		goto err;
+
+	checker->subordinate_count = len / sizeof(fdt32_t);
+	if (!checker->slot_count)
+		goto err;
+
+	checker->ranges = sbi_calloc(sizeof(*checker->ranges),
+				     checker->slot_count);
+	if (!checker->ranges)
+		return SBI_ENOMEM;
+
+	for (i = 0; i < checker->subordinate_count; i++) {
+		child = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(subs[i]));
+		if (child < 0) {
+			rc = child;
+			goto err;
+		}
+
+		cfg_node = fdt_subnode_offset(fdt, child, WGCHECKER2_CFG_NODE);
+		if (cfg_node < 0)
+			continue;
+
+		rc = wgchecker2_parse_perms(fdt, cfg_node, &perms, &perm_count);
+		if (rc)
+			goto err;
+		if (!perm_count)
+			continue;
+
+		reg_count = wgchecker2_count_reg_entries(fdt, child, cfg_node);
+		if (reg_count < 0)
+			goto err;
+
+		if (!reg_count && checker->subordinate_count == 1 &&
+		    perm_count == 1) {
+			if (checker->range_count)
+				goto err;
+			checker->full_checker_rule = true;
+			checker->full_checker_perm = perms[0];
+			sbi_free(perms);
+			perms = NULL;
+			continue;
+		}
+
+		if (!reg_count)
+			reg_count = wgchecker2_count_reg_entries(fdt, child, child);
+		if (reg_count <= 0)
+			goto err;
+
+		if (perm_count != 1 && perm_count != (u32)reg_count)
+			goto err;
+		if (checker->full_checker_rule)
+			goto err;
+		if (checker->range_count + reg_count > checker->slot_count)
+			goto err;
+
+		rc = wgchecker2_fill_ranges(
+			fdt, child,
+			(fdt_getprop(fdt, cfg_node, "reg", NULL) ? cfg_node : child),
+			perms, perm_count,
+			&checker->ranges[checker->range_count], reg_count);
+		sbi_free(perms);
+		perms = NULL;
+		if (rc)
+			goto err;
+
+		checker->range_count += reg_count;
+	}
+
+	if (checker->full_checker_rule)
+		return 0;
+
+	return wgchecker2_compact_ranges(checker);
+
+err:
+	sbi_free(perms);
+	return rc ? rc : SBI_EINVAL;
+}
+
+static int wgchecker2_parse_checker(void *fdt, int checker_node,
+				    struct wgchecker2_checker *checker)
+{
+	const fdt32_t *val;
+	u64 base = 0, size = 0;
+	int len, rc;
+
+	rc = fdt_get_node_addr_size(fdt, checker_node, 0, &base, &size);
+	if (rc)
+		return rc;
+
+	val = fdt_getprop(fdt, checker_node, WGCHECKER2_PROP_SLOT_COUNT, &len);
+	if (!val || len < (int)sizeof(fdt32_t))
+		return SBI_EINVAL;
+
+	checker->mmio_base = base;
+	checker->mmio_size = size;
+	checker->slot_count = fdt32_to_cpu(val[0]);
+	sbi_snprintf(checker->name, sizeof(checker->name), "%s",
+		     fdt_get_name(fdt, checker_node, NULL));
+
+	return wgchecker2_parse_checker_rules(fdt, checker_node, checker);
+}
+
+static void wgchecker2_program_clear_slots(const struct wgchecker2_checker *checker)
+{
+	u32 slot;
+
+	for (slot = 1; slot < checker->slot_count; slot++) {
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_ADDR, 0);
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_PERM, 0);
+		wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_CFG, 0);
+	}
+}
+
+static void wgchecker2_program_clear_last_slot(const struct wgchecker2_checker *checker)
+{
+	wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+			   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+			   WGCHECKER2_MMIO_SLOT_PERM, 0);
+	wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+			   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+			   WGCHECKER2_MMIO_SLOT_CFG, 0);
+}
+
+static void wgchecker2_program_clear_slots_from(const struct wgchecker2_checker *checker,
+						u32 first_slot)
+{
+	u32 slot;
+
+	if (first_slot >= checker->slot_count)
+		return;
+
+	for (slot = first_slot; slot < checker->slot_count; slot++) {
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_ADDR, 0);
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_PERM, 0);
+		wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_CFG, 0);
+	}
+}
+
+static int wgchecker2_program_checker(const struct wgchecker2_checker *checker)
+{
+	u64 prev_end = 0;
+	u32 required_slots = 0, slot = 1, i;
+
+	wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_ERRCAUSE, 0);
+	wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_ERRADDR, 0);
+
+	if (checker->full_checker_rule) {
+		wgchecker2_program_clear_slots(checker);
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_PERM,
+				   checker->full_checker_perm);
+		wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_CFG,
+				   WGCHECKER2_SLOT_CFG_A_TOR);
+		return 0;
+	}
+
+	for (i = 0; i < checker->range_count; i++) {
+		if (!i || checker->ranges[i].base != prev_end)
+			required_slots++;
+		required_slots++;
+		prev_end = checker->ranges[i].base + checker->ranges[i].size;
+	}
+
+	if (required_slots > checker->slot_count - 1)
+		return SBI_EINVAL;
+
+	prev_end = 0;
+	for (i = 0; i < checker->range_count; i++) {
+		const struct wgchecker2_range *range = &checker->ranges[i];
+		u64 end = range->base + range->size;
+
+		if (!i || range->base != prev_end) {
+			wgchecker2_write64(checker->mmio_base +
+					   WGCHECKER2_MMIO_SLOT_BASE +
+					   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+					   WGCHECKER2_MMIO_SLOT_ADDR,
+					   wgchecker2_slot_addr_encode(range->base));
+			wgchecker2_write64(checker->mmio_base +
+					   WGCHECKER2_MMIO_SLOT_BASE +
+					   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+					   WGCHECKER2_MMIO_SLOT_PERM, 0);
+			wgchecker2_write32(checker->mmio_base +
+					   WGCHECKER2_MMIO_SLOT_BASE +
+					   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+					   WGCHECKER2_MMIO_SLOT_CFG,
+					   WGCHECKER2_SLOT_CFG_A_OFF);
+			slot++;
+		}
+
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_ADDR,
+				   wgchecker2_slot_addr_encode(end));
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_PERM, range->perm);
+		wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_CFG,
+				   WGCHECKER2_SLOT_CFG_A_TOR);
+		prev_end = end;
+		slot++;
+	}
+
+	/*
+	 * Keep the reset-time trusted-WID bypass slot alive until the new
+	 * rule set is fully programmed, otherwise the DRAM checker can deny
+	 * OpenSBI's own RAM accesses mid-update.
+	 */
+	wgchecker2_program_clear_slots_from(checker, slot);
+	wgchecker2_program_clear_last_slot(checker);
+
+	return 0;
+}
+
+u32 wgchecker2_count_platform_checkers(void *fdt)
+{
+	int checker_node;
+	u32 count = 0;
+
+	if (!fdt)
+		return 0;
+
+	checker_node = -1;
+	while (true) {
+		checker_node = fdt_node_offset_by_compatible(fdt, checker_node,
+						     WGCHECKER2_COMPAT);
+		if (checker_node < 0)
+			break;
+		if (fdt_getprop(fdt, checker_node, WGCHECKER2_PROP_SUBORDINATES,
+				NULL))
+			count++;
+	}
+
+	return count;
+}
+
+int wgchecker2_init(void *fdt)
+{
+	struct wgchecker2_platform_ctx *platform;
+	int checker_node, rc;
+	u32 count, idx = 0;
+
+	wgchecker2_cleanup();
+
+	if (!fdt)
+		return 0;
+
+	count = wgchecker2_count_platform_checkers(fdt);
+	if (!count)
+		return 0;
+
+	platform = sbi_zalloc(sizeof(*platform));
+	if (!platform)
+		return SBI_ENOMEM;
+
+	platform->checker_count = count;
+	platform->checkers = sbi_calloc(sizeof(*platform->checkers), count);
+	if (!platform->checkers) {
+		sbi_free(platform);
+		return SBI_ENOMEM;
+	}
+
+	checker_node = -1;
+	while (true) {
+		checker_node = fdt_node_offset_by_compatible(fdt, checker_node,
+						     WGCHECKER2_COMPAT);
+		if (checker_node < 0)
+			break;
+		if (!fdt_getprop(fdt, checker_node, WGCHECKER2_PROP_SUBORDINATES,
+				 NULL))
+			continue;
+
+		rc = wgchecker2_parse_checker(fdt, checker_node,
+					      &platform->checkers[idx]);
+		if (rc) {
+			wgchecker2_free_platform_ctx(platform);
+			return rc;
+		}
+
+		rc = wgchecker2_program_checker(&platform->checkers[idx]);
+		if (rc) {
+			wgchecker2_free_platform_ctx(platform);
+			return rc;
+		}
+		idx++;
+	}
+
+	wgchecker2_platform = platform;
+	return 0;
+}
+
+void wgchecker2_cleanup(void)
+{
+	if (!wgchecker2_platform)
+		return;
+
+	wgchecker2_free_platform_ctx(wgchecker2_platform);
+	wgchecker2_platform = NULL;
+}
+
+u32 wgchecker2_checker_count(void)
+{
+	return wgchecker2_platform ? wgchecker2_platform->checker_count : 0;
+}
diff --git a/platform/generic/worldguard.c b/platform/generic/worldguard.c
new file mode 100644
index 00000000..a951459b
--- /dev/null
+++ b/platform/generic/worldguard.c
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Generic WorldGuard runtime support
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_scratch.h>
+#include <worldguard.h>
+#include <wgchecker2.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct worldguard_platform_ctx {
+	u32 hart_count;
+	bool runtime_enabled;
+	struct wg_cpu_defaults *hart_defaults;
+};
+
+static struct worldguard_platform_ctx *worldguard_platform;
+
+static u32 worldguard_wid_mask(u32 wid)
+{
+	return (wid < WGCHECKER2_MAX_WIDS) ? (1U << wid) : 0;
+}
+
+static void worldguard_free_platform(void)
+{
+	if (!worldguard_platform)
+		return;
+
+	sbi_free(worldguard_platform->hart_defaults);
+	sbi_free(worldguard_platform);
+	worldguard_platform = NULL;
+}
+
+static bool worldguard_runtime_enabled(void)
+{
+	return worldguard_platform && worldguard_platform->runtime_enabled;
+}
+
+static void worldguard_init_cpu_defaults(struct worldguard_platform_ctx *platform)
+{
+	u32 i;
+
+	if (!platform || !platform->hart_defaults)
+		return;
+
+	for (i = 0; i < platform->hart_count; i++) {
+		platform->hart_defaults[i].trusted_wid = 0;
+		platform->hart_defaults[i].nworlds = 1;
+		platform->hart_defaults[i].valid_wid_mask = 0x1;
+	}
+}
+
+static int worldguard_parse_wid_prop(void *fdt, int node, const char *prop_name,
+				     u32 *out_wid)
+{
+	const fdt32_t *prop;
+	int len;
+
+	if (!out_wid)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, node, prop_name, &len);
+	if (!prop)
+		return SBI_ENOENT;
+	if (len != (int)sizeof(fdt32_t))
+		return SBI_EINVAL;
+
+	*out_wid = fdt32_to_cpu(prop[0]);
+	if (*out_wid >= WGCHECKER2_MAX_WIDS)
+		return SBI_EINVAL;
+
+	return 0;
+}
+
+static int worldguard_parse_widlist(void *fdt, int node, const char *prop_name,
+				    u32 *out_mask)
+{
+	const fdt32_t *prop;
+	u32 mask = 0, count, wid;
+	int len, i;
+
+	if (!out_mask)
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+
+	prop = fdt_getprop(fdt, node, prop_name, &len);
+	if (!prop)
+		return 0;
+	if (len < 0 || (len % (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	count = len / sizeof(fdt32_t);
+	if (count > WGCHECKER2_MAX_WIDS)
+		return SBI_EINVAL;
+
+	for (i = 0; i < (int)count; i++) {
+		wid = fdt32_to_cpu(prop[i]);
+		if (wid >= WGCHECKER2_MAX_WIDS)
+			return SBI_EINVAL;
+		if (mask & worldguard_wid_mask(wid))
+			return SBI_EINVAL;
+
+		mask |= worldguard_wid_mask(wid);
+	}
+
+	*out_mask = mask;
+	return 0;
+}
+
+static int worldguard_parse_cpu_defaults(void *fdt,
+					 struct worldguard_platform_ctx *platform)
+{
+	struct wg_cpu_defaults *cpu_defaults;
+	u32 hartid, hartindex, max_wid;
+	int cpus_offset, cpu_offset, wgcpu, rc;
+
+	if (!fdt || !platform || !platform->hart_defaults)
+		return 0;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return 0;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		if (fdt_parse_hart_id(fdt, cpu_offset, &hartid))
+			continue;
+
+		hartindex = sbi_hartid_to_hartindex(hartid);
+		if (!sbi_hartindex_valid(hartindex) ||
+		    hartindex >= platform->hart_count)
+			continue;
+
+		wgcpu = fdt_subnode_offset(fdt, cpu_offset, WORLDGUARD_CPU_NODE);
+		if (wgcpu < 0 || fdt_node_check_compatible(
+					 fdt, wgcpu, WORLDGUARD_CPU_COMPAT))
+			continue;
+
+		cpu_defaults = &platform->hart_defaults[hartindex];
+		rc = worldguard_parse_wid_prop(fdt, wgcpu, WORLDGUARD_PROP_MWID,
+					       &cpu_defaults->trusted_wid);
+		if (rc)
+			return rc;
+
+		max_wid = cpu_defaults->trusted_wid;
+		rc = worldguard_parse_widlist(fdt, wgcpu,
+					      WORLDGUARD_PROP_MWIDLIST,
+					      &cpu_defaults->valid_wid_mask);
+		if (rc)
+			return rc;
+
+		cpu_defaults->valid_wid_mask |=
+			worldguard_wid_mask(cpu_defaults->trusted_wid);
+		if (cpu_defaults->valid_wid_mask) {
+			u32 wid;
+
+			for (wid = 0; wid < WGCHECKER2_MAX_WIDS; wid++) {
+				if (cpu_defaults->valid_wid_mask & (1U << wid))
+					max_wid = wid;
+			}
+		}
+
+		cpu_defaults->nworlds = max_wid + 1;
+	}
+
+	return 0;
+}
+
+static bool worldguard_has_cpu_runtime(void *fdt)
+{
+	u32 hartid;
+	int cpus_offset, cpu_offset, wgcpu;
+
+	if (!fdt)
+		return false;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return false;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		if (fdt_parse_hart_id(fdt, cpu_offset, &hartid))
+			continue;
+
+		wgcpu = fdt_subnode_offset(fdt, cpu_offset, WORLDGUARD_CPU_NODE);
+		if (wgcpu < 0)
+			continue;
+		if (fdt_node_check_compatible(fdt, wgcpu, WORLDGUARD_CPU_COMPAT))
+			continue;
+
+		return true;
+	}
+
+	return false;
+}
+
+static int worldguard_validate_domain_ctx(const struct sbi_domain *dom,
+					  const struct worldguard_domain_ctx *ctx)
+{
+	const struct wg_cpu_defaults *cpu_defaults;
+	u32 hartindex;
+
+	if (!worldguard_platform || !dom || !ctx || dom == &root ||
+	    !dom->possible_harts)
+		return 0;
+
+	for (hartindex = 0; hartindex < worldguard_platform->hart_count;
+	     hartindex++) {
+		if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
+			continue;
+
+		cpu_defaults = &worldguard_platform->hart_defaults[hartindex];
+		if (!(cpu_defaults->valid_wid_mask & worldguard_wid_mask(ctx->wid)))
+			return SBI_EINVAL;
+		if (ctx->widlist_mask & ~cpu_defaults->valid_wid_mask)
+			return SBI_EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct wg_cpu_defaults *worldguard_current_cpu_defaults(void)
+{
+	u32 hartindex;
+
+	if (!worldguard_platform || !worldguard_platform->hart_defaults)
+		return NULL;
+
+	hartindex = sbi_hartid_to_hartindex(current_hartid());
+	if (!sbi_hartindex_valid(hartindex) ||
+	    hartindex >= worldguard_platform->hart_count)
+		return NULL;
+
+	return &worldguard_platform->hart_defaults[hartindex];
+}
+
+static u32 worldguard_fallback_wid(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->trusted_wid : 0;
+}
+
+static u32 worldguard_valid_wid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->valid_wid_mask :
+			      worldguard_wid_mask(worldguard_fallback_wid());
+}
+
+static u32 worldguard_select_slwid(u32 widlist_mask, bool has_wid, u32 wid,
+				   u32 fallback)
+{
+	u32 i;
+
+	if (!widlist_mask)
+		return fallback;
+
+	if (has_wid && (worldguard_wid_mask(wid) & widlist_mask))
+		return wid;
+
+	for (i = 0; i < WGCHECKER2_MAX_WIDS; i++) {
+		if (widlist_mask & (1U << i))
+			return i;
+	}
+
+	return fallback;
+}
+
+static void worldguard_program_wid_state(u32 mlwid, u32 mwiddeleg, u32 slwid)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWG))
+		return;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWG)) {
+		csr_write(CSR_MLWID, mlwid);
+		return;
+	}
+
+	csr_write(CSR_MWIDDELEG, 0);
+	csr_write(CSR_MLWID, mlwid);
+	if (mwiddeleg) {
+		csr_write(CSR_MWIDDELEG, mwiddeleg);
+		csr_write(CSR_SLWID, slwid);
+	}
+}
+
+static int worldguard_init(void *fdt)
+{
+	struct worldguard_platform_ctx *platform;
+	u32 checker_count;
+	bool has_runtime;
+	int rc;
+
+	wgchecker2_cleanup();
+	worldguard_free_platform();
+
+	if (!fdt)
+		return 0;
+
+	checker_count = wgchecker2_count_platform_checkers(fdt);
+	has_runtime = worldguard_has_cpu_runtime(fdt);
+	if (!checker_count && !has_runtime)
+		return 0;
+
+	platform = sbi_zalloc(sizeof(*platform));
+	if (!platform)
+		return SBI_ENOMEM;
+
+	platform->hart_count = sbi_scratch_last_hartindex() + 1;
+	platform->runtime_enabled = has_runtime;
+	platform->hart_defaults = sbi_calloc(sizeof(*platform->hart_defaults),
+					      platform->hart_count);
+	if (!platform->hart_defaults) {
+		sbi_free(platform);
+		return SBI_ENOMEM;
+	}
+
+	worldguard_init_cpu_defaults(platform);
+	rc = worldguard_parse_cpu_defaults(fdt, platform);
+	if (rc) {
+		sbi_free(platform->hart_defaults);
+		sbi_free(platform);
+		return rc;
+	}
+
+	worldguard_platform = platform;
+
+	if (checker_count) {
+		rc = wgchecker2_init(fdt);
+		if (rc) {
+			worldguard_free_platform();
+			wgchecker2_cleanup();
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static int worldguard_domain_init(void *fdt, int domain_offset,
+				  struct sbi_domain *dom, void **out_ctx)
+{
+	struct worldguard_domain_ctx *ctx;
+	int hoff, child, rc;
+	bool found = false;
+
+	if (!out_ctx)
+		return SBI_EINVAL;
+
+	*out_ctx = NULL;
+	if (!worldguard_runtime_enabled())
+		return 0;
+	if (!fdt || domain_offset < 0)
+		return 0;
+
+	hoff = fdt_subnode_offset(fdt, domain_offset, "hw-isolation");
+	if (hoff < 0)
+		return (dom == &root) ? 0 : SBI_EINVAL;
+
+	fdt_for_each_subnode(child, fdt, hoff) {
+		if (fdt_node_check_compatible(fdt, child, WGCHECKER2_COMPAT))
+			continue;
+		found = true;
+		break;
+	}
+
+	if (!found)
+		return (dom == &root) ? 0 : SBI_EINVAL;
+
+	ctx = sbi_zalloc(sizeof(*ctx));
+	if (!ctx)
+		return SBI_ENOMEM;
+
+	rc = worldguard_parse_wid_prop(fdt, child, WORLDGUARD_PROP_WID,
+				       &ctx->wid);
+	if (rc)
+		goto err_free_ctx;
+	ctx->has_wid = true;
+
+	rc = worldguard_parse_widlist(fdt, child, WORLDGUARD_PROP_WIDLIST,
+				      &ctx->widlist_mask);
+	if (rc)
+		goto err_free_ctx;
+
+	rc = worldguard_validate_domain_ctx(dom, ctx);
+	if (rc)
+		goto err_free_ctx;
+
+	*out_ctx = ctx;
+	return 0;
+
+err_free_ctx:
+	sbi_free(ctx);
+	return rc;
+}
+
+static void worldguard_domain_exit(const struct sbi_domain *src,
+				   const struct sbi_domain *dst, void *ctx)
+{
+	u32 mlwid = worldguard_fallback_wid();
+
+	(void)ctx;
+	if (!worldguard_runtime_enabled())
+		return;
+
+	worldguard_program_wid_state(mlwid, 0, mlwid);
+
+}
+
+static void worldguard_domain_enter(const struct sbi_domain *dst,
+				    const struct sbi_domain *src, void *ctx)
+{
+	struct worldguard_domain_ctx *dctx = ctx;
+	u32 valid_mask = worldguard_valid_wid_mask();
+	u32 mlwid = worldguard_fallback_wid();
+	u32 mwiddeleg = 0;
+	u32 slwid = mlwid;
+
+	(void)src;
+	if (!worldguard_runtime_enabled())
+		return;
+
+	if (dctx && dctx->has_wid && (worldguard_wid_mask(dctx->wid) & valid_mask))
+		mlwid = dctx->wid;
+
+	if (dctx)
+		mwiddeleg = dctx->widlist_mask & valid_mask;
+	slwid = worldguard_select_slwid(mwiddeleg, dctx && dctx->has_wid,
+					dctx ? dctx->wid : 0, mlwid);
+
+	worldguard_program_wid_state(mlwid, mwiddeleg, slwid);
+
+}
+
+static void worldguard_domain_cleanup(struct sbi_domain *dom, void *ctx)
+{
+	(void)dom;
+	sbi_free(ctx);
+}
+
+static const struct sbi_hwiso_ops worldguard_ops = {
+	.name = WGCHECKER2_COMPAT,
+	.init = worldguard_init,
+	.domain_init = worldguard_domain_init,
+	.domain_exit = worldguard_domain_exit,
+	.domain_enter = worldguard_domain_enter,
+	.domain_cleanup = worldguard_domain_cleanup,
+};
+
+int worldguard_register(void)
+{
+	return sbi_hwiso_register(&worldguard_ops);
+}
+
+const struct sbi_hwiso_ops *worldguard_ops_get(void)
+{
+	return &worldguard_ops;
+}
+
+#ifdef CONFIG_SBIUNIT
+static struct worldguard_domain_ctx *
+worldguard_test_find_domain_ctx(const struct sbi_domain *dom)
+{
+	u32 i;
+
+	if (!dom || !dom->hwiso_ctxs)
+		return NULL;
+
+	for (i = 0; i < dom->hwiso_ctx_count; i++) {
+		if (dom->hwiso_ctxs[i].ops != &worldguard_ops)
+			continue;
+
+		return dom->hwiso_ctxs[i].ctx;
+	}
+
+	return NULL;
+}
+
+int worldguard_test_check_runtime_state(bool runtime_enabled)
+{
+	if (!worldguard_platform)
+		return runtime_enabled ? SBI_ENOENT : 0;
+	if (worldguard_platform->runtime_enabled != runtime_enabled)
+		return SBI_EINVAL;
+
+	return 0;
+}
+
+int worldguard_test_check_domain_state(const struct sbi_domain *dom,
+				       bool expect_ctx, u32 wid,
+				       u32 widlist_mask)
+{
+	struct worldguard_domain_ctx *ctx = worldguard_test_find_domain_ctx(dom);
+
+	if (!expect_ctx)
+		return ctx ? SBI_EINVAL : 0;
+	if (!ctx || !ctx->has_wid)
+		return SBI_ENOENT;
+	if (ctx->wid != wid || ctx->widlist_mask != widlist_mask)
+		return SBI_EINVAL;
+
+	return 0;
+}
+#endif
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
