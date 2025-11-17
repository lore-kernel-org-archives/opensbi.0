Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53FDCEACEF
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9H/BETde14h3CMpWmzglFYdUqzns923vZeWGltnogNc=; b=l3uxC3eST7xDxl
	7WxIkIFbiYVh07/rRF3Goj4UzdL4wc1OYc//XE6GFjPYTquZH5sh2adLImoDvHORXWtsy6qN673xq
	00AZhEIT6xa7AXzS5b0qHwDAKTGnegKk8MdOX5yOnUwkiXxRnO3uPrE0ioOyvS5g7jsF65SigLdoE
	R7xM2JqWg+jFWxfgcSkmwZNyMn3t44EX1qxqdlyohWSgw8cx8aLsxJzowY6TNlz5C2q33Uh0Ea9td
	gLDRP8kVwCJu1Mf2AUGBGqDOsCH/2YFaSY/7Hw0iVTN1PKMQr4FtT3BsNXRlB+XxR9tG2Ha4tyEJB
	0MHYlZm3ZGyZUsFnFkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8C-0000000FT5F-2wpy;
	Mon, 17 Nov 2025 05:50:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8A-0000000FT4H-17gQ
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 05:50:27 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7aab7623f42so4635054b3a.2
        for <opensbi@lists.infradead.org>; Sun, 16 Nov 2025 21:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358624; x=1763963424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCs4gbbZm9Yn+ohrFG4g1zlI5B4PmSynjW5FAb2SAdo=;
        b=j4Bqb8RoYqIGI8RqPn58PXHDTkfsv2cbplppgmWQ/7WNT/QuH9iV8Ovbn7vXgRo6vf
         mliVu1Mo7O/dS/5oZI79jUgdppkshoJKLRLRRL+puTGLNniQJ0bEmDJoG3qHY059XIet
         +epOfA2iXd2MILApO92tuDqjNQRCb1TNhEkSVy5/QPOp8fhfF2sPc2FS14ZcpF0iBUu3
         S7Y/64wo+oJG1qYIdbR1Pe1w31iubiXie6iCKVf6HxyUBQQdlMXoNWxkuL04lYK832A2
         MSOh8Wea01A5mdVFyPM7Iyw+Sma1pmNXCEWwAORGQM0HKREGkm9GPOiMXyTgA/3N7niV
         MZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358624; x=1763963424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCs4gbbZm9Yn+ohrFG4g1zlI5B4PmSynjW5FAb2SAdo=;
        b=f62/jeDrdz5dZEudZP4wUVBExveiiipBoTwLGlbcX+1QniedX8JC/z1kKKZv0L0S5B
         +SWsstg8NKTwmZVMwx0ulD60WYw8XKYLlMRHnrjGmpDozupKwA+sRX1vAspp4X7jiriv
         VVj4JqvsQp745AvN/52MOTn7UDw3xUBrS7K871RUIMl1u7FmfCkAdas6fBM8fMTwrZl2
         JpguSy3OKmpjvT51Xau25o5MhJ8jPxXJVMPI7znkUNaZ1pfXFoH42r83T4WmxC6cqiMG
         o0pTm/HcYl5EnSlmEU5LZXURDbrOcomZCfTPaNqkq9lsXvp0gXpGB3akDEKUSuwCHQlF
         PoAQ==
X-Gm-Message-State: AOJu0YxUikM462KD/HM+BTwMbUHUyIWgQs2zRb+WEkUk5t6JNcsHNQX7
	LGI3ZkSDxV1yFVMbkK8qj5XIFDWq2CeyjxVUCTg4djVD/skPE74XTlYJhyazfQ==
X-Gm-Gg: ASbGncvlT9RTgUWTDtvDxbgKXriVoOUQKA/9VYfEGbG1t5Lk1LAyQWd6NIirBKwtzg1
	791eoHP5Nrf7fb7vEc3L7r/IdNV35TuDzd4mjaFoPkUSSBpFR6u+KIFULMgIChQneVLHSz+Dtz7
	wFrboCPqilkBImCwhZgbXxLwiZ/watR9dcnfogPfniKOEnEXMXBzQwmaNhuG9p81jFmgsJkE4Qx
	+h94W2akr5PJHg0J3WP5otmwFupLy77L4YAJbrO8itxfkz1ZYUddlOEwxhlvtm4wdyat77ulqYT
	23zexdwrq/gfbGIJYyORn8ucrLGw9x2nAiTcos2kA3kTKgL5VLIWAFgX7TzBzWixgioa2KI75B2
	z+zAxuNUbed/OP/9zFF9FrZUfs/Si283nyaYXkKJHjV2rlV7DjnTw5LgrnijPgpcCIQLpl4piV9
	gWow1qmEuVf47E
