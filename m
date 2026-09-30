Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91402CA5FAB
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyEB5Dn1C63+sfOcSHZW8v5a7/qOUbANSc+54U4qV+c=; b=Oj2OMCDmtF5vqh
	1bDLc/vGs1zDZax32pR4gATGjqNn/HhS7PYJyWxoLS7muS3cvaa+EpHKN02zt5TtRtwoWnSKdFr+o
	ZppHynh3lTuQMjmCWc+gIk/k72Zh452TQRCccg99DBHdj4rxwWaDhoTDvKJWSckgUyuEe+stxpLMI
	xeYvs72jLh0Y1laf3yEa2BvoyQveyfEclF5LJtvmlWFEKS2xLnjNZvYB6+9Zwtsy0z18e611Q7CVC
	1XzPpQc6v/n8dlia2d4C7QKuQsjksJ4a7vb5zcdiWZMIbE0b9UKl+oDwsOMnQ35UkFe/udagXLPdS
	RZQldYQIOv0bv64idu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5R-000000054I2-0hQ9;
	Wed, 30 Sep 2026 05:42:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5L-000000054Fu-1uji
	for opensbi@bombadil.infradead.org;
	Wed, 30 Sep 2026 05:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dGtIDCda8qNFrHqwuArbdoGdrxhrJ+C2XkZ4JzJrS6g=; b=mL0AtFcivnGgva0w13a1b3zqZ1
	cQhRhS+7H+fdQQCSyRK3Q68RlCBDYBehtmWthByxpbJyCjpyLIvLUdo7L4BXLDEWU5EvRNNSFwZMu
	WjbiyqZYS07as4L7odjaE0P30xlMtusUl4RmfuebZsADA4xVoxw4mKD8LNSZ/gLQ4ygmgNp2MJi/V
	N5yvHOaRviX9xSxWKtR8yjeKJXJVqRkoPr8E9wdK3zv9urzEB/MBJP3NuKB+DHqw1E9GHJMXlaeOp
	uCgr0ZLy+Fx271YzgWRvfzu7TVu0KnqiyogxcnVf48KY5SZxhK/kkC4zfBRCku1TjuPMHNcLGi+e2
	6aDd5ZNg==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBn5I-00000003Nus-2cnr
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:30 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-343479e6005so1045985eec.0
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746946; x=1791351746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGtIDCda8qNFrHqwuArbdoGdrxhrJ+C2XkZ4JzJrS6g=;
        b=fuT3NQZ1SFo7KLlBOtDGC0y0q7erBmVcZ3dFUCCxHZwaUDpqXLmg2HWGMC4B1aS2ef
         FGkxzemf4aErL3sex1F0gQM2EyJO1G6hoEFqGO2udJtcQDCYxquQ6PbCf7LenIbQnZUX
         J3l5dYWSQCGD/N+FYXFObaNYHaF644LM9lyYK/ij+HA6j8bERjWlP5v9mFRiDoDj3RVF
         PSVo7WiFjcA5aKuC3uT3INq5CKiPV1S7uCe74lpU/tsxp0sGiRzindIOU9a3RDjDw42S
         nZqVnLP+1zB4Ju0DBDqBdrFrXAV5QrJBWVpowzCTJxJVZdds8YjNVIBu2qd2UO855EK4
         Iacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746946; x=1791351746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGtIDCda8qNFrHqwuArbdoGdrxhrJ+C2XkZ4JzJrS6g=;
        b=cSFM7u8efjgG6Ha22jknc2n2SGieLD5yUtx8PVuOi2eyk597MIcC6fQ2/7UOQltrHd
         3InrYRAyEKfFxkFvNTW04uQjICUJW5p2SnGfR+juUDhmQCEFPYAHJJujHzPVIv98OnS/
         QQhQFEKmzrqJpmABk96AhP54AagYIxOzni4zL051TaZo1e9bKDp0nXrJ3kYwsrXcgAQK
         r1USv07f5fTci1zkBoHHtadu8AyHEKyY8V6sNAWh5dSTOswlQhhk0wVynRBSKus+Mm49
         C+fmLtS/ng0V8Ce543YvoAoOqGNXfY0w+RRXU8MgtzmFFQsBszaiF/ETRcYS+D6EEkcB
         sTBw==
