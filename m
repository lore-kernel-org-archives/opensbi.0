Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44744606A31F
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OwvthsvL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FhbhYajV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7TLpNd3Ko2AaXZbalUHRRh3lmGbC1uZ6VPKV87pNvpA=; b=OwvthsvLzvBnLAkBj/ijs0PHoF
	OwQoGir8p47ij/hbbBXe3/4sivGu2InTQsKMECFgR//ylP3ifqNe7uo6Hxpaahz2xykB7OcTjDWck
	LOTcygrF0LcLQzYcRNWPMGxdBK5IawbfmD0gZr1wsKBu1KsMPz80ObykKtThnTlyiAKvDHNrKnvzl
	7aj4XhdC2fQahEPt/8+7WoRF6d8NkldrFQuwWhKusTGbxe+2iD2DHehBQ6CP9inbuxH8SSz6vZH6f
	kKh3SwqLDs7zvkZ/x3y/yuxRU91nSGTWDNapETVLM3vu8FDkdS0JCInPBAwFHI0Lj27HvBIyF4kgY
	XKyRuiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PK-0000000FikE-2NF3;
	Fri, 23 Oct 2026 07:09:42 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PH-0000000Fihe-35Sv
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:41 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-35ef6b49813so832763eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739379; x=1793344179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WdfelZUg/DfWbtDh+VqddwFiUWa8OmNZjt1lpob7ndw=;
        b=FhbhYajV+X/9GCZOTDB8yJcplyCP9Jpe52fh8KWbIerxkPf+WucI17CjnkYcthZ9hy
         b0/V11Z79+h0W7Eo8rDZl4+ctVdqEgeFFRq3MT3LF9wl8jtjEOY5s/8foFOZYkO3DdUn
         CHgD8/N4X+dVTMFINHc4bqmKZz87TsOX6Pn8YYiP9arPQu7RKlX8p7ZpSM3+w6+LTtIl
         Nb6ds0gU5sHUPyilN8rMRpUnroitJg8gTWn1BG7Z4DqJ3N6AAwQtkXPzRQu18uEispP2
         PYfUjTq9oFobrDNN3pGx/FMzWsqAuCVHMtq8Mh+WllbeA2SfV4keKxg9tJt4cYWCTbvr
         lCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739379; x=1793344179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WdfelZUg/DfWbtDh+VqddwFiUWa8OmNZjt1lpob7ndw=;
        b=AtS6R7JttuLC/iUOc4w9HcoV6rpwbvnrXO/bdtE3SxjhXxyF4UUsfot+ckfqVOVYZ1
         Mf0mSDuJHPjpyaR+J5ZIef9isv9Gfz9R8OqxD799NS3lCtqn1AHCbpbkjfLQ2q1P4nih
         7vUILJvI5UPZnOpYGZ0q6Jz8OUd6Bj145wy14j4qakUjn3M2qcC7MP7/bsmq7gRxVSH2
         GEDVwlOHe5h154V/AaBq/75i+cG/4f1XBkvqBHJXJ8W1+Fk4LUJNxDGNgYgiHiROTuwu
         GwkHHbRmoRWpdJAzQRg0ebwOyoWnNV+QFxHwLwlx+9qDAprig4c4/mJEb/zFCA1YGmzX
         5WYg==
X-Gm-Message-State: AFq9FYI9BbOiyQ7OBa1tUQLI9XZdx+2DMy2KbORonlEpdJ7kncg7wZqc
	5L7InlpbrJWvVMPKZwm8YCjaRPkqmjysR77GOV079XfXccPrUjkJGMwMdtLrv+kD
X-Gm-Gg: AYBFou30MG1omjnndb5g6Qvh965jnu+1vxwEbLyTGKtLfXVyGYRvuqfLo5sFLeLN2ed
	+nEbj0QKbLPhJvyzPrJQOUkDPOpY1eXlV7s07rT0EFyu5fM9YdfUdrM7vQbmd///bs8g0O6MXWY
	05a6vcABfemEQZme0texHxPYPmqz+YihBNboCGfTP+AYDxHOsmLTD1MwQE8zfl+vredhRU0LyKp
	1kf0OkyaP/NLxrVcANbtjd/MKlKf1pN0zZSTbQCxX4so3QMuYKGzBkMxXoMCreOp/I1j6V0UyPT
	LMmrApvj2EVY91zuXFT0ffNwoQVewYaEokDIp2r2Gik4OlLj34bIo833yo2onu0/dKF037/YJ+d
	Nf9e5M9kPsguHQ89EHu7jJ/G/Vpsr6jtAOm8q153+VtlptnzlUQJzmN6Iyi5A0GUyR2/hzhtCRq
	ByrrXxp/cgGt9Hbj1/K1LuJ6XSJTozI7mZhkCzgOqKDIyKOzx8o/IkQWAUSKvU9b8GwsonfOnKh
	HKK5N4hHQSh6P9l53GGrSUgQIgM3Rq8gHjM4RXwz9ZTo1PENuK5btWQ9x60HMEevd0oLfpYOokx
	j3CZG7fOGIPNjCYE7ucLeT3Lx9ah0xAav6D/7sEOooyLDcOQ2s2C3ESzlA==
X-Received: by 2002:a05:7300:d20a:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-369d98269fdmr1684600eec.37.1792739378746;
        Fri, 23 Oct 2026 00:09:38 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.38
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:38 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 7/8] lib: sbi: Preserve supervisor CTR records across domain switches
Date: Fri, 23 Oct 2026 00:09:24 -0700
Message-ID: <20261023070925.241680-8-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000939_778633_89AAEE5B 
X-CRM114-Status: GOOD (  15.88  )
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
 lib/sbi/sbi_domain_context.c | 100 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  11 ++++
 3 files changed, 113 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..171fe759 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -125,6 +125,8 @@ struct sbi_hart_features {
 	unsigned int pmp_log2gran;
 	unsigned int mhpm_mask;
 	unsigned int mhpm_bits;
+	unsigned long ctr_depth;
+	unsigned int ctr_num_entries;
 };
 
 extern unsigned long hart_features_offset;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 34d1bc76..b2918c9f 100644
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
@@ -95,6 +113,8 @@ struct hart_context {
 	unsigned long siselect;
 	/** AIA supervisor interrupt priority register bank */
 	unsigned long siprio[16];
+	/** Supervisor control transfer records */
+	struct hart_ctr_context *ctr_ctx;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -160,6 +180,63 @@ static void hart_aia_iprio_restore(const struct hart_context *ctx)
 	}
 }
 
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
@@ -281,6 +358,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 		hart_aia_iprio_restore(dom_ctx);
 		csr_write(CSR_SISELECT, dom_ctx->siselect);
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
@@ -331,6 +415,8 @@ static int hart_context_init(u32 hartindex)
 {
 	size_t vec_size;
 	struct hart_context *ctx;
+	struct sbi_hart_features *hart_features =
+		sbi_hart_features_ptr(sbi_scratch_thishart_ptr());
 	struct sbi_domain *dom;
 
 	sbi_domain_for_each(dom) {
@@ -345,6 +431,19 @@ static int hart_context_init(u32 hartindex)
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
@@ -352,6 +451,7 @@ static int hart_context_init(u32 hartindex)
 			/* Allocate the vector context pointer */
 			ctx->vec_ctx = sbi_zalloc(vec_size);
 			if (!ctx->vec_ctx) {
+				sbi_free(ctx->ctr_ctx);
 				sbi_free(ctx);
 				return SBI_ENOMEM;
 			}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..a4bbb750 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -672,6 +672,17 @@ __pmp_skip:
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
