Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098DFFD708D
	for <opensbi@archiver.kernel.org>; Tue, 17 Mar 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JuPNcpEeE16sxQgkZ2eFFylEIFNZ0q6Jp22yS02f+6E=; b=xhyYbja/8sqrB+
	rsd4o4bPTTuby76DKBtHXv2XSkpCerZ3NzcxPSmwFfL8rlAoGZGldhjJHvTjoGR5f7Vbzvz1jP5Z0
	v0g+gNI5jFYBPoCwWrQCmADlznaQUyUkl66ByFjgiBYmsEtsYsrZgLvVhC1lxA5dfV6gy2G9raa6J
	62Uiqq1GOo0kovZOCIXgbKADfEHuuaDAGKio00KFjcimIXGnZvjxxVc8ZV52HHDXzn17nYd4ZQJxR
	N+OPZfsfp1k//9tPF4E6Ovc1yrSiueUAjLyuxVDgztM/fEmZlV4OtwIcAlkhuUfyYedqnhU4BgGbP
	kmmRsBgz/yFTTjAxalhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ase-00000007Biy-1Djl;
	Tue, 17 Mar 2026 20:19:08 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asb-00000007BhT-0IqN
	for opensbi@lists.infradead.org;
	Tue, 17 Mar 2026 20:19:06 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cd7aab92dfso33639785a.0
        for <opensbi@lists.infradead.org>; Tue, 17 Mar 2026 13:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773778743; x=1774383543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6HBI0d6h+UzrfkCCtk2E5AYkyHYp19izceQcVZIqrSA=;
        b=RQBxvzxcKVgrhkUawNIOsiaa04dCLb+ObndOyc9GkEe+NZrQDxmsKd97sHZBIBFNsq
         mNXmq5HWosVpCg5UTGAwXCP4Ki7+nmMfXLj9wg5e1ElCAq4COppZYWpshegLNZ1tyegE
         MVuVB/sPuTcYCeBfk8nVK/nwcB3AGcFlqS8ULgv1FGKqJ2Td6ohUjovl5f2kQVjov74a
         mfmKL+PDizpKfCUZXo45nh9YYRZ33nNCj+0Z0WSyooG9x6PHW93iSrLwBFsG5kKN7pSZ
         GcEyDrD3EWNjwUysH8I/pDHsCaNyYoPE8Da5I1etdPB9q3WZvX0hCXe2K6MBOsXY9HjB
         RagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778743; x=1774383543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HBI0d6h+UzrfkCCtk2E5AYkyHYp19izceQcVZIqrSA=;
        b=cwCM4jwZswznIE42YQO4XiV40VzqPOl1cXrda8poLRfgJP2SJR9qZm0YTsyhGYDDg+
         GrD7cVNaJeb9zmUEN4YMjXEtA9846oorJfUu/bgHpKy2nSdIXXr7or8iTYkPqyRW28ij
         NK2G86eiSPUJNnIjJphrJ3g2GI/nHbHfwpK4GhW3g+qr8Uodb8qggxbWPcobz4iDHap9
         qvxAiqHTpUexYJ8wEDIh2Hc7HnQFVXdPAXvdLNyeb0DgQjrZSrVpm5QpfIJyyEIZYXnz
         Icr+xECQiDBDavMMute8vvzitVoRkUR0OTHQT6ywsZDQGSbZTnbUgdM4lAhu+ekp+iXa
         Wm/g==
X-Gm-Message-State: AOJu0Yw61JP/je0yT+lnB11D/pX+BOJQoAwtStKm+xxNzlPE2O6I9LSd
	iU6mbOj3nyT/1rBaUL04DpUPq6FazbTiuwb383SKZmQ9k2yos7ItBwl05+nfpAVH
