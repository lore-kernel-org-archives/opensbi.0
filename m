Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4220CD4851
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 05:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMV0IgTvzB0WwTk2TtDh/ayAMRmgu7XcdEQ/LTS7x0I=; b=oMoMs6/vvAAnT9
	y+pTAtu4LPuhlBP4WKG6FBguVwcuD6Y7u1vpYtnhkQg5KKSS3KRTG4deV1WzmtBJt0KmMD3zocye/
	ZcBPfM1sxrQxWtMvIrhk+xlPYtuRf/mjGv+Q6q2lq7/KbnEU4IZqQUQ9TadxVPbcdlb3BtphrQA5e
	HmtTuvaMEtteydCrfypgl8wsYPSn9Vzm49ERv/3VNNEz3uMak5d1kYc160fHt7zduQnEqeX9itWYf
	+f4ehhaIYlk4Syy0lR5YPnHhx/+bFR3ekfV2LFv5aXZegGRb2kfqfWNpFxlUC0AIIYLOrflZ4u8jT
	8N3OcS1NL/ux0Ah2jqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJU-00000007Qqd-1rli;
	Fri, 15 May 2026 05:42:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJR-00000007Qnz-1Zd4
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 05:42:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-44c350a5b87so5363683f8f.3
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 22:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778823735; x=1779428535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPC/RqCz91sbAMBL39+cKkzbm0HriA7ZJg4nOcCCxAQ=;
        b=VsAY7dESbYfKEN4vPINVvatoiv/q9n8fM6+e+Gp3qvmccHY9mGKToe7Y4s1t9kzIyQ
         z5xawy1uAZHA+twcwdntMNBvTaQP9/2jDr8CTQd2Jj+vLev0XbKxpX7b5XRRmwEqWp4j
         y+69jxERy4d936OVuXWUztict9e6ycYpPJdwnFJU1+Oq+ZrJ487jOY+wnBnv2ZOP/lzt
         Ibpqc4LZ7tjQJK0ZkGCDu8aQBk60KAdSM3oCbTBHAZaTDA6r5UEUvbNiMHdZQ2tEWDKL
         n6VQuQp2at+UqT7h91/by6pBZlZep54O9LdQyp2U99R4kK+JTkHT+QQ/2mNAKueW84+S
         Qgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823735; x=1779428535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPC/RqCz91sbAMBL39+cKkzbm0HriA7ZJg4nOcCCxAQ=;
        b=mtfUeEm5BYHd2INRLcx8bI2vtV4tqcQmpOLrPvBxhdIm6XDUp2k69yCfyPKot1Wk32
         K+ZR+lTX0HRrXk6VIhe0WDl8YBJcf7p+CtpvUPS97A+yCc4QGqb0b8Iv369iLf3JCJhW
         DV61zlqDJzrjdgmZXzJJLY2hwKqXotxKdL6Za9LwsmJdXQWED/gV7EdtlBaNlMNwRNWS
         TBuSpC3q2ST22T9X5wFEK+dL5KHIknkcwjnRDr58MaqB887O/alAaeNTScgNgEDsgJw7
         G2IZ7rmiZdoHmgu3RR9tNGcsOXGVfozAB4UxS6S4zmg0Sa91NbnRkX3AlbvURWCAx72f
         /fvg==
X-Forwarded-Encrypted: i=1; AFNElJ+gIHTNIFqyau96oLGV2PWiB7E2fnILwpV+/dLiGjB9x0J0wbmIs9DF56tuE+3CdPMxmktCsZ7C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gfpxUHr3HBLAixBkqmSrERHjc9o0VUvx5DElzXXH1BlgMpK9
	K3+dKLLH41sPStwT/0Ua1f8WCl7fudPYy/Ml190T9pb1cHY9Iq0URwvJI5UtGrZBA8g=
