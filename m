Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26284606A326
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xpJ9jC0w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eMZyoAT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HQD2fRbMNUjCoq6dnbPTV26jKPDZPt8wySppcUIvc3U=; b=xpJ9jC0wMIhQIVEOWhJb/TLCjo
	QvTC6NbhcX3lYHbAMzb5l4sn7mXm+t61jHVuHXkSBWp+J0CjMdn6C6GbYK0usJNZxvSvDW4U6C5H6
	BDKRRHTIiLFcQu34uVToEmtOkjxRnKosPRU7CtpRTKu6/nBdg0sV6P70RQZl4N2Y+oo6ID3XcsEQH
	VrD/YLONzmu1wrL68nqe6hw7tzlt6BHxPmTeLwBw+loHsUbma5C4zmK5qY4qRITRB3GKztMUCYVs7
	zrDGw5O4i78EZtQoB+VmI+crfps3Zb/n7wESOmNeF8dF191eDciZBz58SBhYw2u9Y205F+g5Tf19U
	ab4cAg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5T-0000000FVzo-24Ry;
	Sat, 07 Nov 2026 23:44:43 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5Q-0000000FVxa-0YmI
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:41 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso435149eec.0
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095079; x=1794699879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNmwnh/aa7fQ9HpY02Q4thtKc3JZyrTtr75ciIWQi/g=;
        b=eMZyoAT32lz6du+7DYDSF6/GcdwsVtqr1rzaD3MJ45S485JYz8M8qBthLTtyVNurAn
         EIJiHhaivdzNpn0Y5s+R3BbMIR+1/f5lSQEqhP730G+W20Pgj5uR+GMhrKpRYqhSIK4J
         i0ESP0Ha6iamd3qtZJDW1VAs55m0SDieQc96Ygvf7GEmAvNE1i31GaTZiKm1g3Gs8WtT
         GZ/6oGfwjL/vuLjXZ3Pcqr6oleAZC5bbNBUd2ohsuXEzy8IjBD7I8zjT+NWY7DAvyEk+
         eB63trdBRluXiLPIOn5gOXbSWbxF4GZUiWD2CfqRJYQHatGmkaK4kOx1Z7iXdakTuXBE
         1acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095079; x=1794699879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNmwnh/aa7fQ9HpY02Q4thtKc3JZyrTtr75ciIWQi/g=;
        b=224UP9RBgHIjYi6dKRAxACn2RiKxHDA3V73klYvhBgwufeIkqc2deeIgHt7xsAFX8q
         LS/7CiN2ZfbR5GYqs3Y/vW0ZoRRm9m09kejtb+Gp6/TLOs9Bz4Z39G8ZUw8mp8Kgds8Q
         L7otBLmKvQKHTPx7X0PwVyTxvlrqoOHo8INDzvGFVNuW/33KH0JQE0so28J0yQguXFRV
         atkhEcY39XEZaQ/S0R0ysspqmt4ZeumHheQDkg9217Vr62HBW97Pg0SKhXa+ojITF2SR
         tSCuwXhE6yetoc2oZXqQQnRQIoWeCvuuM2sRbo7lndWVKibntvmKOoBk6uSZ99CjrQPe
         0RrQ==
X-Gm-Message-State: APuU4Z8O58UuawQtwM9RX/avN7bHv+muHDRs1VCHHcN3C79RHwG5a7iE
	2mKOOWdm8k2NcC9I30po99GsqAF8RMjE3xeAtPStSjivG44bYaXSAwjShq6NRFnU
X-Gm-Gg: AYBFou27M8PMKjZDhzjxYiUR5uDGWl2o/3waxDNAbnyQYbsePOCe9fFhk7O21V2pfq+
	Qiuv955M7qmMYmFa5kgKilxIvaAxsoXVH/CIyDTDnjvuTbtP/j7WoejFyCIxQ2YS5+bI7GgSUnI
	2LOBxU/9jmaLcV3lvXpTmC9eOI8/eXtegi/LqE3Ifjy0IPdhWYZvnIXlVFZQOihOTyq6qOvxPhb
	9T1/YTfUQoZKS5NCgNAMQ+lD950/ENopfvnpTcBTZgtQEDkod7cXXU7lC+rjo8uOKxyPzZSKsIa
	tkdijfTBbS3DP2H5bEyt77aeEH0RREqBY24SpgTcwGI7SFncwBeNtiqpANXQONF/F/w4AFfIrey
	5H8xcAhEX1obE9rPhKUM0MYm3W59I3sVdYhHqKIFF9D/4Rpg0gVSQZ6bzfmOb9OgTdCpgm+QOfm
	cpR/E68YE4a3JauNeXDKgRudRr4c4YEFOnF2Gb6SBJe5gOJA1fyqBZ86gJgX9cElO4OpbAAGlrU
	kOuh+tqAnzKZb4tVPxQHcuXwqzezSaqXsj11JsJuQGGMXTcSZG21ZlKBPFHPVOBtwzpTsoyDA8W
	Lyp7LZhd+c7XTekEx9FUFt2JYj6hAf4gLGqsS4apC1SOT0ir576yms0nJQuMDiMNd5AHHxJ9Csy
	wKVkqOqdlQY0oWjek5Pn/FswoG/sa/IE=
