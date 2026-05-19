Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20E3CD4F54
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVKe4ZT1tezmfO2HFFJ75fDSKc4TnTaNBrulxh+SrPc=; b=chXNfzsqHen9tX
	vMhw6XrUJbkQe3rufgC2Yx3oGgFuxXXk+ZOnFd+9Nc79NYdb8a9M9C+asxXxyEz7Y6wpIFacuRE3w
	H/7e81xv+8/LMbFjQikrmeMGGfLZ40bG6Pgy/nwZsxmse5bCjTYd4MG+7smzXCslPTRvNBuF5zZAi
	peZA4IPXCHP+gG1t9VZvfi1Yuhuuurd8WqPo+8R8qI017xKssldDM20dgP4bEgwLsofKWh3LQWRTL
	KBxoAnYAQSbtix3iXtWA6PYONTGQ9NN3TlWYesxegeq6bRigqQBel/5yl9202yTHfzw4dcqVX0t+X
	lgc+ol6LI9isDMKHStWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8d-00000002j5Y-3DIL;
	Tue, 19 May 2026 20:34:03 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8a-00000002j3H-2exx
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:34:01 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50e63771d91so43029441cf.0
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222839; x=1779827639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFcyYrStlFqNln9T+UoBlrM5+NGUHucmUqioke2XrwY=;
        b=DCvZ7v3kXFg/ICaJ7ddNzXb7G4DPW+1R/ihqB59yQRNsdciHAc0NZe+fZgTDzInezT
         1OyNkj/bx+EmRjMkdv06IrLgCdcXqFM4f/gYZe6skPo1bpEiJorcFXkA3xsxOaWlq4yt
         TyQlDIiqB4W9IumKh2aTBD/pvAUeBgA0s1BmRvSCOY87bzO40XBqJCEwhtpklpOEz4+Y
         EH4FlEmH9SyDsU4PMaXqEGuUrlb3inmCY0FZu8WWTTjofbG9QgKNum/LdWFv5PPckdvF
         r/mpMS3qEPXrvaw60kD8s7LLhro/mlwLDLR1rftLYCBDG504NepBON5mmRHYSzEuh8uK
         TTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222839; x=1779827639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SFcyYrStlFqNln9T+UoBlrM5+NGUHucmUqioke2XrwY=;
        b=BUkj4DeUAOCydSw1bZBFYdwh5EQwc+Ns8lPzqxfx/+C7YP5zDHy1QxRvFCUf00hauQ
         2voYJEOJ+Qgv/9KfL3aeKgix6xRSlx3XgQULz60xBOCK/5WYs7lqQvV9zp/SnB8fs7Yk
         ePHOnrnzmAuDEBxnSlvHPiNiYhgnGiCwm+YcavDKO8xnIyNB6/dFGSchqyG4T6duWptl
         YfIrimWt121DefTbHmE6JzyUdVJOg2Fq6AVdTggptE1mmOCxadztUbsWKe0/x+xqC0Xj
         FDHTXLtjg1jPkFpvaDOUJ06vEg6NEU0e8zSvZpHTd+67iBGOQKGCcDLiYiggTFH/XPWJ
         ZQdQ==
X-Gm-Message-State: AOJu0YwZPCTKJia7//oBVK8lGWdG2eJw8ArLTg/KNC28KpOcNrhyK11+
	/ciqPpWKWDt/lfvWFBcAXctxFNMj4FsQlFCs8IibvBqy8h8kapsx+bPK7yGnTA==
X-Gm-Gg: Acq92OHw1PrqyqpUiDzn55wvTXTlqJb/cPT6C00JaajcvKOvvOLUrAiV7oXytT8LenC
	Ex+2MKVjadXbHmMaw1t6gdbArUuYFgQJwzfkBOQpB1SPRsxKROeJ3TxhzwtsX1JspcKeDYIeQDg
	5PwVhjT/wQe5VM7xg+fLFjI/SkpV/yq1R6PHII+qMNJCEqLdoH5E0UM5G+3av0eKQwjzALNo5b8
	XRE8r83zdJ3U9Tcl44IaAIAqV45Sdmlh73WwEpYdsjRv9irFhBO2wkyuIsIo7wTQLbVDOqQPfz4
	1k/b4jFABRIbqT6ozcOiNLf7nKK5SJp7Lp8sMo9nmioVN9RoIyCtfn+4lfkOpKDFcapqF7E8c+L
	zGR2TPv/+SUeC/jDglx3egmJmEj0swck5NFfE6pps6xE3u154Co4ZAoBas5nitZAhsVfxljd6Sd
	6SUfxOPSXsVoGM2vF+AFjgQtFOMPgRYSDz9juexxJCei9sceDhX7hAmMlIBtDoXpoLRBTXqAUFP
	Xm2saeo1229rhzZvnjaBSNd8zfmXwii