X-Gm-Gg: Acq92OFe6n+TGAZjSAqiWpr2UGITFPW8xwyyu0AE/L04P/TVBx7sS1+V+zpr9yx8xRV
	JY9PrlaTzRcB1ch5/9AwIc1qcmgfoENuiqDcHvpksSBCWglxuzOVgkBlsM73CVMkMXqmiEaZToU
	bGB8tTlv/0LbJYnzdWg55qc3qfg7u7bg/csLkEMIGnF4hZ0GBmzD77Y4cvMzuwsPLLSyRv+QlgY
	EOkg8lTWSsPIYS40+3zGbfaUOG9E0LBmWhdfzxk3+pm3xplEmh5ySHKisy8CKKBm4FErT4bRcb2
	Y3iJ5l6NPFGdw/OpgWHufj5o/OdSaorGnfvIQJ33L/8t/7H0piwUzkbqWKvr035sfkaNCInsGHK
	zAxXb9pgO05lpTRQZI40THdmAHsaQblZZTqutfPIu1N9b5+bvdy0zYJRx4fPzCXGXQysmxh01du
	7VQgSaHgXnH5j/igwOx+Y/j9NCMaqF7wB9dIadXNuT4aOD4ccyXhPotGjKrV95tLy0BP4=
X-Received: by 2002:a5d:5f90:0:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-45e5c5f8424mr2744039f8f.38.1778823735413;
        Thu, 14 May 2026 22:42:15 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm11456536f8f.37.2026.05.14.22.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:14 -0700 (PDT)
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
Subject: [PATCH v5 4/4] lib: sbi: Conditionalize FP and Vector save/restore based on extensions
Date: Fri, 15 May 2026 06:42:08 +0100
Message-ID: <20260515054208.151045-5-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515054208.151045-1-dave.patel@riscstar.com>
References: <20260515054208.151045-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_224217_441306_495152FA 
X-CRM114-Status: GOOD (  13.47  )
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

Unconditional save and restore of floating-point (FP) and Vector
registers fails on generic platform firmware. This firmware must run
on multiple platforms that may lack these extensions.

Address this by conditionally executing FP save/restore only if the
underlying hart supports the F or D extensions. Similarly, perform
Vector save/restore only if the hart supports the Vector extension.

Depend on a separate patch that introduces SBI_HART_EXT_F,
SBI_HART_EXT_D, and SBI_HART_EXT_V to enum sbi_hart_extensions and
the sbi_hart_ext[] array. Use sbi_hart_has_extension() to check for
these capabilities before performing the context switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_hart.h       |  6 ++++++
 lib/sbi/sbi_domain_context.c | 31 ++++++++++++++++++++++---------
 lib/sbi/sbi_hart.c           |  4 ++++
 3 files changed, 32 insertions(+), 9 deletions(-)

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
index 5e180698..1e3ca46d 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -155,10 +155,20 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);

 	/* Eager context switch F and V */
-	sbi_fp_save(&ctx->fp_ctx);
-	sbi_fp_restore(&dom_ctx->fp_ctx);
-	sbi_vector_save(ctx->vec_ctx);
-	sbi_vector_restore(dom_ctx->vec_ctx);
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_F) ||
+	    sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_D)) {
+		sbi_fp_save(&ctx->fp_ctx);
+		sbi_fp_restore(&dom_ctx->fp_ctx);
+	}
+
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				   SBI_HART_EXT_V)) {
+		sbi_vector_save(ctx->vec_ctx);
+		sbi_vector_restore(dom_ctx->vec_ctx);
+	}

 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
@@ -201,11 +211,14 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;

-		/* Allocate the vector context pointer */
-		ctx->vec_ctx = sbi_zalloc(vec_size);
-		if (!ctx->vec_ctx) {
-			sbi_free(ctx);
-			return SBI_ENOMEM;
+		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_V )) {
+			/* Allocate the vector context pointer */
+			ctx->vec_ctx = sbi_zalloc(vec_size);
+			if (!ctx->vec_ctx) {
+				sbi_free(ctx);
+				return SBI_ENOMEM;
+			}
 		}

 		/* Bind context and domain */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 60e95bca..e7581368 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -396,6 +396,10 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
+	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
+	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
+	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+
 };

 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
