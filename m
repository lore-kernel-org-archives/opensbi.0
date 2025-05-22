Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D76C54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJhi4FPzxFLGo5qy4FsY1ipfHBSL+mFstBMhBx0NhEw=; b=Tv1XkEO+Krosz5
	yBGCwrurTFp5bJosZwr+mXkDODccYZkplQoZ57qupEYZFGK5ZfU+zVxfjOPV5327UfuYm0rYcVuva
	1jvTL7s63LvKKVY6N3D3elQ8eLdSkHdBjVyqqm1OvbOAxXHYPYF82B57wkMkaglXEc+H+rydl155f
	xrSPhUofE//fRARE61aNtrgZ8rSh0YfQG0boA6Dq1t76BdoR8ZojgBsLgPJjiaWoJj+5nCEQ9oPGM
	aFb05nUf5Gr9MMoHC/eeDRiLREOBD2LswtM/YIxA8IZefn5EepIS225BtRATBmPVxqucRkfB9mdpg
	bQ5TRM61qucdq/be/bSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMV-00000002Bx2-2SAN;
	Thu, 22 May 2025 21:21:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMT-00000002BvC-0znC
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:21:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742b614581dso6982376b3a.3
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948916; x=1748553716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqXkYLvy/0UoyL1cMzeipwq6cx/r3QgIRyQad/bubOg=;
        b=CRnOa93KMlbw/p95l5qs77YOXQrbZ03REcnLBz26MWfLXRdhayaOpjFkgudYYbgWQl
         5GoH0gmG+ZJg4j0f3hCrImpjIx6xGO/gs3bGGlODUIcgZt5cPltsvYxTrUfazkf70+LI
         fp7GGEL48zlHuJB8EL3KZn9Y8OiXWgzyXSMM/KDhlzjNiDr/eUZlGKoYUxRtn+0QDj24
         cA9dJKxJgja0JGFa9QGUODNQsxP2t23dGvqx1HY6hVZSkV94F1b1hxnvpz7qB+qjHi1D
         IQHU+IaE+IwUFQ36F4pYZbodm9V9fmKojqVTJSu6NGExmV6Sw1qjwroRW1jN3CO4B9B4
         7WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948916; x=1748553716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqXkYLvy/0UoyL1cMzeipwq6cx/r3QgIRyQad/bubOg=;
        b=vKeNJOYIaClvO7OaHHh01ciKifaVa3QdymYxrBEdEOA8n7Y1hsgYPv92ukAm0px2UO
         E22+7xz4FLxNzDo4eMjAH0sm60FXkMN38Mn76n56SI1agxu0jcJsKPq13kN+NeOzu1HH
         suk3+KUZUZP5Q6nTcJJWQMYDTw4AQ/ry2cTAIp+QuW5cQFSi+ePryBwzSnFlnq0evjUs
         AaK1w11ra35Zzjdj5NhQdWv0VcHLxJ3v4+dDGVgv4rbWLpMR/sfwR4NXApc2OwlycEcX
         CIi/NE3X/lKvonxYL+KheGKj3NGwu9srylxok/7yPqEq6ltWLi0qDIM3E9J73MM+NXiZ
         TI/w==
X-Gm-Message-State: AOJu0Yyk6wAfEb3gPagPbzjCFSBUHsyJstXVeoaX21ycl3WC+nDcTa7u
	4iO3jueuO1aWLPwmLJjcg5W1GsusUyQlvNENUK+U/aahbhJNZ8qCyEEfNATsAvMO
X-Gm-Gg: ASbGncsx4Gq/aqnC/MU4wbtlPS663vIe32CRHAx6LKHZitvg+n300fIeeaM/oUlNF7u
	Gaep43dOKe5LylKlrgOBLCwRmjhuw0VQBkS6qcXGuEG0+6gijHt52Rc8O9PY2A85G/NBKAdIKQF
	3NyLE71Rpkfu42gRFofNYtXFyharTxwMxCHiQDW02Mcgv+anp4SC7YPSasc4I+wesfRHmKdPRZP
	qF+4ZHPAQbemXdcRKg/GZJUbPsCfGioH4S2yF712DTPQz99v+Fi8JwWNSHASGjGNLFNMSSqsIis
	L1UWU/iiV2nAjDLZnFs/fdtYREXC+i9ju0l0UEK/TUYDmha5JWg/Ti5e/7tU4ioDFSNdPMB74kw
	t
X-Google-Smtp-Source: AGHT+IFcIgAAcntPj5CNKU/eBWzsT2f/9QMBVNS0emltZN+NturMwpgRItuQQhhzH2WahJdUVAqMZw==
X-Received: by 2002:a05:6a20:6a2b:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2170cde519dmr40647774637.29.1747948915634;
        Thu, 22 May 2025 14:21:55 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:55 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [MIPS P8700 v6 3/7] platform: generic: mips: add the platform file
Date: Thu, 22 May 2025 14:21:36 -0700
Message-ID: <20250522212141.3198-4-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142157_274604_AE7B6BF6 
X-CRM114-Status: GOOD (  23.49  )
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
 platform/generic/mips/p8700.c | 270 ++++++++++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)
 create mode 100644 platform/generic/mips/p8700.c

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
new file mode 100644
index 0000000..6b68717
--- /dev/null
+++ b/platform/generic/mips/p8700.c
@@ -0,0 +1,270 @@
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
+	if (cold_boot) {
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
