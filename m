Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1703ACD4F3C
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+i7SIxv6pI+LAj61eTmDwzT9KOstiviYgnMB8EMrLKk=; b=Rlr7h0pp6kMP8z
	er49gyj/0etz875AAFos4Yc10zPFMDfols+lWOdhdIgZFbuB2LNPLBDihLz59IWCfrEq9gv/KjeYD
	kl5UW+Ql8ayZWZe1XAlDxpuFGzfJVEtXrt68V64RYG2ltVwvX900sxkGIyCrriFZS3/mmJUl/aYQN
	LeEapQHN2tR8uywvJet2PViMo/zhtnx5DL5dmQk/wnV3vb5Fu9aYLhGj0tRK7NPD95om+zG1OM8Kg
	scWLQK7LA+N2h1LehaoLLqTYESPuFZZ/casQIglhNL9z+7zI0vD+Ez+j5ac4YZHGloJIw1kzxGb+i
	4Yc3Lm6cVfRv1BaL/Weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONON-0000000BcRO-38gi;
	Sat, 16 May 2026 22:21:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONOK-0000000BcPV-3Y1I
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 22:21:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45d96d21e82so460765f8f.0
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778970111; x=1779574911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlHYT0RR+UVlXssbgzJLPQzncSlCYuY8cknpvtXd2tg=;
        b=OdrYCrZNb8ESYN6UkorvitjjIc1XRhGN7A2xevFi/JD+ABOxMyCjaYhu+SadPMYiba
         Kz9wlwyhJY5n89Jy7LGiIzFQ+s5igoxobmInpm9AaN8bh5PqTYI09WSYxiSbeUA5Q7PU
         9Wef4ef3d+rnM+bg6OIKjFx6t1m9ZzabqBjse/e2tNf6XbCot0tUQ7WF3RPWqXkkHPYZ
         Ly3VOPJh3cjUbPDwkujWgVLGtzZDW/UjEoFWPoQp0PIOlXb+a/MFJQKjm3OXfDGOQShG
         VzRtWyJWekaywVovPkmhmKULt1WqvyhkxN1qqDMbTkoy8QjSgApZvRhveO13PTbNHCwS
         l/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970111; x=1779574911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlHYT0RR+UVlXssbgzJLPQzncSlCYuY8cknpvtXd2tg=;
        b=OIvNy+wUv8gWwumSLx71FjX7ixb1L7J9oALRxBB8QfRPVv1HOhMR7oLBrblIBSRJ2m
         o26NL/e8WA7oJmlIdVxjayAbHlbDUcnpR8S8LK29f/iUym4i9Jdv3b5I6CEs7Jjk8Z+G
         Fr1Ow6pFAP3R52Nm4je5JSafrdkw42k5dCXzHkiokPAfwUdKfR6/PsIJOq4YiEyMewp6
         G2B3aFixW2i9A+lAOYIK9EsE950d1iTYbOjp021PV11p8Uz8xG8OgIUez5V3uvHcWu3S
         zxf4l/41cLSu7rlvfSxecBbwlc0HxUVKW/yX2bMo3MxZZ0sEGdLsfuaCb4hnTFpBpSLb
         mnEw==
X-Forwarded-Encrypted: i=1; AFNElJ/e+vAaIUHs1/5mn6Pkeih9pp+NqKr0u8Y1VR2R65ozuhpLWsYdq72nToI3jeNe7ncNGXB0C9ux@lists.infradead.org
X-Gm-Message-State: AOJu0YxOPN9zt2cSeUvzDLGZEawDXpf2WFOBbkPsj0uHBFmjI1f+x8k5
	/vY4WCsnmsbqo4UOuXXBsXPOm4oM4t4s/qvPEDjRGD++un8tN7J6PgjyoirielfYrQg=
X-Gm-Gg: Acq92OFqZNfstfTjfZlwuP7qOUry0+b6EDc1QNQIQEr1qK16wbLK3aHI5/aCL3Tz5oI
	JoUHQ+q7vpGfm0X/1soPfuzOqRTpm2g1JVtlluP1CTvhgB8ULPkE13rojJkYmdDId9CP24x2V7U
	GD5RfOligF+cLOx0ecfrvzB3HH2uXoanyLJYpk+RzGK2mBKApKr+rpDSe9aZ0i7KDO4Pz/dxK94
	a9qiBuVsdSXyCZ1lZ6aJEiYqTBPpnXGALcb5RIWbRW+80mrMHSDZz13UB6gne8IGdqAYXsOQ2lx
	PX2JTIngCe7Nkgn5LfeRh96leakhxhybgHt++o/pJiGYlUCqdjiV7Mvho6npYADW4n/gaX3U5ne
	Q8e6aBE8i4EXfdSVFZbXCZKCciPHU30S8WkP1ygOxvgGy9jd5L4OBtvdZbce5W6IqSPYhRD0Am5
	XrxDFy+SqYAQr7a+vppR9Xf7xPDl0OJOQMELQ55fiYAas4XaVNsFSSn2SNJxXCGokiQvCzguuvw
	2ME
X-Received: by 2002:a05:600c:4e13:b0:490:31e:d6fd with SMTP id 5b1f17b1804b1-490031ed899mr9303875e9.25.1778970110824;
        Sat, 16 May 2026 15:21:50 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm43694305e9.17.2026.05.16.15.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:21:50 -0700 (PDT)
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
Subject: [PATCH v6 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Sat, 16 May 2026 23:21:43 +0100
Message-ID: <20260516222143.23619-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516222143.23619-1-dave.patel@riscstar.com>
References: <20260516222143.23619-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_152152_914650_94F268E4 
X-CRM114-Status: GOOD (  17.39  )
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
 lib/sbi/sbi_domain_context.c | 37 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  3 +++
 3 files changed, 46 insertions(+)

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
index 158f4990..a3f69e7f 100644
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
@@ -180,6 +203,20 @@ static int hart_context_init(u32 hartindex)
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
