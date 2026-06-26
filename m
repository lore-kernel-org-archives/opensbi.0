Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B2CDE008
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOuyIqJO7ncWT3HLG4w8UUMYTt0f6ZXkWMfv1dyo9U0=; b=RwXPYBo1+OZB1s
	MR9m6Sy+E4hXffmwLlbJn1/W6NbTQhEZTuWNOL1tW74kY15LQfAvs36koM9QBV7tvs93h0EnuATSa
	VFtH+QfWcq2inYc9S8n3dyok29cFBBud83FvZeNlvx4ia1mSV+QQX0K2jijhZDHcUA9Ed6hyhxfJW
	xJq2jDoa3Kuyuk9u/z2LjtfpM9yUyYxj+dzfMntfwOgIRI6VAGUB0cooqlSSEQ8s2iYCAiz/ueVvf
	lgWhEX963nTdd7jXih9xVq2UiiivBgJ1h7a5E0tMOD9+iPBv8zRdbmzKxyxJ4DalqLay2bHysPHkA
	UBruywD0tcgoRJ/mtKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3bw-0000000B4He-2ttl;
	Fri, 26 Jun 2026 10:16:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3bt-0000000B4HI-322P
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-842358aaf36so320313b3a.2
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782468992; x=1783073792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHmNy4pefYTtFvJa3d4Y44XUWW1PcMEDuobHF542UtM=;
        b=B0L1cOb7hBHWaXwM+VMWkr2CqELz65Rc6WSXLsqCgx4RCXcH0hhjqKQE5WxP7I/OmC
         PKJ+cgghfzFEBueqoposLiqt0s6B/3OE6iqZDKNk/5Yk1JWx+4Nf3Tb2SjrBYw+AYh70
         wAcUmvOU2ReqBKV+ySYqQhzkpkq5S7Z8CSDUGQcMz+8utwBIrW3FTR9hxSIiWV1cYJGM
         bCcTo1B+8TtjuEiTXb3Pss0cN16ujcAlVnsmnmmYpmj758r+w/eMMQ2joBYmGfn1dJPV
         GQLZE2prkX8nbYZSn20e1OOOqLy67L7MAZxs3IamK5B8u7QmCS2wq6qmiUJbpivYNe2U
         j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782468992; x=1783073792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHmNy4pefYTtFvJa3d4Y44XUWW1PcMEDuobHF542UtM=;
        b=VLW49GCZJ2LzH6F2lF+TVltujrkYrUsz8KV5qNk9fIFdNozd3NMO0vLn32RcZzP6JX
         iKOXp1FN/N9WSFSueq/+tXVyfnSgusl3Ewkl5kJ1ZJUB7xgqGPk1qyNcz4WydxxWdFEI
         MyX1Tifgk6TUPN1T+xjmIal8NYPyJIHF8UFYpAtSTHXsZaW5lucw1PMotmfIXAxux1qW
         em4c5qfZegfGzRagHjPsFbRCxDM88SGK1We8vhErHkIJA6sfsFQZWBw+g4ptnrHM6Fg9
         zSADZw4Bpxj1NYyADpkJS2B/tntV/+8Hrgut3vYiMD1aXR8wTKWSzJIpSfyfwpjGKPVH
         bI2g==
X-Gm-Message-State: AOJu0Ywo522eh4IHsFsFK+ibIKiuQKZqk1ZTQ938A2SOW/YsauWTutWk
	ZgiudLNi2355tQdZ4PYJ0AKH4PrcJxYBkXfmnV4JrFCyTLFhYAr986wy+tp7DszMb/0Mp9hp4TJ
	n47JTKPSdms+n69MwlBIe6ilEjbeTjvM330pmPYO/GJhl9alIh4eF6LiaO1AEylypo6O0eg9vGt
	i0GbNNj27PDhtMKFMAFc2iNiqMhDL5qSjHU2n7zhBLVPSVAQHRJFE=
X-Gm-Gg: AfdE7cmS5TNPJj13kWoCGFoFqbk0qCmKO+FhsY5c1Z+13IrvN++lONkqZYRNNSxB86Y
	OTzxUZPBggkNhBzw11O8rb/T5XFqPRJwcvv8J0a1CglbO2ltEqbv00Y9A69DSFlhE20QvBzzZH0
	xjANJ8YOUPGiFo1NHD2MfSLz8XVi8hTeshct+JmnIlZcDQHOA3zBrS3CxYrIN+lLwCkH8VjaW+n
	P87apS1xZ5U0SYPJaWsf2ZzTNmAMhW5Lo0LlhBQ7BARUOaHz4yfZzqtyxnArRYMTnGJEPCNIz9l
	56VIxKxeUtxXJbtDTJKCXBGNcfIAs1i1CyLJZrvc798jDMOZPQE/ZPuctTbBaa/5mgzvalI9Ab6
	XhGXLCLk+JdmF0FeUEemFnXHFw44Z8BRV751l+6onItDLSzH0rmQelZsOxEegHBTwe4X6QlFPJv
	HosXVm443ttZFGuzv9XqdGFyNVKI7BMX7enG20
