Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB89EC79F82
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyIFoCNuN5jOjtIDezVrBpckfKyONj112e/KEEEMDto=; b=oQ23/pJsFoEIWm
	BXRy2BZ247M4f7nv4Gi0xUd18P+/5LZbvNTxHLuRwA2L1PD8XvfItQjaxJPzCMi/sXM920gLK3vZ5
	74WKKeyrIQ+xz8YNcoAgOVbmcAkuWPOzgl/ZE6NHZ7dh1rg2FAFo+7yTbdVC3TsL2azgPEST3VCeo
	TuY0vxlHZEof68gGjgxqLQU+2KziE6ft6cPLEac4sbCANBnN0O03atRfZD2OwMdXuYCAKS2plY6C8
	Vox6Yu676LV4wYKNBjFbAQ7Ndy8xoUDsOq64RLlccdNjE6rNmRaQxPZAQtpVYn+iJ0Q/7z7XqR6p7
	JDM0VNYEa+Nzn7aOWG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnN-00000002jdl-0bYY;
	Fri, 04 Sep 2026 16:29:41 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnJ-00000002jaR-3qKu
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:40 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-90e828b309eso18825446d6.1
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539377; x=1789144177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtkzqVYDTfaB2zMaq5+dr104Q/PsMLw3ZKw5j7ECBY=;
        b=Ky8eQF6GsRD15kJgF+dSNJQ/5pS7g+9plSF8RBSzEHZtRHgvPJ5JXcGi/G5Ot9CiXS
         C8K92Gnm9Ylx7jLlrVrh/QFRYlHt/EwAcn3mno75XQOv5xWvFAD4EZGF2tVDDUumDOCD
         9DWwA26W7aT9rXlrLIlrTH1SntEFaLpTInBW0SV0hrbvQvzdCzQbyluGOJVAC8Gn0hYd
         zsFhZa+64SCreYW9ubO0sne2b3i4e1DV0XS+JZQsXgnpOjQ2ofwMMRNpKN4vruDE+iB0
         JVfPCoDtelMsMpf2wcd3XvxBVUiDCSHlor2lnFOVWeM+C598KwRGNyAB+9sJTHVNW+Fk
         o5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539377; x=1789144177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRtkzqVYDTfaB2zMaq5+dr104Q/PsMLw3ZKw5j7ECBY=;
        b=tO6HX6fSMKVjX7sYkvRacOqn7h/GBeVX3fSTTPGQtVI8ov9G3hXxf5NlnuG3A11r2r
         vWLTxgqePwPpVGRRGD1HntAkrIA3QJXBKZ8a9pO3i6UynObjZX3wO0pRYNM7LgJN7mLq
         PEc28NVDZHNOvgP2wvfUl01saJ+HmYDoxkE7+mDXl8rV6krIxweCyQ4HV1r7vc40uQ6V
         XgaCWhC3+OY1ewHJY+Qh/a1wKDpUYrH+l/Gt5JgUYjz7MZ8fw3aks9HnwDoBTFCd2xYf
         poAbKRlrLJBs763AACUWMD0Qs8dLkpMBZHmpzKf1DpuraDyeu+39BDCoTn6HRFEjvFtb
         ryMQ==
X-Gm-Message-State: AFuF++kBJlLC4b666byqg/fAxxi6+EFitgJ5s7ZmtJPXZFS8VK+IT30K
	u+QlZPjxssdghG2WR7QQ+cdt5JwibS5Sdrm7fK2sAo7n23S8UeNoTp0qoByDaQ==
X-Gm-Gg: AYBFou26Q5fZo8N4BN2E6nnQbfV5wEzLuiaamGAQ8M2NuUi6kIzh9jUcosNQ4sTW+S3
	dnUQ/Bm6V7pwxXDpR68dY9iziAMdTARVTWkpldUs+tlAQPJiNHERX0LCaEsiF8oALB28lylNzWm
	4lMWzk+VPgdBOg6/Tf76WFkHkXuMutN2NcWO4Qj3W1UAN00/RdfFUbcKcHIddsgipNoKMx0t7SL
	FioUmh18MwGPUF/SBUQsG1Im7rXNvwVBuUgk0J89Ls9glDmI8WOiiwr0yndQAmcLBMAFWMD9997
	i0wZgFWNEkOkktpKZi7P0/EjeGCkOd/GwHQiP/duL5vX6/kt7S0CWxWcHDrieFLpsnT1Jym1vcI
	05R5Hei+QMXpALtFSeMpLY+UkMCcTs6b6tmFuBOokgzU5OeyE+RcGs1U4yfmk5hUx5HshQlFo48
	KuagxrRAK5kJUdJLsN0GqdzleSh/WY9vUFS1MhV/TNh5ZUNKWGTSZnt6VOjolWDj+Pn++8l4Y9y
	gvi3Oo8Y2gr3B0C0z+iDQ==
X-Received: by 2002:a05:6214:5bc1:b0:910:3452:d57f with SMTP id 6a1803df08f44-9103f0533afmr98038106d6.31.1788539376637;
        Fri, 04 Sep 2026 09:29:36 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:36 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 4/5] platform: generic: add WorldGuard checker support
Date: Fri,  4 Sep 2026 12:29:14 -0400
Message-Id: <20260904162915.1092353-5-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092938_112268_A638CD63 
X-CRM114-Status: GOOD (  24.15  )
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

Add WorldGuard support for the hart protection runtime on the
generic platform.

Parse checker provider nodes compatible with qemu,wgchecker2 or
sifive,wgchecker2 and their partition@N children, then program checker
MMIO state from the described protected ranges, permissions, and
DT-visible slot policy bits.

