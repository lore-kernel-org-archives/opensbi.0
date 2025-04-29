Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D3CC369DC
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc3dimuo7Idwlb453KYOtSASfS0Fydm6WWfzASN+/x4=; b=EG0RuUNUPM+/Qu
	e5juIo13APvlfdi15uY5d1cTVZ8e5vkGkpivvGClqcqXDuB7hZ7cE8zW6WGIwtgs29C6+WWukq9aA
	D1hbatB00KquNMuhxY2SSlHKLz+6OGTOw1ifIk5C3AM4cWh9gyWvjh3SkGz1IeH9PnCTgDHB1OAdk
	cxUVzR/ojXtmW5O/XhoJ/QX9n8dQtWO2H8V/C5BSk7ds9PzUBO9jGDMMkuj3qLJA5m1jNi0MwTIUf
	YGFbpgMnqHVRrcecYv3n5mN+Eq6PLV0iGRcRrNb2Tp1GG1+z3OVhMJsuiUB2Q1im9781up6AFVvIE
	NjlVvj3EtU0cjnUCxBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uys-0000000BDjc-1NQ4;
	Wed, 30 Apr 2025 00:07:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyn-0000000BDfm-2Vqn
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227a8cdd241so91143145ad.3
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971631; x=1746576431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnI6VjvXg27LrVUANXajcWzSJ+Zd3fVcXQHpZpIicaY=;
        b=FruQTR0cxNnUJfchStB0mdcIiBJhPPiXFCgcfhxhWD0cgRDRp19QjC+uTrFmzBBiHW
         0+SIfsKaENKUM3Ord7qr0zKlCOH2zIZQ+hmv9XSgthm+mYROSAcifiQ84/dasvFziago
         wbZmj3B0J1s8t7wRotvW+FvBzKfWTzVQrHlAN6l5OXc4drDxtkA2oGTQmy0eyk/XdHb8
         Q3ufoqUZHqIUdU+AJHEOwz78hrKDeaXQzhUHPYaafnhmqWH7ij7A1/ohbRlmnEUMZTsV
         vkYsqZLbDnMaMe7QPaImP94Bs/8x/7p5sYARXwnpHfpfEU85mVwHrseYY6RvHTlgNfM9
         RxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971631; x=1746576431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnI6VjvXg27LrVUANXajcWzSJ+Zd3fVcXQHpZpIicaY=;
        b=ddADGPI1syBvTNrO0EH+9k2f1Q2y10LEw6OoqjeAxvEH11POVURrHKLJQn8pXrkiym
         GZKNAbwaS0dqbLPEslnk6KppGOCVvok+yx3VbYZ3hsDsGK6EAH5zWz0J9Ibq/0sHOBMT
         h9L91QO5LPAxQQ3taTxAwL5RwZppekfJZC8+hWgeJKFkgULLc61YLiveZsiwfcY/ZkS6
         Q2Jatk1Ux5cilhWlq8gEXGinXlJ2MMNLUcPMPpkORTwl9Sy6Oklshl/miTnv9RfxP1tW
         xnwY8DqpyYf3uHNp5MMiMVX8m0UvD3UG4FL2L0K6uUIghIMtf5tlXo/5zapw+kHKNRvW
         daCA==
X-Gm-Message-State: AOJu0Yz9NNpz5x2CNF1wZK9VoeUwHYtErtVl7KhBfMCW8BZD8xQb4GyR
	gF6HfQbRcI+/xVUL4HP68sz0fDSIqcqDw5NiS0eorM6GOf80uYs4V3Ez9Q==
X-Gm-Gg: ASbGncsZTstnxKUPPNCnTeroVRSo50yGrPo7Q+1qnVFzDpty+0fScxQw8m5XZkFNrx3
	9MA5MRcZCXc/V7kcUV6OCQE8oBmTA/EjyEV/S0DYQ0Dk/02pbE48G3NYYD3tkxS4p8dvCAA/Oz6
	gtcyIm2uBAM0oHd9atgjn+J65MFNnQdW6oCZeBVbGcg+/YpttWTw3dynNnZ+Qm3gvWuprzi06m/
	Cn1SjW4kG/xUk3O5uk1701dcE3cXJkSHxPB6gAwBWAgFogWVZn3ubs4h45Kvo1yYBNyzqw7WjUe
	BZO4tDdeuPCi5TA5IZ2mxAhzxS+EPgq/S2dOKqfpZpWwXn9DYlxn8A==
X-Google-Smtp-Source: AGHT+IHdFbw6Cu8uYW6LymvNn3FSjXE8aDZYHIBG5w4rQEJGM6seomaQHtbIaIGmS3OKo0giDiPeqQ==
X-Received: by 2002:a17:903:244e:b0:220:faa2:c911 with SMTP id d9443c01a7336-22df34e8659mr20981625ad.14.1745971631376;
        Tue, 29 Apr 2025 17:07:11 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:10 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 4/8] platform: generic: mips: add the platform file
Date: Tue, 29 Apr 2025 16:29:24 -0700
Message-ID: <20250429232928.6499-5-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170713_639025_9A1F76D7 
X-CRM114-Status: GOOD (  24.01  )
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
 platform/generic/mips/p8700.c | 276 ++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 platform/generic/mips/p8700.c

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
new file mode 100644
index 0000000..9ac8a58
--- /dev/null
+++ b/platform/generic/mips/p8700.c
@@ -0,0 +1,276 @@
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
