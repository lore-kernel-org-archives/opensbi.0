Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56402CDE008
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bT1JDUuXxSVF1oQwPF9pPvk8pzwLB5bu9ksnKM0bjb8=; b=htrqARrfiTz07v
	Br2NNJCpKfT308ZmlP8f6V4n6OmzXfVEsL9kk5lGYmG+i0aaxeGtabmLZnHseYIZRMO550WaTfIRp
	cb/uqDapLkinSqshg/oXn4gPyhUq+sBJ4NwhN9zK/a51F4HsrtfejOcgzOO8lXgBEeYtW89hap8dE
	aNfdhcs7kszKMhancwOfOljoNQFjg1W7yFqqJKXKOej9zg3q1MfP0c1KWGHEZ/lNTgwAGnOV2opMt
	wurlSVVFK5wz0z+O+kDGqwxNv4ma+3JYnTNmjoK55G1Xg4ZgbVUR4sZUoGxhr14tKGgG4R67tQQ4K
	FsLMiaLE9DWn6rk7otnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cb-0000000B4nf-2Kqn;
	Fri, 26 Jun 2026 10:17:17 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cU-0000000B4g1-0nQU
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c8d00e782d3so320117a12.0
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469029; x=1783073829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBhHO4hmm7Y4BntAadWXHiyLCLAsgAHxQbqY0i0a9XQ=;
        b=bsKLmeRzOs7rsiuGKg7SQciFrYZQDbKDpJ5qnWEbO2apQKoxpENq77NAjOwLJyPFnV
         3wXhrzvHp2i2w+Op1+topkNUP7P1IezjVIUZFrgJP3NyT/S5mCQTOwW/BU62HibQksZn
         FwtJQFRe+IPhkmWIew05LURyn1csOQ4cE4hQq3W3Z/k6wUB6hKsrhj4f/bleM88gJ+82
         C2BA2cveAbEM4f95HWGdPBi8oF088N6Wjyuza8D5VOL+8QK+EbTzP10rFjIKaIK78NxK
         sqNk71V8a+XQ6pigA038qMxs2495QcRX5oEHs4y+09ZvaTBVuytbIT4j5AaAm/CWXv0k
         6NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469029; x=1783073829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBhHO4hmm7Y4BntAadWXHiyLCLAsgAHxQbqY0i0a9XQ=;
        b=QNG3fg334hwOlxNyZ7ApfKKPsIqOqaUL+8PlJQj0RMFMJwNS+ZziJ1HXg8aFXF9YPF
         pWJfyNHl+l2dIBVRB/KOWD4wJVhQvinpn5TYtnWT7wmsHjgCxf1ERm9rDMtnjKNKYyjo
         VQODqI8wj7vcGeAJMjkrAzduyHtDdLIGFUgBSsD19xWQx9v/gZl06g11voPiW9FgbGlr
         kgkaAF6oi0ou62c0PCpRXo9/BKr+mn0Hkd5Gh7mwp/QqLX70oS1gPVqhxGYgwf5dYEGD
         Eig6v3S8WcI9rDhd7PBFpZERRdJ9+MbvhxgYQ02t1ZjGwy+lYvIvEOVFr80/MIK6H5b5
         vRyQ==
X-Gm-Message-State: AOJu0Yz3htwuIwJ8LxgtvYwb1C3P7FUoEUNUEg2Tmjat6mH/kZwzYV5D
	ulBHDrHzkugYBGRi3d5tFUKAdjnWtOIJyTeVwNSV7e4/uZsAsPUb3e8gtM1PyjfNuRIl7uARCF8
	xvElRSZ2NSqAIK+dTJQZl99ahrDHaYlwHwAs6ZZzxsXov41u+NIittiv3vF3cuX2ij2qE1M0ko0
	bdulXV4VsydRLtRQ0eman17z46fZMe1jJqJU5I0T4Zxz6WlhJMwV4=
