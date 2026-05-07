Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408ABCD343F
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpG9DKpNa4OHIsDcIWgQsHvT/kMlnL2ZUM9O9umQAtg=; b=mc+Giy9GzckxDP
	cOarqrCEq87OLo2iE7DhMiAuVRRMgFPgxlEZLSk2ua4EOpV/pUP2KpbHmjJjrd6F/tKwN0WaCmLkI
	Cl9ddZDw7D7tu22pqeBTc/8yq09NjjKwv44HeFIhKo1ytoTgVWGwYDupt82nIBd3JyQB87hZNq+s7
	oal7xgnd7QE2PGwIi9hq7diAL6FnTc3pLYO7PkdbIi69IGLV9BVBxqp/pAK/XC3RcfvMVBCKf5uBV
	yD7IK2JpqWqENZzbTQvtan37lvhx5Lxjw/3fkv5Dwcpzn2rh9+N1EadKPKV24yD543SGYtLOkslE4
	dJMV91+m7aebmcBnewYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39P-00000004YTh-1DKq;
	Thu, 07 May 2026 18:08:43 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39K-00000004YQP-2Kfw
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:40 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2bda3b4318dso73942eec.1
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177318; x=1778782118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP9CaZKoRUJBGrl5/DpJge0EPlNAd2uMj/yO07evThE=;
        b=AqHNVFKMDYhXLlTM0+fkNP4+MlH4231KOHoHsgdNseSI4ml+GH0VhB7NcJaBlZHrKe
         9fdfw8KSyJmMURquLvSipzyLI/gczMaV8nELMph73k/p1QTbVg1rrVn8nRwSvmJWjAHM
         dnHw/kiRn1d/C3bPNcGQSHXRp8Wz/QU31Q6KbInf9/j2pto+t80+gfIS35I56EXhNKYg
         90eHg806UVaLS0ZYnIVxaTlQMktvH74Csq8SV94Z9A3KPTrvQevsZBI43D1YqmkLoROP
         wpzZhoq9b2CXxpp1NSos0ybG5tG2K0xuJINT8XHEsJcsB+FNCCUP55rbwBCPgu9Ayais
         VphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177318; x=1778782118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kP9CaZKoRUJBGrl5/DpJge0EPlNAd2uMj/yO07evThE=;
        b=NgmI19iy67QNb3SgMlAPDYO/f5Z60aFw27v1wisB9afGkjPNe2FJTCOWiSd7ZF8PWp
         FvpMlbuoFnmqCN4abvmbJbE60rVSnU0cHUNYCfKozmsmA2vYCZ1afZbk+xNVJ0oGK/RZ
         qNOETVrzqq3S10WWOA+ObQDzbKvxgDUt/1WSWJfMHZoUdRM0wjSrb2Ee5h82ePc5Ds4d
         ztIBFAiv+JrjwQIYY3EoyvWRo85jCtlZCSXizdk1z573cPc+tD/dEZxHL1TB5EWAK0f3
         kusgEVKevOvtfQkkSzqCzTGhsHqRaXp6/lG3ov2CMpzmUbAPbNgLQK2gO00ePojYFitV
         tzvw==
X-Gm-Message-State: AOJu0YxYARswLw4KpH2yy6GR1ii9zGWWl5V54kEhNQ0zkjFQVkOBbtz5
	XmFwu7CDOnd7XjeHZQnge6fG6w1csWrf00V3ANB57cPWU1rl3jYVDcJQX0poyxC6Iy0=
X-Gm-Gg: Acq92OGL+qxPqRQVduMovl+j8OQgUjVa/MDWNhI4cx40CxlBoDLhwtbchzg2wA3wz9E
	Y7zvqNbxeZbAVEyQYMGzDfEIGBP+QkllgtquHA4+MToV5kWBg/g5WiTmAy0ZCCG+XQ6Dt0Inf8v
	oyvryCA4Gn6fRB1G51wAsnUnMdUiWFMNfPjnQ+db+AF7+S4Rk/b7KeN+Giou3VL8CnT/9v414oo
	UCBxF3Jxmh1JPAKYBHIEirvEY/c6ivoaWEREQMyOmZjccAlweoQu8l6T5B0owPG1j99aS7OoaQd
	eAb1sgKHNXtYXd/ZSU0s5ednbKVMmm/QJYoJvQnxUNPHlxB+bGzvlTvNMfrXOIpwJ7SZGwLSofA
	/2ZGeIy5tPNbaOTKGCUnhPAudAVrH9ovAZ2EPQ1pC1N0R/+brW+nMlWYnXntrakzvnTOSeteZGp
	DZZStu9Hrq2LJu7uI5YhTyQFTf+OCGd7Nz4jAMIkwDHGOLX+UiPw==
X-Received: by 2002:a05:7300:3b08:b0:2f3:3835:2010 with SMTP id 5a478bee46e88-2f54c37e2eamr1993925eec.6.1778177317540;
        Thu, 07 May 2026 11:08:37 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:37 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection
Date: Thu,  7 May 2026 18:08:07 +0000
Message-ID: <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110838_954099_BA25C800 
X-CRM114-Status: GOOD (  13.22  )
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

The location of the RNMI/E trap vectors in the Smrnmi extension is
implementation-defined, so platforms with vendor-specific NMI vector
mechanisms must install the firmware's NMI entry points themselves.

Add an smrnmi_handlers_init() callback to sbi_platform_operations that
receives the firmware entry points and lets platform code install them
at the hardware-specific vector locations. Two pointers are passed:

  - _trap_rnmi_handler: the dedicated RNMI entry point that saves
    context using the Smrnmi MN* CSRs and returns via mnret.
  - _trap_handler: the regular M-mode trap entry since RNME is taken
    as a regular M-mode trap with NMIE=0.

When Smrnmi is present, install the platform's NMI vectors via the new
callback, initialize MNSCRATCH with the per-hart scratch pointer, and
set MNSTATUS.NMIE.

Smrnmi-enabled platforms must register smrnmi_handlers_init; if the
extension is detected but no callback is registered, sbi_panic() is
called since enabling NMIs without handlers in place would route
subsequent traps into nowhere.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 include/sbi/sbi_platform.h |  4 ++++
 lib/sbi/sbi_hart.c         | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 715df499..fe382b56 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -150,6 +150,10 @@ struct sbi_platform_operations {
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
 
+	/** platform specific Smrnmi handlers init on current HART */
+	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
+			void (*rnme_handler)(void));
+
 	/** platform specific Smrnmi NMI handler.
 	 *  Returns SBI_SUCCESS on success, error code if NMI cannot be handled. */
 	int (*rnmi_handler)(struct sbi_trap_context *tcntx);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 781161e5..92c602aa 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -532,6 +532,26 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI)) {
+		const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+		const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
+		extern void _trap_rnmi_handler(void);
+		extern void _trap_handler(void);
+
+		if (!ops || !ops->smrnmi_handlers_init)
+			sbi_panic("Smrnmi detected, but platform lacks smrnmi_handlers_init callback\n");
+
+		/* Reuse _trap_handler for the RNME slot since RNME is taken
+		 * as a regular M-mode trap with NMIE=0. */
+		ops->smrnmi_handlers_init(_trap_rnmi_handler, _trap_handler);
+
+		/* Initialize MNSCRATCH for the RNMI handler */
+		csr_write(CSR_MNSCRATCH, scratch);
+
+		/* Enable NMIs */
+		csr_set(CSR_MNSTATUS, MNSTATUS_NMIE);
+	}
+
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, &trap);			  \
 	if (!trap.cause) {						  \
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
