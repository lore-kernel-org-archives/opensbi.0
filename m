Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F2C8303C
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nXrBco+ltgeUE5vL7Y4ppuPyBQEsbNkyerVnrZZE3cI=; b=B4hLciimcVjnOZnI+dVLwVEL0v
	24/T8T/qHoBTmfOO6PmY5txG7l3YO0/x5okeZUHMXFtPuVhk2WSKUM2MjiPaQQWX47Wi09VctHLrz
	7t3mwjNS24dAy5AAyIZK1BcoGZI0+0fZxGmg8lMu8wiLaA6q4z/4+AIpoWXcN+Lr8hdlFftCS5b0o
	MfjPBhy4diWZ3W/jjd6XxVDNQNLzPf3qSwnjiWW4wFm2z9YBQVpz9CC2MJdWixwebGNOcCAeMlUPr
	Ks1Pn8mlC/bCKC9XfiNxSfpbzB93e9t+c+ZGDL62nx65S+A1bzsQBlB+eFQsKWLeoKUt/aUJf1Y3D
	QZMN9FwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3CG-00000004epW-2KcK;
	Tue, 08 Jul 2025 07:57:00 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35W-00000004dKN-1WM8
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:03 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6facc3b9559so65691636d6.0
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961001; x=1752565801; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iIp2h/WnRqPtoPawGyvpTCA3hLztkQSF9mlmLLF4SPc=;
        b=KGvb6fuulCp9eHnmh7BdjWjEQvZjnv+WtpoXIpwMd4saC7XbYd8Y8ry+upMtOltRbP
         Z0xUcqk/uxhDOfn/ZIBlbU4EchxBHe0c8pTemyjx5sY6vpItRLrfNdV5H+1/VrgfwWFU
         fZApL2kcNynvmofOWhoc67W4tC7ZQd5VCzlN3fIf6YL83glcpSQ7UoIw6K/c6QJcy8XU
         9ergP0F1J8Jun5HtOI3tbpVENxyAweGTkRzMpwqNfuNmPyvyStTzJIIcfFagl5DqqgdV
         KCoTN3zbt2cJhl5TLRtjjiAqh/0R8voqfjqH2yeGzrQOj1DtBx5XmJndL2It6Aev5h/q
         5DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961001; x=1752565801;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIp2h/WnRqPtoPawGyvpTCA3hLztkQSF9mlmLLF4SPc=;
        b=JwIunD40rM9DoZnFLajy6LphuQ7FVIXAmfFCViacaQH5KP9jUpbakMdu0pLNPOq1DS
         QzUZS/xVQmr1ewAzNkBT1vcbNnvAxOgboy6eJXnQQtTqtW5/XP3xf7U5SV1KkEuXiLis
         rro991pWlaVeUXocq9bIzxDsQIeO7SbI/7CDtyVEHwMIS/rcAlU+ACRtkuNgrqHU9gJy
         Jj0wOdqVBuT5oJT8XUvk4hw4xa6mqgbBEXWzj1ZMwiPI5Nj47UVmgxl1KRi6j2o0mmvR
         jpsSBjmSriREX1Mqqfyp9qgEaquHPntLXiDTN4Dduc6JPF1CJFHm5r5McrPr7PJge5o4
         Di9g==
X-Gm-Message-State: AOJu0Yw+99vDMdzVtETD1BWK3T7qh0keX534P2lq5duum9dBDH4/vD5v
	N0nbig0R4Be0AmXStTVgh2RMjNTqx3b77VHxtHhEi/K61dOIxuzkiciitwox2+wHMGZnSOxhGnS
	jZEQv1sXdxXhTB+GEhvRH2fuzDcJdJlrNz4RZf8fOa3p357FND8NZ3VNhaPYWO+7BO1rxN7CeDl
	bSxEU2qxxLiwN6JkgAUj8U516nzWybe5gnFDhfUQKEIXdx+w==
X-Gm-Gg: ASbGncsbBzhvQqK1IdD+kyJ6ey4Ol3s9/s9n3mCsf7uJyVhNmd2fSYbddPK/9YLmFCS
	fHxyhoCRknc1esMZfuB7TvHgdwsxuuiLtMTE2zQY1qmCxvydLJQRwgP5QsY4EUPnarzn+pK3/em
	NTqNqcyOnIlRl6N5eJGM5v6trvEn5ZlRYiPoB5nOgjnR0jF5sJM5rKak2pBY9pGlwGJFfLCxvGs
	lnE0OxMpzg30qvQLwTgjsMkuC/wklFvs6FqxmkuxN8y4EBCI5H6oHvaY5Hwm4QHHMijBo4/asa8
	rYzQTmgUGd3U/PSiJdPJ8cQ3R0oxFf592Lh1aLzreOKADdi6aSAQT0zQxn4MRfdGHKLPosf0uSl
	9MvYX3qZHqt9UJ17mY+Y=
X-Google-Smtp-Source: AGHT+IHHY45i8Q6HuRkFQmTZ6VunyizWGLN8jC9Vmttbr4fGSIxYoqmm8n00LPU6wUSZjBd85LLryw==
X-Received: by 2002:a05:6214:3c8a:b0:702:d8de:ec3c with SMTP id 6a1803df08f44-702d8deec45mr167692056d6.37.1751961000629;
        Tue, 08 Jul 2025 00:50:00 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:00 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 03/12] utils: cache: Add SiFive ccache controller
Date: Tue,  8 Jul 2025 15:49:31 +0800
Message-Id: <20250708074940.10904-4-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005002_408954_A285CDD6 
X-CRM114-Status: GOOD (  21.71  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
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
---
 lib/utils/cache/Kconfig             |   8 ++
 lib/utils/cache/fdt_sifive_ccache.c | 175 ++++++++++++++++++++++++++++
 lib/utils/cache/objects.mk          |   3 +
 platform/generic/configs/defconfig  |   1 +
 4 files changed, 187 insertions(+)
 create mode 100644 lib/utils/cache/fdt_sifive_ccache.c

diff --git a/lib/utils/cache/Kconfig b/lib/utils/cache/Kconfig
index 10602176..1c7abdc9 100644
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
index 00000000..ad7511b5
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
+	/** find the ccache base control address **/
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
+	/** get the info of ccache from config CSR **/
+	config_csr = readl((char *)reg_addr + CCACHE_CFG_CSR);
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
index 2fcf9666..a343eb8c 100644
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
index b5a7993d..6b219cfb 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -8,6 +8,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_FDT_CACHE=y
+CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
