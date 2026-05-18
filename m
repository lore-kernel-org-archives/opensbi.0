Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63D3CD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NBhdhVKQnsUDc6Um989kELOQENRPr9dGh7w1FfSfKg=; b=gmLIqlSSNe39Tn
	oXopfygb26LDCYWX8PD7byMRuRhMdmCqJFnv6pjcdpc4i1Wj/I+u94qrfD+WmG//t7czl+DzKkq4c
	gbvoCS2hUF9EcPzkXk7bJUlIwLRHDZM3q3Hvsu5+D/d+kJxEbU3v4EcBfK35A1xK4qC3FjF0nz5/+
	Hn+QhXEAs6cpBAoQDiG9sSONtpvXckLPrU1CjYYlAiIV+wDL872ojWNXncFw4xCeY4TOJZBJ+icyQ
	cnpUzmyuRUKEaZC+dY/78KbbutgJnGYL6rNXax0z7np7ayvIxrWQ/9C7trvd7QSoYVho1EpD8m62C
	iziqn0i63U2VXRihajCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkR-0000000ELGq-1LeS;
	Mon, 18 May 2026 05:42:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkP-0000000ELFx-0iZ2
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 05:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Kv/gvJ7MEn+ALKyhr+ba5oCV41Zpe2oH3Kuor2qcRJs=; b=lqRvCVXqodhUc4KFeMLCX1sb35
	TPkTBfP4oIg4Il4+mKuWjYLqqiCLX1RrrDmhRhcpRMCAnraWKxAg3536TQ/IB80Hail7AFe0Mw23R
	PXG80L0BvWEmbIFmnB597wfHMNYlIXhWdOEqyVuPX9khd3jHJ88VJbz28v6Prn8DpW8MNlRffL9E4
	6+LDpJr0uEH5ddHDu58lh28YSyq0FpxwTk3wmIkCWh8zsOdobwmtwSr+sLzQQ8fptf2VNItAzgZnp
	xEeBrdqyfHFUURJm9gxW9JbUGa8Yq1HJZ+77NUiDr+WzslJDxo70wcSMJUNa1pVaLy+tJpb4sOsuM
	JNsFxPGQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkL-00000009wmK-3QuC
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 05:42:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b150559bso13953665e9.1
        for <opensbi@lists.infradead.org>; Sun, 17 May 2026 22:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779082952; x=1779687752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/gvJ7MEn+ALKyhr+ba5oCV41Zpe2oH3Kuor2qcRJs=;
        b=Bk20vTPVLdEnAn2gz7nJNIOAoVo4en9eNDbx9fYmJNYoNSk1NDiI4OFo4MUXTnji6B
         h+jNhLxSYM2ZI9DK6EOZRwIPJQ1cBIZT+bxkQRhpg4MnaHD/naRwhv6a6+uzz3ucZdZj
         MeUtVEIG8MJVZuq0VAX+xPaDcPq2Mril1AM7xDoM0aouWL8OLO2MwyiWJJV5moVst8aT
         LPEJE7Dc42DRZ9KRHNzg2PHZy8mwsemcF6L841YdBr2jfgPPiT44jkxnOdqpSw+r5LHA
         do6sJSPcZ0AxZn5cej/TSUaps5ALfcsR5eWX3GL6iVcuMRsEEiabIYUntCgk3QrShrrq
         YQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082952; x=1779687752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv/gvJ7MEn+ALKyhr+ba5oCV41Zpe2oH3Kuor2qcRJs=;
        b=li9dHdAr1cESmf9BMRB5apettSvMkWByRlQBAzk7m7Che14j+qm5s4OUPt4HdujT1W
         2KSo7i7fXThQ1qmam929BVR+jNt4s1R4nSwRBfK+ALhH9W4+/cR6dRoVYctYo1QyDyzp
         5dZuHEkCa8jNBhuOMSXDcOp5oFMfMa36k2gBf1YnxTpSiuel03zMbCDe3h2faMh74wCt
         LsiR3YaMKVZ9ZuJyCINrcuSXy+aDnFRZbj54ciQJoMb9lRfhrhu1m46ONbMPoU5kgScR
         x9FBOGvsX1o3yk6YF8/ZvHqU2U/ZoYwYw1BGFAHGjSGOzOm+AL/VFlzhpXA5DLrdXCtk
         fpBg==
X-Forwarded-Encrypted: i=1; AFNElJ+elg/bvrOAHFD27JxcK8wnEZtAZ4RWCxHSiHxLGCkKeiV1+ce9oAAt9YxH2RkJbTDV5NWVcZNz@lists.infradead.org
X-Gm-Message-State: AOJu0YzU5dtilgtSeiPKVtwxGJOg6A1IU4lwyFKKARI3AVbZho8XNQQg
	mHwKWdrod11TeAvR+25z4lvcOQSEyg2z4dAsUEG9CZg/ve+LqwxLvNqGEspXrknxayU=