X-Google-Smtp-Source: AGHT+IExU+Vgm56ZscBJgKgAQu4xmmApU4kgjDpXIyB/q1CMY7Ygm5hQwecKtDdGjENArk3wR+R2Rw==
X-Received: by 2002:a05:6a00:3d4a:b0:7b9:8142:96f0 with SMTP id d2e1a72fcca58-7ba3c4767e3mr11044931b3a.23.1763358624541;
        Sun, 16 Nov 2025 21:50:24 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924cd89bcsm11719856b3a.15.2025.11.16.21.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:50:23 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v2 0/5] Initial ESWIN/EIC7700 support
Date: Sun, 16 Nov 2025 21:48:41 -0800
Message-Id: <20251117054846.1335-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_215026_310171_F68BAD54 
X-CRM114-Status: GOOD (  15.87  )
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

EIC7700 is the SoC used in HiFive P550 and Milk-V Megrez. This SoC is
currently one of the only off-the-shelf board/chips that support H
extension, although it's v0.6.1. It also supports pre-ratified N-trace.
Add support for it so people can benefit from latest OpenSBI features.

The device-tree of HiFive P550 has been upstreamed to Linux:
https://lore.kernel.org/all/20250825132427.1618089-1-pinkesh.vaghela@einfochips.com/
However U-boot is not, and there are bugs in vendor U-boot device-tree,
and also inconsistencies between the two. Thus, this patch is coded with
the upstreamed device-tree as the reference, but tested with the patched
vendor U-boot device tree as `FW_FDT_PATH`. The patched vendor U-boot is
hosted here: https://github.com/ganboing/u-boot-eic7x/tree/eic7x-dt-fix
Refer to PATCH 5/5 for the instructions on building the firmware blob
and launch it through UART boot.

The major complication of this chip is that it requires certain memory
regions to be blocked with PMP entries to prevent speculative execution
or HW prefetcher from touching them to avoid bus errors. Also due to the
fact that this SoC handles cache incoherent DMA by mapping memory twice,
one as cached, and the other as uncached, we also need an extra PMP to
protect the OpenSBI in the uncached portion in address space. Following
changes are made to lib/ and firmware/ to make it possible:

 - Allow platform to override pmp_(un)configure
 - Add helper function for settings PMP TOR
 - Add helper function to check if memregions are disjoint
 - Introduce FIRMWARE_PACKED_RXRW for disabling power-of-2 RW split

The defconfig of EIC770X is separated out, because it has to require
CONFIG_FIRMWARE_PACKED_RXRW to not run out of PMP entries. It'll
change the layout of firmware sections to not power-of-2 align the
RW sections, so do not by default enable this for other platforms.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
Changes in v2:
- Major enhancement of PMP consolidation logic. Also fixed a Linux
  Panic bug due to the mismatch between PMP settings and reserved
  memory regions passed to Linux via FDT.
- Also protects the OpenSBI firmware in uncached memory portion of
  address space.
- More detailed documentation on EIC770X/P550

---
Bo Gan (5):
  lib: sbi: allow platform to override PMP configuration
  lib: sbi: Add __pmp_set_tor for setting TOR regions
  firmware: add CONFIG_FIRMWARE_PACKED_RXRW
  include: sbi: Add helpers for sbi_domain_memregion
  platform: generic: eswin: add EIC7700

 firmware/Kconfig                           |  11 +
 firmware/fw_base.ldS                       |  14 +-
 include/sbi/riscv_asm.h                    |   7 +
 include/sbi/sbi_domain.h                   |  23 ++
 include/sbi/sbi_hart.h                     |   9 +
 include/sbi/sbi_platform.h                 |  53 +++
 lib/sbi/riscv_asm.c                        |  75 ++++-
 lib/sbi/sbi_domain.c                       |  11 +
 lib/sbi/sbi_domain_context.c               |  11 +-
 lib/sbi/sbi_hart.c                         |  97 ++++--
 platform/generic/Kconfig                   |   6 +
 platform/generic/configs/eic770x_defconfig |  28 ++
 platform/generic/eswin/Kconfig             |  29 ++
 platform/generic/eswin/eic770x.c           | 361 +++++++++++++++++++++
 platform/generic/eswin/objects.mk          |  11 +
 platform/generic/include/eswin/eic770x.h   |  66 ++++
 16 files changed, 752 insertions(+), 60 deletions(-)
 create mode 100644 platform/generic/configs/eic770x_defconfig
 create mode 100644 platform/generic/eswin/Kconfig
 create mode 100644 platform/generic/eswin/eic770x.c
 create mode 100644 platform/generic/eswin/objects.mk
 create mode 100644 platform/generic/include/eswin/eic770x.h

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