X-Gm-Message-State: AFq9FYI8cW58pdM31VkQg3jgLNswlbGeiIXF7s8A0xJeBpkcAKPdnrVq
	4AKE+FY2p9c5A4UZ6O0Ay5xhAyxDrZkJX8ZH85DXPPscG2grjVPHKSJq2CcVisJFxG+RVAGhb24
	TclcjEMTRMTQtXiwcozdNUNXcIkBENvGc9jav1xSlaGSRpnjT0MbPIfWWWKUHl/4R95qsFIbZaI
	xJkoArsMUs3aESiNUeNNJyTVJSKTOQmFyxsyr2IqMzkwYPRD7bqeI=
X-Gm-Gg: AYBFou3XlvQI6EVKuVTPS8aiNLG1rdoaUGW30BYd7/5SBfQBi33kZLX4f6/98Nen0qE
	MX0UNx7022sB97BZ/EIuBaLpPdzLgopsSWhJxtJ3eIsU09ORYq/tdfrBHS+F0EtiA2pFbNUFnkA
	g4l5NuXQTQpIY/xrS7z0mVZrKfCCdDWcCBViuyoXAEZE93F5/9bmnRC83wETp26fOTrIu5grDOp
	XuDfgQxCfSG/a6aC0sRM7lVlxVT/xoysETDoGKuoaNxmsecX+4e8FohHEtCGcI9SSsYirDaqAeN
	XL+jSvqkAVuwXAoyZlxCEBHqjHesXWGWfHLJLR0tkP119bifTvm2D0n9Bntpn69b0/i0F6VLtVL
	XbTCZr3st0xU09355l9AESzIg6moPlySbqJRsw4j3C4OdRFe5hBfBzR2y1xjxmpz/yTJ55/InqA
	vmmQKJTmWm2gtc28odW/w0TuhCVhwkR49VueHtDoI9YoaZfrKfrbGnjloMzEGUZGWTkXQot31uD
	C/fXGWTTP9G3w==
X-Received: by 2002:a05:693c:608d:b0:347:49d2:db76 with SMTP id 5a478bee46e88-34cdd98b8e5mr654700eec.7.1790746946019;
        Tue, 29 Sep 2026 22:42:26 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:25 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 5/5] platform: generic: eswin: Add feature_config_init op for L1_HWPF override
Date: Tue, 29 Sep 2026 22:42:10 -0700
Message-ID: <20260930054210.3498806-6-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930054210.3498806-1-leo.liang@sifive.com>
References: <20260930054210.3498806-1-leo.liang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_064228_858733_34F7A5F4 
X-CRM114-Status: GOOD (  14.69  )
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

Introduce a feature_config_init operation for the eic770x platform
that delegates to generic_feature_config_init() for the vendor
defaults and overrides the HW prefetcher bits on top via
sbi_hart_feature_config_set().

Remove the direct, unconditional writes to the FEAT0/FEAT1/L1_HWPF/
L2_HWPF CSRs from eswin_eic7700_final_init(), now handled through the
feature_config_init operation instead.

Drop the platform-local EIC770X_CSR_* macros, now redundant with the
shared definitions in sifive_feature_config.h, and switch
eic770x_hart_stop() to use SIFIVE_CSR_FEATURE_CONFIG in place of
EIC770X_CSR_FEAT0.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 platform/generic/eswin/eic770x.c         | 36 +++++++++++++++---------
 platform/generic/include/eswin/eic770x.h |  7 -----
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index c71198a8..ceefb50f 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -6,15 +6,19 @@
  */
 
 #include <platform_override.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_feature_config.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_platform.h>
+#include <sbi_utils/feature/sifive_feature_config.h>
 #include <sbi_utils/hsm/fdt_hsm_sifive_inst.h>
 #include <eswin/eic770x.h>
 #include <eswin/hfp.h>
