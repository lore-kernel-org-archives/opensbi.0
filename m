Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FDF606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V85G9a6g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XHgH7zIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=biMAoyYobuJ9XiytTx3DfzIP+C0BoicBCwlS4ZPpKm0=; b=V85G9a6gGxgFaZ0d6DsI9gqdl/
	hUSz2ZdkLV3BR9T120Gugbc7P3Zzaun4XGcnZpaLTpGwgeoFoAH6Rx9jf1uq8BN4jLlK63XRdDo1A
	QcGOXYg1Sl39iLEaP4xeuJ6Rblw67zmmDLVvJGCXwBgU7mVrIAKlp9SB2zI2XL/YCSYWtJf+NptHj
	2EIxrYBafQCoJgyHrYWa+ogQ53D+OsaKgcWsJ4Kd3fUhYuwVuoNtNw8d1cT84pLBT+38C1cfkrpAK
	qWMULPBsY7hdr9jRKMlyozCws40l4GKoEijf4/XPy4dq5WpR0SWODwSKjIQSe2w6K72oWeaC2EtkH
	cjoJ+5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67K-0000000FQsZ-48LA;
	Fri, 23 Oct 2026 03:38:54 +0000
Received: from mail-dy1-f172.google.com ([74.125.82.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67I-0000000FQrj-1Jnz
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:38:53 +0000
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f1f76ea84so692726eec.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 20:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792726731; x=1793331531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYS8Xb/ZCfhu0RBnahsWSH12mdjE1gTsK3lAa4S1wrc=;
        b=XHgH7zIeWTBN6Ty4fh3c3J/Yfa6yx+cJlwNQf6VKa/naluBE0J7/HUdOBhDssVYKG9
         +M67nSCOstLUaEf7gtUIDoZAC0Ltqsq2OwI2C9QkxbBarhSuAPFrceH6x1MT/KiTptTs
         x9p5CLSY1jSLHK6UkWT8gyDZtk/Gi50VvrmmZaS10cMb0i5T+nttco1bfOo7sD2WotHl
         wtnzJiwKEm2S6/Jy/cFOZGdu4xlxeRegaQcDqUJfxO0RdmJ9pZ0gxI68kCkPLq0qLWdB
         oyZVvTMKiNRsoglM4vg+xBpQnAxklgdIMHlpSqPKx8oRSM/e06oWQpjzdeRB/9hcmI4W
         vA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792726731; x=1793331531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYS8Xb/ZCfhu0RBnahsWSH12mdjE1gTsK3lAa4S1wrc=;
        b=1VEQNUbaAQaUILgzQBzLHHLEBNLg+c3JvcV/BvGiiqJmlfAqfqIt/1JG04fSZOX6gI
         3NVkFb5rAzYLizNwHUHcEg3g24jyhrWI6DqYb9ky+b2IpQM3zJfkd7mCZKU2iRoiimKZ
         +ypSu+LYCA4VeeIVNDVG2fBK30vdTh3ZWvODwWGEmlknX1OAKFWh+ey5/mxLgGD+i14r
         C79kz+jZ6mMABvSOfCH1a4LCmhnShET4N/aSqAJ+SK9WAsNGgwF1I3I8ISdeSir+4V5z
         tgonHzXD6LDSOmuqtxiENQNiqwN8ChwJnlvGuvL8DzoPWUCWtZjeTZ0GC0VxFrQrmYrn
         Xntg==
X-Gm-Message-State: AFq9FYLjfhq7yUkGn2ZkJsAfpZCJ7dr9CjTgPspVDdYstVUfPqCuMWKJ
	VQWA428g1BP1vt8cXXNMTiv/dIix8vjNbGnKavMSi+mj/YLInPvr7GnZ8vO97O6s
X-Gm-Gg: AYBFou0Hau+Y5FvTZJ22UFBs2hF3tsvO3yoR2FZ/9jNAtUGlBVSGbsJfMstkl5DUyCV
	BM1xfuSjuDNfY4l1RVCndOMEWyVgOeDtS8CwFM286p/LSw0z8DrUPOmeH/SC/fXZfJBnchbjZHH
	LvQ3Bh/VjEJjD58m8ReptWFyj4w4n1zK1tlIk0eDRAkC92xYGCnbPzaQpwlEDXuWYhpnTv8BQ77
	9baQxARSjqgTaAkek7thli2fBALaAfIQWzNfDMfYgwZYFqeGy9zoA1PUEMGaQgOcpahGICSEc1c
	rKDGjelCORqYQ9fC5t1hcKfgNCNicqwZMDgo+pwfb9DgMeAg8IRz38YuRvrsW+rs+GP7Ie//H3C
	nURPp78PhXj3PZwgvPksT/O9kGxFjmGHTs/Y1gTvLM3XgX0u5k0mCQuy9kvbx6GVCq2J3C8PQO1
	pJOFtMwTW3jHy0KVnkqKHAH7vcIcRk/T+d51wYqUp/Y23KVW0BwdHio8K9fhJctZn6bsmbcQs4z
	o8K/ereCjrbaKL+ck8kKHoE1+7LjpX7At5bD9N5Gb5GPl3x6Hze4O1YiDXMD00CgGU9hYpBlzQw
	+X5W8Qzot5uNTWqBBgRddseIPN1Bpx239GG75r/ThpBYgp0NsyiEce62eA==
X-Received: by 2002:a05:7300:ec8f:b0:35f:5591:e40c with SMTP id 5a478bee46e88-369d97c6463mr1401190eec.22.1792726731271;
        Thu, 22 Oct 2026 20:38:51 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm2746414eec.3.2026.10.22.20.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:38:50 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 2/2] lib: sbi: Preserve supervisor CTR records across domain switches
Date: Thu, 22 Oct 2026 20:38:45 -0700
Message-ID: <20261023033845.89152-3-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_203852_363329_FAC9CA38 
X-CRM114-Status: GOOD (  15.05  )
X-Spam-Score: -1.8 (-)
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

Save supervisor CTR control, depth, status, and logical record
entries when Ssctr and Sscsrind are available. This experimental
implementation freezes recording before saving and restores
status before logical records.

IMSIC and other indirect CSR state remain outside this change.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 95 ++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 14927ff5..af180409 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -21,6 +21,24 @@
 #include <sbi/sbi_vector.h>
 #include <sbi/sbi_fp.h>
 
+#define HART_CTR_MAX_ENTRIES 256
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
+	struct hart_ctr_entry entries[HART_CTR_MAX_ENTRIES];
+};
+
 /** Context representation for a hart within a domain */
 struct hart_context {
 	/** Trap-related states such as GPRs, mepc, and mstatus */
@@ -77,6 +95,8 @@ struct hart_context {
 	unsigned long siselect;
 	/** AIA supervisor interrupt priority register bank */
 	unsigned long siprio[16];
+	/** Supervisor control transfer records */
+	struct hart_ctr_context *ctr_ctx;
 
 	/** Float context state */
 	struct sbi_fp_context fp_ctx;
@@ -142,6 +162,59 @@ static void hart_aia_iprio_restore(const struct hart_context *ctx)
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
@@ -239,6 +312,13 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
@@ -302,6 +382,20 @@ static int hart_context_init(u32 hartindex)
 
 		ctx->stimecmp = ~0ULL;
 
+#if __riscv_xlen == 64
+		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_SSCTR) &&
+		    sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_SSCSRIND)) {
+			ctx->ctr_ctx = sbi_zalloc(sizeof(*ctx->ctr_ctx));
+			if (!ctx->ctr_ctx) {
+				sbi_free(ctx);
+				return SBI_ENOMEM;
+			}
+			ctx->ctr_ctx->depth = csr_read(CSR_SCTRDEPTH);
+		}
+#endif
+
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_V)) {
 			vec_size = sbi_vector_context_size();
@@ -309,6 +403,7 @@ static int hart_context_init(u32 hartindex)
 			/* Allocate the vector context pointer */
 			ctx->vec_ctx = sbi_zalloc(vec_size);
 			if (!ctx->vec_ctx) {
+				sbi_free(ctx->ctr_ctx);
 				sbi_free(ctx);
 				return SBI_ENOMEM;
 			}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
