Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47699C5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T2O4i8yXf0zCx8UPkyuYT27EmG+usNvIBhPeOgNGDvs=; b=PLJcrlpwKk/Ro8
	0SJd+b8CnJY+PhKfoXx8NF1MCRR/0JCVdgKpWckYwe+kGKJoHAapg2T8gb6v3rHSlLmxQOTppYoD9
	xpmBNZrxpJsHwivxYKfGsHLe90JLE/UvJMlZUyMfNyFFC6ZlXbhZJFM8riKny34gYtB9KyoLXYsr4
	rU2uk/pj0NR+fq3ngGWCPehkOnsQwZVahOUgFeX9x1VruSd003Ye99542TuE55QON/yURT1aKrA/O
	MuVhl96B8fWvMK3StNjiAcKYA2/Az7uTvzzegR4S4ebeW0RVTWaYRruMeEinuqqm1cyuSRMJn+tLM
	OCZy9O7AJID1BZ1FXOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHW-00000005lU4-31j7;
	Mon, 17 Aug 2026 09:05:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHT-00000005lTE-3HKa
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84a652535dcso1789501b3a.3
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957518; x=1787562318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oxu4dLnalivTtiaRQmIPckqMcQxj0RkUqqPuFZ60Wrs=;
        b=SujsqkT/IsWTSADnod+FQMciYl29qY//mpGAGpoqwoUURv1MXMCNnArA2cqZyHhkJ+
         VHl3q/jfBBY6Qu0ikXRtcnkSHRzz/nRIE6RziZOREGfMSNanfOqpUQDUof2tU/Hzu3jB
         GnjKzbCkIjgyIPzFmsc6OaGQdhdjp7xEubBkUij5wNfBKgtHQPEJtVcrEglJweqmyWMX
         qsfbCE+1wgZOwSAkuE9LCxDbXiLtNmDftU5D9mGovFUOaqTRbD/l+GeN1eaZzmi5Hlcf
         mIuo+d8aFtHXCv1xS2mRL6hHgSSRVxaGiuTPuElca/fGvflhH3QdOaOAO718BTS6fmhG
         g7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957518; x=1787562318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxu4dLnalivTtiaRQmIPckqMcQxj0RkUqqPuFZ60Wrs=;
        b=Fv+RpiVXajmNvD4jHIly18cYSOY3Hb0qJT7XPhDYhieGTbS8bTvgwgfMfRA22xCCWg
         EnTWYGlLtMiZvYAmGLvFZq3OtNGrWkBgj/GR/+mvzy2pjs358lOX5R8HeTQu9JT7FrmT
         lt9mT8Qmq0Aa5xuGgFpZ7gkF1/PvpvRDyO3Ioyfh+AF0RBRNnY/59I51LOm6vVBVEFsg
         oprPCvPpAsf03AFEfv//SU04hCy7pEmXjRWih2BH/I0/eXskL0pCfwnRUYFdEf7woEeH
         oLKi6Q4TT/cA0lOWt2ttsS0A68bnWCq1BVC7mkdsiT1voMj5v2Mg+H0q4LAF8MPZYyn9
         q7Kg==
X-Gm-Message-State: AOJu0YxmKFsWhnlhRvPdPn0P9v+jKOl2At32/UsgKYsYxzZF6WZP1l6t
	B6oxRAiJj+8tlag0LyczkMFxJoCP8PuLRwgBnG1TXfYlDIy5N3ZEpivS/aRd8gobFfKGy8iGk3c
	vqx97QDrnHGxmGIMgJ+Gb9w1P6BnCsTT5buyISc4DZ76yKDbcvBjVCu98v8f4yjtDA3R/FOc7PS
	H6hgUBsCEqpoiKYGEs28d8lhcbVQCEZMxrjGws+Jq5y/69y7QyFI0=
