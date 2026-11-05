Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E27D606A32C
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N0KLdlyg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gg8Tp5d8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yqeumg9CL1g2Tu+eHIi3hGVwG7repGaUs9N33HanmQo=; b=N0KLdlyg9m1UP8AYccnkGwFGnB
	h2V0H8EQTRdp9jdSTn1sCCpsUpR8wp4wJj/C8jaSAlPKXA5LzxsFNHGkfOZk7sYjQ2pE5/0dpENVx
	p6kHqMxPTdfHU5//LPph0TbbGHD1rcuIACca6HDJC25Gf94l8O0ncQH314PqaPN+f5AAT50vQNymk
	aHoLmH9fOp6jtqrHALw0CIJomzwLNLAnlIdESZ7bTOCt4cgnyk7hbX6tbKgTAxEwP6fpq8ibxY3Nk
	4iMgZbf1gpB0+A6WFTagwkmvfI5XxU9vR4Ye4cAGzOfc3MLc3SpMmDl0c6lDTac/Hh8rBXctrZ45i
	xu49eu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKJ-00000007nzE-31Mv;
	Thu, 05 Nov 2026 04:43:51 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKF-00000007nxZ-0OOv
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:49 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35c76e9614aso1937798eec.0
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853826; x=1794458626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNqL6kHspN0gxUfltFhyfxWbWaeCjzsJk92e3JCfYII=;
        b=Gg8Tp5d8kHm8BtZBc87mFcGHmFYxZQ43/pUFM9TvcBbo28Y+o8LiOWs09LT2kvOuPW
         2Wzr6L9BQJTVz1Rx8duQpy2AbWT6e/bM1tIRgbA8G2vGXohPgOoUkmB+50gP+mJ90GpO
         oKRV94af9a6EZ+oYOTZXdaHNPjxKAoGLW2qJosE00ZUhAE9towR6j4ldfc0nEmYIG9jm
         J2JSeWxrble6slTPKtOCGGIA9q8UVS3slJ0NA5QtKRFOMjW9JaYm4QqJaN5qLaf8V20G
         vrF9cBazUU+6t6mhqo699XB3jwlXV+matq4lVXLicTe1H+hv8Q0fq6aN0XsjgKLbk97k
         Vzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853826; x=1794458626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNqL6kHspN0gxUfltFhyfxWbWaeCjzsJk92e3JCfYII=;
        b=IH9OodoHGXukWO0UFmFfFDc8RpY+KBGNbEOdkQwsBO/sQ9cOk3EPEskm1g/7ekxP0q
         sTHd2NaMRnuuYn/9XiRZ3NxezNcWmzoM5Cu+SLzWGix1l8WTdayy6z9JcT6g+WXeh26+
         ogF/b5/ysBGHrK3+IArubReKr8Lq7PlYjD3QabCj4nhMeANwk35FKXXx+snQYviV4i/+
         XUVSP02VTEXCeaV55Jm85M5/pbDR7vKYYF1FeqMmfhXt4OmnYLHuPnLpmg2GQTfmbDMR
         53FzM8KVCDdIGGnsx/k19B14HgxwqnNKPXN0OzUswtIVA++KPrPOCQl52ywkJ9Kc4+Rc
         hH3A==
X-Gm-Message-State: APuU4Z/faXcoG83zKrEutdqXIaa/hfTiSjw2gdwLHaUfbdnb+Ikr6CPL
	gMnBYYNfJmnKwZNPBIOx5IfKZXx/AASah8sJmy9kVcnJJtREgaKXvAi3cbtEHRxh