X-Received: by 2002:a05:6a00:3d4c:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-845b3ac1267mr6809281b3a.33.1782468991732;
        Fri, 26 Jun 2026 03:16:31 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:31 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 00/12] Add RISC-V Worlds ISA support to OpenSBI
Date: Fri, 26 Jun 2026 18:14:21 +0800
Message-ID: <20260626101433.3133466-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031633_778425_94BFD857 
X-CRM114-Status: UNSURE (   9.87  )
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

This RFC patch series adds support for RISC-V Worlds ISA extensions,
enabling hardware-enforced isolation boundaries based on World IDs (WIDs)
by extending the OpenSBI domain framework.

Trust Model and Boot-time Roles
--------------------------------

The implementation follows the two-phase M-mode trust model:

- RoT M-mode phase: Prior boot stage (ROM/SPL) that may program mwid/
  mlwidlist and lock mwid before handing off to OpenSBI.

- Regular M-mode phase (OpenSBI): Treats pmwid/pmwidlist/pmlwidlist as
  read-only input policy from hardware/RoT. Locks mwid during feature
  detection to prevent later M-mode code from changing its own WID.
  Programs per-domain mlwid/mwiddeleg based on DT configuration.

Device Tree Bindings
---------------------

New CPU properties (per-hart):
- riscv,pmwid: Platform-defined M-mode World ID
- riscv,pmwidlist: M-mode permitted WID bitmap (u64, 2 cells)
- riscv,pmlwidlist: S/U-mode permitted WID bitmap (u64, 2 cells)

New domain properties (per-domain):
- next-wid: Override S-mode WID for this domain (u32, 1 cell)
- next-widlist: WID delegation bitmap for this domain (u64, 2 cells)

If a domain lacks next-wid, OpenSBI falls back to pmwid (M-mode and
S-mode run in the same World).

Example DT snippet:

    cpus {
        riscv,nworlds = <4>;
        cpu@0 {
            riscv,pmwid = <3>;
            riscv,pmwidlist = <0x0 0xf>;
            riscv,pmlwidlist = <0x0 0xf>;
        };
    };

    chosen {
        opensbi-domains {
            trusted-domain {
                next-wid = <1>;
                next-widlist = <0x0 0x2>;
            };
            untrusted-domain {
                next-wid = <0>;
                next-widlist = <0x0 0x1>;
            };
        };
    };

Known Limitations and Future Work
----------------------------------

This RFC implements core functionality but has several areas requiring
refinement in the future revisions:

1. WID Validation:
   - Domain next-wid is NOT validated against pmlwidlist
   - Domain next-widlist is NOT validated as subset of pmlwidlist
   - Invalid WID configuration fails at runtime with software-check
     exceptions rather than at domain registration time
   - Planned: Add validation in sanitize_domain() to catch errors early

2. Resume Path mwid Restoration:
   - Current implementation only re-locks mwid on resume, assuming RoT
     has already restored the correct WID value
   - No mechanism to verify or actively restore mwid to RoT-defined value

Specification References
-------------------------

- RISC-V Worlds ISA Spec: https://github.com/riscv/riscv-worlds
  (Release: riscv-isa-release-4c81a3f-2026-04-14)
- Device Tree Proposal: https://lore.kernel.org/all/20260619105834.1277302-1-peter.lin@sifive.com/

Yu-Chien Peter Lin (12):
  lib: sbi_hart: detect RISC-V Worlds ISA extensions
  lib: utils: fdt_helper: parse RISC-V Worlds DT properties
  lib: sbi_hart: enforce riscv,pmwid for Worlds ISA
  lib: sbi_hart: lock mwid CSR for RoT immutability
  include: sbi_domain: add Worlds WID fields
  include: sbi_types: add PRIx64 format macro
  lib: sbi_domain: print World ID config at boot
  lib: sbi_init: print M-mode World ID at boot
  platform: generic: parse root domain WID config from DT
  lib: utils: fdt_domain: parse per-domain WID properties
  lib: sbi_domain: add Worlds CSR config on domain entry
  docs: add RISC-V Worlds next-wid/next-widlist DT properties

 docs/domain_support.md             | 13 ++++++
 docs/opensbi_config.md             | 13 ++++++
 include/sbi/riscv_encoding.h       | 12 +++++
 include/sbi/sbi_domain.h           |  9 ++++
 include/sbi/sbi_hart.h             | 25 +++++++++++
 include/sbi/sbi_types.h            |  2 +
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/sbi/sbi_domain.c               | 50 +++++++++++++++++++++
 lib/sbi/sbi_domain_context.c       |  3 ++
 lib/sbi/sbi_hart.c                 | 71 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c                  |  4 ++
 lib/sbi/sbi_init.c                 | 13 ++++++
 lib/utils/fdt/fdt_domain.c         | 15 +++++++
 lib/utils/fdt/fdt_helper.c         | 61 +++++++++++++++++++++++++
 platform/generic/platform.c        | 33 +++++++++++++-
 15 files changed, 324 insertions(+), 2 deletions(-)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
