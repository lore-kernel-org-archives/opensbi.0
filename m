Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB60CD5BA4
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae9nOwvZdazdmFgHLMUFqnNko7in2S1WuDuYiRfQk5s=; b=Dc4JccETOY6RkG
	sOzNZMEDmNr0LnznBqbRxlpoh0Z9KBmeHS76bjJvrXMc1KvolqcYBoH+ClfV0VjIQ59oJj8SZuTHD
	g5SXAEcjJ3NFQXuzufPWq76IU8SE9/Cx5fiEYIKUEzQ9eto6np+BRL6uLFpeoV+Q0AQ8YOSV67piH
	qWl7z6NsRIzwcKNIuneJWag0F+lPSVl/brUM8PymnvyppN73fNastITYx1xGjPeVYHlcus1Ng49AT
	hUHkiwBzAkwzzJWFHmNvU1Qwmd75/Us9Mu+XmAG+V42WXuyMf1XB4GasuYFhdeW2J3QDbBgbarJi4
	y9ayNp/vJklCNmfRLAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8g-00000002j6U-2cvQ;
	Tue, 19 May 2026 20:34:06 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8c-00000002j3v-1p4N
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:34:03 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-50fb4a7d704so36697131cf.1
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222841; x=1779827641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afa8RqTOqCfZrOURxfEgdo9E9kFuYq1x2eFoq9BcG1o=;
        b=p8uN23MX0KU8EX5htmvb4woFNlwPUwe2o++Fm6wmlKS5B3anw9aZEqn4Iz7cXViHDx
         yPQ7qf44ktge0yg8pn5oXrABCloW+OY8ZDsocLcCXdkX/aI0osPl1lyITgjmJpyQS7Yo
         hVDxg1KwIsDSFeySKfGNHGYI7Jrmp6OrZxewt/WPHsqEyhtf/mMIey/+rlecpHgMpWU+
         9lKM/k8anGXtQqiXmI/YlIZz0rDhEcTeoxfV85pWwtkqbDn/N/opJPbfR5ynGBVXZyj/
         GOe9fE7QYlMYEgXlgiJ7C8wJAaPdkie99VaK8PSMIOvslhZR/5ZgEsdt7SsBAs6YQZUn
         1mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222841; x=1779827641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afa8RqTOqCfZrOURxfEgdo9E9kFuYq1x2eFoq9BcG1o=;
        b=UukeX+EMHOXVuOT1Oe4+JANKcSUBKDAQhSy9eAbuHvkLQgSrnnnRWIbULxR9k9RyFp
         0HZwHVbOMFdwj0aR6OnKxklDcgMWoh3+LybLTBr+hmkY5qVk/SRDrg6EHyA1/xMvsXkd
         vUcd9cTAITTpB/qvi2ctMk9zZF65iMOt7UWSLYvLm1Y4hGhOrgalq5HhbuNVuqEiPCK8
         k1nlXGaCafjtkhpwjDhOXP0sWpQyDob0fO7wbl9DGsmGVppMHeWOctV+d/7Xq4m6Z2rj
         gV52U0T6Xybe/hgoGJV3j6z3a0e/6/QoMZ42h4Syc8V3OA05OdJ9u9WuCCsObmTDQ91Y
         jj0w==
X-Gm-Message-State: AOJu0YywKRsqTU9gD4S4zFxbNlTTlFkKTfqvRxohw3YzhxZjRHh1Cz45
	G9b2f9UbCMC19LTRWf4Cp85RVuG2bEaOavcbFWsH/3SFRg9f5EgV57uxGTwsmw==
X-Gm-Gg: Acq92OEqT8Zk8COQUxKCkr5kLSX4u0XpAQypZ6HvKfeExnaCTemXZnq/jGktyCI9lqf
	LI4OU0fYx++zIjPNj3Ph4cjkimup5lnlllXWZG6kv4rasFH0p5QEwnMC/L7L1rC0pAL2mHgiLIo
	fi1UiEJeGQs0NjqqpAjMUOrJr0H/LW5ptWP1PgOzgLpCeCBcyHWy/BqOyU5A4UWhDC6LpfoCFml
	towBp5OZIb7Av/pdke8XY/MROfQ8YC6Rgzc9G+rdNdUwlUerpEaiNMKFY3k11HspxSVOEWbD8Uy
	qFS1FD0/v9fteOXHiEP5VYPKI59koPwKr2AsxhSinyHvTnywzx26JLCFx9cS0e5TPJcp6eGbvNz
	lahY3gJfR5QGL82x6sBTy5dErrXp3gQFSh4mfq+sbz9lxdAhMWpQXuZjDW49SlM6l/wexrNLh1G
	XN5o0QViQ4rG2spD+WMnKq6h7iTkRjDJT1HuzaSUZynBUiW2MuIzcua8gFEoZtJMuHcE8EpAtxy
	rz8kYsNLLqlkLV/bBKZIA==
