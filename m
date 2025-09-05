Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57898CA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNvpbMc5SYYZiUfakarJOUTbQwwdApL7cGXb3xqSq2M=; b=A4cJmuZwxdgJD8
	wAgJJFarC9+kCwH8hI/ehSOLgMl4eh5rAL0LjYFmxOfNsk7oSQ+EXqj2ZUze2vSNdsgXYCqxgvHXr
	6lspDu+5kXbC9Ufqw/aY+nt0BvBf7CO0g0x1YMlksGsyBkC6GyrHaYMa3iuAhLBvcFgBg4GTMJ1yo
	CnkD5lc8VqcarUaCI0ifspz4cEqlgeJU1Qjvg47FCutBohrlXdrEp6ovhE3nyX0+4vyswuKLmX8yu
	ZddvBIKzR5I0h/OTlqUV0g//twHPDHLKznmXigsjWczZDXPqv+K+523T5azkdybthBa3Fi+s9d+A+
	zEP6c1gSJlX+yGWTYzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7j-0000000G7mI-0TiC;
	Fri, 05 Sep 2025 02:24:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0C-0000000FxdV-35Ce
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32bb1132c11so536576a91.0
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038596; x=1757643396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyrYI7VLvkKtbt+WBUos9vxjgoNg2+WoufOv+/wqKSM=;
        b=mwPE8uZijcH54+ffiw+A/ZM2m5jjm5qOnzWnn/ODV5c5P8PWqkgSYz3ppGsVWrpdxt
         DMkpb4B/YRIwj4M4+FtJnSyis2Mybc9GeEd2sGLKlKuiEnctqJbZB5DnGC8rptmC6Uky
         mC8J7kF9U0SpsQh/nUCnV813mbGNcCkm58E+LiQbZi3+CevCQ4d2dY/DgAegTWoHTpl1
         qCAJy9a1A68uaVL/qegijWMDnFGP258i6GDqSPCJfRpL/JQu7Fm9dJkpQxufIqa6ccyp
         o1u9S2TNyj2ockFV0As3CBwI0w7kq/1b8lqVXB9HSV608UeAVxdpcVQrGhYgjgTdSNqY
         StLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038596; x=1757643396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyrYI7VLvkKtbt+WBUos9vxjgoNg2+WoufOv+/wqKSM=;
        b=Lsv50QK/HIpT976Xi1olcOUb5IpFLIFKxR0I2K05FgpJeQEuFvEGtgdhTwXJKkMbdi
         5sqhA1nI4sd3pKIBknpbUiMfNVw2wQyuyUrb4l4wLmzZFQnrOIV25T33bxC0zahVTvzS
         P0HB8IPOKBwKPYH+pvEtXYj4EGrnURSr4pyTVGtX7ewqRP70DGRv48WZqOwgM6MYWvDM
         oYd+PfQNmcU8DMV3UOZ3zk9vxx+gfWBHGKMJxMLbFl9x96t0oFxX4lpF4R0ZrLLAPVa9
         K1ZjLsyrGIxI20tVTLt8Qqhw5oSqVIffm1/86jRZ9QfBrjS++LFxyxTnC2oJyj5F6/4g
         pmqg==
X-Gm-Message-State: AOJu0Yw7lULEqHBMdvWScF3FfJksbw2I5NoJ/MLsn/PIA1QiCECv+a14
	mVo8Vw40cO9TfTNrIc1q2XZc2NgNxV6amjb9hwNQyPaXqGHTsj+DWPPUkXIVHQGlnV8=
X-Gm-Gg: ASbGncujvHSh1yoONs3EdfVbq1BevoLw5YR8aRRbpSdwyh+yzFbx1mgQYBkYZ2+9qNp
	HxjzJcVmHts+wMfy2JeJ545zIVh9FhXMHg8Vg0JIjiTa9CRT299UPHkyg9wNnsg27iXyO7pP2Ub
	h3JfK1aFXncfwsXtoA89IQdIFuy9ULKq0Tbi7/HLY5zSb4vONxhJrUfEIN6BZHLbaDZ46Jur8uN
	Fn2hZ6IJhykg9eAZYoXB4BYNk+KO7LbN8wluO0LQxfwhfWBtmJsCtaDBnQD5HMS/68iYYEf2/F+
	DEoLjC8+hANGWj41zjHtPyqEoFexKXzrpOWtF3aHiwyQvk4rv5NUuBTiDBzBPOXYgHdLK3A2mwW
	hBD5DM35qy0B47OIHzCikNouyGrvYVdxCtaPDVfLovQ==
X-Google-Smtp-Source: AGHT+IHuvCOs1LvoZ3g3kK/GS22cAtYtM04NFOGF2DSOu0hON6VfgZLOrneJl620rhcrS6bOXeu4YA==
X-Received: by 2002:a17:90b:3145:b0:32b:b3ae:d38b with SMTP id 98e67ed59e1d1-32bbd15ee47mr1908809a91.8.1757038595627;
        Thu, 04 Sep 2025 19:16:35 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:35 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:36 +0800
Subject: [PATCH v6 03/11] utils: cache: Add SiFive ccache controller
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-3-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191636_779023_96D97D1D 
X-CRM114-Status: GOOD (  20.11  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>, Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
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
index 6470a511fe216b8bba1feb467738eb871f5738d4..f782e57df24674578bc179b949a621a6d522f1c8 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -9,6 +9,7 @@ CONFIG_PLATFORM_THEAD=y
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
