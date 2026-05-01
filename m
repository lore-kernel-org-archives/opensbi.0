Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC399CD342F
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpG9DKpNa4OHIsDcIWgQsHvT/kMlnL2ZUM9O9umQAtg=; b=Ee5hOI4kdY5jK/
	hJ/CKzQNorUJMZrk2bLw75JEX7naodzgMNakLV5hGsrz3q6eYXoTveMOFmqoRDjvzMK+P/1QPLzQD
	zSEjjQm2No1nlHJq98GDnHiTn8iuO6I+hH52sQ8Q33lD3lJjxfUWDKIfwMSMP5vURsXp1+At5G5EH
	vJAkBkP0AqSF1NABbGYzCbYeUkgdHOxQDIIWyhnUpK3nqgBlgnNqflHVjIzQTovg+ofqumMEwxxze
	iu0ff34bIo3AQ1KdmFQUOHSMPHlR8eEClyRbnzKwltvbe72d76iNKNmDv7Dm5ZfzEYPMCeYh010fg
	hujTiFZyfXSfDY+jLLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE8-00000007grh-3w1w;
	Fri, 01 May 2026 21:16:48 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE6-00000007gpb-2wIX
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:47 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ef397ad64dso47416eec.3
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670206; x=1778275006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP9CaZKoRUJBGrl5/DpJge0EPlNAd2uMj/yO07evThE=;
        b=XPZLSLGJ5MgTVwDv+zLwrToNyaHp3qPQswqZYkQu+tBTeZc/834HIEByc+Z0OMZ8YQ
         CcyOa4Gb2ZAYBHzYwg1KUQcWmeac11oMm0B64IQ3E2v+o+NEILjCxtED/5dDsdy536Xa
         Gyozd64JWJSmDt0wzCIwTVfngUiEJd6kgDN5JY42EjNx9RgBpe2tRsdaDh6JzOxcEXnW
         0whismjuZHfAPEPCc/E4cTtHwHAWqGddF0oFXr90KkQ0qtL+bHwQdcPEzBSq2ZmWjz5q
         gkTbHWazECAJMjACYriOJsi2TTyvNqc4ctI8LFId3wwuWZk8/b6l7WKHQ3NDkom6EkhY
         L3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670206; x=1778275006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kP9CaZKoRUJBGrl5/DpJge0EPlNAd2uMj/yO07evThE=;
        b=p8AAGEkIcsSpehNu9VK1a7f+wof3f11+VP10u6uaPTi9pCnLI/U8S/JwbrPN7bb7NT
         9ugPT5CPbhSlgFVELOf6RopSx71PdcVNkKQYL5IK/+bR8zsO9ZF1h+ZKyF51SwBiBeCD
         QMPsx5SRoY+/04lZs6R6l5aaTPf4Seayar3Wo/h1+83X/D6NKle5iZX3TRIeRJrQ3z3V
         s0Q3dASukvvHJU/ywlWRN/jvTz07nRyoBK0mCfYlka31PHJthvHesKt8I5Cqr0CLAB+m
         YlGlGn1Otob9jtiUSuLX4NwFl2iMdIqcgDs78u7jAizp7IaRasbRDMs7fTRb68a/wx78
         IucA==
X-Gm-Message-State: AOJu0YygCeKuPpplOrbu8HTuvKcuS0p+ik/HJH/Ub6UyOfQJQnbd3yya
	NjAqmY4bq3+ELSEQ7na6wGc3bbDv1JGcubD1NXonsiMiu3SCLYr1VYqUJIb0aU2MuNnVEG4a/0A
	iBWwD
X-Gm-Gg: AeBDiet5AgJa1kEkizX12dnAbMZA332T6Q44IohnaG6DQdzu/HEHDNPjlIarh3IudTp
	JbJBbQjEygUcZ57LDFfMBWZ2YSWyeLmBP/v1yniDmPb7iFCga3RDt1MlD6tgDRD80nltMGFmyC6
	dPaGTcTmS1yrvVP9Ivdc0shtGUEK7MOTkiwRGscbx4Fwlf1aG3koadgiORW2Nneb8IAFDEgzTp4
	/XMPsFcYcU5CY6sO/ps9ly/cKyAyy0oimeWX3RY35lsznZdByzvHiMwkOFniD/Wgz0x1LNCoEZ4
	KRu1bauCFmJ0bAhBlxVSvfQdypy52eHszCFlB3iot/nmyZkubb7nECZHiv2NfxRDgZ/nVoJuv/a
	aMxQMYaMp1Dy4KdFIQ2OhM+2nANm8C90cAvjYSw57y4grTAT2/TvLaohsmsH/pU8MSLBUqdL7IU
	gcNQwcSPB8ucisd66ra1BAnEI+yXj/dQrmst/wUGLx25XsV2DUpPw5On2myudi
X-Received: by 2002:a05:7300:7fa2:b0:2dc:e799:934f with SMTP id 5a478bee46e88-2efb9c896dcmr218384eec.3.1777670205550;
        Fri, 01 May 2026 14:16:45 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:45 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 5/5] lib: sbi: hart: Detect and enable Smrnmi before trap-based feature detection
Date: Fri,  1 May 2026 21:16:27 +0000
Message-ID: <20260501211627.3293126-6-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141646_744992_0B5284CA 
X-CRM114-Status: GOOD (  13.31  )
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
