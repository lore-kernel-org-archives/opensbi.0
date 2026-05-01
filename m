Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B68CD3423
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26M4SY02aKxfbLF2DccjKoEqVoeIsh1ihC8kUr/kefo=; b=2VpVKreeN1EDfF
	Yu1WkSqdCcUp5YCbdt4U4KDOW+R0bCihyUJD6usANgX5yU/HrAOWlw/iRunFXQ8qOYANm56p5ieGI
	XNKwZdtWzDnCTQcyZCpHlc3kdhUk+IjHwhzd1m4SoZJUT5NsNDuntCYga+sd22zhmfqRBWKFt3BKY
	KvYOqoMEBTkb6lsSTDjaqRt6vnOBI298zlw/8pB8CYRAIoLua2OU0E8vR6LLwN3b79XNR1Q4vgGY+
	Zo/H6SKG6VCUWQA4rqptlDhBFZICDt9noiL7GaiyRJFiVBf2AzbyJj8+koJ/GR4p8bp5DtVuirPI6
	5vZbrSFVa1OBUn6Ek2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgs-00000007Znv-2LxL;
	Fri, 01 May 2026 18:34:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgo-00000007Zly-3JVQ
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 18:34:16 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8a016799d2cso23324436d6.1
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777660453; x=1778265253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErqLecHspcj0Lqx76m2eqo7eizGvHu8LOdTmvNeIqdk=;
        b=OlUgUi1CyvqQjIWpGJx04E73TVTH8y4DQwLvdBiK/aN30afZbV8+ejCkV7z3NRY3Xz
         EhaAvcYxHRZ6rios/UlrIIoJqzUnohuxCCIjO1Q/koxb4YfPXF1y5qfzBT9Iy8abXBEP
         7Opf5kSNzDrklDVbF2OxQKwQSom9DOsurFQInzE4Xj6L9TRi1Ed6oSqv70r5+VcsKNAv
         D0Ltb9nRvPgv9VNOzk6i1IS8daIKgfEw7t5xS2j9Em5aCiGMhDio1OCYnlaAxjIIN2Fa
         eGJmFUe+o/7g4lB4Xsh1xK2CQ+yWdx4FYaUdx34wIw+C9wrc1k5bvhiTR0GDKXDVV/Fp
         XuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660453; x=1778265253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErqLecHspcj0Lqx76m2eqo7eizGvHu8LOdTmvNeIqdk=;
        b=WYEglp/33x0eJvsDMNyiy54gTckzA/PEVe4axd2FaGWZmI4yyvRroy6PPFDN2etS18
         TNAHV9QsH7LeEA7m9bJ6d3iBaPZoI3KgIB0X7fOd/uV4GmTefDodu7DTO92vJTs7dcbZ
         JJrRG6C20S0Ip2YYmn0zYQuTLP2SQHHj5G5ItAnU9lEOpVjiBMjfU7hYptZY7Zme4EE6
         oicM/+q11SaTX41Dl9AxC+rMcjuVi84W6lzj9Y4KuJQ+sT3hmNhY5Ln5GqZjWYZlj29S
         wmmM9MCd0ru1XUMgYSSWF8Dvg33GUkzdG6/3rQTsIlLLBgHU+BkkRtiWfQLzgte8WOxN
         OBHw==
X-Gm-Message-State: AOJu0YzCg7F3WTGWNNxNQpG+5Q1Uvpv4vq1hxbbOyMD4gjM7UtVbYFDP
	7Ae5bzyq4FCBW6dwMkAQH9aws/sIdjEqcxRd0gfdYkjLFRjmKZhKzomVJ+MA1mUQ
X-Gm-Gg: AeBDiet+aTgSMS2X+Tygx4DZHDBI2m9WMlGUQTcR1qW4Me8aPHbvsq7sr2HP/I8IKon
	t5CxyA/p8rxt0yznR4XBABTfj3g11M7QK1+DsjcIDwohhq+Wkli/OvCONDlWn2Ub2SkcqECOrE1
	HAb+BB4pWfEDZ/FhRyiaYddc5NEtFnh4+OUzItfKbQWAmc4VyQconElU5KIdf9yQ5Md71YLPc2h
	zhlHqt7YTP2avCdaqix49F4vPIPzQOcDW5MUwf/eHVIJ6ASekH/SdHF4D7VrpPQNGwfCzLdisJf
	p9mTWFLE7vswGA9+0JmFkcKwhqDCHzhyAp3HwXOz0/3+baRJXZNn3QnpbmHMiH2dxTRFwt+LHqq
	YT+YheobgKpiHUVkw068odyojKRPBmK53ttmhnREITBugZlAE9YShjSHQOpLhYCwxMdrSNk7c1b
	LGChqeKogKQq5sDO1im1BmeKqCRQwNJrWjP8Fa6PsCeR+kKcDQHwMtKfp/7hDwoHdMfDEDd5dIF
	8G3htG8VRpsphJ3b6fQMQ==
