Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB15C54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUxPELeLfnyNFWz9x+1HCNcHnpiAZWyK/GovZkV7YLI=; b=e6Qsk26vKFufKf
	ALtyJojbhnaYE5dIx/OsqFnXzY6w9w33qkex/smSsasaZTRDWUsIkxnSvcIR9p++ZX3PCBxh8zlj4
	smVuySzOvVfvli2Y3MObuDT1df3Nw3waXcTsiPql0ga5YORoiadT/psqc5BuMYdRnD6ZDiczLn80R
	RhrMZ13bZ+ryquIXk/fJPsGS/DbUGsMOiDZPkDTM0idLBNCH1i+uIBdR8rfo3Jmfpo0ZA/jDAm7UB
	F/3BsET2tmsz4gAmE5rUnKaVQvQ7WqaZQgG5n64zT6t/6zBoXS6NIfCP6IWCrcednpMJqNo+6d/Z8
	B6xll68CJXAhWGMbY42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMY-00000002C0u-3w7U;
	Thu, 22 May 2025 21:22:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMW-00000002BxP-0GOr
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:22:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6422962b3a.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948918; x=1748553718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tIh+asK/Gqb33st4rethw8UlCnAeU4FsPDWv2FrPqY=;
        b=I81pvWsmkidq81FphR21C54ab+BNZ9bzDq/fXOEC02p2QIRvHShYpCrixjcbYMsTIA
         vu/NPu99/Iz7eY3nhnpaj6jrubCjCJzOM+bbAa7+zR39NikG7SDOZD9ESZAlTwKo1CZx
         pMnlumQFe5skqOTxTiMVdQZKTRo5uhhy6/IJ1AQOlH/dM2IRbCVfcAiDgycfhmbxnEmg
         P4PYGFN/HOF2PQ5RqMXxTvB8vFptIfpckcXOyr6fmejkiveChvyGBVvxFwvq3VbZqg2m
         sLo3EdkOCLzs6pQa1RSy99x61+BMYNV4mX1WaJ0AVeU9bWFG0MEHE906iwPI9Yd3d6Mr
         1hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948918; x=1748553718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tIh+asK/Gqb33st4rethw8UlCnAeU4FsPDWv2FrPqY=;
        b=i7wnWB4+hkg4mkFIKed0VE51cpXdh+WKiqhA8V23hXrQNu9oPrX8RZQJWE5v/Rey/I
         nggsHtvzPqa7SHHF46rRi0KPQscwBhjXxIYNYbsLL1vyVucAyjzwUSQedNzho9FoO5me
         68rtUjF5WdirOgsV/hXoSvUL11LtTI5eevfJROXLLubPju+7DB+DrN+GI9Ak+weN4W/D
         quASjqf3VCPcW1NFzxpp04+MPFdnHlwOw8M9D6ZLIX8OA0jYkh4/C8bWu0YwYJlvJ5Te
         Xyr+jscwQqHnWe6x8ygHni2IbsLPMT6gFblBHVSX9mYa3XWvhXcVjYUyQ+njHEvZDedA
         Lysw==
X-Gm-Message-State: AOJu0Yx3pTaMSu9m/qOJthddUtM/PtodAJFhMoy3rHhxyXmAHYytQkFP
	UQ6Q/ViCmMzPXauy6v+VBk6DQgVbRq4bOO47RspETBAGcfThn7Qto9DfSCmiU2cw
X-Gm-Gg: ASbGnctcHYOq5/DPLYOIiv3YpquPrRSfrA+pCA0f/e9ynqMJcslbp/eM/Sk5YLoWFpN
	7zuRSOQR8HC6wrEvQNF44Rtj7L3lC5ujpCUP+Aa0nBtIcp3865iHqlz+w9TFGoBtn9dzMUVcvGX
	mD3w52VhBgnXHtQaokHT/DaAAooQ9uW+hQRKg1GhJJKGtT5w2/QCHFQYFthoMkMBPZC2X76nZ3w
	yyamr9Ca7n4bmJusUaPT0sbjmBpveHbabPm3+3mPQIZhXe4rLEtrwSwKFKwbk/8nFPajki4QMRK
	8DDF+/M56ZCSACIUF/K3eiCD6p2bgzNqTcWwRFK/3f8VmwOZcoWm+iXGygntJvIXhG+x5GO8ggC
	g
X-Google-Smtp-Source: AGHT+IGmDGbiW2JoEOpvbP1MEMy4xP2L3OjQkts0x6aOazYthaKPhChYXWHsG9p3vH+GbJPwM5CZCg==
X-Received: by 2002:a05:6a00:3e0b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-742acd75e6amr40623212b3a.24.1747948918423;
        Thu, 22 May 2025 14:21:58 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:57 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [MIPS P8700 v6 5/7] devices to use MMIO memory
Date: Thu, 22 May 2025 14:21:38 -0700
Message-ID: <20250522212141.3198-6-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142200_103543_63FB1B89 
X-CRM114-Status: GOOD (  11.20  )
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

From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

When applying FDT fixups, request device memory to be of
MMIO type

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/utils/fdt/fdt_fixup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index f3fe8af..b0ed20c 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -185,7 +185,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 		return;
 
 	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
-				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE | SBI_DOMAIN_MMIO)) {
 		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 		if (rc < 0)
 			return;
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
