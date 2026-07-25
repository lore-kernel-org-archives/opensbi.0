Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805F8C53219
	for <opensbi@archiver.kernel.org>; Sat, 25 Jul 2026 02:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g3ajHRko4xjj0zRrBCBLZ3JSXRD4lL1WgL7P6ENwWpk=; b=SGZPU8kFR7FLgd
	hewgimqPmGLtPHNO843rlKdhBTUpPvmNowmLIt5jjCHqHGeiSYgozpObkPx9CIJLuGw5R9D2XApIO
	23bhw3EDaMlF7E4/qSmUI+nNQUOI9Qd/P9jc+ekH9tSTxdisppxq1cWb7derT9n5Px8JykL6JsHwR
	3sPsmQgr+HrCEdWGpBM3iWdbURaIPcNaKz9jMzmfhKrznSqD4aB26Qzvv4u5seNjgYdVsJ6aUgLZc
	WZL+2Azz/nuc0XhWIGDkfQFtOQxLaC/iWSFSy1tcZItghU1+GZkWFhUtOOwaZHJ8DXibM6LtpHPxk
	pw/wWiPJ+uXL9afagbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSI5-0000000HUWu-0Gdd;
	Sat, 25 Jul 2026 02:39:05 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSHe-0000000HUVL-16VY
	for opensbi@lists.infradead.org;
	Sat, 25 Jul 2026 02:39:03 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5bf959b820cso653179e0c.3
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 19:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784947116; x=1785551916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ohromMvo3ok+AnmNeO2yFCFG7+nkoI1+JhEPHYDPwI=;
        b=HHo/QQVZxdrkVXl/YS8IyPD4EHU2bZ4980vYAOfh/ow7jG0+J4VDF4z29rmqO6QOru
         ZvWSp4NoNvVzQmMpz68glqfOFtYMkg+AZPhrzdSYPFLL8z/uoippgt1y8MneDE4oph7L
         /01uu7xUoIhx5bHIU5CJuljncG4Ve+LsqlKDtrik3nzgJRRvpf1wen9DS+0qFAx34Pdw
         quKjwWCg8UrBOtupsIk0i54DGyQMWJ2/dZxBUPRtKWeCJnK0LLLpp3bpeC/mTE6OofrZ
         gDAa9mQ7oanpjDVU3COW4wxnxb4kVwflPcxQT2wtiosgp2VgqeWEYueuBnY31CG1ZwfA
         DWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784947116; x=1785551916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ohromMvo3ok+AnmNeO2yFCFG7+nkoI1+JhEPHYDPwI=;
        b=nEqgCvGy6t2IQ6wBbwSuxiP1cMXo8hSAi9TjfYlz9nwh0dhWL6UW5iy55Ioy8k37b+
         LmOx47MlZSQNT6pYH2fDt2n70aw9MZgSpTMbwXxLCQzP8bZgRgx4v1Ngc1PSyB0dIbEl
         vAc6sUyPXvqgQDNkLfm+jj9SJUaK03bjbXZfVYqOLoLExJP70GuhfbNVmv1fCaamjjfq
         7ykzJIQr9PGjkqu28xIL2I4gCMFEdiGJx3C3ZPSIwD1zqwjmUteDtsvlOz6E7rsG6k4Q
         /sdPh82KlWGBfG3wUKOYj4QpSpW0OEfc5gjMMCnxu8YHHnr8DlaEX2nMS9arv0qK8vHd
         /W2A==
X-Gm-Message-State: AOJu0Yz6bkSYUIb8SNq+FWXP7DIjgErXpFhQ0uYZ/kboCSt/i0wQMikb
	vT3jtap8pg6bu144rhfO/UIY2fRKtH9FapDAK+rB6DV9KiPpiXQVP/jy3BNIrQ==
