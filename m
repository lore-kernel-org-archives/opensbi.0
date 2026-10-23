Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74F606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCZkF8el;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yo2sY1Sh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SJFlelTiB8AbzKu7KBW2FldrVrvzf41XyFe39oHpDwM=; b=fCZkF8elZqESm7kz03Nd8VWAlr
	uPqYUSAKTh4t9JoT8PhGqGCbT5Vb8N7RaN0yeEHIIlZnwbNYlvUDXUZobmUvn0Ge5dSE861jXTTzC
	eaBHcuNvcRB1q/cEpTuJIOsW9FHj0C02EoO3tyjqd4jTwDr1jXDAyWpMXMGC7V2hQPNA+k5J97qJD
	lve1/R7eC+ve5TkwA8RjLyjnGYvy3/Za/vvj/iKz2r+kpO6XGgdJ/8UxZTM8J2EcfQmhwBPWOT3df
	Wfw/eDTdQaffv8uVbmqGqtL7oaoOpcGhdUstwZJRGRWCzuGz23dfyXd9IbY00c3DBFTrErKGPAUn0
	LDlI7GMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PB-0000000Fibk-0IXu;
	Fri, 23 Oct 2026 07:09:33 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9P9-0000000Fiaw-0TOt
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:32 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33fb4680717so1508338eec.1
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739370; x=1793344170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TioZYPAHPRvQmjG0TDUl+HIkpV0YVkYD1DBNuRu78MI=;
        b=Yo2sY1ShUkQxhrzbBWtwx+XF6NgxBPBicNQ4V78XhUpDHI2TdRga7PEGsK8YcQbOSe
         A5T1QbjcIGvJKbSn1aSfYzEstjMWWKe5k7iqe2kBZE/5X7Yd1hABafwxYJLdPzkaY7Hn
         55jqygbDI91ch1cYCBXBpNxGmndBPkQH+CArguNK2Qa2HvMWrUHhTMPnZxT9jVdzaDeJ
         BztnhJCPKAL2RSwodIJ6BChyJND4WJrHwznJFnEUxKsfRE5tPIkW6QKGIEe9uLSgCk7b
         GRNnkL2CAb75AL3r2meZUrKdyTuJtmzJJGs5nQ84nKthJzMohsG+KQu/6LPLNEijurNX
         2Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739370; x=1793344170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TioZYPAHPRvQmjG0TDUl+HIkpV0YVkYD1DBNuRu78MI=;
        b=Z8ETfZ7GVvx712iP4isAaZ73CZdzo/Gcim9F7O5S7RuheOJo00ul7XtkVGXIZA5FEd
         xmz00VYn57XIBMyowu8Ukz62oc7aKrsg0wUqX9IkecWPKllQqS9HsEFyBGcqeuLETCgR
         y8Nc9+283JhKGZX5mKrubae7uyM3dUZSiZPOCxPJyfQ97/MTGfHDahRmG8S7vkzTIjII
         Wo+3mQHzzDDA953QiZmxzg7vvVmVbTrOhoOjCzCDiB4kYyT1fIsn0jcMVqXCDOmQmEiY
         T28XTdDAY0QG9XTm4XIwb1BUjppyb2Pm0rZeD5zEVFaDWddjh7423Iutg4ATsUD8+Yf8
         jgFw==
X-Gm-Message-State: AFq9FYLeHlMFidpzoo3Md5ICI+K3lcDmFBYaRhi51h7uXHTXqQPhanqs
	MXLL2OjIqY1+NEhocuktV/zFEp1U1hiwIxHTihDE6Obf7rNY7FfsncdUOBTPrR/h
X-Gm-Gg: AYBFou3MKcmzwbl0QapFzARoqb6eTw+z0xiDbt7Fu6yEqccVPav0WRxwcc9gqhA30+t
	vHU79qvfozBjUjpruLpg0D/51+TIA/PA0zGkFQCfYJBG7Yc0XB3wTdNQbAY/cwLmItjK7rSkzL1
	fH7TLNEUsGyJ2SMAD6AnJ8EIz3y0HLR2HALlmq6HExJlMf5zl/46WaUEDWIA9jlr+F/t3Fx28jN
	coAjMMgPjNXjaaMfYsYqhbpjAvh4hBI6deOB2Gu62qcmSx4rFFMXunUHlcQlI0uyXfiN0vnN+sf
	gjAntU70FhhnJW1JfnhzuXoMz7P+g6Ff8HAvXDozjThcCCs/Vguqm3jPv9apGaPkH0lnBIfADlx
	KRjVD/1SOPW7A+XDMZEeiw5K71JlS3koqk8izTrF0y4L79C0aD4dtQtpJrMwIIapCF6G/JWMN+J
	r841hRzTuMfurpIfHQNJzzBzYogzEES2KCuhxokHK7CzKJIwhrIU+7kC2RjKM+vT1PHfrRPvdmK
	CzDS93st4XfwO3JczM1dDsB7gkJQLtxWKgtyR3rHgGENe0QkQATJukQMmldiY3TPPSfVyObiyI4
	pdmmdergEEdYz8Pi+kN7VCEaRSwvZm0tTLMNSpZ8qLfNfAfpPjUP591AqQ==
X-Received: by 2002:a05:693c:42cd:b0:369:779c:6e0b with SMTP id 5a478bee46e88-369d987159fmr1909228eec.36.1792739370174;
        Fri, 23 Oct 2026 00:09:30 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.29
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:29 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 1/8] lib: sbi: Preserve hypervisor state across domain switches
Date: Fri, 23 Oct 2026 00:09:18 -0700
Message-ID: <20261023070925.241680-2-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000931_154916_0397BD9C 
X-CRM114-Status: UNSURE (   9.56  )
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
 lib/sbi/sbi_domain_context.c | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..4bafda5b 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -21,6 +21,34 @@
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
+#if __riscv_xlen == 32
+	unsigned long hidelegh;
+	unsigned long hviph;
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
@@ -44,6 +72,8 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+
+	struct hart_context_hext hext;
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -139,6 +169,46 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
+		ctx->hext.vsstatus = csr_swap(CSR_VSSTATUS,
+					 dom_ctx->hext.vsstatus);
+		ctx->hext.vsie = csr_swap(CSR_VSIE,
+					 dom_ctx->hext.vsie);
+		ctx->hext.vstvec = csr_swap(CSR_VSTVEC,
+					 dom_ctx->hext.vstvec);
+		ctx->hext.vsscratch = csr_swap(CSR_VSSCRATCH,
+					 dom_ctx->hext.vsscratch);
+		ctx->hext.vsepc = csr_swap(CSR_VSEPC,
+					 dom_ctx->hext.vsepc);
+		ctx->hext.vscause = csr_swap(CSR_VSCAUSE,
+					 dom_ctx->hext.vscause);
+		ctx->hext.vstval = csr_swap(CSR_VSTVAL,
+					 dom_ctx->hext.vstval);
+		ctx->hext.vsip = csr_swap(CSR_VSIP,
+					 dom_ctx->hext.vsip);
+		ctx->hext.vsatp = csr_swap(CSR_VSATP,
+					 dom_ctx->hext.vsatp);
+#if __riscv_xlen == 32
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+			ctx->hext.hidelegh = csr_swap(CSR_HIDELEGH,
+						dom_ctx->hext.hidelegh);
+			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
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