X-Gm-Gg: Acq92OHeCNs/49drcvYCKnDeafyvzFxlU1H1Q9JTyUwwljqkeYME7YhnGxZCEf7LpKI
	IWRhYEozxTrEyewZS0F2w625jVtyobLmL+Zw3eTm9YtlyU9S2R9JZimloST6HQC7SG4yb4yB1U9
	6NC8RbPoa/TeXsXpScHpgSrvqCv2+rBFG/dcIHmNSR8JKcwH1kPdqazFwBFIm6MZlQHTD2412V6
	wUrx6AK8eF9w5Pwi27yo239qyo1DFaYqHKUV3C5olIGyqEDQIZPLnWSCquOBIs+ADRCE55JSUOI
	HWNEC8ktmYECjsM7tXucbIJFXXjmfVUSdvKtFyxn8/BV254DJkZAxydRfFFh/jnqQq5/oYqHv8L
	XJr8TY70lE3I/Muk4QzB8gUN4ONszo5/VG5vBu1o70ii13pbdnNLQNFICMVliJb04GUzBYseLcu
	5MCFZBNvDp00+NakLcHu1oJMj9bjSpxgdvM17TFW0u6t5eTqVPCqQg9UJdwBAnFfNLig==
X-Received: by 2002:a05:600c:8905:b0:48e:5d91:cffb with SMTP id 5b1f17b1804b1-48fe60e7d6emr165192865e9.10.1779082952450;
        Sun, 17 May 2026 22:42:32 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6faeasm73948715e9.26.2026.05.17.22.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:42:32 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v7 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Mon, 18 May 2026 06:42:19 +0100
Message-ID: <20260518054219.58708-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518054219.58708-1-dave.patel@riscstar.com>
References: <20260518054219.58708-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064234_356620_89BF07B6 
X-CRM114-Status: GOOD (  16.73  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Dave Patel <dave.patel@riscstar.com>

This patch adds proper support for per-domain floating-point (FP) and
vector (V) contexts in the domain context switch logic. Each domain
now maintains its own FP and vector state, which is saved and restored
during domain switches.

Conditionalize FP and Vector save/restore based on extensions, unconditional
save and restore of floating-point (FP) and Vector registers fails on
generic platform firmware. This firmware must run on multiple platforms
that may lack these extensions.

Address this by conditionally executing FP save/restore only if the underlying
hart supports the F or D extensions. Similarly, perform Vector save/restore
only if the hart supports the Vector extension.

Changes include:

- Added `fp_ctx` and `vec_ctx` members to `struct hart_context`.
- Introduced dynamic vector struct allocation for vlenb in 'struct hart_context'
  to allocate and free per-domain FP and vector context.
- Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
- Updated `switch_to_next_domain_context()` to save/restore FP and vector
  contexts safely:
    - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
- Added runtime checks for FP and vector extensions where needed.
- Added SBI_HART_EXT_F, SBI_HART_EXT_D, SBI_HART_EXT_V to enum
  sbi_hart_extensions and the sbi_hart_ext[] array. Use sbi_hart_has_extension()
  to check for these capabilities before performing the context switches

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_hart.h       |  6 ++++++
 lib/sbi/sbi_domain_context.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  3 +++
 3 files changed, 45 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a788b34c..68a01b97 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -87,6 +87,12 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 	/** Hart has Xsfcease extension */
 	SBI_HART_EXT_XSIFIVE_CEASE,
+	/** Hart has V extension */
+	SBI_HART_EXT_V,
+	/** Hart has F extension */
+	SBI_HART_EXT_F,
+	/** Hart has D extension */
+	SBI_HART_EXT_D,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990..e06103c3 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -18,6 +18,8 @@
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>
 
 /** Context representation for a hart within a domain */
 struct hart_context {
@@ -55,6 +57,11 @@ struct hart_context {
 	struct hart_context *prev_ctx;
 	/** Is context initialized and runnable */
 	bool initialized;
+
+	/** float context state */
+	struct sbi_fp_context fp_ctx;
+	/** vector context state */
+	struct sbi_vector_context *vec_ctx;
 };
 
 static struct sbi_domain_data dcpriv;
@@ -143,6 +150,22 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
 
+	/* Eager context switch F */
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_F) ||
+	    sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_D)) {
+		sbi_fp_save(&ctx->fp_ctx);
+		sbi_fp_restore(&dom_ctx->fp_ctx);
+	}
+
+	/* Eager context switch V */
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_V)) {
+		sbi_vector_save(ctx->vec_ctx);
+		sbi_vector_restore(dom_ctx->vec_ctx);
+	}
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
@@ -168,6 +191,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 
 static int hart_context_init(u32 hartindex)
 {
+	size_t vec_size;
 	struct hart_context *ctx;
 	struct sbi_domain *dom;
 
@@ -180,6 +204,18 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_V)) {
+			vec_size = sbi_vector_context_size();
+
+			/* Allocate the vector context pointer */
+			ctx->vec_ctx = sbi_zalloc(vec_size);
+			if (!ctx->vec_ctx) {
+				sbi_free(ctx);
+				return SBI_ENOMEM;
+			}
+		}
+
 		/* Bind context and domain */
 		ctx->dom = dom;
 		hart_context_set(dom, hartindex, ctx);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 60e95bca..b5e0ee10 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -396,6 +396,9 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
+	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
+	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
+	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
