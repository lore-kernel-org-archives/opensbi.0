Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2C5C61DCD
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2gsdpLTeMdCNYVug/fCsq8xJpgt+sWYtoNhAKot0Og=; b=VDV2Ecl/Io+jjg
	PjrzKQQnqR4u+35YFvQP6stVBDDTMEMUZIhbeHUf1/naUzzWxNE6DtaGgHNWpN5WT7A+dd0v0eGz0
	ApbpFjnpE36Vg9rZp0DHlAx+q5dwSKoQ3wk9hBtQoJYRvLYYKjwMvO+rqTlY5Wz31a4tfZDQ0MO5W
	8F435NmfOQUTCjnDdptMkCgEsiW5fhNfanhqsyN4db9TbvvyqEtaI93SoeZVoNCCTUiMpI9k4ndoI
	7cI2zu2WH8lJvtQIWdPulNOKZCEni/xQ3d3scGcch2qFWIy6bkbtcge9wIm51waT5D6J7qQFjob0K
	Dffi/K1MTsppetMFRw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmV-00000005BPq-0fMl;
	Fri, 28 Aug 2026 06:09:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmT-00000005BOj-06A2
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 06:09:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38759bcd877so605245a91.2
        for <opensbi@lists.infradead.org>; Thu, 27 Aug 2026 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787897376; x=1788502176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCghARvrlSSDwf0Pbr/0UIqwsTlbjghwX717x3hCQWo=;
        b=Cj6Wf3bnvPBpKOEPffN4RZEyRXf3sSmA7l5MplGT7P8dXKPL8ONyL6Z9SbNwuIp3ev
         Cns5FLzauDoFnTse0Ll1Vdvoew12jKOApd+muYsC1eZaUdU0RHG+2uIPtha3zcy6zZA5
         pUfLBJJzbpI3Kmt/CPaFC4Dljbx/kdKxnEiCz4KKB3DvqJGSnnbLB+GZoTo2GAdc6DbI
         Wbfq/Hoji9ygxWeecViokiUou4NEZnmA8/ad234YcXisDphrZu1PuhKUBSNyFNmIe2f/
         fMjrfrG0iVvFpeGvEgSBQdMeh1bmXKqky6ujdS+f2DEOmfg6VkMypVLtn03gl8BP7BhV
         qdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897376; x=1788502176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCghARvrlSSDwf0Pbr/0UIqwsTlbjghwX717x3hCQWo=;
        b=MBIu692vJw7+gPZlXF/jaX++I9ztqffpOp6Wp8k6GaSW9GUiYN4k+J2TyYDa/5Z2Fe
         6hFaAZo1TDQdJ3R4s/qEJ+U7wUEbkk3bqUDgL9qps3H29lzZvItfBt3XOSSL/zCLoX9S
         TKPk3DomeQQX99jkn+NBne8GJAuLr/ynx9eiW0pPrMdlbD8kkXyfkBLAAOfuKAc/o+IU
         AZKvmJQBFPolpOj8RVI+BrQqQLT79hUsAPD75XHBW3CP5vvrbudRA52494MyP8KaPg05
         Je1jhYRyFB0O388yFxLVhinW2PKR1LBg46oa/9+TgSUfvYEF7PdH0WoQJYDUroo+qhCa
         9U3g==
X-Gm-Message-State: AFuF++kpZbcd18miST699bf9Eu64E+KJNZRog+q/x8IT91hqgJeXi5pA
	z4hLnE7r0kwciev6gUar18N8P4mJvE/AEmZTzYGxnpHC/9zfcYeoFS2iHVBGvHWVkTVi64Sns+Y
	fU91ACv3VPjmR60dQjj6v+HA7UjakhLW1fagOytZtl+BP36J4Ds/cnXAr9jtWk30QUmudWDiPJE
	sjH9CjNf447M2sb0jgA7wzP473/dpH21VF7XnF8I0zF0DKPzfHdA==
X-Gm-Gg: AR+sD101sVhhQH5GLBimImVvmnkBbWhPFt/9ieBORBHdnKyLWfTSbMvvUEITEzPsEfr
	HQ/ui9XG3eGcdtigLhFFMuZbxxSY/D26gyIaxI5omYwEkzJ+8eUH6LonJSAyuZsUX3qIh/ks71O
	GeHXb4luJC3jNU3qVVzPQsJUNFvJWYNdPPRIhiVMMLfrTiCx3pPEdQYeRPWQgG2o/E07WEyaAGf
	Kij3w9FtBrRXxJqADYHoblzLyX8QHhmIxrzqpKvHjgk3rcDxPHt2ny3X4N5cLi/td5nz35GJEn9
	jwwpI60Zva6JjBEJHJfsDVAIR2s4bNyyxDoQkhaMhhriATi+GhOLdGf7DSfYua89RC8ut8qFfC+
	s4Td3tB0lf6En6Jz8JzIgpCVPfyFxj8rzm+9gUukULpdLBWyDSDzLVOrnx6UHTZRphIdH1dK/7s
	P+c6E7E4GAspBMBr4qwNmfdLv26vHlhwCq8Nlp6ETrKmvoF7ex925aUU9Wr2jTGlMIZpyLsiw=
X-Received: by 2002:a17:90b:574b:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-396d10178d6mr9961164a91.14.1787897375869;
        Thu, 27 Aug 2026 23:09:35 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm1995864eec.17.2026.08.27.23.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:09:35 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Thu, 27 Aug 2026 23:09:31 -0700
Subject: [PATCH 1/2] lib: sbi: Fix Smrnmi init and non-retentive suspend
 handling
