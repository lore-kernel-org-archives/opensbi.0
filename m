Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D76CA1007
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z88afM/3JgUbCv4+Szb0fAGGs1b0FY6UC+x83BNzQLY=; b=Y7x5FM2F5iRinQ
	tw5s2Th6Hj6TrvnkH9gWQlrIaFX4oKPZzalGm53XKA38YRF3pDC+rWh8oMoJAuuTpjcbqgqVafDfD
	pPc5yFpqF+8UZxGIngbabJ8UefI5wujNsWR5SN9qJKu7YcUTxghTlBZR6wHzFzN3VxiUpuVouwYIn
	l1ZZ2EpuqLakDLEO5MA4I6XaQv6vL6EyLKNvKhbn7NSGlBkl4GYCNqVd2einF2RFmIWOW4McwHnVh
	jsaAmgf0HCcb2SB76Xrp/z5zWRdxN+88dOEK6W1oAn7IF3n+TSwj5TU1YQN8mAQUKLj7MDkdUf3Xc
	zSYkfc7TXGDQpHBI7yTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbz-0000000Epg4-0LAk;
	Tue, 02 Sep 2025 02:19:07 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbw-0000000Epdy-29jn
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:05 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b49cf1d4f6fso3348347a12.3
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779543; x=1757384343; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdQj9Zi2kQt6Z2mPApB++4LsdIO1QbCB2Odpv4YE3VM=;
        b=l+gNq/WMkdW9f4Tm31RKKYTXrBSlriS0bVs/RQCzH/ILTvsE4awdH5cRv5UDwSHnIU
         EAuxh6MIbFqrqt2ub7MmKaHguz3fuZ8+mtU0mJrXDe49OCLLzlIRIk1R3sdt3NreRp84
         PxsbcysnsLOG69nTFLxHDYlBTwPgqZxOIvtYYV5Qa+JrJs5jWihPs0pkq5W8P1+5A6S5
         Sl2cUvk6DDEpcXID1S9HH3fvND68mIT9C9fC6jLocf4vTfIgwupR98pmeoGPN9V4vIZK
         vhobCjw/z/QW8yj7bF2P0BBIXc/zJY10CDQr3tJ9JHWhSo5/5RJh0RU0vOj1k1MAycGI
         a70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779543; x=1757384343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdQj9Zi2kQt6Z2mPApB++4LsdIO1QbCB2Odpv4YE3VM=;
        b=R2kx9AXVfLlMpnGLGX+w1sKOWX6ntQiE8mpUdygTxuYdO2e/4RWxbly6XaTmJkBCKL
         NOwvKNITbOnHIU3zliZsYzhH7isxKoC5mwyJ35o5V5Ed4Bf8nSid2OQ/y8LOwxLuyo2G
         Jzt6xWdFZTSOyOMviIuSX8dxDI/WmxqAYbK97WZ1AukQTa4QnIcgUGyTLHZ65RM7NevP
         M0gfmTNoIG3Wc5IZUeD6VjOHSmD7kE7SnhipKupsVb4WUoxD8jYA2CedoTRt4CXMru54
         iHYuhqWpHN2cVAc88EbH25B4ybC5+imJhfhh8riBiI12tfnWNm1W9E4INXOH2XiO61iT
         w/Tw==
X-Gm-Message-State: AOJu0Yzx0nj/JDWvy6TUW0k1Kow0XBbAU5ALu5119YCR1iE5/lqtaVSv
	+G96nwxyuLcvGmR1/PUoNLv4po/4+RyYawW08r72oNUmpgUIeIpKN4YCMocz7Yfqll8sGDkiC2q
	DAMmVPWxiA3tUJPn8Bb6BxSkHe9EAd8Ua3RDLDDOZqRwf5W6B79hUMevHJzuADeaAwoew7W4FcK
	4NjiR6JNjalsry6C0Q/F8pqC2gmFDOmLVMqXxeESC9t1PTLA==
X-Gm-Gg: ASbGncu62UFo2YTEzcfKBN0UGhNyWW6pKGDkG36cYMlQHAGpZUbqNgjExnDwsxlw3J5
	POj8f37d3grtqJ0j/WHlP1irGhs3eBvnjNWQQaYIWfqRTxbaljeNTRtM2BBWy/WYz8UnqsX+QzR
	7YT66NdjgzwAfDQgSAK8jIEd7QBEyBrP/vcC8IcN+9ykPrOUuynO/hfgAtnuhawaz7Mch0JfEWd
	g8e2/c+vZv+Gg1BMivepZvAJV7ZgEh21+H20wbualMtO9Iu0o1iTA3H3E5BaBJKYETCrvwIem6X
	ygCcp25tJ1ZfWSOXWwrtpg6S9P7+PvK8I4e6RGCClaPY1BDCCYpGF7USknyi1Z42PdstwXhm6Sc
	UsBqTy8Z8VcD8pkci11zw
