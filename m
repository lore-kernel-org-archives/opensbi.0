Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C1606A31E
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSHdwruL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kHGFWYLB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mef2nqci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZzFdG7pXRBbBTpQcbZMSQXRX7bSKraqTTQwGhPulFeA=; b=KSHdwruLJZriu85w5BrFxjlpcR
	PAFesQywKuNlaxFhLjYKVT0OAsIkmuXER2okHJF68sYrBdMnJja9MXRbmh4Aw+gKLgCzB9wF2CL8u
	iqE0RbXfbJt9SjCX0JUPrghP9X1n03np88qKTGqFwWuFYB2/4FJES6wYJROWYCCSGU4Eezr+2HjKI
	8P02LRwXP+dwoPhjjCPBjW3LZeW/Uz0YXMO9dlL0RE9o8kurmJHcMACzP7bl2FkvoJTrvlXYFe53z
	C7MH4eVpvifrIyBvrBzIcPPxXtl9yWHlVHD7gTZEPdt4kWwBA3ny6MMu4IAXW3Iqg3CieyfCcEBgH
	qYm3Jz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GP-0000000FL8M-3qPx;
	Fri, 23 Oct 2026 02:44:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GN-0000000FL7M-2smg
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 02:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=89b0Rwwzl8WuUWqcwdPrJuMTDRhzXEsfF8M2lOcTM/A=; b=kHGFWYLB1K2rACLBQoHSfq9UAA
	I3JBCcPhV0fg93aY3QQ7MffJ+Adta2o2Cp8P6QKY7yCxo8Yn/lNVaCNXNrFOss++l8Ne74tHL6CrK
	YLBxVKhZPK41HNhiRmm7oeKxwl/yufVreFe8FI3H7D7OaXC0R+iYkE9GgnoDCMWK/ZesZgBn5ecZx
	cOyHjk3qcP/U39dSa3t5bOCZr32QZuC9x70uq553yt+edCQxZswm+GkdCg2uU7jhgXU0Sc7bzBkqL
	mHo5Jz7BEd8d+H2iaeqMT5Es9zy8OIgGQL5UoiEiXEQ58APhSwizyWcUsmVU156FwKGZyAo+KeXEQ
	FYx2aYpQ==;
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5GA-00000008Yce-1eUv
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:44:01 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1931ff67a29so1172039c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723436; x=1793328236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89b0Rwwzl8WuUWqcwdPrJuMTDRhzXEsfF8M2lOcTM/A=;
        b=mef2nqcirZh2hezSR0FEcoc6OaOuDlMallzd3Z4IJsS8feq57tmYWM++e21BXTL9TU
         HlHx7qo7gKdFd1Oo1sdPxlKC+A3WzXdges/a3KCGXnPKMRUIT+XapCNEgP2e1EMr6sZU
         IR0HFodSo1UGx7YqOedLGH/QaXcRlvTtczY4l62CGYf2EtnfUPLseC4+HWg2ZYVLcH4F
         g2asppYddGSoj9Fo1bNqCZbNCV3dq7qBOobosEfyoENqFREftD6iRyC6KDslltqewT5E
         V5u9eEM1J2l6bIlXFF9pciMOn9e4XdhUP2Dkwpsefgybgbbe+SbaHhYsj9rSHlqizrGb
         muFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723436; x=1793328236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89b0Rwwzl8WuUWqcwdPrJuMTDRhzXEsfF8M2lOcTM/A=;
        b=JTCkIzXFAnSL2u7NvF0TGBWyGNQ263N+YHDO7O0pbDGfNHcpvCJCCJIkQfNFoJEU+t
         niIeSYeTgUL6mrz2hDgo96sUvmi0j2ZXQ3G8z1dxjSNxpReDtlJeUzF0I7Gtylo1pGtG
         MYFIPgruI0uZdiJEebrFuwgJWFUKIqJY9ZQC5kLzfMka8oyMfDXF8XcjYYjQ4MZOYc1c
         7M9B3N3ognJ93oamyEt12n/pncnSxvjretPdddpTO7BrjOdNrhOqgUH2Bwm17jT9Ture
         39HeG2m14wmkvOar90uyBdV6ajp5MhaF1JTkCc1ShYjsV0JthRZjMVjmZkkFw66AEqHz
         Y18A==
