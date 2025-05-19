Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31409C54795
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssJtG4t+T6WBpcLqTuWMm9mNHqrRBbpQXzBW5F0LlEE=; b=BIs7u0VjyhD2Ms
	elU9/NpXGL7GWRnjqymIoZsxu9gBjwpNjeKI/YGKyD0KH9zWQ5d7Rso4+A3Y0UqU26qxVw31jXtUD
	uVh/pKruycu+6p54awYYSDbCXGGhcwkFAACUTI2em2+GzfW6i+VaRB81i+3wtVr3pUB53EqSEJ5sV
	zsyHbPPLFI5nm21zVy7tz23b8SY+pe9U9c9DJo9ycAQbZJ+axMFpdiZFf7lCRJ/QmRD1cku4R8pNJ
	o9Xfd+yqqrps2uBc3N2SarMCJtEnWBdP2YnCZwzRMA36bkUEZjKBHfZv+fw/P70Sj5HOLnskVkIAR
	en8Uwjx0pWqcpQ25QExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vr-0000000AgDK-01Ft;
	Mon, 19 May 2025 21:59:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vl-0000000Ag9n-3IEA
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2301ac32320so55626065ad.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691944; x=1748296744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saKduEaA4dPb/5tKqJxzFdyd8OBcvR3vuy/1Ku0KzPs=;
        b=HzbFl1lXIv6XafKD3pp0N3WfGyY4T7X5BNHwYl60ixLkcms7IktQJYCdtSLMbQlaVP
         IkLayz3MXz/mGmY3MDSYuxt0tTp5V2iOSAS0ZDH7XwokVkOo3Cxk7fQV0kOtJlYnlhsF
         bzzqWd0C7DPMvm0NyPrn0SdKc4NT/szbnbtNZsbS8DQaPhAaBXxe0CvGjz4jFk+Rii8B
         ip412eqqiRcAMbS6EfWBKeEmOamPbRkZ90JfgmqvyIokcOjVOTOYexzTxDtbwe0EYW4T
         tmBg0EevQMgfHheKDUczF1aHG6F2trxyS/pwcUhtbM903u7fEZzj593vOZVI2Y0UQdOe
         Q1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691944; x=1748296744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saKduEaA4dPb/5tKqJxzFdyd8OBcvR3vuy/1Ku0KzPs=;
        b=Ley3g3vbOBlsW0vFoQ77DNY3uaMghYzW6ymE2QXjxymGkzvAgnmIXuqKzmfFq9gBbH
         fXv7a2W0La4n/uMuv5Wyp6nJb/EmYqxPZRSQl0cRW6XkygI6hD7hn7zWIRrnLTVA4dq5
         UHPoB17yOGzn+8YyX9R014mcC8fX8EK1aTqt7N+vySWG9klVBWbm0Z7XHZ6IJUP18y2E
         BUQQdIWBCxY8N0ZWYi/I7QOFyUkOlYvomj8B/I1KP3z42BmRFfFKSXQybuABU5LFy49S
         OCQxRhYmcsNLHRT+WnIW9MdGmku4PUM7J2fO2/lLxU2eFyp4f2ygtFiQW5/oudE8ywic
         Xn+A==
X-Gm-Message-State: AOJu0YwjQ9eWn+3DP/gW0MR0Wjz4DA/jwxQm5gJjzSEiI2IhZg0Xw0iR
	q/BcvWWjr8rGNwE2z1K1G1VJy2w2Z/pliAZYCunAD2iVx+kbAAEFlpaIMZRIzliJ
X-Gm-Gg: ASbGncvJXymuokDXKiyYhO7mk3hpdu9S/0JS0UoZ13JPzHaUFxDH/M1JCa+9MSGpIFc
	goIeG+frhd79hEk5Op+EREHRIxL7gU9/ObwQVzKLjT+agnTmCxqokovyIYntaFly48lgH5rrjwP
	Q8jtopNyaBtQlebKLCnlXvgcx+Er8AcDpIfe/yXTMD2vBejKRQ/xWwOlDynLIWIvjYpheHYPkOF
	2+q3JEoDtjZAI1X8f6y/t6QME1Pk0mL5cT/4S7eLMBxJfI4aUXKn7B4xgQaWapDFIGOmcBf0XPF
	Rw4Croynnfk2hlZnCx8emehxM6N8Sp/h52p9InQx3Ron3AEo5VrdBBeiBTFjnrxtjA==
