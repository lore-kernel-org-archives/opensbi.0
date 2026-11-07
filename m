Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC58606A330
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMeL4GQO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nqy0I+oN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sj65+xRrV2o7S58jyqZzWtxf9qON0V3012qY0wacLck=; b=dMeL4GQOiWllVNvxgDu6qU4LGt
	SpkL7lrT6wZuZ0kwGwu4uzLuSfzKIV6hdKVEPRRkMtLdf4PxtIafwD3kAUSibtarxATT0YcODZuqT
	KB/eVil7Zf28QBZpmFsV2Ep4WfWwHzLpRg5T6IjR1FdDAg46RXT+bb+XV5ZfDrumY2k5VP5DwXtpa
	lZeMuXhuDehIB8F1rKRIISQKaoKLu1T829m1t0LLYq36h6Zr7E00cm9/uPjhFZb7c4YxvY5ePWQ3C
	YWou68lsa1fjHgfVgiTxtS2LJe8D0hKrY6PRAkzLQQucn7kVI+KSZFlGav2f6lgC/kMg7kEdqL4KL
	D/AhWgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5N-0000000FVw6-0RLz;
	Sat, 07 Nov 2026 23:44:37 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5K-0000000FVvE-3G0F
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:36 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-14394530ec6so67531c88.1
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095074; x=1794699874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SAtu8JtfWno1znmNeNGCcEx1r0zeajewP5Zk7TlHfM=;
        b=nqy0I+oN6VJfoc2kCtbSx5NroYSbmn903ADsz3Pdc5G9R+jS0owqstoUsovTpShHw3
         smuBQSuiuNeQEb0KSsjfLp2raa0MN8W16eigzttNg8/rKLQZWuqn+0pPhRl2CXZWkwWu
         MW06l1xibCYTKEpaHvnciy4IqfHX1Gw3Q9PiI8Dx8iQN1p6Ke/nkR1Roc/C69M2yhfRD
         FW6Hns5xiy5RB8GDDeIgP5g4Z9dJsGlWZ/fyI5AJMximETI9c2FNzUc8Ac1S6Tm4YDQm
         MTYZGDpgr4/zwc7Xrcxj1iNIKdWf4ZQizEgBMbGj80XZIw6AfrbiQeyBBHUMCLGQc3mm
         N5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095074; x=1794699874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SAtu8JtfWno1znmNeNGCcEx1r0zeajewP5Zk7TlHfM=;
        b=vLTWmIOuc1rAC6orDel3L+fYuHxmcBIO3JoH+6UHJ6gAj0VhsG54IpMldSAAeEikfG
         w7Dt7QEpeUK+aZ/tznBXUWMB4jUq8nhukh+A8tJN6I8daXVtw8SUwDAbFY1gPB/MYHod
         IGKBccYj3YYNUSf/bcOge5DdxSF3djjBwfdgJMCQ9HOoagRm+GU6LozV4iv5lQyUZNed
         1Vy0kWTsTRiuXx5JNA0YYQURjppUp8j1ukPZv4iD1yye0cMFpfhVw9HnjG09BhsGCnBu
         6N+phlzgVdwcK5AJAyWnVXdYePLmZWBLwRRXrkWAeysI3e4aNaxJeVe0LdNH5xPeJLfh
         SAkg==
X-Gm-Message-State: APuU4Z+wZeAfAzI1+vnzig/Yzw6o0EZhNRf1n86RTaSNXmhVrO6cpr0z
	yl+flPLz7OfqNjhJ6gLytJygi8JmXD4n2QvCLK89uqlYAytkc+DxqiHIMmFbrYyR
X-Gm-Gg: AYBFou00XOGf7i4RwQLisuWa71byYMIrlYQ8N3gLhRti3+2IFnpB/rUpVYSViokhNrQ
	u9UcP1Z1ZOw5LhoZC/AyCVc9iClU5ip0VLFlxtk+GNJEr31I/mYBq7AAvWbefsmSysk9bZe1Unw
	F+We1xor+wBTZS+ONO2dSq9SkS6/QPW2DTYfIjz+0jcBGsT9hPoRmwxnOkQHoU/LmxzlBmfPM+h
	QqOiUV8hcOA4sovB8P7wBFIp81fR8sTEJ4Nf3EAIjNXfHsTTQrH39MJwUgtzSa1WkpXbukvsckQ
	Hu3g6U/bdgtKQ26gdydUD3YPQ38wIEe4blMmxUSEflzeCnn8j9bvQwD0MzftG2Lf5dBTut/xHpV
	6uKOuUKDAnhE901726iK9w4hl+LihH1M5PT83OIUBeFLSt8Bb9Yxy6B5QBTG572F/64u6zzQNEg
	kIutwVqrZmGtEr0addk0VgFRinyi1OjfMXJj4zSdH6pddistECrO1ZeVeuE+YcDmlgUV4YEyuk5
	cdaWmy7y1lMkZnamUJiD8r9hel+Y/gJbnEkxLfaDhTSgSfmP/SopipL4sxGu9iIHuM7rXTrrhHd
	JfAu907ToB8HgXw1MdPIoaIhv3lGBzqaWQ5W+JRPXJ2W5V216XsKHhjcIZr1s0SMJgRGcd4UA7B
	CK23PMEb8L7chl/6lLChchH3gL/Yr+C0kE847Y3nlQwOzLPo7M2AYOw==