@@ -51,13 +55,13 @@ static int eic770x_hart_stop()
 	 * When some or all warm boot harts haven't gone under at least 1
 	 * cycle of hsm start/stop, (happens if reset is issued in pre-
 	 * boot environment u-boot/UEFI where all warm boot harts are
-	 * pending start), the FEAT0 CSR still holds the SoC reset values,
-	 * and disableDCacheClockGate is set. A CEASE instruction executed
-	 * when disableDCacheClockGate=1 will not properly reflect its
-	 * ceased status in mcput_cease_from_tile_x. Thus, clear it before
-	 * CEASE.
+	 * pending start), the FEATURE_CONFIG CSR still holds the SoC reset
+	 * values, and disableDCacheClockGate is set. A CEASE instruction
+	 * executed when disableDCacheClockGate=1 will not properly reflect
+	 * its ceased status in mcput_cease_from_tile_x. Thus, clear it
+	 * before CEASE.
 	 */
-	csr_clear(EIC770X_CSR_FEAT0, 0x1);
+	csr_clear(SIFIVE_CSR_FEATURE_CONFIG, 0x1);
 
 	sifive_cease();
 }
@@ -368,18 +372,21 @@ static int eswin_eic7700_final_init(bool cold_boot)
 
 	sbi_hart_pmp_set(PMP_RESERVED_B, PMP_L, 0,
 			 log2roundup(EIC770X_MEMPORT_LIMIT));
-	/**
-	 * These must come after the setup of PMP, as we are about to
-	 * enable speculation and HW prefetcher bits
-	 */
-	csr_write(EIC770X_CSR_FEAT0, CONFIG_ESWIN_EIC770X_FEAT0_CFG);
-	csr_write(EIC770X_CSR_FEAT1, CONFIG_ESWIN_EIC770X_FEAT1_CFG);
-	csr_write(EIC770X_CSR_L1_HWPF, CONFIG_ESWIN_EIC770X_L1_HWPF_CFG);
-	csr_write(EIC770X_CSR_L2_HWPF, CONFIG_ESWIN_EIC770X_L2_HWPF_CFG);
 
 	return 0;
 }
 
+static int eic770x_feature_config_init(bool cold_boot)
+{
+	int rc = generic_feature_config_init(cold_boot);
+
+	if (rc)
+		return rc;
+
+	return sbi_hart_feature_config_set(current_hartindex(), SIFIVE_CSR_HWPF_CONFIG,
+					   CONFIG_ESWIN_EIC770X_L1_HWPF_CFG, false);
+}
+
 static int eswin_eic7700_pmp_configure(struct sbi_scratch *scratch,
 				       struct sbi_domain *dom)
 {
@@ -486,6 +493,7 @@ static int eswin_eic7700_platform_init(const void *fdt, int nodeoff,
 	const struct eic770x_board_override *board_override = match->data;
 
 	generic_platform_ops.early_init = eswin_eic7700_early_init;
+	generic_platform_ops.feature_config_init = eic770x_feature_config_init;
 	generic_platform_ops.final_init = eswin_eic7700_final_init;
 	generic_platform_ops.single_fw_region = eswin_eic7700_single_fw_region;
 
diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
index 9c80b589..58d317d0 100644
--- a/platform/generic/include/eswin/eic770x.h
+++ b/platform/generic/include/eswin/eic770x.h
@@ -16,13 +16,6 @@ struct eic770x_board_override {
 
 void eic770x_cease_other_harts(void);
 
-/* CSRs */
-#define EIC770X_CSR_BRPREDICT	0x7c0
-#define EIC770X_CSR_FEAT0	0x7c1
-#define EIC770X_CSR_FEAT1	0x7c2
-#define EIC770X_CSR_L1_HWPF	0x7c3
-#define EIC770X_CSR_L2_HWPF	0x7c4
-
 /* Hart ID to core/die conversion */
 #define CPU_CORE_BITS		2
 #define CPU_CORE_MASK		((1 << CPU_CORE_BITS) - 1)
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
