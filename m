Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE30B105F7AD
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QV0sTxA2G0wJWXuODwYaGlfjGblxfKsRZl0CM3f9cxI=; b=uuXssiDgw6Kmbx
	hLf38kiXczcM2lsbXPXRq0iHFOGbliWkSzMvYKPwcLvrzPdXik6Xz81c5mN8rLDx3oR4+BJ+w7AF0
	WinBzkBGrUzwWXaQT8TVkK9THFXVe31xWdFtlHsbxvXfkobzQU1+mNKDguy9FMoLu9W6CymfN9Ass
	1N9Pl5cFPi2H0/EVuY83c0sIrtxKF/RZ22t3bktw7y9YHCY3t2lr7FnfnYCkpXrnTc1hlH7eYCOhr
	Bbladj8co4kchz5JvRZxWtxzufdPp9hGTvyO+t/VMiCnlURj5c6neY+apz0uodLPBZcBdPFzShJVY
	FkwkYfy5RmQc371tKjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k8-00000000IVp-3u24;
	Fri, 13 Mar 2026 13:39:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k8-00000000IVA-1g6C
	for opensbi@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lP4z+EmNgFLG/lm7LFiezQiGuu52Dq4YyOWYpq21OyY=; b=C0l2wvW6TWjZ5D9c6NrJ/e8AaZ
	MgdgeADNA7IcxTdISFXE1SJQPIKnj8cAOZ+gE5O6beGFsUCmvJG27ZiHq5yK6Zzskb+ML9StqFjpW
	gCZnbW8PCd3btEVydadETIZc69EON3q4ZSxCCOxZQ673ANjgyzvhXyEXSRnYZj/20UPOeAdnoFu/u
	3MRBwFZ5Mu9VNYMoDkuz15D47KaP4VYFIUi36oD2lIPGovlLdl6C/pWec0U0rLFc3tOD2vfKZAwql
	24p9trnJdkA1UUjl3hkA324nuXyPJsueOXzJav2LtDx/3ZCKgF7wDchRXfCqFdEj6HYDYGQdnYkGb
	1ehoT2Fg==;
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12k1-00000003PpF-0qpt
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 13:39:54 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2272482eec.0
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773409185; x=1774013985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP4z+EmNgFLG/lm7LFiezQiGuu52Dq4YyOWYpq21OyY=;
        b=EYj9/JQYE2EIdIusz/hPiWmcJlY4fzXHBnpS1sz7g4ASIsqgckUtTVzlyVYpQ+sAVP
         HG14vYWkc8xdaiRS2UipUUeAf3EIoqdMFHBwlNEgM7HqdYSHF6gzY9ErtdjpYbuGHPvR
         V1+ntnq0T79itkSk25oZH7KDBXaJpLXm2LP4sD67Hr8lk0UtfTr8PY8bOqHO7SSUkb9s
         XLacJDxeZL8jajhbAbMyj0kjaT6luPAUUhpxmYcbv88mWSISV526zSwhYZWNNrKys1ox
         ujrjZ6s7Xe7Tx2slbdlLm3Za/jhzX3DqBbjngEtUUEU5fT7s1hXZviXq5zSEoOdrKMya
         10vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409185; x=1774013985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lP4z+EmNgFLG/lm7LFiezQiGuu52Dq4YyOWYpq21OyY=;
        b=F9rqsiTb7lqv/YpMnkmhzWDipnH5bAuFRbNYK3JqL6YJnYPqzsFLVXSvm328c8tASH
         lX0bycTpAOHW0wc8XONjcEJBp6bOixrcB9caJ24htEwCj0hcvEm8Z2GiPgMOV/K/kDPR
         p379kYGH/cToYSNlExfxFccecmPs0iPD2cNGSeYS/kywLGYSaA7FR/bZxC5+aTVRueEw
         p/sEA4lKbQa/2V+rs+LHjZe3j4tXmQ4B9YBtRVQLzQCCTcapzBVCGSEHRBOoAd4HztLq
         0bgbZcTMXE/VP0yyz7B4Vm67e/HJWssW875ydhOwCUguJYyO8JRILBLf0NQ6uhwJWWX7
         rwkQ==
X-Gm-Message-State: AOJu0YzE5cah7b5AjPeysokOkB9RxmPAui+ZE73a4cue0fywPgJxJHir
	KfJyiA6gjeJo+Dlzray/ctQV7My221wLKb5CkKVF989wuYlvSex17+jdyO3uYN2QQPrvF0wIXRl
	kD6dAbeEyddy5TDRRdfe873rzXsCXGmSiCWi8Ms3ZlRcoApgAE/13kFqQXsSEWf2DROgV01l7Zd
	IcgcNb6/TfIemuBfIf3PyDMb+dnKpdysoCknSKpJHDbAF/vPrxk5AH