X-Received: by 2002:a05:7022:1586:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b39fed11a6mr82983c88.17.1794095073429;
        Sat, 07 Nov 2026 15:44:33 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:32 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 1/5] lib: sbi: Preserve hypervisor and VS state across domain switches
Date: Sat,  7 Nov 2026 16:44:17 -0700
Message-ID: <20261107234421.137100-2-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
References: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154434_830771_5B34B612 
X-CRM114-Status: GOOD (  12.87  )
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

Save outgoing VS state before modifying S/H interrupt configuration, then restore incoming VS state after the H state exchange.

Preserve core H-extension CSRs, optional Smaia hypervisor interrupt state, and Smstateen state-enable registers.

Include hvien, hvictl, hviprio1, hviprio2, and the RV32 VS interrupt high-half CSRs.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 139 ++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..7500c391 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -18,9 +18,46 @@
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_timer.h>
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
@@ -44,6 +81,8 @@ struct hart_context {
 	unsigned long sip;
 	/** Supervisor address translation and protection register */
 	unsigned long satp;
+
+	struct hart_context_hext hext;
 	/** Counter-enable register */
 	unsigned long scounteren;
 	/** Supervisor environment configuration register */
@@ -114,6 +153,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	bool has_smaia = sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
 		return SBI_EINVAL;
@@ -131,6 +171,25 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
+		if (has_smaia) {
+			ctx->hext.vsieh = csr_read(CSR_VSIEH);
+			ctx->hext.vsiph = csr_read(CSR_VSIPH);
+		}
+#endif
+	}
+
 	/* Save current CSR context and restore target domain's CSR context */
 	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
 	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
@@ -141,10 +200,86 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
+	/* Save SENVCFG before changing HENVCFG. */
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		ctx->senvcfg = csr_read(CSR_SENVCFG);
+
+	if (misa_extension('H')) {
+		ctx->hext.hstatus = csr_swap(CSR_HSTATUS, dom_ctx->hext.hstatus);
+		ctx->hext.hedeleg = csr_swap(CSR_HEDELEG, dom_ctx->hext.hedeleg);
+		ctx->hext.hideleg = csr_swap(CSR_HIDELEG, dom_ctx->hext.hideleg);
+		ctx->hext.hie = csr_swap(CSR_HIE, dom_ctx->hext.hie);
+		ctx->hext.hgeie = csr_swap(CSR_HGEIE, dom_ctx->hext.hgeie);
+		if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+			ctx->hext.henvcfg = csr_swap64(CSR_HENVCFG,
+						      dom_ctx->hext.henvcfg);
+		ctx->hext.htval = csr_swap(CSR_HTVAL, dom_ctx->hext.htval);
+		ctx->hext.htinst = csr_swap(CSR_HTINST, dom_ctx->hext.htinst);
+		ctx->hext.hvip = csr_swap(CSR_HVIP, dom_ctx->hext.hvip);
+		ctx->hext.hgatp = csr_swap(CSR_HGATP, dom_ctx->hext.hgatp);
+		ctx->hext.hcounteren = csr_swap(CSR_HCOUNTEREN, dom_ctx->hext.hcounteren);
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR)) {
+			ctx->hext.htimedelta = csr_swap64(CSR_HTIMEDELTA,
+							 dom_ctx->hext.htimedelta);
+		} else {
+			u64 old_delta = sbi_timer_get_delta();
+
+			sbi_timer_set_delta(dom_ctx->hext.htimedelta);
+#if __riscv_xlen == 32
+			sbi_timer_set_delta_upper(dom_ctx->hext.htimedelta >> 32);
+#endif
+			ctx->hext.htimedelta = old_delta;
+		}
+		if (has_smaia) {
+#if __riscv_xlen == 32
+			ctx->hext.hidelegh = csr_swap(CSR_HIDELEGH,
+						     dom_ctx->hext.hidelegh);
+			ctx->hext.hviph = csr_swap(CSR_HVIPH,
+						  dom_ctx->hext.hviph);
+#endif
+			ctx->hext.hvien = csr_swap64(CSR_HVIEN,
+						    dom_ctx->hext.hvien);
+			ctx->hext.hvictl = csr_swap(CSR_HVICTL,
+						   dom_ctx->hext.hvictl);
+			ctx->hext.hviprio1 = csr_swap64(CSR_HVIPRIO1,
+						       dom_ctx->hext.hviprio1);
+			ctx->hext.hviprio2 = csr_swap64(CSR_HVIPRIO2,
+						       dom_ctx->hext.hviprio2);
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
+		if (has_smaia) {
+			csr_write(CSR_VSIEH, dom_ctx->hext.vsieh);
+			csr_write(CSR_VSIPH, dom_ctx->hext.vsiph);
+		}
+#endif
+	}
+	/* Restore SENVCFG after the incoming HENVCFG is active. */
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		csr_write(CSR_SENVCFG, dom_ctx->senvcfg);
+
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
-	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
-		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