X-Received: by 2002:a05:622a:130a:b0:50d:a301:2fc0 with SMTP id d75a77b69052e-5165a077858mr309067641cf.26.1779222840996;
        Tue, 19 May 2026 13:34:00 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:34:00 -0700 (PDT)
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
Subject: [PATCH 6/7] platform: virt: add QEMU virt WorldGuard hwiso tests
Date: Tue, 19 May 2026 16:33:30 -0400
Message-Id: <20260519203331.2773185-7-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133402_543969_B487A493 
X-CRM114-Status: GOOD (  17.56  )
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

Add QEMU virt WorldGuard mechanism-specific tests for boot-time
checker programming and runtime CSR state, and verify the expected
root / domain@0 / domain@1 behavior through the HWISO test callback
API.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 platform/generic/objects.mk                   |   1 +
 .../generic/virt/qemu_virt_wgchecker_test.c   | 321 ++++++++++++++++++
 2 files changed, 322 insertions(+)
 create mode 100644 platform/generic/virt/qemu_virt_wgchecker_test.c

diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 80bd65ea..be58873a 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -23,6 +23,7 @@ platform-objs-y += platform_override_modules.o
 platform-objs-y += worldguard.o
 platform-objs-y += wgchecker2.o
 platform-objs-y += virt/qemu_virt_worldguard.o
+platform-objs-$(CONFIG_SBIUNIT) += virt/qemu_virt_wgchecker_test.o
 
 # Blobs to build
 FW_TEXT_START=0x80000000
