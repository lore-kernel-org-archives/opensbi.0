Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC931CCD199
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swfWjPRN2jjYW1LHKUUchm8z2v7h7F+4eJqgeiraVdk=; b=mCkJoAroAR81BP
	dHsUnJzakEbJDGl79+HoMk8xuSVyHyXKQ2NbY7cKOt9y8Z6xq6kiGDfYpm/Ycyo9ZuBGXn5JwK4pK
	x/9vrq/aGhjvpVToj8GVl6JZA2/RQJXzuvNuy6t5sFW7JgixQmsrgtg95LHE5OpCAxqCuXhSMjx8F
	mbTWJInCLlw6q6LDRKboQrUcGc9Y7DlczZzLlZsUXh6aqKqRgtViTSE6A5qu91Zl4CM0aosgmIjd3
	KD8ib5uH+qTk7JLZvtJao+6rzRrRFfSmxyTg2wiWMkidMTjuJDY/4P86CQCxXeEkCrxIWVegiyVu8
	256Kd3o2Bo8exT5EP8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM8-0000000C1vC-48JP;
	Mon, 20 Oct 2025 06:26:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjM6-0000000C1sz-2skD
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:55 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-77f343231fcso2621155b3a.3
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941613; x=1761546413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRLBP5tDOfxeaYVSYD5ThI+APX9Eacl45LDVLBk1O1E=;
        b=DlbwlL+kGCOIar5TAeHgRIQ9f62dTgmeFPk2tYkwObVCvupXsP6+ykyaZESNqpWSvM
         jBAC1sqyoyS2I8MRloBc2mcTDOTfaplw8bikVD0JSFAciWacMlvcutAOQnJyJnaiwsX1
         UJhrrjwsPd4nW2GQ2IVcCOt1FNz4VKXXJL63L4ENhvxXeiHIhfEKvMI2LGUnVzVLg2rv
         WqzpzUyDsA5iAnZssoejPBpkthuC3vSkZYEj2sl99PPru0/lGk798C7P/jGyRok/uw1P
         l4fmvbFDu6ba4qECEaVEYyZ10eve1UnMhytBV8RbZF4XwjffZddxROr7/nFGK6ZdJfvB
         mVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941613; x=1761546413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRLBP5tDOfxeaYVSYD5ThI+APX9Eacl45LDVLBk1O1E=;
        b=XZMrWWDlFvDxv9V68CDzcdxlA4uq5S1h9Kaijml9r9PoPnf7PO824EIvPnNhgLd9J4
         M+Tex/pU+yQCdvObUfo19O4epQcFXOF9BpMTw5a/KAy+AxXMbb9XhGU+YZcbupqaXNVL
         fD5p45Ar3shlfyM6kSCJdkxX4iGSaQOBd3G9pQxp4pj4wFuTQkNJGKMvlfWRFxBYa9SK
         jSyNlEvGMeSZfEu/gpfkKdzeWJW0k4efkSBtut0JG/S/euzxU6HsxVIXSAFpInMF8gsK
         VRqXc1ISHISiT+RhOkNoWn6rFfIAATkOcDmbPiSL2fwsqfEUB2aGFXXEmrCINofoUtKn
         qnug==
X-Gm-Message-State: AOJu0YyVCc3omQu+2xEIQceFScGGQFLkt/NmUjWeo46cMOCEg+qPzDCU
	Mc2exh43m5tDwxqv8N2p3l60KoVXW1jhM4ntV1R+bG42SFOnHlVOWaz0zCkjcwWpfemSN6jvrR+
	5j+fyLlhFq59q3RCOSp/j6NlaXtbcU7MAVwJ2zRlwR7J+yqA7mXXCBAxy7rB3zZpw7V2Dnq8RIN
	MINcecbWSIJZS6XKFddm6rIfPg9tYGoGTeUfZcTDNgiGaWIQ==
X-Gm-Gg: ASbGncvaTl/F3CptpQLMLIul95jiytyBG8kG2e8JgIrJcKbImFAWlnlHUoddaOX2vpF
	EDl5Jy6o3G3tRi3v72TgSJL3VXwmWGDa9tDKAygDnhLuk1DlvZ+UN8HEY06RfLTpeLRYcJ5SYlo
	XNqr4aLvMCKIC5t8a+J7iwcCF4LKHNM3RQ5PzgIyBf8G2Zd3aifiZ6LNTUeOUpQYS3qWBLui2av
	/js3NJ4DPUu5w0dtJYJ3CgepBjLYsCBhR3mF6ZFGVv9yWNNlqauCC+hCOvHYPB1RJlT1xTvlwBF
	vu2vc4UfpeS1hIXYxIsmtSe0y9Ldma/rJSSgLuHT/nOGi0Jk0hFF6SODmJh1ReU4DPyURUXRpzW
	Lx6OJF9aNPanP1wu7S2I+eu4b0is0J8m6khmgL6VEFd3bDL57/bnb2DokVvNw98J7jcvjokQnDV
	oJhUkzS9106yJrkscWx0s=