X-Gm-Gg: AfdE7cmalGs87J4fY85aJx72SU6IXgqBlScu9whiWD6vQStORX+iNIsTSDJ+JIhIk+H
	binAxb5yrOAtzp0BH7MZ/Qo5FqWAqPFecMUfsp613GCKVvM84Q6laIUGeW5k6WEDqguVVvaozP/
	g8A8/PJYalinHsGunGZRkkWxAD4Asc0xMxqVo0dTh/1oY66x3/sJMossNXnAjYdiihJ2Q2gBDzD
	loVEWStrIRWTJJ2gwJMGFv9ELPOk76E3Xg9K/tt1KtMJaBbgOCQRav6FDAD+rtOVyWAjHwxjScD
	bJhmGKtB7lVPvR8adkVXFyrk9xYHaewoWvLEXLS/tbnnTRWde0XduczXZACGXZ/J4z7FJBLy4RS
	eJjXgcZOwSbd6iImBsaZjZecfWu39IQ9J/YBxIFwKV81ZzM/V1KyawwnJE3TOvaRH4xzppVRKLg
	Nh+d8yUeCHR30cT387rd5BU3qWY4tqJYQ5DdrD
X-Received: by 2002:a05:6a00:2396:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-845cf73e86amr488433b3a.14.1782469029127;
        Fri, 26 Jun 2026 03:17:09 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:17:08 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 11/12] lib: sbi_domain: add Worlds CSR config on domain entry
Date: Fri, 26 Jun 2026 18:14:32 +0800
Message-ID: <20260626101433.3133466-12-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031710_241765_86171DB3 
X-CRM114-Status: GOOD (  10.32  )
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

Add sbi_domain_worlds_enter() to configure mlwid and mwiddeleg
CSRs when entering a domain. Called during domain context switches,
hart start, and hart resume. Ensures proper World ID isolation
across domain boundaries.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h     |  3 +++
 lib/sbi/sbi_domain.c         | 24 ++++++++++++++++++++++++
 lib/sbi/sbi_domain_context.c |  3 +++
 lib/sbi/sbi_hsm.c            |  4 ++++
 4 files changed, 34 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 7d523493..b54bd952 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -331,6 +331,9 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix);
 /** Dump all domain details on the console */
 void sbi_domain_dump_all(const char *suffix);
 
+/** Apply Worlds CSR state */
+void sbi_domain_worlds_enter(const struct sbi_domain *dom);
+
 /**
  * Register a new domain
  * @param dom pointer to domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 443aa60b..c0c9b315 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -93,6 +93,30 @@ int sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 	return ret;
 }
 
+void sbi_domain_worlds_enter(const struct sbi_domain *dom)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_hart_features *hf;
+	unsigned long mlwid_val;
+
+	if (!dom || !scratch)
+		return;
+
+	hf = sbi_hart_features_ptr(scratch);
+	if (!hf) {
+		sbi_panic("%s: hart%u features not initialized\n",
+			  __func__, current_hartid());
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) {
+		mlwid_val = (dom->has_next_wid) ? dom->next_wid : hf->pmwid;
+		csr_write(CSR_MLWID, mlwid_val);
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
+		csr_write(CSR_MWIDDELEG, dom->next_widlist);
+}
+
 void sbi_domain_memregion_init(unsigned long addr,
 				unsigned long size,
 				unsigned long flags,
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index cc4cc04d..1fb05c07 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -174,6 +174,9 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	sbi_hart_protection_unconfigure(scratch);
 	sbi_hart_protection_configure(scratch);
 
+	/* Apply target domain's Worlds state */
+	sbi_domain_worlds_enter(dom_ctx->dom);
+
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..82856da6 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -154,6 +154,8 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	next_mode = scratch->next_mode;
 	hsm_start_ticket_release(hdata);
 
+	sbi_domain_worlds_enter(sbi_domain_thishart_ptr());
+
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
@@ -478,6 +480,8 @@ void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
 	 */
 	__sbi_hsm_suspend_non_ret_restore(scratch);
 
+	sbi_domain_worlds_enter(sbi_domain_thishart_ptr());
+
 	sbi_hart_switch_mode(hartid, scratch->next_arg1,
 			     scratch->next_addr,
 			     scratch->next_mode, false);
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