X-Google-Smtp-Source: AGHT+IErL+Ll8g9GvVsa3i9GC1U/eQ01zxORYuRab8D1/CX2RZhp4O7gDvHgkQuwNMmcGa+lHZlC+A==
X-Received: by 2002:a17:902:ce03:b0:248:cd0b:3454 with SMTP id d9443c01a7336-24944873445mr115794565ad.9.1756779543295;
        Mon, 01 Sep 2025 19:19:03 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:19:02 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:48 +0800
Subject: [PATCH v5 09/11] platform: sifive: Add SiFive TMC0 driver
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-9-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>, 
 Cyan Yang <cyan.yang@sifive.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191904_568894_D78B160E 
X-CRM114-Status: GOOD (  21.63  )
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

The SiFive TMC0 controls the tile power domains on SiFive platform. The
CPU enters the low power state via the `CEASE` instruction after
configuring the TMC0. Any devices that inside the tile power domain will
be power gated, including the private cache. Therefore flushing the
private cache before entering the low power state.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h   |  20 ++
 include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h   |  16 ++
 lib/utils/hsm/Kconfig                         |   5 +
 lib/utils/hsm/fdt_hsm_sifive_tmc0.c           | 317 ++++++++++++++++++++++++++
 lib/utils/hsm/objects.mk                      |   3 +
 platform/generic/Kconfig                      |   5 +
 platform/generic/configs/defconfig            |   2 +
 platform/generic/sifive/objects.mk            |   3 +
 platform/generic/sifive/sifive_dev_platform.c |  39 ++++
 9 files changed, 410 insertions(+)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
new file mode 100644
index 0000000000000000000000000000000000000000..de8aba190fd782e497e6f71662e734fac7b076fe
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_HSM_SIFIVE_INST_H__
+#define __FDT_HSM_SIFIVE_INST_H__
+
+static inline void sifive_cease(void)
+{
+	__asm__ __volatile__(".insn 0x30500073" ::: "memory");
+}
+
+static inline void sifive_cflush(void)
+{
+	__asm__ __volatile__(".insn 0xfc000073" ::: "memory");
+}
+
+#endif
diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
new file mode 100644
index 0000000000000000000000000000000000000000..4ba048b92541ae0e303a0bdc6a018cbd88555683
--- /dev/null
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_tmc0.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __FDT_HSM_SIFIVE_TMC0_H__
+#define __FDT_HSM_SIFIVE_TMC0_H__
+
+#ifdef CONFIG_FDT_HSM_SIFIVE_TMC0
+int fdt_hsm_sifive_tmc0_cold_init(void);
+#else
+static inline int fdt_hsm_sifive_tmc0_cold_init(void) { return 0; }
+#endif
+
+#endif
diff --git a/lib/utils/hsm/Kconfig b/lib/utils/hsm/Kconfig
index 1ad7958fb582a3ee561dfaec4afd738054b58906..3e6f8909e1f0a76b71ad12623dacabce270098ad 100644
--- a/lib/utils/hsm/Kconfig
+++ b/lib/utils/hsm/Kconfig
@@ -14,6 +14,11 @@ config FDT_HSM_RPMI
 	depends on FDT_MAILBOX && RPMI_MAILBOX
 	default n
 
+config FDT_HSM_SIFIVE_TMC0
+	bool "FDT SiFive TMC v0 driver"
+	depends on PLATFORM_SIFIVE_DEV
+	default n
+
 endif
 
 endmenu