X-Gm-Message-State: AFq9FYI30Zn6sRzbfNiuIUUduRD25kAa28Z3T35b7CNxWr9/5DdQBTfs
	tqJMtHcM2pTG2pURJ69nrtRrSVhrGwS7a4JI8D1yACfMYoRSGs1GmmELK7hI1RBT
X-Gm-Gg: AYBFou2tHl8b+hKLLNlFyQ90KydFb0TTeLYPmMhSmFYzfOO1c/r8qGi+fUU5saeJY34
	7Kl5TZrNfmVlGpEfSlARisF/0QK27v3kiOWAn/9mzvEVBYvNJnSyhLXgY5DqEyhS2jJkTRu4D6u
	lslCK63tDVyAbeKOmbJkk4hoYkU62wWFSsZyqtxn96ONBPQQPwzVQ2vkE3df1cI8E9e7O1XzKzy
	6R2m7tAcahQCn+lQMRBu4nJOCxChWzJd7xYCaVDnD/d6yXm+sWHYemc1yVO9pZMQMlAfxeKJbhK
	05SodE473VKt+Src0lqgv9/Rald8Lm68aQN+AX/jyuo7sMboUfD60fcDeIlAd9RlJoqPZgPt+e4
	FZHIot5H9Zr1FYNqZxSm1uI/QbAztGfFV+0Z37FxGn1crjpOpcL/Gic2mK4cM5rweJzduKacqMC
	yVHoRDThSGsmOsiuRLUVOOVNd/g/amzVcbanEdBuswpy3xgVp/k6Cb8GteARRf2UlIMHhtm1k4w
	mW5xh71kxJjKnIJ6t1OsQQaYDdtrlVKj3mWXHg7t7sZxLs2Zxx67UgoAfAf7YAyzM3xl2m9msV2
	BcJO3LQBVECkdc7GILuchurEuNVVg16sCgwnc1oFm2l2qEjxzX/Zh5HC3g==
X-Received: by 2002:a05:7022:250c:b0:145:4ef:e8de with SMTP id a92af1059eb24-1959aa3998amr2407203c88.6.1792723436076;
        Thu, 22 Oct 2026 19:43:56 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:55 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 2/5] lib: sbi: Save core hypervisor state across domain switches
Date: Thu, 22 Oct 2026 19:43:42 -0700
Message-ID: <20261023024345.16779-3-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034359_307211_89B30908 
X-CRM114-Status: GOOD (  10.18  )
X-Spam-Score: 0.1 (/)
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

The domain context switch saves several supervisor CSRs but leaves
hypervisor trap, delegation, interrupt, and translation state shared
between domains.

Exchange core writable H-extension CSRs when H is available. Use a
64-bit exchange for henvcfg and check Smaia before accessing RV32
high-half AIA registers.

The domain protection reconfiguration performs SFENCE/HFENCE after
the CSR exchange.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 26980658..caec5486 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -44,6 +44,22 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+
+	/** Hypervisor state */
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
+#if __riscv_xlen == 32
+	unsigned long hidelegh;
+	unsigned long hviph;
+#endif
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -141,6 +157,26 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+
+	if (misa_extension('H')) {
+		ctx->hstatus = csr_swap(CSR_HSTATUS, dom_ctx->hstatus);
+		ctx->hedeleg = csr_swap(CSR_HEDELEG, dom_ctx->hedeleg);
+		ctx->hideleg = csr_swap(CSR_HIDELEG, dom_ctx->hideleg);
+		ctx->hie = csr_swap(CSR_HIE, dom_ctx->hie);
+		ctx->hgeie = csr_swap(CSR_HGEIE, dom_ctx->hgeie);
+		ctx->henvcfg = csr_swap64(CSR_HENVCFG, dom_ctx->henvcfg);
+		ctx->htval = csr_swap(CSR_HTVAL, dom_ctx->htval);
+		ctx->htinst = csr_swap(CSR_HTINST, dom_ctx->htinst);
+		ctx->hvip = csr_swap(CSR_HVIP, dom_ctx->hvip);
+		ctx->hgatp = csr_swap(CSR_HGATP, dom_ctx->hgatp);
+#if __riscv_xlen == 32
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			ctx->hidelegh = csr_swap(CSR_HIDELEGH,
+						dom_ctx->hidelegh);
+			ctx->hviph = csr_swap(CSR_HVIPH, dom_ctx->hviph);
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
