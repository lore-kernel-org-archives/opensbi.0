Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCC1606A319
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zs0x0e3Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=WUN498P4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPWVE5K7AkWk7rxNOvSv65sLjgeMldWOCxFMEdC8xuM=; b=zs0x0e3Qqrz94l
	Ef3nou3RZsjAqtUu4rRoju540B0YIE4DBq96c9qy36nUsjf+5Cbmm92sR12NOwba26Mc9IGRXO2Gz
	5LtVlFkc4P6XErwXGVnmh85e3mfPwB6ulZE0eh4qM1Tk359FDMnJ+H4FaRxB1uZq1sNdhWcMbM8ML
	RROLijDOcwDjuhoykts+vI/fSvzcAH63I6vhP3zpqoAgbuYmKWWf2O/zqtL2WoLHJ4DTJXRb/lN8A
	4nBx4oi/eXEmwQJPDUwBd7LUGY+psfZXRklgmCj742etPVlO8VTyT3Qa5IYYXEEFvD7PL4Nb89sKL
	XAKPYr+qFXGcLElXnh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVa-0000000DCMh-4Bav;
	Thu, 22 Oct 2026 02:26:22 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVX-0000000DCJG-1FOs
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:20 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3282db206d3so3239022eec.0
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635978; x=1793240778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/0KSvsHeyHrMmBnUJttyjrm8SPK+x1sXuKOPE5xTME=;
        b=WUN498P43KWSHqiQiXuG84z5tKyEmpAUeY88tVPT9oFCy1UldB+lCPbEnQQijRsNkq
         y//2GFJQoIPq5BDCWHfyMQVOU84pP6zb5+0bBlsX/nWsVLfypwnYV0H4xZCvt2MCD0A2
         4qK9WT8yiGrFiLksQ6X+T18tZGBWYrjr51Kex4DfUQqxnr7MvowGZf+7866lby7dypQX
         ztB+fAXVVKxqKIiInSzIVuR4F4r63p3Sz99Efqc5WT3Pfe6WnTLuYteUzocoS/oD3R/G
         gYbo9/5RIhbkNIBj9RW3kjA7WutuOyp023X5n4YIXa/jyOqyueXHr5FRYYvVh+oASASm
         YnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635978; x=1793240778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/0KSvsHeyHrMmBnUJttyjrm8SPK+x1sXuKOPE5xTME=;
        b=Z9hk1nV2hUXvw8nVtmsodnvQjajU0fVw8qR5Klah5JbdSmaGvN91//czdiGYiAqcyL
         dHzy09vLHNWlm1Tr+EVTPsAVGhvmI/yaxd89a7YuMlKIKIXM+qESnxEAt6JTVssE90Td
         LGYvC06dU3Tg3OkxVcQLhOIv6A1G5OmVxy1aE8A4guyA3Xp8yjlKi3E1bHyI6Ze5QHQq
         GHk094AKS8PKiruETRI3ZdvlGE2okDbad4Dw4oQ4fE5aJZsSrxprOdaXcvsGpEVZGVUR
         W/Qng1m14FeVt20qLGuS00pwe197pYTiC2NVjgsf44CTehG5ALO62tIxmkBjo8oppz/s
         1hnA==
X-Gm-Message-State: AFq9FYIE7UnKtFR9Aw7FW9CUITrhv2Jn11nKKOc6od0u7tU3v4DHCQoW
	GKwc16s4V+8HSgDifKcSSds7oLMuyuTInMqD9qAX6dT+Mwsib+8lh1zfR6/fW3l+/NcP15INVYG
	UcYBPUG+TZFtoAmoB9CkWnFS3SYj3HwtEWeVHDN2Z/XXlQH6kDcWDM3QujxgRH7FmofTwg2TmNk
	PG6YekdCpyWNKuiPfWCLBtdDMq0sFTLyVi/Rh95PAVOMo/yT0FJMI=
