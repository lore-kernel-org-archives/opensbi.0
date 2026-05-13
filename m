Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF6ACD4F35
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBpxModO2Dmop2yazS/ytCVUnS1V10J88NIKMArSm4U=; b=NSnHL8/6yUKiUJ
	8mIUnGPRAR+XhTkkfsaZqkiZ0Q46Od+1DS26k0O1SYDf16uZ5WmVjEUlSnuFdvpAOAB4cG9UEsLdu
	dvnca9anj/lKPCna5nlnIs3mwE/AJFI7AAdtlGHCA4yl3xDGTHq2+ZY4xq1AM81OkZNvn6o/TQcsP
	Ba0sqNd1KEoBMydX4mx3MNKswt6fL9SilkPmFyjOKl8hHPauHG1FQ/eeGbMLtIi6DVhSUG2yYC+D4
	YFrDeHfrSAndUi9QeZscQawGrNnwSdnejP3SMERrn5H1sL34NvO4gVTH2wywvd7fqIUjM+G9FbbBu
	rANyfT5uXaPTg022fPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3na-00000001X9m-32am;
	Wed, 13 May 2026 07:14:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3nX-00000001X7d-2qBx
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:14:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488b0046078so52774835e9.1
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778656466; x=1779261266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHFrs5AjNCd8I/DDgclnVmgoyc5BxtqKyj8lH7C5pyc=;
        b=PY6mVCJYIDxWOg2tjZH6EQRuqvSErbnlOF/ac5EoMLGPu+L1jBLAjNKAJcA+Za9O3P
         iucAW3A2O5WFsOJlKx1+GqE/zQADHDolxHrrhXeiMvHDca0TcqVDm7sVk6cUjQehbO+v
         hOZbcMpH5P9nYEg/z7KVUdfYDEWetUlV+ASguI8DI7Gz7R1Khi9Tfv1pIQZbWWfa4BXI
         KpFmVaKq9+OIfa5r8tyN2u2p3sTAD4ZN5MUxGuXELl/C5e0n8uGnrb+t9eFLhnGTKFvY
         3jAyoGcJolLgMPDlFi5dTR6LCzwvSLpf9hR5nYexm1vR5BuGHG9XI+JIdWwDRRKPuYZ1
         Uzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656466; x=1779261266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHFrs5AjNCd8I/DDgclnVmgoyc5BxtqKyj8lH7C5pyc=;
        b=sMQNduR9VEpxLkCvdPCxj1C1xzFfPAABuh6GiDGn+il4ujZcMY2IN1I4Ta//0Qq12I
         0zFu/fZe7c6fwMiWjWrV2UEsWeNvZ91FzL0IEVOpei+D0eAk7mfKG351wKxpEgKHa2XN
         W2c7DV4lCoHFTILbULw2l/JfI/dd7l74+Bv8zlt+GaO9be+TVjca9wOP5+sCb79uTuBf
         ANgkZ2JlEszs8pc/JFnGd4l9P8w6q4xQnCJtiH7ZLKx+/9kbD3nR7m2HBY/XakUwP+Qn
         PSPpGsXZk6jfrXard1IxztUB0bGUpWeGdQTzQNNYPsLja9gwLBLdmOfbrQ5nPrlaWJOq
         VpPg==
X-Forwarded-Encrypted: i=1; AFNElJ8t9C8S5trTWj4t0dbXQijw+F2I2jekiwqZblTjFVl0AGm9ELVLs+oASywbWVmQ5L38bVWO790Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+RvOEEMB76pLBkCiT5+rD+DaKYnGTy60vuFfb/n6O3awMFWX1
	peu1a/KJN0OyACnPfylbfaUVzTYdeurcFWE1oceUTltjDHtfZ3rTFlStfaG7hUVaw1Y=
X-Gm-Gg: Acq92OH+SpjA5khkWcwTjhuKYGV0CxEBv2GlkTYaxtGBJ7xm48BHIA0c+Tbt5U+Yq28
	/wTpY4CznBhE8Cbj0hbTqaFaxBt+uaYl/vrZBy6yMxmJ9NAt+c17aiOuDR98BFjdF0m1F3e9cnn
	fGWPNp7s61Cw9AQyZjFznPPTdoheZ5Z9BYVNTYmy6NUI7NxS56b216tNpvyO8olSY51U53tj/Dl
	BjRVo7sf1KgI530jbXSr36mhRM8kShfmJd+O+R68xQrXeHlSS9MlAe3M1ANhe2N+4ApH5ejz4fJ
	iO1YC4B7OPFaHNB0R3w0UOhjlxC4U1tNsmaX3nGPkrl/7Cb8uSuRm9UITwom6TEMS8ieEUGb62u
	dI1XHwJYBkcxdi6zHZ0d8COFP8vIpfHEmhhuuwLikMJxGGyLvNWpM9zRc21g/vlbEYxj3ZmhRUs
	cmNTKYDCStCIDtsJrkL2AXuGBdUL7eHZJFBZShtIRaTGXanySvvv63+zV5UkQaHSLzO9Y=
X-Received: by 2002:a05:600c:a087:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48fc9a02812mr27064565e9.4.1778656465583;
        Wed, 13 May 2026 00:14:25 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e5efe71sm39558345e9.1.2026.05.13.00.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:14:25 -0700 (PDT)
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
Subject: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Wed, 13 May 2026 08:14:18 +0100
Message-ID: <20260513071418.50957-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513071418.50957-1-dave.patel@riscstar.com>
References: <20260513071418.50957-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_001427_748232_83CF3934 
X-CRM114-Status: GOOD (  14.81  )
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
 include/sbi/sbi_domain.h     |  2 ++
 lib/sbi/sbi_domain_context.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 882b62c2..05a5d86c 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -16,6 +16,8 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_domain_data.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>

 struct sbi_scratch;

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
