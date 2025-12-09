Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077ED3B7F3
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ylNQZkvSUhTy7nsSVHPlxz4A4/ls3hYhpMS5NjtsGLk=; b=LLttJDu6lekYz3
	x06WIcVWKKTIVjeQNISi5gPSFoVeBkDh2NKLySL3wpiWiAVUXbgt2pzH+oHx3xHfacJhQkydKtQTY
	NpdxDvMdgq94pqHyNLf7NljnaDKAvx2cZb/UBE5U8ig+hQYJo7v3AbGQhimvdABIDTJ9uLrvG0DLi
	oYBnWvDbk+iGD+TXStwUSL+d/7xE6o64Iiwtm3oWpUdx+KsP6WkciBB6cZj9gCyjBtFhPmPPdGyAe
	7HLfDC+rZroqwulTNppfcuHcukdpgDVpBYBDRaz4xw2CQUKZifYDTZwcdMR6XOddidiiCCH95pEv0
	9B1I3BaGoPJ0Wi8tG5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSuts-0000000E6Tk-3i1S;
	Tue, 09 Dec 2025 10:24:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutp-0000000E6S8-21AX
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 10:24:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-297d4a56f97so69464365ad.1
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275892; x=1765880692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHYgJpTA0MdweZQwmp6Vt3wdnkpx4qdVtjVWI8IQsac=;
        b=B+Vc5hpCoGG80KvThU+CAg2c2YAmMeY7qMwE0lets8x/VJX/8QaQKoZ1VnpC0mqJFM
         BJWzD3wh3xriI7hM8slKliWjd2JVyrIJBEvQIEf/eMPPTFYLnQdwAFfQ8psyTlBRS3vy
         ipnaXTBmHEIlqv8MwlbhqOLndc9h1dPCBIJ5zCNz0ZUSB46cnbf8h9aDJFpTzCz//KDY
         sVzY3hRBtTRknJzii9q4GfTTv24nguFAVbbiVJ9bBQ9VdaEPdLV1raE0EdYdW3pN/g/c
         1tVxZfmaUiYM/3vs8pG0FSovkR8T12lP3BxTu2aToQuH5bpZkCAkm4qCfe4OOyhb8ljQ
         ECEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275892; x=1765880692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHYgJpTA0MdweZQwmp6Vt3wdnkpx4qdVtjVWI8IQsac=;
        b=huYNGL0LyKtCJC8OMQX4ikSHXcI0EeXWgSVYWcb8gZLn++RoPhZ/jXBNLnRfqMRNxK
         om3fYGK/oQNhRADYeXA/KMMw1T+EoQiEMTEIFwEFK+qxA6Mc/kO1DveqgdPya70yPQuG
         oG0oPcnabOddiSlYJuif5y3vSNa3jloGCGMfvuhakzpThmFq9Ty9zJw9DtANAd4jzRf4
         Jva5TKdBzaAftrxtKMWcOjMGOIQe/cq9QNfCbIHGGIDmK4CS1dPztYNoZuPhWAfa+tNc
         xdYYWydCm5lPAMbnatZkG0udagYN2d0IO7DdIvcHZ/6wLhNlka6o+FcQWd3c40Ocb+Np
         pV4A==
X-Gm-Message-State: AOJu0YxOaddTIodoF5uhJSt9DFEiBtPS/InGnHk3IUQGOrrkIMSfVcDm
	Ifff3NcFWIiBNN9ApgyE5I+qaef9Lg0o/gD+FszUZ47S5hx3Oq+gpB6mE9qRmBhv
X-Gm-Gg: ASbGnctKLhGIfnhwAmhV1smhYlbCXLbWO5IzIb5KDFlB+j+06TgflURgd7gKCE5gNg8
	0T4HlVh45nNEJibFQtlWMaK0+lHCtR4emLa6elaKfUN+MgcunuKM9OpUGKwW/W4Nbu8KNFfk9fY
	pLAI+xoKTWDqI4R0UmcCYfrHTL3yYmbGkNfB4kqkc392TkFj730ASVF1VRHg5YMuog+qrGAcwZ0
	MsrnUXOUrs2TxTYkDhx4bMye3+2oIlol1XJeyOWryoB4XAwKlQ4+vfmTajS1nFBaBXdebTW4TKx
	3MTeEbmEyx0Sp2fN7EuRJft2NaeEMU4WoZL/ZXJk1uoGTDhg8RdpX+37UwOJ/NWmTlPCpNDEdF+
	FjV/ofcnwWHcUjQVIlP8K6dqQaEsARc5I7YRMcykYDgt5gjFce1IJIX0lNoLNB5d9ZY2xjlb0kw
	tmbv8HKe6xcI/h
