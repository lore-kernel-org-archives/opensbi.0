Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB52C53200
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puq0hYtAv+QMC2pQLATeNGL/nsnULFLU7eQev8SxsIk=; b=bKXG/WkqJQ3Ade
	TRLJwpeXtIDIx297iOt/SYq9XtRLlOpNapCYnMfNFynoNXD3yk9e7bSr31vh0pZJXBsZWWxfxUvCR
	CHdfDbWjD0UZ/hgsnLiST7pOT2Lkmujhx/t8PDpKd6iKjbrDkP1w6AbMSL99j7nqbEYzBuqpQphwg
	hZaM9IaApit+GX7Plz6R15fffgJ2z3cOSi7dGExH0lz5J1TcAHDkFY+Q0nOPYIp2xT/Z1gLvH0mXb
	7uP+micPhQNd8pMQVxkVRMFmSRVS+NuSJ3fOJrEDdKoMTrwBl6FhtkuACgjUZZ+MfIPmrAs2W4jCq
	fu26SOFK9xb+aHM7doIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSI7-0000000HUXv-1gew;
	Sat, 25 Jul 2026 02:39:07 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSHo-0000000HUWL-4BT6
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:39:06 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5c0627c302eso358028e0c.2
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947128; x=1785551928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1TsKrRuNx/WgbFmOugJ21+ckXIGC9dCzvTaJS9HASHU=;
        b=XzkM3ggWvbrDEckWu01jL+2b/cRx8dKaTBD0+Lj+YAcJSymovxYc6vv/QPoFHAcAfM
         ANpALNH90+/WWzECGu0Jllu9WLCBmPUPahuCnLJEiSXMf6Q8vVzmdzri0EXqwEBRhk9Q
         posVIDmk+M1hQ379MRryKbxfp3YK/bV1daAmEEMHf4xj1/0PdvK/sNAMSNVeabLZV8rq
         PFHKSoa0GgEVrBaF2xj7xGsNhH7FGKJuBQTB/JXv5OfFDoZ59vyGlko9FUGFRhdEGo12
         TgFwzCFOUydl7IlRNPXGvCm4lR7Ffw5jMk7vlnUAoIJQlD1YCJ+Ck3BM6JDha5+TNZkb
         efFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947128; x=1785551928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1TsKrRuNx/WgbFmOugJ21+ckXIGC9dCzvTaJS9HASHU=;
        b=qhZkDrvfh58fIo6PrktTPZvTT4mlzSoGQxAVIhYUR3Vf7BuSztXC/J983h9KM4gbiw
         NG0K2u91a8T1xWOl3BTKh+G9zLYocBhretNaglEJwbw/DGVQz4CN6qroD2Mk8dtr2fta
         4mflccaUmnO75DTbutnkzJrnpIm6mUojFiUOKYGJbbBDuM/U0A/nKgzZia3oWyEfTj6e
         qVqOs9jIwib9AIPW9+qSvv4xj7ZoFzoajpdjUJysv1yDKHxehG0y+BAyBW/qc3RG42Z5
         Jk5D3btfkzN8x3tNOCHITRgoJzA+ng0Tb3s5Q8Zs9sRz163rNWpnU9jdY15ebhJiyT9p
         ol/Q==
X-Gm-Message-State: AOJu0YzGr4tEGuCM3goLkPD9uVn7wD6yQarM1djR+5ZDx0ySOlQE3z8k
	jSzWqpj4KuaBOPZn8gOZRMLMmFGJQ520RLiw0fzd3NFphKg/6rT6ZPRIhAmwoA==
X-Gm-Gg: AR+sD10Ogqn+8Lm/JPDyCSg12cLatBCGsJFQaW2T9S5xC4dB8OdxvPF3j/XoSwqr4R3
	GJWQf75zjcbzM95xOFgFji3XsDjzDY1lxFcZnMNsHP/LXwZ8ssAEkfr5ssR7BnZ0aiY29j8V03s
	2G/JsgZNbrJgHwbvk1jyztiObuzdzvbDbwggelf2dZ7L8m9mHy/HGytEYrLDpQFeLVavvLDVveW
	e7uvvZgpbS4EThaDt2aGAdbyJpo6GZ6jPdOea/3zEtYMPOta0XzcEV70qJNyG7TU+xOAwPy5pvh
	S9kkW8n67tnTJI4OwoB2cLCl9OTnW6N53hu7okcbkAf5Ylqj7TElch3X5wsSGbBx35ho4IiD7OC
	S3ujb0XwX4vn3Y+2vXF0jJVaUu1rJ68kgG0FILEOyYJUZ859WzZiRz2MwAuvXrNIFRIGJSXVRtJ
	84vyIwo1T9w00PB2MQSwkN7O1B9fo0FFwbyPf7REZ3DirTPetcizyJIyKo8QFqgmAP8525JQ==