X-Received: by 2002:a05:6214:5342:b0:8ac:bb62:fe5a with SMTP id 6a1803df08f44-8b66892ab60mr11143966d6.33.1777660453142;
        Fri, 01 May 2026 11:34:13 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dceddsm29696886d6.30.2026.05.01.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:34:12 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] platform: virt: add QEMU virt WorldGuard hwiso mechanism
Date: Fri,  1 May 2026 14:33:46 -0400
Message-Id: <20260501183346.1596027-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501183346.1596027-1-raymondmaoca@gmail.com>
References: <20260501183346.1596027-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_113415_344743_8CA77249 
X-CRM114-Status: GOOD (  24.11  )
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

Implement the QEMU virt WorldGuard HWISO mechanism. Parse checker
subordinates and resource permissions from the FDT, program wgChecker
MMIO state at boot, parse per-hart CPU defaults plus per-domain
WorldGuard metadata, and switch MLWID, MWIDDELEG and SLWID on domain
transitions.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 platform/generic/include/qemu_virt_wg.h     |   60 ++
 platform/generic/objects.mk                 |    1 +
 platform/generic/platform.c                 |   11 +
 platform/generic/virt/qemu_virt_wgchecker.c | 1050 +++++++++++++++++++
 4 files changed, 1122 insertions(+)
 create mode 100644 platform/generic/include/qemu_virt_wg.h
 create mode 100644 platform/generic/virt/qemu_virt_wgchecker.c

diff --git a/platform/generic/include/qemu_virt_wg.h b/platform/generic/include/qemu_virt_wg.h
new file mode 100644
index 00000000..c1685c0c
--- /dev/null
+++ b/platform/generic/include/qemu_virt_wg.h
@@ -0,0 +1,60 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __QEMU_VIRT_WG_H__
+#define __QEMU_VIRT_WG_H__
+
+#include <sbi/sbi_types.h>
+
+/*
+ * QEMU virt WorldGuard model definitions
+ */
+#define QEMU_VIRT_WG_COMPAT			"sifive,wgchecker2"
+#define QEMU_VIRT_WG_CPU_COMPAT			"riscv,wgcpu"
+#define QEMU_VIRT_WG_CPU_NODE			"worldguard"
+#define QEMU_VIRT_WG_CFG_NODE			"worldguard_cfg"
+
+#define QEMU_VIRT_WG_PROP_SLOT_COUNT		"sifive,slot-count"
+#define QEMU_VIRT_WG_PROP_SUBORDINATES		"sifive,subordinates"
+#define QEMU_VIRT_WG_PROP_WID			"worldguard,wid"
+#define QEMU_VIRT_WG_PROP_WIDLIST		"worldguard,widlist"
+#define QEMU_VIRT_WG_PROP_MWID			"mwid"
+#define QEMU_VIRT_WG_PROP_MWIDLIST		"mwidlist"
+#define QEMU_VIRT_WG_PROP_PERMS			"perms"
+
+/*
+ * The current QEMU wgChecker model uses a 64-bit permission register with
+ * 2 bits per world, so the current software model tracks at most 32 WIDs.
+ */
+#define QEMU_VIRT_WG_MAX_WIDS			32
+
+/* The current QEMU wgChecker model requires 4 KiB slot alignment. */
+#define QEMU_VIRT_WG_MIN_ALIGN			0x1000ULL
+
+/* Current QEMU wgChecker MMIO register layout. */
+#define QEMU_VIRT_WG_MMIO_NSLOTS		0x008
+#define QEMU_VIRT_WG_MMIO_ERRCAUSE		0x010
+#define QEMU_VIRT_WG_MMIO_ERRADDR		0x018
+#define QEMU_VIRT_WG_MMIO_SLOT_BASE		0x020
+#define QEMU_VIRT_WG_MMIO_SLOT_STRIDE		0x020
+#define QEMU_VIRT_WG_MMIO_SLOT_ADDR		0x000
+#define QEMU_VIRT_WG_MMIO_SLOT_PERM		0x008
+#define QEMU_VIRT_WG_MMIO_SLOT_CFG		0x010
+
+/* Current QEMU wgChecker slot cfg.A[1:0] encoding. */
+#define QEMU_VIRT_WG_SLOT_CFG_A_MASK		0x3
+#define QEMU_VIRT_WG_SLOT_CFG_A_OFF		0x0
+#define QEMU_VIRT_WG_SLOT_CFG_A_TOR		0x1
+
+struct qemu_virt_wg_range {
+	u64 base;
+	u64 size;
+	u64 perm;
+};
+
+#endif
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 85aa723a..ebca6940 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -20,6 +20,7 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 # Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.o
+platform-objs-y += virt/qemu_virt_wgchecker.o
 
 # Blobs to build
 FW_TEXT_START=0x80000000
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index b76c2a2f..5f2bc1e4 100644
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
 