diff --git a/lib/utils/hsm/fdt_hsm_sifive_tmc0.c b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
new file mode 100644
index 0000000000000000000000000000000000000000..c57fbed0a1ebd1275327a72aa67babcbdeeb021d
--- /dev/null
+++ b/lib/utils/hsm/fdt_hsm_sifive_tmc0.c
@@ -0,0 +1,317 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_driver.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+struct sifive_tmc0 {
+	unsigned long reg;
+	struct sbi_dlist node;
+	u32 id;
+};
+
+static SBI_LIST_HEAD(tmc0_list);
+static unsigned long tmc0_offset;
+
+#define tmc0_ptr_get(__scratch)				\
+	sbi_scratch_read_type((__scratch), struct sifive_tmc0 *, tmc0_offset)
+
+#define tmc0_ptr_set(__scratch, __tmc0)			\
+	sbi_scratch_write_type((__scratch), struct sifive_tmc0 *, tmc0_offset, (__tmc0))
+
+/* TMC.PGPREP */
+#define SIFIVE_TMC_PGPREP_OFF			0x0
+#define SIFIVE_TMC_PGPREP_ENA_REQ		BIT(31)
+#define SIFIVE_TMC_PGPREP_ENA_ACK		BIT(30)
+#define SIFIVE_TMC_PGPREP_DIS_REQ		BIT(29)
+#define SIFIVE_TMC_PGPREP_DIS_ACK		BIT(28)
+#define SIFIVE_TMC_PGPREP_CLFPNOTQ		BIT(18)
+#define SIFIVE_TMC_PGPREP_PMCENAERR		BIT(17)
+#define SIFIVE_TMC_PGPREP_PMCDENY		BIT(16)
+#define SIFIVE_TMC_PGPREP_BUSERR		BIT(15)
+#define SIFIVE_TMC_PGPREP_WAKE_DETECT		BIT(12)
+#define SIFIVE_TMC_PGPREP_INTERNAL_ABORT	BIT(2)
+#define SIFIVE_TMC_PGPREP_ENARSP		(SIFIVE_TMC_PGPREP_CLFPNOTQ | \
+						 SIFIVE_TMC_PGPREP_PMCENAERR | \
+						 SIFIVE_TMC_PGPREP_PMCDENY | \
+						 SIFIVE_TMC_PGPREP_BUSERR | \
+						 SIFIVE_TMC_PGPREP_WAKE_DETECT)
+
+/* TMC.PG */
+#define SIFIVE_TMC_PG_OFF			0x4
+#define SIFIVE_TMC_PG_ENA_REQ			BIT(31)
+#define SIFIVE_TMC_PG_ENA_ACK			BIT(30)
+#define SIFIVE_TMC_PG_DIS_REQ			BIT(29)
+#define SIFIVE_TMC_PG_DIS_ACK			BIT(28)
+#define SIFIVE_TMC_PG_PMC_ENA_ERR		BIT(17)
+#define SIFIVE_TMC_PG_PMC_DENY			BIT(16)
+#define SIFIVE_TMC_PG_BUS_ERR			BIT(15)
+#define SIFIVE_TMC_PG_MASTNOTQ			BIT(14)
+#define SIFIVE_TMC_PG_WARM_RESET		BIT(1)
+#define SIFIVE_TMC_PG_ENARSP			(SIFIVE_TMC_PG_PMC_ENA_ERR | \
+						 SIFIVE_TMC_PG_PMC_DENY | \
+						 SIFIVE_TMC_PG_BUS_ERR | \
+						 SIFIVE_TMC_PG_MASTNOTQ)
+
+/* TMC.RESUMEPC */
+#define SIFIVE_TMC_RESUMEPC_LO			0x10
+#define SIFIVE_TMC_RESUMEPC_HI			0x14
+
+/* TMC.WAKEMASK */
+#define SIFIVE_TMC_WAKE_MASK_OFF		0x20
+#define SIFIVE_TMC_WAKE_MASK_WREQ		BIT(31)
+#define SIFIVE_TMC_WAKE_MASK_ACK		BIT(30)
+
+static void sifive_tmc0_set_resumepc(physical_addr_t addr)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+
+	writel((u32)addr, (void *)(tmc0->reg + SIFIVE_TMC_RESUMEPC_LO));
+#if __riscv_xlen > 32
+	writel((u32)(addr >> 32), (void *)(tmc0->reg + SIFIVE_TMC_RESUMEPC_HI));
+#endif
+}
+
+static u32 sifive_tmc0_set_pgprep_enareq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PGPREP_ENA_REQ, (void *)reg);
+	while (!(readl((void *)reg) & SIFIVE_TMC_PGPREP_ENA_ACK));
+
+	v = readl((void *)reg);
+	return v & SIFIVE_TMC_PGPREP_INTERNAL_ABORT;
+}
+
+static void sifive_tmc0_set_pgprep_disreq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PGPREP_DIS_REQ, (void *)reg);
+	while (!(readl((void *)reg) & SIFIVE_TMC_PGPREP_DIS_ACK));
+}
+
+static u32 sifive_tmc0_get_pgprep_enarsp(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PGPREP_OFF;
+	u32 v = readl((void *)reg);
+
+	return v & SIFIVE_TMC_PGPREP_ENARSP;
+}
+
+static void sifive_tmc0_set_pg_enareq(void)
+{
+	struct sifive_tmc0 *tmc0 = tmc0_ptr_get(sbi_scratch_thishart_ptr());
+	unsigned long reg = tmc0->reg + SIFIVE_TMC_PG_OFF;
+	u32 v = readl((void *)reg);
+
+	writel(v | SIFIVE_TMC_PG_ENA_REQ, (void *)reg);
+}
+
+static int sifive_tmc0_prep(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	u32 rc;
+
+	if (!tmc0_ptr_get(scratch))
+		return SBI_ENODEV;
+
+	rc = sifive_tmc0_set_pgprep_enareq();
+	if (rc) {
+		sbi_printf("TMC0 error: Internal Abort (Wake detect)\n");
+		goto fail;
+	}
+
+	rc = sifive_tmc0_get_pgprep_enarsp();
+	if (rc) {
+		sifive_tmc0_set_pgprep_disreq();
+		sbi_printf("TMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	sifive_tmc0_set_resumepc(scratch->warmboot_addr);
+
+	return SBI_OK;
+
+fail:
+	return SBI_EFAIL;
+}
+
+static int sifive_tmc0_enter(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	u32 rc;
+
+	/* Flush cache and check if there is wake detect or bus error */
+	if (fdt_cmo_private_flc_flush_all() &&
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1))
+		sifive_cflush();
+
+	rc = sifive_tmc0_get_pgprep_enarsp();
+	if (rc) {
+		sbi_printf("TMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XSIFIVE_CEASE)) {
+		sifive_tmc0_set_pg_enareq();
+		while (1)
+			sifive_cease();
+	}
+
+	rc = SBI_ENOTSUPP;
+fail:
+	sifive_tmc0_set_pgprep_disreq();
+	return rc;
+}
+
+static int sifive_tmc0_tile_pg(void)
+{
+	int rc;
+
+	rc = sifive_tmc0_prep();
+	if (rc)
+		return rc;
+
+	return sifive_tmc0_enter();
+}
+
+static int sifive_tmc0_start(u32 hartid, ulong saddr)
+{
+	struct sbi_ipi_device *clint = aclint_mswi_get();
+
+	/*
+	 * In system suspend, the IMSIC will be reset in SiFive platform so
+	 * we use the CLINT IPI as the wake event.
+	 */
+	if (clint && clint->ipi_send)
+		clint->ipi_send(sbi_hartid_to_hartindex(hartid));
+	else
+		sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_stop(void)
+{
+	unsigned long mie = csr_read(CSR_MIE);
+	int rc;
+	/* Set IPI as wake up source */
+	csr_set(CSR_MIE, MIP_MEIP | MIP_MSIP);
+
+	rc = sifive_tmc0_tile_pg();
+	if (rc) {
+		csr_write(CSR_MIE, mie);
+		return rc;
+	}
+
+	return SBI_OK;
+}
+
+static struct sbi_hsm_device tmc0_hsm_dev = {
+	.name = "SiFive TMC0",
+	.hart_start = sifive_tmc0_start,
+	.hart_stop = sifive_tmc0_stop,
+};
+
+static int sifive_tmc0_bind_cpu(struct sifive_tmc0 *tmc0)
+{
+	const void *fdt = fdt_get_address();
+	struct sbi_scratch *scratch;
+	int cpus_off, cpu_off, rc;
+	const fdt32_t *val;
+	u32 hartid;
+
+	cpus_off = fdt_path_offset(fdt, "/cpus");
+	if (cpus_off < 0)
+		return SBI_ENOENT;
+
+	fdt_for_each_subnode(cpu_off, fdt, cpus_off) {
+		rc = fdt_parse_hart_id(fdt, cpu_off, &hartid);
+		if (rc)
+			continue;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		val = fdt_getprop(fdt, cpu_off, "power-domains", NULL);
+		if (!val)
+			return SBI_ENOENT;
+
+		if (tmc0->id == fdt32_to_cpu(val[0])) {
+			tmc0_ptr_set(scratch, tmc0);
+			return SBI_OK;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+static int sifive_tmc0_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	struct sifive_tmc0 *tmc0;
+	u64 addr;
+	int rc;
+
+	if (!tmc0_offset) {
+		tmc0_offset = sbi_scratch_alloc_type_offset(struct sifive_tmc0 *);
+		if (!tmc0_offset)
+			return SBI_ENOMEM;
+
+		sbi_hsm_set_device(&tmc0_hsm_dev);
+	}
+
+	tmc0 = sbi_zalloc(sizeof(*tmc0));
+	if (!tmc0)
+		return SBI_ENOMEM;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		goto free_tmc0;
+
+	tmc0->reg = (unsigned long)addr;
+	tmc0->id = fdt_get_phandle(fdt_get_address(), nodeoff);
+
+	rc = sifive_tmc0_bind_cpu(tmc0);
+	if (rc)
+		goto free_tmc0;
+
+	return SBI_OK;
+
+free_tmc0:
+	sbi_free(tmc0);
+	return rc;
+}
+
+static const struct fdt_match sifive_tmc0_match[] = {
+	{ .compatible = "sifive,tmc0" },
+	{ },
+};
+
+const struct fdt_driver fdt_hsm_sifive_tmc0 = {
+	.match_table = sifive_tmc0_match,
+	.init = sifive_tmc0_probe,
+};
diff --git a/lib/utils/hsm/objects.mk b/lib/utils/hsm/objects.mk
index c13d81f78dd69ceb37cf83b19b10bc95c3dcfaff..6fbae628aa615e8ddcd41d01973303f2e36100d1 100644
--- a/lib/utils/hsm/objects.mk
+++ b/lib/utils/hsm/objects.mk
@@ -9,3 +9,6 @@
 
 carray-fdt_early_drivers-$(CONFIG_FDT_HSM_RPMI) += fdt_hsm_rpmi
 libsbiutils-objs-$(CONFIG_FDT_HSM_RPMI) += hsm/fdt_hsm_rpmi.o
+
+carray-fdt_early_drivers-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += fdt_hsm_sifive_tmc0
+libsbiutils-objs-$(CONFIG_FDT_HSM_SIFIVE_TMC0) += hsm/fdt_hsm_sifive_tmc0.o
\ No newline at end of file
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 7559a4bd8ccfcf7e0e7366141f632f5f5e13bd98..e647d323f9b9abf73da73f3cc04bd3476a2a2387 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -47,6 +47,11 @@ config PLATFORM_RENESAS_RZFIVE
 	select ANDES_PMU
 	default n
 
+config PLATFORM_SIFIVE_DEV
+	bool "SiFive development platform support"
+	depends on FDT_CACHE
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index f782e57df24674578bc179b949a621a6d522f1c8..9c98ce309d9894c654ec6f348e32c940126960a3 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,6 +1,7 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
+CONFIG_PLATFORM_SIFIVE_DEV=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
@@ -18,6 +19,7 @@ CONFIG_FDT_GPIO_SIFIVE=y
 CONFIG_FDT_GPIO_STARFIVE=y
 CONFIG_FDT_HSM=y
 CONFIG_FDT_HSM_RPMI=y
+CONFIG_FDT_HSM_SIFIVE_TMC0=y
 CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_I2C_DW=y
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index d75e444abf5352bbb264af4a0e0cf2d0b401024b..d32e1273dec7e37a96f9e2c0e00f4cb9c384adde 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
+carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive_dev_platform
+platform-objs-$(CONFIG_PLATFORM_SIFIVE_DEV) += sifive/sifive_dev_platform.o
+
 carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive_fu540
 platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 
diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
new file mode 100644
index 0000000000000000000000000000000000000000..aa08ce751d400a8e4c51f336becf7d8c80a16244
--- /dev/null
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -0,0 +1,39 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/hsm/fdt_hsm_sifive_tmc0.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+static int sifive_final_init(bool cold_boot)
+{
+	struct sbi_ipi_device *clint = aclint_mswi_get();
+
+	if (clint && clint->ipi_clear)
+		clint->ipi_clear();
+
+	return generic_final_init(cold_boot);
+}
+
+static int sifive_platform_init(const void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	generic_platform_ops.final_init = sifive_final_init;
+
+	return 0;
+}
+
+static const struct fdt_match sifive_dev_platform_match[] = {
+	{ .compatible = "sifive-dev" },
+	{ },
+};
+
+const struct fdt_driver sifive_dev_platform = {
+	.match_table = sifive_dev_platform_match,
+	.init = sifive_platform_init,
+};

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
