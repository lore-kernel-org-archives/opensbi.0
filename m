Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C71D6ACE1
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PmvRfYRKoF3rCmLX09LCPgP+APEiAgkKzCAuvEJIB18=; b=Md7Ggxn/Z9EEBR
	ybxbwR2VYZLpnJABA/a5vcRzeDMP6w8EO+mOnUB+20SK0uaWTXCwiGUCBrcFuN4gf/nL98kFvGXCj
	I5McIpmnyus1+Do3U5EKGclgMP9s0bilLfzKF7R0bt+Wx/0V5nMSy/sYaC121pW/wUEQUy75KMUlw
	+U0lGvIh5TfjeCrGmzDcge4/CQ5oTH20ofjpjmO4ZuXZuSZj681GLjSOZzsloUYBAoEa/JEAznDCO
	ll5lz8Wjo0N7yWI81f4VoAu7EN26xAlHN+itA5Q+rWq73akK081P0aXfO/rWB3UKS+ez/gfgRK1S8
	35s8uHKiAr7ZqulGcNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUy-00000008Fg5-18wz;
	Thu, 18 Dec 2025 10:44:44 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUv-00000008Fei-3bV5
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:43 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso878098b3a.1
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054680; x=1766659480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4VqOP/SYUCx3OYhGsyqOsjnuVB6Ilh37MKOZhLWWFI=;
        b=WglvQ9S51W5J27/4TA9T9VAIAQm7qIUC+edH7wMkpiYHnjEVmfJiHVhLm5fDVocYQg
         6pAv7vLcqSVMyPn3+vtPl+4WXzPK5HcRgDtq0JR7P168HJdFXOfRHczjfm8GP2ghK1TZ
         PCsccTho43RyqvZxDr6Rjs6ZqRurJB1qxiuG0bIZRxSprunWxnmyKvjZHCWPV5imRWYr
         UofmWe+ivE7StxERZqibGo+qZ57Yfk61+pAZGrv6OvCWyFplggJTiJeGvTpTnCDs6sN0
         xOhIW2WzJnuZJKxDmlmnzaIcqVrukg1OUsZf+j/efxTRe0haSaGqYvv/TAh4QA0qthk7
         MV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054680; x=1766659480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4VqOP/SYUCx3OYhGsyqOsjnuVB6Ilh37MKOZhLWWFI=;
        b=vd2nyXXfRX6icTUbWwaKKjfeeo36iNfGJkqVwJex1RF733HqpTYmM/jXVEbTNnV07R
         V8bPmxjk9SZVoIbPsTHroCdj2BD8ruv/8jsMpQPirbaU+3v6QGiE8Gvzg6fKwa9IQqVn
         sGo3MaYISKQn2T/VJGLyex1vjMab0yZqw2icqoEoFKt/EVtpts9u0N0TMDtTzKRf8R0A
         mlez81m6hZF3KDFAHQ3AaLIjxOf5LYMHgBX8lyRHuIpKr7zoPdwveC+ZB4brGaHGlVK/
         dEwX1jX0YQnLB4mtDrqTHWfge66Z9hkHipNU19rppA9rNZg4Z/+3ww31NRoOLn++bM0X
         gEVg==
X-Gm-Message-State: AOJu0YzHcVKsxC/PXSHBITI90GPJ8WRRB2/QEM31aVZihVZ1TtxhDmFm
	QFYylL2j7oACN7sDPC0zw0pgzeqxKSLhg/+H+M+XH+jsdoJwErWxDROfuiB0BA==
X-Gm-Gg: AY/fxX4N0buiKovRGIIL0qVjecO8b7ljWwu+YiRqsDgyyhgzn8I1XPGlD5UfrXmELK8
	LjZre82ImcDL/IotGkJ1Vuz6iL6Ne3ej8UFh5jmV21LLDWxF24XMCseGgkN9BxtzUSLWCYQRKTj
	rMdbKaqiRYMmAw43tYj+EWqHbTtpvLQ3vb4zKaIg27yUXYGD3uc4sT1WUArItrl3OZa7OdDKNRP
	OKVcX0eE42K/WG1gCcR+hXQkFsQm8QDEmou11/kAo9KPiUBxC9dECooxChNeD2u6lWPCj+9Usjb
	rkABOg0MsH2xvlg1afPPBGCfbLIX93PK4Qfh1z4d5VJt0o4skFAQ566zF/DbGmPP/M6JpWyOcM1
	1Qf+ZeNUfakcC/2kzaaVpk0veXdvmkY++sVdiIbhnzBkUMrrE3TBMQReSsjJ6BSK4uUo/KX/rTz
	xThu99P0cWXGhn