X-Received: by 2002:a05:6122:2189:b0:5bf:9bd1:791 with SMTP id 71dfb90a1353d-5c306bb6318mr485791e0c.1.1784947127436;
        Fri, 24 Jul 2026 19:38:47 -0700 (PDT)
Received: from ubuntu.localdomain (23-91-246-209.cpe.distributel.net. [23.91.246.209])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305734410sm602529e0c.16.2026.07.24.19.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:38:46 -0700 (PDT)
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
Subject: [PATCH v2 4/4] platform: generic: add WorldGuard support with wgchecker2
Date: Fri, 24 Jul 2026 22:38:21 -0400
Message-Id: <20260725023821.3795618-5-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260725023821.3795618-1-raymondmaoca@gmail.com>
References: <20260725023821.3795618-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_193849_196003_A9531564 
X-CRM114-Status: GOOD (  25.10  )
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

Implement boot-time parsing of sifive,wgchecker2 checker instances and
resource access-controller entries from the FDT, then program checker
MMIO state according to the described protected ranges, permissions,
and slot configuration.

Add WorldGuard runtime support to parse per-hart CPU defaults from
/cpus and per-domain WorldGuard metadata under domain hw-isolation
nodes, and use that state to reprogram MLWID, MWIDDELEG, and SLWID
during domain transitions.

