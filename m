Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3E3C369D5
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yQ/KF0gpX9OqTqNzX/d9Bax9DVXv39qpIvmp52FX26Y=; b=N/qC5BVADkfL3335HkOWPrrQMr
	LWOL58LHBaiNJ8p3t6z1ryrSrv8GRrxKdzB8ca+wmx9Gw5rJ8T3Tbw6Zr66f4e7m7S2uuP5kt1PTo
	wdTWV3kBuIK0lr7L/ZoRrSTD8pnd0NkZcH4jmWIGOsBwbveyEIpu5+p2TDfbxejU1Cof9O8Of4n+M
	urHu6KNbf9t9RDHuRk8TFTD+hq9WES+LtKEXqaUmTGD2GBv/dClwExGYKD2luQ1s8bIcmrNJzfui7
	mXjBZPUBnNqsRN1WiKhVLJXxXYIvYn8NBnCHBHhME3LcAxehmESrYQJ28l503tGGxTLKzB5NZuH3X
	6VS3JA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb9-00000003hce-2C38;
	Mon, 21 Apr 2025 06:25:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kb6-00000003haR-2dZH
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7394945d37eso2941407b3a.3
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216739; x=1745821539; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHl+N7OmlLRtH9/ZVcquYyeJS/zVq5WUec0IsJ3BM6Y=;
        b=bVMrVbzPuQhCV5Was/BvOg4TiMfkIlql2BGFmEQ38fov6SX1V6iMbeqkKdkKkw5DZr
         VUCkZmSVip6qzs6DchKFKUH1wEKnh7jE2LboQEaoNsam2vLXu6ZsI8MC36DyDDx5ZONQ
         wQpJZxh8PKRoXUD60FRJDLwglaGrTPRzYWUrSUhFq709SFLTLDVsyYi0FfMXtsB7lFWs
         rID0QVXYO3PgXr3wSRY0HrarBJ1/8HPFrs+irLarfOwnDG71ZKYsQdTXnTODUZCTN4PC
         ZzO+8nmRcGp2Q+BV8Qs7gG6kwr2PzuRDPyGbHmMP1G/KXEcGeMq1KGNS+ZAnPlhBRgJF
         LEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216739; x=1745821539;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHl+N7OmlLRtH9/ZVcquYyeJS/zVq5WUec0IsJ3BM6Y=;
        b=nnaWBR82eKJVtjMyl6rL+kVyHRRxR0weWZKR4MMR80eCgnwrkZoNAREZZObNePT+Ep
         vW40VnGXJMNeMWzYZcG2cWpe76+MEGwLhlf7IXonwhayRUQZ37WoyQLXToddNjfOxcWj
         u6IVoCmJVXL9pXkTLsqtjToMnIXZ+/BN7rfojBB9l/KVLRpCBdlfPjDYmgtnMj/I5ve1
         V6MdjdJhtr0/CRl3WB71iOarsGz6ExCpMI/xvi76c/Zr+l4KCCaDuEGq+MDZbG7VH2Lw
         PztD2SsQKwbICt/d2k6zjikxM6f18EBq+k9+sQDWOv7+A4OjJ0R0TkRTJU55jx2FhXGc
         d6rg==
X-Gm-Message-State: AOJu0YytNkfbw3iaC6EbkwFY8XzkB21fu74X0sTg69RlLm9h7aU6cF3W
	daD1CLdOVXrcnmskNWpXsqZik0iDaXAnvqbho2FwhulgxpSlJ9HxH9ohelRXvXgKb/gqTHACpAW
	vKXxAn7KwXfCTMwZuqH3cTzdSmVfvfb6dWs72PH78GejtXa953k2btBPyH+byluk8b2c0nbDh/8
	jQBKGmveH7vLBZ8av6oUJjwqAvsHYG6JYYcizFG7Mtag==
X-Gm-Gg: ASbGnctrqXuGI+NjV2bA7YLG7kscFTbR0zNfqTbHQbmRWTlLfx4eRRpbAFXRKs6zQgm
	P/KzfMq3B1g3vBSfK22CMjaDYsvnpciZzvzpPPpL5NYSQpjI+f/bHUaRrWAO1c8gPANk6GLCSFn
	SHBamOWwVkSYOP83M+i6r7Xe9Q90VuM04+WrdkDuzvA/P0zQ0RU4Qdd1IO0BX2l3Rn8lwfA3YUJ
	soh4uy0Tl5PReaSY1d4NU5K6uRdZFkCs6dBdaRQDAq2rTsLV2GwluO7qt3hCSA8mV23xVpi/OWK
	XJAhAMxr0pXYP0VDeKXZEHkirgShzkEC8soKojWthtWvFLYAAid4VAcTVOKj8DzTn/3NjFqYpA=
	=
X-Google-Smtp-Source: AGHT+IFrBQcpAvA+EVnPhk5mA5LRRdnlkrmImWj++E4yDwVfEcQYInYGAA4hKlixntLo/fGbAR+n2g==
X-Received: by 2002:a05:6a20:ad0c:b0:1f5:9393:fd4d with SMTP id adf61e73a8af0-203cbd1d3edmr14875786637.27.1745216739311;
        Sun, 20 Apr 2025 23:25:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:39 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 3/5] lib: utils/cache: Add SiFive ccache controller
Date: Mon, 21 Apr 2025 14:25:06 +0800
Message-Id: <20250421062508.21187-4-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421062508.21187-1-nick.hu@sifive.com>
References: <20250421062508.21187-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232540_671253_0DBF3FB0 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
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
index 7b62faff..09807207 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -7,6 +7,7 @@ CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
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