X-Received: by 2002:a05:7022:290:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b39ff2debdmr59041c88.46.1794095079047;
        Sat, 07 Nov 2026 15:44:39 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:38 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 4/5] lib: sbi: Preserve supervisor CTR records across domain switches
Date: Sat,  7 Nov 2026 16:44:20 -0700
Message-ID: <20261107234421.137100-5-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
References: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154440_182862_7ECAFF04 
X-CRM114-Status: GOOD (  17.68  )
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

Save supervisor CTR control, depth, status, and logical record
entries when Ssctr and Sscsrind are available. This experimental
implementation freezes recording before saving and restores
status before logical records.

IMSIC and other indirect CSR state remain outside this change.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 include/sbi/sbi_hart.h       |   2 +
 lib/sbi/sbi_domain_context.c | 147 ++++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hart.c           |  11 +++
 3 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a020cf03..6f2ef04b 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -127,6 +127,8 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	unsigned long ctr_depth;
+	unsigned int ctr_num_entries;
 	unsigned long expected_trap;
 };
 
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index b5989516..ac67d60c 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -22,6 +22,24 @@
 #include <sbi/sbi_vector.h>
 #include <sbi/sbi_fp.h>
 
+#define HART_CTR_FIRST_SELECTOR 0x200
+#define HART_CTR_FROZEN (1UL << 31)
+
+struct hart_ctr_entry {
+	unsigned long source;
+	unsigned long target;
+	unsigned long data;
+};
+
+struct hart_ctr_context {
+	unsigned long ctl;
+	unsigned long depth;
+	unsigned long status;
+	unsigned long vsctl;
+	unsigned int num_entries;
+	struct hart_ctr_entry entries[];
+};
+
 struct hart_context_hext {
 	unsigned long hstatus;
 	unsigned long hedeleg;
@@ -142,6 +160,92 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
 	hart_context_get(sbi_domain_thishart_ptr(),			\
 			 current_hartindex())
 
+#if __riscv_xlen == 64
+static unsigned int hart_ctr_entry_count(unsigned long depth)
+{
+	unsigned int encoding = depth & 7;
+
+	if (encoding > 4)
+		return 0;
+	return 16U << encoding;
+}
+
+static int hart_ctr_ensure_capacity(struct hart_context *ctx)
+{
+	struct hart_ctr_context *old_ctx = ctx->ctr_ctx;
+	struct hart_ctr_context *new_ctx;
+	unsigned int count;
+
+	count = hart_ctr_entry_count(csr_read(CSR_SCTRDEPTH));
+	if (!count)
+		return SBI_EINVAL;
+
+	if (count <= old_ctx->num_entries)
+		return 0;
+
+	new_ctx = sbi_zalloc(sizeof(*new_ctx) +
+			     count * sizeof(*new_ctx->entries));
+	if (!new_ctx)
+		return SBI_ENOMEM;
+
+	/*
+	 * The outgoing CTR state remains in hardware until the switch.
+	 */
+	new_ctx->num_entries = count;
+
+	ctx->ctr_ctx = new_ctx;
+	sbi_free(old_ctx);
+
+	return 0;
+}
+
+static void hart_ctr_save(struct hart_ctr_context *ctx)
+{
+	unsigned int i, count;
+
+	ctx->status = csr_read_set(CSR_SCTRSTATUS, HART_CTR_FROZEN);
+	ctx->ctl = csr_read(CSR_SCTRCTL);
+	ctx->depth = csr_read(CSR_SCTRDEPTH);
+	if (misa_extension('H'))
+		ctx->vsctl = csr_read(CSR_VSCTRCTL);
+
+	count = hart_ctr_entry_count(ctx->depth);
+	if (count > ctx->num_entries)
+		count = ctx->num_entries;
+	for (i = 0; i < count; i++) {
+		csr_write(CSR_SISELECT, HART_CTR_FIRST_SELECTOR + i);
+		ctx->entries[i].source = csr_read(CSR_SIREG);
+		ctx->entries[i].target = csr_read(CSR_SIREG2);
+		ctx->entries[i].data = csr_read(CSR_SIREG3);
+	}
+}
+
+static void hart_ctr_restore(const struct hart_ctr_context *ctx)
+{
+	unsigned int i, count;
+
+	csr_write(CSR_SCTRCTL, 0);
+	csr_write(CSR_SCTRDEPTH, ctx->depth);
+	__asm__ __volatile__(".4byte 0x10400073" ::: "memory");
+	csr_write(CSR_SCTRSTATUS, ctx->status | HART_CTR_FROZEN);
+
+	count = hart_ctr_entry_count(ctx->depth);
+	if (count > ctx->num_entries)
+		count = ctx->num_entries;
+	for (i = 0; i < count; i++) {
+		csr_write(CSR_SISELECT, HART_CTR_FIRST_SELECTOR + i);
+		csr_write(CSR_SIREG2, ctx->entries[i].target);
+		csr_write(CSR_SIREG3, ctx->entries[i].data);
+		csr_write(CSR_SIREG, ctx->entries[i].source);
+	}
+
+	if (misa_extension('H'))
+		csr_write(CSR_VSCTRCTL, ctx->vsctl);
+	csr_write(CSR_SCTRCTL, ctx->ctl);
+	csr_write(CSR_SCTRSTATUS, ctx->status);
+}
+#endif
+
 /**
  * Switches the HART context from the current domain to the target domain.
  * This includes changing domain assignments and reconfiguring PMP, as well
@@ -293,7 +397,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCCFG) &&
 	    (csr_read64(CSR_MENVCFG) & ENVCFG_CDE))
 		ctx->scountinhibit = csr_swap(CSR_SCOUNTINHIBIT,
-					     dom_ctx->scountinhibit);
+						 dom_ctx->scountinhibit);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND) ||
 	    has_smaia) {
 		ctx->siselect = csr_swap(CSR_SISELECT, dom_ctx->siselect);
@@ -301,6 +405,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 			ctx->hext.vsiselect = csr_swap(CSR_VSISELECT,
 						      dom_ctx->hext.vsiselect);
 	}
+#if __riscv_xlen == 64
+	if (ctx->ctr_ctx && dom_ctx->ctr_ctx) {
+		hart_ctr_save(ctx->ctr_ctx);
+		hart_ctr_restore(dom_ctx->ctr_ctx);
+		csr_write(CSR_SISELECT, dom_ctx->siselect);
+	}
+#endif
 
 	/* Eager context switch for float */
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
@@ -351,6 +462,10 @@ static int hart_context_init(u32 hartindex)
 {
 	size_t vec_size;
 	struct hart_context *ctx;
+#if __riscv_xlen == 64
+	struct sbi_hart_features *hart_features =
+		sbi_hart_features_ptr(sbi_scratch_thishart_ptr());
+#endif
 	struct sbi_domain *dom;
 
 	sbi_domain_for_each(dom) {
@@ -362,6 +477,19 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+#if __riscv_xlen == 64
+		if (hart_features->ctr_num_entries) {
+			ctx->ctr_ctx = sbi_zalloc(sizeof(*ctx->ctr_ctx) +
+				hart_features->ctr_num_entries * sizeof(struct hart_ctr_entry));
+			if (!ctx->ctr_ctx) {
+				sbi_free(ctx);
+				return SBI_ENOMEM;
+			}
+			ctx->ctr_ctx->depth = hart_features->ctr_depth;
+			ctx->ctr_ctx->num_entries = hart_features->ctr_num_entries;
+		}
+#endif
+
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_V)) {
 			vec_size = sbi_vector_context_size();
@@ -369,6 +497,7 @@ static int hart_context_init(u32 hartindex)
 			/* Allocate the vector context pointer */
 			ctx->vec_ctx = sbi_zalloc(vec_size);
 			if (!ctx->vec_ctx) {
+				sbi_free(ctx->ctr_ctx);
 				sbi_free(ctx);
 				return SBI_ENOMEM;
 			}
@@ -417,6 +546,14 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
 	if (!dom_ctx)
 		return SBI_EINVAL;
 
+#if __riscv_xlen == 64
+	if (ctx->ctr_ctx && dom_ctx->ctr_ctx) {
+		rc = hart_ctr_ensure_capacity(ctx);
+		if (rc)
+			return rc;
+	}
+#endif
+
 	/* Update target context's previous context to indicate the caller */
 	dom_ctx->prev_ctx = ctx;
 
@@ -446,6 +583,14 @@ int sbi_domain_context_exit(void)
 			return SBI_EINVAL;
 	}
 
+#if __riscv_xlen == 64
+	if (ctx->ctr_ctx) {
+		rc = hart_ctr_ensure_capacity(ctx);
+		if (rc)
+			return rc;
+	}
+#endif
+
 	dom_ctx = ctx->prev_ctx;
 	ctx->prev_ctx = NULL;
 
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d1f5500d..2a43fcdf 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -696,6 +696,17 @@ __pmp_skip:
 		__sbi_hart_update_extension(hfeatures,
 					SBI_HART_EXT_ZIHPM, true);
 
+#if __riscv_xlen == 64
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR) &&
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCSRIND)) {
+		val = csr_read_allowed(CSR_SCTRDEPTH, &trap);
+		if (!trap.cause && (val & 7) <= 4) {
+			hfeatures->ctr_depth = val;
+			hfeatures->ctr_num_entries = 16U << (val & 7);
+		}
+	}
+#endif
+
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
