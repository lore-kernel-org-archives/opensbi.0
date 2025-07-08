Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F662C83F18
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yY/0xnsjAZrkc53PieUafYVqW7FeY4ObZiWLsQKfHnw=; b=LjYc099FpxTqPjWcwq2nih78GL
	OuYLsxx1mtEiCRsxeQGRmgAyu7bq22PcGYCQwH8LXhCr5rKzlZKY2IqcvDioYK+G6ZjhTHD6YQAiX
	ijnramzQgoJphQ66FT8CLmRMwp34WavEDr5eJlWkUXVKKKWjYlYF1Wf6fLXwm2Fes9ucaSpERJA8q
	s9R8Rm5iaGPSgHWqbHHGRUvWW0jSxM7dNDGXrmd7SZhHTIfN1K5q+aqYDBN+P8WB5bTozivPdGfMW
	N+4jpt5kG1ob2Iu1NmdJQlMwTT/WZEeQgHobA/+4TXqNVXRYac1BMntUfjM5+rRiMtcBvpkzT3wIA
	swrfpA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ec-00000004fTf-1SxA;
	Tue, 08 Jul 2025 07:59:26 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35l-00000004dSG-47iA
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:21 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a8244e897fso53894411cf.1
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961016; x=1752565816; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dvVcUdzhnAZAMPr2ENKRNCMz5TQPVsUeA41VVEppULo=;
        b=CQAd8JU7MIe46oraqEzXFxu/7cHCt78cxcqFd38jRFF56zdWCeIV2JHWjtbyVvxBaF
         NOpNRqzH+VQ0kvZWdRKbilXXe3y6z4aullcKfwo/nA824vEvr0fBmDamHFPRVnySOcd8
         UExWvoEYH5yyodcz0UJwTGXfmJNgpPXQCNuvFCsbz4S03T+uGXE6URTy5gQvAom+vBwL
         jiwxWHIp6w1k9SDvLlJjj0iFXgSomaEdggO5tW/uZ4iR1tYrybX4IQbz6wROU4XILH6I
         08JAo0xbeJuuFJSHzt4ubaP5fsZzXDJY4IkPl24j2IdO52iaGIH6LvYlHKMTBkVPFX4x
         jOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961016; x=1752565816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvVcUdzhnAZAMPr2ENKRNCMz5TQPVsUeA41VVEppULo=;
        b=wDhrF12r4M/Xv2mM05NzvAq168SjCmYiGYzytIBdpl2txb3P8oXj5btAoBztSw7d/J
         7jskzKH99Ih9s84jVlnsBROo7LME0rOeAAimJyX8TemOAHzT9L6rlv9BM74cluRKUiNc
         s/d2vZZfd1vOlg0XfhPGVTHHqpAv8RZjmxpvW+Q3mGIA6AJfMgksGeGe1LvXsiylnL8v
         qpdhOYSk+8vblJnCcDIY24vd7dzx1q7jKG+VyDJ8yMa+bQErGN/4LvJsZiXySPO4PSPE
         sf/3/CcnAELmpDMlMskY2jovPY7odq+X3jHQqsqZ/BKVEXW/SuuIzeUQHjeCR5pEwSl8
         1bJg==
X-Gm-Message-State: AOJu0YwFSNXZfrm22v8Lq9Fdsp/8Tvi1Dq0SurexAlgn1I38wVakye48
	kofsBVz/wlQ7cSGZwcBF6Akjr0sTbt55l32U0gmo0D1Ih/0HwQXXQ8poRFBTyOrJuxBpZG5v+oc
	Xm8I7cMLZfuHf0eaS0Td/nr9Bw/vN3hdds/wJ6RV0RF4GAOADotLWLuRoB/0u6x18sZBQcTS/6g
	YhoNGgm7W5MqnSMjrIfeGW+/tN3vYBhKsgQs9wtYRr4UR/3A==
X-Gm-Gg: ASbGncvXTmpA8hPPX9WmfiditRm80C+2oxah/JmNQSw4dfAMwN6mbZ5jUdnCQplSX4y
	t6dcIuE8n/JV/F6ug3sjmpgpLILaycwpWoUB2V+F1dZNSXHgp+RF8fauJSobE25n+pCCTqp682T
	aCOTUWGLnB+djAF1V3LnfUhadKzA+lXR0AM/6FH+4iU3dZ7ECyEsGnpAAMRs625Q/vHCubdI6Gl
	8NOa2D/V9Khjh6mV4gRnX7dgfjRcDNHrAi/rrYoGrn5kA5f1sWq47mPWlDG88N06tQo+4q+0iDg
	x8DczLawKbWnzkP+ZA0XLQEUsk4c4lBFefsnMS+P1FkOAgaA4OFGtizy+tQYeSnRxAix+fZpa+W
	i5+T6W3oV
