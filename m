Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9E5D10F59
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MboRfxdXSqMc53mIE/BA9p0FcLEybn03JX5KfqUfe0Q=; b=gGjyg/6Xyisjhm
	JCpxf8cIGVGjUOPofcAb9CIIzthkHebMkOUDk6cPgaGjeSOoWfCBf8YdP5LWK9L1PEn+Gvb8lrlCO
	4TcGGMHgr4+GtLwCZOOnnN2f93jn64G0t3lMkK4V8b0Cpa/b7QR0XAtlMKCMjYMduICJcNta22RFO
	RJCrw/bL1Ph5HYT7DU5TuFbJM5GtrO1sOLj1Ga5u0NqOBjVNpGwkzvfi3BAbgqKKMYso+mcTZAglx
	xdCGJycbTw3haRGQnqcnCxcgRa64+/7XmNHQZJrfrzWb8QqBvc3ly7UVTDdV3hDgucuS7qrOA3+wN
	vw2LhNjhWufLSGSEBD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMH-0000000F5jX-2fTt;
	Wed, 26 Nov 2025 14:19:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGMF-0000000F5j2-0ZZp
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 14:19:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7aad4823079so5999696b3a.0
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764166738; x=1764771538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cFwXfhfp1wCMHESPLdJhiM9PgUZte6lD2l18H52g5M=;
        b=dp0dED1x1e99hK8hav9wGcx7jsdNI0MnNbjRIHYux+UWA4qQexHqSZHtjLHitlHAoi
         NyhP4DX6Y90DimrFwaflkHyfKor90H8TG8VxDyF+P8ET2ZqmQTwftS9VH/O6j+JfACEj
         ToCaRz2Bw5vw4rfKFlxhHSc86hjYp1XL+qFwcK06LmQVYxSxbosdJpkLrskZQHMHLQZv
         qcYRAqY43b0nzoZbWbYJ53WL6fPYUnzTffSxqjrV2/9rWxiKXUT5mNSQ7XMJxRoSDWKq
         qdkZ28QDBi/bW8QVWQ/b5M8P1FqnQK/l6MNO7s5PaRrzJKnCC9GeP2bNNf3GrgNYxeZY
         27hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166738; x=1764771538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cFwXfhfp1wCMHESPLdJhiM9PgUZte6lD2l18H52g5M=;
        b=kCtZOpP2raC+BIjdHLILTXRzrk4VXX4HbyZeOpTtmLUNWcxZqS/Xlq/SPikP5Da3je
         bLdINRvZhjyu3uz4jvewz7675+MWm3ILXe24B79u3/skaGRKPb6tI9V9yUaC8wrY931p
         jeYVpKEXxwbeZYIG0scEzSWIAhWSmtvNNj9FDINs+6qo8/8pbU6pfCQWlDnux9RDmqxL
         AQbJe7wFaZ4kBXOcnQ3WHbnpzEo/MqpHuc8Jj/0cN8sWYjfQOA7leDZx3aLuvnjE7BOJ
         Ooqp1TfuqWdM2SeyGy3nfy1tCAIFyVjcCiz1mDKEhg4p57dLeIWAA5o5A9p0ZfVhuNMm
         B7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU9X3GsUonHYitAA8cdv+x2hDFSddmZ13ExsnMSn0IWq1pzohm68YT4afeK/Txl4BAAIpebZDrn@lists.infradead.org
X-Gm-Message-State: AOJu0YyDDNFLy1l46MQEqfqjDJW6FtN/LV0qfba0E6ZU4wpt7WU+BnJO
	ecBu8jThn7bh1/woKbRcb6slG9/uw5q3zQFLnaCOITmQ9t9rNHK9r8kMnjS/o/HIGkQ=
X-Gm-Gg: ASbGnct/wkJMPV8zizr7zahFKk6oKC1agpdnEYmU2XHFfj/hybo6AB2d+d8J0enTCDE
	ZgefXtX07k21BEbc6R//42sj5oG92exUpZaJICrVaZbA3AN4bdgXPmXT4apZrbyeI7pSTjsaZmb
	7uFpKATDKX+X5/D4t1lG4cMQCLRjLnhkg3sSSkeiARnOGXdxKm6DyK+xbbw9b7j38Ab4TJDkdFX
	ATiuethH4ZFZ1PmXLsn7lhJHiO26wcqCSHgshUm++i1qOP+YmEwCX+qko0zUh0bqdw9LTEZhUqv
	o+w1ytS/peurWBXVYkQf+CiRAX9ALZVhyDm/+f4XqWJAyXLrHRk7iC1Swv+qeCBou5WlUvZOjxf
	IloiNxpjWEQCe9Tpx35a8CalsvH46Wqb4Jav/uXFby4Dwx+J408Ewjdh/o+gZ4XjvTOuyS6k5KW
	y3qllXsg8PoWRdEhFOjUIE8oJ5awXKtcUxvz+Xo4R1f0YoGLQX8g==
X-Google-Smtp-Source: AGHT+IEDvfkYhvalXX0GpOUj40sjIsivFOTaOgAeJGLgHq8tJLbLO4ciUkC4vSewqu2tRVsYAay6Cw==
X-Received: by 2002:a05:7022:ec16:b0:119:e56b:91da with SMTP id a92af1059eb24-11c9d811990mr12679543c88.11.1764166738201;
        Wed, 26 Nov 2025 06:18:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm103679339eec.2.2025.11.26.06.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:18:57 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/5] lib: sbi: Introduce sbi_hart_pmp_unconfigure() function
Date: Wed, 26 Nov 2025 19:48:40 +0530
Message-ID: <20251126141845.248697-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126141845.248697-1-apatel@ventanamicro.com>
References: <20251126141845.248697-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_061859_189598_BDC98925 
X-CRM114-Status: GOOD (  13.06  )
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
index e66dd52f..93682880 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -148,6 +148,7 @@ unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
+void sbi_hart_pmp_unconfigure(struct sbi_scratch *scratch);
 int sbi_hart_map_saddr(unsigned long base, unsigned long size);
 int sbi_hart_unmap_saddr(void);
 int sbi_hart_priv_version(struct sbi_scratch *scratch);
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 74ad25e8..8cf47323 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -102,7 +102,6 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
-	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	if (!ctx || !dom_ctx || ctx == dom_ctx)
 		return SBI_EINVAL;
@@ -121,14 +120,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
index a91703b4..c5a8d248 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -573,6 +573,20 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
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
