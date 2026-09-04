Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86064C79F80
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TuwjkbxMDRRaQMfUlGlGvLf2p1D4sjiEHm5S25unKVA=; b=RlQboTJevaWx0G
	MTDBUMjmRcRCXXih+dICPDwifp5nCBRxgnIp94AFD7hR79OeQILIlvcAJZNhi7p/XzDpbiXcpMfXF
	BOEw4imS1OfDb//uHxBO1rNt+5SLFt8au45Wy9ullq0anfxarI749/gzRnF5c7nUcLqQ+eSNu76th
	NpuBwakwxDwJ2mK0uMbU2oZftyo47PJT2DJAQKyl5YdQCqoJgJRl0OXLc89WF7hBrzsBx7DQ95IUD
	Wt3hdufe+deg/ip9pIxxHVfZgaqywZw0SHL1khUr4S5/E/B4QChwKdGZ5YwmnHttlW3W4JrLX6ppk
	1eZ5PHT7IZTbIKFjXlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnC-00000002jWa-1uJy;
	Fri, 04 Sep 2026 16:29:30 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wn8-00000002jVv-3eTS
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:28 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-66fa10f35caso1329209d50.3
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539365; x=1789144165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEnx9uKbaU6nJ0k++Inc4/8TPtuyjO7t6Rxx+PeQql8=;
        b=S6pWYc+J0TMZFTj1sK5zs8AT3mosd34xIIyfRe9UNEHldW8u56Hg0O3SjMFlshzcks
         2oNmN1KS7gaYg9q5dduZGfZiv1FPkvSXpVn7/Eeispz4Ut5Qn3bB50liEkhHwbLlk2vF
         6yY/QKswh+gmFzHYKxYqdnVjyxcYOXX3NkKK7ufA84sP23D7ujizVo0suysQu3I1jrwv
         xOCGq6VoIvXaJf5LnnFenKSu2ybiizUcyc2TpwaQoF3kG8avViM3eGy0UWY2Ijt/Et0T
         FqhtX2KEZ+BBZJRKV392V12pTyM/yo++r/T4K3ap+hykgdr5ZpPhBh2XvFxpUwdIr1G7
         pAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539365; x=1789144165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEnx9uKbaU6nJ0k++Inc4/8TPtuyjO7t6Rxx+PeQql8=;
        b=lJEVPU9SKoH671o6ZRyBPbAP4PNlvcpeRUyEIMRiLDFs3VCl+oCrLkQB1wnuwU40XX
         RS22brCaJDY7mUSfL77mk0lkPdJaV4IBzmSX8J1DQUpmTNRoAFchI/0ZJgecttJJMZWl
         y28akUgLw5NiQOhugXog9Yb4ayVnF7miHiBG5iqUBhE8J8uB4iIXYyspZ/FHVnn+RRgU
         YdA72UrddPOi0Xb1Ye/IHuzVX3vXXmRcH7gHDaozNveOyp55pZm85xCMDAYXfTRlX5h8
         6LVDjkSsz195tv9w+hZb22D8jjlRjbIOUb+5gDJlYoL1420tx9rCjPfTF+pXh94/YhZp
         wKnQ==
X-Gm-Message-State: AFuF++kxv+Vc2o0ijY/WlwbsR861TznUCvZoMqBvw/lnJBFfBjMGwlkL
	IfYQjBwrtkheVeuCZ1Pwq2/4FUzNEZpMey0IMB8t7gLlPN9HlSWdbAXL6hrwVA==
X-Gm-Gg: AYBFou35Sss+aoftvtf38zcRjW2S+keH5e7X48KTHqlFz06N6hP4+kNJvQ7fWLYaC28
	0uLJfTWV1YvD2ZXenK1o8Ok8os5hrl9FdX2iWQX8bVk3qMNLJYuWybnRvQKjBuFOy+FBvfmSOzy
	tPbSFV8l8KKlvbF1Ekkd3N1vpIvCrNwOpkT1KiLmpPfd/lPTr6w0x/mPtqQVwbQ9nT3pHpaNVyn
	XWbjbwTlI0dW1EXDYAM//Xj2J0WQQzMEY72Stw890CQjHRCFBAYNCZ5GdhDqO7ZUwiE7rugreVH
	deo3IZGVplu3z1VmfzSe+kkUglUUciecIybmpfEmTxMMV9AsYZW+bQzY/2KtWZqQitYkdCdEN4l
	xmfYTykAbtzy5fAjCAgTWDqLainGL/+S1tJRQCFuwCRy7ycuS+QS5ycdJCscg/xCT0r3ejT7vyh
	EcvBNe18hNQnNdpgSofpIJN/EVOu1PwlXYIkqkgWGA5J5tUXgrcqaGFpXOeKmwDtwdM0SmfP7Gy
	OMwajYeQSM=