X-Gm-Gg: AYBFou2Q3A6U/qD9GXZMhl61WOWcwmDOopulPgt5tPoGYWHPoMwkT8E4ySEvDpbAJok
	K8u4aknXEfZIByEjbowKvG2WG0pbgY1FeuMB0XWo/n/4hnlhmHJ4c9i5KfaqLs1yBFLOWybXHsv
	MKhL9uvK/2Kd39Hrbz3WcAwgctibTw+AQLSPeNg69rwjR1Z8iIGR8zZXaAt0YrwO7k7oLnCrWg1
	B9I0AnxsusXWzpBcckaPVagKeTdxcGCXlhtG09rxSEZA+HVYV008Jn6A567b1Fk6uSR+vJhWRoW
	WiCzTuLSWosAtQCzrjI57cRj1GeuQ1M1qbFpIIFB348aW88Cim8on0jhe0tRVOvgoED6Mml0+6K
	O4W0A4yEWTOA+mtdBWjF4ixlq8sNu5tebxdkInr5nMqnqdvbuPbbg9JJhHCHmrDLl7hg8Jt9Q1C
	N317Xl9ShdPHVHU8+5VCiUAp6VQnoui06fgVgBjUY3LeFswnFE8tSRrtQZDC45GsrIwOstiTDEG
	mmANkuZTtkaulkaeqp/Ghl524GmqBsqluSu7U1OV2jvDmI4bE08WecfdTREt0M7TFWXPPw=
X-Received: by 2002:a05:693c:820f:b0:368:4c93:544e with SMTP id 5a478bee46e88-3684c935c64mr2685107eec.1.1792635978331;
        Wed, 21 Oct 2026 19:26:18 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:17 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Max Hsu <max.hsu@sifive.com>
Subject: [PATCH v2 4/5] platform: generic: Enable feature-configuration support
Date: Wed, 21 Oct 2026 19:26:08 -0700
Message-ID: <20261022022609.1974514-5-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022022609.1974514-1-leo.liang@sifive.com>
References: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192619_337996_29B1064F 
X-CRM114-Status: GOOD (  10.16  )
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

Add generic_feature_config_init(), wired as the generic platform's
feature_config_init operation, which calls feature_config_probe() to
match the current hart against a registered vendor driver.

An unrecognised vendor or core leaves the subsystem inactive and boots
normally.

Enable the SiFive driver in the default configuration.

This completes the feature-configuration framework: the generic
platform can now apply vendor CSR values to supported cores without
platform-specific code, and a platform needing different values can
override them from its own feature_config_init operation after
delegating to generic_feature_config_init() for the defaults.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 platform/generic/configs/defconfig           | 2 ++
 platform/generic/include/platform_override.h | 1 +
 platform/generic/platform.c                  | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 98829884..252fd8fa 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -86,3 +86,5 @@ CONFIG_FDT_MPXY_RPMI_PERFORMANCE=y
 CONFIG_FDT_MPXY_RPMI_SYSMSI=y
 CONFIG_FDT_MPXY_RPMI_MM=y
 CONFIG_FDT_MPXY_RPMI_LOGGING=y
+CONFIG_FEATURE_CONFIG=y
+CONFIG_FEATURE_CONFIG_SIFIVE=y
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 1b8127cb..8e7657a4 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -17,6 +17,7 @@
 bool generic_cold_boot_allowed(u32 hartid);
 int generic_nascent_init(void);
 int generic_early_init(bool cold_boot);
+int generic_feature_config_init(bool cold_boot);
 int generic_final_init(bool cold_boot);
 int generic_extensions_init(bool cold_boot);
 int generic_domains_init(void);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..0ea5dfb7 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -23,6 +23,7 @@
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
+#include <sbi_utils/feature/feature_config.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
@@ -234,6 +235,11 @@ int generic_early_init(bool cold_boot)
 	return fdt_cmo_init(cold_boot);
 }
 
+int generic_feature_config_init(bool cold_boot)
+{
+	return feature_config_probe();
+}
+
 int generic_final_init(bool cold_boot)
 {
 	void *fdt = fdt_get_address_rw();
@@ -338,6 +344,7 @@ struct sbi_platform_operations generic_platform_ops = {
 	.cold_boot_allowed	= generic_cold_boot_allowed,
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
+	.feature_config_init	= generic_feature_config_init,
 	.final_init		= generic_final_init,
 	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