diff --git a/platform/generic/virt/qemu_virt_wgchecker_test.c b/platform/generic/virt/qemu_virt_wgchecker_test.c
new file mode 100644
index 00000000..0eeaa3a0
--- /dev/null
+++ b/platform/generic/virt/qemu_virt_wgchecker_test.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+#include <libfdt.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_hwiso_test.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_unit_test.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <wgchecker2.h>
+#include <worldguard.h>
+
+struct qemu_virt_wg_slot_expect {
+	bool check_addr;
+	u64 addr;
+	u64 perm;
+	u32 cfg;
+};
+
+struct qemu_virt_wg_checker_expect {
+	const char *path;
+	u32 slot_count;
+	struct qemu_virt_wg_slot_expect *slots;
+	struct qemu_virt_wg_slot_expect last_slot;
+};
+
+struct qemu_virt_wg_expect {
+	u32 wid;
+	u32 widlist_mask;
+	bool check_slwid;
+	u32 slwid;
+};
+
+static u64 qemu_virt_wg_mmio_read64(unsigned long addr)
+{
+#if __riscv_xlen != 32
+	return readq((void *)addr);
+#else
+	return readl((void *)addr) | ((u64)readl((void *)(addr + 4)) << 32);
+#endif
+}
+
+static struct qemu_virt_wg_slot_expect qemu_virt_wg_dram_slots[] = {
+	{
+		.check_addr = true,
+		.addr = 0x20000000ULL,
+		.perm = 0,
+		.cfg = WGCHECKER2_SLOT_CFG_A_OFF,
+	},
+	{
+		.check_addr = true,
+		.addr = 0x30000000ULL,
+		.perm = 0xcf,
+		.cfg = WGCHECKER2_SLOT_CFG_A_TOR,
+	},
+	{
+		.check_addr = true,
+		.addr = 0x30400000ULL,
+		.perm = 0xcc,
+		.cfg = WGCHECKER2_SLOT_CFG_A_TOR,
+	},
+	{
+		.check_addr = true,
+		.addr = 0x40000000ULL,
+		.perm = 0xcf,
+		.cfg = WGCHECKER2_SLOT_CFG_A_TOR,
+	},
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+};
+
+static struct qemu_virt_wg_slot_expect qemu_virt_wg_zero_slots[] = {
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+	{ .check_addr = true, .addr = 0, .perm = 0, .cfg = 0 },
+};
+
+static const struct qemu_virt_wg_checker_expect qemu_virt_wg_checker_expects[] = {
+	{
+		.path = "/soc/wgchecker@6000000",
+		.slot_count = 16,
+		.slots = qemu_virt_wg_dram_slots,
+		.last_slot = { .perm = 0, .cfg = 0 },
+	},
+	{
+		.path = "/soc/wgchecker@6001000",
+		.slot_count = 16,
+		.slots = qemu_virt_wg_zero_slots,
+		.last_slot = { .perm = 0xc3, .cfg = WGCHECKER2_SLOT_CFG_A_TOR },
+	},
+	{
+		.path = "/soc/wgchecker@6002000",
+		.slot_count = 1,
+		.slots = NULL,
+		.last_slot = { .perm = 0xc0, .cfg = WGCHECKER2_SLOT_CFG_A_TOR },
+	},
+};
+
+static const struct qemu_virt_wg_expect qemu_virt_wg_root_expect = {
+	.wid = 3,
+	.widlist_mask = 0,
+	.check_slwid = false,
+};
+
+static const struct qemu_virt_wg_expect qemu_virt_wg_domain0_expect = {
+	.wid = 0,
+	.widlist_mask = 0xb,
+	.check_slwid = true,
+	.slwid = 0,
+};
+
+static const struct qemu_virt_wg_expect qemu_virt_wg_domain1_expect = {
+	.wid = 1,
+	.widlist_mask = 0xa,
+	.check_slwid = true,
+	.slwid = 1,
+};
+
+static struct sbi_domain *qemu_virt_wg_find_domain(const char *name)
+{
+	u32 i;
+	struct sbi_domain *dom;
+
+	sbi_domain_for_each(i, dom) {
+		if (!sbi_strcmp(dom->name, name))
+			return dom;
+	}
+
+	return NULL;
+}
+
+static const struct qemu_virt_wg_expect *
+qemu_virt_wg_domain_expect(const struct sbi_domain *dom)
+{
+	if (dom == &root)
+		return &qemu_virt_wg_root_expect;
+	if (dom && !sbi_strcmp(dom->name, "root"))
+		return &qemu_virt_wg_root_expect;
+	if (!dom)
+		return NULL;
+	if (!sbi_strcmp(dom->name, "domain@0"))
+		return &qemu_virt_wg_domain0_expect;
+	if (!sbi_strcmp(dom->name, "domain@1"))
+		return &qemu_virt_wg_domain1_expect;
+
+	return NULL;
+}
+
+static void qemu_virt_wg_assert_checker(struct sbiunit_test_case *test,
+					const struct qemu_virt_wg_checker_expect *expect)
+{
+	void *fdt = fdt_get_address();
+	u64 base, size, addr, perm;
+	u32 cfg, slot;
+	int node, rc;
+
+	node = fdt_path_offset(fdt, expect->path);
+	SBIUNIT_ASSERT(test, node >= 0);
+
+	rc = fdt_get_node_addr_size(fdt, node, 0, &base, &size);
+	SBIUNIT_ASSERT_EQ(test, rc, 0);
+	(void)size;
+
+	SBIUNIT_ASSERT_EQ(test,
+				  readl((void *)(unsigned long)
+					(base + WGCHECKER2_MMIO_NSLOTS)),
+			  expect->slot_count);
+	SBIUNIT_ASSERT_EQ(test,
+				  qemu_virt_wg_mmio_read64(base + WGCHECKER2_MMIO_ERRCAUSE),
+			  0UL);
+	SBIUNIT_ASSERT_EQ(test,
+				  qemu_virt_wg_mmio_read64(base + WGCHECKER2_MMIO_ERRADDR),
+			  0UL);
+
+	for (slot = 1; slot < expect->slot_count; slot++) {
+		addr = qemu_virt_wg_mmio_read64(
+				base + WGCHECKER2_MMIO_SLOT_BASE +
+				slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				WGCHECKER2_MMIO_SLOT_ADDR);
+		perm = qemu_virt_wg_mmio_read64(
+				base + WGCHECKER2_MMIO_SLOT_BASE +
+				slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				WGCHECKER2_MMIO_SLOT_PERM);
+		cfg = readl((void *)(unsigned long)
+				    (base + WGCHECKER2_MMIO_SLOT_BASE +
+				     slot * WGCHECKER2_MMIO_SLOT_STRIDE +
+				     WGCHECKER2_MMIO_SLOT_CFG)) &
+			      WGCHECKER2_SLOT_CFG_A_MASK;
+
+		if (expect->slots[slot - 1].check_addr)
+			SBIUNIT_ASSERT_EQ(test, addr, expect->slots[slot - 1].addr);
+		SBIUNIT_ASSERT_EQ(test, perm, expect->slots[slot - 1].perm);
+		SBIUNIT_ASSERT_EQ(test, cfg, expect->slots[slot - 1].cfg);
+	}
+
+	perm = qemu_virt_wg_mmio_read64(
+			base + WGCHECKER2_MMIO_SLOT_BASE +
+			expect->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+			WGCHECKER2_MMIO_SLOT_PERM);
+	cfg = readl((void *)(unsigned long)
+		    (base + WGCHECKER2_MMIO_SLOT_BASE +
+		     expect->slot_count * WGCHECKER2_MMIO_SLOT_STRIDE +
+		     WGCHECKER2_MMIO_SLOT_CFG)) &
+		      WGCHECKER2_SLOT_CFG_A_MASK;
+	SBIUNIT_ASSERT_EQ(test, perm, expect->last_slot.perm);
+	SBIUNIT_ASSERT_EQ(test, cfg, expect->last_slot.cfg);
+}
+
+static void qemu_virt_wg_assert_state(struct sbiunit_test_case *test,
+				      const struct sbi_domain *dom, void *ctx)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct qemu_virt_wg_expect *expect;
+
+	(void)ctx;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWG))
+		return;
+	expect = qemu_virt_wg_domain_expect(dom);
+	if (!expect)
+		return;
+
+	SBIUNIT_ASSERT_EQ(test, csr_read(CSR_MLWID), expect->wid);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWG))
+		return;
+
+	SBIUNIT_ASSERT_EQ(test, csr_read(CSR_MWIDDELEG), expect->widlist_mask);
+	if (!expect->check_slwid)
+		return;
+
+	SBIUNIT_ASSERT_EQ(test, csr_read(CSR_SLWID), expect->slwid);
+}
+
+static void qemu_virt_wg_assert_quiesced(struct sbiunit_test_case *test,
+					 const struct sbi_domain *dom, void *ctx)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	(void)dom;
+	(void)ctx;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWG))
+		return;
+
+	SBIUNIT_ASSERT_EQ(test, csr_read(CSR_MLWID), qemu_virt_wg_root_expect.wid);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWG))
+		return;
+
+	SBIUNIT_ASSERT_EQ(test, csr_read(CSR_MWIDDELEG), 0UL);
+}
+
+static void qemu_virt_wg_boot_test(struct sbiunit_test_case *test)
+{
+	struct sbi_domain *dom0, *dom1;
+	u32 i;
+
+	for (i = 0;
+	     i < (sizeof(qemu_virt_wg_checker_expects) /
+		  sizeof(qemu_virt_wg_checker_expects[0]));
+	     i++)
+		qemu_virt_wg_assert_checker(test, &qemu_virt_wg_checker_expects[i]);
+
+	SBIUNIT_ASSERT_EQ(test, worldguard_test_check_runtime_state(true), 0);
+	SBIUNIT_ASSERT_EQ(test, wgchecker2_checker_count(), 3);
+
+	dom0 = qemu_virt_wg_find_domain("domain@0");
+	dom1 = qemu_virt_wg_find_domain("domain@1");
+	SBIUNIT_ASSERT_NE(test, dom0, NULL);
+	SBIUNIT_ASSERT_NE(test, dom1, NULL);
+	SBIUNIT_ASSERT_EQ(test,
+			  worldguard_test_check_domain_state(
+				dom0, true, qemu_virt_wg_domain0_expect.wid,
+				qemu_virt_wg_domain0_expect.widlist_mask),
+			  0);
+	SBIUNIT_ASSERT_EQ(test,
+			  worldguard_test_check_domain_state(
+				dom1, true, qemu_virt_wg_domain1_expect.wid,
+				qemu_virt_wg_domain1_expect.widlist_mask),
+			  0);
+	SBIUNIT_ASSERT_EQ(test,
+			  worldguard_test_check_domain_state(&root, false, 0, 0),
+			  0);
+}
+
+const struct sbi_hwiso_test_ops qemu_virt_worldguard_test_ops = {
+	.boot_test = qemu_virt_wg_boot_test,
+	.domain_state_test = qemu_virt_wg_assert_state,
+	.domain_quiesce_test = qemu_virt_wg_assert_quiesced,
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
