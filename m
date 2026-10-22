Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E21606A31A
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iGqebpT+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=nANSSMud
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioyCpWu5Ln/oeTLBxmG2iuRNs20YKIQqQyl5U6YS3AA=; b=iGqebpT+zxmTGp
	g1Qr2SLzIKQ/wPathrzN9kFm6oPXwKmK/mp/t0uIyLx1GM6qNrI4/KhMc6gq0pc0eEHpl9p6oV4V2
	f5yvuhRmehyBLbN43rb07faeJn8/FUuxhvTG4Q4Jow9atun1Ps4n+NpZ20ru4fNZEb1JmEpud/wPE
	FG6Kb8Engxd4GLT0Z6rJEODaTLP9heLBUipYP6Qt6g7Kdf0C94bPTdwbdZVeFVzeXUMBx/Pygx9zl
	AV7gL9iT5VzuOKJkaZKT9u7iAxFi3UuxDiLN/l+dB7yg+rEhmKKTAFwVTrarXjZsAKAN9qWj5WQYO
	Udj3ousqU7bNuVDWGbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVd-0000000DCOX-0gfX;
	Thu, 22 Oct 2026 02:26:25 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVY-0000000DCKn-3ZHK
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:22 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-35d0be18c71so491446eec.1
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635980; x=1793240780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ln/k54Twq+cDDa8dwnND+1jfxu28h4q8w7ygl4/2JLI=;
        b=nANSSMudzDLbWqEp0BRImoE5LdkHXlWE45DmpgI8Y2RRZ1sfPQMw73Btu6xdtYHtWg
         NsBj1UeeHn5CMTlNHIbrliZPguu/h5x8AOOw3HjwXpFcw/wp9EXfSB5pIemNTxALUn8D
         qp58CzCXXnycUzB01VmgNv4adCI1XxXNDt8DJod/wkGvXIZJBI7eMMMthzMPwKtNf7X0
         sZx0AfZeCTHXIcYiVO5SrBmzB+m1oTqER7Stdi+MftQ2k3sADBEfm/ylQTMbTPRgFVZk
         sTWRW5lgbpsHm8hRdY13dXid+MMGqZmh2XyBzRAlIBd9qJSkJHh+OPxINxdXgax04WPZ
         /gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635980; x=1793240780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln/k54Twq+cDDa8dwnND+1jfxu28h4q8w7ygl4/2JLI=;
        b=d6QWwCy9TZYddSx4Qj+rrEm2H7VzQwPt0AU7GzqSnbQbg7jkKXoK4Iz/Ga5ZytChYT
         ZL1cVedRUuAHDofc0R9T4JFG2Mn4HjVHS148UHj3X2nTwo6GEH7vnys4u4zORVF5O4nC
         S78LQ/o6yf+GHElcr5SYWZ+93mUv34S8D5ElX0sJ0Rp7zKeKCld0CCRitOzbipecXbBe
         HoqNQoMH4gg7fqhG/sUrsUpKXAzIvErQdaOnx06p+/0eIHaUa8vVgtwMDVcjc3GqzuRb
         DvxpG3QGmHPh8J+V7FO2E6PQtukfWY0gXns+qSFFrfDwj1TVMFiwTzsnlvoxRktX+dnN
         Y0AQ==
X-Gm-Message-State: AFq9FYJHvRkf1JbSDS54uxkXqtlLfvK19laS9H7TQzrPEWF0rRsX/vDP
	lgrM6ust2QYGfPZXoXNJxqGjeUGIPl8JohB68wgNIPe404vYqDjaeTIyPD0eTurKinkbraz3L36
	4Lom44NEx63gUcCEbjrNez1foxnrm89AZwN+cG+52EH13UncUQK9zyWsr5mGmqwhtmnUjMfcgI4
	n1Cb3W6YHriFFZVoXh3f127LKD7UhL6oz0faPSNX2CvWcdXOBdVLk=
