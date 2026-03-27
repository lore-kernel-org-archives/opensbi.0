Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557F10F2862
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0NUEZYgVCGlX8CZSluM8SNkhbxi2Bp4OwGB5uZcI1c=; b=tKcnl1YPcvpzsA
	iZA1jtE2o9Q4/a+jNpHl7fQulBPpZB3PSPFZf2EucXAt6ggUQVGVP4r9PEgpaX40eT4QtdmIx53RD
	mgOjH80V/t+O8+MxKjJjP9AsZHtI8ocC4XtseUwGPtYcvdKlgKUzeRgXRvMgk2WGbegVB0IBKJidT
	W1gWZzTcHFCC/0XM+Ydh+JhTdk0ShpmE4TAaTOpQl5Lbu1YFbCa6l0bCYITWr/a90OkJVV8dIrYGc
	N8jNIYXdvBeu8gQCVfeElp0IOAiAzcooSSWhZ1jhiF5sggKGGIOsq3VXZqCTlaa7Xxnh/+sYjwupY
	/XwFH+eRtx4a5JrYvwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An8-00000007qVz-47kX;
	Fri, 27 Mar 2026 17:16:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6An6-00000007qTc-3CF6
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 17:16:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1916240f8f.1
        for <opensbi@lists.infradead.org>; Fri, 27 Mar 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774631771; x=1775236571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rIauy1Qs7HhuqXRDh0FGqM5SuPe+eQaQIqqjrRpr8=;
        b=DHq/YMEtJRNH8xNPbsTEzD86N0r+YxeLzKTpFB7vvumye4SnR9YmBL2WCwas5l3oMP
         DIQtIbrz4lc6umZK46vHwXoCHRpsff2tOkCAR3W0ee8slbayoSfddQT5EFZW8lJAiW7M
         uHv5mWne8BA+SQ0cxciKzM94rdctIyAsFHD3vMWbd8665Y8N8Ybentla2xaDrobS7jk3
         1UHzsC/94At1GecnVRxTGythSRXmWnkeaquWUqG2POr9LdlYllLbfwdQRXuvMfeBbfc6
         zlViCK8DDTa1bbt0uxTzK3OG9wKjIYVYOTJv/+fhGTolBb/6NbAUk0ORs2LALGsH4TbP
         jELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631771; x=1775236571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I+rIauy1Qs7HhuqXRDh0FGqM5SuPe+eQaQIqqjrRpr8=;
        b=UxS8ylkeWpXO9JF7zHvRWymwjPe17QC1sXXOGnQVMvaghz60WetSooOBlAKWeXybZQ
         2nZjk8nVOR9inAGwpLIh7QDpPd1Yc5GkJ1x5nREowNbnjGjFlT62c7bMbd8UYitojB5h
         L0P8WZla+zbQautCU8PLQRj7hVOTeMm72/iFUzPJBIEgoVnk0nrwLFy+hd1t4tDv7jKA
         O9VDtcGBI0peU/8e3AOL6XZLAYqN6rIjxlbZvsRVP43QBHk4mqVithlmttOodaCUck3J
         XAbSF6MCvuavAXyotGF/c+SWoVq4v0aifLZkjdnYaZkqS1jn/60ZCV6ZL8FnWG4Zfxra
         eNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVFkU1qvWedikKp7ndCaB4/FaP/6O/jWSgSZn6KlgbFgzGNzbK0Lg5BBCqgEu/PPEdyLb9Mlse@lists.infradead.org
X-Gm-Message-State: AOJu0YzcWV5UwUoOEp+zIB/fzOyG9lLabRuMz561SQe2CjXA9a7/Uyls
	7JMWvt+yE1zgONC1a7Jhj8DSKQWBRjsp24paMygK14G1IzL+gU1pwrRgGgdj2hXZko8=
