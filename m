Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E47C54EDA
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7SbxYsYPCjTPq22FO5NEkU1s4PI/EJ97JzfzQ/YWTs=; b=djx9oFzNOeLlrk
	M35f/VNUXJVi+cyG6zCHh+BckSXAfJI80nOCFphAvEPdohrkVnGouzSdmCaIUrIvhZ/0D0jaU2ptE
	IVTrWhhFW685cHULArjrnFTuI1hThh0RqEOY8EGSRe8IjKCjBlOIAJwmg/x+oUyFkkA2Ka2X4FPqe
	wij86F3p+RQ+Kuf4R50xGFHqCwvM8V6hjR8Y/AYkYR8Dz6MmKBy7bGksijptzxX1Ep5JKtlyfFVZQ
	UbuvJqCLEOtDt49H3RSbcrylU3TEHxj55pczvMHQOBYksU9gFUnCZ3/QzQvRr1PDEE3ONPB68KaKw
	c3KQUhNHjc0oxZ4n+HJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMT-00000002BvT-1fgZ;
	Thu, 22 May 2025 21:21:57 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDMQ-00000002BuL-3BEW
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 21:21:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c9907967so5205845b3a.1
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747948913; x=1748553713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=BPiNzFsPwLZcBlswA16P4pAZEY077hpK3r9OI8OOPFtK77noUikX8fvRleBVdUwulA
         Ob82ogn/+Xi3B9uUza5O/fOmoTmEaArKXEQXIuzoKHo8fUCB79ZJoyTbhDMzvXe2yIX6
         ydhzKCWII/QfyifrVGSbR2NvdlqqxGZLo4dy963lNaLUiVrKqdp4O7M1d6a2/M0SmO0y
         oAIFCzvVGU9dU7JmuevmFG7F/MpQGwfIrtBqfTqr0JQ9ZjBUboXq6aM5B4yizICgAU9t
         IJMfu+iIvh69tftnO6rep4LeAmaGGkBQmzZQrvWvzglzirgKNz+hbOmv/vQ1yGm2aGog
         Y+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747948913; x=1748553713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=hHhrGoQHq8ZPR0x84MutpAqw4gkWIDXf+/jkMkE1uuPrQh3hvzbRPMU68wAaOFDpVn
         7dnH18zKoCdMTDbgji4CUV7EJi/dsu/Im+bzVTPinYdDII+oqkBnTS4MyRuubUoxs7EP
         U6W1g+MoEh6mjIeQvoLymx2MCZg4PRWbHue7jnQRATnQZI4njS4rTOYdOksT0wKsS63R
         YNDYNUvzRROjowNa/lqGl+uS7ULx718vgl0JsylNBt+rj5Via0JnP65sU1tQoUpMVYZI
         Gwat/GN00bmCP1sT67lRCEDShTIoCdqOl/SBRHvu20psrgcmQO2ma6a3Qk66d9k9Iu+j
         0zQw==
X-Gm-Message-State: AOJu0YyaySFj1Netdy5sC3hOhlKxJIpQMIYDcuGP1D/MiduQt+lCfkDK
	/HYp/89aLaInaKvER9L7SOOYW3Zk7OfSQZMk71Y8ONVXdogVgTuVtg81ZvAQuZgP
X-Gm-Gg: ASbGncsnOegZzcpuCK9ND1+Ml1v5mRxMmFvwiziqPy4lX/r7hdSmrq4J20eaOcjPoUr
	i5RlPNapyllAHmndE4Sqs2q29OmrBkqC74XskiJE1hmBidoXy4aRz6brVMkDdUwjr9kuLGRmOuw
	ZA0XTGus6Fud9X3TXkQ1PHbUQbyGNl9JA2vdNFNqvcruHxu8pey/G4QGK8QftCJScFoq4C0O+LB
	S7Iqgu+MC6CqvJc8K0phkJhaIBOAWg7dxHZj4mEeLZlSGkajJLscfDBqL0bsz6pNM50wvOd5D0M
	XC1pK7rcu5EhkKA3e6euY7nyTDd6uWcgWrND+Sa89dLS7cw/aSpi1qLLfsvrnzbeHg==
X-Google-Smtp-Source: AGHT+IFW1J3bjZ+5UkTxAmYQn83Y18wXmJ05eYiBmSMsbmlnLyhhI+ruGrLX8+LuGtJtMEl0xfkoSA==
X-Received: by 2002:a05:6a20:2d0c:b0:20a:41b9:cb2f with SMTP id adf61e73a8af0-2187a5807dbmr542325637.29.1747948913300;
        Thu, 22 May 2025 14:21:53 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e1fc3sm11629766b3a.8.2025.05.22.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:21:52 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [MIPS P8700 v6 1/7] platform: generic: mips: add P8700
Date: Thu, 22 May 2025 14:21:34 -0700
Message-ID: <20250522212141.3198-2-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_142154_793236_09C30ECB 
X-CRM114-Status: UNSURE (   7.62  )
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
