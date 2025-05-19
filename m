Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9F2C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ8afiqirscGWsR2bzacokx5W70OfBFWSJmuMGRt1rI=; b=yjabV7/mrhZ2FT
	ovie7IvcNeWWat6t5ZAXCLbziMLkdhhxklZzN8iZIZNNCEX7zfm8etferbPhmYwdLkJlR3bFarAub
	8Bd4/XSPq0QpvNRIxz+7xPYi5aq2LERQ23eW0N8fbVYADux+ZsOLryViLuWvUrUq3JPZMvsYdhuo9
	88e1KtW26w+mbdDCCpIPSjFH1qVMCeuEhRWKxE2zVAP8lj0r3sEUCdtPZmiR2s+Vg3JBEs6Hv4Myv
	hpOiUOZ/PlCCNP6rL3dweWsK9Fe09NQPKA50byFNSsn2dQXs8OPZgrqvmh1rYFUv6Zs2jRbr8DyAJ
	2TVpxpgPfvC+8wIZW3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vo-0000000AgAd-1Ebx;
	Mon, 19 May 2025 21:59:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vf-0000000Ag8C-4B5f
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so40392555ad.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691938; x=1748296738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRtQW2SF1TMh8bga61BQuE/Ux1/AXZRLnjcZGDRynI4=;
        b=gSlNWNHHMrjJ7NOj/eKYYqMkYd1OkemifaBS/AYBjbpxwXHif8jlwwEQAOXeDsFU/A
         utjr1kORfCHZnoCHlgYiSOGK4NciWcdavKxw47atbEwFe9+Be0sX7o/bPs5MkEz2vAd3
         J3So8C3Jnu7uOrKwxfqR8GRN6pdcw7sLM3hP8VtHw3rwPTHdSLYDSJLhHnnbnvhkRoZZ
         MdPUbvaoxEF9H0FKVJqtELbmbdZIPS1w3tGPoVbHEpQ8+XjXbRLvaTKYJZnTe0IyhXXs
         MWFHCVOaJcfmjV9bViwNPW7a7aOlcj3FnwTyPexRtnGFlscOHi7cL46/J9Rep4B8MOv0
         VACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691938; x=1748296738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRtQW2SF1TMh8bga61BQuE/Ux1/AXZRLnjcZGDRynI4=;
        b=HnQbv1gDlzIISb45V0Pnb/UfIyKZO36y0I/595PdtvlZffz82+e8JVO759IE/+Ae5A
         PMCwqIKHhoJfrb9HLSp1uIgT36FhAqPrtqACp15jCho7b5vkKyl7+I+9sQAAX5bLGDlB
         OabmbJhhlK6h/9b2NiDSf/k2AbcKu/OlJoDglY+c8xrdsPkqI5b6mjbustgZsngWz34e
         MLlWKXFCshTnLGYG2Hx2wzlV7W2pAP0F4XsZ6cSBpQi+ozMNZdOJP7U8a2HIk2f2eSgb
         VzNf+uFwswX/I5A00tM90/Oz62nnHSiBCf1cF/N9aDl0wECZ74vjumFAV+pe1d9CaVwP
         /yHg==
X-Gm-Message-State: AOJu0YyDeZmblMSzp87M29BHWtY3PNnlnM+t29cT+RFySf8S1V1qxqBi
	eMHg+bRerneG5sprPb+AB2/GgXPw6cOz95FrH94fQFWFhbssT6pRasTU1LY6X6ZT