X-Gm-Gg: AYBFou3cseK/7yW1X8FWLjZCImKDRXy78E/KYyqC9s445eadXYivwrGe0PRpAb17zbl
	Y3r6bKYmX+P6lqcuhLdjKH8PyA5vnypvyAKStP3ACQJyq83w0EIeOnoR2I99F6AMwTV7d+8CSZq
	2FeZrB4YRU48/VUWqrEJ2T/Ks+rR3YwceZLaSOQdWSjuo/lbF4IrwBWrld/fB4XaMtCM7iok+iB
	MEE9yEaS4HHSNVD0aeBRDLBVhd89WCS9mEhzKA3unW+MHVgiM8GDb379S6sDFSYbSO1OT+MOLB9
	JUYetOuVqpJxubrkXTFRixLbPcJa5PdHkVJJSUomOBYglTUobeY81T/vI1RHuk6AzBSY5PV727j
	SQgxaDySvarKIKJDknNfGd7qUJ+KGi5D/ERBE5PkSAyxRk5hgELEgN7IXYxc2PzoM2jyjBseZ+4
	xJ9wzfPgjBFvR4eme20+oiJIluOAsvaWytO3zIkAfBNJhCwpcfEzAZKp58/+8YRMR2e/wF+dZNQ
	0EkxxVkYcXFMjfbr8LTV4Szyb8wjXnYkqOH+RA8U/+ggerHtz8IrpqhI+6cQLKxihQ1ToY=
X-Received: by 2002:a05:701b:451c:20b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-192ee30df90mr1343159c88.3.1792635979569;
        Wed, 21 Oct 2026 19:26:19 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:18 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Max Hsu <max.hsu@sifive.com>
Subject: [PATCH v2 5/5] platform: generic: eswin: Add feature_config_init op for L1_HWPF override
Date: Wed, 21 Oct 2026 19:26:09 -0700
Message-ID: <20261022022609.1974514-6-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022022609.1974514-1-leo.liang@sifive.com>
References: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192620_902325_8B92D2DD 
X-CRM114-Status: GOOD (  12.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
EIC770X_CSR_FEAT0. Also drop the unecessary Kconfig options as well.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 platform/generic/eswin/Kconfig           | 21 --------------
 platform/generic/eswin/eic770x.c         | 36 +++++++++++++++---------
 platform/generic/include/eswin/eic770x.h |  7 -----
 3 files changed, 22 insertions(+), 42 deletions(-)

diff --git a/platform/generic/eswin/Kconfig b/platform/generic/eswin/Kconfig
index 7326686b..9f38566f 100644
--- a/platform/generic/eswin/Kconfig
+++ b/platform/generic/eswin/Kconfig
@@ -1,29 +1,8 @@
 # SPDX-License-Identifier: BSD-2-Clause
 
-config ESWIN_EIC770X_FEAT0_CFG
-	hex "ESWIN EIC7700X Feature Disable 0 CSR Configuration"
-	default 0x4000
-	help
-	 CSR Value to initialize EIC770X_FEAT0 (0x7c1) with.
-	 Refer to EIC770X SoC TRM for recommendations.
-
-config ESWIN_EIC770X_FEAT1_CFG
-	hex "ESWIN EIC7700X Feature Disable 1 CSR Configuration"
-	default 0x80
-	help
-	 CSR Value to initialize EIC770X_FEAT1 (0x7c2) with.
-	 Refer to EIC770X SoC TRM for recommendations.
-
 config ESWIN_EIC770X_L1_HWPF_CFG
 	hex "ESWIN EIC7700X L1 HW Prefetcher CSR Configuration"
 	default 0x1005c1be649
 	help
 	 CSR Value to initialize EIC770X_L1_HWPF (0x7c3) with.
 	 Refer to EIC770X SoC TRM for recommendations.
-
-config ESWIN_EIC770X_L2_HWPF_CFG
-	hex "ESWIN EIC7700X L2 HW Prefetcher CSR Configuration"
-	default 0x929f
-	help
-	 CSR Value to initialize EIC770X_L2_HWPF (0x7c4) with.
-	 Refer to EIC770X SoC TRM for recommendations.
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
