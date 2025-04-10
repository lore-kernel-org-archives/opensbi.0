Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5F2C369AA
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaX/C3nn7HEaJ5hErtIlOZe+dWQKkCTFmtllNY/ISmE=; b=ywM93i70sLayah
	pGBKSoohkZulFZaUlPPXfa+/Sg8usp3Y5YqqKUyldG6xNhrUnRQ0y4xnaPKXEAs6r7HwPXzYCEm87
	47wZxvmmO0QNgm0aDsz5zhJ4bp9yby1+yb6Y3zcti0ErMcY/PzRj7hcrDAarrL9kB6BWhupEt3qYv
	o9KejDGZ2joNiecnT9zymyxou7znBWYsqR6IcEW6xqdi1kU81HBI8ZTr9XIliZNdK4GJc7pO3IHdL
	CuoqV92nXB6AsKQYDI6TAc5MO99F3fjGgrU/VTV4jgsPIe3SsOSFeIQdMaeujLibNVISmIgyX7gj4
	+bbOlC54JrsDorbG+DbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rc-0000000C45d-1W1k;
	Thu, 10 Apr 2025 23:36:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Ra-0000000C43w-2698
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-227d6b530d8so14153455ad.3
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328184; x=1744932984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4N+EcyM2D/ktrw+xYJaqRGruV0jVr0UHjGOX7cPZpw=;
        b=X/9dLRYl5LXq5HaSc8Y8C9J6JoYgdCAVfMqxCuaHfCK1NPpWA9v8oebRfI+W9UpDuO
         f8vSFbNdSY1b+YDsagdqrc+FeEbMio+yCA++jNsDubCwh1IGEVVVg5YP90mKl5ifNeox
         1CcY+NcO2FdJUfv4bUvek9yYAAH71M5iwaY95zH8FdrJZv2rsE5zCaaedK/W3djFvms9
         V3nUSljuZCw8jYW9OSsL4eX9RwffMWHPLmmfyyNL9F71AyaNAMGiV44ziB2j9orOgVmL
         68QlM3FKvAlBhDP2M6ZSiy0XcinGa0KwquLhm80ytmS0BGp98lsNablhCGWutQ+GWRSQ
         AnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328184; x=1744932984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4N+EcyM2D/ktrw+xYJaqRGruV0jVr0UHjGOX7cPZpw=;
        b=EhTeJD86g1z3rHo0/VNxKI/758rTGolTc7lL0dU6ePhWLR/wox4+8z2QsQA9j9R0Lh
         qwR4XyLLmq11foMLuvD2WSDrb4V+cJNxuEakwVnXrkC4L+CVxOQf+9tlww0e8cWJjEP6
         G0Xw4DsWo5jzg2sfdIXnm02jOeQehialPPVestpQWbiwfOsS2XwxwulmagN6IGKFbsd8
         VSrTNIS9aZrS/ChMKJ3I1RsJvWUYxxUZREqI0bgfcvdkfV6W/6BvbbetVuN1naWX1DMy
         Z4Zac8cDqsukWBUKxxzcHATvis/ugh2aTkG+9Ozvj7aJYAVW1kQQcArDvDaMoFx8+Cvy
         Hn2g==
X-Gm-Message-State: AOJu0Yzn2ZATJcxjfYMQifLaWf9aIPRvOvb8JFM694zM6r3C/9wOQqwV
	3XwTHJBD519DeZlvMF8R0e/2fq0adcjq7DVJmFTbbygYSIvKs1u/edA4+B3e
X-Gm-Gg: ASbGncu9NMWzZuxd03GZUrewWbf+WqM6GgmOIM9H+46kKCAvjZM437ljXf1Fpn1JVD5
	Yyj6NqJ07nQgdDWPycI9sBVuYfMHbSL9Ijt//1hHNBFxj0yxqugroqas3XdAHD05lS55I/wjxJn
	Qy2g90k51HA3yZ9JARqGqmd4fgh1cMXsm9QYzYA5fxuJiD7jiFLd7t7Bn1Ae7IeXPnds0gsNCqk
	Q3g6Da+I430nXdLrjyXEZrsy6vhcCj+sjL2mE9rXdMIz7v7EtcTkdA7+NkyJmfpxNr945UcoijV
	b37LgSN2Qo6yiCyRSPeSybzzqLe98lljEXBYFlvV75w60Soq0XcPKOHbJdxozAU+UXvi1QSDCMD
	3Gebz+Oymq5uj
X-Google-Smtp-Source: AGHT+IHkOcJNo/Wity9Z0cFYPoHGp5mGGyqV4ojdzKoQPMa3YeQBddbXzMkPcPhn6grw+OWJrCaDtQ==
X-Received: by 2002:a17:902:f705:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22bea4fdc7amr10631895ad.53.1744328184325;
        Thu, 10 Apr 2025 16:36:24 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:23 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 5/9] platform: generic: mips: add the platform file
Date: Thu, 10 Apr 2025 15:45:31 -0700
Message-ID: <20250410224536.25021-6-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163626_541613_84A19B63 
X-CRM114-Status: GOOD (  23.67  )
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
 platform/generic/mips/p8700.c | 267 ++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 platform/generic/mips/p8700.c

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
new file mode 100644
index 0000000..ea27118
--- /dev/null
+++ b/platform/generic/mips/p8700.c
@@ -0,0 +1,267 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <platform_override.h>
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
+static int mips_p8700_final_init(bool cold_boot, void *fdt,
+			     const struct fdt_match *match)
+{
+	if (cold_boot)
+		sbi_hsm_set_device(&mips_hsm);
+
+	return 0;
+}
+
+static int mips_p8700_early_init(bool cold_boot, const void *fdt,
+			     const struct fdt_match *match)
+{
+	int rc;
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
+static int mips_p8700_nascent_init(const struct fdt_match *match)
+{
+	u64 hartid = current_hartid();
+	u64 cm_base = CM_BASE;
+	int i;
+
+	/* Coherence enable for every core */
+	if (cpu_hart(hartid) == 0) {
+		cm_base += (cpu_core(hartid) << CM_BASE_CORE_SHIFT);
+		asm volatile("sd %0,0(%1)"::"r"(GCR_CORE_COH_EN_EN),
+			      "r"(cm_base + GCR_OFF_LOCAL + GCR_CORE_COH_EN));
+		asm volatile("fence");
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
+	asm volatile("fence");
+
+	/* Per cluster set up */
+	if (cpu_core(hartid) == 0 && cpu_hart(hartid) == 0) {
+		/* Enable L2 prefetch */
+		asm volatile("sw %0,0(%1)"::"r"(0xfffff110),
+			      "r"(cm_base + L2_PFT_CONTROL_OFFSET));
+		asm volatile("sw %0,0(%1)"::"r"(0x15ff),
+			      "r"(cm_base + L2_PFT_CONTROL_B_OFFSET));
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
+			asm volatile("fence");
+			asm volatile("fence.i");
+		}
+	}
+
+	/* Per hart set up */
+	/* Enable AMO and RDTIME illegal instruction exceptions. */
+	csr_write(CSR_MIPSCONFIG6, (1<<2)|(1<<1));
+
+	return 0;
+}
+
+static const struct fdt_match mips_p8700_match[] = {
+	{ .compatible = "mips,p8700" },
+	{ },
+};
+
+const struct platform_override mips_p8700 = {
+	.match_table = mips_p8700_match,
+	.nascent_init = mips_p8700_nascent_init,
+	.early_init = mips_p8700_early_init,
+	.final_init = mips_p8700_final_init,
+};
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