X-Gm-Gg: ATEYQzz0DdQjPsQSF3XdrMTBR6sLC20McbJibvxtUVRC6b0hKc0pDlBfDz7ncsYGFm6
	qZdybGUR16McWWGwkxoIl2sM0inbg4vNpwImE35yz/UzzESLY0HiU+ILK7IjzgIdXspnm+0oiqN
	LffgyC10cC3VFY33PyTIFZ01i+fiH6H0UIVsNaRXF8xxh97sMSn5cY9Mv0I3hmPU08d1gMAmkGB
	lvwh6xHw/52KlNefIjYj4RbYLTJ/rKrKnSxGNqkkuVUJ2r2QuSB2BiO5dskInDQgjydFgVd5DXe
	Ndg4sa8WKD/O4+CJwQcqnJOx79bpC4fZRN9OaLlzkb2nJrYWvvngklcJxkeSqpiZZi2g7H5vCWP
	TNkHUpvwZYoeMriIems0u5IAIS5OwEpReOY5DtfkYU6dXgCconbZ956g4HlpvFYm5Q+bqrttf/N
	N+NsXa6mImoWHY3jLJsDVSkDoU1tP/ygsdcHPYzxWooUZ7hAQFqN5HuK+JoThbf/qImD7XXAanS
	glhBQ==
X-Received: by 2002:a05:6000:310c:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-43b9e9ee8f2mr6122613f8f.30.1774631770844;
        Fri, 27 Mar 2026 10:16:10 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e3f9sm17150785f8f.7.2026.03.27.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:09 -0700 (PDT)
From: dave.patel@riscstar.com
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v3 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Fri, 27 Mar 2026 17:16:01 +0000
Message-ID: <20260327171601.169103-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327171601.169103-1-dave.patel@riscstar.com>
References: <20260327171601.169103-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_101612_884417_FB84E24B 
X-CRM114-Status: GOOD (  19.36  )
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

- Added `fp_ctx` and `vec_ctx` members to `struct sbi_domain`.
- Introduced `sbi_fp_domain_init/exit()` and `sbi_vector_domain_init/exit()`
  to allocate and free per-domain FP and vector context.
- Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
- Updated `switch_to_next_domain_context()` to save/restore FP and vector
  contexts safely:
    - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
    - Restores original FS/VS bits after context switch.
    - Adds NULL checks to handle domains without FP or Vector extensions.
- Updated domain context deinit to free FP and vector contexts per domain.
- Added runtime checks for FP and vector extensions where needed.
- Corrected handling of MSTATUS FS/VS bits to avoid unsafe full-bit writes.

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_domain.h     |  4 +++
 include/sbi/sbi_fp.h         |  5 +++
 include/sbi/sbi_vector.h     |  5 +++
 lib/sbi/sbi_domain.c         | 22 ++++++++++++
 lib/sbi/sbi_domain_context.c | 42 +++++++++++++++++++++++
 lib/sbi/sbi_fp.c             | 37 ++++++++++++++++++++
 lib/sbi/sbi_vector.c         | 65 +++++++++++++++++++++++++++++-------
 7 files changed, 168 insertions(+), 12 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 882b62c2..8f0bdbb6 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -217,6 +217,10 @@ struct sbi_domain {
 	bool fw_region_inited;
 	/** per-domain wired-IRQ courier state */
 	void *virq_priv;
+    /** per-domain float context state */
+	void *fp_ctx;
+    /** per-domain vector context state */
+    	void *vec_ctx;
 };

 /** The root domain instance */
diff --git a/include/sbi/sbi_fp.h b/include/sbi/sbi_fp.h
index 8079bb3b..6ba04b61 100644
--- a/include/sbi/sbi_fp.h
+++ b/include/sbi/sbi_fp.h
@@ -10,6 +10,9 @@

 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #if defined(__riscv_f) || defined(__riscv_d)

@@ -32,5 +35,7 @@ struct sbi_fp_context { };

 void sbi_fp_save(struct sbi_fp_context *dst);
 void sbi_fp_restore(const struct sbi_fp_context *src);
+int  sbi_fp_domain_init(struct sbi_domain *dom);
+void sbi_fp_domain_exit(struct sbi_domain *dom);

 #endif //__SBI_VECTOR_H__
diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index 4ecfaa0b..345be3bf 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -10,6 +10,9 @@
 #define __SBI_VECTOR_H__

 #include <sbi/sbi_types.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB

@@ -25,6 +28,8 @@ struct sbi_vector_context {

 void sbi_vector_save(struct sbi_vector_context *dst);
 void sbi_vector_restore(const struct sbi_vector_context *src);
+int  sbi_vector_domain_init(struct sbi_domain *dom);
+void sbi_vector_domain_exit(struct sbi_domain *dom);

 #endif //__SBI_VECTOR_H__

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 498a1d56..cdc416b4 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -19,6 +19,8 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_virq.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>

 SBI_LIST_HEAD(domain_list);

@@ -703,6 +705,26 @@ int sbi_domain_register(struct sbi_domain *dom,
 		return rc;
 	}

+	/* Init per-domain floating context */
+	rc = sbi_fp_domain_init(dom);
+	if (rc) {
+		sbi_printf("%s: fp init failed for %s (error %d)\n",
+				__func__, dom->name, rc);
+		sbi_list_del(&dom->node);
+		return rc;
+	}
+
+#ifdef __riscv_v
+    /* Init per-domain vector context */
+	rc = sbi_vector_domain_init(dom);
+	if (rc) {
+		sbi_printf("%s: vec init failed for %s (error %d)\n",
+				__func__, dom->name, rc);
+		sbi_list_del(&dom->node);
+		return rc;
+	}
+#endif
+
 	return 0;
 }

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990..fb843a91 100644
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
@@ -143,6 +146,37 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);

+    /* Read current mstatus */
+    unsigned long mstatus = csr_read(CSR_MSTATUS);
+    unsigned long new_mstatus = mstatus;
+
+    /* Ensure FS is enabled (not Off) */
+    if ((mstatus & MSTATUS_FS) == 0)
+        new_mstatus |= MSTATUS_FS;
+
+#ifdef __riscv_v
+    /* Ensure VS is enabled (not Off) */
+    if ((mstatus & MSTATUS_VS) == 0)
+        new_mstatus |= MSTATUS_VS;
+#endif
+
+    /* Update mstatus only if needed */
+    if (new_mstatus != mstatus)
+    csr_write(CSR_MSTATUS, new_mstatus);
+
+    /* Save current domain context and restore target domain's F and V context */
+    sbi_fp_save(current_dom->fp_ctx);
+    sbi_fp_restore(target_dom->fp_ctx);
+#ifdef __riscv_v
+    sbi_vector_save(current_dom->vec_ctx);
+    sbi_vector_restore(target_dom->vec_ctx);
+#endif
+
+    /* Restore original mstatus if we modified it */
+    if (new_mstatus != mstatus) {
+        csr_write(CSR_MSTATUS, mstatus);
+    }
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
@@ -286,5 +320,13 @@ int sbi_domain_context_init(void)

 void sbi_domain_context_deinit(void)
 {
+    struct sbi_domain *dom;
+    sbi_domain_for_each(dom) {
+#ifdef __riscv_v
+        sbi_vector_domain_exit(dom);
+#endif
+        sbi_fp_domain_exit(dom);
+    }
+
 	sbi_domain_unregister_data(&dcpriv);
 }
diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
index 5d72b72e..37acb07c 100644
--- a/lib/sbi/sbi_fp.c
+++ b/lib/sbi/sbi_fp.c
@@ -7,6 +7,7 @@
  */

 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_fp.h>

@@ -185,7 +186,43 @@ void sbi_fp_restore(const struct sbi_fp_context *src)

 	csr_write(CSR_FCSR, src->fcsr);
 }
