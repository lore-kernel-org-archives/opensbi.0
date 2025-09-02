Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD93CA1007
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaNzBepDp3p5pIpUhDIL4Qmvw4ywfxXOwprCp2NdqOs=; b=D6HjV8RUJUlj9u
	/D5wIUbyDFQI8+cl76pJedCWCNgw/GcB4bjlyYv1tihTJ66jBdDRTVIFbBKqFhE9/WXEyMtYvUgBn
	ls/WJ6VO08C3J/+gBJxvE9x0QTCp2K71GR2ZayQurCAhtRE1aWXau5HWN+C2/qZ67635r1okZ63I7
	O7Wxf+QxQZAgyK6pkPQRKaDEBVk0yTvIlW6IkO5aZ+YL06Znk0KkJxQhVVcvX5hwcObvyYJeQAR8A
	ZQ8dNU/n6bhvhkO2j45usHioyi+oGRoB50NJqUAlikTJnELnaz1k0DN663ekLaaepB8dxxyss1YFQ
	HUlegMNdzSrBNw/755og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbt-0000000EpcF-3swp;
	Tue, 02 Sep 2025 02:19:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbr-0000000EpZx-03WM
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-248a61a27acso34077615ad.1
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779538; x=1757384338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V84+VLBFqIPNXouMrVGdYIYCQx9UBWenvy8rWpfHBRc=;
        b=dd3KxqB5WDqRwk9N7Hh6Ery1KVjKOkqQxorjw/zEru7C+gS8PGVHb6jDf0ubtu/ieb
         Ev9MedRV6F4nu50O0vj6kUqe5TpQszBSKJ71zSQWE4oJOLqkOJ4eYxWK+A7yc3/M0RpD
         FN181UudiDkunZqv/o9r4bYKgdcxI17u9/bcTh4W2NuR6TjFWFEq8L2qy72bfgpt8IdN
         2R4DXkAfbMW3VAFAkHNZ9Hn7v6RKMDbI/6TeyQ5hXtlaxR37vzIC4EV1p57k8Sk8bsx+
         HK7plxrAh4Bt1UBf9RFlJLFn5yzX5QeJUxYorXqKiADXi/asmPfE/WuEeRbHdNFbB+Oq
         VySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779538; x=1757384338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V84+VLBFqIPNXouMrVGdYIYCQx9UBWenvy8rWpfHBRc=;
        b=h+Dj6GwHcFwB+TZ2u7YRSs4FG+rjWTfKqAoXSgq+gaTS50tI6vz5nG3F74lHwWJung
         ivVUSl2pctYotejCOakVCrM9uxp5Z6LkjJrgmlQB8QI5RCW0XIEgW1+fM1NCHjpi1IDX
         cycLgZF7Q0g4hW845uOzOrRlFLs+KtC8poc2ldfFe+Zyfc9YtYzCWgJOW3xriszTkeYy
         om7DFNsdK8+jxcaZD0geUFdjptpRWnDFdWtWS8RTflK626qrTVOhFNxO+zzd/1Vo9sIk
         mfNj1CzSdx9ttxLzq5/a9Smg3Z9dDuPPwHI1k+rtch1zNMWT91tqaGALiGnxKYcJqA4N
         a8iQ==
X-Gm-Message-State: AOJu0Yyw7Kc9iuyMEFBCWe/64kI26LqxvtixjU+l8U3q4KEswafbsz5u
	4T6UbZCE/hSex96G78jnTrKjQMANhqLkH9qsXGtiheXzv0vjyvzNUr7qqplayygwuGR1y93FDu9
	xI3dHcknq1RUFz55FomoeCRVpVgGdEhRMF1SY7oofnTLJVWI/5GiXVhgfYzM96epsgzzGdp+aJ4
	4ulB6/ZSMQEKFkB+4x4TKk9ov6ZgOmUgSwvpwLJ4Q/aomQ+w==
X-Gm-Gg: ASbGncu+mridCxQx294SIMSZHAU4hSSMYmUNYnl8MLzvr+Qfodasuyf3rsmV+Z9cbAt
	Yedax3ydkemCUoUtbFX/UHgPeNz/oGA7KiF8sdEEmFodWsub09KVWzBLpa0+O1l1ne6IEeAb7xO
	EAOV31iM8uMiWkRpOLSzwiFr5z5QErWzQWpONIyu7Zqx/3oM/ckE1HE7K/2xCeY8iZMxaaePda9
	egBvBsrLmO5o/7SD1MkwstP1c/kSIKU6sqpCnei6o2/pQeBfRWIAVqvmoGYKyXkKmiL8n4UWXFV
	9yhi795b+Lifw4fgkob2pfkQ9gOcfkeh07b6dYu8ESm4H8DCNg8z2vMPL2U7L6+hkv2SiDASKjz
	JRTVYSfvbP+SZCkt+RyUBFgyFd6hmZa8=
X-Google-Smtp-Source: AGHT+IE6tYpBU9lIn1TG1gmLDcnDAD7smFcQs+UatrV7u00wL1EKPIwc/GstMe6RMSywG9i+fbxF4g==
X-Received: by 2002:a17:903:3207:b0:248:ac4d:239a with SMTP id d9443c01a7336-24944ac24eamr89312705ad.18.1756779537934;
        Mon, 01 Sep 2025 19:18:57 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:57 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:44 +0800
Subject: [PATCH v5 05/11] lib: sbi: Add SiFive proprietary xsfcflushdlone
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-5-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191859_058245_93E8000A 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Using ISA string "xsfcflushdlone" to detect the support of the
SiFive L1D cache flush custom instruction.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcfd4582b39e1dafb6bdb41d2fbe77dc419..fdcf400aa8c494cd941c412294bd0c118c5ec2af 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -81,6 +81,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCTR,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
+	/** Hart has Xsfcflushdlone extension */
+	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6f95339b9a6a37f346cf923ec63964cd3e..4160ad6c3d8b31ff9f3d5ab5dbf55356140232a8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -715,6 +715,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
+	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