X-Google-Smtp-Source: AGHT+IG3ZKgKrvStRf5/EbXQt6t61vUvyzGgbUm3/2dZgbveNj+7Gk7JbvqVR0AJ1xTOwD1zmi6yCA==
X-Received: by 2002:a05:6214:2dc6:b0:700:bce1:495a with SMTP id 6a1803df08f44-7047d92b9c5mr23771056d6.1.1751961016332;
        Tue, 08 Jul 2025 00:50:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:16 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 10/12] platform: sifive: Add SiFive TMC0 driver
Date: Tue,  8 Jul 2025 15:49:38 +0800
Message-Id: <20250708074940.10904-11-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005018_025842_FA73E178 
X-CRM114-Status: GOOD (  23.30  )
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

The SiFive TMC0 controls the tile power domains on SiFive platform. The
CPU enters the low power state via the `CEASE` instruction after
configuring the TMC0. Any devices that inside the tile power domain will
be power gated, including the private cache. Therefore flushing the
private cache before entering the low power state.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 platform/generic/Kconfig                      |   2 +
 platform/generic/include/sifive/sifive_inst.h |  20 +
 platform/generic/include/sifive/sifive_tmc0.h |  12 +
 platform/generic/sifive/Kconfig               |   5 +
 platform/generic/sifive/objects.mk            |   2 +
 .../pmdomain/fdt_pmdomain_sifive_tmc0.c       | 371 ++++++++++++++++++
 platform/generic/sifive/sifive_dev_platform.c |  21 +
 7 files changed, 433 insertions(+)
 create mode 100644 platform/generic/include/sifive/sifive_inst.h
 create mode 100644 platform/generic/include/sifive/sifive_tmc0.h
 create mode 100644 platform/generic/sifive/Kconfig
 create mode 100644 platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 20c25a83..1d6ea3f4 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -46,6 +46,7 @@ config PLATFORM_RENESAS_RZFIVE
 config PLATFORM_SIFIVE_DEV
 	bool "SiFive development platform support"
 	depends on FDT_CACHE
+	select SIFIVE_TMC0
 	default n
 
 config PLATFORM_SIFIVE_FU540
@@ -78,6 +79,7 @@ config PLATFORM_MIPS_P8700
 	default n
 
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
+source "$(OPENSBI_SRC_DIR)/platform/generic/sifive/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
 endif
diff --git a/platform/generic/include/sifive/sifive_inst.h b/platform/generic/include/sifive/sifive_inst.h
new file mode 100644
index 00000000..36dddf68
--- /dev/null
+++ b/platform/generic/include/sifive/sifive_inst.h
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __SIFIVE_INST_H__
+#define __SIFIVE_INST_H__
+
+static inline void sifive_cease(void)
+{
+	__asm__ __volatile__(".word 0x30500073" ::: "memory");
+}
+
+static inline void sifive_cflush(void)
+{
+	__asm__ __volatile__(".word 0xfc000073" ::: "memory");
+}
+
+#endif
diff --git a/platform/generic/include/sifive/sifive_tmc0.h b/platform/generic/include/sifive/sifive_tmc0.h
new file mode 100644
index 00000000..6100e0dc
--- /dev/null
+++ b/platform/generic/include/sifive/sifive_tmc0.h
@@ -0,0 +1,12 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ */
+
+#ifndef __SIFIVE_TMC0_H__
+#define __SIFIVE_TMC0_H__
+
+int sifive_tmc0_cold_init(void);
+
+#endif
diff --git a/platform/generic/sifive/Kconfig b/platform/generic/sifive/Kconfig
new file mode 100644
index 00000000..2cbcea08
--- /dev/null
+++ b/platform/generic/sifive/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config SIFIVE_TMC0
+	bool "SiFive TMC v0 driver support"
+	default n
diff --git a/platform/generic/sifive/objects.mk b/platform/generic/sifive/objects.mk
index d32e1273..f8938713 100644
--- a/platform/generic/sifive/objects.mk
+++ b/platform/generic/sifive/objects.mk
@@ -10,3 +10,5 @@ platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU540) += sifive/fu540.o
 
 carray-platform_override_modules-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive_fu740
 platform-objs-$(CONFIG_PLATFORM_SIFIVE_FU740) += sifive/fu740.o
