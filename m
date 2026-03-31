Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16687FF60D1
	for <opensbi@archiver.kernel.org>; Tue, 31 Mar 2026 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1A8wLf84sNOx3oU/AcQUIi3+hhs7sIaSdynPk/aYhTY=; b=oWBvL3P2sTxjnw
	bmyHZ0OsF7eBdVECgtDfk5iWQ7kD3rUDxYHubURHngIkrLf6cswy9AGoTI+RgCMHgoZ6ZFOZhWRKq
	udILf6g76F9qeJRqQvvvqZyhy3SlV+NE9WcO6NnL8y6tZWk6iwo5GlUrsGqsu3wU7ISzWcukJPy1t
	laKRZkl2k5plcmGPEtlwqpaS45N7ZoLpSbQwXINKPQq8/k7Xn0DFKSu6Z2MYxT2Y2XXicgUxMTGJx
	IyJ8pDSA9f9AhomDOShZbNZHfpTDUD7IGIhexckjq5yT0zot1aYkcVRVFA+ZpPiMEJvdsYHnpF2KP
	iU1JHsEY+FDxrBnXuqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S84-0000000CKac-3msp;
	Tue, 31 Mar 2026 05:59:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S82-0000000CKXV-0iuR
	for opensbi@lists.infradead.org;
	Tue, 31 Mar 2026 05:59:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso52377535e9.3
        for <opensbi@lists.infradead.org>; Mon, 30 Mar 2026 22:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774936744; x=1775541544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRuFnV14/WzgCVyz3RWhMeySJSHvZou2dIvbsxUooMU=;
        b=QX48KUDeOPaZtjzG2XnW7u70Q0Y7Zb8Nhqt/ASigflufzdey+qnulIsfwmb/zv91Ty
         1wIV3mBoADuSvtfy33qPnl6MI7Np5qn7wAb4B6hyhgis/I9ygb0ZF6w3vUgErb3J1s8u
         jP7g2FAUzDopVxfuLgRVvyrz2wNRkE1jrjq9lsPyesjKcpOKOaw414n072ggGmbo+iXP
         g5m3IGh+pLmGEmYRnG4DK19wX7i632vOggH2LLswjsGhOt2dEnfhs0kypQ1wKcJaMYng
         aLxSHlhLORvLZ1LoagQJ9s9V9/A9+xQHzFRskFk+tjf67GZRRmDWdYMJyyWz6gOviozS
         t+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936744; x=1775541544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cRuFnV14/WzgCVyz3RWhMeySJSHvZou2dIvbsxUooMU=;
        b=GtBbB2Fw2/rF11iGX5ZpIE7ZT5G0F/dFs3kXQ278CnWLsQlXMrphB7PFXbYIWnlzfO
         MJcrSIJr9E9Wq3ow6vjf/I0LlNpCdlgz/cXFvk64MnuQBlz0yuBv5izgdLTceWczMSur
         aGonaqU359cak9TNiZ+g1IDCZa5WUd2GvmRXifJXNZxE1cAc90C4VVHXDScFvobOOhkb
         /Uw60si8Ekm9o+t4CLrtt9r8mJ9SThSEfFK+w79eOtmYVjtwqF5yKJTHfXqKt7CxEjq3
         3D+s/JvREhpv9aJ0bRLgUnzxUpP2y7iqZEwlImEsxO0HdGRqYg+4KkGaZFHak9PH4WCq
         /pBw==
X-Forwarded-Encrypted: i=1; AJvYcCVXI+d0Ot4fMAQbviALTY3ckdTa6NcEFdVGg0ImiQSz8jwglBE99sk6GAwXihNK3GzRhnDsl6JD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYElA1D4J8dQq2gkkdUOi2VYdwzvVFupqXmrtObacQH5xDv3La
	BIaVxG2YFEV3+PmxquUaz0Q1cUUsWdeRpvjw4NmX0ySioNyyZZlhdJpaiAdNC73wVOk=
X-Gm-Gg: ATEYQzxkE/0zMZwJqbtMR6RDZZNeEU7wA76DAlxk1WeXqLNT1mP3KqsEWZt9ilGwfCv
	r2mF/KQacneqLC3oiU5+fYXNwr+ci+1vPzqosJfCW6nFmpi9xI0X7or9ieiGpIg3kNrETpucc9I
	amhQV8TACiifXR97YEiN1tiEIm6fc0x6u2Z3yqXJ82IkrwOeB3wnnNZ96l44IHph724meamoYdZ
	wjqB62g+QHUbS9RB0tBM9/obDASEqVhYLQQAYWfwNW+wjH0Fcz/tSrs4mkM5McFSWpBp6nbIB1M
	cw+O6xhZAehVnF9cE5hqLkpCQZ+H5HRKbgDuXP5lz4v3Cj0DhEpWtpUq7MyJFMPUa7vS3J6r2in
	QiU9wtnE3WdhFXmVoiKLnCTUmMd6e3CLzH9us+/OmVWm0vtqQAa1DKP+LmVQe6YG/2KWn+Q5ylN
	9gY+BhEyVJ3V5mLlEmt+M/H4B07N3G+Kr20zqLj0GLmtGyORCewWVi4n2cGYEZobDHZfk=