MIME-Version: 1.0
Message-Id: <20260827-rnmi-trap-fixes-v1-1-df371cf92301@sifive.com>
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
In-Reply-To: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4677; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=P/dTnUnp+ggK1jQnZHXXUzEUuyNsdf8ejC5+tXggD4Q=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqkSYen1gK/mnQfvxfPFr5Ayhj7P0eKpv6YQPqw
 juHlwrrfyGJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapEmHgAKCRCIoTSWt/mH
 4Ck2D/9zY8FVQQ5YNWLbJBrlh/KRfZp8ok21V+2pUrRlAd3PNrFehmxdOddQUgJ+b5OcsUz63KL
 j1OtQqZKm0CNTLnRncg8L2Kglhs8f3ZVt+j+lPjG8J5Z2fTPS9aRkBu68Z49mYqPObNjDSSotF2
 GG8cCtohnzkzVl4Q9zH4nVm8sO8pGZ7XVIWfCJOJ5u1osX3E1hjkR3rPIfFkPWqpxKle/HIhOWB
 oJf/Zdvhvg4fC0bVSxjwGIE2wBPvr0b0dDI9cdGoLJvwAukrheFjskc32Z5pJuruy6QLKpo0J2W
 H9BDxIzsNJ8n2L/9hIskXnxC4M3pmw27tY5fd63UXWkVVwFYeDqtLZNBMOm9wii/8OtEXkzS01R
 4jBGnCWGASWZnS/NGzNWFFJQyXIxO13gSBHrF2Ojd3dwNsEZrcsEzSaJ9O9rdsbMBubZuIZfyfk
 aHpkqxaIOZTc3y0XxPhdx96GfuAlFo8sddcM1o2kd5cvL9S3MuNn66Q75dGpcTg2xYD649KQOoC
 4vcXipQ85tD5FG9BYm7556sSApw6fDf+qcnIwV8b7GJdISXFSB05TP3BTmVY+lN+nZrMLho9feY
 Mtp8fhc8MCRJ7/SIaB6oXmcMM2xAZAoVjHxBgJVsM9/+BA7KBqE/DbcU8p1xn8b60BabxQJXsi2
 mRdKCngpLEPwSOw==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_230937_074433_F14EA89A 
X-CRM114-Status: GOOD (  15.71  )
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

From: Nylon Chen <nylon.chen@sifive.com>

Two fixes for the Smrnmi extension infrastructure:

1. Extract Smrnmi CSR setup into sbi_smrnmi_hart_init() and call it
   from both hart_detect_features() (early, before trap-based probing)
   and sbi_hart_reinit() (covers non-retentive suspend resume via
   init_warm_resume()).  This removes the need for save/restore of
   CSR_MNSCRATCH and MNSTATUS in sbi_hsm_data.

2. Change smrnmi_handlers_init callback return type from void to int.
   Allow NULL callback for platforms that do not need to program a
   vendor-specific NMI vector register.  Only set MNSTATUS.NMIE after
   the callback succeeds.

Fixes: 2d211fe6f9d5 ("lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection")

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 include/sbi/sbi_hart.h     |  1 +
 include/sbi/sbi_platform.h |  2 +-
 lib/sbi/sbi_hart.c         | 55 +++++++++++++++++++++++++++++-----------------
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bba41526017cd95596348e26eaa897850a..03f12717572f402d77e4e78f8d29c93a5fa0343d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -132,6 +132,7 @@ extern unsigned long hart_features_offset;
 
 struct sbi_scratch;
 
+int sbi_smrnmi_hart_init(struct sbi_scratch *scratch);
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 1e9a23c1252558879c683633ad000828fbfa8f3f..d55805defafb0a7935d0d95653aefcc622078f69 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -155,7 +155,7 @@ struct sbi_platform_operations {
 	void (*pmp_disable)(unsigned int n);
 
 	/** platform specific Smrnmi handlers init on current HART */
-	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
+	int (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
 			void (*rnme_handler)(void));
 
 	/** platform specific Smrnmi NMI handler.
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee8855772d8bfe452a1f9f086ece2a7ab8bbe6b..287d7ba7c4e110d77b3cb68929a6309e15ccd7fe 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,6 +466,37 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
+{
+	extern void _trap_rnmi_handler(void);
+	extern void _trap_handler(void);
+	const struct sbi_platform *plat;
+	const struct sbi_platform_operations *ops;
+	int ret;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		return 0;
+
+	plat = sbi_platform_thishart_ptr();
+	ops  = plat ? sbi_platform_ops(plat) : NULL;
+
+	/*
+	 * Platforms with fixed or mtvec-based NMI vectors need no
+	 * vendor register programming; NULL callback is valid.
+	 */
+	if (ops && ops->smrnmi_handlers_init) {
+		ret = ops->smrnmi_handlers_init(_trap_rnmi_handler,
+						_trap_handler);
+		if (ret)
+			return ret;
+	}
+
+	csr_write(CSR_MNSCRATCH, scratch);
+	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+
+	return 0;
+}
+
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_trap_info trap = {0};
@@ -487,25 +518,9 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
-		const struct sbi_platform *plat = sbi_platform_thishart_ptr();
-		const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
-		extern void _trap_rnmi_handler(void);
-		extern void _trap_handler(void);
-
-		if (!ops || !ops->smrnmi_handlers_init)
-			sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
-
-		/* Reuse _trap_handler for the RNME slot since RNME is taken
-		 * as a regular M-mode trap with NMIE=0. */
-		ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
-
-		/* Initialize MNSCRATCH for the RNMI handler */
-		csr_write(CSR_MNSCRATCH, scratch);
-
-		/* Enable NMIs */
-		csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
-	}
+	rc = sbi_smrnmi_hart_init(scratch);
+	if (rc)
+		return rc;
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
@@ -698,7 +713,7 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
-	return 0;
+	return sbi_smrnmi_hart_init(scratch);
 }
 
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
