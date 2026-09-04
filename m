Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5805C79F83
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tP97ZNkDxkTMdKR0XcqY7F2x7HfxFR25R5whdeJlpo=; b=telxMIvMRWK1+r
	LEF8OfkX/uU2wOzWcRDAM1M544b2MV5eDzzxrpkdX9pC2X65bJRF+lZcUJDtLmOS9AA7+uD6Zh8qt
	6tOyGBrlpwIJ8IknYQuuoNkEQNj/yW1G1sv8/8TvVoNJ+5D3zNMPIkP5/aeTtrJTlRayPJKsA6d2v
	6G6fj1m1mpLK8CaqhXGSLxISvHjR4bR7oRM0qu16stMfgYhvyeRFcr4lqJzzGf54mWGLiQbxtKtvf
	TBLAbI9aY0MzQHM+5t5kSa+45URoXjapLaieF3qb62Z4hkYQzDbuYz77+aRGpfKDGlwl+HPoGCWJJ
	17uG6UEifsPa9onaXyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P70-00000001M55-3Fq4;
	Fri, 04 Sep 2026 08:17:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P6y-00000001M43-2ixN
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 08:17:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2db18e5cb56so3874595ad.0
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788509844; x=1789114644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fk/jieACPiVqvVSi0uxmZ7JN/ziw5O93ACAb7vULfsc=;
        b=EEdWIYJDSEXroq/wbkQuxe43uZRlvRjR3Rh5ANGLH2ciS/9SL3WPjg4vjKTr8gQ6wr
         L5eRE2WlmpikZScyHWnYbr1bYTWY7X5h5sRo3j/W6YkeIglmWY3k38qoqNnUID5A+1jp
         4wUdxSW0PRMMoJHB1ocQX6dA/3fL+FUTYoYDOyj6N28qCp0qPNsPCTMHK8ZPTrixqjYK
         lUffRTZXuZue1bglrcbrMBYr4V4LObMDiwiEVj6qT+th1kPuJUhEMXbKhffJohVb3gz8
         6VPTDMlOPjgxZqcHXl1kIKyQsOSs7sIcsKimnZB0/A+vBhEcu1nKATog76VnTmHzCKiv
         842A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509844; x=1789114644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fk/jieACPiVqvVSi0uxmZ7JN/ziw5O93ACAb7vULfsc=;
        b=oqK8z2u3URESCIWF8tLGqfjMQvDN9wjQDHUdBC5pr3dgL8A9KTSskpQ5PmkXMLSeNn
         yCJNNn1/ug/gGXkRJ1awaOBUDJEZhr/yaIVus3lTMCzShobdiABd5sFUTHV+3xEa9GLn
         rhHZJRdawolcH/FzkoccE4D3BdL7xPyX6OD/24Wb3Hm8rNqS7b8Jsq5A4eoSd1X/G1a9
         EXQb4cer5905n1VaZ04MCu26KtMzqmdxZGuUmWoZcSt+qUcSRiOA3PM/oQIT7OijH4Cm
         9HzZiEBmadItA3V34NgFXunvM1WqcBVmfp/F50Vh2DYePDpXPKZ1WDB2vy/UNAfcDtL/
         5Kqw==
X-Gm-Message-State: AFuF++mKmN2MxWqFWQApFm52P3njDum8njNRKfpZG/F0IWgW9vWFZefa
	Oi30AxJI+ds8vanp4MsiUqdFADxMOYuA73u1bmOWgP0yZJ1wmvZzcQW5l3RVTrCIR9Y=
X-Gm-Gg: AYBFou35EEvYlPeUyRhUX3UciUNa1CXI2WPFHCTWtBIoxVTiMl4v2DzyuqK4ZyKfd35
	ch4IjUn8zXBRYfoIIYGjS0L5i/NgELt/6b+LLimXUTUMeehaytF+4bdeJ4P14OXNgw0xENQxslS
	eTnt9NrMyJN+vs2YWLVF9hVd3oZW/mlpUYJGxalF2uSSf5C/6njAUgA02AEwv1Ru4uHX+SzNlju
	onk6SaaLP4MGoxGsw7sAMutsbj9f4s1P71w6Ydvtr10+RrRDhbme6CSpUAOtwqZPXN4RWgv2gEP
	0rNktPEi/5H6DY63rjcY48CASrxWIhrWbZYRVG5FXy+l9YP+lJCrWQL16Xs2O5xn62kfkAkeXzy
	k+44ZmWXQVsFIy2egq9l4xpaAROPZpe/jl2qpB+eeRIcmRPM7jAkMmBhVm0VUrZrn1lX0+CSqMq
	QfdQJ7hVzsCSV1zoVmiUXyqG+2L91MrBA25uNbYAQjexoBRvn690hL+p+fCH81FoFPzSHlx34=
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr7084274a91.10.1788509843361;
        Fri, 04 Sep 2026 01:17:23 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm4767183eec.22.2026.09.04.01.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:17:23 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Fri, 04 Sep 2026 01:16:44 -0700
