Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05323C88E5C
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WXYSnCBqXyg45XH92D6yFgmyugb1VjP+bmSoQDDzA0=; b=kUQTUdStiShPGr
	m/+9IeHyY8swOdrzDaywSABEb2T9GnvOyupnRdWD6+sVCJiX0rCCFvZQ/LxxD5JaiSEdagz32Y54Q
	/8kdyI3g9haOV37Cko1s/qMy5RpJxkLrUHnj4Qyh+VRuojD1BBod0IyFWFHiuocSl6ryfmYicqaCF
	Rosm/v6FMgZJs2ZxI5vqCbnOLS4OAEuKEtWTYp/JySBeq0optUTfioM6+OAr/ea5BVpLhCGzBWLOA
	u2Fb9fd/UzzHVz11xFOOwU+JPIk1Sxix+j1kUgKlcN7HDupVI7zNtX2DEJ85YgffPanXElHzEhAry
	f2lBiuBSBowpa4renNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idh-00000008Qh5-2LfB;
	Wed, 16 Sep 2026 05:57:01 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idZ-00000008Qdk-3lTd
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:56:59 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so487101a12.0
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789538213; x=1790143013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfT/SKQVZJjdILapgnVa8FJgiECRZVmhWOM1CBHiKgQ=;
        b=U+a767bIRmvzTqJHyqSxOTcVC7gR4S4+QphSiQXyFOjLwnAO2Vezpel8rBr7m84HzG
         lDdpQko5mNUOHv/Wb7qcHGAURgaMeIGi0hTgxPXRVWC3wrDkixIZMkcwtB3k5eKcPqkw
         Ys/tutgiA0zlsjD3sFuK1mG1Epl9p4ou2porrEzqBDX1fu6S6z0PKzwaj+agVcZjGiZW
         VW4a4L632+43RgnGeTQNkTeVV5Gmkku5+cvahosCmCUGmnPMUn+NJku1rCHp/WdMPzyx
         exs5XWwB5BM3FmeL+CBNzdHzRMqKlY3rhbtD/xWk43VedwtqO87Wm6ktY+z0EcJ67YzF
         EA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538213; x=1790143013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfT/SKQVZJjdILapgnVa8FJgiECRZVmhWOM1CBHiKgQ=;
        b=0cgXB3a+aIkMnoxPZCt1f7yrXcAz/EUbB94NPhUWMWz/p6jkncj1OXcClgUknEoKT1
         gCg4SLLFsTmlovKVa2rE2clMHkVrgokwpE/JAdog1p9O9IS3s5pJk5hrUg/9eE+Vnsq9
         7Dqc03pjrhtrowqOqscZRT8UPVuzIIqDPtT/htq4VCm31PZeBOaUtJaIl0Ocou6DP0IL
         9HO0+JghYOFVrH8PMasI3WQjXQUhe3zXbkSgspDys/W19ZGkcUthYd7wUWhyG3IIT+2H
         ko0uHw+/04CBoMCnfkgzS+Yal9whWO2KPLLYwunTmMy6cZ5ITf7jPUJxKcBS53M/Culk
         RhHA==
X-Gm-Message-State: AFuF++mKtlsFNIVtFd/D+QzZkJe81/jBSBTRhyayzsqxjyiKt+gTHwx+
	KsewhkCS/x0Eje59+kBJtKrNJgRAHVZOwl8ExfyHXtFufaoEHMT0oJ69hlV2w1+S9jtgLVlhT7K
	onPTKRVbyEWi/aiwOnEcB0n/+8X2sqbq1rnABZv3qmFLP4xjd7UA+owSvlb97H0uLx59FI3iZpd
	f6a34pgaCC9TJS9dTRQy6b6SeQEOiqZrZxhxXACjuRlGJe2Vk=
X-Gm-Gg: AYBFou0gfpH8pzrBrn95hHjOWYnuF6yGtBOaVpha9VDpXwbf1n0uzQGIDwBUBY72jeT
	5hJz82SOIIEaniHmf3NyA1B3auhtOZbQ8yS9w/alVJPmYUvbL/npvVkHhK4/WvvFYFYeq7omfxY
	sKqmzi8gDK6tlPVuLWsjemxjE0JTqV2uEEhS4AJdrWacckd5GztHUvn0f4C8/Fi2hn6MlxhpMUL
	Vvsc7wQKpFnouQOSGgQ3+FIpBaVvvnUePXji4fZEQNtRzXzHCsrMhF0qLKAYW+fhnks6BGyGkhq
	ypl5oi4g+Wv2fq3PVHeThTEYrumi2V2mQc6gQUhbs/wrAlj5HBLCYFhEnSn501Kb7P9pJHEb23t
	TAxzijOmqnuT7GQ4C1upAzkyDXK2ReNekm/sMtBq/TPyyyUlviMTV53NB3kD2WwvxvTmOIx55uT
	uGS56VEUqjqCGMb4C++PtvwVCJlKEjMI5CXPr3jC5FtyaZ3r0h4DfwO9zB45f3onjQrt2yxVble
	1iRwkUSHA==
X-Received: by 2002:a05:6a21:138f:b0:3dd:5831:ef58 with SMTP id adf61e73a8af0-3dd5f5ad269mr3610433637.15.1789538212644;
        Tue, 15 Sep 2026 22:56:52 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm3550521c88.11.2026.09.15.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:56:52 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Tue, 15 Sep 2026 22:56:44 -0700