Add WorldGuard runtime support to parse per-hart CPU defaults from
/cpus and per-domain WorldGuard metadata under domain hw-isolation
nodes, and use that state to reprogram MLWID, MLWIDLIST, MWIDDELEG,
SLWID during domain transitions.

Keep the QEMU virt platform code as the integration layer that invokes
WorldGuard setup for the virt platform.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 .../generic/include/qemu_virt_worldguard.h    |  13 +
 platform/generic/include/wgchecker.h          |  91 +++
 platform/generic/include/worldguard.h         |  36 ++
 platform/generic/objects.mk                   |   3 +
 platform/generic/platform.c                   |  15 +-
 platform/generic/virt/qemu_virt_worldguard.c  |  25 +
 platform/generic/wgchecker.c                  | 546 ++++++++++++++++++
 platform/generic/worldguard.c                 | 544 +++++++++++++++++
 8 files changed, 1272 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/include/qemu_virt_worldguard.h
 create mode 100644 platform/generic/include/wgchecker.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker.c
 create mode 100644 platform/generic/worldguard.c

diff --git a/platform/generic/include/qemu_virt_worldguard.h b/platform/generic/include/qemu_virt_worldguard.h
new file mode 100644
index 00000000..8db30a24
--- /dev/null
+++ b/platform/generic/include/qemu_virt_worldguard.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __PLATFORM_GENERIC_QEMU_VIRT_WORLDGUARD_H__
+#define __PLATFORM_GENERIC_QEMU_VIRT_WORLDGUARD_H__
+
+int qemu_virt_worldguard_setup(const void *fdt);
+
+#endif
diff --git a/platform/generic/include/wgchecker.h b/platform/generic/include/wgchecker.h
new file mode 100644
index 00000000..fc5fe317
--- /dev/null
+++ b/platform/generic/include/wgchecker.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __PLATFORM_GENERIC_WGCHECKER_H__
+#define __PLATFORM_GENERIC_WGCHECKER_H__
+
+#include <sbi/sbi_types.h>
+
+#define WGCHECKER_COMPAT			"sifive,wgchecker2"
+#define WGCHECKER_QEMU_COMPAT			"qemu,wgchecker2"
+#define WGCHECKER_ADDRESS_CELLS			1
+#define WGCHECKER_SIZE_CELLS			0
+#define WGCHECKER_ACCESS_CONTROLLER_CELLS	1
+#define WGCHECKER_PARTITION_UNPROTECTED_ID	0xffffffffU
+#define WGCHECKER_PROP_WG_REGION		"sifive,wg-region"
+#define WGCHECKER_PROP_SLOT_PERMISSIONS	"sifive,slot-permissions"
+#define WGCHECKER_PROP_SLOT_CONFIG		"sifive,slot-config"
+
+/*
+ * The current wgchecker model uses a 64-bit permission register with
+ * 2 bits per world, so the current checker model tracks at most 32 WIDs.
+ */
+#define WGCHECKER_MAX_WIDS			32
+
+/* The current wgchecker model requires 4 KiB slot alignment. */
+#define WGCHECKER_MIN_ALIGN			0x1000ULL
+
+/* Current wgchecker MMIO register layout. */
+#define WGCHECKER_MMIO_NSLOTS			0x008
+#define WGCHECKER_MMIO_ERRCAUSE		0x010
+#define WGCHECKER_MMIO_ERRADDR			0x018
+#define WGCHECKER_MMIO_SLOT_BASE		0x020
+#define WGCHECKER_MMIO_SLOT_STRIDE		0x020
+#define WGCHECKER_MMIO_SLOT_ADDR		0x000
+#define WGCHECKER_MMIO_SLOT_PERM		0x008
+#define WGCHECKER_MMIO_SLOT_CFG		0x010
+
+/*
+ * RFC access-controller config bits. These are the DT-visible policy bits
+ * carried by the final "config" cell in each access-controllers specifier.
+ */
+#define WGCHECKER_CONFIG_ER			0x01U
+#define WGCHECKER_CONFIG_EW			0x02U
+#define WGCHECKER_CONFIG_IR			0x04U
+#define WGCHECKER_CONFIG_IW			0x08U
+#define WGCHECKER_CONFIG_L			0x10U
+#define WGCHECKER_CONFIG_MASK			0x1fU
+
+#define WGCHECKER_CONFIG_ERR_RW		\
+	(WGCHECKER_CONFIG_ER | WGCHECKER_CONFIG_EW)
+#define WGCHECKER_CONFIG_ERR_IRQ_RW		\
+	(WGCHECKER_CONFIG_ERR_RW | WGCHECKER_CONFIG_IR | \
+	 WGCHECKER_CONFIG_IW)
+
+/* RFC permission bitmap helpers: two bits per WID, read then write. */
+#define WGCHECKER_PERM_R(_wid)		(1ULL << (2U * (_wid)))
+#define WGCHECKER_PERM_W(_wid)		(1ULL << (2U * (_wid) + 1U))
+
+static inline u64 wgchecker_perm_rw(u32 wid)
+{
+	return WGCHECKER_PERM_R(wid) | WGCHECKER_PERM_W(wid);
+}
+
+/* Current wgchecker MMIO slot cfg.A[1:0] encoding. */
+#define WGCHECKER_SLOT_CFG_A_MASK		0x3
+#define WGCHECKER_SLOT_CFG_A_OFF		0x0
+#define WGCHECKER_SLOT_CFG_A_TOR		0x1
+#define WGCHECKER_SLOT_CFG_A_NAPOT		0x3
+#define WGCHECKER_SLOT_CFG_ER			(1U << 8)
+#define WGCHECKER_SLOT_CFG_EW			(1U << 9)
+#define WGCHECKER_SLOT_CFG_IR			(1U << 10)
+#define WGCHECKER_SLOT_CFG_IW			(1U << 11)
+#define WGCHECKER_SLOT_CFG_LOCK		(1U << 31)
+
+struct wgchecker_range {
+	u64 base;
+	u64 size;
+	u64 perm;
+	u32 cfg;
+};
+
+u32 wgchecker_count_platform_checkers(void *fdt);
+int wgchecker_init(void *fdt);
+void wgchecker_cleanup(void);
+u32 wgchecker_checker_count(void);
+
+#endif
diff --git a/platform/generic/include/worldguard.h b/platform/generic/include/worldguard.h
new file mode 100644
index 00000000..dc77458d
--- /dev/null
+++ b/platform/generic/include/worldguard.h
@@ -0,0 +1,36 @@
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
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_domain.h>
+
+#define WORLDGUARD_PROP_WID		"worldguard,wid"
+#define WORLDGUARD_PROP_WIDLIST		"worldguard,widlist"
+#define WORLDGUARD_CPU_PROP_PMWID	"riscv,pmwid"
+#define WORLDGUARD_CPU_PROP_PMWIDLIST	"riscv,pmwidlist"
+#define WORLDGUARD_CPU_PROP_PMLWIDLIST	"riscv,pmlwidlist"
+#define WORLDGUARD_MAX_WIDS		64
+
+struct wg_cpu_defaults {
+	u32 pmwid;
+	u64 pmwidlist_mask;
+	u64 pmlwidlist_mask;
+};
+
+struct worldguard_domain_state {
+	bool has_wid;
+	u32 wid;
+	u64 widlist_mask;
+};
+
+int worldguard_setup(const void *fdt);
+bool worldguard_is_enabled(void);
+
+#endif
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index ca7fb8b7..0e400809 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -20,6 +20,9 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 # Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.carray.o
+platform-objs-y += worldguard.o
+platform-objs-y += wgchecker.o
+platform-objs-y += virt/qemu_virt_worldguard.o
 
 # Blobs to build
 FW_DYNAMIC=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..ed56ab0b 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -11,6 +11,8 @@
 #include <platform_override.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_platform.h>