+
+int sbi_fp_domain_init(struct sbi_domain *dom)
+{
+    if (!dom)
+        return SBI_EINVAL;
+
+    if (dom->fp_ctx)
+        return SBI_OK;
+
+   sbi_printf("[FPU] Init FP Context \n");
+
+   struct sbi_fp_context *fp;
+   fp = sbi_zalloc(sizeof(*fp));
+   if (!fp)
+       return SBI_ENOMEM;
+
+   dom->fp_ctx = fp;
+
+   return SBI_OK;
+}
+
+void sbi_fp_domain_exit(struct sbi_domain *dom)
+{
+   if (!dom || !dom->fp_ctx)
+        return;
+
+   sbi_free(dom->fp_ctx);
+   dom->fp_ctx = NULL;
+}
+
 #else
+
 void sbi_fp_save(struct sbi_fp_context *dst) {}
 void sbi_fp_restore(const struct sbi_fp_context *src) {}
+int sbi_fp_domain_init(struct sbi_domain *dom)
+{
+	return SBI_OK;
+}
+void sbi_fp_domain_exit(struct sbi_domain *dom) {}
 #endif // FP present
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index 5a3f34d7..959566c1 100644
--- a/lib/sbi/sbi_vector.c
+++ b/lib/sbi/sbi_vector.c
@@ -12,21 +12,23 @@
 #include <sbi/sbi_vector.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_heap.h>

 #ifdef OPENSBI_CC_SUPPORT_VECTOR
+#define VLEN_MAX 65536

 static inline void vsetvl(ulong vl, ulong vtype)
 {
-    ulong tmp;
-
-    asm volatile(
-	".option push\n\t"
-	".option arch, +v\n\t"
-	"vsetvl %0, %1, %2\n\t"
-	".option pop\n\t"
-	: "=r"(tmp)
-	: "r"(vl), "r"(vtype)
-	: "memory");
+	ulong tmp;
+
+	asm volatile(
+		".option push\n\t"
+		".option arch, +v\n\t"
+		"vsetvl %0, %1, %2\n\t"
+		".option pop\n\t"
+		: "=r"(tmp)
+		: "r"(vl), "r"(vtype)
+		: "memory");
 }

 static inline unsigned long vector_vlenb(void)
@@ -64,7 +66,7 @@ void sbi_vector_save(struct sbi_vector_context *dst)

 	/* Step 1: Save CSRs */
 	READ_CSR(dst->vtype,  vtype);
-	READ_CSR(dst->vl,     vl);
+	READ_CSR(dst->vl,	  vl);
 	READ_CSR(dst->vcsr,   vcsr);
 	READ_CSR(dst->vstart, vstart);

@@ -194,12 +196,41 @@ void sbi_vector_restore(const struct sbi_vector_context *src)

 	/* Restore CSRs first */
 	WRITE_CSR(vtype,  src->vtype);
-	WRITE_CSR(vl,     src->vl);
+	WRITE_CSR(vl,	  src->vl);
 	WRITE_CSR(vcsr,   src->vcsr);
 	WRITE_CSR(vstart, src->vstart);
 #undef WRITE_CSR
 }

+int sbi_vector_domain_init(struct sbi_domain *dom)
+{
+	if (!dom)
+		return SBI_EINVAL;
+
+	if (dom->vec_ctx)
+		return SBI_OK;
+
+	sbi_printf("[Vector] Init Vector Context \n");
+
+	struct sbi_vector_context *v;
+	v = sbi_zalloc(sizeof(*v));
+	if (!v)
+		return SBI_ENOMEM;
+
+	dom->vec_ctx = v;
+
+	return SBI_OK;
+}
+
+void sbi_vector_domain_exit(struct sbi_domain *dom)
+{
+	if (!dom || !dom->vec_ctx)
+		return;
+
+	sbi_free(dom->vec_ctx);
+	dom->vec_ctx = NULL;
+}
+
 #else

 void sbi_vector_save(struct sbi_vector_context *dst)
@@ -212,4 +243,14 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
 	return;
 }

+int sbi_vector_domain_init(struct sbi_domain *dom)
+{
+	return SBI_OK;
+}
+
+void sbi_vector_domain_exit
+{
+	return;
+}
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */
+
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