+extern int qemu_virt_hwiso_register(void *fdt);
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
+		rc = qemu_virt_hwiso_register(fdt_get_address());
+		if (rc && rc != SBI_EALREADY)
+			return rc;
+	}
+
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
 
diff --git a/platform/generic/virt/qemu_virt_wgchecker.c b/platform/generic/virt/qemu_virt_wgchecker.c
new file mode 100644
index 00000000..063fcecb
--- /dev/null
+++ b/platform/generic/virt/qemu_virt_wgchecker.c
@@ -0,0 +1,1050 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * QEMU virt WorldGuard hardware isolation support
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <qemu_virt_wg.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct wg_checker {
+	char name[32];
+	u64 mmio_base;
+	u64 mmio_size;
+	u32 slot_count;
+	u32 subordinate_count;
+	bool full_checker_rule;
+	u64 full_checker_perm;
+	u32 range_count;
+	struct qemu_virt_wg_range *ranges;
+};
+
+struct wg_cpu_defaults {
+	u32 trusted_wid;
+	u32 nworlds;
+	u32 valid_wid_mask;
+};
+
+struct wg_platform_ctx {
+	u32 checker_count;
+	u32 hart_count;
+	bool checker_enabled;
+	bool runtime_enabled;
+	struct wg_checker *checkers;
+	struct wg_cpu_defaults *hart_defaults;
+};
+
+struct wg_domain_ctx {
+	bool has_wid;
+	u32 wid;
+	u32 widlist_count;
+	u32 widlist_mask;
+	u32 widlist[QEMU_VIRT_WG_MAX_WIDS];
+};
+
+static struct wg_platform_ctx *wg_platform;
+
+static void wg_free_platform_ctx(struct wg_platform_ctx *platform)
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
+	sbi_free(platform->hart_defaults);
+	sbi_free(platform);
+}
+
+static bool wg_runtime_enabled(void)
+{
+	return wg_platform && wg_platform->runtime_enabled;
+}
+
+static u64 wg_read_cells(const fdt32_t *cells, int count)
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
+static void wg_write64(u64 addr, u64 val)
+{
+#if __riscv_xlen != 32
+	writeq(val, (void *)(unsigned long)addr);
+#else
+	writel((u32)val, (void *)(unsigned long)addr);
+	writel((u32)(val >> 32), (void *)(unsigned long)(addr + 4));
+#endif
+}
+
+static void wg_write32(u64 addr, u32 val)
+{
+	writel(val, (void *)(unsigned long)addr);
+}
+
+static u64 wg_slot_addr_encode(u64 addr)
+{
+	return addr >> 2;
+}
+
+static u64 wg_wid_mask(u32 wid)
+{
+	return (wid < 32) ? (1ULL << wid) : 0;
+}
+
+static bool wg_range_is_aligned(u64 base, u64 size)
+{
+	if (!size)
+		return false;
+
+	if (base & (QEMU_VIRT_WG_MIN_ALIGN - 1))
+		return false;
+	if (size & (QEMU_VIRT_WG_MIN_ALIGN - 1))
+		return false;
+
+	return true;
+}
+
+static void wg_sort_ranges(struct wg_checker *checker)
+{
+	struct qemu_virt_wg_range tmp;
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
+static int wg_compact_ranges(struct wg_checker *checker)
+{
+	struct qemu_virt_wg_range *prev, *cur;
+	u64 prev_end, cur_end;
+	u32 i, out = 0;
+
+	if (!checker->range_count)
+		return 0;
+
+	wg_sort_ranges(checker);
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
+static int wg_get_reg_cells(void *fdt, int resource_node,
+			      int *addr_cells, int *size_cells)
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
+static int wg_count_reg_entries(void *fdt, int resource_node, int reg_node)
+{
+	const fdt32_t *reg;
+	int addr_cells, size_cells, entry_cells, len, rc;
+
+	rc = wg_get_reg_cells(fdt, resource_node, &addr_cells, &size_cells);
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
+static int wg_parse_perms(void *fdt, int cfg_node, u64 **out_perms,
+			   u32 *out_count)
+{
+	const fdt32_t *perms;
+	u64 *vals;
+	int len, i, count;
+
+	*out_perms = NULL;
+	*out_count = 0;
+
+	perms = fdt_getprop(fdt, cfg_node, QEMU_VIRT_WG_PROP_PERMS, &len);
+	if (!perms || len <= 0)
+		return 0;
+
+	/* QEMU virt WG permissions are always encoded as 64-bit <hi lo> cells. */
+	if (len % (2 * (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	count = len / (2 * (int)sizeof(fdt32_t));
+	vals = sbi_calloc(sizeof(*vals), count);
+	if (!vals)
+		return SBI_ENOMEM;
+
+	for (i = 0; i < count; i++, perms += 2)
+		vals[i] = wg_read_cells(perms, 2);
+
+	*out_perms = vals;
+	*out_count = count;
+	return 0;
+}
+
+static int wg_fill_ranges(void *fdt, int resource_node, int reg_node,
+			  const u64 *perms, u32 perm_count,
+			  struct qemu_virt_wg_range *ranges, u32 range_count)
+{
+	const fdt32_t *reg;
+	u64 base, size;
+	int addr_cells, size_cells, entry_cells, len, i, rc;
+
+	rc = wg_get_reg_cells(fdt, resource_node, &addr_cells, &size_cells);
+	if (rc)
+		return rc;
+
+	reg = fdt_getprop(fdt, reg_node, "reg", &len);
+	if (!reg || len <= 0)
+		return SBI_EINVAL;
+
+	entry_cells = addr_cells + size_cells;
+	for (i = 0; i < (int)range_count; i++, reg += entry_cells) {
+		base = wg_read_cells(reg, addr_cells);
+		size = wg_read_cells(reg + addr_cells, size_cells);
+		if (!wg_range_is_aligned(base, size))
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
+static int wg_parse_checker_rules(void *fdt, int checker_node,
+				  struct wg_checker *checker)
+{
+	const fdt32_t *subs;
+	u64 *perms = NULL;
+	int cfg_node, len, i, rc = 0, reg_count;
+	u32 perm_count = 0;
+	int child;
+
+	subs = fdt_getprop(fdt, checker_node,
+			   QEMU_VIRT_WG_PROP_SUBORDINATES, &len);
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
+			sbi_printf("[WG] checker %s has invalid subordinate"
+				   " phandle[%d]=0x%x err=%d\n",
+				   checker->name, i, fdt32_to_cpu(subs[i]),
+				   child);
+			rc = child;
+			goto err;
+		}
+
+		cfg_node = fdt_subnode_offset(fdt, child,
+					      QEMU_VIRT_WG_CFG_NODE);
+		if (cfg_node < 0)
+			continue;
+
+		rc = wg_parse_perms(fdt, cfg_node, &perms, &perm_count);
+		if (rc)
+			goto err;
+		if (!perm_count)
+			continue;
+
+		reg_count = wg_count_reg_entries(fdt, child, cfg_node);
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
+			reg_count = wg_count_reg_entries(fdt, child, child);
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
+		rc = wg_fill_ranges(fdt, child,
+				     (fdt_getprop(fdt, cfg_node, "reg", NULL) ?
+				      cfg_node : child),
+				     perms, perm_count,
+				     &checker->ranges[checker->range_count],
+				     reg_count);
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
+	return wg_compact_ranges(checker);
+
+err:
+	sbi_free(perms);
+	return rc ? rc : SBI_EINVAL;
+}
+
+static int wg_parse_checker(void *fdt, int checker_node,
+			    struct wg_checker *checker)
+{
+	const fdt32_t *val;
+	u64 base = 0, size = 0;
+	int len, rc;
+
+	rc = fdt_get_node_addr_size(fdt, checker_node, 0, &base, &size);
+	if (rc)
+		return rc;
+
+	val = fdt_getprop(fdt, checker_node,
+			  QEMU_VIRT_WG_PROP_SLOT_COUNT, &len);
+	if (!val || len < (int)sizeof(fdt32_t))
+		return SBI_EINVAL;
+
+	checker->mmio_base = base;
+	checker->mmio_size = size;
+	checker->slot_count = fdt32_to_cpu(val[0]);
+	sbi_snprintf(checker->name, sizeof(checker->name), "%s",
+		     fdt_get_name(fdt, checker_node, NULL));
+
+	return wg_parse_checker_rules(fdt, checker_node, checker);
+}
+
+static void wg_program_clear_slots(const struct wg_checker *checker)
+{
+	u32 slot;
+
+	for (slot = 1; slot < checker->slot_count; slot++) {
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_ADDR, 0);
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_PERM, 0);
+		wg_write32(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_CFG, 0);
+	}
+
+}
+
+static void wg_program_clear_last_slot(const struct wg_checker *checker)
+{
+	wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+		   checker->slot_count * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+		   QEMU_VIRT_WG_MMIO_SLOT_PERM, 0);
+	wg_write32(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+		   checker->slot_count * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+		   QEMU_VIRT_WG_MMIO_SLOT_CFG, 0);
+}
+
+static void wg_program_clear_slots_from(const struct wg_checker *checker,
+					u32 first_slot)
+{
+	u32 slot;
+
+	if (first_slot >= checker->slot_count)
+		return;
+
+	for (slot = first_slot; slot < checker->slot_count; slot++) {
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_ADDR, 0);
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_PERM, 0);
+		wg_write32(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_CFG, 0);
+	}
+}
+
+static int wg_program_checker(const struct wg_checker *checker)
+{
+	u64 prev_end = 0;
+	u32 required_slots = 0, slot = 1, i;
+
+	wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_ERRCAUSE, 0);
+	wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_ERRADDR, 0);
+
+	if (checker->full_checker_rule) {
+		wg_program_clear_slots(checker);
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   checker->slot_count * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_PERM,
+			   checker->full_checker_perm);
+		wg_write32(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   checker->slot_count * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_CFG,
+			   QEMU_VIRT_WG_SLOT_CFG_A_TOR);
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
+		const struct qemu_virt_wg_range *range = &checker->ranges[i];
+		u64 end = range->base + range->size;
+
+		if (!i || range->base != prev_end) {
+			wg_write64(checker->mmio_base +
+				   QEMU_VIRT_WG_MMIO_SLOT_BASE +
+				   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+				   QEMU_VIRT_WG_MMIO_SLOT_ADDR,
+				   wg_slot_addr_encode(range->base));
+			wg_write64(checker->mmio_base +
+				   QEMU_VIRT_WG_MMIO_SLOT_BASE +
+				   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+				   QEMU_VIRT_WG_MMIO_SLOT_PERM, 0);
+			wg_write32(checker->mmio_base +
+				   QEMU_VIRT_WG_MMIO_SLOT_BASE +
+				   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+				   QEMU_VIRT_WG_MMIO_SLOT_CFG,
+				   QEMU_VIRT_WG_SLOT_CFG_A_OFF);
+			slot++;
+		}
+
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_ADDR,
+			   wg_slot_addr_encode(end));
+		wg_write64(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_PERM,
+			   range->perm);
+		wg_write32(checker->mmio_base + QEMU_VIRT_WG_MMIO_SLOT_BASE +
+			   slot * QEMU_VIRT_WG_MMIO_SLOT_STRIDE +
+			   QEMU_VIRT_WG_MMIO_SLOT_CFG,
+			   QEMU_VIRT_WG_SLOT_CFG_A_TOR);
+		prev_end = end;
+		slot++;
+	}
+
+	/*
+	 * Keep the reset-time trusted-WID bypass slot alive until the new
+	 * rule set is fully programmed, otherwise the DRAM checker can deny
+	 * OpenSBI's own RAM accesses mid-update.
+	 */
+	wg_program_clear_slots_from(checker, slot);
+	wg_program_clear_last_slot(checker);
+
+	return 0;
+}
+
+static void wg_free_platform(void)
+{
+	if (!wg_platform)
+		return;
+
+	wg_free_platform_ctx(wg_platform);
+	wg_platform = NULL;
+}
+
+static void wg_init_cpu_defaults(struct wg_platform_ctx *platform)
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
+static int wg_parse_wid_prop(void *fdt, int node, const char *prop_name,
+			     u32 *out_wid)
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
+	if (*out_wid >= QEMU_VIRT_WG_MAX_WIDS)
+		return SBI_EINVAL;
+
+	return 0;
+}
+
+static int wg_parse_widlist(void *fdt, int node, const char *prop_name,
+			    u32 *out_mask, u32 *out_wids, u32 *out_count)
+{
+	const fdt32_t *prop;
+	u32 mask = 0, count = 0, wid;
+	int len, i;
+
+	if (!out_mask || !out_count)
+		return SBI_EINVAL;
+
+	*out_mask = 0;
+	*out_count = 0;
+
+	prop = fdt_getprop(fdt, node, prop_name, &len);
+	if (!prop)
+		return 0;
+	if (len < 0 || (len % (int)sizeof(fdt32_t)))
+		return SBI_EINVAL;
+
+	count = len / sizeof(fdt32_t);
+	if (count > QEMU_VIRT_WG_MAX_WIDS)
+		return SBI_EINVAL;
+
+	for (i = 0; i < (int)count; i++) {
+		wid = fdt32_to_cpu(prop[i]);
+		if (wid >= QEMU_VIRT_WG_MAX_WIDS)
+			return SBI_EINVAL;
+		if (mask & wg_wid_mask(wid))
+			return SBI_EINVAL;
+
+		mask |= wg_wid_mask(wid);
+		if (out_wids)
+			out_wids[i] = wid;
+	}
+
+	*out_mask = mask;
+	*out_count = count;
+	return 0;
+}
+
+static int wg_parse_cpu_defaults(void *fdt, struct wg_platform_ctx *platform)
+{
+	struct wg_cpu_defaults *cpu_defaults;
+	u32 hartid, hartindex, max_wid, widlist_count;
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
+		wgcpu = fdt_subnode_offset(fdt, cpu_offset,
+					   QEMU_VIRT_WG_CPU_NODE);
+		if (wgcpu < 0 || fdt_node_check_compatible(
+					 fdt, wgcpu, QEMU_VIRT_WG_CPU_COMPAT))
+			continue;
+
+		cpu_defaults = &platform->hart_defaults[hartindex];
+		rc = wg_parse_wid_prop(fdt, wgcpu, QEMU_VIRT_WG_PROP_MWID,
+				       &cpu_defaults->trusted_wid);
+		if (rc)
+			return rc;
+
+		max_wid = cpu_defaults->trusted_wid;
+		rc = wg_parse_widlist(fdt, wgcpu, QEMU_VIRT_WG_PROP_MWIDLIST,
+				      &cpu_defaults->valid_wid_mask, NULL,
+				      &widlist_count);
+		if (rc)
+			return rc;
+
+		cpu_defaults->valid_wid_mask |=
+			wg_wid_mask(cpu_defaults->trusted_wid);
+		if (cpu_defaults->valid_wid_mask) {
+			u32 wid;
+
+			for (wid = 0; wid < QEMU_VIRT_WG_MAX_WIDS; wid++) {
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
+static bool wg_has_cpu_runtime(void *fdt)
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
+		wgcpu = fdt_subnode_offset(fdt, cpu_offset,
+					   QEMU_VIRT_WG_CPU_NODE);
+		if (wgcpu < 0)
+			continue;
+		if (fdt_node_check_compatible(fdt, wgcpu,
+					      QEMU_VIRT_WG_CPU_COMPAT))
+			continue;
+
+		return true;
+	}
+
+	return false;
+}
+
+static u32 wg_count_platform_checkers(void *fdt)
+{
+	int checker_node;
+	u32 count = 0;
+
+	if (!fdt)
+		return 0;
+
+	checker_node = -1;
+	while (true) {
+		checker_node = fdt_node_offset_by_compatible(
+			fdt, checker_node, QEMU_VIRT_WG_COMPAT);
+		if (checker_node < 0)
+			break;
+		if (fdt_getprop(fdt, checker_node,
+				QEMU_VIRT_WG_PROP_SUBORDINATES, NULL))
+			count++;
+	}
+
+	return count;
+}
+
+static int wg_validate_domain_ctx(const struct sbi_domain *dom,
+				  const struct wg_domain_ctx *ctx)
+{
+	const struct wg_cpu_defaults *cpu_defaults;
+	u32 hartindex;
+
+	if (!wg_platform || !dom || !ctx || dom == &root || !dom->possible_harts)
+		return 0;
+
+	for (hartindex = 0; hartindex < wg_platform->hart_count; hartindex++) {
+		if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
+			continue;
+
+		cpu_defaults = &wg_platform->hart_defaults[hartindex];
+		if (!(cpu_defaults->valid_wid_mask & wg_wid_mask(ctx->wid)))
+			return SBI_EINVAL;
+		if (ctx->widlist_mask & ~cpu_defaults->valid_wid_mask)
+			return SBI_EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct wg_cpu_defaults *wg_current_cpu_defaults(void)
+{
+	u32 hartindex;
+
+	if (!wg_platform || !wg_platform->hart_defaults)
+		return NULL;
+
+	hartindex = sbi_hartid_to_hartindex(current_hartid());
+	if (!sbi_hartindex_valid(hartindex) ||
+	    hartindex >= wg_platform->hart_count)
+		return NULL;
+
+	return &wg_platform->hart_defaults[hartindex];
+}
+
+static void wg_program_wid_state(u32 mlwid, u32 mwiddeleg, u32 slwid)
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
+static int wg_init(void *fdt)
+{
+	struct wg_platform_ctx *platform;
+	int checker_node, rc;
+	u32 count, idx = 0;
+	bool has_runtime;
+
+	wg_free_platform();
+
+	if (!fdt)
+		return 0;
+
+	count = wg_count_platform_checkers(fdt);
+	has_runtime = wg_has_cpu_runtime(fdt);
+	if (!count && !has_runtime)
+		return 0;
+
+	platform = sbi_zalloc(sizeof(*platform));
+	if (!platform)
+		return SBI_ENOMEM;
+
+	platform->hart_count = sbi_scratch_last_hartindex() + 1;
+	platform->checker_count = count;
+	platform->checker_enabled = !!count;
+	platform->runtime_enabled = has_runtime;
+	platform->checkers = sbi_calloc(sizeof(*platform->checkers), count);
+	if (count && !platform->checkers) {
+		sbi_free(platform);
+		return SBI_ENOMEM;
+	}
+
+	platform->hart_defaults = sbi_calloc(sizeof(*platform->hart_defaults),
+					      platform->hart_count);
+	if (!platform->hart_defaults) {
+		wg_free_platform_ctx(platform);
+		return SBI_ENOMEM;
+	}
+
+	wg_init_cpu_defaults(platform);
+	rc = wg_parse_cpu_defaults(fdt, platform);
+	if (rc) {
+		wg_free_platform_ctx(platform);
+		return rc;
+	}
+
+	if (platform->checker_enabled) {
+		checker_node = -1;
+		while (true) {
+			checker_node = fdt_node_offset_by_compatible(
+				fdt, checker_node, QEMU_VIRT_WG_COMPAT);
+			if (checker_node < 0)
+				break;
+			if (!fdt_getprop(fdt, checker_node,
+					 QEMU_VIRT_WG_PROP_SUBORDINATES, NULL))
+				continue;
+
+			rc = wg_parse_checker(fdt, checker_node,
+					      &platform->checkers[idx]);
+			if (rc) {
+				sbi_printf("[WG] failed to parse checker %s err=%d\n",
+					   fdt_get_name(fdt, checker_node, NULL),
+					   rc);
+				wg_free_platform_ctx(platform);
+				return rc;
+			}
+
+			rc = wg_program_checker(&platform->checkers[idx]);
+			if (rc) {
+				sbi_printf("[WG] failed to program checker %s err=%d\n",
+					   platform->checkers[idx].name, rc);
+				wg_free_platform_ctx(platform);
+				return rc;
+			}
+
+			sbi_printf("[WG] checker %s base=0x%llx slots=%u rules=%u%s\n",
+				   platform->checkers[idx].name,
+				   (unsigned long long)platform->checkers[idx].mmio_base,
+				   platform->checkers[idx].slot_count,
+				   platform->checkers[idx].range_count,
+				   platform->checkers[idx].full_checker_rule ?
+					" full-checker" : "");
+			idx++;
+		}
+	}
+
+	wg_platform = platform;
+	return 0;
+}
+
+static int wg_domain_init(void *fdt, int domain_offset,
+			  struct sbi_domain *dom, void **out_ctx)
+{
+	struct wg_domain_ctx *ctx;
+	int hoff, child, rc;
+	bool found = false;
+
+	if (!out_ctx)
+		return SBI_EINVAL;
+
+	*out_ctx = NULL;
+	if (!wg_runtime_enabled())
+		return 0;
+	if (!fdt || domain_offset < 0)
+		return 0;
+
+	hoff = fdt_subnode_offset(fdt, domain_offset, "hw-isolation");
+	if (hoff < 0)
+		return (dom == &root) ? 0 : SBI_EINVAL;
+
+	fdt_for_each_subnode(child, fdt, hoff) {
+		if (fdt_node_check_compatible(
+				fdt, child, QEMU_VIRT_WG_COMPAT))
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
+	rc = wg_parse_wid_prop(fdt, child, QEMU_VIRT_WG_PROP_WID, &ctx->wid);
+	if (rc)
+		goto err_free_ctx;
+	ctx->has_wid = true;
+
+	rc = wg_parse_widlist(fdt, child, QEMU_VIRT_WG_PROP_WIDLIST,
+			      &ctx->widlist_mask, ctx->widlist,
+			      &ctx->widlist_count);
+	if (rc)
+		goto err_free_ctx;
+
+	rc = wg_validate_domain_ctx(dom, ctx);
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
+static u32 wg_fallback_wid(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults = wg_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->trusted_wid : 0;
+}
+
+static u32 wg_valid_wid_mask(void)
+{
+	const struct wg_cpu_defaults *cpu_defaults = wg_current_cpu_defaults();
+
+	return cpu_defaults ? cpu_defaults->valid_wid_mask :
+			      (u32)wg_wid_mask(wg_fallback_wid());
+}
+
+static u32 wg_select_slwid(u32 widlist_mask, bool has_wid, u32 wid, u32 fallback)
+{
+	u32 i;
+
+	if (!widlist_mask)
+		return fallback;
+
+	if (has_wid && (wg_wid_mask(wid) & widlist_mask))
+		return wid;
+
+	for (i = 0; i < 32; i++) {
+		if (widlist_mask & (1U << i))
+			return i;
+	}
+
+	return fallback;
+}
+
+static void wg_domain_exit(const struct sbi_domain *src,
+			   const struct sbi_domain *dst, void *ctx)
+{
+	u32 mlwid = wg_fallback_wid();
+
+	(void)ctx;
+	if (!wg_runtime_enabled())
+		return;
+
+	wg_program_wid_state(mlwid, 0, mlwid);
+
+	sbi_printf("[WG] domain_exit src=%s dst=%s mlwid=%u mwiddeleg=0x0\n",
+		   src ? src->name : "<null>",
+		   dst ? dst->name : "<null>", mlwid);
+}
+
+static void wg_domain_enter(const struct sbi_domain *dst,
+			    const struct sbi_domain *src, void *ctx)
+{
+	struct wg_domain_ctx *dctx = ctx;
+	u32 valid_mask = wg_valid_wid_mask();
+	u32 mlwid = wg_fallback_wid();
+	u32 mwiddeleg = 0;
+	u32 slwid = mlwid;
+
+	(void)src;
+	if (!wg_runtime_enabled())
+		return;
+
+	if (dctx && dctx->has_wid && (wg_wid_mask(dctx->wid) & valid_mask))
+		mlwid = dctx->wid;
+
+	if (dctx)
+		mwiddeleg = dctx->widlist_mask & valid_mask;
+	slwid = wg_select_slwid(mwiddeleg, dctx && dctx->has_wid,
+				dctx ? dctx->wid : 0, mlwid);
+
+	wg_program_wid_state(mlwid, mwiddeleg, slwid);
+
+	sbi_printf("[WG] domain_enter dst=%s mlwid=%u mwiddeleg=0x%x",
+		   dst ? dst->name : "<null>", mlwid, mwiddeleg);
+	sbi_printf(" slwid=%u\n", slwid);
+}
+
+static void wg_domain_cleanup(struct sbi_domain *dom, void *ctx)
+{
+	(void)dom;
+	sbi_free(ctx);
+}
+
+static const struct sbi_hwiso_ops wg_ops = {
+	.name = QEMU_VIRT_WG_COMPAT,
+	.init = wg_init,
+	.domain_init = wg_domain_init,
+	.domain_exit = wg_domain_exit,
+	.domain_enter = wg_domain_enter,
+	.domain_cleanup = wg_domain_cleanup,
+};
+
+int qemu_virt_hwiso_register(void *fdt)
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
+	rc = sbi_hwiso_register(&wg_ops);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
