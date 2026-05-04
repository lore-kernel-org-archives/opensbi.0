Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95D6FF885A
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0X9mFozXvoCWujgiu6aPiLnqlja9dInq5sfk+qTUlUI=; b=MMYYcY+upGlbHZ
	+eqMoov+xn39lF9dFLrygfQrCzlhbjWDsEjzPnWU/4G6k32+VAhWyzcWwZu3R0w2/vTyBdRyrGto4
	/DhywaBNY348PlFXkk6XpIPtV3vLtUZ3KP99vQmsYcAgxp8CjqyNwNI5eO9izSzsOlOmMKM02I3F/
	PAU7vioZG0rbVVr7/w5oCoHpm3cZ/umMqsYajIHk2l7fSrip95sb4ONRQ9U9HOCu6jO3BxquigT+v
	wii8VJs4PChkMCrWuFQRNfEbY/IE4dinfRrch8htGDvPSr3kzvb01iGycCXaypyyZpeBFXCpBX++n
	AgewA2V22rC8eJpVfBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxGy-0000000DsMw-0QA8;
	Mon, 04 May 2026 17:40:00 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxGv-0000000DsMP-2YCY
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 17:39:58 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8ea8563c693so492794785a.2
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916396; x=1778521196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+sczns6rT7k7ZTW/Xsza1s+PRjeYUk9UDOHXCSrsbc=;
        b=DkLH12ljEammTnVG1nukNHi9fWeGYUYh8/TF+91mqNibGQKhdDdQUCuLK2RbDJc9ll
         6E05lDFzE9dwTJ1dZxRtyUBQt1gGgxhVleHTl+KSWi0lu35/yOaCJIY+UCAZXoSymbbR
         49tAL+fRzKi/hc+8iVg7rZXtqCRVnQM9wVysYscpxHpnMSoum4EFzK1L3P093ZZFte9z
         QsibTo89F5ed+z1v56fl7LbwtcNrx4+eKomlkx9FsAElK/z4ciCzkr3g9Eucmt3tNYy2
         ywSaYVItD39u6X/ty9JcI2QNvYRuLiZ5fYi5/tibklLylTIS/Pigi2dNMYGwL+CvIYsD
         XnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916396; x=1778521196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+sczns6rT7k7ZTW/Xsza1s+PRjeYUk9UDOHXCSrsbc=;
        b=NB0T2cECZL2czmA/bPDdWAhg1Sg0kl99plCHtusdyrTmzsyJhkTpqBCGoV3taOuULG
         pH56RL0ZgFvDMdAmic1nVtLzJQxsQEyNSU8QbZOPn/qINEUv6zL2CXGylxVoR5JeB8gA
         mCs8zCyCRIzkhrtNefJBd5Nbcis+wxpRCAtXnquleOysNWzJ8S8twFjWPbsytEg3UDoy
         yxRACLQgKu589Q0qnEeJ5CKiQ2DFk/r20Bxq4hbR9F3Vnibxpym2RrrBeD5TMclNIRmq
         iIfB0BjyJXLUt3U6AQNL5XoWaI0bqLAAN3zKFLMfy1OtJOdf43pCl5ew0E/qRtxniCEP
         X/EQ==
X-Gm-Message-State: AOJu0YwwSPiKLGH1uPZ0HL+LCTuimekFolIjgZOurYjGXSvLsHdS9wDu
	g/vSpOVGGofL6E/fnEKUhWp/OHB4/t7uphY1AlszDHa0rYajcpVKvza7oCPw/FBxA88=
X-Gm-Gg: AeBDievsSjQOH4nICSrFo6uPwwMVlf6/L3W+1UcNgQxei/ZToo7SniTenKCBlHbyq1q
	S9mZL747zCPUYoQMWY5TwmXjpYBXzRbgpfX9q4JR9QOg13mfWtUMf+URKWQe9ooPGn85DsyKbN7
	fP9AJN3ui2PzWl69K4aUemy1Jz9X7amDW+n5VCTMCbwMLy8cUSPU8qk9hs0X1LzR/zPBs6bsZqo
	JuUn7EmTRToVIdsTTJIpzBUvQ3jywiLlpL+wNU5cuJHusaArewR0vrx/x+MLoYDC9usLXSeQhco
	YZHBetYQpmCYP2H902U2DKmZSse7RHNItAh7N7yUwYQY+e7nUAV7gYsjP/W6aainUxnkzAQfCgV
	teLGVNyLfVELTz0dBOeLs+7FY6JJiYYFLpRrqjeAD9syutTvKoYAV+lUmFTX0jkO0u1xRVY96Ez
	Bl2tvpT8noNHmfyhMpr+UKvSsEKtNrFzvxW2dOVU/pMB3MzbHJn4BKMzyG/ZYyouKPt5WDBeLN4
	j7tVc9DNMpvxS+cMCDVow==
X-Received: by 2002:a05:6214:45a1:b0:89c:d7e3:7f01 with SMTP id 6a1803df08f44-8b669ac57b9mr174953506d6.48.1777916395974;
        Mon, 04 May 2026 10:39:55 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5395c5b4csm128087586d6.16.2026.05.04.10.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:39:55 -0700 (PDT)
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
Subject: [PATCH 1/2] sbi: add hardware isolation abstraction framework
Date: Mon,  4 May 2026 13:39:47 -0400
Message-Id: <20260504173948.1663823-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_103957_671252_999C4272 
X-CRM114-Status: GOOD (  19.98  )
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

Introduce a generic hardware-isolation registration and dispatch
framework for OpenSBI domains.

Add boot-time init, per-domain init, domain exit, domain enter and
cleanup callbacks, and store per-domain mechanism contexts in struct
sbi_domain.

This establishes an abstraction that allows multiple hardware
isolation mechanisms to be composed while keeping core domain model
and data structures independent from any single platform
implementation.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h |   4 +
 include/sbi/sbi_hwiso.h  |  56 +++++++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_hwiso.c      | 175 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+)
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
index 00000000..1efdb8c1
--- /dev/null
+++ b/include/sbi/sbi_hwiso.h
@@ -0,0 +1,56 @@
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
+#include <sbi/sbi_domain.h>
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
index 00000000..6c96dc3e
--- /dev/null
+++ b/lib/sbi/sbi_hwiso.c
@@ -0,0 +1,175 @@
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
+		if (rc)
+			return rc;
+	}
+
+	return 0;
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
+	if (!hwiso_ops_count)
+		return 0;
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
+			ctxs[idx].ctx = ctx;
+			if (rc) {
+				sbi_hwiso_domain_cleanup(dom);
+				return rc;
+			}
+		}
+
+		ctxs[idx].ctx = ctx;
+		idx++;
+	}
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
+
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
+
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
+
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
