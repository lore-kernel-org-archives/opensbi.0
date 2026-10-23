Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB2606A31E
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SI1BCD8G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q1omTnYF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WqnQF1CKxiqCoSRfA6Ir0CLbnCuBqEUccmiwDif2jCU=; b=SI1BCD8G5SgIrru6t6n/jRy30p
	+bgZ/VZTNaA3CoV6UYRZ4A6+5bYTxwIVAQfi5criuOz08xY5ScLvXytmCzhnb0wS4pXEv/5IqTYrf
	GP+6neHk14z7AlxhVUJkKZjH7I/aS5TM9Cw/WoA/O74pVZn9FMkOP2svCNK4Dp26nJnOy6eNFwWeF
	+EWEwYgzgV1DOL3CctRcPSJA56VyJQt03MMIzytNPtF+33tbV3XmLvlkNiDl/8agp7+9TutctwvWx
	krT4uf02QrvgeQ4GgnCCuDVvS+lU8bRk8imSP4erOVCntBfIOH56+nSxTvv6Zd/dCiI8PgHQ9hZoH
	woCKZjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PJ-0000000Fiji-324B;
	Fri, 23 Oct 2026 07:09:41 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PG-0000000Fig7-3gxe
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:40 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1027237eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739378; x=1793344178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t7p45VnwdrZdB4Hdkhe6b3HCfYJKbJIotQGak0VMpl8=;
        b=Q1omTnYFJOddtCCBRlWWVy6kBO+s0QUuYBZkxkwUzHUmj3/caLG+iGvbsCSCr1A+xE
         P5t4zGWx4/daoEiDCSiXdKT99g1mn9Zvhv2/YOpUvGXUbobFpczMJRxgvbgiqT5x4fwb
         aU74oScA7oUyCq22TWrH/imqp56FFJ0/ge8sskfJDQ279zW9d1hCcMFDfclgkVuXhtX1
         3SEA6VCs04S2o6DzVvVXSdgf2ze6iJiPMiYqSLQwmnz5J5hSooebKRiQMtRUZFEDN+Ni
         0MJ+oZa6xtXi27OhT0Xv9b8Y07mHrhb+/49hvCB+rXu5mWs+G/aajm9DuZCfuHoytlET
         zlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739378; x=1793344178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t7p45VnwdrZdB4Hdkhe6b3HCfYJKbJIotQGak0VMpl8=;
        b=cKi/V6qpVa/VdS3Ygz6+4A0kHfpKMLn7ZWFTnnoHIkgdUeR100Ia678awu8tNtRv6y
         U/3U7tDzmEPUIcd5A32OathgPwDTzfgOfUu3y6K0vP9xhveM1e8QFPLebqm+k7sB560q
         1saYk3F0JzpKvdfNvAhLr+boffj6OJ4dYIT2H3l6dLQi8sQVy88Hx/27IkERf636yaL3
         kTelCoFHwpImoeIJZjPo/HWvwXZ2bUINv+ifoJV2S7CLSS3RL9OCqwcG4uwpAWsfI9ta
         6YG8h20XY3zZnCrXNSaxSKqo63VinZAA5Ob9LHcb0TEieUKcggOhSQsPhynOSRQyMZFC
         G0Eg==
X-Gm-Message-State: AFq9FYLCuInuYXULyn7qJZhqfh0Eu4KOkI4f9hDmYP4G1iOBBc3+XZIg
	DXlbq+fGDJxhXPhJP3Ua/2yUaJR5OqmRsV9LTqTud6rJgPALZp6vcFqN7w+otTA6
X-Gm-Gg: AYBFou15M21AAeNRACGsh9ErXa88TYnqZ9C8tTsE2weHxNLq34nUJDRea7/Xi1x1k6j
	FFccGjsUQQY40e6X6pwJEDc4z9eJVdS4srX+DvPk8xC4PUbVon97jkT+KtPjmK2Vl4bj80/6x2X
	wX9YfPacmXATcPeCuJdfPzaWBJHwejLYWVTXDwEO5uC76ksWqRsRv0aYS1jYNOvBTanjfiay1CL
	lM/Bv7sWUctSn958eoqyz6DzvQupABl/yoVr5+3FIEy1Nm76Wm8SHcYQs8wGpI94roQio/e3HQl
	MVSOLD8vHrGkX7ubJ3EFLOT3W2f1zLgPDDru4mSD+SWXpzXHPAtCMYJTMcnns2/7baNK0wmql6p
	lYOhrQ8gqLjhpsUWrJuoa+d3Meiy72YJD6sMFCzp3gxOQDzF7o0Vu4TTkK9oYaeW2FPrJr+HDDX
	mPRHtjTrUzLbuAXHU7K59iRqI7B9atBzMz9YLRHQc4IBvr8Kyh/sN91EV9vjjOiJlEcdEehxXTC
	sc+86TnnWGtpwCGfcQQX/EoXQhANQrDPgQFBWJ/OeKv+2XwN574rpwDMiUQeNUSeit8Sx43tcty
	BBkQL68FBOEbV86Or05012D/ZPDGWq8OXenl9On6iCg5bE7JNBHK5qzoUQ==
X-Received: by 2002:a05:7300:c01a:10b0:355:fdc0:a811 with SMTP id 5a478bee46e88-369d9868651mr2127654eec.37.1792739377944;
        Fri, 23 Oct 2026 00:09:37 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.37
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:37 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 6/8] lib: sbi: Preserve supervisor AIA interrupt priorities
Date: Fri, 23 Oct 2026 00:09:23 -0700
Message-ID: <20261023070925.241680-7-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000938_928056_810EB70D 
X-CRM114-Status: GOOD (  12.34  )
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

The siselect/sireg window exposes supervisor interrupt priority state
at selector values 0x30 through 0x3f.  Save and restore the implemented
bank across domain switches when Smaia is available.

Only sireg is accessed in this selector range.  The other sireg windows
can trap and must not be read.  IMSIC indirect registers at 0x70-0xff
are not handled in this change.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 961fd182..34d1bc76 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -93,6 +93,8 @@ struct hart_context {
 	unsigned long scountinhibit;
 	/** Supervisor indirect CSR selector */
 	unsigned long siselect;
+	/** AIA supervisor interrupt priority register bank */
+	unsigned long siprio[16];
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -138,6 +140,26 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
 	hart_context_get(sbi_domain_thishart_ptr(),			\
 			 current_hartindex())
 
+static void hart_aia_iprio_save(struct hart_context *ctx)
+{
+	unsigned int i;
+
+	for (i = 0; i < 16; i += __riscv_xlen / 32) {
+		csr_write(CSR_SISELECT, 0x30 + i);
+		ctx->siprio[i] = csr_read(CSR_SIREG);
+	}
+}
+
+static void hart_aia_iprio_restore(const struct hart_context *ctx)
+{
+	unsigned int i;
+
+	for (i = 0; i < 16; i += __riscv_xlen / 32) {
+		csr_write(CSR_SISELECT, 0x30 + i);
+		csr_write(CSR_SIREG, ctx->siprio[i]);
+	}
+}
+
 /**
  * Switches the HART context from the current domain to the target domain.
  * This includes changing domain assignments and reconfiguring PMP, as well
@@ -251,8 +273,14 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
 						 dom_ctx->scountinhibit);
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND))
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
 		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
+		hart_aia_iprio_save(ctx);
+		hart_aia_iprio_restore(dom_ctx);
+		csr_write(CSR_SISELECT, dom_ctx->siselect);
+	}
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
