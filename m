Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D394D358D9
	for <opensbi@archiver.kernel.org>; Thu, 29 Jan 2026 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+QhySKhlLyL0HCbKO0oHDyOeKMPdxOx9ksv/O4xtRs=; b=gVLYoug0J2idEh
	L590yGdO5i9BH2Zwm02FVrXVt1H7o1VjoIPLjJLnmXaqtF8/doR+mWz9IPBIo0o3St5z9MZeewHpA
	HrtoAT8QhW0QTBrfXzklwq0namCujjUIh31dMCyMoJM/GzunvX31KMFv5lM7ikc4+Yt2zRCx2p0jR
	xfTKWaBWpEPXbt25ehrTOR7FxRTBO6f7aMrcBo1d8UaklBZdMSmKj2XgXOdch91Rwf8HDvOedvu2p
	4LyJQo72ERJVfCB2GAKBMaCSy8MXs6I106++38uvQdpaP2uDeRHVgYNQcSw6xqnfEIjluXAlJwxFV
	ciq9oITh3ClbLW1rFEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA8-0000000HQpo-3d5w;
	Thu, 29 Jan 2026 08:14:00 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA6-0000000HQoi-2zMT
	for opensbi@lists.infradead.org;
	Thu, 29 Jan 2026 08:13:59 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1233bb90317so1600875c88.1
        for <opensbi@lists.infradead.org>; Thu, 29 Jan 2026 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769674437; x=1770279237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ora8Y+xP0w1izyNVSHFIfeKovm1U2il8p1k7w+/vYlg=;
        b=Z+7wHTNlmYkXUhiSDVsjVAwZU4XsL3WJZpOItTVJLcSpC8b5Ni1kgzbf7eLpqBPdFE
         rz0Lr05oSO6bbxjenpZnwE3RpJTT2Vr3yC0GgDpZtvQdqjKHPQPZyLmr/5AsFC8foYMr
         7Z6AGuUgA8YsZmkKBR3FSLlxX4vhztNmK2Ont8Tp69690u/qWv/RT2V8EDBRoUUlZ6Pr
         b7hG+OnBBNB8WefVzZSKzaXMI5EPH13uNHmoTa+Eb5vGU9nnObMsfZpz7OtBXgR/t9/P
         cb/DE165E4U9fpMIKfcweH24Toqyc/XHJyuX+lBBQwtiCfyNRM0p4/QFkFy7Fwv2qRWG
         +bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674437; x=1770279237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ora8Y+xP0w1izyNVSHFIfeKovm1U2il8p1k7w+/vYlg=;
        b=IOMVpFx1D0LV7qCC23sp9tgkbgr3JXKg7QBqWcp7/Rw2DNaGFQx0JhQwnksvh7d16P
         tFXgeicD4+wu3p9zbJCiM7CSKF7uS4WGU3fzG91RSPjhQyhNlAfBV+NhFis4wBgB6dCd
         9XmRjhs/tYty1bsMdYwKSHGhtYMff2CbXNSsPKdMnIjsZYCOW8mPJq4276LJVfAvHAik
         wh1kigx1SZNKr6hII8Y2jTdpcJNasbTIiHykn4maQ6mqlZCYcfWNvwdRNdJKfpqEaWoP
         R0oIT/79FyVh9TFWWSFdczG2rlYTII5v4oahvdYXK+Pv8HESXitxqX0CYfn8Yt/vTNhR
         RYaA==
X-Gm-Message-State: AOJu0YzajPPpcBe+5+UdsIOqYaUxu/Gz+9obneknvHwYJI974HOsUO4d
	vQJoQ8SSA09j5Cg0euXV8/8JkUQ4vX4Yiyne6YmnVT2IkxKLv3XlLMExfghDMwnzKQaMlA9C1tG
	lRV2CIoWrr1Ixku+kOX8kST2fWTVSgJUQ41cVH1Us28eo5Hv9jpyDtzdFFMSXJM5XMFWsw9rbqb
	Fk1G98RA68e988lcziSSxe6+F2J8X1AsQfRJhn8jnyXvWs5zgdniSc
X-Gm-Gg: AZuq6aInPM6o+Cxj92ezAWVwW/BxpmeIvebCUIEf+zV60K1UUvDVcGpqsBrJ/TUGjvv
	3W+wqu/AnW2Vtnxl9FF1L0CSWDjOravCWWMjI2+oQ0nPLJehZ/EDFa36SErZPKZR4uOWTNQgSGA
	tvLonfH3YZeTRlFpqBU5VBm/VYPprbdFEOsLST1394Oh0YmhDsAirGhg9zapFYuUAydAocWzq81
	VDwmjFyk8bPcFL7de6nkdg5uUbyU8wMTqBVl9+X1u/Hb6m0LEb+05II5HsXi8tviklXBATU/PAP
	E6Hm41545iz8OkkqWv9NhTkafNBguDStw0+A4YsueepOE8Lblcooi2aRc2lRLRTw3N0gnhZmPic
	RDMZvVCMkrZW6GglCQcNg1SiI6kD6nzaab/vIb5lMZBMoJ0VAteJMEvr3eFSAx8b1UgoNBqypgx
	v0r00G0kXrO50z8swCvvi1QehUJiw=
