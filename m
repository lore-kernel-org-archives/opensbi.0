Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD9606A329
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WHO2E6Ox;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqcXWZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MhgtKBCmdro4NNumzjODD5tScmy8/hF7gLAlKmOzFzY=; b=WHO2E6OxkEPVlh1PXj719NXije
	mrtL0QOcl4Da5cI6RdE2QpjLndIxi1aXu1tHGkACwK6wRf/pUjxH5GU36udrg6Wtj+sYHmxhV/ilR
	th602VYvy9FP98dCKJ2xgy105krouzcMSWTyx+L/mAeqnVJvNFqocYwWP+Sd2bk6I3z3vqDj78rAU
	JAii8r2idZPVa3M8Ea+F8lNbL5dQBH0aWYyfc/hPy2niWsiscg1L14GlhaKpCvAnoUdxuGwjg1U9q
	VeLgWobhwToeqz0SYOqJF/5CIUWb3lrm6vK5hhS1We1sjWLSAbsG1x8jv+rIzUg0gW8JoSKKrtb6x
	RBqjgoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKR-00000007o4u-1fTR;
	Thu, 05 Nov 2026 04:43:59 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpKL-00000007o0C-1GV7
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 04:43:54 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1b244fb7fffso2011820c88.1
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 20:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793853832; x=1794458632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFEptSXHZDOJjTYEwk4ipeRbAH8B+ZD6dH4Yt92qggs=;
        b=hnqcXWZCOr3HZOr5Q/clDdkR9eWnJLR8mY9vbdGrNjC8AxDTGcOLW7UB1IpFaTiYKm
         IBiZsRRYs6eOr+K1NqFopdzqbfrwC+FcLFeptkQgfMC6nq9yCIRD6yfCDb7lvJASlxBC
         ocI3Sq4f6vRP7E1+yDZQDRiMfW9bCSZUG/3r8qRNfFilhc/zy/O0g4qnIs1CwrMd8PDk
         xCi5d3yTFMYEry68gkfqJddoWT50Zn7ev6n0TU9nQETvD05+EFLQ7vCcwFKVrzoDLK6I
         dbznrevy54UEpgo7BWUS1ospzpHGmBGa55qQ5+ndDvqnNTpeUGSImwmTDPorJmUW4j3a
         N7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853832; x=1794458632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFEptSXHZDOJjTYEwk4ipeRbAH8B+ZD6dH4Yt92qggs=;
        b=ha9loZ1A9ff2UFc4mCKvGSSpByysGUx13rlCj38zPGzr9XXaBUJ0OJwHK+sU9Lp+b9
         Khyl8cuz0o2o7ZzWbixC7rbjgPoX00adtcQHgEAj1JVYBnu5ighxO3pSpy1E9KvEbxgB
         zFoYZwSYXG6Q9SwFGdiG9KpKIIE1tbMlkriQQ4K3sEf3qBnxvFPaBsiToR1XeEAIqDOX
         N/gDiAeHZ9KDb2gkStDDiN2Hhjcp9eXXopCpjwpzLwhQFmirtrRXc2CVmMYEHxGUahs8
         hOZH80Dn4wB9ovjoaJOLdLy9C24xMWbCDajD8kGCRUKXoo6lu8o0aNL862uIsiEPDera
         Duxw==
X-Gm-Message-State: APuU4Z/2UCNOfRhRkRNvQS/5AOd/iRRmYr1Er/xkns7d0pQr7a8hbNqI
	ZOrFJnX1stsKiEg64dH1xJ76Z28Yj834HzL6bznjSXTOXAbrx2jip3mzuijRc6hv
