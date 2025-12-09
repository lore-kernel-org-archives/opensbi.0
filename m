Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC3D3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6ftR7mvr7lwNlokhcjgfAhqsW0OW/fK75mfBKvDzdQ=; b=IrhrXpv+kpQzWy
	teWh9CGzMGiSiVQzSvtgHqG9fl0W46Yn/roAjWWy7JgiqK4hLTX+2QrHYT/HkA83nWIloiqw7gRvk
	7oQfVVlHXCpyLNXLw8quYB02i8b5aPUOJZuP9CmFK7ADIDBRXCuMdGPGAomPIF3nRzuSOhU9ORQnX
	AJX2DdXLjeuH8XtojJN6MqEKBG/Jco/xWr+rGPK4yqhXdGWk+S41zgNNd/BBXwRqML3l/hKGxqRkk
	pzxFUpnIWlVmAWZbn5klKAQ0l2BfKD8BbNdicBuxKSr20uH0KSQrFxCkt30Gax1Nys97Jw2Z2WxvS
	BABVdikfr44UrThVtvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy9A-0000000ELYN-3yXT;
	Tue, 09 Dec 2025 13:52:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy98-0000000ELXs-32fp
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:52:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-349ff18445aso1798804a91.3
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288374; x=1765893174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnazCmWnlIeB+/6Bc/UOVFGKA1OZP/DN5+kgJSrLIqk=;
        b=C8TKFzWATu7GL23FdQiMrDHNVtpwBFE6N7VVT34846eMALNMC7JNuhrxE/QRRCXUEx
         n9GC2Sk/G7/ICXbT9Sv6dw0mwE4NdKUXsmgvHY6S5nTHvilIVRqDGlyncqQNFEDTKfru
         5PIWPioIVBmng/XzXjKUXni+kjeChP0eYduY8vFDAMZSWLQTd37ZWDZWFqF9N1XFz5pf
         PxJTU9AgdDBC41xQChw2GXzUCjbgQDxruvG+7MfEOGSYxk8ZuCH6bRVRA+CL7OIy3+Us
         uXftegUogt7Ks0X2HdM+I/TYhLdjYxfW0OZzI8OvZN+itZq2DQi2QzhB6wtnyV7mZYny
         6YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288374; x=1765893174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnazCmWnlIeB+/6Bc/UOVFGKA1OZP/DN5+kgJSrLIqk=;
        b=BSMCRn+c09UhaZkqNQ+NPVuOd9c/cj64G0XzOG8u3wIJ5GYOZModq3DS0dPqQwM8Xn
         Wx+SD28zDK3isUT0/j3SwS/uWIHcKVh46SoQBGmhOekmg2rTl5T0LHGlZ3t9dwkv6kNt
         M++wg6UKrNWFavUIh7Jo5vradBUKp4kEwLJcgju0PSM5VSYanz8PCP4pg2GlYj4Cfkp9
         HBGwS0xQT5a2Ndbrj2mhx6cywOHWT6iVlWAOt1ePxuCVdb88L0i2wbzh2IBqFnBXMuvv
         ZNRQTrkcfW5OEGexD4dklrJhVPr9Vcwo5m3HVk0NHKnui765VErplzGvlGaGaGpt/RnS
         2Zpw==
X-Forwarded-Encrypted: i=1; AJvYcCWG2GOlE2fK23lzKMzLn0t/EFiamMdYm9wh+9ImfzDJWdJS0+oxXj22bENuaVIsuzqFFj3h1wG8@lists.infradead.org
X-Gm-Message-State: AOJu0YwqlBeMIQB4ps23zPTHMv6J5I0KFO55pWMohr24ziqHo5/x9llx
	4EdjO3yuyx02C2QDpUKADKSEAq1wk4FDH8ZDEyiT7EoviJ1h2WmdizOSfYuZRl2YN6g=
X-Gm-Gg: AY/fxX7jOnY+GZZLJeBGLKY/cyfaglQQD+B6UkYYgHyJ+C5WmXSyz82nQ7SJoxRyZtK
	HlelmPmnN2J8+A3akSJAoJMud5D9Hg0ToPLRVN/EP49Y0sVfIIs0+/Lr22nzP221i64dzMVcEpd
	KWQvIbHk3mzGQcQ+ItNlHDY8NciJhwViGCyX/KHhgzCRwYfjhQFOei8344wStb7PGlSYXa7o6JZ
	rwaGfVfLjkGMTOxaxID260a9T5szX/LARtPcAaG8Q7s6IZXy5G5n3zVQw8lPHYQLRlBMh1iJYgu
	bUJeRZ/SEFyqhk+TgTlGq51i5L57STBDfUGcB97ME6DCzjGXVUJTth3m4NZCLI89Aa+iK5sde8w
	VHwodQiol9kmUeQbTBEm5fcVTXhbXuEH+GTjIGs5pQeKqAcFvVre0/zQznekRTNB1mNIxEYxhmQ
	AfVqx+d5wKwNZrUCO1OMlmvBbNYo1fxGHJXOV1uBTtwpFc4ULl
X-Google-Smtp-Source: AGHT+IGgUaAymBUzWqeqR2sCSjZ3EeLCBnSInLqWxXPwmWBYaNjR6SMphxsnNa/UyXGTMj1Nemg1Lg==
X-Received: by 2002:a17:90a:d902:b0:343:6108:1712 with SMTP id 98e67ed59e1d1-349a25fb8e1mr7342552a91.18.1765288373878;
        Tue, 09 Dec 2025 05:52:53 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:52:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/5] lib: sbi: Introduce sbi_hart_pmp_unconfigure() function
Date: Tue,  9 Dec 2025 19:22:31 +0530
Message-ID: <20251209135235.423391-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
References: <20251209135235.423391-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055254_768235_C8B4408A 
X-CRM114-Status: GOOD (  12.98  )
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

Currently, the unconfiguring PMP is implemented directly inside
switch_to_next_domain_context() whereas rest of the PMP programming
is done via functions implemented in sbi_hart.c.

Introduce a separate sbi_hart_pmp_unconfigure() function so that
all PMP programming is in one place.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h       |  1 +
 lib/sbi/sbi_domain_context.c | 10 +---------
 lib/sbi/sbi_hart.c           | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index c51b0689..d313527a 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -150,6 +150,7 @@ unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index a66438e4..adfd271b 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -104,7 +104,6 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
 		return SBI_EINVAL;
@@ -123,14 +122,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	spin_unlock(&target_dom->assigned_harts_lock);
 
 	/* Reconfigure PMP settings for the new domain */
-	for (int i = 0; i < pmp_count; i++) {
-		/* Don't revoke firmware access permissions */
-		if (sbi_hart_smepmp_is_fw_region(i))
-			continue;
-
-		sbi_platform_pmp_disable(sbi_platform_thishart_ptr(), i);
-		pmp_disable(i);
-	}
+	sbi_hart_pmp_unconfigure(scratch);
 	sbi_hart_pmp_configure(scratch);
 
 	/* Save current CSR context and restore target domain's CSR context */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 295a6783..4ec7a611 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -578,6 +578,20 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 	return rc;
 }
 
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch)
+{
+	int i, pmp_count = sbi_hart_pmp_count(scratch);
+
+	for (i = 0; i < pmp_count; i++) {
+		/* Don't revoke firmware access permissions */
+		if (sbi_hart_smepmp_is_fw_region(i))
+			continue;
+
+		sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
+		pmp_disable(i);
+	}
+}
+
 int sbi_hart_priv_version(struct sbi_scratch *scratch)
 {
 	struct sbi_hart_features *hfeatures =
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