X-Google-Smtp-Source: AGHT+IEAG9Hip3CLUWQQwUXHJFp/hP7domf82pLUgozl6YXVgVrrGLPYwJOG53v79EF583Yl66KcDA==
X-Received: by 2002:a05:6a00:4c13:b0:7e8:450c:61a6 with SMTP id d2e1a72fcca58-7f669c8af30mr20153862b3a.61.1766054679764;
        Thu, 18 Dec 2025 02:44:39 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:39 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 0/7] Initial ESWIN/EIC7700 and Hifive P550 support
Date: Thu, 18 Dec 2025 02:42:36 -0800
Message-Id: <20251218104243.562667-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024441_904635_7B7154EB 
X-CRM114-Status: GOOD (  18.44  )
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
Refer to the last PATCH for the instructions on building the firmware
blob and launch it through UART boot.

The major complication of this chip is that it requires certain memory
regions to be blocked with PMP entries to prevent speculative execution
or HW prefetcher from touching the data-cacheable regions within to
avoid bus errors. Due to the fact that this SoC handles cache incoherent
DMA by mapping memory twice, one as cached, and the other as uncached,
we also need an extra PMP to protect the OpenSBI in the uncached portion
in address space. The PMP handling is tricky, so I documented it very
extensively for people to reason about it. I managed to get it done with
only NAPOT PMP entries and still got 1 free PMP for root harts for die 0
(No free PMP for die 1 root harts). This even permits a udomain/tdomain
like partitioning, so we can even try out TEEs. Sample boot log:

OpenSBI v1.7-95-g68b64d77
Build time: 2025-12-17 05:08:58 -0800
Build compiler: gcc version 13.2.0 (gc891d8dc23e-dirty)
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name               : SiFive HiFive Premier P550
Platform Features           : medeleg
Platform HART Count         : 4
Platform HART Protection    : eic7700_pmp
Platform IPI Device         : aclint-mswi
Platform Timer Device       : aclint-mtimer @ 1000000Hz
Platform Console Device     : uart8250
Platform HSM Device         : ---
Platform PMU Device         : ---
Platform Reboot Device      : hfp_reset
Platform Shutdown Device    : hfp_reset
Platform Suspend Device     : ---
Platform CPPC Device        : ---
Firmware Base               : 0x80000000
Firmware Size               : 357 KB
Firmware RW Offset          : 0x40000
Firmware RW Size            : 101 KB
Firmware Heap Offset        : 0x4d000
Firmware Heap Size          : 49 KB (total), 0 KB (reserved), 13 KB (used), 35 KB (free)
Firmware Scratch Size       : 4096 B (total), 424 B (used), 3672 B (free)
Runtime SBI Version         : 3.0
Standard SBI Extensions     : time,rfnc,ipi,base,hsm,srst,pmu,dbcn,fwft,legacy,dbtr,sse
Experimental SBI Extensions : none

Domain0 Name                : root
Domain0 Boot HART           : 3
Domain0 HARTs               : 0*,1*,2*,3*
Domain0 Region00            : 0x0000000080000000-0x000000008007ffff M: (F,R,W,X) S/U: ()
Domain0 Region01            : 0x000000c000000000-0x000000c00007ffff M: (I,F,R,W,X) S/U: ()
Domain0 Region02            : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain0 Region03            : 0x0000000000000000-0x000000007fffffff M: (I,R,W) S/U: (R,W)
Domain0 Region04            : 0x0000000000000000-0x0000000fffffffff M: (R,W) S/U: (R,W,X)
Domain0 Region05            : 0x0000000000000000-0x0000007fffffffff M: (I) S/U: ()
Domain0 Region06            : 0x0000000000000000-0xffffffffffffffff M: () S/U: (R,W,X)
Domain0 Next Address        : 0x0000000080200000
Domain0 Next Arg1           : 0x00000000f8000000
Domain0 Next Mode           : S-mode
Domain0 SysReset            : yes
Domain0 SysSuspend          : yes