X-Google-Smtp-Source: AGHT+IGcU0UX++qAPrFWOhF1JC6PRLdE3B7tn0cpeWP5nagBGxMShLeXHIb2mAxMZsWXak0YkybD4A==
X-Received: by 2002:a05:6a20:3943:b0:24d:7926:bb29 with SMTP id adf61e73a8af0-334a85151bfmr15106958637.5.1760941613357;
        Sun, 19 Oct 2025 23:26:53 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:52 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:05 +0800
Subject: [PATCH v7 03/12] utils: cache: Add SiFive ccache controller
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-3-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232654_757621_D67BD0EF 
X-CRM114-Status: GOOD (  19.79  )
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

From: Vincent Chen <vincent.chen@sifive.com>

SiFive Composable cache is a L3 share cache of the core complex. Add this
driver to support the share cache maintenance operations via the MMIO
registers.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/utils/cache/Kconfig             |   8 ++
 lib/utils/cache/fdt_sifive_ccache.c | 175 ++++++++++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk          |   3 +
 platform/generic/configs/defconfig  |   1 +
 4 files changed, 187 insertions(+)

diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index 106021762f33229e66bf91c648c3c9febc4d325c..1c7abdc9ad93319569807b4e25623cac871c6ce3 100644
--- a/lib/utils/cache/Kconfig
+++ b/lib/utils/cache/Kconfig
@@ -8,6 +8,14 @@ config FDT_CACHE
 	select CACHE
 	default n
 
+if FDT_CACHE
+
+config FDT_CACHE_SIFIVE_CCACHE
+	bool "SiFive CCACHE FDT cache driver"
+	default n
+
+endif
+
 config CACHE
 	bool "Cache support"
 	default n
