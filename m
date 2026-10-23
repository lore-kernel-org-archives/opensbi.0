Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC051606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TNCBMRb8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RwCOFK8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bw5Gd3+9Wi9YKbb4aQPwWlVMXCrFLQxmS+6SJtHUAYo=; b=TNCBMRb8IegCBDN72KSXvZvT+l
	xjL9DcxAsIAIY4gBcI9tY1Qc9gWw5vfp6XKwAOiH4E6zjITD4a7rDKClheN/lthWkAg9QrHsGTVOq
	eKfkuGqummdWimKMQDSAkeVrR9TZH1k4joVdezezWkRLVjkpfp+SZKJfWYryEd8q58TI8cdw/Qhm6
	QaB7lfz3GgFIi57DnSaXbuHo/uxX9+s1CMc9UiegIQfxGQ8zjaFN9vjsOvU5rZbFd/OdyxTeRzr5Z
	8Rek+UzfsAiTK0sPhcBENSCbqEd4txMDn0k3EyKdMEg5K7IoJcSSwJtA7fyECgQCaOsgI/D9yclEu
	sWryJ2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GE-0000000FL3v-2RPd;
	Fri, 23 Oct 2026 02:44:02 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GA-0000000FL0x-36bk
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:44:01 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-188406bb948so270786c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723438; x=1793328238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+qsLXAf2xtynTG13cXoJ0nTg/hI/lVTYqhS/Yr49fQ=;
        b=RwCOFK8TQtPCoqhIylBMO8yYG4u0XFF9jZbH4QrYSmgdQuKU/UEdFIlnR0APA93+oD
         EqZT4cEegk4sQPamGpfmqnJLj1thMh+wJcFqc2NTiCmhZ2QUiqXowhEph3sLyK5mk0qp
         ycK7KELyBKv96Vy/l9fSXHH+gWqLv1sI7N+NNOwUqSgZA90XwOeyq0hMNZKZePoYYJSq
         m87Oi746JOrnVnFsyVSQu77bKMu4iCIbn+GZsyj/H8xt6hzb1yjDFNzG3llPUYDn9cDt
         wFTxFCimx0BKP6Zo2Z1mBayK9RTvLCw19BMVNcAr+q6nOtXJG6hIKz4lHFqqF213/ayP
         it7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723438; x=1793328238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+qsLXAf2xtynTG13cXoJ0nTg/hI/lVTYqhS/Yr49fQ=;
        b=JqUQQgrx7NksHd2UjOqRbshXRV+D460Qj5rN4ZxMeFhSUou3F6ApKUzJ8wBcRk/Vve
         zj2pFrD9MnVryHGyyfc41Z0qFMPuCalGBJiy6lVYoAoXv9YufZHyW33MLW0OpZyvYUhF
         FCxat9d0VUO+QrNWqVOsPRcXcUpR4JfrT8JCWOa1VrxdHdlKMb5gkhE8uQ60zfILD4cL
         Jq1R6cP3w5wS+vcHJECfyi3ODs+co/LoVUrGgvUYM+cw7UAg5iz2zv/GBjSPLv3ckP6s
         hy19wg1YiuQOIeznHI7FyPQQhAjn7jQLr7rU9OloVf7v/hoNOwySSelVXzNTpvcS2K2W
         xCWQ==
X-Gm-Message-State: AFq9FYI/qTf6GnuUI0IGX7OPNv89SE1tVr1enLXSKgD6iScAA5Ea1jWn
	BR6/PVz6uI2dXmtMtuCsU97JcGQmF+X5CmRgbih9Kjba1Ox0r3qpPMXdgISOn5GL
X-Gm-Gg: AYBFou3/MP6We2xGfZ4ieyh4c1ByD08D8PFob39e6rPnDZl/0rzbU14tUcJeTUIqG1o
	Y0ZLpBoYNfJqtW2hdR9R2tstgg1m3VfdOLqm08lYMt0NqDQ8y9rc/wHxS2MFg4hNCtXfjiB64TE
	CL0MSBKNVoVUYrBhSxJUriPOYQjdnz3L/UOrwel5uC1UO9/XoQF8jptVaVwNmvjV/57Ad9Sin3X
	Yf4lID76HjR6EHLJMvpYzuaA5txT+gD0ij5JC82RkkC2nxoWe74jgYyq0DnR031zS9okVwnOm7C
	laMhkMHCTQVCe4k4eXx14zI9FeVhFS86b6BnAEfylEYKRvxi3VQ8DGDBl6EDu7CJpAayzQTAQhQ
	FiTI/078S7HHCDdJx4uPKBayLfq0X/PzvlMym5PWWMOaS2dnrRvYUggeWtUmFd7KecWZ3pVRirh
	5GjKJ/fwt2vcDcuHj3/dU0taXNPsFT+2OIaIkXqVfzF83SBlIo+tp2k1O1UAANtM44/zMnneeij
	+PCgB7va09V2gHKgoPMbhhlNgCjQH460EahCYkyf/G12T1kjRd3NmfQ0z7bRc0gPlfaG3pLlhDW
	uan4v8zVDO3L5x1UBA2q+i/K78gXDRO8Waih1YRVo0oE1UUuACe69sJ2YQ==
X-Received: by 2002:a05:701b:4188:10b0:18a:8164:ce4 with SMTP id a92af1059eb24-19597183e53mr1600175c88.0.1792723437696;
        Thu, 22 Oct 2026 19:43:57 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:57 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 4/5] lib: sbi: Preserve supervisor count inhibit configuration
Date: Thu, 22 Oct 2026 19:43:44 -0700
Message-ID: <20261023024345.16779-5-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_194358_810529_CFFBE775 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

Preserve the delegated counter inhibit configuration across domain
switches when Ssccfg is available and menvcfg.CDE is enabled.

The extra CDE guard avoids accessing scountinhibit while counter
delegation is disabled. scountinhibit aliases delegated parts of
mcountinhibit, so this is not a complete PMU state virtualization fix.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 32ff365b..0541bf8e 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -71,6 +71,8 @@ struct hart_context {
 	unsigned long srmcfg;
 	/** Supervisor timer comparison register */
 	u64 stimecmp;
+	/** Supervisor counter inhibit configuration */
+	unsigned long scountinhibit;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -201,6 +203,10 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC))
 		ctx->stimecmp = csr_swap64(CSR_STIMECMP, dom_ctx->stimecmp);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCCFG) &&
+	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
+		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
+						 dom_ctx->scountinhibit);
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
