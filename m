Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA8FC61DD6
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 04:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTu/XJIfIdTXSwFRbg1VCB1jPJZhCb0aEl8fP1rX8pQ=; b=NSY+RzzMWv0bAu
	xnY+L4CQC4L+jsgzmuOPWAnUVRAP2B8Lrk8t4VREbBzZvcf9eJJyu0TlPfpUTqSGFmnRjliy4iye4
	u2DLKS5OnNunV1AuFTYJC0wVrjR/LX5qu6frwr+WrlkT7KYlWHb2XRMIoixLF5HoswEivMQtk4N0r
	j7/RoI9jw45zcLQ4TwW+mPAN8R0GSCG+Ww7O12wXor05YVOlYyvpjARCDud4bOz0Y31q+Z1ShySvs
	kRRNcx8gd0N6o7kjTBfGucwoJltxdDg9wrpESBl/7SKTB5yThvTBQZCjkX327lmQPd1vAEfoOm0g5
	VXpTQOT6YxG8X+bZbc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmS-000000012Fx-3X70;
	Fri, 04 Sep 2026 04:44:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmO-000000012Db-2DyN
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 04:43:57 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so568024a91.2
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788497036; x=1789101836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXvKCefYdofqKMpMGxYKpeC50dI2AOa5owdbuL0fCzk=;
        b=MyImT+4nILa7oPFZWC0UVpWVPLczUQV8JZfEm0H2m7v2UvrtXFNUbs2L5TMfoDir8Z
         KEJ0zg0A2H0zbcL8Hp/G2ocKW5z0Gyy1zVntaVfGbWIwSSqQ88ejAR/jz/kEARmedPLq
         zOmp6/N49ZI+nEwcFYGXypQlIrsrVz4Zf0JJmTYFSrsYr9mCop6dA7AmmQOYoUrMzvQY
         3pYBqHMGWnbWElcVX+bqCxszbDf9mKWrTtfOFIe2kO8qJ+mk6sSRFzJJzHwu82pn0uys
         glrBr1uB0JvmO159qqpG5oVU2do1YhTf70jQ7E1y5JvpuhzoljpEctcKw1UOFB6/s056
         S/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497036; x=1789101836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXvKCefYdofqKMpMGxYKpeC50dI2AOa5owdbuL0fCzk=;
        b=I9pEXQBKAS7jL1P0IZ2MUQaWoi003opEdi+GNkKX7IMFKDbmKdmDK9KzFMH4KJ2FbC
         5+Ll6LnjJ7eeNp/uEq4yWo1q1CCBdQjSUQ4V5wMrOe7tDxHqzPlqOAAAyCnd0BziHX33
         RNLAhnv3SxjJAtpHPWxXabwGZnJcqUsbD/UI/Rtx8KpOvH8N3THu/f1jliSs4Nz8xyhD
         dt9bShPlDq2IWcLSaKY7+u98iIohliovPkJdgibgO9IJurEXFeIcBqyoUWLmZwttQo9Q
         hCDiuANBrO2wj+I2vQt+1pOcbRCrJ76Bshlzw/tI6ZP/Vmd60StiblifaYxuvqO2hYVD
         xv4w==
X-Gm-Message-State: AFuF++m7qBUdm3i1sxnz0KqfdIAvVLDE8qBifaOouvhr1syV/c9tHLr3
	INJXmHdhzotDfzVK5lWjH292vIxGtzr8zGemjBvnB8PugO1cSaodYn5xqZsS+mYCCtk=
X-Gm-Gg: AYBFou0bgjIQC/NXMvEGbqQR3cs3ZvlsOK2v9NJ+TqdNUBA5bh1Ld94jF10l08Qd6GB
	UuZZINj5IP08kMbOTyGbJky9293QiyLs6+seTtAHA1bvU0d/ogwtkiYHPLUXa5qUzvUmp9AXY8N
	t2YeGB0Srqs0poMbXawW5Q1jg/r+cbywT/AJEkdBDQJfgRICnv3vk3jUnfQZ9+VypMROO2c+Tgk
	bYZC686N5lRhR2WGY2riM7fxXEdTsZAXe1VKQ0ZTunjQHf0pfe6RGz4bM1CtQH1dOF406Xmjt2d
	aPVLZ4Z46recwyJGoSiC3Cqv1FvGkI+VgIi7nRPAK4K01IvOJsvZvKsTU/jO/jRf+9Sjo3TOeY0
	86pvg1H6d6JcJdrag/UwGueI2Gv5OWHYJXljCW4/QxS7GJh+nqG+rlVudda9PKEsB0knW3g/gLM
	YpWtw7vQ1DXxyPhvZ/RnCqkChUELBtuJjZGbw6f0G47DHdMUUUphszxy6jlq0/vy25aJbcTpY=