X-Gm-Gg: ATEYQzzu8cAsLObegX4GPHSpF5sk4P4PleVReL2wiSDnxXKlhRCYSFKo072USRmkchP
	iTc85uMIW2ZLnpKYe4eKLB7drMdGRXpxyny71ix5kLp7FCBm3QdAz/0vWLGSgYQR4HA2afutj0Y
	sXrZgAqk3C/7p5EaqC6UE2T5Y//ZD0dJF+oR5JTYrduu3Rv24j7Obw3yVvVaDt6IJAbTpJseHIf
	791i5YpY+SKkhRMbVrPhxgZJqfEvX73qyrtjl2LNqKJ3TLRcnOZLJLxTXGlif20wtW89fFrebTa
	JD+nu0VXPtZI/C+5dLfHOflot1Rt8dMHCwUBNG6jIBuE1tCAlw34VXXMnog5vEEKmOdJFTSubSS
	chVmhWL/TtNnEAGPISIgycu9kW8iqAVb0SuhhM6cxbTmE+ZKLxqr11RwyoHLXM5QtlONHnFTKcm
	3zNPOjbA1PJeishCSvjtkmiYwMXK2vNdlovFVf6t3VIEyaOoQUXQE3AKyBNaANsbrBElS9FT33p
	6RLf6NRPHk=
X-Received: by 2002:a05:620a:298d:b0:8cd:9020:f041 with SMTP id af79cd13be357-8cde1512e14mr577268985a.34.1773778742882;
        Tue, 17 Mar 2026 13:19:02 -0700 (PDT)
