Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73222FD5F85
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 07:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRS/Bit5mmBB90HVEwVm9NUgXZlsniiS5TYHYol/1cI=; b=ja1awKva2f0qwo
	domq80QiLLkawarnELamXJHGLktRPUyVMHkE/7l+OGOafOmkJvH4I4xTii9JfJ6KEybhGOzY9MyDf
	cCeiLIfOkWyN/oaB8V5urZp4rbzaHE2JLgaPO0RS+L7PS9+ubi9O8AtIusWW2dYsn6+6moe6NaZIQ
	YykEGyJkjEqGfWJUEG95sRrCP2x++SQM6xTmHCk+eqfd8A9u+TNcEGB+vHFZmjhFjVs5xK1Am6HuT
	g2e+M2VwgWcpNyzzgYJmj7pTcwT2GJOZZ09Ks3u1QIvQDlH4xPfJ/r3WJ9+7+DNf3pEMzz2xaUhSf
	E2XIb6rdv2ah4DB5BsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFU-00000008PpM-1hqH;
	Wed, 08 Apr 2026 07:22:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANFQ-00000008PmP-3hD1
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 07:22:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so23965855e9.0
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775632967; x=1776237767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCvcUnvQejUJ4kPxuKA4oq02jilNCVtJbVkINVNE4NA=;
        b=j7gXJiy5rdUmIn33cTNnw79//0vqZjD/YUyHylZOXf6t+/neYTZBpcFFe2ONXL/YIU
         U1e4164sYFwAevruwI8Tt+7wrqBEVHiEKHi/WDccWSIiQooU5tSqNJB8ViPLBXUZNY8B
         fcAONT40N0J5ipdIZykOKykn095EKLZhE/OI7nK+KiLLjFDgSe1LgWBStmBq5O2vymu4
         kMCf9JXNHIeiO25cJbuELIUjXMNxmLNNBO/YkhLeHHfqntsoWBx7eKD9gGuNXUa7Bleb
         Fs+grG7gMt+DugmYwqQb0uOoZa99NGIp4N7T1BQ5boejbhXtZhQ51PPINL2Wve4344k4
         m/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632967; x=1776237767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCvcUnvQejUJ4kPxuKA4oq02jilNCVtJbVkINVNE4NA=;
        b=dUUc1QlPi8jShusUt2rqNDCsUgLPzo3MF5vGuXN/mjwQ1wpP5Ukde0ora6Bi2Ow0dx
         XkTWGBQYAkI/lX+FTjcaWjqlQOEcjRB+h/1gksvcJXIt20bZF43jdj7hF17ofnHhuJib
         zlvhygrM8N0Q0j7DM5gDODabwKcHy/HjnM4XdBnrBljB8csisLeYuTPKGzvqkiYveU5e
         HT+DxqXV79QEbmnQk7nPHS+oEnTgg/1K5BtRHlS6l+BlLzKztNvDSpkad6Cp8CEiwNVx
         g1furFvLxoLaf2wEClcV0TDkYCd3TOBV4m9PnjU6MzVZ4mORMWxV0Ud4vuGvydsMjan2
         cbog==
X-Forwarded-Encrypted: i=1; AJvYcCX0PUzJAFvC4YkKw53fLuxgrNVbTkPJ9Y0wvQnK9o+ZiM/vlPcpeSRkfyXkyhZt8gUCjmc5S8pC@lists.infradead.org
X-Gm-Message-State: AOJu0YyGFs/udYPLT/ddez816X1+ZcwbRylCk0YgnW6L/8NMQp2pE3O3
	err3fSAIxuHSI2sN7WGUPxCDM9SC5O3OYA+fizdzTVFNPyTCyxoqwJ8iexH2rakEOOQ=
X-Gm-Gg: AeBDiet/4d5WM3ZQjMB7HtCOAEys9CDBaJeobfEzq/zc4+4rRpfB7z4D4Fxurby1EmU
	940Z52bFfohdGy8sJyZKQ6FFh6m7EMEhmy6BDR2p1D53Ns0ssNtiOp+DCMeg0ZNoVSCU4E3FtCc
	USgexWbVpgF5Zw0JO7QyhzrMKrXLbJZZw31//zViEILolZ6fP+XSrxz5xpmZO0gx43ZPYhEwiRP
	7ny6QFpWfQLcR5HKWb+un4W7GGLlCNScWvl8jv9NuGI4kjMFJx2AdOCaSj7pq7smSsfP0WUwFz5
	MEVmMOaJyJruheKjQmnFhyE5dZa277du5LZ+8Z7kpMKR8f+s44gZpzxs1TShAHkhnQDSL8iohSn
	HJWXcpDjitG27AQc2FBKxvMxDn0l9JXFGHzVxSfidN0eTg5GFomUuFK8ZYXSuf4PnDG9h9Yq/Fa
	hqh1UhR4isEj38/qOZfVVrajNIxwhWK/iNVDxHKucVT6dF+69IvIMUHOghjcc53iCiqp8=
X-Received: by 2002:a05:6000:2303:b0:43c:fb9f:150c with SMTP id ffacd0b85a97d-43d292ecccbmr27941419f8f.43.1775632967033;
        Wed, 08 Apr 2026 00:22:47 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5419sm66188083f8f.11.2026.04.08.00.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:22:46 -0700 (PDT)
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
	opensbi@lists.infradead.org,
	radim.krcmar@oss.qualcomm.com
Subject: [PATCH 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Wed,  8 Apr 2026 08:21:23 +0100
Message-ID: <20260408072123.7543-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408072123.7543-1-dave.patel@riscstar.com>
References: <20260408072123.7543-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_002248_946193_BFF84215 
X-CRM114-Status: GOOD (  14.30  )
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