Subject: [PATCH v3 2/3] lib: sbi: report smrnmi_handlers_init failures
 instead of ignoring them
MIME-Version: 1.0
Message-Id: <20260915-smrnmi-context-restore-v3-2-e9dd31152515@sifive.com>
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
In-Reply-To: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=uu3dhcz4wVIan670q77jEh/+c4F3dHNmuIf5ocwPqe0=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqqi+igiorzPbZmp2QbQAeQufTdlk6rZHbvsllv
 ycC/EuDHjGJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqovogAKCRCIoTSWt/mH
 4EUBD/4yLPcLs24yh7hp3fJ8JvKVNXOOyO+fri8CsMklw6xUjTziZITAJhMa6A4ibJ8Czvin/AC
 Ul3h+XzomnkDdD6XhAxJy1by3ekSSA8ovylQ4fZk2TLniaR7J/a9agu5s54qwrFmwpNiG2hIJuX
 tK1W3wlp+/dADC01WR1UguwhAey/A0d2j9VoE7jqf7qI0RDrONy1iPSG2cRYs7qdn/EiQVlAnOy
 DzJHPzlY0hlovzzX7mlVD0c3/WCNdOKDj+I/zX3cmOAG6T5NW7DgZQ7C/jjbgkL3zXnYBxlODWY
 OSx9KzF1xsM8YVqEvBBu42Xe7IMFPSKmhod1m4xtT/hWagxKdxCDW5Y7f0ATySOokSQXjsHvJWD
 h0zDWu36uERfNN4I4mgVbZ1SlZ63Tt+TyyBuRuhvoHIH6oRxv6X27QSKRBaclvWePp8fbI9O7S7
 4yRqabN40paVR/4LCnjaCvRdMf1lowDnqX4GJSgdsndigrcSIejU1mLcq2dmgm+MoMNRt/9y3IQ
 ZYLJsQImZnvtgWQakAbJQfhcE3nAxSsFqdLnZAAgHfrFQTy580C5BacpNMS2lJ5WCzVBxorWPhj
 OGiWQmlJNC11J2V1cEZIvFJcL5F9u3kIGCwY0AV73F6cMDwI5C5EIgcaknpWLn+BS35vRusOQtn
 Xq0GmT7wn1wS+AQ==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225656_181283_F71C468F 
X-CRM114-Status: GOOD (  15.89  )
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

smrnmi_handlers_init returned void, so a failed callback went
unreported and NMIE was enabled anyway.

Change it to return int and skip enabling NMIE on failure. Also
update the doc comment on rnmi_handler to use SBI_OK instead of
SBI_SUCCESS, so both callbacks consistently reference the correct
firmware-internal success constant rather than the ecall-facing one.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 include/sbi/sbi_platform.h |  7 ++++---
 lib/sbi/sbi_hart.c         | 21 ++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 0a1e7eee0bae8eee963e5a4ebc0895b2bd10dd23..2cfb0976772dcff627b3c7c6bb8ff6488a3ac365 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -157,12 +157,13 @@ struct sbi_platform_operations {
 	/** platform specific Smrnmi handlers init on current HART.
 	 *  May be called more than once on the same HART (e.g. once
 	 *  during boot feature detection and again during hart
-	 *  re-init), so it must be safe to call repeatedly. */
-	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
+	 *  re-init), so it must be safe to call repeatedly.
+	 *  Returns SBI_OK on success, error code otherwise. */
+	int (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
 			void (*rnme_handler)(void));
 
 	/** platform specific Smrnmi NMI handler.
-	 *  Returns SBI_SUCCESS on success, error code if NMI cannot be handled. */
+	 *  Returns SBI_OK on success, error code if NMI cannot be handled. */
 	int (*rnmi_handler)(struct sbi_trap_context *tcntx);
 };
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 18fac76ac070cb626ccb1cc959f4327de0e7c1d8..34f02ece279333366370114333b95ced916b0e1c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,15 +466,16 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
-static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
+static int sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat;
 	const struct sbi_platform_operations *ops;
 	extern void _trap_rnmi_handler(void);
 	extern void _trap_handler(void);
+	int ret;
 
 	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
-		return;
+		return 0;
 
 	plat = sbi_platform_thishart_ptr();
 	ops  = sbi_platform_ops(plat);
@@ -484,13 +485,17 @@ static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
 
 	/* Reuse _trap_handler for the RNME slot since RNME is taken
 	 * as a regular M-mode trap with NMIE=0. */
-	ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+	ret = ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+	if (ret)
+		return ret;
 
 	/* Initialize MNSCRATCH for the RNMI handler */
 	csr_write(CSR_MNSCRATCH, scratch);
 
 	/* Enable NMIs */
 	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+
+	return 0;
 }
 
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
@@ -514,7 +519,9 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
-	sbi_smrnmi_hart_init(scratch);
+	rc = sbi_smrnmi_hart_init(scratch);
+	if (rc)
+		return rc;
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
@@ -699,7 +706,11 @@ __pmp_skip:
 
 int sbi_hart_reinit(struct sbi_scratch *scratch)
 {
-	sbi_smrnmi_hart_init(scratch);
+	int rc;
+
+	rc = sbi_smrnmi_hart_init(scratch);
+	if (rc)
+		return rc;
 
 	mstatus_init(scratch);
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
