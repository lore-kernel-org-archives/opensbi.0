Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD474D1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 05:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q0qdrYghS2aqBAHeG+uzLDAAvoQZd0ZE48VVUn4tAQ4=; b=wXEBr1Mk+/2QJ5
	A4Qx+ds2bc4l7l9UxEamY7ZAEVpfchRYYogzEVDGUPWlx2J4YPyyUrklDAcpGaNBgVxX/OpLeNqvg
	nXgzNnoJKdShHE9MpDsoh4YBGKChVzfIUY21rF/VTuGBfFz5lL58RL3hHE5TMLdShZb3rOvsvj01D
	bfRdUqCNGbaG491NdILtADIZNaTjlRIl2/8vh7kRfXYHfr5V2RT2ty+wqcJs6mnuXb4PmXGekzqx8
	N4/Hboz3ulUCkP8a3PAgUUMk19c5aRXFPJ0m2WJEeQY+J7DfWHHnye7nmFjgMFEfXNsgV3RihTKC5
	wg+5G49+d4s0U764hGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqK9-0000000Dqaz-0wVW;
	Tue, 09 Dec 2025 05:31:45 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqK2-0000000Dqac-2N8q
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 05:31:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7baf61be569so5714082b3a.3
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 21:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765258297; x=1765863097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AROhwC7MlRb2O5ZUXuthPp7JmMDu0SXpi2K+HwYBpjo=;
        b=NVCYKiHzZzwnL6UfIMUGzCeev4OSUTPjpRr+zTafng//pAZzLozS5C1BzCoXYQ03yq
         uRBCyc74pFDWegLdM+JAwuCl5HIIoZbAGxxrEJvW217S3daVXK/BpxZh3kLG+l8eI/Tb
         OWfzSmqiyGCnqd38GzC1deCH5lkwyFgZfwCKzExVQAjgLABlpXAhzLS73GKW1KSZ1YQj
         howCG+sXegf4UYiqrJ+qVs/I6SR6R8TCdh9qvGfX69ZNKmlseoaGM8VNerWZFcIgL7ov
         guWoT2YvJHRMsnH+VzuvN9LTNl3pTQdfcf2yM0fDKcOzz/7Ytpwaj30vVRqFOt+W1hkx
         CHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258297; x=1765863097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AROhwC7MlRb2O5ZUXuthPp7JmMDu0SXpi2K+HwYBpjo=;
        b=O4KMZAhsMgSDiKkESPIjRXlWEHjiObqyqqkeCnawi5YSB3oNjaEv0KbaJwO0xhpOhA
         yXR2zDyK4GO6SwugY8fo0PTeHmiB4ESh6t52DOcN0AiimxvBhikFDXdbgMc3DKC15E+M
         dyJ1vL67nHgfHfYMRNcZJvv1E08r5A1Ta6ESvtNoqQP78FJwr0LhRJDB4z66iMvavgZF
         W5UxQhfPbm8dqBsJLc5XqnuXG66XKTDt5IFYq8ylGPDzjcmOhA7Yn12J/QMKu5CXMSXW
         x4gCvv+ZSNfdwfAve31QX3tjH6X9DW/d249XuM4MFzNnBWq2l0uxoLXTkI1AHntsPtmG
         xB6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/9mT8kbeRclRE/jjBqfp2FsOcDz7YnoDXsVXq1bRiN2/Ei6cz5xexUPzVWgTtFf1nwoYigdCO@lists.infradead.org
X-Gm-Message-State: AOJu0YyN2pHWP3Al3B5Apg8DQnVHOA9Tq/IqTPozN0x3mS2+B5DPd0q1
	hhq61AJt2EkJnZa5SdanGtFdBdEZg/eAVZTpCLBLUwQFzASz8zdxUTTjl/JcZS+8DRmTd9qoP/G
	DAbbq10Q=