X-Gm-Gg: AYBFou2YzqTr1YpVQNaO3qZfB62PWUxny4svamz11A3aTYonv523CNMldRfCq+23eMJ
	DPK+ZBNjooUxb31pgMD1G+0JH2EpWKJl6n5tY4YeqZZIkx3H3RNFGEyVdqDkhmw08hHGonuK8S5
	4OruHLsItLtYURbEZ8MmxRfZtEqplOt8Yli6VkBXjt4yUtHa51xtWicZpNjb4i+wQ8B86WNlmBZ
	rIE/pSzqSimMmdDnAarWm2RqDav/UaU/km2nvr6X9VcwTmiilArewFVRqyHkiFMF0yStrW9lkt3
	E1M5C11HqAoWZ0+AicTifLKt9nuoFEKQUTPN6LDn3hreNoh4ZP//mjI8Kjtbz2Maq/IhqXm6r3J
	jAJ62Iia+mP8Jows9M5whiht8llN87hW/JX36/650UwEkGzRPGfppqK9P6BcpyzMsV+76sQcH61
	GlJ4jcT7HDBRLtrXACoQnt6actkvEkGEJlsOiV9bIq4G2j2eQ+oI54nChAEUkANpLHOZgNLw24t
	rDEbhvjfBJGfxOX4yfZ2jDmalvKNlLnq4UYm86eyEhID7rNCTDhP4qhHEce+DokUpwM/JxER0Ri
	oYaSpF/dljum8pNseQEF4szhguFjx+rx7Gf0pdzgvEWw/gKAEGAJLrPlOlY/3lCDho1xaEmwRR0
	PxpzJmnTrKEnSyURhjOiA62MhhGHmLfEIIhXiUV1OgKFPBKHDBgTI
X-Received: by 2002:a05:7022:ed09:b0:159:aa67:28c1 with SMTP id a92af1059eb24-1ac5c92da58mr26072866c88.20.1793853832053;
        Wed, 04 Nov 2026 20:43:52 -0800 (PST)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm11547657eec.9.2026.11.04.20.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:43:51 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	rkrcmar@qti.qualcomm.com
Subject: [RFC PATCH v3 5/6] lib: sbi: Preserve supervisor CTR records across domain switches
Date: Wed,  4 Nov 2026 21:43:38 -0700
Message-ID: <20261105044339.435711-6-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_204353_351034_03C3C93D 
X-CRM114-Status: GOOD (  16.97  )
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
 lib/sbi/sbi_domain_context.c | 147 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  11 +++
 3 files changed, 160 insertions(+)

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
index fe7d98af..045988df 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -21,6 +21,24 @@
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
@@ -100,6 +118,8 @@ struct hart_context {
 	unsigned long siselect;
 	/** Virtual supervisor indirect CSR selector */
 	unsigned long vsiselect;
+	/** Supervisor control transfer records */
+	struct hart_ctr_context *ctr_ctx;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -145,6 +165,92 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
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
@@ -288,6 +394,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 			ctx->vsiselect = csr_swap(CSR_VSISELECT,
 						 dom_ctx->vsiselect);
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
@@ -338,6 +451,10 @@ static int hart_context_init(u32 hartindex)
 {
 	size_t vec_size;
 	struct hart_context *ctx;
+#if __riscv_xlen == 64
+	struct sbi_hart_features *hart_features =
+		sbi_hart_features_ptr(sbi_scratch_thishart_ptr());
+#endif
 	struct sbi_domain *dom;
 
 	sbi_domain_for_each(dom) {
@@ -352,6 +469,19 @@ static int hart_context_init(u32 hartindex)
 		ctx->sstc.stimecmp = ~0ULL;
 		ctx->sstc.vstimecmp = ~0ULL;
 
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
@@ -359,6 +489,7 @@ static int hart_context_init(u32 hartindex)
 			/* Allocate the vector context pointer */
 			ctx->vec_ctx = sbi_zalloc(vec_size);
 			if (!ctx->vec_ctx) {
+				sbi_free(ctx->ctr_ctx);
 				sbi_free(ctx);
 				return SBI_ENOMEM;
 			}
@@ -407,6 +538,14 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
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
 
@@ -436,6 +575,14 @@ int sbi_domain_context_exit(void)
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