X-Gm-Gg: ATEYQzxGeiPcauf7H66e/Z9aLZrGmJMHIPtc8YXiXfsfnxl2P3LnyKVtoWs9mq2wQHr
	/4Pcf3a1g6BSRH7zmgXJzgDgsheO1TpNIK7kOwXHLKKlNbXGWiZexi4ImwUrK/vPTVysfmfO+JX
	tZqWMVdab129RwLkvhR/htPrbShzY84d/Sdc7/yQLyZj9XwIbj197KoE4enGrLbhhV3XpSireOB
	/WtDNVIFe5wzh20Pf6b9fGmUQlCh6mVMjDgA8mqr/0zkjWHWktBBNp8ClJw5Z8aO/uz98QNYJlj
	uYkskjEesH5vjGakdx/0JcRbks9SMUV1hjsHRdY96T/6mQmY7Q1+6u82WvGbVNO8lXr6uDLznhn
	oYozUW0lBI02lbveB7yTAw3PF7qrDA1ED1Lb4s6gOtyRNOC7t1TsXLWKTFSEOtzfh/M1Whscuyh
	UEjFD0tjsZp0KFkiC4ID3+Dwy0cuOuehlu+n9Emn4=
X-Received: by 2002:a05:7301:2a0d:b0:2be:8749:d5b7 with SMTP id 5a478bee46e88-2bea5496489mr1445152eec.14.1773409184752;
        Fri, 13 Mar 2026 06:39:44 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab57b1d2sm2441671eec.32.2026.03.13.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:39:44 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	anup@brainfault.org,
	rkrcmar@qti.qualcomm.com,
	atishp@rivosinc.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v4 2/3] lib: sbi: Enable Smrnmi extension handler
Date: Fri, 13 Mar 2026 06:39:40 -0700
Message-ID: <20260313133941.3012966-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313133941.3012966-1-nylon.chen@sifive.com>
References: <20260313133941.3012966-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_133953_227344_07F06F25 
X-CRM114-Status: GOOD (  18.38  )
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

Introduce rnmi_vector_init() which prepares the hart for Smrnmi:

  1. Checks if the hart supports Smrnmi extension
  2. Writes scratch pointer into MNSCRATCH (same role as MSCRATCH for
     the RNMI entry path)

The function is file-static and called at the end of sbi_hart_init()
so every hart (cold and warm) initializes its own RNMI state before
returning to the firmware boot sequence.

Add set_rnmi_trap_vector() to struct sbi_platform_operations:

  int (*set_rnmi_trap_vector)(unsigned long handler_addr, bool cold_boot);

Use 'unsigned long' rather than 'uintptr_t' for consistency with the
rest of the platform operations interface. Platforms that support Smrnmi
must implement this; others can leave it NULL.

Add suspend/resume support for RNMI CSRs (MNSCRATCH and MNSTATUS) to
ensure proper state preservation across non-retentive suspend.

Note: This patch does not yet enable RNMI interrupts. The trap vector
setup and MNSTATUS.NMIE enablement will be added in the next patch after
the trap handler is implemented.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_platform.h |  8 ++++++++
 lib/sbi/sbi_hart.c         | 27 ++++++++++++++++++++++++++-
 lib/sbi/sbi_hsm.c          | 14 ++++++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..555e8b79 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -149,6 +149,14 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+	/**
+	 * Platform-specific helper to program the RNMI trap vector.
+	 *
+	 * Called from rnmi_vector_init() with the firmware RNMI handler
+	 * entry address and the cold_boot flag. Platforms that support
+	 * Smrnmi must implement this; others can leave it NULL.
+	 */
+	int (*set_rnmi_trap_vector)(unsigned long handler_addr, bool cold_boot);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 495ad1d8..eca6662f 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -29,6 +29,9 @@ void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
 unsigned long hart_features_offset;
 
+/* Forward declaration */
+static int rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot);
+
 static void mstatus_init(struct sbi_scratch *scratch)
 {
 	int cidx;
@@ -756,7 +759,29 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	return sbi_hart_reinit(scratch);
+	rc = sbi_hart_reinit(scratch);
+	if (rc)
+		return rc;
+
+	return rnmi_vector_init(scratch, cold_boot);
+}
+
+static int rnmi_vector_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	/* If the hart does not support Smrnmi then nothing to do. */
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		return 0;
+
+	/*
+	 * Set MNSCRATCH to the scratch pointer (same role as MSCRATCH).
+	 * The RNMI handler (to be added in the next patch) will check
+	 * MNSTATUS.MNPP to determine whether to use the scratch area
+	 * (S/U-mode interrupted) or reuse the existing M-mode stack
+	 * (M-mode interrupted).
+	 */
+	csr_write(CSR_MNSCRATCH, (unsigned long)scratch);
+
+	return 0;
 }
 
 void __attribute__((noreturn)) sbi_hart_hang(void)
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..41115080 100644
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
 
@@ -430,6 +432,12 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
 		hdata->saved_menvcfg = csr_read64(CSR_MENVCFG);
+
+	/* Save RNMI CSRs if Smrnmi is supported */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		hdata->saved_mnscratch = csr_read(CSR_MNSCRATCH);
+		hdata->saved_mnstatus = csr_read(CSR_MNSTATUS);
+	}
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -443,6 +451,12 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
+
+	/* Restore RNMI CSRs if Smrnmi is supported */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		csr_write(CSR_MNSCRATCH, hdata->saved_mnscratch);
+		csr_write(CSR_MNSTATUS, hdata->saved_mnstatus);
+	}
 }
 
 void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
