Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26973CD4F48
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKZm+wfMnGLXQ4tgJhjdvwHLWhn9/o9s7SgtxgYCYbI=; b=FFafh+NsCWGMf9
	rlA/52rnh3Yyn4iFACUQKSOobYJ99/htOfA1k87fsKi6iYiRnslgwt7OwHfRAUjBiLMGyKa/SOb8u
	NjyOTEjNjTvRHVjhvPtM+0lHeJuPwx5MoEEKfLa+LQSSHufd5PqboDpwL2bl/go7x4VXsq/28W5jb
	j3xWqIi/g8UIE2/UqxTYhLaicGzWKxradzYvk8ooRq6nZK6oRJoeLw0tZ5sp+Mdqf9l1eLRssPcNt
	k3OZjOfhwOYcvabWqOUuqOKVZqHCoOAQ/PcPSvRJCLyCxB83ov3oOHpf0W6P8iHR9LTv+HEERW7gG
	MHj349p2sRtOLa4XBUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw7-0000000AXlY-3uwD;
	Sat, 16 May 2026 10:07:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw5-0000000AXjq-2fBJ
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 10:07:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-441209fb77eso274155f8f.1
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778926076; x=1779530876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k4pGb/ciAWJHOBDeoJgQ4j2IrpmkX+G4UMeWcOx4kk=;
        b=uggXxdvOD7FYZNV6Zjw1rVH2r/ZIK8ibwmhgPL7tFB/jB3184JPmHtcVhzFQucbcyl
         iweN3r3C8W8HliVpa278dYv9nc1QQ+0HJl3dSKOPS+DKWXgwaObX+Fm2p7PZDIksluR8
         naeguNrKAXVZlPmQlOyk6VUdtihdVMI19r10FPOuG5Y3sp+RxSdSkGLjNprdioFlDc0V
         FqTpWuT9IpAPuM0zzTxB/E5iiHWvtXQzHBYfqtfbeE9FmhpBVAee6Dmmmcs6UPFW4VOR
         ZT20KQxYzjnFnssbpykYNsX16uM6jF6/E+lmYlBMYXK/5L+XTkfZlar9sXpTmowoOcjK
         /rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926076; x=1779530876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/k4pGb/ciAWJHOBDeoJgQ4j2IrpmkX+G4UMeWcOx4kk=;
        b=Z+LGjZA3StRDB4J0ya9Ffl+VmY5CoSWpBiMlKHhGI9V6QmnqeWHrokAfkM4a4eaKos
         fG/aKZKU3pUMjbs20EbSG/RJ1wi0bJm49tS6Ib58eM011xh2aqOIpxOb2sKm6zoVVGGO
         YNjiIs6j9yVnC+Rut5y/vgckldsyZ6LhTbrg2GUXgLWVBDAloPYSfzdeBHORPVRmFlp/
         N375zwGK75+p+7743pLRv2UegO1b3mKCvIJG9H/KRQYQD0B0EelkLKmFxPlZDdje58Wb
         qEQVW2/WGYWxLQgNq1yRXoNI0AtLusX6UZofAG6x+o3PgLcSeLyEh+SKHxEBg0yID6ec
         035w==
X-Forwarded-Encrypted: i=1; AFNElJ/UrEBbLVNCSsdzKBV0Is7QZ/RncUDIjkSPABq/824KaqL0m0xDaTpwMRZAYglSJntnzQ3cqBPE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3Vx3SRhJqVJe5OZ7haE5l0YnpiT+Px6jfWPL5fBHIVmoUOwg
	mubIkC+d5GfLwGpAaWzzKiHN9AuPmiPiQH6yls7YdhU8GSeMPuUpR6kEHYYZeYLpC2w=
X-Gm-Gg: Acq92OETNckjoKiguqMyz0VutJFKNSKWY+EtCSFJFX5QnZga+P82mmv7+IDbFgeLv2H
	nfWfw+8hss1CPY+LAUpp6F0+aUOO9X335Qd43en7W3ipalo9W/Xc/TRqgk8BgOM2rcTkWhEmhsM
	fnHusBGz5jaeMRYXNp7P/hYd4GcTvrGjcvHM9X8N4EUn1h4oU34P/2mwhkvRPecOt+6VRFPjknq
	/rpK3IQa0M+g/3PmutH6EYXgkDJ/FlR6YPIkfH1EZl1+Tz1JDgnsEMkG+dO5s6jr1VITMQBvE1y
	NxHIrhCh7PPnZuiXDqUjfNoAJtu9V3SsiYhEK1FH4VYTX/HOngvRAqgYRilR0gcZQCXMIvrr667
	nCR+W750SjitHTtTO3KzlodTZfiCFW+gQpqFdxXDlu+n9aZ4LLt/jqac0+lThvZOJcSk4OzOjV7
	gPetOG6BNkSj0fBM4qn/BoBsEY1rkR0dDbf9318K26+S/1lO88JjQaw190R5U+xKjbdk8=
X-Received: by 2002:a05:6000:4282:b0:43d:7874:5d3b with SMTP id ffacd0b85a97d-45e5b756d1fmr11648620f8f.9.1778926075741;
        Sat, 16 May 2026 03:07:55 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9adc2209sm19167114f8f.0.2026.05.16.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:07:55 -0700 (PDT)
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
Subject: [PATCH v5 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Sat, 16 May 2026 11:07:46 +0100
Message-ID: <20260516100746.13502-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516100746.13502-1-dave.patel@riscstar.com>
References: <20260516100746.13502-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_030757_709272_9D9BB638 
X-CRM114-Status: GOOD (  17.51  )
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
 lib/sbi/sbi_domain_context.c | 40 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  3 +++
 3 files changed, 49 insertions(+)

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
index 158f4990..46485728 100644
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
@@ -143,6 +150,25 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
 
+	/* Make sure FS and VS is on before context switch */
+	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);
+
+	/* Eager context switch F and V */
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_F) ||
+	    sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_D)) {
+		sbi_fp_save(&ctx->fp_ctx);
+		sbi_fp_restore(&dom_ctx->fp_ctx);
+	}
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_V)) {
+		sbi_vector_save(ctx->vec_ctx);
+		sbi_vector_restore(dom_ctx->vec_ctx);
+	}
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
@@ -180,6 +206,20 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_V)) {
+			unsigned long vlenb = vector_vlenb();
+			/* Calculate size: base struct + 32 registers of vlenb size */
+			size_t vec_size = sizeof(struct sbi_vector_context) + (32 * vlenb);
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