X-Gm-Gg: AR+sD12ZdPepWJ2Lb/QnHd10x6DRVyt07rAsvPALoqX/zXLxEOtI0qXB/KIONKFgNBe
	2Yc+txQP+hVlX2OSqZbpsFBoSALyxq7nsAzSKR6OCMR6QHHLczSUEpbPGdz9pIqADHFXUMfQujq
	jSR0Iupo+OogX0qJ0fTFCgN9dbkh1ZbcDPKx59TGJjaTweWxRTGW0XNtDvSquK7cYGeTC7EE6tC
	7eAKPPx8+xrEXU0Z1WcDeLbj3g+lZtmorpMKiuXEpSqy54m6YX+1GARWImQMgWaUmswEgjs6C+V
	Z+5SK/4qsYZTfpFivEP/NMyBTUpypvldbDaYv+CnCZA7d4/3PzRLlwlVqg/RJWdPOHuO6hz0BPl
	EvxT9v/G4yvR0COx6eeUo8Fr4xdnTPLUwzdmwAgzIqiDHePnf3AUk684Uv2rS6NaKRfDgbGdSvT
	MdiotxQiYEkpCr/fmtMGwl22VRsISvRGmBxXya1dQrGVBeKhVYtGNsV/16PTk=
X-Received: by 2002:a05:6122:134c:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c306bc712cmr515323e0c.1.1784947116132;
        Fri, 24 Jul 2026 19:38:36 -0700 (PDT)
Received: from ubuntu.localdomain (23-91-246-209.cpe.distributel.net. [23.91.246.209])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305734410sm602529e0c.16.2026.07.24.19.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 19:38:35 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH v2 0/4] Add WorldGuard support with wgchecker2
Date: Fri, 24 Jul 2026 22:38:17 -0400
Message-Id: <20260725023821.3795618-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_193838_340578_68FD6C84 
X-CRM114-Status: GOOD (  10.91  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

This series adds WorldGuard support according to the wgchecker2 DT-
binding [1] with QEMU virt integration.

The implementation base on prerequisite series [2]:
- reuse sbi_hart_protection for hart-local runtime reconfiguration
- reuse sbi_domain_data for per-domain WorldGuard state
- keep WorldGuard-specific setup and checker programming in platform
  code

At boot, the generic platform code invokes a QEMU virt WorldGuard
setup path which:
- parses wgchecker2 checker instances
- parses resource access-controller entries and programs checker MMIO
- parses per-hart CPU defaults from /cpus
- parses per-domain WorldGuard metadata under hw-isolation

During domain transitions, the WorldGuard hart protection
implementation reprograms MLWID and, when available, MWIDDELEG and
SLWID.

The series is split as follows:
1. add reusable FDT helpers needed by the WorldGuard parser
2. add WorldGuard CSR definitions and hart extension flags
3. document the current DT layout consumed by the implementation
4. add the wgchecker2 / WorldGuard runtime and QEMU virt integration

[1] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT
    bindings
    https://patchwork.kernel.org/project/linux-riscv/list/?series=1113881
[2] [PATCH 0/5] Extend hart protection abstraction for ID configuration
    https://lore.kernel.org/opensbi/20260717074413.2536416-1-anup.patel@oss.qualcomm.com/

Raymond Mao (4):
  lib: utils: fdt: add generic domain and property parsing helpers
  hart: add WorldGuard CSR IDs and hart extension flags
  docs: document WorldGuard DT bindings
  platform: generic: add WorldGuard support with wgchecker2

 docs/domain_support.md                        | 186 ++++++
 include/sbi/riscv_encoding.h                  |   3 +
 include/sbi/sbi_hart.h                        |   4 +
 include/sbi_utils/fdt/fdt_domain.h            |  13 +
 include/sbi_utils/fdt/fdt_helper.h            |  10 +
 lib/sbi/sbi_hart.c                            |   2 +
 lib/utils/fdt/fdt_domain.c                    |  46 +-
 lib/utils/fdt/fdt_helper.c                    |  76 +++
 .../generic/include/qemu_virt_worldguard.h    |  13 +
 platform/generic/include/wgchecker2.h         |  78 +++
 platform/generic/include/worldguard.h         |  44 ++
 platform/generic/objects.mk                   |   3 +
 platform/generic/platform.c                   |  15 +-
 platform/generic/virt/qemu_virt_worldguard.c  |  25 +
 platform/generic/wgchecker2.c                 | 500 ++++++++++++++++
 platform/generic/worldguard.c                 | 553 ++++++++++++++++++
 16 files changed, 1569 insertions(+), 2 deletions(-)
 create mode 100644 platform/generic/include/qemu_virt_worldguard.h
 create mode 100644 platform/generic/include/wgchecker2.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker2.c
 create mode 100644 platform/generic/worldguard.c

-- 
2.25.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
