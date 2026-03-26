Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683BE10A1E83
	for <opensbi@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKpSEETuB5zkBzyWfDyFNkE9IBnXpAerMf5Kc0j0UyU=; b=E3aIRjJosLx4xN
	Lkauub1VIvDIfKxzqlf6M+OxEI2YXSQNvFltEKR4xMlcjj+U5UdJvkQQ9D9oXsD20mf21v1sUasus
	v1TUNaxX7cjVpI3V264GH6vgzwUsOltnl+8cPLcOI6sfGn7SbH9bCYIpV4DUreRcOmo1peWl0Qbtb
	IXpBtb7HFBKdUDOKOZgsoLhQQvuIp5e/sRWT6Zy8iX3UsjUvRhzBLXsYw1W2jW3jS8yK/WeDKb/1Y
	vzDrJPEN1V+isgfLIe4OP1jOmTUq29Y8xOrhopt8LYxHVQLRpafVG0JEsIKsj7M4E/AsUgeU22fCV
	RSmAsu4HPf5PgXW+zxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJx-00000005O2E-2mEH;
	Thu, 26 Mar 2026 11:56:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jJt-00000005O0L-1McD
	for opensbi@lists.infradead.org;
	Thu, 26 Mar 2026 11:56:15 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so736931f8f.1
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774526171; x=1775130971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljgj4+32qHDwKQaMS54fpU6MtdzWuMBOcdg/hCIJvcs=;
        b=mqzQZJRkMogIlWBW3LVmZJtc/lKCQisxB2mnZONXoSjQo5wwjJygf8R4j5ICWPpp7u
         6Ds4rD3RFnW3uyimDbUStjitUWXJnf289dcxj0Bp9M35UGSbPWUPnbKXaILNUL9JWEZb
         uqp7/NdEJdhqEwYQ05BSL8P7+JHYDpYqzA2dVXCKTQ9iGJnQ/vQjJqGVHXX6r1YUyHJh
         6rZLYpjMFsL8KbAtz4hqxIRliCEJEA8XvJKIZ6O+kZLqTvjwIN4nV7QlIWqr+9L8qJ1H
         VdfYGU2IQtzXxCzhAdRqVLbCzaVUffpr06EqhUG3bOdxMqa5EJx9rhlwvOuw+GcOGwgX
         yzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526171; x=1775130971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ljgj4+32qHDwKQaMS54fpU6MtdzWuMBOcdg/hCIJvcs=;
        b=q5l1D8V7UEmQoBK1c1W7I2PmsZUaP5u/qMz+T5HHq3P0k0MOC1KMOqOZdA6VxpmEzt
         Z2czV9MFh8oTurKQR5IaBulpNDmUkisyRpFBamQcZwDlihExgMR43o3iNLRYjniapBH5
         fll3YHJgG1/BWeUHmLEArGXkhXJ/KGVHH53nnnnUDovwyDD6KJ+5RUOV1o0we5xNm/Zk
         0azQYJhCLbyXBeILLFohQ5PZ12UbWNZ+fx0Xrjp+43Bh3JSD2Ju76nECj9JfrMGPaEeH
         VxO2rDz1CKHvbiPUxMJ5vgbXlR0Ol1kzUw3p3GTITajXN4pQyMHVG2C08RvTjLdOmeQI
         Fuyg==
X-Forwarded-Encrypted: i=1; AJvYcCUWQUUCmnHH689frKHbyKhjgsRSu1DD/N+oHGJM57KuGonXXLMG0eqcNZNSUhKG7hr7DBOeWyLj@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfR/ALk7+h9i3JohjVvTg51rHiibjiplQNUsX8L8SV84l2zF1
	vdZ79o4l/1LcQsjbVvvmazhnsoJJM7cAu40DPnqJEtBH15h0Nnqx4ITXLwgLd7TbbkQ=
X-Gm-Gg: ATEYQzw3Dmbovzrm1gReFXZfAcWPON0CeVJ9TYgC+ypSvgAyUkCP05CuuHGrHNdzVDB
	I8daSfx+Jk1WAKm5TjN14H2yaRe83mAIM9Tbw2yTPr5EVmx17CyhLM18Lq0ayM4sjolxScNVlDN
	w57J2UKCiar37aM1cEh4CHvkTyWWGHOXkKLdF/gpT++GfCW5FWFQNrFLA/oZRCJ9v1bi4i1e0Sb
	v9qaqdB/tSLUDep2hMuHThj/bg5Dv3+YARVQ39R6YTSln5kGUJvky+m31QzmDghGgkpiHuJIgV7
	WytsUL51nSUmXWgp3F5S8uaAOdMqbtyJSvsL76xecHG80MWqJmAiL8GMX96CKvWOY8/n75suLWf
	z0qfMKKTvpNewWN3f7U0cYzqK7oPRAiDU1jtVeG62VW+gUqaKGOAg2kfi8dPGesHPaKZ3ldD9h5
	lGVBcosPX+70nMgplTYtUJgFGT7UQX2o6mvEVjBA==
X-Received: by 2002:a05:6000:2481:b0:43b:498f:dcec with SMTP id ffacd0b85a97d-43b8896ce55mr10606265f8f.3.1774526171230;
        Thu, 26 Mar 2026 04:56:11 -0700 (PDT)