@@ -29,6 +31,7 @@
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/serial/semihosting.h>
 #include <sbi_utils/timer/fdt_timer.h>
+#include <qemu_virt_worldguard.h>
 
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
@@ -267,9 +270,19 @@ int generic_domains_init(void)
 	const void *fdt = fdt_get_address();
 	int offset, ret;
 
+	ret = qemu_virt_worldguard_setup(fdt);
+	if (ret < 0) {
+		sbi_printf("%s: qemu_virt_worldguard_setup failed (error %d)\n",
+			   __func__, ret);
+		return ret;
+	}
+
 	ret = fdt_domains_populate(fdt);
-	if (ret < 0)
+	if (ret < 0) {
+		sbi_printf("%s: fdt_domains_populate failed (error %d)\n",
+			   __func__, ret);
 		return ret;
+	}
 
 	offset = fdt_path_offset(fdt, "/chosen");
 
diff --git a/platform/generic/virt/qemu_virt_worldguard.c b/platform/generic/virt/qemu_virt_worldguard.c
new file mode 100644
index 00000000..f376d5a2
--- /dev/null
+++ b/platform/generic/virt/qemu_virt_worldguard.c
@@ -0,0 +1,25 @@
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
+#include <qemu_virt_worldguard.h>
+#include <sbi/sbi_error.h>
+#include <worldguard.h>
+
+int qemu_virt_worldguard_setup(const void *fdt)
+{
+	if (!fdt)
+		return 0;
+
+	if (fdt_node_check_compatible(fdt, 0, "riscv-virtio") &&
+	    fdt_node_check_compatible(fdt, 0, "qemu,virt"))
+		return 0;
+
+	return worldguard_setup(fdt);
+}
diff --git a/platform/generic/wgchecker.c b/platform/generic/wgchecker.c
new file mode 100644
index 00000000..b9a48c55
--- /dev/null
+++ b/platform/generic/wgchecker.c
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * wgchecker model support
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_string.h>
+#include <wgchecker.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct wgchecker_checker {
+	char name[32];
+	u64 mmio_base;
+	u64 mmio_size;
+	u32 slot_count;
+	u32 range_count;
+	struct wgchecker_range *ranges;
+};
+
+struct wgchecker_platform_ctx {
+	u32 checker_count;
+	struct wgchecker_checker *checkers;
+};
+
+static struct wgchecker_platform_ctx *wgchecker_platform;
+
+static void wgchecker_free_platform_ctx(struct wgchecker_platform_ctx *platform)
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
+static void wgchecker_write64(u64 addr, u64 val)
+{
+#if __riscv_xlen != 32
+	writeq(val, (void *)(unsigned long)addr);
+#else
+	writel((u32)val, (void *)(unsigned long)addr);
+	writel((u32)(val >> 32), (void *)(unsigned long)(addr + 4));
+#endif
+}
+
+static void wgchecker_write32(u64 addr, u32 val)
+{
+	writel(val, (void *)(unsigned long)addr);
+}
+
+static u32 wgchecker_encode_slot_cfg(u32 policy, u32 a_field)
+{
+	u32 cfg = a_field & WGCHECKER_SLOT_CFG_A_MASK;
+
+	if (policy & WGCHECKER_CONFIG_ER)
+		cfg |= WGCHECKER_SLOT_CFG_ER;
+	if (policy & WGCHECKER_CONFIG_EW)
+		cfg |= WGCHECKER_SLOT_CFG_EW;
+	if (policy & WGCHECKER_CONFIG_IR)
+		cfg |= WGCHECKER_SLOT_CFG_IR;
+	if (policy & WGCHECKER_CONFIG_IW)
+		cfg |= WGCHECKER_SLOT_CFG_IW;
+	if (policy & WGCHECKER_CONFIG_L)
+		cfg |= WGCHECKER_SLOT_CFG_LOCK;
+
+	return cfg;
+}
+
+static u64 wgchecker_slot_addr_encode(u64 addr)
+{
+	return addr >> 2;
+}
+
+static bool wgchecker_range_is_aligned(u64 base, u64 size)
+{
+	if (!size)
+		return false;
+
+	if (base & (WGCHECKER_MIN_ALIGN - 1))
+		return false;
+	if (size & (WGCHECKER_MIN_ALIGN - 1))
+		return false;
+
+	return true;
+}
+
+static void wgchecker_sort_ranges(struct wgchecker_checker *checker)
+{
+	struct wgchecker_range tmp;
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
+static int wgchecker_compact_ranges(struct wgchecker_checker *checker)
+{
+	struct wgchecker_range *prev, *cur;
+	u64 prev_end, cur_end;
+	u32 i, out = 0;
+
+	if (!checker->range_count)
+		return 0;
+
+	wgchecker_sort_ranges(checker);
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
+		if (cur->base == prev_end && cur->perm == prev->perm &&
+		    cur->cfg == prev->cfg) {
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
+static bool
+wgchecker_access_rule_is_full_checker(const struct wgchecker_checker *checker)
+{
+	return checker->slot_count == 1 && checker->range_count == 1;
+}
+
+static int wgchecker_get_slot_count(const struct wgchecker_checker *checker)
+{
+	return readl((void *)(unsigned long)(checker->mmio_base +
+					     WGCHECKER_MMIO_NSLOTS));
+}
+
+static bool wgchecker_node_is_compatible(const void *fdt, int nodeoff)
+{
+	return !fdt_node_check_compatible(fdt, nodeoff, WGCHECKER_COMPAT) ||
+	       !fdt_node_check_compatible(fdt, nodeoff, WGCHECKER_QEMU_COMPAT);
+}
+
+static bool wgchecker_is_partition_node(const void *fdt, int nodeoff)
+{
+	const char *name = fdt_get_name(fdt, nodeoff, NULL);
+
+	return name && !sbi_strncmp(name, "partition@", 10);
+}
+
+static int wgchecker_parse_partition_region(const void *fdt, int nodeoff,
+					     u64 *base, u64 *size)
+{
+	const fdt32_t *prop;
+	int len;
+
+	if (!base || !size)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, nodeoff, WGCHECKER_PROP_WG_REGION, &len);
+	if (!prop)
+		return SBI_ENOENT;
+	if (len != (int)(4 * sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	*base = ((u64)fdt32_to_cpu(prop[0]) << 32) | fdt32_to_cpu(prop[1]);
+	*size = ((u64)fdt32_to_cpu(prop[2]) << 32) | fdt32_to_cpu(prop[3]);
+	return 0;
+}
+
+static int wgchecker_parse_partition(const void *fdt, int checker_node,
+				      int part_node,
+				      struct wgchecker_range *range)
+{
+	u32 part_id, cfg;
+	u64 perm;
+	int rc;
+
+	rc = fdt_parse_u32(fdt, part_node, "reg", &part_id);
+	if (rc)
+		return rc;
+	if (part_id == WGCHECKER_PARTITION_UNPROTECTED_ID) {
+		sbi_printf("[WG] checker %s uses reserved partition id 0x%x\n",
+			   fdt_get_name(fdt, checker_node, NULL), part_id);
+		return SBI_EINVAL;
+	}
+
+	rc = wgchecker_parse_partition_region(fdt, part_node, &range->base,
+						 &range->size);
+	if (rc)
+		return rc;
+
+	rc = fdt_parse_u64(fdt, part_node, WGCHECKER_PROP_SLOT_PERMISSIONS,
+			   &perm);
+	if (rc)
+		return rc;
+	range->perm = perm;
+
+	rc = fdt_parse_u32(fdt, part_node, WGCHECKER_PROP_SLOT_CONFIG, &cfg);
+	if (rc)
+		return rc;
+	if (cfg & ~WGCHECKER_CONFIG_MASK) {
+		sbi_printf("[WG] checker %s invalid config=0x%x\n",
+			   fdt_get_name(fdt, checker_node, NULL), cfg);
+		return SBI_EINVAL;
+	}
+	range->cfg = cfg;
+
+	if (!wgchecker_range_is_aligned(range->base, range->size)) {
+		sbi_printf("[WG] checker %s unaligned base=0x%llx size=0x%llx\n",
+			   fdt_get_name(fdt, checker_node, NULL),
+			   (unsigned long long)range->base,
+			   (unsigned long long)range->size);
+		return SBI_EINVAL;
+	}
+
+	return 0;
+}
+
+static int wgchecker_validate_cell_property(const void *fdt, int nodeoff,
+					    const char *property, u32 expected)
+{
+	const fdt32_t *val;
+	int len;
+
+	val = fdt_getprop(fdt, nodeoff, property, &len);
+	if (!val || len != (int)sizeof(*val)) {
+		sbi_printf("[WG] checker %s missing or malformed %s\n",
+			   fdt_get_name(fdt, nodeoff, NULL), property);
+		return SBI_EINVAL;
+	}
+
+	if (fdt32_to_cpu(val[0]) != expected) {
+		sbi_printf("[WG] checker %s invalid %s=%u\n",
+			   fdt_get_name(fdt, nodeoff, NULL), property,
+			   fdt32_to_cpu(val[0]));
+		return SBI_EINVAL;
+	}
+
+	return 0;
+}
+
+static int wgchecker_parse_checker(void *fdt, int checker_node,
+				    struct wgchecker_checker *checker)
+{
+	u64 base = 0, size = 0;
+	u32 nranges = 0;
+	int part_node, rc;
+
+	rc = wgchecker_validate_cell_property(fdt, checker_node,
+					     "#address-cells",
+					     WGCHECKER_ADDRESS_CELLS);
+	if (rc)
+		return rc;
+
+	rc = wgchecker_validate_cell_property(fdt, checker_node,
+					     "#size-cells",
+					     WGCHECKER_SIZE_CELLS);
+	if (rc)
+		return rc;
+
+	rc = wgchecker_validate_cell_property(fdt, checker_node,
+					     "#access-controller-cells",
+					     WGCHECKER_ACCESS_CONTROLLER_CELLS);
+	if (rc)
+		return rc;
+
+	rc = fdt_get_node_addr_size(fdt, checker_node, 0, &base, &size);
+	if (rc)
+		return rc;
+
+	checker->mmio_base = base;
+	checker->mmio_size = size;
+	checker->slot_count = wgchecker_get_slot_count(checker);
+	if (!checker->slot_count) {
+		sbi_printf("[WG] checker %s reported zero slots\n",
+			   fdt_get_name(fdt, checker_node, NULL));
+		return SBI_EINVAL;
+	}
+	sbi_snprintf(checker->name, sizeof(checker->name), "%s",
+		     fdt_get_name(fdt, checker_node, NULL));
+
+	fdt_for_each_subnode(part_node, fdt, checker_node) {
+		if (!fdt_node_is_enabled(fdt, part_node) ||
+		    !wgchecker_is_partition_node(fdt, part_node))
+			continue;
+		nranges++;
+	}
+
+	if (!nranges)
+		return 0;
+
+	checker->ranges = sbi_calloc(sizeof(*checker->ranges), nranges);
+	if (!checker->ranges)
+		return SBI_ENOMEM;
+
+	checker->range_count = 0;
+	fdt_for_each_subnode(part_node, fdt, checker_node) {
+		if (!fdt_node_is_enabled(fdt, part_node) ||
+		    !wgchecker_is_partition_node(fdt, part_node))
+			continue;
+		rc = wgchecker_parse_partition(fdt, checker_node, part_node,
+						&checker->ranges[checker->range_count]);
+		if (rc)
+			return rc;
+		checker->range_count++;
+	}
+
+	return wgchecker_compact_ranges(checker);
+}
+
+static void wgchecker_program_clear_slots(const struct wgchecker_checker *checker)
+{
+	u32 slot;
+
+	for (slot = 1; slot < checker->slot_count; slot++) {
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_ADDR, 0);
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_PERM, 0);
+		wgchecker_write32(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_CFG, 0);
+	}
+}
+
+static void wgchecker_program_clear_slots_from(const struct wgchecker_checker *checker,
+						u32 first_slot)
+{
+	u32 slot;
+
+	if (first_slot >= checker->slot_count)
+		return;
+
+	for (slot = first_slot; slot < checker->slot_count; slot++) {
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_ADDR, 0);
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_PERM, 0);
+		wgchecker_write32(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_CFG, 0);
+	}
+}
+
+static int wgchecker_program_checker(const struct wgchecker_checker *checker)
+{
+	u64 prev_end = 0;
+	u32 required_slots = 0, slot = 1, i;
+
+	wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_ERRCAUSE, 0);
+	wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_ERRADDR, 0);
+
+	if (wgchecker_access_rule_is_full_checker(checker)) {
+		wgchecker_program_clear_slots(checker);
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_PERM,
+				   checker->ranges[0].perm);
+		wgchecker_write32(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_CFG,
+				   wgchecker_encode_slot_cfg(checker->ranges[0].cfg,
+							      WGCHECKER_SLOT_CFG_A_TOR));
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
+		const struct wgchecker_range *range = &checker->ranges[i];
+		u64 end = range->base + range->size;
+
+		if (!i || range->base != prev_end) {
+			wgchecker_write64(checker->mmio_base +
+					   WGCHECKER_MMIO_SLOT_BASE +
+					   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+					   WGCHECKER_MMIO_SLOT_ADDR,
+					   wgchecker_slot_addr_encode(range->base));
+			wgchecker_write64(checker->mmio_base +
+					   WGCHECKER_MMIO_SLOT_BASE +
+					   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+					   WGCHECKER_MMIO_SLOT_PERM, 0);
+			wgchecker_write32(checker->mmio_base +
+					   WGCHECKER_MMIO_SLOT_BASE +
+					   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+					   WGCHECKER_MMIO_SLOT_CFG,
+					   WGCHECKER_SLOT_CFG_A_OFF);
+			slot++;
+		}
+
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_ADDR,
+				   wgchecker_slot_addr_encode(end));
+		wgchecker_write64(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_PERM, range->perm);
+		wgchecker_write32(checker->mmio_base + WGCHECKER_MMIO_SLOT_BASE +
+				   slot * WGCHECKER_MMIO_SLOT_STRIDE +
+				   WGCHECKER_MMIO_SLOT_CFG,
+				   wgchecker_encode_slot_cfg(range->cfg,
+							      WGCHECKER_SLOT_CFG_A_TOR));
+		prev_end = end;
+		slot++;
+	}
+
+	/*
+	 * Keep the reset-time trusted-WID bypass slot alive until the new
+	 * rule set is fully programmed, otherwise the DRAM checker can deny
+	 * OpenSBI's own RAM accesses mid-update.
+	 */
+	wgchecker_program_clear_slots_from(checker, slot);
+
+	return 0;
+}
+
+u32 wgchecker_count_platform_checkers(void *fdt)
+{
+	int checker_node;
+	u32 count = 0;
+
+	if (!fdt)
+		return 0;
+
+	for (checker_node = 0; checker_node >= 0;
+	     checker_node = fdt_next_node(fdt, checker_node, NULL)) {
+		if (!wgchecker_node_is_compatible(fdt, checker_node) ||
+		    !fdt_node_is_enabled(fdt, checker_node))
+			continue;
+		if (fdt_getprop(fdt, checker_node, "#access-controller-cells", NULL))
+			count++;
+	}
+
+	return count;
+}
+
+int wgchecker_init(void *fdt)
+{
+	struct wgchecker_platform_ctx *platform;
+	int checker_node, rc;
+	u32 count, idx = 0;
+
+	wgchecker_cleanup();
+
+	if (!fdt)
+		return 0;
+
+	count = wgchecker_count_platform_checkers(fdt);
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
+	for (checker_node = 0; checker_node >= 0;
+	     checker_node = fdt_next_node(fdt, checker_node, NULL)) {
+		if (!wgchecker_node_is_compatible(fdt, checker_node) ||
+		    !fdt_node_is_enabled(fdt, checker_node))
+			continue;
+		if (!fdt_getprop(fdt, checker_node, "#access-controller-cells", NULL))
+			continue;
+
+		rc = wgchecker_parse_checker(fdt, checker_node,
+					      &platform->checkers[idx]);
+		if (rc) {
+			wgchecker_free_platform_ctx(platform);
+			return rc;
+		}
+
+		rc = wgchecker_program_checker(&platform->checkers[idx]);
+		if (rc) {
+			wgchecker_free_platform_ctx(platform);
+			return rc;
+		}
+		idx++;
+	}
+
+	wgchecker_platform = platform;
+	return 0;
+}
+
+void wgchecker_cleanup(void)
+{
+	if (!wgchecker_platform)
+		return;
+
+	wgchecker_free_platform_ctx(wgchecker_platform);
+	wgchecker_platform = NULL;
+}
+
+u32 wgchecker_checker_count(void)
+{
+	return wgchecker_platform ? wgchecker_platform->checker_count : 0;
+}
diff --git a/platform/generic/worldguard.c b/platform/generic/worldguard.c
new file mode 100644
index 00000000..1c436273
--- /dev/null
+++ b/platform/generic/worldguard.c
@@ -0,0 +1,544 @@
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
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_domain_data.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_domain.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <wgchecker.h>
+#include <worldguard.h>
+
+struct worldguard_platform_ctx {
+	u32 hart_count;
+	bool runtime_enabled;
+	struct wg_cpu_defaults *hart_defaults;
+};
+
+static struct worldguard_platform_ctx *worldguard_platform;
+static bool worldguard_hprot_registered;
+static bool worldguard_domain_data_registered;
+
+static int worldguard_domain_data_setup(struct sbi_domain *dom,
+					struct sbi_domain_data *data,
+					void *data_ptr);
+static void worldguard_domain_data_cleanup(struct sbi_domain *dom,
+					   struct sbi_domain_data *data,
+					   void *data_ptr);
+
+static struct sbi_domain_data worldguard_domain_data;
+
+static u64 worldguard_wid_mask(u32 wid)
+{
+	return (wid < WORLDGUARD_MAX_WIDS) ? (1ULL << wid) : 0;
+}
+
+static int worldguard_parse_wid_bitmap_u64(const void *fdt, int nodeoff,
+					   const char *prop_name,
+					   u32 max_bits, u64 *out_mask)
+{
+	u64 mask64;
+	int rc;
+
+	if (!out_mask || !max_bits || max_bits > WORLDGUARD_MAX_WIDS)
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+	rc = fdt_parse_u64(fdt, nodeoff, prop_name, &mask64);
+	if (rc)
+		return rc;
+	if (max_bits < WORLDGUARD_MAX_WIDS && (mask64 >> max_bits))
+		return SBI_EINVAL;
+
+	*out_mask = mask64;
+	return 0;
+}
+
+static int worldguard_parse_wid_u32_or_u64(const void *fdt, int nodeoff,
+					   const char *prop_name, u32 max_wid,
+					   u32 *out_wid)
+{
+	const fdt32_t *prop;
+	u64 wid64;
+	int len;
+
+	if (!out_wid)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, nodeoff, prop_name, &len);
+	if (!prop)
+		return SBI_ENOENT;
+	if (len == (int)sizeof(fdt32_t))
+		wid64 = fdt32_to_cpu(prop[0]);
+	else if (len == (int)(2 * sizeof(fdt32_t)))
+		wid64 = ((u64)fdt32_to_cpu(prop[0]) << 32) |
+			fdt32_to_cpu(prop[1]);
+	else
+		return SBI_EINVAL;
+	if (wid64 >= max_wid)
+		return SBI_EINVAL;
+
+	*out_wid = (u32)wid64;
+	return 0;
+}
+
+static int worldguard_parse_wid_list(const void *fdt, int nodeoff,
+					     const char *prop_name, u64 *out_mask)
+{
+	const fdt32_t *prop;
+	u32 i, wid;
+	int len;
+
+	if (!out_mask)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, nodeoff, prop_name, &len);
+	if (!prop || !len || len % sizeof(*prop))
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+	for (i = 0; i < len / sizeof(*prop); i++) {
+		wid = fdt32_to_cpu(prop[i]);
+		if (wid >= WORLDGUARD_MAX_WIDS)
+			return SBI_EINVAL;
+		*out_mask |= worldguard_wid_mask(wid);
+	}
+
+	return 0;
+}
+
+static bool worldguard_runtime_enabled(void)
+{
+	return worldguard_platform && worldguard_platform->runtime_enabled;
+}
+
+static void worldguard_free_platform(struct worldguard_platform_ctx *platform)
+{
+	if (!platform)
+		return;
+
+	sbi_free(platform->hart_defaults);
+	sbi_free(platform);
+}
+
+static int worldguard_parse_cpu_defaults(const void *fdt,
+					 struct worldguard_platform_ctx *platform)
+{
+	struct wg_cpu_defaults *cpu_defaults;
+	u32 hartid, hartindex;
+	int cpus_offset, cpu_offset, rc;
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
+		cpu_defaults = &platform->hart_defaults[hartindex];
+		rc = worldguard_parse_wid_u32_or_u64(fdt, cpu_offset,
+						     WORLDGUARD_CPU_PROP_PMWID,
+						     WORLDGUARD_MAX_WIDS,
+						     &cpu_defaults->pmwid);
+		if (rc && rc != SBI_ENOENT)
+			return rc;
+
+		rc = worldguard_parse_wid_bitmap_u64(fdt, cpu_offset,
+					     WORLDGUARD_CPU_PROP_PMWIDLIST,
+					     WORLDGUARD_MAX_WIDS,
+					     &cpu_defaults->pmwidlist_mask);
+		if (rc && rc != SBI_ENOENT)
+			return rc;
+
+		rc = worldguard_parse_wid_bitmap_u64(fdt, cpu_offset,
+					     WORLDGUARD_CPU_PROP_PMLWIDLIST,
+					     WORLDGUARD_MAX_WIDS,
+					     &cpu_defaults->pmlwidlist_mask);
+		if (rc && rc != SBI_ENOENT)
+			return rc;
+
+		cpu_defaults->pmwidlist_mask |=
+			worldguard_wid_mask(cpu_defaults->pmwid);
+	}
+
+	return 0;
+}
+
+static bool worldguard_has_cpu_runtime(const void *fdt)
+{
+	u32 hartid;
+	int cpus_offset, cpu_offset;
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
+		if (fdt_getprop(fdt, cpu_offset, WORLDGUARD_CPU_PROP_PMWID, NULL) ||
+		    fdt_getprop(fdt, cpu_offset, WORLDGUARD_CPU_PROP_PMWIDLIST,
+				NULL) ||
+		    fdt_getprop(fdt, cpu_offset, WORLDGUARD_CPU_PROP_PMLWIDLIST,
+				NULL))
+			return true;
+	}
+
+	return false;
+}
+
+static int worldguard_validate_domain_state(const struct sbi_domain *dom,
+					    const struct worldguard_domain_state *state)
+{
+	const struct wg_cpu_defaults *cpu_defaults;
+	u32 hartindex;
+
+	if (!worldguard_platform || !dom || !state || dom == &root ||
+	    !dom->possible_harts)
+		return 0;
+
+	for (hartindex = 0; hartindex < worldguard_platform->hart_count;
+	     hartindex++) {
+		if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
+			continue;
+
+		cpu_defaults = &worldguard_platform->hart_defaults[hartindex];
+		if (!(cpu_defaults->pmwidlist_mask &
+		      worldguard_wid_mask(state->wid)))
+			return SBI_EINVAL;
+		if (state->widlist_mask & ~cpu_defaults->pmlwidlist_mask)
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
+	return cpu_defaults ? cpu_defaults->pmwid : 0;
+}
+
+static u64 worldguard_valid_pmwid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->pmwidlist_mask :
+			      worldguard_wid_mask(worldguard_fallback_wid());
+}
+
+static u64 worldguard_valid_pmlwid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->pmlwidlist_mask :
+			      worldguard_wid_mask(worldguard_fallback_wid());
+}
+
+static u32 worldguard_select_slwid(u64 widlist_mask, bool has_wid, u32 wid,
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
+	for (i = 0; i < WORLDGUARD_MAX_WIDS; i++) {
+		if (widlist_mask & (1ULL << i))
+			return i;
+	}
+
+	return fallback;
+}
+
+static void worldguard_program_wid_state(u32 mlwid, u64 mlwidlist,
+					 u64 mwiddeleg, u32 slwid)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return;
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST))
+		csr_write(CSR_MLWIDLIST, mlwidlist);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG) ||
+	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWID)) {
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
+static int worldguard_parse_domain_state(const void *fdt,
+					 const struct sbi_domain *dom,
+					 struct worldguard_domain_state *state)
+{
+	int domain_offset, hoff, child, rc;
+	bool found = false;
+
+	sbi_memset(state, 0, sizeof(*state));
+	if (!worldguard_runtime_enabled())
+		return 0;
+	if (!fdt || !dom || dom == &root)
+		return 0;
+
+	domain_offset = fdt_find_domain_offset(fdt, dom);
+	if (domain_offset < 0)
+		return (domain_offset == SBI_ENOENT) ? SBI_EINVAL : domain_offset;
+
+	hoff = fdt_subnode_offset(fdt, domain_offset, "hw-isolation");
+	if (hoff < 0)
+		return 0;
+
+	fdt_for_each_subnode(child, fdt, hoff) {
+		if (fdt_node_check_compatible(fdt, child, WGCHECKER_COMPAT))
+			continue;
+		found = true;
+		break;
+	}
+
+	if (!found)
+		return 0;
+
+	rc = fdt_parse_u32(fdt, child, WORLDGUARD_PROP_WID, &state->wid);
+	if (rc)
+		return rc;
+	if (state->wid >= WORLDGUARD_MAX_WIDS)
+		return SBI_EINVAL;
+	state->has_wid = true;
+
+	rc = worldguard_parse_wid_list(fdt, child, WORLDGUARD_PROP_WIDLIST,
+					 &state->widlist_mask);
+	if (rc)
+		return rc;
+
+	return worldguard_validate_domain_state(dom, state);
+}
+
+static int worldguard_domain_data_setup(struct sbi_domain *dom,
+					struct sbi_domain_data *data,
+					void *data_ptr)
+{
+	(void)data;
+
+	return worldguard_parse_domain_state(fdt_get_address(), dom, data_ptr);
+}
+
+static void worldguard_domain_data_cleanup(struct sbi_domain *dom,
+					   struct sbi_domain_data *data,
+					   void *data_ptr)
+{
+	(void)dom;
+	(void)data;
+	(void)data_ptr;
+}
+
+static int worldguard_hprot_configure(struct sbi_scratch *scratch,
+				      struct sbi_domain *dom)
+{
+	struct worldguard_domain_state *state = NULL;
+	u64 valid_pmwid_mask = worldguard_valid_pmwid_mask();
+	u64 valid_pmlwid_mask = worldguard_valid_pmlwid_mask();
+	u32 mlwid = worldguard_fallback_wid();
+	u64 mlwidlist = valid_pmwid_mask;
+	u64 mwiddeleg = 0;
+	u32 slwid = mlwid;
+
+	(void)scratch;
+	if (!worldguard_runtime_enabled())
+		return 0;
+
+	state = sbi_domain_data_ptr(dom, &worldguard_domain_data);
+	if (state && state->has_wid &&
+	    (worldguard_wid_mask(state->wid) & valid_pmwid_mask))
+		mlwid = state->wid;
+	if (state && state->has_wid)
+		mwiddeleg = state->widlist_mask & valid_pmlwid_mask;
+
+	slwid = worldguard_select_slwid(mwiddeleg, state && state->has_wid,
+					state ? state->wid : 0, mlwid);
+	worldguard_program_wid_state(mlwid, mlwidlist, mwiddeleg, slwid);
+	return 0;
+}
+
+static void worldguard_hprot_unconfigure(struct sbi_scratch *scratch,
+					 struct sbi_domain *dom)
+{
+	(void)scratch;
+	(void)dom;
+
+	if (!worldguard_runtime_enabled())
+		return;
+
+	worldguard_program_wid_state(worldguard_fallback_wid(),
+				     worldguard_valid_pmwid_mask(), 0,
+				     worldguard_fallback_wid());
+}
+
+static struct sbi_hart_protection worldguard_hprot = {
+	.name = "wgid",
+	.type = SBI_HART_PROTECTION_TYPE_ID,
+	.rating = 1,
+	.configure = worldguard_hprot_configure,
+	.unconfigure = worldguard_hprot_unconfigure,
+};
+
+int worldguard_setup(const void *fdt)
+{
+	struct worldguard_platform_ctx *platform = NULL;
+	u32 checker_count;
+	bool has_runtime, data_registered_now = false;
+	bool hprot_registered_now = false;
+	int rc;
+
+	if (worldguard_platform)
+		return 0;
+	if (!fdt)
+		return 0;
+
+	checker_count = wgchecker_count_platform_checkers((void *)fdt);
+	has_runtime = worldguard_has_cpu_runtime(fdt);
+	if (!checker_count && !has_runtime)
+		return 0;
+
+	if (has_runtime && !worldguard_hprot_registered) {
+		rc = sbi_hart_protection_register(&worldguard_hprot);
+		if (rc)
+			return rc;
+		worldguard_hprot_registered = true;
+		hprot_registered_now = true;
+	}
+
+	if (has_runtime && !worldguard_domain_data_registered) {
+		worldguard_domain_data.data_size =
+			sizeof(struct worldguard_domain_state);
+		worldguard_domain_data.data_setup = worldguard_domain_data_setup;
+		worldguard_domain_data.data_cleanup =
+			worldguard_domain_data_cleanup;
+		rc = sbi_domain_register_data(&worldguard_domain_data);
+		if (rc)
+			goto err;
+		worldguard_domain_data_registered = true;
+		data_registered_now = true;
+	}
+
+	platform = sbi_zalloc(sizeof(*platform));
+	if (!platform) {
+		rc = SBI_ENOMEM;
+		goto err;
+	}
+
+	platform->hart_count = sbi_hart_count();
+	platform->runtime_enabled = has_runtime;
+	platform->hart_defaults = sbi_calloc(sizeof(*platform->hart_defaults),
+					     platform->hart_count);
+	if (!platform->hart_defaults) {
+		rc = SBI_ENOMEM;
+		goto err;
+	}
+
+	rc = worldguard_parse_cpu_defaults(fdt, platform);
+	if (rc) {
+		sbi_printf("%s: worldguard_parse_cpu_defaults failed (error %d)\n",
+			   __func__, rc);
+		goto err;
+	}
+
+	worldguard_platform = platform;
+
+	/*
+	 * Program the boot hart into the trusted/root world before
+	 * enabling checker rules that may restrict DRAM access.
+	 */
+	if (has_runtime)
+		worldguard_program_wid_state(worldguard_fallback_wid(),
+					     worldguard_valid_pmwid_mask(), 0,
+					     worldguard_fallback_wid());
+
+	if (checker_count) {
+		rc = wgchecker_init((void *)fdt);
+		if (rc) {
+			sbi_printf("%s: wgchecker_init failed (error %d)\n",
+				   __func__, rc);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	if (worldguard_platform == platform)
+		worldguard_platform = NULL;
+	worldguard_free_platform(platform);
+	wgchecker_cleanup();
+	if (data_registered_now) {
+		sbi_domain_unregister_data(&worldguard_domain_data);
+		worldguard_domain_data_registered = false;
+	}
+	if (hprot_registered_now) {
+		sbi_hart_protection_unregister(&worldguard_hprot);
+		worldguard_hprot_registered = false;
+	}
+	return rc;
+}
+
+bool worldguard_is_enabled(void)
+{
+	return worldguard_runtime_enabled() && wgchecker_checker_count();
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
