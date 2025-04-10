Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C421CC369A8
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7SbxYsYPCjTPq22FO5NEkU1s4PI/EJ97JzfzQ/YWTs=; b=by+lAU3eybJY6E
	gbVfK0T8085pKzB15IidsNfwL2wdguAkGY13ZDr0LN+pJJPz42JFfzz5PKX4pbZGec/3k9OAOuQeK
	sm92d60kfdNKsaDPC8uQNzT+zVWEBUpII/UNknXODQMh9pcoyV5Vky5ebCXa6TGaSGveW2I1b1QKC
	WM/Pmq+QqOd0CHwXKofGGi3VHBBjMICjwr0GZtDUCcRpZXl2Df9grx1XMWRQ26kg0UcbUiJvoXFuI
	oCu7xaTNz/E1jW0eRQWGQp2OOKeWcThRUtwVqobuMWe+WL1Jc7MCP3eWnfmCYJwo83ejCF6hP1Zxj
	WJGmN+omTp/y2G6DffPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RW-0000000C41k-1IGf;
	Thu, 10 Apr 2025 23:36:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RT-0000000C40S-0SAu
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2255003f4c6so16186995ad.0
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328177; x=1744932977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=WHyj0zljsjBcbnB6XzMiBDSnZlG2LLzTLIDQ9sNzqUeGNW2zEyO86yc7v32hnoJ+8X
         R9M14vHJX2x2CiWLGGJhkJJWSnDNaS8vC1x8SQrlullkQ0m/HRxg9G6NNnjuN2UK5OLo
         +u6Qu5OKjBEmzoLxj38AeFPiMbp5aOjZnCBLcsiZSnUFJyy47CUHnx1w5+rRHMbBmSZZ
         R3pEz5iTlrX2Fay58ULioBks7NewBciXkXH45eR/9+rjL5dTCwcJtuOxycvWKjx6MR0W
         wMQPFw1W8smdmEAwy8tN3bkwNFk6v+8g4eHDlTpbVIS/eOCmCfLtIRI8QZnnEUTy3hX2
         LMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328177; x=1744932977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=kMthnYRsh0ODv5P4va3Lz9bjDS66PVYZtXUPP1K5TbyDjiHEbjTo20caMmKWY2TVQG
         Hn1VO4xSHg/Uh7PiIP7X6M2MUi8en74oeWxSnfoBQy/0VfSWLitEwawFIR2LfDNERvov
         irMF+PG0v2fHUMH4hsBRbgl55lVuMcu2mGDo2xuAyYMhoj7+oAgYnb0O6YClOdoy75w0
         ECeSIDjLMGPc99Y4OU9UpCemjAL812waZ0pkUGXUPcJx+5LUN2l6yE76mgbJWnix7Xxx
         oGhFX46QNc2x/9Je1SwDqdcO3chGnlQ58uYe0SX69IJ7gS7TLdLjnQNPXQzZivaLpzF8
         xGIg==
X-Gm-Message-State: AOJu0Yx7PjcFInhQnQMcxPYRiECkPiZoasy011M27caPaly1wTE1+BU3
	Srz+82DQ+DXp162E+Dpl14DqcLPz27iq/kKbeOi/icB6G5EW3PS4W8Epdr8S
X-Gm-Gg: ASbGnctWOuEh57O8fR97Ee7/T50mNJtYJuSvd5Sz6MU19r87KAZULUY8B906nJ1o7Mj
	vPVfqwexblMKnt5O6B4VqNl1VlK/KvfFnZr3p7Y+ZUJLOIvKiH5l0mDguILB9n45rDBUww1O3s2
	m4hoUHZmbruBWPDu4Ey42hWbS2XR6jidAdCC9RlxyMc1QccI4UkdTM3RLB3f55FhsCDrEG023kY
	VuJ0csE8aOoYCdEPWKO7BPeYOCVBplKNVrrJf6onF6i+vIVYl+vLyNagBPwDp05TsJJbbH03ZRz
	zA3f0l6rvDc+2D+cVl9DbdJsoZgWlpNXgn0rW4dKDy2vdpYD701tcBadWWdv4MIyUJG1MMFKgN+
	4JvydDQ+MixTh
X-Google-Smtp-Source: AGHT+IHrH+COYz7cxnx0YOk1NuWetjFVQTYk8hW8oyIhrdyOcN4KZ2Ouy1DynhvKo2c1dHeTNCw6cA==
X-Received: by 2002:a17:903:2308:b0:221:331:1d46 with SMTP id d9443c01a7336-22bea495302mr8925645ad.2.1744328177015;
        Thu, 10 Apr 2025 16:36:17 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:16 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 1/9] platform: generic: mips: add P8700
Date: Thu, 10 Apr 2025 15:45:27 -0700
Message-ID: <20250410224536.25021-2-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163619_158162_C760DF88 
X-CRM114-Status: UNSURE (   7.78  )
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

Add a new config first.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/Kconfig           | 4 ++++
 platform/generic/configs/defconfig | 1 +
 2 files changed, 5 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 688da3f..a24d6ab 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -68,6 +68,10 @@ config PLATFORM_THEAD
 	select THEAD_C9XX_PMU
 	default n
 
+config PLATFORM_MIPS_P8700
+	bool "MIPS P8700 support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index bb26062..ce1f1ae 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
+CONFIG_PLATFORM_MIPS_P8700=n
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