diff --git a/lib/utils/cache/fdt_sifive_ccache.c b/lib/utils/cache/fdt_sifive_ccache.c
new file mode 100644
index 0000000000000000000000000000000000000000..b641ed163421bb046c70332299defaa9675b62f5
--- /dev/null
+++ b/lib/utils/cache/fdt_sifive_ccache.c
@@ -0,0 +1,175 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/cache/fdt_cache.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+
+#define CCACHE_CFG_CSR			0
+#define CCACHE_CMD_CSR			0x280
+#define CCACHE_STATUS_CSR		0x288
+
+#define CFG_CSR_BANK_MASK		0xff
+#define CFG_CSR_WAY_MASK		0xff00
+#define CFG_CSR_WAY_OFFSET		8
+#define CFG_CSR_SET_MASK		0xff0000
+#define CFG_CSR_SET_OFFSET		16
+
+#define CMD_CSR_CMD_OFFSET	56
+#define CMD_CSR_BANK_OFFSET	6
+
+#define CMD_OPCODE_SETWAY	0x1ULL
+#define CMD_OPCODE_OFFSET	0x2ULL
+
+#define CFLUSH_SETWAY_CLEANINV  ((CMD_OPCODE_SETWAY << CMD_OPCODE_OFFSET) | 0x3)
+
+#define CCACHE_CMD_QLEN	0xff
+
+#define ccache_mb_b()		RISCV_FENCE(rw, o)
+#define ccache_mb_a()		RISCV_FENCE(o, rw)
+
+#define CCACHE_ALL_OP_REQ_BATCH_NUM	0x10
+#define CCACHE_ALL_OP_REQ_BATCH_MASK (CCACHE_CMD_QLEN + 1 - CCACHE_ALL_OP_REQ_BATCH_NUM)
+
+struct sifive_ccache {
+	struct cache_device dev;
+	void *addr;
+	u64 total_lines;
+};
+
+#define to_ccache(_dev) container_of(_dev, struct sifive_ccache, dev)
+
+static inline unsigned int sifive_ccache_read_status(void *status_addr)
+{
+	return readl_relaxed(status_addr);
+}
+
+static inline void sifive_ccache_write_cmd(u64 cmd, void *cmd_csr_addr)
+{
+#if __riscv_xlen != 32
+	writeq_relaxed(cmd, cmd_csr_addr);
+#else
+	/*
+	 * The cache maintenance request is only generated when the "command"
+	 * field (part of the high word) is written.
+	 */
+	writel_relaxed(cmd, cmd_csr_addr);
+	writel(cmd >> 32, cmd_csr_addr + 4);
+#endif
+}
+
+static int sifive_ccache_flush_all(struct cache_device *dev)
+{
+	struct sifive_ccache *ccache = to_ccache(dev);
+	void *status_addr = (char *)ccache->addr + CCACHE_STATUS_CSR;
+	void *cmd_csr_addr = (char *)ccache->addr + CCACHE_CMD_CSR;
+	u64 total_cnt = ccache->total_lines;
+	u64 cmd = CFLUSH_SETWAY_CLEANINV << CMD_CSR_CMD_OFFSET;
+	int loop_cnt = CCACHE_CMD_QLEN & CCACHE_ALL_OP_REQ_BATCH_MASK;
+
+	ccache_mb_b();
+send_cmd:
+	total_cnt -= loop_cnt;
+	while (loop_cnt > 0) {
+		sifive_ccache_write_cmd(cmd + (0 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (1 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (2 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (3 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (4 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (5 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (6 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (7 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (8 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (9 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (10 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (11 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (12 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (13 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (14 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		sifive_ccache_write_cmd(cmd + (15 << CMD_CSR_BANK_OFFSET), cmd_csr_addr);
+		cmd += CCACHE_ALL_OP_REQ_BATCH_NUM << CMD_CSR_BANK_OFFSET;
+		loop_cnt -= CCACHE_ALL_OP_REQ_BATCH_NUM;
+	}
+	if (!total_cnt)
+		goto done;
+
+	/* Ensure the ccache is able receive more than 16 requests */
+	do {
+		loop_cnt = (CCACHE_CMD_QLEN - sifive_ccache_read_status(status_addr));
+	} while (loop_cnt < CCACHE_ALL_OP_REQ_BATCH_NUM);
+	loop_cnt &= CCACHE_ALL_OP_REQ_BATCH_MASK;
+
+	if (total_cnt < loop_cnt) {
+		loop_cnt = (total_cnt + CCACHE_ALL_OP_REQ_BATCH_NUM) & CCACHE_ALL_OP_REQ_BATCH_MASK;
+		cmd -= ((loop_cnt - total_cnt) << CMD_CSR_BANK_OFFSET);
+		total_cnt = loop_cnt;
+	}
+	goto send_cmd;
+done:
+	do {} while (sifive_ccache_read_status(status_addr));
+	ccache_mb_a();
+
+	return 0;
+}
+
+static struct cache_ops sifive_ccache_ops = {
+	.cache_flush_all = sifive_ccache_flush_all,
+};
+
+static int sifive_ccache_cold_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	struct sifive_ccache *ccache;
+	struct cache_device *dev;
+	u64 reg_addr = 0;
+	u32 config_csr, banks, sets, ways;
+	int rc;
+
+	/* find the ccache base control address */
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, NULL);
+	if (rc < 0 && reg_addr)
+		return SBI_ENODEV;
+
+	ccache = sbi_zalloc(sizeof(*ccache));
+	if (!ccache)
+		return SBI_ENOMEM;
+
+	dev = &ccache->dev;
+	dev->ops = &sifive_ccache_ops;
+	rc = fdt_cache_add(fdt, nodeoff, dev);
+	if (rc) {
+		sbi_free(ccache);
+		return rc;
+	}
+
+	ccache->addr = (void *)(uintptr_t)reg_addr;
+
+	/* get the info of ccache from config CSR */
+	config_csr = readl(ccache->addr + CCACHE_CFG_CSR);
+	banks = config_csr & CFG_CSR_BANK_MASK;
+
+	sets = (config_csr & CFG_CSR_SET_MASK) >> CFG_CSR_SET_OFFSET;
+	sets = (1 << sets);
+
+	ways = (config_csr & CFG_CSR_WAY_MASK) >> CFG_CSR_WAY_OFFSET;
+
+	ccache->total_lines = sets * ways * banks;
+
+	return SBI_OK;
+}
+
+static const struct fdt_match sifive_ccache_match[] = {
+	{ .compatible = "sifive,ccache2" },
+	{},
+};
+
+const struct fdt_driver fdt_sifive_ccache = {
+	.match_table = sifive_ccache_match,
+	.init = sifive_ccache_cold_init,
+};
diff --git a/lib/utils/cache/objects.mk b/lib/utils/cache/objects.mk
index 2fcf9666592700ff7c1fb924c5b9ea2de722fc2a..a343eb8c4bd495a1596845c1fd02420277023430 100644
--- a/lib/utils/cache/objects.mk
+++ b/lib/utils/cache/objects.mk
@@ -7,4 +7,7 @@
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache.o
 libsbiutils-objs-$(CONFIG_FDT_CACHE) += cache/fdt_cache_drivers.carray.o
 
+carray-fdt_cache_drivers-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += fdt_sifive_ccache
+libsbiutils-objs-$(CONFIG_FDT_CACHE_SIFIVE_CCACHE) += cache/fdt_sifive_ccache.o
+
 libsbiutils-objs-$(CONFIG_CACHE) += cache/cache.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 7107e225cdd78287a296ca898c33659ecc89c969..86decbd0755e74c658b23e0097d103ded25a10d1 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -10,6 +10,7 @@ CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
 CONFIG_FDT_CACHE=y
+CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