X-Received: by 2002:a05:600c:6085:b0:487:288:1198 with SMTP id 5b1f17b1804b1-48727eda73cmr249537895e9.22.1774936744136;
        Mon, 30 Mar 2026 22:59:04 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm35915544f8f.0.2026.03.30.22.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:59:03 -0700 (PDT)
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
Date: Tue, 31 Mar 2026 06:58:57 +0100
Message-ID: <20260331055858.305207-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331055858.305207-1-dave.patel@riscstar.com>
References: <20260331055858.305207-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_225906_255137_C55B3ADC 
X-CRM114-Status: GOOD (  19.11  )
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
- Introduced `sbi_vector_domain_init` for vlen check
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
 include/sbi/sbi_domain.h     |  6 +++++
 include/sbi/sbi_fp.h         | 13 +----------
 include/sbi/sbi_vector.h     |  4 ++++
 lib/sbi/sbi_domain.c         |  6 +++++
 lib/sbi/sbi_domain_context.c | 12 ++++++++++
 lib/sbi/sbi_fp.c             |  6 +++++
 lib/sbi/sbi_vector.c         | 43 ++++++++++++++++++++++++++----------
 7 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 882b62c2..318d3a9a 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -16,6 +16,8 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_domain_data.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>

 struct sbi_scratch;

@@ -217,6 +219,10 @@ struct sbi_domain {
 	bool fw_region_inited;
 	/** per-domain wired-IRQ courier state */
 	void *virq_priv;
+	/** per-domain float context state */
+	struct sbi_fp_context fp_ctx;
+	/** per-domain vector context state */
+	struct sbi_vector_context vec_ctx;
 };

 /** The root domain instance */
diff --git a/include/sbi/sbi_fp.h b/include/sbi/sbi_fp.h
index 8079bb3b..962150a3 100644
--- a/include/sbi/sbi_fp.h
+++ b/include/sbi/sbi_fp.h
@@ -8,13 +8,8 @@
 #ifndef __SBI_FP_H__
 #define __SBI_FP_H__

-#include <sbi/riscv_encoding.h>
 #include <sbi/sbi_types.h>

-#if defined(__riscv_f) || defined(__riscv_d)
-
-#include <stdint.h>
-
 struct sbi_fp_context {
 #if __riscv_d
 	uint64_t f[32];
@@ -22,13 +17,7 @@ struct sbi_fp_context {
 	uint32_t f[32];
 #endif
 	uint32_t fcsr;
-} __aligned(16);
-
-#else /* No FP (e.g., Zve32x) */
-
-struct sbi_fp_context { };
-
-#endif //defined(__riscv_f) || defined(__riscv_d)
+};

 void sbi_fp_save(struct sbi_fp_context *dst);
 void sbi_fp_restore(const struct sbi_fp_context *src);
diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index 4ecfaa0b..9ae76b00 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -10,6 +10,9 @@
 #define __SBI_VECTOR_H__

 #include <sbi/sbi_types.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB

@@ -25,6 +28,7 @@ struct sbi_vector_context {

 void sbi_vector_save(struct sbi_vector_context *dst);
 void sbi_vector_restore(const struct sbi_vector_context *src);
+int sbi_vector_domain_init(void);

 #endif //__SBI_VECTOR_H__

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 498a1d56..424204eb 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -19,6 +19,8 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_virq.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>

 SBI_LIST_HEAD(domain_list);

@@ -1007,6 +1009,10 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	if (rc)
 		goto fail_free_root_hmask;

+	rc = sbi_vector_domain_init();
+	if (rc)
+		goto fail_free_root_hmask;
+
 	return 0;

 fail_free_root_hmask:
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990..f646c7d4 100644
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
@@ -143,6 +146,15 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);

+	/* Make sure FS and VS is on before context switch */
+	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);
+
+	/* Eager context switch F and V */
+	sbi_fp_save(&current_dom->fp_ctx);
+	sbi_fp_restore(&target_dom->fp_ctx);
+	sbi_vector_save(&current_dom->vec_ctx);
+	sbi_vector_restore(&target_dom->vec_ctx);
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
index 5d72b72e..9772d359 100644
--- a/lib/sbi/sbi_fp.c
+++ b/lib/sbi/sbi_fp.c
@@ -7,8 +7,11 @@
  */

 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_heap.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_fp.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>

 #if defined(__riscv_f) || defined(__riscv_d)

@@ -185,7 +188,10 @@ void sbi_fp_restore(const struct sbi_fp_context *src)

 	csr_write(CSR_FCSR, src->fcsr);
 }
+
 #else
+
 void sbi_fp_save(struct sbi_fp_context *dst) {}
 void sbi_fp_restore(const struct sbi_fp_context *src) {}
+
 #endif // FP present
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
index 5a3f34d7..5877c373 100644
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

@@ -194,12 +196,24 @@ void sbi_vector_restore(const struct sbi_vector_context *src)

 	/* Restore CSRs first */
 	WRITE_CSR(vtype,  src->vtype);
-	WRITE_CSR(vl,     src->vl);
+	WRITE_CSR(vl,	  src->vl);
 	WRITE_CSR(vcsr,   src->vcsr);
 	WRITE_CSR(vstart, src->vstart);
 #undef WRITE_CSR
 }

+int sbi_vector_domain_init(void)
+{
+	ulong vlenb = vector_vlenb();
+
+	if (vlenb > SBI_MAX_VLENB) {
+		sbi_printf("[Vector ERR:] vlenb range error\n");
+		return SBI_ERR_BAD_RANGE;
+	}
+
+	return SBI_OK;
+}
+
 #else

 void sbi_vector_save(struct sbi_vector_context *dst)
@@ -212,4 +226,9 @@ void sbi_vector_restore(const struct sbi_vector_context *src)
 	return;
 }

+int sbi_vector_domain_init(void)
+{
+	return SBI_OK;
+
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */
+
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