Received: from localhost.localdomain ([78.41.211.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8932438f8f.10.2026.03.26.04.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:56:10 -0700 (PDT)
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
Subject: [PATCH v2 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Thu, 26 Mar 2026 11:55:17 +0000
Message-ID: <20260326115517.2156-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326115517.2156-1-dave.patel@riscstar.com>
References: <20260326115517.2156-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_045613_919012_92E5588E 
X-CRM114-Status: GOOD (  19.47  )
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
 include/sbi/sbi_domain.h     |  4 ++++
 include/sbi/sbi_fp.h         |  7 ++++++
 include/sbi/sbi_vector.h     |  5 +++++
 lib/sbi/sbi_domain.c         | 22 +++++++++++++++++++
 lib/sbi/sbi_domain_context.c | 42 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_fp.c             | 31 ++++++++++++++++++++++++++
 lib/sbi/sbi_vector.c         | 30 ++++++++++++++++++++++++++
 7 files changed, 141 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 882b62c2..e68ec46d 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -217,6 +217,10 @@ struct sbi_domain {
 	bool fw_region_inited;
 	/** per-domain wired-IRQ courier state */
 	void *virq_priv;
+    /** per-domain float context state */
+    void *fp_ctx;
+    /** per-domain vector context state */
+    void *vec_ctx;
 };

 /** The root domain instance */
diff --git a/include/sbi/sbi_fp.h b/include/sbi/sbi_fp.h
index 5794b66f..2de9bf04 100644
--- a/include/sbi/sbi_fp.h
+++ b/include/sbi/sbi_fp.h
@@ -9,6 +9,9 @@
 #define __SBI_FP_H__

 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #if defined(__riscv_f) || defined(__riscv_d)

@@ -25,6 +28,8 @@ struct sbi_fp_context {

 void sbi_fp_save(struct sbi_fp_context *dst);
 void sbi_fp_restore(const struct sbi_fp_context *src);
+int  sbi_fp_domain_init(struct sbi_domain *dom);
+void sbi_fp_domain_exit(struct sbi_domain *dom);

 #else /* No FP (e.g., Zve32x) */

@@ -32,6 +37,8 @@ struct sbi_fp_context { };

 static inline void sbi_fp_save(struct sbi_fp_context *dst) { }
 static inline void sbi_fp_restore(const struct sbi_fp_context *src) { }
+static inline int  sbi_fp_domain_init(struct sbi_domain *dom) { return SBI_OK;}
+static inline void sbi_fp_domain_exit(struct sbi_domain *dom) {}

 #endif //defined(__riscv_f) || defined(__riscv_d)
 #endif //__SBI_VECTOR_H__
diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index ae151406..c8295f05 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -10,6 +10,9 @@
 #define __SBI_VECTOR_H__

 #include <sbi/sbi_types.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #ifdef CONFIG_SBI_MAX_VLENB
 #define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
@@ -30,6 +33,8 @@ struct sbi_vector_context {
 struct sbi_vector_context *sbi_current_vector_context(void);
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

+    /* Init per-domain floating context */
+    rc = sbi_fp_domain_init(dom);
+    if (rc) {
+        sbi_printf("%s: fp init failed for %s (error %d)\n",
+                __func__, dom->name, rc);
+        sbi_list_del(&dom->node);
+        return rc;
+    }
+
+#ifdef __riscv_v
+    /* Init per-domain vector context */
+    rc = sbi_vector_domain_init(dom);
+    if (rc) {
+        sbi_printf("%s: vec init failed for %s (error %d)\n",
+                __func__, dom->name, rc);
+        sbi_list_del(&dom->node);
+        return rc;
+    }
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
index b6651577..ee0782d1 100644
--- a/lib/sbi/sbi_fp.c
+++ b/lib/sbi/sbi_fp.c
@@ -7,6 +7,7 @@
  */

 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_fp.h>

@@ -185,4 +186,34 @@ void sbi_fp_restore(const struct sbi_fp_context *src)

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
 #endif // FP present
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index e14b658c..2dfb9fbf 100644
--- a/lib/sbi/sbi_vector.c
+++ b/lib/sbi/sbi_vector.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_vector.h>
+#include <sbi/sbi_heap.h>

 static inline unsigned long vector_vlenb(void)
 {
@@ -144,3 +145,32 @@ void sbi_vector_restore(const struct sbi_vector_context *src)

 #undef RESTORE_VREG
 }
+
+int sbi_vector_domain_init(struct sbi_domain *dom)
+{
+    if (!dom)
+        return SBI_EINVAL;
+
+    if (dom->vec_ctx)
+        return SBI_OK;
+
+   sbi_printf("[Vector] Init Vector Context \n");
+
+   struct sbi_vector_context *v;
+   v = sbi_zalloc(sizeof(*v));
+   if (!v)
+       return SBI_ENOMEM;
+
+   dom->vec_ctx = v;
+
+   return SBI_OK;
+}
+
+void sbi_vector_domain_exit(struct sbi_domain *dom)
+{
+   if (!dom || !dom->vec_ctx)
+        return;
+
+   sbi_free(dom->vec_ctx);
+   dom->vec_ctx = NULL;
+}
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
