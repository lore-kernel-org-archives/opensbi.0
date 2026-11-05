Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4032606A326
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ryGtRlu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wqmmrotf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=77uc0TLYWay4m31r5rm6o5CGw5IAGjY3Oc4Ut8Ajc7M=; b=3ryGtRluNWLvcvy1Ho4MzpBRN3
	h67W6jj12ZKc2towhXtHvLoNfD87Rhq/R7/bu7MDCCMhX4NKi/I0cD5K2M5j+5KtMsEMFgihKYxyz
	Yn/GPp+NIUyjPQy+UGBgb7dWTGN8/AzXTiqiFSCmfKZGbqWbfba1JbLDXFrzQhg/etyMxDdASezR4
	QchZG2bkfbNMkJEAinLAMdtNl0x0BxN0LY0eixemZJCYokBRAZypOEaK+wuTnIBD1QfbNgnRrTt63
	uji366+lzWId5VlM0AvT1ZGst9X2DMQ5oShZ4tSBnsKXMb+ttYZ4rjd9aaDO6qj4DbXXeAMnDmAXl
	bZgYWsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKK-00000007nzq-3Ryh;
	Thu, 05 Nov 2026 04:43:52 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKG-00000007nxt-32WY
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:51 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36d6765756fso1533625eec.1
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853828; x=1794458628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia7IUn7qOBjqgMRzQmTtfCDXK1i4Th/E613iudYRq58=;
        b=WqmmrotfQ3t5XIq42Y+TzIHTyEJKswlDBd33qBtA6/eSK6za4j520vg3zwgzcN2GdZ
         5L9g21RfQ4aZ2rs6hQcmvrkQ9JDLnhNSAWIDNO+qkKpa68B64h5hkc/AkX9g0w06GE2W
         YZjLY72SuQBkhXiQGqWsa2A0Q6C68TPXONrZvF+Jqcj0N/hQhiQYmnMafdKvWDpLPBCE
         5WFA1Z70W0OSLcCThffjAZVozmgczJ7ucaxeGkxa8qMY78iBdkMdf5ifmm7911CWvkFL
         57xlbCXzUeb3C8xsSjJ+gK+/ALNZ8vLx7ZIRP0WtCgPChyLN7S+//k3kAFX9+JeuJUSn
         VQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853828; x=1794458628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ia7IUn7qOBjqgMRzQmTtfCDXK1i4Th/E613iudYRq58=;
        b=OlZV8tEo33O1EIZee8fcjwtepOjM7+wVkoZ37sq+v8F8bO8hc08KZQafCy89QoFN2v
         dYxxcVAm38LUA+w+xstduTS8E9ZgdLvl7Jycr5VlG4kMdDfYvqRYXukr2AFUJ0UZ1NEi
         Os/GVzUfg7QKsYsgCTl+laj2n+J22m/8lXuWJ0Vmr51Zs5h9Nhx02RUvL4iQ9TWXwpjm
         HobgfBZB93m+sC3U4q1EMf4p8u0wNNK1lbZwk/1JZ/P7O/lw6DrKGnN4B0u6n3yzxa1u
         ChvXq05KicgQ3Mmb5qlign7sPUhM3tkG4UcDO88ZEQw8WGqc1ZSB+k3HBhmU7PUSErUL
         pqkA==
X-Gm-Message-State: APuU4Z9WG5vPXbCtHuWXi9KauOiuMQUDuWinQyeUj+Mzb1dWHHXWF+B+
	ev31QrDTkOozXNSm8ofLltIqXrj/fANPotq9FERDvrgyctrlUibXY94af0CYbzR4
X-Gm-Gg: AYBFou2YfSzASIYxHSIZvReguME+POIMDxmpqXkYeLolB6Gqmq6PDI6OK6VOTmIXjjM
	2t0+T4NiNsUXApAgO56eeBhl3VBRBT04+YMJnjV3tHPh72MGOq6+LMZ09mKqVHyhlrJ1iQWT1fO
	5xB6Tkvo02FPW1n9JtwRU0zCzC4yxxwJFoswvOr6LmStHsoqM/qVvS9/kb/mzYqB0vBeIuH0B6f
	wU8OdrGL46ozh5LFNyzBJRkDX21eaalW+vQPOvQNyJDRfPl7j+OV5xiSyuTn4eJUb+oFBNTmPQY
	dO8NT+uO1KDuZ5vlfpxISCMjlF2BG7wl1+Y1d37vOqnkHGfg+5dBOPldiUxwow7uuJYqxpxw+TW
	TdNWl1qWw2LLQCYk3FpJfOaxprxm+8BZuD3uBV2UxfoYFu79Ciib18VI/5/l33awvNdPr09N+sG
	awe1QiAq/Nxn4UREo8nU3XtdKkPPsJHb7iA4o+IZDAJcH6gZI42icZomq4PadhjbRlYmuphMqwa
	Xz46+RDl69cBF8ZJJn2Xlig1qIFjvKnz5Sr/4EiTyMKX+ZVM20s+1TKCb8sonHQ5K+Jmqlxjfnd
	G4UX8NJpSDhJok2T5dOIDs/ynFYryjPbP50jKQ/1w7HTiVcmD3Qj705EuEtGMHl61Lsu/dUsWyf
	9l9tCjZvn4Tbq6z74FTYT5eQrarAzSlc=
X-Received: by 2002:a05:7301:db8b:b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-36a424261e9mr26444492eec.26.1793853827688;
        Wed, 04 Nov 2026 20:43:47 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:47 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 2/6] lib: sbi: Preserve Sstc timer state across domain switches
Date: Wed,  4 Nov 2026 21:43:35 -0700
Message-ID: <20261105044339.435711-3-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204349_661438_6A47A505 
X-CRM114-Status: GOOD (  10.35  )
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

The Sstc extension provides a supervisor timer comparison register.
Without preserving this value, another domain can replace the
previous domain's timer deadline.

Keep a per-domain timer comparison value and initialize new domains
to a future deadline to avoid immediate timer interrupts.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 include/sbi/riscv_encoding.h |  2 ++
 lib/sbi/sbi_domain_context.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..60a0c39e 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -448,6 +448,8 @@
 #define CSR_VSCAUSE			0x242
 #define CSR_VSTVAL			0x243
 #define CSR_VSIP			0x244
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 #define CSR_VSATP			0x280
 
 /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index c34d4cbb..d2490483 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -57,6 +57,11 @@ struct hart_context_hext {
 	unsigned long vsatp;
 };
 
+struct hart_context_sstc {
+	u64 stimecmp;
+	u64 vstimecmp;
+};
+
 /** Context representation for a hart within a domain */
 struct hart_context {
 	/** Trap-related states such as GPRs, mepc, and mstatus */
@@ -88,6 +93,7 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	struct hart_context_sstc sstc;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -259,6 +265,12 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
+		ctx->sstc.stimecmp = csr_swap64(CSR_STIMECMP, dom_ctx->sstc.stimecmp);
+		if (misa_extension('H'))
+			ctx->sstc.vstimecmp = csr_swap64(CSR_VSTIMECMP,
+						 dom_ctx->sstc.vstimecmp);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
@@ -320,6 +332,9 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+		ctx->sstc.stimecmp = ~0ULL;
+		ctx->sstc.vstimecmp = ~0ULL;
+
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_V)) {
 			vec_size = sbi_vector_context_size();
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