X-Gm-Gg: AYBFou2cffyiReVEfOd7SNwQWmCtCHfJquq4eQ2lflkKf1npzj3QPESUgJeiVtxhPAZ
	dkXTOUQMupcaKR7bk7N2fB1wl7wNQBbydQjTx/P/FmsXPTefhrGQ6JN5IXRAvD6a10YRqH/S8+m
	3LiwcntiuyW53d7U179MVuSH/+5b+llVmFZv3+yraKbRQGcwvJHk7tWeWB1bPyHqlmz7zW24IXd
	q/r299FaPW2DePF/88KzNAjomAL3yIkXzrVxCCTv01NzaOXSZso785e3rgpWUe0E2oAF8LymORy
	511wAOMEFMF/TpuFEnUpQgST6bw579WB66oOGphCBMb1VSefXB9lOychXC+/HRFD2i3qjVEZisc
	fqN4ykJjKYeJ9Rozvhzrvjv2fjh63v6z8Fv4XhTtvz90B2Ya7P8+G2DY87W5bfsMs164kOVS+em
	qc9N+F8xODJW0p/Qn3N48Sa4jf1ozN7abOYQhaLzzliwjqhcBKjZc95eX7qIMn8XNH6EQaILdxi
	j2EM1i/PT8eyv0r0mDjDWtLqNKDydsFccCg6QxmXuzZPB/ozGcCbDD/f16nzDWlEsmYSahM/hmy
	fkCAoduuAJO8mOqXG7a5WYjosFhCd08xw0Q+zXKaW+GDUxrgrLYQIBHJpaKt461FIQ8uN7fHhEc
	icE7xbtIKxnnFYEfh59UotTBZ7fHFO7s=
X-Received: by 2002:a05:7300:fa17:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-36a4237a6d4mr24656056eec.17.1793853826017;
        Wed, 04 Nov 2026 20:43:46 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:45 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 1/6] lib: sbi: Preserve hypervisor and VS state across domain switches
Date: Wed,  4 Nov 2026 21:43:34 -0700
Message-ID: <20261105044339.435711-2-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204347_134893_DD8B408F 
X-CRM114-Status: GOOD (  10.44  )
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

Save outgoing VS state before modifying S/H interrupt configuration,
then restore incoming VS state after the H state exchange.

Preserve core H-extension CSRs, optional Smaia hypervisor interrupt
state, and Smstateen state-enable registers.

Include hvien, hvictl, hviprio1, hviprio2, and the RV32 VS interrupt
high-half CSRs.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..c34d4cbb 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -21,6 +21,42 @@
 #include <sbi/sbi_vector.h>
 #include <sbi/sbi_fp.h>
 
