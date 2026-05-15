Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F307ECD343F
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 05:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pkmotNARDp1gB5QJKkp/uyB4Bx73Qnwf/S/94OL6XQ=; b=Ie5aVpbMn8+HQc
	U8C57aAJcHVnrJDtkGbqYYdv+sUBNGaeNlwyrizmcRW5BndqQnv/3zf5jTTBO0dD8I1H3MvNTSrFn
	vNEoVIkam7Jp/MxAUBgnOyNj9DQpSqZRBUxcH+5OlmG5wAVnf8TrAEon+1LXbHzP8myj0LEPZQbIk
	Lacb4OOTYE+IF1e83OaRld5eWABw6tj6xQ49t95viVpHqx5ik6rJ5/3ewfsixg0b0Vf4png/vzFrR
	pF9tOdxmD4K23XYfbUqXFXPgO1lyWQJsMG6otaHB46oT/y6cUWoVP3UaNRuEQ4frGeWAw4SRsGg8Q
	WlLiflXsiG0bfoGnCAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJT-00000007Qq1-0qmo;
	Fri, 15 May 2026 05:42:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJQ-00000007QnT-1ywI
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 05:42:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so54779575e9.3
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 22:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778823734; x=1779428534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQomtw6BVeIaEEDXKxqElEUxjHHOwlCg8ZFaTmlZfJw=;
        b=cOkjYqiw60fzYMLu1f2Qkm0QFO1Hi7n/BNXHUnAuUz0yd3AHIMiCF2tHgHhfxZWNSk
         N48KmUFxCh4EwYxoEpHwy/4HMr2lORcm1/yMKnUHvf2gIa42WlJ1wXbi4dYcrL1vbd02
         R6x/QcAM1VSIFPcaJUh3Yf1DQ7wZZXki2PUuFJUxc6xktcEZSq4OPmslREqdRVSQF2Py
         8qSM0wgchOyN01i78luZ13X2JPc9aplkpK0V6UCNF0ybAVoEJG4h3rXVeSQV3kq7y23n
         Hp73unb0qURbjUxQdODQ2RR050It1Xi200uzQi6Hnar3HWU6R6WHXg06NDmuotaEpQSm
         gtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823734; x=1779428534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQomtw6BVeIaEEDXKxqElEUxjHHOwlCg8ZFaTmlZfJw=;
        b=ijflyvN8J7/Ehvh0N0xqzBacn3E2dn5cI8Gu/Q8QV+qHMmFxHyL+BgvuGVSZQsqTjn
         UyMxI7s79r4N7iVokuds6o7c60zc35lpHEcXdk6Hhp0vkRUEvLHWnyOPPIRi5TqrwaLf
         9bhfltX818RZom6h/czJ6J7jNsxRj+p871SR7VUvjmJ7u6CbBmZAYKat8aOdwAgIOvcY
         NG6d4Tw5L8orNnrPMPtiO2j0+/SttGDKhq6TyzyccjOnIokpcJF8J9+w0QP0AwmOwRAD
         oLumYzuiF5QzuPDQRPvAuWATGxS8ERGgD7aFxbsTdwPWDpc6qXBQJ4/PMISo6XSbFKgs
         /JRg==
X-Forwarded-Encrypted: i=1; AFNElJ/nR7wqVMiIndaCYAW19u9UyKNiP2u9mHk8O433RLUTvhHoA7ADOKmhToz+UzFOdjZsnrkG+Gsp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3kg+JqdSMGxB7GyOAOP9ISpB3XIrt4q7V7azMV3KxCBJTw8w
	HeGB4QMTz8L0Yw0+18YMbEKPvx/M8RIeIZXQEYSxC2FuCjByGLgJp3L5Zlgl+D2L8wY=
X-Gm-Gg: Acq92OGFfB8s+uk34lV9XMe5RzJ4PSaZawYd4AlQg7CSvReA68nv6jjTR/BLpOjOgQh
	U5v2PplzwWEPoBrgoI141y9W7amti9EbNCSfb+LUaQq7x6t1iwiBiGMomttESKc/MzoT2AX6rwt
	GyMGB+g4yobHkgj3nwEp+ee7+OhBXro8ZHh9lEVwQtCHHQlEsWMtiQLLD4DStkE88iLO654ZGGM
	gs/4YNHmppz777joATaHkBdDcXvkbNteX7jMVxwZ7Jt7QoafpzWmmxBbOMbbK2mARr4pMBsOR1j
	gmZgWZjyu0Ty2bpuIeV1pIrZOf58SMwwXissuIZ0CoV87Frc0fisfXSPJIt2AOGa/rmkU6lcd6q
	0xJWQpy4ofWmuykYW2d2NSHXfEIZhkyprjD5dpPVuDm/CFGx9rvD5U/ce1hgjX8UvoH52Dye91i
	WNkb/WKKudk6/CBxVB3x0A1LFwNk3HUIgY+UC5eLDAChjoenWG+uOfRrKqYaciyiToo7yInftB8
	GKbmA==
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48fe60eccc3mr29340005e9.13.1778823734581;
        Thu, 14 May 2026 22:42:14 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm11456536f8f.37.2026.05.14.22.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:14 -0700 (PDT)
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
Subject: [PATCH v5 3/4] lib: sbi: domain FP/Vector context support for context switch
Date: Fri, 15 May 2026 06:42:07 +0100
Message-ID: <20260515054208.151045-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515054208.151045-1-dave.patel@riscstar.com>
References: <20260515054208.151045-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_224216_529507_228CD59A 
X-CRM114-Status: GOOD (  14.22  )
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

Changes include:

- Added `fp_ctx` and `vec_ctx` members to `struct hart_context`.
- Introduced dynamic vector struct allocation for vlenb in 'struct hart_context'
  to allocate and free per-domain FP and vector context.
- Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
- Updated `switch_to_next_domain_context()` to save/restore FP and vector
  contexts safely:
    - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
- Added runtime checks for FP and vector extensions where needed.

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 lib/sbi/sbi_domain_context.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990..5e180698 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -18,6 +18,9 @@
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>
+

 /** Context representation for a hart within a domain */
 struct hart_context {
@@ -55,6 +58,11 @@ struct hart_context {
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
@@ -143,6 +151,15 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);

+	/* Make sure FS and VS is on before context switch */
+	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);
+
+	/* Eager context switch F and V */
+	sbi_fp_save(&ctx->fp_ctx);
+	sbi_fp_restore(&dom_ctx->fp_ctx);
+	sbi_vector_save(ctx->vec_ctx);
+	sbi_vector_restore(dom_ctx->vec_ctx);
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
@@ -170,6 +187,10 @@ static int hart_context_init(u32 hartindex)
 {
 	struct hart_context *ctx;
 	struct sbi_domain *dom;
+	unsigned long vlenb = vector_vlenb();
+
+	/* Calculate size: base struct + 32 registers of vlenb size */
+	size_t vec_size = sizeof(struct sbi_vector_context) + (32 * vlenb);

 	sbi_domain_for_each(dom) {
 		if (!sbi_hartmask_test_hartindex(hartindex,
@@ -180,6 +201,13 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;

+		/* Allocate the vector context pointer */
+		ctx->vec_ctx = sbi_zalloc(vec_size);
+		if (!ctx->vec_ctx) {
+			sbi_free(ctx);
+			return SBI_ENOMEM;
+		}
+
 		/* Bind context and domain */
 		ctx->dom = dom;
 		hart_context_set(dom, hartindex, ctx);
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
