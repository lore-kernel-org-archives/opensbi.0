Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845A5CF64AB
	for <opensbi@archiver.kernel.org>; Thu, 20 Nov 2025 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Fads4F0Lj91DST+8e5cYNj6rOQ/xnZFaDV+lJR+M0M=; b=O8brpxEdODclIv
	rfuPHELSriKHEdS3SYTN6ZgStE5cOxSAhRLC2w5S2FjPMgV5aYoNpA406SQV88wt1Umi8uXuKJpq6
	7PwMmoPaEBJsNsYCbSodpE+if9X1MESLiOnENtL9Wu8MA9UobZXpiEDyanyH5i67VlYNdsBgAjPG7
	TjPr5pr/dWuVJPUyP3aSSowTYtI/EMGzjMU+BpMwOA040YaxIzbcjTO5VkSO4bdfRM1hKAJsQuIRe
	SiznyUjp3yisy2PsMq4oZTNlvy3XPNsC3pbc4ppB/kffm7Iw3qnf/LIN8ucLClQ37jG0RMxwz9buB
	Oh/Kva19RDFulilFWxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15h-00000006QoO-2dXZ;
	Thu, 20 Nov 2025 09:36:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM15f-00000006QnH-0FBI
	for opensbi@lists.infradead.org;
	Thu, 20 Nov 2025 09:36:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so511272a91.2
        for <opensbi@lists.infradead.org>; Thu, 20 Nov 2025 01:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631393; x=1764236193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CULP5a9GEr5/vJy22gIYdgESTp8DbF6Vf1FiheHdGWo=;
        b=YRmHLVezp9MwUtMutXa8vboSS3NzCKoTUtb47LGyiBbIIz4g7sIPCczsmO6ELCm0uQ
         G8EvpUtWdmh9jc6rP6oMRvC64sRuIsVHI+Omp7d0hFORaR9nchGkhzdv4u8ILXV9IH3t
         +rGnAlAL67NIM/02NyUDExmIatjjNQRssBiMMELs6tnoq8lMGimFVZERVN0xaDU2rmkP
         GrDOHsnCOuy0IDnBI6hMYcHZMEw8zO6pFfbZ45tZZqmomOMFExYuLJeBPBxgEILrJBff
         SvWAGzCUgqDzL67V3KiIZ7Klwtq22ttt8FSAtKwxIaj8FY1ZNQlJVE78R5bScgLBOgs6
         MHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631393; x=1764236193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CULP5a9GEr5/vJy22gIYdgESTp8DbF6Vf1FiheHdGWo=;
        b=OZIfCpObZ1PnYMQNjZ7aZUjGQBDJki+pasK54+U00OzF5BNJ9lWkthO4Gthjk4V6vj
         //rRj2C+k5XPHEJszk9uJNSxsyCOjp79PEaiJ3yQSZztiSrVM3iL1Zl3pw54ehpb5tLQ
         6XJGJl8VKh79GxDvbeF+6y6IbbjYnrB9wHE8p8sZtxEM5blrf81pAQPQXBKhAqpml4Gc
         3eYwTlfAUQz3NjLcnACLnLZ8da/IENyW2jHuRGs983QrNtKjHS1B5Sm7JPUU+Y8H+8Pb
         53xYPoZnnOgBdcSOYWzXNnX3Zb4qZe8s1INgNRcoGm4/IaaFnZZhtRUjpmh2w1oqAUvU
         F1sA==
X-Gm-Message-State: AOJu0Yy7uz2nRtEV0sFNI0/WIGu+0OhqO732onvRdmU8Y+PtvvQuyOkp
	GA0qvuBX6WppwRJwqzWoLuxaVtc1cPn6tVK4q6CJeavCvgotpBpyZOYsmSr76kht
X-Gm-Gg: ASbGnct2KuEbq1NfC2NA18V1kcdK3jaZ6AYFk2xWnB/3QUUfaZdd9IHXkb97I2AEfP0
	HAfGW89a4xbfECj+OCYAjopJP1XCND4Xnx/2jYhJYNR8SyRbjYUIIf8exC7C8T2w8KkI2eVOizp
	SQSviaoYLu5qCQ8gZM95X3lwsrKjaMJlh17fkwmWEASo0R2fX8wTXRU4zRLzdlhW/sWRLnkWBvH
	XWzPzm/zpb7x2JC53687yotg+HLYxmGmDLt133hnq73PA0vhBBVVYR23qhSC+xeahLRMBHZP4Rr
	xTdFI38iaNOIcDpC7tgNbGQRdkxF5PCDxuarwwIoxY/Zgs2qpw/TCF5eVvy5KR5gShuTitJxSWb
	3gEz4RZ6rVNrB/LLL/w6JtqDEGT5a8YuVpzJ1Lj3pDKLA7FjKXmkWZtDJdFaEHRZedeJP3Rdoxn
	AF/cw8/Fvu1mk66hkQ4Xmc1IE=
X-Google-Smtp-Source: AGHT+IFMesgbSuIW0viZjV8cE/pKzNOTuSkH/hAd2ioFRALvVPOShumE+Gt1Uu0cvDB5Y+TFhEsDUw==
X-Received: by 2002:a17:90b:2dcc:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-34727c2e66emr2457022a91.22.1763631393075;
        Thu, 20 Nov 2025 01:36:33 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34726696b52sm2019042a91.1.2025.11.20.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 01:36:32 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v3 0/4] Initial ESWIN/EIC7700 support
Date: Thu, 20 Nov 2025 01:34:36 -0800
Message-Id: <20251120093440.4533-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_013635_106846_49CF16DF 
X-CRM114-Status: GOOD (  16.20  )
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

OpenSBI v1.7-73-g5c235e5d
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
Domain0 Region01            : 0x000000c000000000-0x000000c0000fffff M: (F,R,W,X) S/U: ()
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
Domain1 Region01            : 0x000000c000000000-0x000000c0000fffff M: (F,R,W,X) S/U: ()
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
Domain2 Region01            : 0x000000c000000000-0x000000c0000fffff M: (F,R,W,X) S/U: ()
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
Bo Gan (4):
  lib: sbi: allow platform to override PMP (un)configuration
  lib: sbi: give platform choice of using single memregion to cover
    OpenSBI
  include: sbi_domain: make is_region_subset public
  platform: generic: eswin: add EIC7700

 include/sbi/sbi_domain.h                 |  29 ++
 include/sbi/sbi_hart.h                   |   3 +
 include/sbi/sbi_platform.h               |  74 +++++
 lib/sbi/sbi_domain.c                     |  80 +++--
 lib/sbi/sbi_domain_context.c             |  11 +-
 lib/sbi/sbi_hart.c                       |  45 ++-
 platform/generic/Kconfig                 |   5 +
 platform/generic/configs/defconfig       |   1 +
 platform/generic/eswin/Kconfig           |  29 ++
 platform/generic/eswin/eic770x.c         | 385 +++++++++++++++++++++++
 platform/generic/eswin/objects.mk        |  11 +
 platform/generic/include/eswin/eic770x.h |  73 +++++
 12 files changed, 687 insertions(+), 59 deletions(-)
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