X-Received: by 2002:a17:90b:274c:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39b2629b27fmr6134054a91.23.1788497035631;
        Thu, 03 Sep 2026 21:43:55 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm3574463eec.30.2026.09.03.21.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:43:54 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Thu, 03 Sep 2026 21:43:50 -0700
Subject: [PATCH v2 1/3] lib: sbi: extract sbi_smrnmi_hart_init() and call
 on non-retentive resume
MIME-Version: 1.0
Message-Id: <20260903-smrnmi-context-restore-v2-1-10b17506d257@sifive.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
In-Reply-To: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=Srlq3ihTJdKNjnEzMo5+3nElsa9WAyPsqj6yRyimLsc=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmkyJZU8Hhh30TpqZluzWUTLfGD+09Re3xsYVD
 Ulo+85fK9KJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCappMiQAKCRCIoTSWt/mH
 4E6tD/4xsseR8z2ZEc3cTApxKby3BVp3y9Cit1Z+RjFP6mMk22uSeBnA/RXg0wngf3nmGk2WZ2M
 lpDn1oSBSYB0MgcOROtqxzruJMiOf2HocoA9L1BStkEvhHVO9H+GxufX5xD4U6B6/b9ZqsR4MqQ
 4TQzHZoh9zx7MA+gOkuDlH9KRT62rD4CxveA2jPoXCCnuFqYlqO/g6y/tJ1MbVPqmmWK8qVUaeU
 2MI42TMLqsZ3dvAjzjlVkayBYbpibddUFKbC6m8n3ROG59nbhMxPpYwOkxlsV4I/j4blGmXENNG
 Jld03RyRZJA1zaGf+iEJyWS6a1h7StcLbVvWDFkfKuIFKZVug4b7t3hshihfv/ti1llwjZ5OqXy
 YVNOF/v3Ej2uuJ9uRPBjJ2BefKkfX5hC5ap+vkua4Z+UtSyYtJJlBNniNnaOxK5t/JmZPg0t3Qb
 fFfxlApx2H4tgBV22UCLrQhHzqtv3FDDlkyrwbD1r7HoI+nBvr3ByfQ09krXxQvG8y//croKNfZ
 HGWF/mZJa5w8EHX1hekU2yme+DRKbcB5e7YqqHY9OiNijC0fPeHuvQZ2Wl1AQbvppMW6V/0uToX
 rtHOAX9hCi4MU9PWxG1xpjQf8mK2BA6iThiiTxf0YNXiuAkKe77NlXYxUv03aNhoXUKz+KxZ/Pc
 H55ui+1g+mzUWGQ==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214356_578129_90DE439E 
X-CRM114-Status: GOOD (  13.58  )
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

On non-retentive suspend resume, the hart never initializes the
Smrnmi CSRs the way hart_detect_features() does at boot, so a hart
waking from non-retentive suspend resumes with NMIs disabled and no
RNMI handler installed.

Extract the setup into sbi_smrnmi_hart_init() and call it from both
hart_detect_features() and sbi_hart_reinit().

Fixes: 2d211fe6f9d5 ("lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection")
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Co-developed-by: Nia Su <nia.su@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 lib/sbi/sbi_hart.c | 49 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee8855772d8bfe452a1f9f086ece2a7ab8bbe6b..d2b5be6a3ce68e6ab5c368e83b9cd0f09c4ca337 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -466,6 +466,33 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
+static void sbi_smrnmi_hart_init(struct sbi_scratch *scratch)
+{
+	const struct sbi_platform *plat;
+	const struct sbi_platform_operations *ops;
+	extern void _trap_rnmi_handler(void);
+	extern void _trap_handler(void);
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
+		return;
+
+	plat = sbi_platform_thishart_ptr();
+	ops  = sbi_platform_ops(plat);
+
+	if (!ops || !ops->smrnmi_handlers_init)
+		sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
+
+	/* Reuse _trap_handler for the RNME slot since RNME is taken
+	 * as a regular M-mode trap with NMIE=0. */
+	ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+
+	/* Initialize MNSCRATCH for the RNMI handler */
+	csr_write(CSR_MNSCRATCH, scratch);
+
+	/* Enable NMIs */
+	csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+}
+
 static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_trap_info trap = {0};
@@ -487,25 +514,7 @@ static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
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
+	sbi_smrnmi_hart_init(scratch);
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
@@ -698,6 +707,8 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
+	sbi_smrnmi_hart_init(scratch);
+
 	return 0;
 }
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
