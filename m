Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAEBF46C76
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRS/Bit5mmBB90HVEwVm9NUgXZlsniiS5TYHYol/1cI=; b=cFu5RJ85PtcQz+
	ftvouszBQnafmUyRJHYoP0oyl8M5/hFyogVGXjdtwJd2W6rgEsVEcmzk8VoDiDoLaiPIJTn8Cl3xw
	Y/WpOBoOdiX/QBoCw0PMq9O8Dx7jQaT1X+ptP1E+6cGfhfLIq5uNV3BSPyE9rEzAlIYiaT/KZWnpB
	/12FBRqi3qtEwwGrYZgkpiUR10MI5vHYo99bXfsVikjpfUH62e/L/icmG6R3OiTuqqbehd5/jIX0f
	SSNLnVi+3kJafxsiAXJcscynwQ+RN/7G4ABznlLhfGdCAIEGnN6ynRNT7FSkkv4azhqe+o3yPtFDs
	hOk9X0lOs3CkgnaBl52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfk-00000005SNw-2wYQ;
	Mon, 06 Apr 2026 19:31:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfi-00000005SMf-1d3o
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 19:31:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso42287955e9.2
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775503900; x=1776108700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCvcUnvQejUJ4kPxuKA4oq02jilNCVtJbVkINVNE4NA=;
        b=kl9hyaVIxeIahLVCWEdUhb0fxN64zpQgqNRvulMFOaCZRPbvGcqB01JvDlSU7B8lqp
         GSQ/KYwcFJBYHSvBsVjjCF4n3OpzPT0ytIJCFHCJrnFIWY9/CnCrYShwfIi2hJaUx7tV
         BD9v9DnnaezKuAla15x0QKIq5nSz+OrcGP17JW60FXF8+WZORwcwmM4MPBRFmOnYLxL3
         eqCYGlwDb5ZlHc2kEfx9xSz3g0rztlOC7yhasRTMdL7F6cPVssOhymZrVbHhEa9y+8xy
         r10sQjWZX+otvQHm7QVkIEeapaL1ghq5uGBOlhE1nWeaVE3Li4rG55hm86ps7tFVWB7Q
         9IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503900; x=1776108700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCvcUnvQejUJ4kPxuKA4oq02jilNCVtJbVkINVNE4NA=;
        b=n7P8LxaAS+CQEwd7STyo1bFjg1N9OLA4Whpt565/yOMzekrf4RT9D66AmJR326QEXG
         ouhkAd0Mp/0z+56naRQ187YkHl+OcgzsgEFQqKTe/hBdQ4ZoRTAUvIv1/NK/bjvziIPf
         zMOeTsWJvfYTEOTESI+0claAsZ9o2ywGMPzgFgam8NA3Rcjr2b2I32RgexB2FEJBzD/8
         3UZy+i7ydObTDOmS6IXtpwGyC5m2/9tDbcyUGiIS7Htz9gjzOyb01iQ9WwqlyBKDIqlH
         2+XSs3KvqscjhN8CbCThT7ror1rCj+6l/xEuJkpYSZ+gESSGSjlnU8uZVAxsVmk5cfaG
         zaXw==
X-Forwarded-Encrypted: i=1; AJvYcCWOL6jo/iP+39mpFW+cNIJr1GukfoQBK5bA3APzUZIsbXHg41T37+1nGO0j8xxxMjquL+sAgU9p@lists.infradead.org
X-Gm-Message-State: AOJu0YzXMp5Boo5EbErOGkk4d5Dh322+NAU5JdGEjongH7HtvqG7s8q9
	8EGvGwA/U2RUMWnz1cTwJigu9TBqjiJt8ZI4eYPSfOc7YiqNeVYV9yhMOdNstN+tFAA=
X-Gm-Gg: AeBDiet1s6xsn7iHuWmgrg2buOdGyebaaQeGjGuMaMjriQmm3AXkjtDrxcPnI8OmPVQ
	VSIwb2m+JFqaAOPEpNzxM4oR9yz6g5wBDBFfWbaBdTQOjw8IZy1hJt7cmZuyQVIw40gVRuL8+ml
	9ElEKL02bOpzJSvwzGSQ6Tb1S55l5W++3krhrl0Xf/ZQIJLuOm9Sdv7a7RetbrkoqXrLdlGKao+
	4a/0AJk1cRWcG9C0g+pLmNG3mVVIy3BQM4n02M/tx/lt/TyZCoegv8aTHBqWwPhvYo6spDnVja7
	5ka7lqYbivXomBDnwJU3wZHKDiDj3O/JXb+Nyv7Wk8rncxGW+94Uq/hcmAbgKfVoCmO714QFE1u
	WvPvK/hR2ICzNUVXFFvX0VTrnLZEGtL8Y0vTq1Cq58t1IGNdUQIzND0JLBKRmTAKGY5RH1Z/mkM
	dvhgESPUR4MCtzFPoarCSgVnTG0xzdKIhodNdw+yVwl4ajZ/pHjNPj34eZkJgTmlgnnP0=
X-Received: by 2002:a05:600c:3b1b:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488996a3560mr191109085e9.4.1775503900288;
        Mon, 06 Apr 2026 12:31:40 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm511130155e9.7.2026.04.06.12.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:31:39 -0700 (PDT)
From: dave.patel@riscstar.com
To: radim.krcmar@oss.qualcomm.com,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Mon,  6 Apr 2026 20:31:33 +0100
Message-ID: <20260406193133.658066-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406193133.658066-1-dave.patel@riscstar.com>
References: <20260406193133.658066-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_123142_452181_1D54CE40 
X-CRM114-Status: GOOD (  14.23  )
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
- Added runtime checks for FP and vector extensions where needed.

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_domain.h     |  6 ++++++
 lib/sbi/sbi_domain.c         |  6 ++++++
 lib/sbi/sbi_domain_context.c | 12 ++++++++++++
 3 files changed, 24 insertions(+)

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
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