X-Received: by 2002:a05:690e:43cd:b0:66f:c1bc:4007 with SMTP id 956f58d0204a3-66fc1bc42b1mr651672d50.52.1788539365096;
        Fri, 04 Sep 2026 09:29:25 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:24 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 0/5] Add WorldGuard support with SiFive WG checker
Date: Fri,  4 Sep 2026 12:29:10 -0400
Message-Id: <20260904162915.1092353-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092926_919874_5F6D8A04 
X-CRM114-Status: GOOD (  11.38  )
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
binding proposal from SiFive [1] with QEMU virt integration.

The implementation:
- reuse sbi_hart_protection for hart-local runtime reconfiguration
- reuse sbi_domain_data for per-domain WorldGuard state
- keep WorldGuard-specific setup and checker programming in platform
  code

At boot, the generic platform code invokes a QEMU virt WorldGuard
setup path which:
- parses wgchecker2 checker instances
- parses provider partition@N entries and programs checker MMIO
- parses per-hart CPU defaults from /cpus
- parses per-domain WorldGuard metadata under hw-isolation

Checker programming is provider-driven. Consumer-side
access-controllers references are carried for DT-binding alignment.

During domain transitions, the WorldGuard hart protection
implementation reprograms MLWID and, when available, MLWIDLIST,
MWIDDELEG, and SLWID.

The series is split as follows:
1. add reusable FDT helpers needed by the WorldGuard parser
2. add WorldGuard CSR definitions and hart extension flags
3. document the current DT layout consumed by the implementation
4. add the wgchecker2 / WorldGuard runtime and QEMU virt integration

Tested with:
- QEMU riscv-wg-v4-260821 [2] with arg 'worlds=on' and the merged
  WorldGuard test DTB.

[1] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT
    bindings
    https://lore.kernel.org/linux-devicetree/20260812122131.1534906-1-peter.lin@sifive.com/
[2] https://github.com/cwshu/qemu/tree/riscv-wg-v4-260821

Raymond Mao (5):
  lib: utils: fdt: add generic domain and property parsing helpers
  hart: add WorldGuard CSR IDs and hart extension flags
  docs: document WorldGuard DT bindings
  platform: generic: add WorldGuard checker support
  [NOT-FOR-UPSTREAM] platform: virt: add QEMU WorldGuard overlay

 docs/domain_support.md                        | 212 +++++++
 include/sbi/riscv_encoding.h                  |   4 +
 include/sbi/sbi_hart.h                        |  10 +
 include/sbi_utils/fdt/fdt_domain.h            |  13 +
 include/sbi_utils/fdt/fdt_helper.h            |  10 +
 lib/sbi/sbi_hart.c                            |   5 +
 lib/utils/fdt/fdt_domain.c                    |  46 +-
 lib/utils/fdt/fdt_helper.c                    |  76 +++
 .../generic/include/qemu_virt_worldguard.h    |  13 +
 platform/generic/include/wgchecker.h          |  91 +++
 platform/generic/include/worldguard.h         |  36 ++
 platform/generic/objects.mk                   |   3 +
 platform/generic/platform.c                   |  15 +-
 .../generic/virt/qemu-virt-wg-overlay.dts     | 198 +++++++
 platform/generic/virt/qemu_virt_worldguard.c  |  25 +
 platform/generic/wgchecker.c                  | 546 ++++++++++++++++++
 platform/generic/worldguard.c                 | 544 +++++++++++++++++
 17 files changed, 1845 insertions(+), 2 deletions(-)
 create mode 100644 platform/generic/include/qemu_virt_worldguard.h
 create mode 100644 platform/generic/include/wgchecker.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu-virt-wg-overlay.dts
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker.c
 create mode 100644 platform/generic/worldguard.c

-- 
2.25.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