X-Received: by 2002:a05:622a:5c0d:b0:509:1009:e7a6 with SMTP id d75a77b69052e-5165a219a59mr290300071cf.43.1779222839293;
        Tue, 19 May 2026 13:33:59 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:59 -0700 (PDT)
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
Subject: [PATCH 5/7] test: add generic hwiso SBI unit coverage
Date: Tue, 19 May 2026 16:33:29 -0400
Message-Id: <20260519203331.2773185-6-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133400_699653_1641F11A 
X-CRM114-Status: GOOD (  19.67  )
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

Add a generic HWISO SBI unit suite that exercises boot-time
initialization and domain-switch hook sequencing without embedding one
platform mechanism's policy directly into the core test driver.

Provide a small test registration layer so each HWISO mechanism can
supply its own state and quiesce assertions.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_hwiso_test.h |  33 +++++++
 lib/sbi/objects.mk           |   3 +
 lib/sbi/sbi_hwiso_test.c     | 167 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hwiso_testlib.c  | 108 ++++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 include/sbi/sbi_hwiso_test.h
 create mode 100644 lib/sbi/sbi_hwiso_test.c
 create mode 100644 lib/sbi/sbi_hwiso_testlib.c

diff --git a/include/sbi/sbi_hwiso_test.h b/include/sbi/sbi_hwiso_test.h
new file mode 100644
index 00000000..3970df5a
--- /dev/null
+++ b/include/sbi/sbi_hwiso_test.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __SBI_HWISO_TEST_H__
+#define __SBI_HWISO_TEST_H__
+
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_unit_test.h>
+
+#ifdef CONFIG_SBIUNIT
+struct sbi_hwiso_test_ops {
+	void (*boot_test)(struct sbiunit_test_case *test);
+	void (*domain_state_test)(struct sbiunit_test_case *test,
+				 const struct sbi_domain *dom, void *ctx);
+	void (*domain_quiesce_test)(struct sbiunit_test_case *test,
+				    const struct sbi_domain *dom, void *ctx);
+};
+
+int sbi_hwiso_test_register(const struct sbi_hwiso_ops *ops,
+			    const struct sbi_hwiso_test_ops *test_ops);
+void sbi_hwiso_test_boot(struct sbiunit_test_case *test);
+void sbi_hwiso_test_domain_state(struct sbiunit_test_case *test,
+				 const struct sbi_domain *dom);
+void sbi_hwiso_test_domain_quiesced(struct sbiunit_test_case *test,
+				    const struct sbi_domain *dom);
+#endif
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 6091499a..8839d13c 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -13,9 +13,12 @@ libsbi-objs-y += riscv_hardfp.o
 libsbi-objs-y += riscv_locks.o
 libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_test.o
 libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
+libsbi-objs-$(CONFIG_SBIUNIT) += sbi_hwiso_testlib.o
 
 libsbi-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
+libsbi-objs-$(CONFIG_SBIUNIT) += sbi_hwiso_test.o
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitmap_test_suite
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += hwiso_test_suite
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += console_test_suite
 
 libsbi-objs-y += sbi_ecall.o