X-Gm-Gg: AR+sD116xSnxGyNxVkd36goCndAaQ6iMm4PZ7NUk7QbZSydAiCpNb7HTKuvpnsQwYfT
	bnShSJKzczPDqab0xt9e+r3SCKa3cuySHW3Bl9HTxwmihbsD9aadGMM//U/IeYEMPv273GxAeF2
	14c1lCPXluUssXk+enhkvR4elEnWTi1bVbUZ52HCklx56pqTq7JnqQsTW6XxAWol46d3AC1WWHF
	4AR7Z+UG/04DbuIGTOOlmnVQQLSdww2HwpJkS7tXix90V6ddGITW3/A83d4RicjEoSu5cSs1JIR
	a3rpicHcDOEGW/6L/J+NT24i/bY+Uw0zP8k8ghDB1su9nqPRCZQft1UFiy6c5fJTfitUiuIrcdd
	s4KCi1SALMRJKNqIc4uxpjHdpbge6aMZellHwj+bznrsztg7IBdJ266IkXhbCfCokbiJA4JWHTO
	Yq7NswCj0LfHN954NgF7Y+g8Pkl0rmywpY32cjPWoMjjJ+hhkzBO45cWKb/sQo7mZsXtolc+cQY
	IN1XTWXxJcG
X-Received: by 2002:a05:6a00:348c:b0:845:c8f9:6ce0 with SMTP id d2e1a72fcca58-84fde2e93eamr25167274b3a.21.1786957518260;
        Mon, 17 Aug 2026 02:05:18 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:17 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 0/9] Add RISC-V Worlds ISA support to OpenSBI
Date: Mon, 17 Aug 2026 17:04:54 +0800
Message-ID: <20260817090503.2104998-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020519_837183_5FFAB091 
X-CRM114-Status: GOOD (  11.64  )
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

This patch series adds support for RISC-V Worlds ISA extensions,
enabling hardware-enforced isolation boundaries based on World IDs
by extending the OpenSBI domain framework.

Trust Model and Boot-time Roles
--------------------------------

The implementation follows the two-phase M-mode trust model:

- RoT M-mode phase: Prior boot stage (ROM/SPL) that may program mwid and
  mlwidlist and lock mwid before handing off to OpenSBI.

- Regular M-mode phase (OpenSBI): Treats pmwid/pmwidlist/pmlwidlist as
  input policy from hardware/RoT. Locks mwid to prevent later M-mode code
  from changing its own WID. Programs per-domain mlwid/mwiddeleg based on
  DT configuration.

Device Tree Bindings
---------------------

Per-hart properties defined in linux kernel DT bindings v3 [1]:
- riscv,pmwid: M-mode World ID
- riscv,pmwidlist: M-mode permitted WID bitmap
- riscv,pmlwidlist: S/U-mode permitted WID bitmap

Per-domain properties (see domain_support.md):
- wid: S-mode WID for this domain
- widdeleg: WID delegation bitmap for this domain

If a domain node lacks wid, OpenSBI falls back to M-mode WID, all
modes will run in the same World.

[1] https://patchwork.kernel.org/project/linux-riscv/cover/20260812122131.1534906-1-peter.lin@sifive.com/

Yu-Chien Peter Lin (9):
  lib: sbi_hart: detect RISC-V Worlds ISA extensions
  lib: utils: fdt_helper: parse RISC-V Worlds per-hart WID properties
  lib: fdt_domain: parse domain WID properties
  lib: sbi_hart: lock mwid CSR for RoT immutability
  lib: sbi_hart: add WID protection mechanism
  lib: sbi_domain_context: add slwid to per-domain S-mode context
  include: sbi_types: add PRIx64 format macro
  lib: sbi: display World ID configuration at boot
  docs: document WID DT properties

 docs/domain_support.md             | 36 ++++++++++++
 include/sbi/riscv_encoding.h       | 12 ++++
 include/sbi/sbi_domain.h           |  6 ++
 include/sbi/sbi_hart.h             | 16 ++++++
 include/sbi/sbi_hart_worlds.h      | 24 ++++++++
 include/sbi/sbi_types.h            |  2 +
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/sbi/objects.mk                 |  1 +
 lib/sbi/sbi_domain.c               | 31 ++++++++++
 lib/sbi/sbi_domain_context.c       | 13 +++++
 lib/sbi/sbi_hart.c                 | 38 ++++++++++++
 lib/sbi/sbi_hart_worlds.c          | 72 +++++++++++++++++++++++
 lib/sbi/sbi_init.c                 | 13 +++++
 lib/utils/fdt/fdt_domain.c         | 50 ++++++++++++++++
 lib/utils/fdt/fdt_helper.c         | 92 ++++++++++++++++++++++++++++++
 platform/generic/platform.c        | 13 ++++-
 16 files changed, 420 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