X-Google-Smtp-Source: AGHT+IGUuKSda1mG5aA8otVh8v+Bw8/ZX1T1+ZyXh28Lo+XU0tkbkR5lGpAoa1RH2gTtLhc4ETqksQ==
X-Received: by 2002:a17:903:2c05:b0:29e:3823:a70 with SMTP id d9443c01a7336-29e38230bc8mr72729405ad.42.1765275891546;
        Tue, 09 Dec 2025 02:24:51 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca1esm149302135ad.2.2025.12.09.02.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:24:50 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v4 0/5] Initial ESWIN/EIC7700 support
Date: Tue,  9 Dec 2025 02:22:41 -0800
Message-Id: <20251209102246.1161-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022453_530590_819C4C9A 
X-CRM114-Status: GOOD (  16.44  )
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

OpenSBI v1.7-90-g3544b479
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
Platform Reboot Device      : eic770x_reset
Platform Shutdown Device    : ---
Platform Suspend Device     : ---
Platform CPPC Device        : ---
Firmware Base               : 0x80000000
Firmware Size               : 613 KB
Firmware RW Offset          : 0x80000
Firmware RW Size            : 101 KB
Firmware Heap Offset        : 0x8d000
Firmware Heap Size          : 49 KB (total), 1 KB (reserved), 14 KB (used), 33 KB (free)
Firmware Scratch Size       : 4096 B (total), 424 B (used), 3672 B (free)
Runtime SBI Version         : 3.0
Standard SBI Extensions     : time,rfnc,ipi,base,hsm,srst,pmu,dbcn,fwft,legacy,dbtr,sse
Experimental SBI Extensions : none

Domain0 Name                : root
Domain0 Boot HART           : 0
Domain0 HARTs               : 0*,1*,2*,3*
Domain0 Region00            : 0x0000000080000000-0x00000000800fffff M: (F,R,W,X) S/U: ()
Domain0 Region01            : 0x000000c000000000-0x000000c0000fffff M: (I,F,R,W,X) S/U: ()
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

Domain1 Name                : trusted-domain
Domain1 Boot HART           : -1
Domain1 HARTs               : 
Domain1 Region00            : 0x0000000080000000-0x00000000800fffff M: (F,R,W,X) S/U: ()
Domain1 Region01            : 0x000000c000000000-0x000000c0000fffff M: (I,F,R,W,X) S/U: ()
Domain1 Region02            : 0x0000000050910000-0x0000000050910fff M: (I,R,W) S/U: (R,W)
Domain1 Region03            : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain1 Region04            : 0x000000047ff00000-0x000000047fffffff M: () S/U: (R,W,X)
Domain1 Region05            : 0x0000000000000000-0x000000007fffffff M: (I,R,W) S/U: ()
Domain1 Region06            : 0x0000000000000000-0x0000007fffffffff M: (I) S/U: ()
Domain1 Next Address        : 0x000000047ff00000
Domain1 Next Arg1           : 0x0000000000000000
Domain1 Next Mode           : S-mode
Domain1 SysReset            : no
Domain1 SysSuspend          : no

Domain2 Name                : untrusted-domain
Domain2 Boot HART           : -1
Domain2 HARTs               : 
Domain2 Region00            : 0x0000000080000000-0x00000000800fffff M: (F,R,W,X) S/U: ()
Domain2 Region01            : 0x000000c000000000-0x000000c0000fffff M: (I,F,R,W,X) S/U: ()
Domain2 Region02            : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain2 Region03            : 0x000000047ff00000-0x000000047fffffff M: () S/U: ()
Domain2 Region04            : 0x0000000000000000-0x0000000fffffffff M: (R,W) S/U: (R,W,X)
Domain2 Region05            : 0x0000000000000000-0x0000007fffffffff M: (I) S/U: ()
Domain2 Region06            : 0x0000000000000000-0xffffffffffffffff M: () S/U: (R,W,X)
Domain2 Next Address        : 0x0000000080000000
Domain2 Next Arg1           : 0x00000000f8000000
Domain2 Next Mode           : S-mode
Domain2 SysReset            : no
Domain2 SysSuspend          : no

Boot HART ID                : 0
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
Bo Gan (5):
  lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
  lib: sbi_domain: add sbi_domain_get_oldpmp_flags
  lib: sbi_domain: make is_region_subset public
  lib: sbi: give platform choice of using single memregion to cover
    OpenSBI
  platform: generic: eswin: add EIC7700

 include/sbi/sbi_domain.h                 |  29 ++
 include/sbi/sbi_hart_pmp.h               |   1 +
 include/sbi/sbi_platform.h               |  21 ++
 lib/sbi/sbi_domain.c                     |  81 +++--
 lib/sbi/sbi_hart_pmp.c                   |  19 +-
 platform/generic/Kconfig                 |   5 +
 platform/generic/configs/defconfig       |   1 +
 platform/generic/eswin/Kconfig           |  29 ++
 platform/generic/eswin/eic770x.c         | 398 +++++++++++++++++++++++
 platform/generic/eswin/objects.mk        |  11 +
 platform/generic/include/eswin/eic770x.h |  73 +++++
 11 files changed, 619 insertions(+), 49 deletions(-)
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