Subject: [PATCH 2/2] lib: sbi: Fix stale prev_context in RNMI handler
MIME-Version: 1.0
Message-Id: <20260904-trap-context-fix-v1-2-6bf7fa45d5f1@sifive.com>
References: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
In-Reply-To: <20260904-trap-context-fix-v1-0-6bf7fa45d5f1@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=1rT1bxiQ7decvKP7UiH2H6likrvJPJP830eEZaxj3qc=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmn6RV6a9EKz3JLVc7Lh8ZvcUbPjjqKYEAt2fF
 sAybjeSxYuJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapp+kQAKCRCIoTSWt/mH
 4C8+D/9zEaMM4P0RUkFvEdROOoyDXPtPXtVXYFFWLbwrkWPMTTh5aA3/zJZzsJ6pMru95Z8x3pv
 tLr1ovGDUJlmUSnqFZc39fu8zlXNblLdrjcAvL8nJQHap7Bk6MXygLnbqpP4JbX0Rtt6X20c30i
 PSQS5i5tWx6MByvoBz8tE/07FpaFDBZOlTce4GnYvy09xzhxiuycT6K+5uEcCh5FVz28hV+syYH
 G2/HCaRqdxdHCIwrX+YjEXhzCI/Vlt4Pf2kNnliCE7qsTdrA8/AdDBD98B7anv94VlBHwvasAQN
 wXZhoGj6SuO5PiEq3nJ3c15ZB9cF/TYO0/jCdzAWIEm97tPx+D6hhBQRZXlNOLcD3bsJ9k76pSD
 Lw7qjrzZZPJDWxwe0jlV7m37BsiNjrFghfcanALveHKD+T4wXc9+opijF5dTLeub2LfqnxI+Z1H
 x2wow0WO6VBDh17MxkdSuHr8V2KlTiVKqllvjAgl3JI3Y4nbyw5Q6feRCH5zCYeei3IfieJ+OlD
 8LFu2EbwM0hAWBwVMyovcFkKYkS/KGUi1CzPIROrJhznig2q74gbaYaz9C3/O1tOCw6WA2aAJ6e
 uJbfdXO29L6rxX8/3Y7nkYTa7FY5xV/5/l4bV4TgxD6TTUUZaNsfvPIyDwZxw9tBVDtyT49qUOC
 qJsA4PFjabZmhSA==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011724_693645_2F6E74C2 
X-CRM114-Status: GOOD (  12.01  )
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

An earlier SBI trap may have already used the same M-mode exception
stack slot to save its trap context before an RNMI is taken.
sbi_trap_rnmi_handler() never initializes prev_context before
sbi_trap_error() walks it to print trap diagnostics, so it can read
whatever stale value happens to be left in that slot.

Link prev_context on entry and restore it on exit, the same way
sbi_trap_handler() does. This also lets an exception taken while
already inside RNMI handling chain back to the RNMI's own trap
context instead of dropping it, so sbi_trap_error() prints every
nested context correctly, including the RNMI's.

Fixes: 00fec20b4976 ("firmware: Add RNMI handler infrastructure")
Suggested-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
---
 lib/sbi/sbi_trap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 16774fd2f73059c1268bfb9f43fdf8e9c460c0b6..e694188c25b7b1715df660206af0a501290389fc 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -394,9 +394,14 @@ trap_done:
 struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 {
 	int rc;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
 
+	/* Update trap context pointer so nested traps chain correctly */
+	tcntx->prev_context = sbi_trap_get_context(scratch);
+	sbi_trap_set_context(scratch, tcntx);
+
 	/* Call platform-specific NMI handler if registered */
 	if (ops && ops->rnmi_handler) {
 		rc = ops->rnmi_handler(tcntx);
@@ -404,14 +409,15 @@ struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 			/* Platform handler failed to handle NMI */
 			sbi_trap_error("platform NMI handler failed", rc, tcntx);
 		}
-		return tcntx;
+		goto done;
 	}
 
 	/* No platform handler - treat as unhandled NMI */
 	sbi_trap_error("unhandled NMI (no platform rnmi_handler)",
 		       SBI_ENOTSUPP, tcntx);
 
-	/* Never returns */
+done:
+	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
