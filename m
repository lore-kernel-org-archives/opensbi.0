Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6619C54756
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7SbxYsYPCjTPq22FO5NEkU1s4PI/EJ97JzfzQ/YWTs=; b=fTBmxzZKw+Wu+g
	Hf2ZIRPwkkwc/ky160KfvgwipJNJEMppS78NtRztlynvSrgj1BxDw1UW61BQ5y3EiVR7k8JlxvUxS
	2kzfR5fkQzJYFHOwPsH1UuOldY4Idkb4rBjVuFfgRjW/yd3mfvA9ij7KFhWBxwCzDMVJ7Gra+DGZR
	dw1CWyadBJQ6wHtfNtTyg5gYMY7ZNEVjL65Bys/QWBDY/X9zQTned45YKc+eNqpKiY7FPfbsXUqgS
	Og4rHOHFkW0RnHAV+ceTqa8L1GuhVTfDZzuWAiXRN+QKgLqCtv0BsWuGaiWvBq/Q6yFil6hrg5xRR
	V0o4Zfm3jCfzxn9Bh7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vo-0000000AgB4-3CzO;
	Mon, 19 May 2025 21:59:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vh-0000000Ag8d-1TCA
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-231ecd4f2a5so27596495ad.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691940; x=1748296740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=NYFqCOIMTIyqfy9MT2aUGrmN/DfM9Tqj5DA1M+OPIOOTOy/73atGO4BmbSoV368Pfq
         4yuYQiRMCmbM+rreQz24pw68F/ZY7rex4ZWpwEwiDHDJJFovGfZ8jgZj79+jk9zZ0iy7
         CPPSRcQoC5XrBLS/crkbRlJnOZu3rtDu3cVMS+5lGbDCVFfmm35Gim3agNLJ4XJaURrB
         wVnQVd+WKtcQzkZHndXZEQekRhgbgvTyCpuITZTrCFVJNRaK4KpNns4fIwzMk7sapo0S
         s/KkWPUlfvfNqoikL3UC9rclKyDQvmwhfHOz5BjO/A+GxL5LN+yREaW02DIUq6TtI+Mo
         qRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691940; x=1748296740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=J0vmRmgFkMowR9uapFSYR0NDW1Pg048qdzukl6LOkXzQR8GZUxDOt5k05uqSQ4m+V5
         oAOJ59q5Fjf31eLxBiukb3Pg/psyzgep7aBirNIegnNoYlBc6/7MO2hVWlNgogup4oou
         EprROjQL+M0rsGa07Eizr4+30UpI6obZ371i6DJjG9Bor3WaI4mHDhAvkCjnRxuA2DPE
         I7SvT1vvrGpMYhGtd8cRNQOS0FC2kbVVB4slID52tkC/igbXiqPUSO+PGyPhwkBZsDfN
         ULCL8b4UMozTlIHvCLRZtHZlSXlHy1hfUz6Z9ISPU1E9yIhgCs/OxYqc3uSIXXv/F0fA
         6xXQ==
X-Gm-Message-State: AOJu0YxgDny8wvKzirRkM0ekWvx9LgrquClPVPUyDfbuftr7IW7zViQ0
	E1z8f1rM8Vm6/egw15blbT4UZ0X1SHC9TOX5Xh3E6XcUUI+fP7Ew4GN576CsDMlM
X-Gm-Gg: ASbGnctG4Wp14eZq1NRx3B3MrzeSgaT8/eNLLGxR3Mqq4Trh5aLciHR0gZx4YgeCyQI
	mLrHwlqkrvIjpjsvpLn/4EhC/zlUvcOq9gpw2c0asZ5BDKsp9N/oRJfsAV5oGn4Bke7JcGxK9T9
	so1EFEFOQ2h+OZlAgvif2TBdRXLr8HJ5ITfvyAS+DDMXfw3ifQ09lquIocHh/jXuP5wOULiHJOF
	bHGzsX1T9h0oo2z2uNf/0Uud/nGmHaABP+joX9eFsd1HATTWhj8CE5IWnV+yodPak5xOhFuE285
	0ALBa3m39hr96OdDfG22T2AxJPkTsm1OI9XB/QrDEu1+hCwTF+3uctR2FEdSB8b7OQ==
X-Google-Smtp-Source: AGHT+IHnMIWy1H1Tv+ta+Me0Dv7dZRsJnwLsJQCdHcilS8xEjxkHxQEmioXaXNk3B3d904MYC/rGIQ==
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id d9443c01a7336-231de31b3e6mr209583185ad.25.1747691939770;
        Mon, 19 May 2025 14:58:59 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:58:58 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 01/10] platform: generic: mips: add P8700
Date: Mon, 19 May 2025 14:58:38 -0700
Message-ID: <20250519215848.27569-2-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145901_387045_6A311738 
X-CRM114-Status: UNSURE (   8.22  )
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