X-Gm-Gg: ASbGncu4lENQWBV/g7xVvfJNKZ/ef6DBq+Iz2D/AS0kMcJB3VpGhKzbt3TmmnuzXcoJ
	3NZHJqx9ZcL+300yzS+rq5Q/+tg0gWGXiBXKa0BpDKA8mcwFG+yhQRmxIc6FBbdAXczpQCSVhcV
	K/LKu0nbAtsd4J/CkptaJtI8Y6vl9dDYIF8nwzWV/aqnHoBm05gohyyx3lkAWg5d9+rDngRhIwt
	mISP2K18UZ2toLvaF7Ntvsu4Y55e/6GMa4z9h1Y4RI8g8S8mV6zXX+QQMMxqR/43isqWa+A+hFx
	KV1LYQ1igMoZgno4/8XJSlDJUk6Uyj8YbM8X2yNFGFr6SFV+YdguGygIt6k/LwXOUg==
X-Google-Smtp-Source: AGHT+IGX7xxHS6RFfYJ/TcInUUXkon0cRyK5E0iDdXyU1lCF0ITor/OmPviKNl8chw67vomYmqi+RQ==
X-Received: by 2002:a17:903:1b6d:b0:227:e74a:a05a with SMTP id d9443c01a7336-231d454dcf6mr227293805ad.44.1747691938149;
        Mon, 19 May 2025 14:58:58 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:58:57 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 00/10] *** Add MIPS P8700 Platform ***
Date: Mon, 19 May 2025 14:58:37 -0700
Message-ID: <20250519215848.27569-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145900_039007_6B96E4CD 
X-CRM114-Status: GOOD (  11.57  )
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

***
Changes in v5:
  Drop the amo emulation code.
  Change to use macros to insert instructions in p8700.c.
  Add 3 new patches to recognize mmio regions and set up cacheability based on
  mmio regions.

Changes in v4:
  Remove code that overrides nascent_init.
  Update p8700.c to work with the latest override.
  Use csr_set for mipsconfig6 in p8700.c.
  Add riscv,cbom-block-size to the dts file.

Changes in v3:
  Remove stw.s, stw.h, and extra scratch space.
  Use nascent_init to initialze MIPS CSRs.
  Add amo emulation via illegal instruction exceptions.
  Change to use AMO and RDTIME illegal instruction exceptions.
  Revise the dts file.
  Remove code that jumps to mips_cps_core_entry.

Changes in v2:
  Break up one patch to 11 patches.

Changes in v1:
  Original code.
***

Chao-ying Fu (8):
  platform: generic: mips: add P8700
  platform: generic: mips: add header files
  platform: generic: mips: add an entry function
  platform: generic: mips: add the platform file
  platform: generic: mips: add a dts file
  platform: generic: mips: add objects.mk
  Initialize MIPS custom PMA registers
  platform: generic: mips: add mmio to allmem in the dts file

Vladimir Kondratiev (2):
  devices to use MMIO memory
  Fix PMA init for MMIO regions

 include/sbi/riscv_asm.h                     |   2 +
 lib/sbi/riscv_asm.c                         |  32 ++
 lib/sbi/sbi_hart.c                          |  13 +
 lib/utils/fdt/fdt_fixup.c                   |   2 +-
 platform/generic/Kconfig                    |   4 +
 platform/generic/configs/defconfig          |   1 +
 platform/generic/include/mips/board.h       |  33 ++
 platform/generic/include/mips/mips-cm.h     |  88 +++++
 platform/generic/include/mips/p8700.h       | 113 +++++++
 platform/generic/mips/cps-vec.S             |  75 +++++
 platform/generic/mips/mips,boston-p8700.dts | 348 ++++++++++++++++++++
 platform/generic/mips/objects.mk            |   7 +
 platform/generic/mips/p8700.c               | 279 ++++++++++++++++
 13 files changed, 996 insertions(+), 1 deletion(-)
 create mode 100644 platform/generic/include/mips/board.h
 create mode 100644 platform/generic/include/mips/mips-cm.h
 create mode 100644 platform/generic/include/mips/p8700.h
 create mode 100644 platform/generic/mips/cps-vec.S
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts
 create mode 100644 platform/generic/mips/objects.mk
 create mode 100644 platform/generic/mips/p8700.c

-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