+
+platform-objs-$(CONFIG_SIFIVE_TMC0) += sifive/pmdomain/fdt_pmdomain_sifive_tmc0.o
diff --git a/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
new file mode 100644
index 00000000..70d02b33
--- /dev/null
+++ b/platform/generic/sifive/pmdomain/fdt_pmdomain_sifive_tmc0.c
@@ -0,0 +1,371 @@
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
+#include <sbi_utils/ipi/aclint_mswi.h>
+#include <sifive/sifive_inst.h>
+#include <sifive/sifive_tmc0.h>
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
+	writel((u32)(addr >> 32), (void *)(tmc0->reg + SIFIVE_TMC_RESUMEPC_HI));
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
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_XSF_CFLUSH_D_L1))
+		sifive_cflush();
+
+	rc = sifive_tmc0_get_pgprep_enarsp();
+	if (rc) {
+		sbi_printf("TMC0 error: error response code: 0x%x\n", rc);
+		goto fail;
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XSF_CEASE)) {
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
+static struct sifive_tmc0 *sifive_tmc0_find(u32 id)
+{
+	struct sifive_tmc0 *tmc0;
+
+	sbi_list_for_each_entry(tmc0, &tmc0_list, node) {
+		if (tmc0->id == id)
+			return tmc0;
+	}
+
+	return NULL;
+}
+
+static int sifive_tmc0_add(struct sifive_tmc0 *tmc0)
+{
+	if (!tmc0)
+		return SBI_ENODEV;
+
+	if (sifive_tmc0_find(tmc0->id))
+		return SBI_EALREADY;
+
+	sbi_list_add(&tmc0->node, &tmc0_list);
+
+	return SBI_OK;
+}
+
+static int sifive_tmc0_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	struct sifive_tmc0 *tmc0;
+	int rc;
+	u64 addr;
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
+	tmc0->id = nodeoff;
+
+	rc = sifive_tmc0_add(tmc0);
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
+const struct fdt_driver fdt_sifive_tmc0 = {
+	.match_table = sifive_tmc0_match,
+	.init = sifive_tmc0_probe,
+};
+
+static const struct fdt_driver *const sifive_tmc0_drivers[] = {
+	&fdt_sifive_tmc0,
+	NULL
+};
+
+static int fdt_sifive_tmc0_get(const void *fdt, int noff, struct sifive_tmc0 **out)
+{
+	struct sifive_tmc0 *tmc0;
+	int rc;
+
+	noff = fdt_node_offset_by_phandle(fdt, noff);
+	if (noff < 0)
+		return noff;
+
+	rc = fdt_driver_init_by_offset(fdt, noff, sifive_tmc0_drivers);
+	if (rc)
+		return rc;
+
+	tmc0 = sifive_tmc0_find(noff);
+	if (!tmc0)
+		return SBI_EFAIL;
+
+	if (out)
+		*out = tmc0;
+
+	return SBI_OK;
+}
+
+static int fdt_sifive_tmc0_cold_init(const void *fdt)
+{
+	struct sbi_scratch *scratch;
+	struct sifive_tmc0 *tmc0;
+	const fdt32_t *val;
+	int cpus_off, cpu_off, rc;
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
+		val = fdt_getprop(fdt, cpu_off, "power-domains", NULL);
+		if (!val)
+			return SBI_ENOENT;
+
+		rc = fdt_sifive_tmc0_get(fdt, fdt32_to_cpu(val[0]), &tmc0);
+		if (rc)
+			return rc;
+
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		tmc0_ptr_set(scratch, tmc0);
+	}
+
+	return SBI_OK;
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
+	// Set IPI as wake up source
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
+int sifive_tmc0_cold_init(void)
+{
+	tmc0_offset = sbi_scratch_alloc_type_offset(struct sifive_tmc0 *);
+	if (!tmc0_offset)
+		return SBI_ENOMEM;
+
+	sbi_hsm_set_device(&tmc0_hsm_dev);
+	return fdt_sifive_tmc0_cold_init(fdt_get_address());
+}
diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
index ac659868..3e433bb3 100644
--- a/platform/generic/sifive/sifive_dev_platform.c
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -5,7 +5,11 @@
  */
 
 #include <platform_override.h>
+#include <sbi/sbi_ipi.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+#include <sifive/sifive_tmc0.h>
 
 static int sifive_early_init(bool cold_boot)
 {
@@ -19,13 +23,30 @@ static int sifive_early_init(bool cold_boot)
 	if (rc)
 		return rc;
 
+	if (cold_boot) {
+		rc = sifive_tmc0_cold_init();
+		if (rc)
+			return rc;
+	}
+
 	return 0;
 }
 
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
 static int sifive_platform_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
 	generic_platform_ops.early_init = sifive_early_init;
+	generic_platform_ops.final_init = sifive_final_init;
 
 	return 0;
 }
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