Boot HART ID                : 3
Boot HART Domain            : root
Boot HART Priv Version      : v1.11
Boot HART Base ISA          : rv64imafdchx
Boot HART ISA Extensions    : sscofpmf,zihpm,sdtrig
Boot HART PMP Count         : 8
Boot HART PMP Granularity   : 12 bits
Boot HART PMP Address Bits  : 39
Boot HART MHPM Info         : 4 (0x00000078)
Boot HART Debug Triggers    : 4 triggers
Boot HART MIDELEG           : 0x0000000000002666
Boot HART MEDELEG           : 0x0000000000f0b509

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
Changes in v6:
- Fix CPU_DIE_MASK macro
- Make eic770x build on rv64 only to fix rv32 build error.
- I'm still waiting for ESWIN's reply on the reset memory corruption
  issue, but I stress tested the P550 board warm reset overnight,
  and can confirm the extra sbi_printf indeed mitigated the problem.

Changes in v5:
- Add Hifive P550 shutdown/reboot support.
- Add a sbi_printf() just before SoC reset to workaround flaky
  memory corruption issue after reset. This issue has been reported
  to ESWIN, and it's been reproduced with their vendor OpenSBI code.
  ESWIN's actively investigating it.

Changes in v4:
- Adapt to the hart protection abstraction.
  Also make use of sbi_hart_pmp_fence for correctness.
- Specify MMIO flag for the uncached mapping of OpenSBI.
  It'll avoid adding an extraneous reserved memory region in FDT for S mode.

Changes in v3:
- Figure out the cause behind bus error, and document it properly
- Drop the consolidation logic and let the lib/memregion logic to
  optimize out unnecessary regions -- simplifies many things.
- Better and more comprehensive comments in source code.
- Support tdomain/udomain like use cases on die 0.

Changes in v2:
- Major enhancement of PMP consolidation logic. Also fixed a Linux
  Panic bug due to the mismatch between PMP settings and reserved
  memory regions passed to Linux via FDT.
- Also protects the OpenSBI firmware in uncached memory portion of
  address space.
- More detailed documentation on EIC770X/P550

---
Bo Gan (7):
  lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
  lib: sbi_domain: add sbi_domain_get_oldpmp_flags
  lib: sbi_domain: make is_region_subset public
  lib: sbi: give platform choice of using single memregion to cover
    OpenSBI
  platform: generic: eswin: add EIC7700
  lib: utils/serial: Support multiple UART8250 devices
  platform: generic: eswin: Add shutdown/reboot support for Hifive
    Premier P550

 include/sbi/sbi_domain.h                 |  29 ++
 include/sbi/sbi_hart_pmp.h               |   1 +
 include/sbi/sbi_platform.h               |  21 ++
 include/sbi_utils/serial/uart8250.h      |  16 +
 lib/sbi/sbi_domain.c                     |  81 +++--
 lib/sbi/sbi_hart_pmp.c                   |  19 +-
 lib/utils/serial/uart8250.c              | 104 +++---
 platform/generic/Kconfig                 |   5 +
 platform/generic/configs/defconfig       |   1 +
 platform/generic/eswin/Kconfig           |  29 ++
 platform/generic/eswin/eic770x.c         | 405 +++++++++++++++++++++++
 platform/generic/eswin/hfp.c             | 118 +++++++
 platform/generic/eswin/objects.mk        |  11 +
 platform/generic/include/eswin/eic770x.h | 101 ++++++
 platform/generic/include/eswin/hfp.h     |  64 ++++
 15 files changed, 911 insertions(+), 94 deletions(-)
 create mode 100644 platform/generic/eswin/Kconfig
 create mode 100644 platform/generic/eswin/eic770x.c
 create mode 100644 platform/generic/eswin/hfp.c
 create mode 100644 platform/generic/eswin/objects.mk
 create mode 100644 platform/generic/include/eswin/eic770x.h
 create mode 100644 platform/generic/include/eswin/hfp.h

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