X-Google-Smtp-Source: AGHT+IGSQ45yMveBVleQI34VFW+4dXAYNA7Wr7U6ysEbip0SPYyo51AkMV3Xy2Cp5iF9VqHq5j7Okw==
X-Received: by 2002:a17:902:da86:b0:231:d0ef:e8fc with SMTP id d9443c01a7336-231d459b1fcmr201472425ad.33.1747691943988;
        Mon, 19 May 2025 14:59:03 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:03 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 04/10] platform: generic: mips: add the platform file
Date: Mon, 19 May 2025 14:58:41 -0700
Message-ID: <20250519215848.27569-5-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145905_825612_42119716 
X-CRM114-Status: GOOD (  24.09  )
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

We add the platform file for MIPS P8700.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/p8700.c | 279 ++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)
 create mode 100644 platform/generic/mips/p8700.c

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
new file mode 100644
index 0000000..5f3c48a
--- /dev/null
+++ b/platform/generic/mips/p8700.c
@@ -0,0 +1,279 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <mips/p8700.h>
+#include <mips/mips-cm.h>
+
+extern void mips_cps_core_entry(void);
+
+#if CLUSTERS_IN_PLATFORM > 1
+static void power_up_other_cluster(u32 hartid)
+{
+	unsigned int stat;
+	unsigned int timeout;
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Power up cluster cl core 0 hart 0 */
+	write_cpc_pwrup_ctl(hartid, 1, local_p);
+
+	/* Wait for the CM to start up */
+	timeout = 100;
+	while (true) {
+		stat = read_cpc_cm_stat_conf(hartid, local_p);
+		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
+			break;
+
+		/* Delay a little while before we start warning */
+		if (timeout) {
+			sbi_dprintf("Delay a little while before we start warning\n");
+			timeout--;
+		}
+		else {
+			sbi_printf("Waiting for cluster %u CM to power up... STAT_CONF=0x%x\n",
+				   cpu_cluster(hartid), stat);
+			break;
+		}
+	}
+}
+#endif
+
+static int mips_hart_start(u32 hartid, ulong saddr)
+{
+	unsigned int stat;
+	unsigned int timeout;
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Hart 0 is the boot hart, and we don't use the CPC cmd to start.  */
+	if (hartid == 0)
+		return SBI_ENOTSUPP;
+
+	if (cpu_hart(hartid) == 0) {
+		/* Change cluster cl core co hart 0 reset base */
+		write_gcr_co_reset_base(hartid,
+					(unsigned long)mips_cps_core_entry, local_p);
+
+		/* Ensure its coherency is disabled */
+		write_gcr_co_coherence(hartid, 0, local_p);
+
+		/* Start cluster cl core co hart 0 */
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+
+		/* Reset cluster cl core co hart 0 */
+		write_cpc_co_cmd(hartid, CPC_Cx_CMD_RESET, local_p);
+
+		timeout = 100;
+		while (true) {
+			stat = read_cpc_co_stat_conf(hartid, local_p);
+			stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+			if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U6)
+				break;
+
+			/* Delay a little while before we start warning */
+			if (timeout) {
+				sbi_timer_mdelay(10);
+				timeout--;
+			}
+			else {
+				sbi_printf("Waiting for cluster %u core %u hart %u to start... STAT_CONF=0x%x\n",
+					   cpu_cluster(hartid),
+					   cpu_core(hartid), cpu_hart(hartid),
+					   stat);
+				break;
+			}
+		}
+	}
+	else {
+		write_gcr_co_reset_base(hartid,
+					(unsigned long)mips_cps_core_entry, local_p);
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+	}
+
+	return 0;
+}
+
+static int mips_hart_stop()
+{
+	u32 hartid = current_hartid();
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Hart 0 is the boot hart, and we don't use the CPC cmd to stop.  */
+	if (hartid == 0)
+		return SBI_ENOTSUPP;
+
+	write_cpc_co_vp_stop(hartid, 1 << cpu_hart(hartid), local_p);
+
+	return 0;
+}
+
+static const struct sbi_hsm_device mips_hsm = {
+	.name		= "mips_hsm",
+	.hart_start	= mips_hart_start,
+	.hart_stop	= mips_hart_stop,
+};
+
+static int mips_p8700_final_init(bool cold_boot)
+{
+	if (cold_boot)
+		sbi_hsm_set_device(&mips_hsm);
+
+	return generic_final_init(cold_boot);
+}
+
+static int mips_p8700_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	if (cold_boot)
+	{
+#if CLUSTERS_IN_PLATFORM > 1
+		int i;
+		/* Power up other clusters in the platform. */
+		for (i = 1; i < CLUSTERS_IN_PLATFORM; i++) {
+			power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+		}
+#endif
+
+		/* For the CPC mtime region, the minimum size is 0x10000. */
+		rc = sbi_domain_root_add_memrange(CM_BASE, SIZE_FOR_CPC_MTIME,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+		/* For the APLIC and ACLINT m-mode region */
+		rc = sbi_domain_root_add_memrange(AIA_BASE, SIZE_FOR_AIA_M_MODE,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+#if CLUSTERS_IN_PLATFORM > 1
+		for (i = 0; i < CLUSTERS_IN_PLATFORM; i++) {
+			/* For the CPC mtime region, the minimum size is 0x10000. */
+			rc = sbi_domain_root_add_memrange(GLOBAL_CM_BASE[i], SIZE_FOR_CPC_MTIME,
+							  P8700_ALIGN,
+							  (SBI_DOMAIN_MEMREGION_MMIO |
+							   SBI_DOMAIN_MEMREGION_M_READABLE |
+							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+			if (rc)
+				return rc;
+
+			/* For the APLIC and ACLINT m-mode region */
+			rc = sbi_domain_root_add_memrange(AIA_BASE - CM_BASE + GLOBAL_CM_BASE[i], SIZE_FOR_AIA_M_MODE,
+							  P8700_ALIGN,
+							  (SBI_DOMAIN_MEMREGION_MMIO |
+							   SBI_DOMAIN_MEMREGION_M_READABLE |
+							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+			if (rc)
+				return rc;
+		}
+#endif
+	}
+
+	return 0;
+}
+
+static int mips_p8700_nascent_init(void)
+{
+	u64 hartid = current_hartid();
+	u64 cm_base = CM_BASE;
+	int i;
+
+	/* Coherence enable for every core */
+	if (cpu_hart(hartid) == 0) {
+		cm_base += (cpu_core(hartid) << CM_BASE_CORE_SHIFT);
+		__raw_writeq(GCR_CORE_COH_EN_EN,
+			     (void *)(cm_base + GCR_OFF_LOCAL +
+				      GCR_CORE_COH_EN));
+		mb();
+	}
+
+	/* Set up pmp for DRAM */
+	csr_write(CSR_PMPADDR14, DRAM_PMP_ADDR);
+	/* All from 0x0 */
+	csr_write(CSR_PMPADDR15, 0x1fffffffffffffff);
+	csr_write(CSR_PMPCFG2, ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<56)|
+		  ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<48));
+	/* Set cacheable for pmp6, uncacheable for pmp7 */
+	csr_write(CSR_MIPSPMACFG2, ((u64)CCA_CACHE_DISABLE << 56)|
+		  ((u64)CCA_CACHE_ENABLE << 48));
+	/* Reset pmpcfg0 */
+	csr_write(CSR_PMPCFG0, 0);
+	/* Reset pmacfg0 */
+	csr_write(CSR_MIPSPMACFG0, 0);
+	mb();
+
+	/* Per cluster set up */
+	if (cpu_core(hartid) == 0 && cpu_hart(hartid) == 0) {
+		/* Enable L2 prefetch */
+		__raw_writel(0xfffff110,
+			     (void *)(cm_base + L2_PFT_CONTROL_OFFSET));
+		__raw_writel(0x15ff,
+			     (void *)(cm_base + L2_PFT_CONTROL_B_OFFSET));
+	}
+
+	/* Per core set up */
+	if (cpu_hart(hartid) == 0) {
+		/* Enable load pair, store pair, and HTW */
+		csr_clear(CSR_MIPSCONFIG7, (1<<12)|(1<<13)|(1<<7));
+
+		/* Disable noRFO, misaligned load/store */
+		csr_set(CSR_MIPSCONFIG7, (1<<25)|(1<<9));
+
+		/* Enable L1-D$ Prefetch */
+		csr_write(CSR_MIPSCONFIG11, 0xff);
+
+		for (i = 0; i < 8; i++) {
+			csr_set(CSR_MIPSCONFIG8, 4 + 0x100 * i);
+			csr_set(CSR_MIPSCONFIG9, 8);
+			mb();
+			RISCV_FENCE_I;
+		}
+	}
+
+	/* Per hart set up */
+	/* Enable AMO and RDTIME illegal instruction exceptions. */
+	csr_set(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
+
+	return 0;
+}
+
+static int mips_p8700_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = mips_p8700_early_init;
+	generic_platform_ops.final_init = mips_p8700_final_init;
+	generic_platform_ops.nascent_init = mips_p8700_nascent_init;
+
+	return 0;
+}
+
+static const struct fdt_match mips_p8700_match[] = {
+	{ .compatible = "mips,p8700" },
+	{ },
+};
+
+const struct fdt_driver mips_p8700 = {
+	.match_table = mips_p8700_match,
+	.init = mips_p8700_platform_init,
+};
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