Keep the QEMU virt platform code as the integration layer that invokes
WorldGuard setup for the virt platform.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 .../generic/include/qemu_virt_worldguard.h    |  13 +
 platform/generic/include/wgchecker2.h         |  78 +++
 platform/generic/include/worldguard.h         |  44 ++
 platform/generic/objects.mk                   |   3 +
 platform/generic/platform.c                   |  15 +-
 platform/generic/virt/qemu_virt_worldguard.c  |  25 +
 platform/generic/wgchecker2.c                 | 500 ++++++++++++++++
 platform/generic/worldguard.c                 | 553 ++++++++++++++++++
 8 files changed, 1230 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/include/qemu_virt_worldguard.h
 create mode 100644 platform/generic/include/wgchecker2.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker2.c
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
diff --git a/platform/generic/include/wgchecker2.h b/platform/generic/include/wgchecker2.h
new file mode 100644
index 00000000..7ff9d651
--- /dev/null
+++ b/platform/generic/include/wgchecker2.h
@@ -0,0 +1,78 @@
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
+#define WGCHECKER2_PROP_ACCESS_CONTROLLERS	"access-controllers"
+#define WGCHECKER2_ACCESS_CONTROLLER_CELLS	7
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
+/*
+ * RFC access-controller config bits. These are the DT-visible policy bits
+ * carried by the final "config" cell in each access-controllers specifier.
+ */
+#define WGCHECKER2_CONFIG_ER			0x01U
+#define WGCHECKER2_CONFIG_EW			0x02U
+#define WGCHECKER2_CONFIG_IR			0x04U
+#define WGCHECKER2_CONFIG_IW			0x08U
+#define WGCHECKER2_CONFIG_L			0x10U
+
+#define WGCHECKER2_CONFIG_ERR_RW		\
+	(WGCHECKER2_CONFIG_ER | WGCHECKER2_CONFIG_EW)
+#define WGCHECKER2_CONFIG_ERR_IRQ_RW		\
+	(WGCHECKER2_CONFIG_ERR_RW | WGCHECKER2_CONFIG_IR | \
+	 WGCHECKER2_CONFIG_IW)
+
+/* RFC permission bitmap helpers: two bits per WID, read then write. */
+#define WGCHECKER2_PERM_R(_wid)		(1ULL << (2U * (_wid)))
+#define WGCHECKER2_PERM_W(_wid)		(1ULL << (2U * (_wid) + 1U))
+
+static inline u64 wgchecker2_perm_rw(u32 wid)
+{
+	return WGCHECKER2_PERM_R(wid) | WGCHECKER2_PERM_W(wid);
+}
+
+/* Current wgchecker2 MMIO slot cfg.A[1:0] encoding. */
+#define WGCHECKER2_SLOT_CFG_A_MASK		0x3
+#define WGCHECKER2_SLOT_CFG_A_OFF		0x0
+#define WGCHECKER2_SLOT_CFG_A_TOR		0x1
+
+struct wgchecker2_range {
+	u64 base;
+	u64 size;
+	u64 perm;
+	u32 cfg;
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
index 00000000..6f59b5d9
--- /dev/null
+++ b/platform/generic/include/worldguard.h
@@ -0,0 +1,44 @@
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
+#define WORLDGUARD_CPUS_PROP_NWORLDS	"riscv,nworlds"
+#define WORLDGUARD_CPUS_PROP_TRUSTEDWID	"sifive,trustedwid"
+
+#define WORLDGUARD_PROP_WID		"worldguard,wid"
+#define WORLDGUARD_PROP_WIDLIST		"worldguard,widlist"
+#define WORLDGUARD_CPU_PROP_PMWID	"riscv,pmwid"
+#define WORLDGUARD_CPU_PROP_PMWIDLIST	"riscv,pmwidlist"
+#define WORLDGUARD_CPU_PROP_PMLWIDLIST	"riscv,pmlwidlist"
+
+struct wg_cpu_defaults {
+	u32 pmwid;
+	u32 pmwidlist_mask;
+	u32 pmlwidlist_mask;
+};
+
+struct worldguard_domain_state {
+	bool has_wid;
+	u32 wid;
+	u32 widlist_mask;
+};
+
+int worldguard_setup(const void *fdt);
+
+#ifdef CONFIG_SBIUNIT
+int worldguard_test_check_runtime_state(bool runtime_enabled);
+int worldguard_test_check_domain_state(const struct sbi_domain *dom,
+				       bool expect_state, u32 wid,
+				       u32 widlist_mask);
+#endif
+
+#endif
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index ca7fb8b7..9df03e87 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -20,6 +20,9 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 # Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.carray.o
+platform-objs-y += worldguard.o
+platform-objs-y += wgchecker2.o
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
diff --git a/platform/generic/wgchecker2.c b/platform/generic/wgchecker2.c
new file mode 100644
index 00000000..a5081eef
--- /dev/null
+++ b/platform/generic/wgchecker2.c
@@ -0,0 +1,500 @@
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
+#include <sbi/sbi_console.h>
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
+static u64 wgchecker2_read_u32_args(const u32 *cells, int count)
+{
+	u64 val = 0;
+	int i;
+
+	for (i = 0; i < count; i++)
+		val = (val << 32) | cells[i];
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
+wgchecker2_access_rule_is_full_checker(const struct wgchecker2_checker *checker)
+{
+	return checker->slot_count == 1 && checker->range_count == 1;
+}
+
+static int wgchecker2_get_slot_count(const struct wgchecker2_checker *checker)
+{
+	return readl((void *)(unsigned long)(checker->mmio_base +
+					     WGCHECKER2_MMIO_NSLOTS));
+}
+
+static int wgchecker2_collect_rule_from_node(const void *fdt, int nodeoff,
+					     int checker_node,
+					     struct wgchecker2_range *range,
+					     u32 *nranges,
+					     u32 max_ranges)
+{
+	struct fdt_phandle_args args;
+	u32 index = 0;
+	int rc;
+
+	if (!fdt || nodeoff < 0 || !nranges)
+		return SBI_EINVAL;
+
+	while (true) {
+		rc = fdt_parse_phandle_with_args(fdt, nodeoff,
+						 WGCHECKER2_PROP_ACCESS_CONTROLLERS,
+						 "#access-controller-cells",
+						 index++, &args);
+		if (rc == SBI_ENOENT)
+			return 0;
+		if (rc) {
+			sbi_printf("[WG] access-controllers parse failed at %s rc=%d\n",
+				   fdt_get_name(fdt, nodeoff, NULL), rc);
+			return rc;
+		}
+		if (args.node_offset != checker_node)
+			continue;
+		if (args.args_count != WGCHECKER2_ACCESS_CONTROLLER_CELLS) {
+			sbi_printf("[WG] checker %s args_count=%d expected=%d\n",
+				   fdt_get_name(fdt, checker_node, NULL),
+				   args.args_count,
+				   WGCHECKER2_ACCESS_CONTROLLER_CELLS);
+			return SBI_EINVAL;
+		}
+		if (!range) {
+			(*nranges)++;
+			continue;
+		}
+		if (*nranges >= max_ranges) {
+			sbi_printf("[WG] checker %s range overflow nranges=%u max=%u\n",
+				   fdt_get_name(fdt, checker_node, NULL),
+				   *nranges, max_ranges);
+			return SBI_EINVAL;
+		}
+
+		range[*nranges].base = wgchecker2_read_u32_args(&args.args[0], 2);
+		range[*nranges].size = wgchecker2_read_u32_args(&args.args[2], 2);
+		range[*nranges].perm = wgchecker2_read_u32_args(&args.args[4], 2);
+		range[*nranges].cfg = args.args[6];
+		if (!wgchecker2_range_is_aligned(range[*nranges].base,
+						 range[*nranges].size)) {
+			sbi_printf("[WG] checker %s unaligned base=0x%llx size=0x%llx\n",
+				   fdt_get_name(fdt, checker_node, NULL),
+				   (unsigned long long)range[*nranges].base,
+				   (unsigned long long)range[*nranges].size);
+			return SBI_EINVAL;
+		}
+		(*nranges)++;
+	}
+}
+
+static int wgchecker2_parse_checker(void *fdt, int checker_node,
+				    struct wgchecker2_checker *checker)
+{
+	u64 base = 0, size = 0;
+	u32 nranges = 0;
+	int nodeoff, depth = 0, rc;
+	const fdt32_t *val;
+	int len;
+
+	val = fdt_getprop(fdt, checker_node, "#access-controller-cells", &len);
+	if (!val || len < (int)sizeof(fdt32_t))
+		return SBI_ENODEV;
+	if (fdt32_to_cpu(val[0]) != WGCHECKER2_ACCESS_CONTROLLER_CELLS) {
+		sbi_printf("[WG] checker %s invalid #access-controller-cells=%u\n",
+			   fdt_get_name(fdt, checker_node, NULL),
+			   fdt32_to_cpu(val[0]));
+		return SBI_EINVAL;
+	}
+
+	rc = fdt_get_node_addr_size(fdt, checker_node, 0, &base, &size);
+	if (rc)
+		return rc;
+
+	checker->mmio_base = base;
+	checker->mmio_size = size;
+	checker->slot_count = wgchecker2_get_slot_count(checker);
+	if (!checker->slot_count) {
+		sbi_printf("[WG] checker %s reported zero slots\n",
+			   fdt_get_name(fdt, checker_node, NULL));
+		return SBI_EINVAL;
+	}
+	sbi_snprintf(checker->name, sizeof(checker->name), "%s",
+		     fdt_get_name(fdt, checker_node, NULL));
+
+	for (nodeoff = 0; nodeoff >= 0;
+	     nodeoff = fdt_next_node(fdt, nodeoff, &depth)) {
+		if (nodeoff == checker_node || !fdt_node_is_enabled(fdt, nodeoff))
+			continue;
+		rc = wgchecker2_collect_rule_from_node(fdt, nodeoff,
+						       checker_node, NULL,
+						       &nranges, 0);
+		if (rc)
+			return rc;
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
+	depth = 0;
+	for (nodeoff = 0; nodeoff >= 0;
+	     nodeoff = fdt_next_node(fdt, nodeoff, &depth)) {
+		if (nodeoff == checker_node || !fdt_node_is_enabled(fdt, nodeoff))
+			continue;
+		rc = wgchecker2_collect_rule_from_node(fdt, nodeoff,
+						       checker_node,
+						       checker->ranges,
+						       &checker->range_count,
+						       nranges);
+		if (rc)
+			return rc;
+	}
+
+	return wgchecker2_compact_ranges(checker);
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
+	if (wgchecker2_access_rule_is_full_checker(checker)) {
+		wgchecker2_program_clear_slots(checker);
+		wgchecker2_write64(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_PERM,
+				   checker->ranges[0].perm);
+		wgchecker2_write32(checker->mmio_base + WGCHECKER2_MMIO_SLOT_BASE +
+				   checker->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+				   WGCHECKER2_MMIO_SLOT_CFG,
+				   checker->ranges[0].cfg);
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
+				   range->cfg);
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
+							     WGCHECKER2_COMPAT);
+		if (checker_node < 0)
+			break;
+		if (fdt_getprop(fdt, checker_node, "#access-controller-cells",
+				NULL) && fdt_node_is_enabled(fdt, checker_node))
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
+							     WGCHECKER2_COMPAT);
+		if (checker_node < 0)
+			break;
+		if (!fdt_node_is_enabled(fdt, checker_node))
+			continue;
+		if (!fdt_getprop(fdt, checker_node, "#access-controller-cells",
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
index 00000000..674b2ce3
--- /dev/null
+++ b/platform/generic/worldguard.c
@@ -0,0 +1,553 @@
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
+#include <wgchecker2.h>
+#include <worldguard.h>
+
+struct worldguard_platform_ctx {
+	u32 hart_count;
+	u32 nworlds;
+	u32 trusted_wid;
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
+static u32 worldguard_wid_mask(u32 wid)
+{
+	return (wid < WGCHECKER2_MAX_WIDS) ? (1U << wid) : 0;
+}
+
+static int worldguard_parse_wid_bitmap_u64(const void *fdt, int nodeoff,
+					   const char *prop_name,
+					   u32 max_bits, u32 *out_mask)
+{
+	u64 mask64;
+	int rc;
+
+	if (!out_mask || !max_bits || max_bits > WGCHECKER2_MAX_WIDS)
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+	rc = fdt_parse_u64(fdt, nodeoff, prop_name, &mask64);
+	if (rc)
+		return rc;
+	if (mask64 >> max_bits)
+		return SBI_EINVAL;
+
+	*out_mask = (u32)mask64;
+	return 0;
+}
+
+static int worldguard_parse_wid_u64(const void *fdt, int nodeoff,
+				    const char *prop_name, u32 max_wid,
+				    u32 *out_wid)
+{
+	u64 wid64;
+	int rc;
+
+	if (!out_wid)
+		return SBI_EINVAL;
+
+	rc = fdt_parse_u64(fdt, nodeoff, prop_name, &wid64);
+	if (rc)
+		return rc;
+	if (wid64 >= max_wid)
+		return SBI_EINVAL;
+
+	*out_wid = (u32)wid64;
+	return 0;
+}
+
+static bool worldguard_runtime_enabled(void)
+{
+	return worldguard_platform && worldguard_platform->runtime_enabled;
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
+static void worldguard_init_cpu_defaults(struct worldguard_platform_ctx *platform)
+{
+	u32 i;
+
+	if (!platform || !platform->hart_defaults)
+		return;
+
+	for (i = 0; i < platform->hart_count; i++) {
+		platform->hart_defaults[i].pmwid = platform->trusted_wid;
+		platform->hart_defaults[i].pmwidlist_mask = 0x1;
+		platform->hart_defaults[i].pmlwidlist_mask = 0x1;
+	}
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
+		return SBI_ENOENT;
+
+	rc = fdt_parse_u32(fdt, cpus_offset, WORLDGUARD_CPUS_PROP_NWORLDS,
+			   &platform->nworlds);
+	if (rc)
+		return rc;
+	if (!platform->nworlds || platform->nworlds > WGCHECKER2_MAX_WIDS)
+		return SBI_EINVAL;
+
+	rc = fdt_parse_u32(fdt, cpus_offset, WORLDGUARD_CPUS_PROP_TRUSTEDWID,
+			   &platform->trusted_wid);
+	if (rc == SBI_ENOENT)
+		platform->trusted_wid = platform->nworlds - 1;
+	else if (rc)
+		return rc;
+	if (platform->trusted_wid >= platform->nworlds)
+		return SBI_EINVAL;
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
+		rc = worldguard_parse_wid_u64(fdt, cpu_offset,
+					      WORLDGUARD_CPU_PROP_PMWID,
+					      platform->nworlds,
+					      &cpu_defaults->pmwid);
+		if (rc)
+			return rc;
+
+		rc = worldguard_parse_wid_bitmap_u64(fdt, cpu_offset,
+						     WORLDGUARD_CPU_PROP_PMWIDLIST,
+						     platform->nworlds,
+						     &cpu_defaults->pmwidlist_mask);
+		if (rc)
+			return rc;
+
+		rc = worldguard_parse_wid_bitmap_u64(fdt, cpu_offset,
+						     WORLDGUARD_CPU_PROP_PMLWIDLIST,
+						     platform->nworlds,
+						     &cpu_defaults->pmlwidlist_mask);
+		if (rc)
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
+		if (!fdt_getprop(fdt, cpu_offset, WORLDGUARD_CPU_PROP_PMWID, NULL))
+			continue;
+
+		return true;
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
+	return worldguard_platform ? worldguard_platform->trusted_wid : 0;
+}
+
+static u32 worldguard_valid_pmwid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->pmwidlist_mask :
+			      worldguard_wid_mask(worldguard_fallback_wid());
+}
+
+static u32 worldguard_valid_pmlwid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults =
+		worldguard_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->pmlwidlist_mask :
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
+		return SBI_EINVAL;
+
+	fdt_for_each_subnode(child, fdt, hoff) {
+		if (fdt_node_check_compatible(fdt, child, WGCHECKER2_COMPAT))
+			continue;
+		found = true;
+		break;
+	}
+
+	if (!found)
+		return SBI_EINVAL;
+
+	rc = fdt_parse_u32(fdt, child, WORLDGUARD_PROP_WID, &state->wid);
+	if (rc)
+		return rc;
+	if (state->wid >= WGCHECKER2_MAX_WIDS)
+		return SBI_EINVAL;
+	state->has_wid = true;
+
+	rc = fdt_parse_u32_array_bitmask(fdt, child, WORLDGUARD_PROP_WIDLIST,
+					 WGCHECKER2_MAX_WIDS,
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
+	u32 valid_pmwid_mask = worldguard_valid_pmwid_mask();
+	u32 valid_pmlwid_mask = worldguard_valid_pmlwid_mask();
+	u32 mlwid = worldguard_fallback_wid();
+	u32 mwiddeleg = 0;
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
+	if (state)
+		mwiddeleg = state->widlist_mask & valid_pmlwid_mask;
+
+	slwid = worldguard_select_slwid(mwiddeleg, state && state->has_wid,
+					state ? state->wid : 0, mlwid);
+	worldguard_program_wid_state(mlwid, mwiddeleg, slwid);
+
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
+	worldguard_program_wid_state(worldguard_fallback_wid(), 0,
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
+	int rc;
+
+	if (worldguard_platform)
+		return 0;
+	if (!fdt)
+		return 0;
+
+	checker_count = wgchecker2_count_platform_checkers((void *)fdt);
+	has_runtime = worldguard_has_cpu_runtime(fdt);
+	if (!checker_count && !has_runtime)
+		return 0;
+
+	if (has_runtime && !worldguard_hprot_registered) {
+		rc = sbi_hart_protection_register(&worldguard_hprot);
+		if (rc && rc != SBI_EALREADY)
+			return rc;
+		worldguard_hprot_registered = true;
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
+			return rc;
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
+	worldguard_init_cpu_defaults(platform);
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
+		worldguard_program_wid_state(platform->trusted_wid, 0,
+					     platform->trusted_wid);
+
+	if (checker_count) {
+		rc = wgchecker2_init((void *)fdt);
+		if (rc) {
+			sbi_printf("%s: wgchecker2_init failed (error %d)\n",
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
+	worldguard_free_platform();
+	wgchecker2_cleanup();
+	if (data_registered_now) {
+		sbi_domain_unregister_data(&worldguard_domain_data);
+		worldguard_domain_data_registered = false;
+	}
+	return rc;
+}
+
+#ifdef CONFIG_SBIUNIT
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
+				       bool expect_state, u32 wid,
+				       u32 widlist_mask)
+{
+	struct worldguard_domain_state *state;
+
+	state = sbi_domain_data_ptr((struct sbi_domain *)dom,
+				    &worldguard_domain_data);
+	if (!expect_state)
+		return state && state->has_wid ? SBI_EINVAL : 0;
+	if (!state || !state->has_wid)
+		return SBI_ENOENT;
+	if (state->wid != wid || state->widlist_mask != widlist_mask)
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