X-Gm-Gg: ASbGncv6XK+BeeRYKkfY/IEPF7YlVkdfMo6cX7H+f8zCIU80AE+hRku0XjYNrQ5+g3c
	AVNcdkiOjK4X9QJ5U4/eVkdB1ncuEzsBsR5bn5H80vghfZiZxjkCrrAi8Aa8sseNmYiohVsfz9b
	BjfTN9C29C4PCaCi1E8k40F2mdm7NWX8PdthNxtLKLunvoStiAfL5ahG1Gi+QDn6jquAzg0N6DA
	2Ufd36U15f6POjuQ2nXuPE6L/7A/XeFbx+kvoSGFbQrWR+S2Ecna+9ltv9LzYxIJSnSfcW5OZvy
	VVBSZXypPsnbrBdMHfI4cs/ZzLcJFAVgflYFLj1YLTrCcQb7wF7Ugkwvsinvp7Myb4tnwp6S7ZK
	q9P70FNlnCNTJmMHZWYxOn0vuPL7xpEvo3YUeV+6hqYtOszNHdhTOKFv/5vMD/dPwLJ4kZ5pKK5
	6az/aA5wlstcw3lx7KIbSaW3vPXkRfvsxLnmLZRsD11Ww9En4M
X-Google-Smtp-Source: AGHT+IFo9PjJVg4uK9ja7aKxpZeECIy2+49EqG71tiB3Dwu1N4eIiCAfkNlk8j1jpqFOspQG2nB4TA==
X-Received: by 2002:a05:6a00:3e22:b0:7b8:87e1:a648 with SMTP id d2e1a72fcca58-7e8c1661871mr9392357b3a.3.1765258297142;
        Mon, 08 Dec 2025 21:31:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5bf17sm14708476b3a.38.2025.12.08.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:31:36 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3] platform: generic: Keep some empty space in FDT passed to next stage
Date: Tue,  9 Dec 2025 11:01:30 +0530
Message-ID: <20251209053130.407935-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_213138_635457_811FFD99 
X-CRM114-Status: UNSURE (   9.29  )
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

Leaving no empty space in the FDT passed to the next booting stage
causes the following U-Boot crash on Ventana internal platforms:

Unhandled exception: Load access fault
EPC: 00000000fffa6372 RA: 00000000fffa7418 TVAL: 0001746174730068
EPC: 0000000080245372 RA: 0000000080246418 reloc adjusted

SP:  00000000fef38440 GP:  00000000fef40e60 TP:  0000000000000000
T0:  00000000fef40a70 T1:  000000000000ff00 T2:  0000000000000000
S0:  00000000fffc17a8 S1:  00000000fef38d40 A0:  7375746174730068
A1:  00000000fffc17a8 A2:  0000000000000010 A3:  0000000000000010
A4:  0000000000000000 A5:  00000000fffc17b8 A6:  0000000000ff0000
A7:  000000000000b100 S2:  0000000000000000 S3:  0000000000000001
S4:  00000000fef38d40 S5:  7375746174730068 S6:  0000000000000000
S7:  00000000fef4eef0 S8:  00000000fef4ef90 S9:  0000000000000000
S10: 0000000000000000 S11: 00000000fef4efc0 T3:  00000000fef40ea8
T4:  0000000000ff0000 T5:  00000000fef40a60 T6:  00000000fef40a6c

To address the above issue, keep some minimal empty space in the
FDT instead of no empty space.

Fixes: bbe9a23060e9 ("platform: generic: Pack the FDT after applying fixups")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v2:
- Fix comments in generic_final_init()
Changes since v1:
- Add Kconfig option for amount of empty space in FDT with default
  value as 4KB
---
 platform/generic/Kconfig    | 5 +++++
 platform/generic/platform.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 25b8886b..b1808012 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -23,6 +23,11 @@ config PLATFORM_GENERIC_MINOR_VER
 	range 0 65535
 	default 1
 
+config PLATFORM_GENERIC_FDT_EMPTY_SPACE
+	int "Platform FDT empty space (KB)"
+	range 0 1024
+	default 4
+
 config PLATFORM_ALLWINNER_D1
 	bool "Allwinner D1 support"
 	depends on FDT_IRQCHIP_PLIC
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index e66f99fa..01fa03e0 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -245,7 +245,10 @@ int generic_final_init(bool cold_boot)
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
 
+	/* Set the empty space in FDT based on kconfig option */
 	fdt_pack(fdt);
+	fdt_open_into(fdt, fdt, fdt_totalsize(fdt) +
+		      CONFIG_PLATFORM_GENERIC_FDT_EMPTY_SPACE * 1024);
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