diff --git a/lib/sbi/sbi_hwiso_test.c b/lib/sbi/sbi_hwiso_test.c
new file mode 100644
index 00000000..716596e2
--- /dev/null
+++ b/lib/sbi/sbi_hwiso_test.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_hwiso_test.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_unit_test.h>
+
+static u32 hwiso_collect_switch_domains(struct sbi_domain *current,
+					struct sbi_domain **targets,
+					u32 max_targets)
+{
+	u32 i;
+	u32 count = 0;
+	struct sbi_domain *dom;
+
+	if (!targets || !max_targets)
+		return 0;
+
+	sbi_domain_for_each(i, dom) {
+		if (dom == current || dom == &root)
+			continue;
+
+		targets[count++] = dom;
+		if (count == max_targets)
+			return count;
+	}
+
+	if (current != &root && count < max_targets)
+		targets[count++] = &root;
+
+	return count;
+}
+
+static void hwiso_snapshot_context(struct sbi_context *ctx)
+{
+	struct sbi_trap_regs *trap_regs;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	trap_regs = (struct sbi_trap_regs *)(csr_read(CSR_MSCRATCH) -
+					     SBI_TRAP_REGS_SIZE);
+	ctx->regs = *trap_regs;
+	ctx->sstatus = csr_read(CSR_SSTATUS);
+	ctx->sie = csr_read(CSR_SIE);
+	ctx->stvec = csr_read(CSR_STVEC);
+	ctx->sscratch = csr_read(CSR_SSCRATCH);
+	ctx->sepc = csr_read(CSR_SEPC);
+	ctx->scause = csr_read(CSR_SCAUSE);
+	ctx->stval = csr_read(CSR_STVAL);
+	ctx->sip = csr_read(CSR_SIP);
+	ctx->satp = csr_read(CSR_SATP);
+	ctx->scounteren = 0;
+	ctx->senvcfg = 0;
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
+		ctx->scounteren = csr_read(CSR_SCOUNTEREN);
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		ctx->senvcfg = csr_read(CSR_SENVCFG);
+	ctx->initialized = true;
+}
+
+static struct sbi_context *hwiso_ensure_context(struct sbiunit_test_case *test,
+						struct sbi_domain *dom,
+						struct sbi_context *tmpl,
+						u32 hartindex)
+{
+	struct sbi_context *dom_ctx;
+
+	dom_ctx = sbi_hartindex_to_domain_context(hartindex, dom);
+	if (!dom_ctx) {
+		dom_ctx = sbi_zalloc(sizeof(*dom_ctx));
+		SBIUNIT_ASSERT_NE(test, dom_ctx, NULL);
+		dom_ctx->dom = dom;
+		dom->hartindex_to_context_table[hartindex] = dom_ctx;
+	}
+
+	if (tmpl) {
+		*dom_ctx = *tmpl;
+		dom_ctx->dom = dom;
+		dom->hartindex_to_context_table[hartindex] = dom_ctx;
+	}
+
+	return dom_ctx;
+}
+
+static void hwiso_boot_test(struct sbiunit_test_case *test)
+{
+	sbi_hwiso_test_boot(test);
+}
+
+static void hwiso_domain_switch_test(struct sbiunit_test_case *test)
+{
+	struct sbi_domain *cur_dom = sbi_domain_thishart_ptr();
+	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
+	struct sbi_domain *switch_doms[2];
+	struct sbi_context *cur_ctx;
+	struct sbi_context tmpl_ctx;
+	u32 switch_count;
+	u32 i;
+	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	bool debug_on = false;
+
+	SBIUNIT_ASSERT_NE(test, cur_dom, NULL);
+
+	if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS)
+		debug_on = true;
+	else
+		scratch->options |= SBI_SCRATCH_DEBUG_PRINTS;
+
+	if (!ctx) {
+		cur_ctx = sbi_zalloc(sizeof(*cur_ctx));
+		SBIUNIT_ASSERT_NE(test, cur_ctx, NULL);
+		cur_ctx->dom = cur_dom;
+		cur_dom->hartindex_to_context_table[hartindex] = cur_ctx;
+		ctx = cur_ctx;
+	}
+
+	hwiso_snapshot_context(ctx);
+	tmpl_ctx = *ctx;
+	switch_count = hwiso_collect_switch_domains(cur_dom, switch_doms, 2);
+
+	(void)hwiso_ensure_context(test, cur_dom, NULL, hartindex);
+	for (i = 0; i < switch_count; i++)
+		(void)hwiso_ensure_context(test, switch_doms[i], &tmpl_ctx,
+					   hartindex);
+
+	if (!switch_count)
+		goto out;
+
+	sbi_hwiso_domain_exit(cur_dom, switch_doms[0]);
+	sbi_hwiso_test_domain_quiesced(test, cur_dom);
+	sbi_hwiso_domain_enter(switch_doms[0], cur_dom);
+	sbi_hwiso_test_domain_state(test, switch_doms[0]);
+	sbi_hwiso_domain_exit(switch_doms[0], cur_dom);
+	sbi_hwiso_test_domain_quiesced(test, switch_doms[0]);
+	sbi_hwiso_domain_enter(cur_dom, switch_doms[0]);
+	sbi_hwiso_test_domain_state(test, cur_dom);
+
+	for (i = 0; i < switch_count; i++) {
+		SBIUNIT_ASSERT_EQ(test, sbi_domain_context_enter(switch_doms[i]), 0);
+		sbi_hwiso_test_domain_state(test, switch_doms[i]);
+	}
+
+	SBIUNIT_ASSERT_EQ(test, sbi_domain_context_enter(cur_dom), 0);
+	sbi_hwiso_test_domain_state(test, cur_dom);
+
+out:
+	if (!debug_on)
+		scratch->options &= ~SBI_SCRATCH_DEBUG_PRINTS;
+}
+
+static struct sbiunit_test_case hwiso_test_cases[] = {
+	SBIUNIT_TEST_CASE(hwiso_boot_test),
+	SBIUNIT_TEST_CASE(hwiso_domain_switch_test),
+	SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(hwiso_test_suite, hwiso_test_cases);
diff --git a/lib/sbi/sbi_hwiso_testlib.c b/lib/sbi/sbi_hwiso_testlib.c
new file mode 100644
index 00000000..2a988088
--- /dev/null
+++ b/lib/sbi/sbi_hwiso_testlib.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso_test.h>
+#include <sbi/sbi_list.h>
+
+struct sbi_hwiso_test_node {
+	const struct sbi_hwiso_ops *ops;
+	const struct sbi_hwiso_test_ops *test_ops;
+	struct sbi_dlist node;
+};
+
+static SBI_LIST_HEAD(hwiso_test_ops_list);
+
+static const struct sbi_hwiso_test_ops *
+sbi_hwiso_find_test_ops(const struct sbi_hwiso_ops *ops)
+{
+	struct sbi_hwiso_test_node *entry;
+
+	sbi_list_for_each_entry(entry, &hwiso_test_ops_list, node) {
+		if (entry->ops == ops)
+			return entry->test_ops;
+	}
+
+	return NULL;
+}
+
+int sbi_hwiso_test_register(const struct sbi_hwiso_ops *ops,
+			    const struct sbi_hwiso_test_ops *test_ops)
+{
+	struct sbi_hwiso_test_node *node;
+
+	if (!ops || !test_ops)
+		return SBI_EINVAL;
+	if (sbi_hwiso_find_test_ops(ops))
+		return SBI_EALREADY;
+
+	node = sbi_zalloc(sizeof(*node));
+	if (!node)
+		return SBI_ENOMEM;
+
+	node->ops = ops;
+	node->test_ops = test_ops;
+	SBI_INIT_LIST_HEAD(&node->node);
+	sbi_list_add_tail(&node->node, &hwiso_test_ops_list);
+
+	return 0;
+}
+
+void sbi_hwiso_test_boot(struct sbiunit_test_case *test)
+{
+	struct sbi_hwiso_test_node *entry;
+
+	sbi_list_for_each_entry(entry, &hwiso_test_ops_list, node) {
+		if (!entry->test_ops->boot_test)
+			continue;
+		entry->test_ops->boot_test(test);
+	}
+}
+
+void sbi_hwiso_test_domain_state(struct sbiunit_test_case *test,
+				 const struct sbi_domain *dom)
+{
+	const struct sbi_hwiso_test_ops *test_ops;
+	u32 i;
+
+	if (!dom || !dom->hwiso_ctxs)
+		return;
+
+	for (i = 0; i < dom->hwiso_ctx_count; i++) {
+		if (!dom->hwiso_ctxs[i].ops)
+			continue;
+
+		test_ops = sbi_hwiso_find_test_ops(dom->hwiso_ctxs[i].ops);
+		if (!test_ops || !test_ops->domain_state_test)
+			continue;
+
+		test_ops->domain_state_test(test, dom, dom->hwiso_ctxs[i].ctx);
+	}
+}
+
+void sbi_hwiso_test_domain_quiesced(struct sbiunit_test_case *test,
+				    const struct sbi_domain *dom)
+{
+	const struct sbi_hwiso_test_ops *test_ops;
+	u32 i;
+
+	if (!dom || !dom->hwiso_ctxs)
+		return;
+
+	for (i = 0; i < dom->hwiso_ctx_count; i++) {
+		if (!dom->hwiso_ctxs[i].ops)
+			continue;
+
+		test_ops = sbi_hwiso_find_test_ops(dom->hwiso_ctxs[i].ops);
+		if (!test_ops || !test_ops->domain_quiesce_test)
+			continue;
+
+		test_ops->domain_quiesce_test(test, dom,
+					      dom->hwiso_ctxs[i].ctx);
+	}
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
