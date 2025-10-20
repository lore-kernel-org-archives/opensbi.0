Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F103BCCD1AD
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpF2QL1O9rzlWO3s0V1Sxn45faD3HPIqagJKf8aAosw=; b=gU2C88uMAK0A88
	4xKC7tRjV1n3QXXSiCorLMLYhES3RLTMMEbdga4E2P+onahcAxrJE57Xr+fiGsR3noy//9PNDYCUX
	xv8bXin1EqDtAuCdpz8YxqhisCQMBoWB6YEi6ZORrWuoZ4Y20x+v2zTf+Jez2i6V+2jkhjviZWmIw
	jM6xvQMrfGXsMP1avCLfNIho6MG/1FSerZQFsQe3FcOVulrKAmRqQM1MpJjk5f2viN3xDFrPnAAYF
	4GvnzQ9/bOsdzunEjVEC9ZEcW+4uXYlQKANBDuEJO2gMOic1s7alPpuyFj7b7EV3zsWmePhxEt1gZ
	+yV2u4LZPUuWHBonO0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjME-0000000C20A-0E4a;
	Mon, 20 Oct 2025 06:27:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMA-0000000C1x7-39kr
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:26:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-793021f348fso3558667b3a.1
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941618; x=1761546418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMA1NuZFWwGmNH8GkIqOfeSamqTI4S1nbL6mJ7NoURs=;
        b=j9d0EaHej//YLVkg/k5tytPMUySI4cyCHJRj2MMQDhq9GT80zY/JQmZTldwf4rU5RU
         Ip2TDX85q2XzG7cH1/L7/P6B1wHzeDFrjzWSOrMa9HoW+n+vkouawVp8akNx3+cvYl1M
         1urUcQK5gzLywqpOmNJWc0uooaAGSWbeQwX9snuLDaCTuRrFWTwQl+WiD5Ieo4yxxxpy
         3jTr42sKUBOxSGdagAR4MJysfgTnh/WSZJYZFC/bPx80NJwgn1qfRqjjK93zPgWMYfca
         WaYGzPGgiSv4iPptx4io6nbDtYlfgt48+TXFyYViMhhMkxZwxyzoo3oj6TB2qbxIx0C8
         mcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941618; x=1761546418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMA1NuZFWwGmNH8GkIqOfeSamqTI4S1nbL6mJ7NoURs=;
        b=uH6MsgrndLu3AyuSE8MAcu9loud+6Q/VwIhBdenzVe5j6tQsvB3gOwsqRVTEOqhlBj
         3D7bvQTEArBkhQuh2OYZSmwhAX0jV3JL3bz5NlYiSAmyXwt4k2Sncf616dIVOtP4NrIN
         hXfaEDaPosxMwhtpdmiB2tVVpBnJXR7I6lFLmfJnF1RPWvPiCf8utAf/cS6MmZ4O5Zr2
         nNNlC8UGe86DS1n9RgtEopzjJNdngx6dVkFbf8zf8NK1k2MeQ9oCcEtkFOc9Xkief/aN
         2VoABiLBE0cc6bFC6NnYR2AL8tN1ohr6TFOiE6JwpGxFb6brOsROZCaDKz93nLYOeS5y
         +h4Q==
X-Gm-Message-State: AOJu0YztMWAXXBHgTfwubvdLDddak8y4cTOvDxVaNxtZ8C7retHY176A
	LUNsHLoB6Ajt8iiOjkJZe6qnJg9bhzIfS9Zdq6IMKGa+NBsk0A2TzMnjxvRJ1XGrlbo=
X-Gm-Gg: ASbGncv+XrPOzRunFpew/rLj9fvRAyZhHaNlR6oj5VHcNlcZbCBP/jJll1jx8tYj98P
	iM7H08iYYmh0Herlp9KLCCOBPXm9yTc3v/lB43JxZYgjlldxUpxI92wMq+Anhefx9/MBBO+pCO6
	1QuSUABCay8Qnfz0dvQ5S2QqHgb7sib6l4z8IgYtrxg9I3Tg1MY4CdMCgL8LRUGyCjFxsK+/6jr
	nNqj7LRCDeQoneKGQUZlZNutWXyc1rwnJQotvJhjTLdpQ7Pzi2OWivrjBG8O5v+ZPb6JLkZ7mPm
	+dN1Emfow2zZ4Lg9bTPOyFsUfynusBrQ41ISGZenx+/IX9eeMO5KnfoGktH5aUrb8p84Q9mIB4/
	asyEBu208+EP2zNV0uiPsXXec+taOfW6DopK13IDSOkA3Dyd64jHb7PgPY80JXydw2RyrstwNlQ
	==
X-Google-Smtp-Source: AGHT+IHYYg7O6wufwDFQiPmMGDbzpqDpXGlLhDTt01whGrgShUsaHNDB9fjQQNL6K10yG4LkYu56zg==
X-Received: by 2002:a05:6a00:2d8d:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7a220aa1dc7mr15201106b3a.14.1760941617309;
        Sun, 19 Oct 2025 23:26:57 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:26:57 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:08 +0800
Subject: [PATCH v7 06/12] lib: sbi: Add SiFive proprietary xsfcease
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-6-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232658_799563_621715A3 
X-CRM114-Status: UNSURE (   8.07  )
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

Using ISA string "xsfcease" to detect the support of the custom
instruction "CEASE".

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index fdcf400aa8c494cd941c412294bd0c118c5ec2af..ff682fb4579291cd9e5fb36ca5ab392aa376d37f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -83,6 +83,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
+	/** Hart has Xsfcease extension */
+	SBI_HART_EXT_XSIFIVE_CEASE,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4159dff54387f677d4fddcf115ebc9f9ed9be86d..de1358180f208dd9ca9bf2feeb43ab648999847e 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -716,6 +716,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
+	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
