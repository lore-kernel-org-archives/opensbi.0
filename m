Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11DC369DC
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7SbxYsYPCjTPq22FO5NEkU1s4PI/EJ97JzfzQ/YWTs=; b=lv7SAagdXdBuqx
	9NzCGOySkoRrcj0zy7Olri0tsWofD70RPCU2N52BncSfPkm4K0mAPeZI/PtbzVMlECz1hCXC+q7zy
	dreOaam1zFE8Kva+y2Df/LCzrrnD4OrlZDUB2MzTfG9SlY6XgJSSF4B3JJLPLQqw32vzUMslvlcdS
	S9r0UaL/6o5g+dOQ6dfFkxXL1+C3yAHc3SgQhWz+dnSgC3RCIArPvnLj7Tljn80M0rs+ux7WoJ7qQ
	xFzk0kGwoGcPcFsMEPR6HwYG2ZGdY+57VXLTB7UxdVTtKFKuwfDFBWjS3AtSuFHfj0TSpgg/Xxn+q
	AkiKL2aP4uz8Vs23zthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uym-0000000BDfg-3qzB;
	Wed, 30 Apr 2025 00:07:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyi-0000000BDdq-0vkK
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22435603572so75961695ad.1
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971627; x=1746576427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=NOXgbIMgwrtW6cIJCMkJSHYJcu8+f6gLUfYWdp+tqNqjg5YT9agxS62HFLbmahyi3E
         DCTC3CA7+NVLHr0/uOEhV6thqzp0vnSgxhlYEhN1Xl1fW7SfZIhRtdbfooxbE+HFKBDm
         XdIGndu1n03eOsSgv99T/nhhJlfgZ7y85C7H63KSGWnQoiyuHSe/Vn1OPz98ehwSi0eC
         kTcxzP1XFEDUuEBUtdw0VNsJjQ3ZKLDc5GNYZ53LWP6N7HWTacY8ZhChSWBgaLTmiFHQ
         jSqsj7SOJb1Qkdunrg+A/yO3U3KyYF2p9R1YialDw4UB8rM//RLts4Qt5ks18VI+9w1P
         GWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971627; x=1746576427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5/JheejekbVd9Z1qmhhKEKE9tsbC9xlMXIMeGdAGs8=;
        b=nAJeUHs56l84Znrf6YcIdG4Fg+l3Iy3le/0j8/GWYiFfGrLF2fKTK1KVJKaId6dRNt
         PyK0vFsgLVQD3TLfWHs8JycMpOc+Bcrm+83ld75ouywEokIpriyZUY8HRfhkrceqU+nl
         dHaX7LLZSiVVVgZMEGyKAygw6s9AZMqUFrphlr2WllUUzJ32ix5b+LNBwGx3Zg2ZFFgZ
         sHG4yn63xiuhnu456tT0aLrnftoNW90ICHRPK9Cjb869868zVOaO916zu6quHTp380BP
         v6v0KcZP/66c/S9UJpsjUogiaVlbb6Zez1noUcIh99Az9pFML83eSYbsk1oVSE5a/FWG
         dz0g==
X-Gm-Message-State: AOJu0YzzZ1DmznbpmaERLNvR2SBLv0LC974fo2So2NdFSRGA9pQXW5/E
	9lXyBTDSKu8ZWGljLst1VPdn9l5ujSorRdGS1wOFH3KjCfLHJ2f1uusLCg==
X-Gm-Gg: ASbGncv320hEcfbtnUQM4juPzp9Kod9YVGjw6+VYOGH9xGmr8Ziau21/0Y33pZ8IYOB
	pC0pBxHMZRZKZC0CUpbfeS9KBGYPUKk+3J1hGnCwRjx/NCbAPaOwOq4HuOkpGbYPo5fEF8RVeMi
	Ng+q69n1RxbcsIQIWrQAy1lMrZw0U/BfVFD09TkKutHK94IRgA6DHGRPFCpS1pdAB3N4FK71fhX
	0c3ZMMXyQL17nciF9rytnu+d81ZOrMsYlW/j0kesOLPwtKIKQ8DUeNNUG78acMfVu2U7fOp3D55
	Hh+/6QUZd94hOyfuilTNH7VdaAVVoXHIa+1u/ApqZiijWnE1bA0ZlA==
X-Google-Smtp-Source: AGHT+IENX4SZh8OXAa+xgUfQhlmY2U4IQDskkBYUXQJRnvRJw9i+N3IDAROSDo7PkmIWlo5wt4uQHQ==
X-Received: by 2002:a17:903:13cf:b0:224:1935:fb7e with SMTP id d9443c01a7336-22df34fb196mr20744625ad.24.1745971626967;
        Tue, 29 Apr 2025 17:07:06 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:06 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 1/8] platform: generic: mips: add P8700
Date: Tue, 29 Apr 2025 16:29:21 -0700
Message-ID: <20250429232928.6499-2-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170708_258495_B8BD10A0 
X-CRM114-Status: UNSURE (   8.24  )
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
