Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A141606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eObW/iIy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SvNEzBhZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MU7IJAge2pPZngXWqZDl7q499QJdW5rGj6xdqnqu7Ug=; b=eObW/iIyd2RD2b9DpF4f7kayaG
	h8YQKoVAQ51Ob2XbQC8gt2V+CrzaqoGv9Rosvy/pBCNkZsRuG9ty4OPJQ7Phvz0s9RS/PRJLknS25
	CnrIdOGjnmDftK6MHgsT+QTZKKRFCb/r8LbPAnI8Ui5m8LahPXbpkoIcB5oavFUS0HYfKFdxekcb2
	L4fsBtAZCJyv6tvermThJodhTj+iyjEbgmSvOK4wMVTsQVJI8qdKBIMk7Bd5/JhkPE5crtvc04deh
	8fybVMR/P1pQ/k2rpqQDnYFFURiO3AxK25fqlJPwJUtcjIDWlRq23nqTtHrBsWDsd9bopvyAp4TUC
	KGp8D/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PG-0000000Fifq-1tM4;
	Fri, 23 Oct 2026 07:09:38 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PD-0000000FidR-4785
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:37 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36661f953e4so986909eec.1
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739375; x=1793344175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNP9BAVfHAqJyGcImMCaRhV1YGFX3bA9SK5AEW0Iozo=;
        b=SvNEzBhZYrZOGCczejy0Cuk85nSuoK3IhC7uBjb7ZnJkmpMTfANk90Xsd6zPl8ef9i
         DLvVL7XO7+RJJhSrrsFFG1XpEysW8+6tQzhswGSA1vvEtL5B1KOHGOnwcBs8DcxJ8+jD
         hWJk39N6gVbPAFVJ+UI75kYe83QYSHhKaV+rkVwZsYmtKkBnDKJTvkDjf71W3xUwS4Yi
         NKqhgxPxm2FvCC/GCaDilBUefzCmJM5J/lWX5f2jZLyUVUq319prPT3dDc3fHDHZjPch
         iO/oD+yZh8sFY5AsrvVBh/0wxA6Pd/osVv0XzE+QoGcNeuMg4o+uhopJO+Okgezc2mzv
         Crxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739375; x=1793344175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UNP9BAVfHAqJyGcImMCaRhV1YGFX3bA9SK5AEW0Iozo=;
        b=GykI35GnqtMafVRepnV7NOcqIEBoCoUhZF/YaFoRsF8LtIGEmDty5LajC+RTw5wWLj
         n2UmQlLKCGAraBhSgWQHwLB5nmQLkimagvIXxwRZRlTcgknf3tF4oqbRiE6CFyvnyl0W
         6cqGxn42OZG8R59EYvDjCzzMkqft1GX0VqoO9w3mpHbaOBEfpRM3z/thjGmkgjNUdpg4
         y3B+J2nb/xceXDgWngCOe0LsegIyMrixqw7tKbttKjEOFIDD5Rthzt1qd/ZMvuPNb+RO
         rvS9+UvCZrt/+Xr5DEL8MJ0mD8ns8pTckS2/feil+ueGcH+/1tx8NluAnF3uvgvsKivP
         KB8g==
X-Gm-Message-State: AFq9FYJ05bzGJmp9Fm4eSCrLCMfktngpy41aPVJfGQ2Lw1iKhvcVidyv
	MGeYvZ2lRTl+fa6pWue8gnPw3uJBncKQKeOKTSZvWlgHhxXC2+8cQrTHgGqfgbqb
X-Gm-Gg: AYBFou2wU3V4TOoaPvRNeH9tNajP02zNvo++CF6enrjqjuXqD8JByxzr8/lRZV5Vp2D
	6Fz4CJI92cGn0aLsvcNnPV0nFQ6VNhnQ7GYOaVn0VYhVAgiKnPsUx5s4v5EaZGx9DWzYpM802dV
	Dcg6F5V1wB3vh50AGXxIXySYugkpiQMZTb41ISxuFC29pzSuZ54Z9I/J0fQ3Wad37w25fZLXrBO
	bNEM1lm8jXLf0QNOGyT1v6CYwhzc1WF3rCNqi2JusRRX2/1oHg5hkeVtyNgnhfBHn2pTP7d3Loc
	UA81TCAbo3xZavw+/3Uw2tnEDbZyQrpjWeWUtkZbrRIg/BBNbWZ9WVg/eAxUHETJZRvShXnnVdZ
	FM59l7nSxQMOZJUZCuz4jXOaSzmkyRxc80Pc/KUgFNA+HwN4hnBHSn9aKgqY/cU1Q6qnm1NivSj
	ohzU2JsQYRl4zxEZ7X52DsUhtiYbhkJY4myV60CC3GP4RqsvV0v5odP4XFMBBGj6Cwhyk3Ffp8h
	jOMq5Wlue3LIrFFzDH4/WgT9p6IgH/I0ghNA+0fYN476gqJOViLSmJWeFXWCRvOKaLqutcF77gQ
	UeJfsB7PVcl5VmRTMEWsCkVEoHQGuLVOC0g23Zi4bibTJaOlfkxKz5YGHcoTo8ONe12p02aUdD/
	0iu4=
X-Received: by 2002:a05:693c:42d2:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-369d9826d9cmr1741432eec.19.1792739374874;
        Fri, 23 Oct 2026 00:09:34 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.33
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:34 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 3/8] lib: sbi: Preserve Sstc timer state across domain switches
Date: Fri, 23 Oct 2026 00:09:20 -0700
Message-ID: <20261023070925.241680-4-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000936_028066_A4263709 
X-CRM114-Status: GOOD (  10.15  )
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
index 79419edc..33c19d04 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -52,6 +52,11 @@ struct hart_context_hext {
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
@@ -83,6 +88,7 @@ struct hart_context {
 	unsigned long senvcfg;
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
+	struct hart_context_sstc sstc;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -231,6 +237,12 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
@@ -292,6 +304,9 @@ static int hart_context_init(u32 hartindex)
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