Received: from ubuntu.localdomain (173-206-124-85.cpe.distributel.net. [173.206.124.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacdb2234sm69672585a.6.2026.03.17.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:19:02 -0700 (PDT)
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
Subject: [RFC PATCH] sbi: add hardware isolation abstraction framework
Date: Tue, 17 Mar 2026 16:18:49 -0400
Message-Id: <20260317201849.903071-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_131905_151153_E02F7531 
X-CRM114-Status: GOOD (  19.93  )
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

Introduce a system-level hardware isolation framework with a
registration API and per-domain context tracking.
This establishes an abstraction that allows multiple mechanisms to
be composed while keeping core domain data structures independent
of any single platform implementation.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h |   4 +
 include/sbi/sbi_hwiso.h  |  57 +++++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_hwiso.c      | 215 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 277 insertions(+)
 create mode 100644 include/sbi/sbi_hwiso.h
 create mode 100644 lib/sbi/sbi_hwiso.c

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 02765777..fc7330a6 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -14,6 +14,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_hwiso.h>
 #include <sbi/sbi_rpxy.h>
 
 struct sbi_scratch;
@@ -199,6 +200,9 @@ struct sbi_domain {
 	bool system_reset_allowed;
 	/** Is domain allowed to suspend the system */
 	bool system_suspend_allowed;
+	/** Hardware isolation contexts for registered mechanisms */
+	struct sbi_hwiso_domain_ctx *hwiso_ctxs;
+	u32 hwiso_ctx_count;
 	/** Identifies whether to include the firmware region */
 	bool fw_region_inited;
 };
diff --git a/include/sbi/sbi_hwiso.h b/include/sbi/sbi_hwiso.h
new file mode 100644
index 00000000..adbeb715
--- /dev/null
+++ b/include/sbi/sbi_hwiso.h
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * System-level hardware isolation framework
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#ifndef __SBI_HWISO_H__
+#define __SBI_HWISO_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_domain;
+
+struct sbi_hwiso_ops {
+	const char *name;
+
+	/* Boot-time init */
+	int (*init)(void *fdt);
+
+	/* Per-domain init (domain_offset refers to domain instance node) */
+	int (*domain_init)(void *fdt, int domain_offset,
+			   struct sbi_domain *dom, void **ctx);
+
+	/* Before switching away from a domain */
+	void (*domain_exit)(const struct sbi_domain *src,
+			    const struct sbi_domain *dst, void *ctx);
+
+	/* After switching into a domain */
+	void (*domain_enter)(const struct sbi_domain *dst,
+			     const struct sbi_domain *src, void *ctx);
+
+	/* Optional cleanup */
+	void (*domain_cleanup)(struct sbi_domain *dom, void *ctx);
+};
+
+struct sbi_hwiso_domain_ctx {
+	const struct sbi_hwiso_ops *ops;
+	void *ctx;
+};
+
+int sbi_hwiso_register(const struct sbi_hwiso_ops *ops);
+
+int sbi_hwiso_init(void *fdt);
+int sbi_hwiso_domain_init(void *fdt, int domain_offset,
+			  struct sbi_domain *dom);
+
+void sbi_hwiso_domain_exit(const struct sbi_domain *src,
+			   const struct sbi_domain *dst);
+void sbi_hwiso_domain_enter(const struct sbi_domain *dst,
+			    const struct sbi_domain *src);
+void sbi_hwiso_domain_cleanup(struct sbi_domain *dom);
+
+#endif /* __SBI_HWISO_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ca312ee2..6091499a 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -72,6 +72,7 @@ libsbi-objs-y += sbi_domain.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_hart.o
+libsbi-objs-y += sbi_hwiso.o
 libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
diff --git a/lib/sbi/sbi_hwiso.c b/lib/sbi/sbi_hwiso.c
new file mode 100644
index 00000000..5f876b33
--- /dev/null
+++ b/lib/sbi/sbi_hwiso.c
@@ -0,0 +1,215 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * System-level hardware isolation framework
+ *
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hwiso.h>
+#include <sbi/sbi_list.h>
+
+struct sbi_hwiso_node {
+	const struct sbi_hwiso_ops *ops;
+	struct sbi_dlist node;
+};
+
+static SBI_LIST_HEAD(hwiso_ops_list);
+static u32 hwiso_ops_count;
+
+static bool hwiso_ops_registered(const struct sbi_hwiso_ops *ops)
+{
+	struct sbi_hwiso_node *entry;
+
+	sbi_list_for_each_entry(entry, &hwiso_ops_list, node) {
+		if (entry->ops == ops)
+			return true;
+	}
+
+	return false;
+}
+
+int sbi_hwiso_register(const struct sbi_hwiso_ops *ops)
+{
+	struct sbi_hwiso_node *node;
+
+	if (!ops || !ops->name)
+		return SBI_EINVAL;
+
+	if (hwiso_ops_registered(ops))
+		return SBI_EALREADY;
+
+	node = sbi_zalloc(sizeof(*node));
+	if (!node)
+		return SBI_ENOMEM;
+
+	node->ops = ops;
+	SBI_INIT_LIST_HEAD(&node->node);
+	sbi_list_add_tail(&node->node, &hwiso_ops_list);
+	hwiso_ops_count++;
+
+	return 0;
+}
+
+int sbi_hwiso_init(void *fdt)
+{
+	struct sbi_hwiso_node *entry;
+	int rc;
+
+	sbi_list_for_each_entry(entry, &hwiso_ops_list, node) {
+		if (!entry->ops->init)
+			continue;
+
+		rc = entry->ops->init(fdt);
+		if (rc == SBI_ENOMEM)
+			return rc;
+		if (rc)
+			sbi_printf("hwiso: %s init failed (error %d)\n",
+				   entry->ops->name, rc);
+	}
+
+	return 0;
+}
+
+static void hwiso_warn_unknown_nodes(void *fdt, int domain_offset)
+{
+	int hoff, child;
+	struct sbi_hwiso_node *entry;
+	bool known;
+
+	if (!fdt || (domain_offset < 0))
+		return;
+
+	hoff = fdt_subnode_offset(fdt, domain_offset, "hw-isolation");
+	if (hoff < 0)
+		return;
+
+	fdt_for_each_subnode(child, fdt, hoff) {
+		known = false;
+		sbi_list_for_each_entry(entry, &hwiso_ops_list, node) {
+			if (!fdt_node_check_compatible(
+					fdt, child, entry->ops->name)) {
+				known = true;
+				break;
+			}
+		}
+
+		if (!known)
+			sbi_printf("hwiso: unknown mechanism at %s\n",
+				   fdt_get_name(fdt, child, NULL));
+	}
+}
+
+int sbi_hwiso_domain_init(void *fdt, int domain_offset,
+			  struct sbi_domain *dom)
+{
+	struct sbi_hwiso_node *entry;
+	struct sbi_hwiso_domain_ctx *ctxs;
+	void *ctx;
+	u32 idx = 0;
+	int rc;
+
+	if (!dom)
+		return 0;
+
+	if (!hwiso_ops_count) {
+		hwiso_warn_unknown_nodes(fdt, domain_offset);
+		return 0;
+	}
+
+	ctxs = sbi_calloc(sizeof(*ctxs), hwiso_ops_count);
+	if (!ctxs)
+		return SBI_ENOMEM;
+
+	dom->hwiso_ctxs = ctxs;
+	dom->hwiso_ctx_count = hwiso_ops_count;
+
+	sbi_list_for_each_entry(entry, &hwiso_ops_list, node) {
+		ctxs[idx].ops = entry->ops;
+		ctxs[idx].ctx = NULL;
+		ctx = NULL;
+
+		if (entry->ops->domain_init) {
+			rc = entry->ops->domain_init(fdt, domain_offset,
+						     dom, &ctx);
+			if (rc == SBI_ENOMEM) {
+				sbi_hwiso_domain_cleanup(dom);
+				return rc;
+			}
+			if (rc) {
+				sbi_printf("hwiso: %s domain init failed"
+					   " (error %d)\n",
+					   entry->ops->name, rc);
+				ctx = NULL;
+			}
+		}
+
+		ctxs[idx].ctx = ctx;
+		idx++;
+	}
+
+	hwiso_warn_unknown_nodes(fdt, domain_offset);
+
+	return 0;
+}
+
+void sbi_hwiso_domain_exit(const struct sbi_domain *src,
+			   const struct sbi_domain *dst)
+{
+	u32 i;
+
+	if (!src || !src->hwiso_ctxs)
+		return;
+
+	for (i = 0; i < src->hwiso_ctx_count; i++) {
+		if (!src->hwiso_ctxs[i].ops ||
+		    !src->hwiso_ctxs[i].ops->domain_exit)
+			continue;
+		src->hwiso_ctxs[i].ops->domain_exit(
+					src, dst, src->hwiso_ctxs[i].ctx);
+	}
+}
+
+void sbi_hwiso_domain_enter(const struct sbi_domain *dst,
+			    const struct sbi_domain *src)
+{
+	u32 i;
+
+	if (!dst || !dst->hwiso_ctxs)
+		return;
+
+	for (i = 0; i < dst->hwiso_ctx_count; i++) {
+		if (!dst->hwiso_ctxs[i].ops ||
+		    !dst->hwiso_ctxs[i].ops->domain_enter)
+			continue;
+		dst->hwiso_ctxs[i].ops->domain_enter(
+					dst, src, dst->hwiso_ctxs[i].ctx);
+	}
+}
+
+void sbi_hwiso_domain_cleanup(struct sbi_domain *dom)
+{
+	u32 i;
+
+	if (!dom || !dom->hwiso_ctxs)
+		return;
+
+	for (i = 0; i < dom->hwiso_ctx_count; i++) {
+		if (!dom->hwiso_ctxs[i].ops ||
+		    !dom->hwiso_ctxs[i].ops->domain_cleanup)
+			continue;
+		dom->hwiso_ctxs[i].ops->domain_cleanup(
+					dom, dom->hwiso_ctxs[i].ctx);
+	}
+
+	sbi_free(dom->hwiso_ctxs);
+	dom->hwiso_ctxs = NULL;
+	dom->hwiso_ctx_count = 0;
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
