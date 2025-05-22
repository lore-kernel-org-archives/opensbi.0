Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29ECC54F30
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5zEoRc0mbkKS5GMqWVkHJqEY5V/aVxlYWJMw4gvUTI=; b=RVYHv007ujrGbq
	htMYmB/KxN+RM7PRR4iNGgOkv8AwpSAxIHvgfxtZTL0bIsjnOz45TnsSbl53aoKL4ud1vpNgdmAha
	IINwDmvIjLPjZ9saIzhty6V9tmUt7A3ZJ5vTtN9Ci/kG6loTEPb89S30irP1ocN/Xib4KM126hIqP
	T7t/JY6l02cU1o647kRQnXYD1w+JyV80iHP9qCb7I41ZYwr6O2Lvi2QmApfXq2OIvf6TPR1I9YQWF
	3Ozl2RUb/YTHx1A3kJXcOqn1K2nWWyBnWfZqhRN4+yEvKbwiDu2TtaRHL7ZNLhBESDy4ZsIpRsxKb
	RPQ4WPm7j1eaI6XX8BWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMX-00000002ByI-0Bpt;
	Thu, 22 May 2025 21:22:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMU-00000002Bw0-1VnN
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:21:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so6885679b3a.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948917; x=1748553717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pk0XyT0DPSs0nyCcUoOtRWK4Lyecml4paJKPEBdlfg=;
        b=VNKTPyP05r+FTMj2y1+eoq+dlAql2fVNyOnoCDFzx0gefAgyZ3uZO4LXmMn53gGkfE
         t7GVT7dzfTjtL2npUWCIfBwfDprfZb4R34yQzQOrobeH0+VFwoi9fHVmqvEleFmteMK1
         l8N1+D9YwZjLE54QuaYuWWkoqYcs/oNPlL5JIGEE1Vr+LjAn2aTAdfRGheJ2D9rN9E39
         p6+Qqs/zt99dW74qFS1moZXxn06nHRdv65rUKRaUSilXw6TAIZSlQpkq8lme+9g8or/q
         mwgBnsptFZbLqDIrSEvH2RjgL69XQn19CQU6NyGUfgnUm2w9VbsZH6Sh12YogPNZy3gJ
         QmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948917; x=1748553717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pk0XyT0DPSs0nyCcUoOtRWK4Lyecml4paJKPEBdlfg=;
        b=gzvE/s+CpvhWaZRJwSTdrDNgyFCCEslngeohqdwxXnSuclWsjPRtZI6JwbB55TniJU
         qOYH82cgvMlqM34V6CATEBB32y34uhA+0KwN2JhQCLVpKOf1q+AqcVmTCY2Vn85WG9R8
         Td7z8abSCaID0xOvXemBHW5x6bEety0Ws2l8Tg8KmwBwMYg4ZkFmp1WQxaF/eDZK2GgJ
         +xMQlUD2EHKYF/+DWILw8HYuWjg+vM3rWwLir4SpO20tx9UafskI5yjk91xkrqZwwjWo
         S42BjfXk278Hr5WRcCHnQ5keNF2tNPhXtbiisjQ3Uh5sRbsa0Zwj4i71/A9l5wQd0qYf
         bc0Q==
X-Gm-Message-State: AOJu0YxSyOJS4bu28rJwM4bnH2CR9qUlWl4OnLdf/ql1UcYe1qXKdI5s
	xKfll7rLh3r7fE8qOxQoLK1KobieoOB170hpHJKRN/OcqUota+v7A/rEW3rkMchN
X-Gm-Gg: ASbGncvP4QEG64vWLfFOUGhOVIgXqydAmLdIEs4tIUPxECGpHA2H7O18assB4N8WoTd
	MenoY+HiBI8M8I3P105uUdUXWhxdYMa8edZzmFkBNgF98LYJT69cDSAJnZ8FRI+6eWRlejfuKdU
	14KYHaaNu/GT7gF0ll88LZl78JUgBp1Jkg/vedbXTmKJukLFDJOcsPQJ6KD4Ku9Rg+JW026ePJZ
	A+73ZaQsrf5vkc3QFsPZT6ieQB1J5qrpcN1QJVifvG+8Ur83JLhaIKCxm6gELCHxfkin9v9lnaJ
	y9iD1ScHdDCeFrVKwJc0N5RPaMuxC7ch3LVNz9xsTdxipnAd55VNWQ52h9FCHREi2g==
X-Google-Smtp-Source: AGHT+IE0xOXKGRgsVLv6krX/ItV1vKW6xI0XR/A7ZXwRFhPHHnnXQV/gQ9LY/mb5uLrhmIbyLa9rjA==
X-Received: by 2002:a05:6a00:2790:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-742a978607fmr31325374b3a.5.1747948916823;
        Thu, 22 May 2025 14:21:56 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:56 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [MIPS P8700 v6 4/7] platform: generic: mips: add objects.mk
Date: Thu, 22 May 2025 14:21:37 -0700
Message-ID: <20250522212141.3198-5-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142158_397675_60C54942 
X-CRM114-Status: UNSURE (   9.45  )
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

We build MIPS files.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/objects.mk | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 platform/generic/mips/objects.mk

diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
new file mode 100644
index 0000000..16885e7
--- /dev/null
+++ b/platform/generic/mips/objects.mk
@@ -0,0 +1,6 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
