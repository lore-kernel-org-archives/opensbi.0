Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538FFCA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HX8U9NXaIos3SvmGcO+BJbEH6RIKCOWMVhDiekT/wLY=; b=NKlpWgiSouRbKX
	vcuEwRZ2h7i2+1T3rMJRUuOTc3iQz722NSqh6GELNrbFXNiP2wMLf0sgvkhyj1AbkiHxIN0Mewatc
	/R2oQqEUlks5LtZPQK0ytzdYZA6CXsCoUdViDq1Sqx7TqcbtfNbcHUgTF5f/rZYsKpPuJeAHtOWkI
	eSlud5JbpoMjN1HyJOS3YhzkGs9jQzzqavQeD3nTB4+9C9/I1UK6/CoK54Y+rVWXqgLkt+LL6V94V
	AfH87hyIP/R7dgpUbWyUhS337jB6j+BmlDwsaf4qKO49JtkdXUQSvzvJQvgqB4ouwTQater1qd0Un
	Nhpm+ABWvQ7RYtyYgbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7p-0000000G80F-2iJ5;
	Fri, 05 Sep 2025 02:24:29 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0I-0000000Fxgx-3Jgx
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:43 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1079730a12.0
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038602; x=1757643402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IhnPA3h8jPd5hYzFAepIPuizGqMQJrhgGIr1V44X/o=;
        b=Af4GTlWBx1Xv5GJMb0HEu8uf5mPmmS+tsoGqQeg31a5gYK1wPggKy7Lx0z9lfExSYF
         iDvhjcipjoQh10tu9YUwCIVC+KhC/eVGa/AjUYSA99t+19BYpGdOW4g/RGd8fjLT4NWP
         KxdBZWH66EU/ZFmSSa+gXg5hvXELKXQObXUVMKYel5UK1BcMKxt3eKOOpeR0XfGSk5PC
         VzEnYQvKZ4A6sgUD1K4m/fUbGSGikHsnty7LpjOvEz9CO/Bdy+arE6lfTYb1Q6tffIEJ
         Zu+Iw9TbzLD+3f5+JE2tECzomQn88Q4fnlCIPNWKYNSEo0nwk2RsYoSrmv8iM1GyWKdz
         7wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038602; x=1757643402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IhnPA3h8jPd5hYzFAepIPuizGqMQJrhgGIr1V44X/o=;
        b=ttqiTtp23RnwwkF3zPScVqoH3GnHc7BnOdYAn0WpUEEbjscAKvAWYbPUXq7iymShbj
         TJHYm+UTvMB1kFYhdyqfr2s5RRxi+WF/n9z+8SCZm4kKN5dvEKIgDz0wtbEQMStyXgG1
         rhWNzNLtTqoq8AC0iSJWLwKeuDu5BmHUmJ6fVHF66r7pz7+l2nz938ocutmr/+CTOP1y
         XR4C/jpouTEAZBHsfrDapT59yKw1LF2/ZOGSURkM1zuSHGY04Ug5h2lELjEcyUYWtw+L
         33VUtnWoU39h5DpOEa24phSerTpEmemzW4DSkCW8nLBIq8i5kOyS4Osqi15l8i9Pk8KG
         YIlA==
X-Gm-Message-State: AOJu0Yz3ECUtCFMQvIjOmr+SiqFYCj5vYO61yOYNRLx3so/Su4eoJtWc
	+FFuhE0eQIOaREkEPZXut2Jo+i7DXxBHX8W7Azlx8kJjlUt67aGtR8uP20IAM35nIH7sGmqjwvf
	XhHRBp9T1XCCiMxsc0OZ/PAjiM0trLxCh/0yNd9Tx9kmh3sBo2VlfxiWdshTtO/pUIn8vD538Ha
	1I6VN0UWTuIyflLL3AMvXLt2/4q3G/yuIhnZhg7uEYf8f1mXNw
X-Gm-Gg: ASbGncsvDGtJ9MxcgOlF5iGwtMGHSkfsrN6FQV4oTlFWm+nKlrCo5qT3bEHv1RemfgU
	uiXgi5G7akbIHX+699FpYFnw0T7yl7L07xNe3EUnsLUoDBHOqhRxSdasuxBrTo/r4wE5kmK9J0e
	cK6v3XVUn50pYyuCo48nUh4gr3kC0rD0BeBmsThXVaaq6XYzdw13k3T6HcrPae/5sKcAzl15z8o
	j512b/zntK77Fa2zlXTOK0mfct0R0G2xVarjb68+Q1OaM+iEnwpR322/ofDzTMr1+RCbbBEbKTk
	4zRXTg0vGMcnzhEa/Dns5QOY2ebxB9XgKXOiyZAhe0U3YnShXFbyKgeydIXOEbqLzs5/YwEmw3g
	qZRwmykxMatlBxKvk3fve
X-Google-Smtp-Source: AGHT+IHge3q6FaVRVq+cC7dIktJOuDXijQi6PlMpCRkLTNosrYZGZVEARw13DYsuZ31T89hkA4tntA==
X-Received: by 2002:a17:90a:ec8d:b0:32b:958a:51d4 with SMTP id 98e67ed59e1d1-32b958a5478mr5054601a91.28.1757038601590;
        Thu, 04 Sep 2025 19:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:41 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:40 +0800
Subject: [PATCH v6 07/11] lib: utils/ipi: Exposing the ACLINT IPI device
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-7-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191642_829618_FD6E5B4D 
X-CRM114-Status: UNSURE (   9.14  )
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

Exposing the ACLINT IPI device so the other driver can send the CLINT
IPI on the platform with IMSIC.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi_utils/ipi/aclint_mswi.h | 1 +
 lib/utils/ipi/aclint_mswi.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
index 4b8249f25e7e9ee4a053af54e8c8c03dae8674a1..311228eb27faae040f8a603a083ff28c038d8f6c 100644
--- a/include/sbi_utils/ipi/aclint_mswi.h
+++ b/include/sbi_utils/ipi/aclint_mswi.h
@@ -26,6 +26,7 @@ struct aclint_mswi_data {
 	u32 hart_count;
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void);
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
 
 #endif
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index d4acacf0fb76f840a1a39fcc5385c3041b34ae3a..27ce1ce8ec01f5bb772e0cff1a784048153381c1 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -67,6 +67,11 @@ static struct sbi_ipi_device aclint_mswi = {
 	.ipi_clear = mswi_ipi_clear
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void)
+{
+	return &aclint_mswi;
+}
+
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 {
 	u32 i;

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