+struct hart_context_hext {
+	unsigned long hstatus;
+	unsigned long hedeleg;
+	unsigned long hideleg;
+	unsigned long hie;
+	unsigned long hgeie;
+	u64 henvcfg;
+	unsigned long htval;
+	unsigned long htinst;
+	unsigned long hvip;
+	unsigned long hgatp;
+	/** Optional hypervisor state */
+	u64 hvien;
+	unsigned long hvictl;
+	u64 hviprio1;
+	u64 hviprio2;
+	u64 hstateen[4];
+#if __riscv_xlen == 32
+	unsigned long hidelegh;
+	unsigned long hviph;
+	unsigned long vsieh;
+	unsigned long vsiph;
+#endif
+	unsigned long hcounteren;
+	u64 htimedelta;
+	unsigned long vsstatus;
+	unsigned long vsie;
+	unsigned long vstvec;
+	unsigned long vsscratch;
+	unsigned long vsepc;
+	unsigned long vscause;
+	unsigned long vstval;
+	unsigned long vsip;
+	unsigned long vsatp;
+};
+
 /** Context representation for a hart within a domain */
 struct hart_context {
 	/** Trap-related states such as GPRs, mepc, and mstatus */
@@ -44,6 +80,8 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+
+	struct hart_context_hext hext;
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -131,6 +169,25 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
 	spin_unlock(&target_dom->assigned_harts_lock);
 
+	/* Save outgoing VS state before modifying S/H interrupt CSRs. */
+	if (misa_extension('H')) {
+		ctx->hext.vsstatus = csr_read(CSR_VSSTATUS);
+		ctx->hext.vsie = csr_read(CSR_VSIE);
+		ctx->hext.vstvec = csr_read(CSR_VSTVEC);
+		ctx->hext.vsscratch = csr_read(CSR_VSSCRATCH);
+		ctx->hext.vsepc = csr_read(CSR_VSEPC);
+		ctx->hext.vscause = csr_read(CSR_VSCAUSE);
+		ctx->hext.vstval = csr_read(CSR_VSTVAL);
+		ctx->hext.vsip = csr_read(CSR_VSIP);
+		ctx->hext.vsatp = csr_read(CSR_VSATP);
+#if __riscv_xlen == 32
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			ctx->hext.vsieh = csr_read(CSR_VSIEH);
+			ctx->hext.vsiph = csr_read(CSR_VSIPH);
+		}
+#endif
+	}
+
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
@@ -141,6 +198,61 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+
+	if (misa_extension('H')) {
+		ctx->hext.hstatus = csr_swap(CSR_HSTATUS, dom_ctx->hext.hstatus);
+		ctx->hext.hedeleg = csr_swap(CSR_HEDELEG, dom_ctx->hext.hedeleg);
+		ctx->hext.hideleg = csr_swap(CSR_HIDELEG, dom_ctx->hext.hideleg);
+		ctx->hext.hie = csr_swap(CSR_HIE, dom_ctx->hext.hie);
+		ctx->hext.hgeie = csr_swap(CSR_HGEIE, dom_ctx->hext.hgeie);
+		ctx->hext.henvcfg = csr_swap64(CSR_HENVCFG, dom_ctx->hext.henvcfg);
+		ctx->hext.htval = csr_swap(CSR_HTVAL, dom_ctx->hext.htval);
+		ctx->hext.htinst = csr_swap(CSR_HTINST, dom_ctx->hext.htinst);
+		ctx->hext.hvip = csr_swap(CSR_HVIP, dom_ctx->hext.hvip);
+		ctx->hext.hgatp = csr_swap(CSR_HGATP, dom_ctx->hext.hgatp);
+		ctx->hext.hcounteren = csr_swap(CSR_HCOUNTEREN, dom_ctx->hext.hcounteren);
+		ctx->hext.htimedelta = csr_swap64(CSR_HTIMEDELTA, dom_ctx->hext.htimedelta);
+#if __riscv_xlen == 32
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			ctx->hext.hidelegh = csr_swap(CSR_HIDELEGH,
+						dom_ctx->hext.hidelegh);
+			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
+		}
+#endif
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			ctx->hext.hvien = csr_swap64(CSR_HVIEN, dom_ctx->hext.hvien);
+			ctx->hext.hvictl = csr_swap(CSR_HVICTL, dom_ctx->hext.hvictl);
+			ctx->hext.hviprio1 = csr_swap64(CSR_HVIPRIO1, dom_ctx->hext.hviprio1);
+			ctx->hext.hviprio2 = csr_swap64(CSR_HVIPRIO2, dom_ctx->hext.hviprio2);
+		}
+
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMSTATEEN)) {
+			ctx->hext.hstateen[0] = csr_swap64(CSR_HSTATEEN0,
+						dom_ctx->hext.hstateen[0]);
+			ctx->hext.hstateen[1] = csr_swap64(CSR_HSTATEEN1,
+						dom_ctx->hext.hstateen[1]);
+			ctx->hext.hstateen[2] = csr_swap64(CSR_HSTATEEN2,
+						dom_ctx->hext.hstateen[2]);
+			ctx->hext.hstateen[3] = csr_swap64(CSR_HSTATEEN3,
+						dom_ctx->hext.hstateen[3]);
+		}
+		/* Restore incoming VS state after H interrupt configuration. */
+		csr_write(CSR_VSSTATUS, dom_ctx->hext.vsstatus);
+		csr_write(CSR_VSIE, dom_ctx->hext.vsie);
+		csr_write(CSR_VSTVEC, dom_ctx->hext.vstvec);
+		csr_write(CSR_VSSCRATCH, dom_ctx->hext.vsscratch);
+		csr_write(CSR_VSEPC, dom_ctx->hext.vsepc);
+		csr_write(CSR_VSCAUSE, dom_ctx->hext.vscause);
+		csr_write(CSR_VSTVAL, dom_ctx->hext.vstval);
+		csr_write(CSR_VSIP, dom_ctx->hext.vsip);
+		csr_write(CSR_VSATP, dom_ctx->hext.vsatp);
+#if __riscv_xlen == 32
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			csr_write(CSR_VSIEH, dom_ctx->hext.vsieh);
+			csr_write(CSR_VSIPH, dom_ctx->hext.vsiph);
+		}
+#endif
+	}
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