X-Received: by 2002:a05:7301:1f13:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7b180298bmr765167eec.14.1769674435805;
        Thu, 29 Jan 2026 00:13:55 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm6042480eec.26.2026.01.29.00.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:13:55 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 29 Jan 2026 00:13:42 -0800
Subject: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
MIME-Version: 1.0
Message-Id: <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001358_782065_986F3062 
X-CRM114-Status: GOOD (  16.32  )
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

Enable the Smrnmi extension by:
1. Adding sbi_rnmi_vector_init() to allocate per-HART RNMI context and enable RNMI via MNSTATUS.NMIE
2. Saving and restoring CSR_MNSCRATCH and CSR_MNSTATUS across non-retentive suspend/resume
3. Calling sbi_rnmi_vector_init() from the cold and warm init paths

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_hart.h     |  1 +
 include/sbi/sbi_platform.h |  9 +++++++++
 lib/sbi/sbi_hart.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c          | 10 ++++++++++
 lib/sbi/sbi_init.c         |  8 ++++++++
 5 files changed, 71 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 7d038a18..3e442546 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -128,6 +128,7 @@ struct sbi_scratch;
 
 int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
+int sbi_rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot);
 
 extern void (*sbi_hart_expected_trap)(void);
 
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..c4f6c456 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -149,6 +149,15 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+	/**
+	 * Platform-specific helper to program the RNMI trap vector.
+	 *
+	 * The core will call this from sbi_rnmi_vector_init() with the
+	 * firmware RNMI handler entry address (rnmi_handler) and the
+	 * cold_boot flag. Platforms that support Smrnmi should implement
+	 * this; others can leave it NULL.
+	 */
+	int (*set_rnmi_trap_vector)(uintptr_t handler_addr, bool cold_boot);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 495ad1d8..baebc438 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -28,6 +28,7 @@ extern void __sbi_expected_trap_hext(void);
 void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
 unsigned long hart_features_offset;
+static unsigned long rnmi_context_offset;
 
 static void mstatus_init(struct sbi_scratch *scratch)
 {
@@ -833,3 +834,45 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
 	__asm__ __volatile__("mret" : : "r"(a0), "r"(a1));
 	__builtin_unreachable();
 }
+
+int sbi_rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	unsigned long rnmi_sp;
+	void *rnmi_ctx;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	const struct sbi_platform_operations *ops =
+		plat ? sbi_platform_ops(plat) : NULL;
+
+	/* If the hart does not support Smrnmi then nothing to do. */
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		return 0;
+
+	/* Platform without RNMI vector hook cannot support RNMI. */
+	if (!ops || !ops->set_rnmi_trap_vector)
+		return 0;
+
+	/*
+	 * Allocate per-HART RNMI context area once during cold boot and
+	 * remember its offset inside struct sbi_scratch. All harts use
+	 * the same offset but different scratch pointers, so each hart
+	 * gets its own RNMI context.
+	 */
+	if (cold_boot) {
+		rnmi_context_offset = sbi_scratch_alloc_offset(SBI_TRAP_REGS_SIZE);
+		if (!rnmi_context_offset)
+			return SBI_ENOMEM;
+	}
+
+	if (!rnmi_context_offset)
+		return 0;
+
+	/* Set CSR_MNSCRATCH to point above the RNMI trap-regs save area. */
+	rnmi_ctx = sbi_scratch_offset_ptr(scratch, rnmi_context_offset);
+	rnmi_sp  = (unsigned long)rnmi_ctx + SBI_TRAP_REGS_SIZE;
+	csr_write(CSR_MNSCRATCH, rnmi_sp);
+
+	/* Enable RNMI now that CSR_MNSCRATCH and the trap vector are set up. */
+	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..f259c257 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -49,6 +49,8 @@ struct sbi_hsm_data {
 	unsigned long saved_medeleg;
 	unsigned long saved_mideleg;
 	u64 saved_menvcfg;
+	unsigned long saved_mnscratch;
+	unsigned long saved_mnstatus;
 	atomic_t start_ticket;
 };
 
@@ -430,6 +432,10 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
 		hdata->saved_menvcfg = csr_read64(CSR_MENVCFG);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		hdata->saved_mnscratch = csr_read(CSR_MNSCRATCH);
+		hdata->saved_mnstatus = csr_read(CSR_MNSTATUS);
+	}
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -437,6 +443,10 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		csr_write(CSR_MNSCRATCH, hdata->saved_mnscratch);
+		csr_write(CSR_MNSTATUS, hdata->saved_mnstatus);
+	}
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
 		csr_write64(CSR_MENVCFG, hdata->saved_menvcfg);
 	csr_write(CSR_MIDELEG, hdata->saved_mideleg);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..60a24809 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -273,6 +273,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_rnmi_vector_init(scratch, true);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_pmu_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: pmu init failed (error %d)\n",
@@ -432,6 +436,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_rnmi_vector_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_pmu_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
