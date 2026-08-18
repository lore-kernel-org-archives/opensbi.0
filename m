Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465D5C5B572
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/dspxE01D4UdSCmnSJD1bsmdDvcy+Px3i6qWYCKx6U=; b=bBUSLHJ5yo6a70
	LTEnPXWiFO89snI+m6cbdAKyFM/zIFmlab7OkXxyps76XS8mze7w4XLN0fZEDbJ5/CpVT2KuuBmjW
	lwGSeHWxotjl8kIUq6cFpgHYyZfs70j3ACFuSmi6a8oFo7R4dFhVh68uOFnhtVu2qWoTBDbmUn7ST
	TI1dWFVlshfPsQAruwPfZKNIa8Qxe+hvrTVxPL3T3nFR1TaVJKC0YRkqhXT6jdQeCAD5DKIJO7ai+
	pNqpsLlDnL8gt7Igyk5XFvy62zapKJd0cQH3Reul7eyQC0L/3a3og0gOYY5nCM6bByqvW8lnSjr9i
	29POwPVJOccRnA6OF7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pk-000000072gh-0DDO;
	Tue, 18 Aug 2026 01:14:52 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pg-000000072fZ-1kGH
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 01:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787015660;
	bh=wcnCobQfYEkcAiYVzVeqVRoUEQP33tkSYMmfy5ogZbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=UL+2zTaMrqXsuVMMizlFswTFJoRsqXrbo3MMvIdi0dMXZh2iH/OAAqJO+CeCTSkrP
	 1popKrREamC2snDjp7AM4FSlKv9c/aGixsC0VrHld+z69J4UxsS65VVNs5QBmz7m/+
	 6sKhZwTj8jfzn0O+66uiV+4BuBGXjXKEop04PZWE=
X-QQ-mid: esmtpgz12t1787015658t9058bedd
X-QQ-Originating-IP: 8kGD85CGFdakRtPx1KfBDb023XU8mX67K326NaKO86s=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 09:14:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18327991905857347206
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/5] platform: generic: spacemit: add K3 platform
 support
Date: Tue, 18 Aug 2026 09:14:03 +0800
Message-Id: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3eKCxOTU3MwS3WxjXQsTcyODRPOkVFPjFCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCEaUZibwAAAA==
X-Change-ID: 20260723-spacemit-k3-84720a7be53d
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6847;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=xs2t8XAlPNTZSFIgGpqVyOs8VG+MqST4oLgzt+pnWeg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnNGx/cWC301SJfRqM88freB6enN+TscvWL+L43+8Xu/
 ynx35eu6yhlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiIwzdGhg3x0y5Oqu7UX75j
 0S+Tg6X/d6hbMPvzZM907/m2/avH93WMDK2tzxZv/O7ymOVaceCTmb/6bWInmyyaIqirtuVSXUj
 rXw4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvjhxCSDgXICOo/8Jy7SoMysZulEX5CeT8qBdWfv0laK+B+uJYPADf4f
	6ybRFfDCsPBHQtdmxQRKdvWpLKGCO5D1jAAjdEdRz1R1jbu77ElvUR5n85eOK3Z45vLGF0J
	4oUUz9YsWQzV2OinuRxGNygQM0CO9S6FOUmOJnsXCUqIXOoej7rqBAvFT5igMcmiBe5kD1M
	RTwYol/3AdRWDNez7cqmoHmGAYZ5HxQ7QM0ijY5OrNIo6i+4nKgvjuP2XcIbpOw6i+jviDN
	YHWA/vZl2GkQ9aqeVVMbqqRgq4XeTX+ykflRqWJmwvKrJnBoE8tnxtpjuzriXuXZ+HGo7ST
	5/ow2Kff2B+NheE50asYwxAQnkTDJY2+pOD6hlX+RR+BoUPGx1GYqN1meJIIn7Y50Ba3g4d
	RclDIMLjz/NIDSJh2G6aeqDEt1Ql+rWGe7QqifmqH5GWJu0xK2y/GUjQLONx6Keo486oZEI
	ZgV67jp7529MmRtOkr/RJiyWQAZtdhQGybjWhkLxaNDbJX/AQ3o8EZJqbgQ1J/yTYFOyen8
	wM3k0pPWgYjoO0Zoxa17Wp8WfaeYqfXvymQ6MjJL1AXzEQVJ3blZUiCg68vJ7Qowd/W/VFr
	fJEZlQ8KjuFym04B11Q9HdsrFPAdI8ZYwtoGE57upw9u2Rg3OhDpJd90/cgOB+0kt4oocwF
	Q54ZmK0Vpp57LIWx/eDECA5yh0q6COPLkFSYd72FaJXNvCfqbkMEZAJC6JAhiLJ/dJPEz3x
	STUS7Dzp++HLZ82GXntSAN75f4Xjnzkm0azFqQ6N+lcp76kCl5bwQnUhebXR7PDbVipCFqp
	+7VYUjPKFc/z+8zC6TfYTgOvezh+geHJDVWQ6C4CwP7M0aM1nqG1N2SbGd45nlb5WtdlH7q
	+6SsRFLgoEfATr6BNbqO/fsPsYhXJ2iat2c08SM/dDpPe6+6QnmR33XFoZ+GBycfLrHW7bm
	NqVGpEn3ThZRiwqPBZL+ys12DR/unnAY5M/9JYFIP8QJ78LFROtJLq6KfEIuz3D/MPOXRj3
	hcgqvA2jnq6JbhTzEtDr0XpTvrQPs4MPQURetoN11EbCnXSq+/l3vJwET+Or+CGVWFpbJgk
	7Y/QHV8+QdujZufihhZgfk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181449_096017_9B44E778 
X-CRM114-Status: GOOD (  15.02  )
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

Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
16 harts split across four clusters: eight X100 harts in C0/C1 and
eight A100 harts in C2/C3.

The main upstream integration constraint is that K3 is heterogeneous at
the ISA level. The CPU device tree used for testing exposes the same
non-H standard extensions for X100 and A100. X100 additionally exposes H
and the related Sha, Shcounterenw, Shgatpa, Shtvala, Shvsatpa,
Shvstvala, and Shvstvecd extensions. X100 has a 256-bit VLEN, while
A100 has a 1024-bit VLEN. A100 also implements the vendor-specific
SpacemiT IME and FP8 AI extensions, which OpenSBI does not inspect or
use.

At the base of this series, OpenSBI selects the expected-trap handler
once from the cold-boot hart and reuses it globally. An X100 cold-boot
hart would therefore make an A100 hart use the H-aware handler, which
accesses mtval2 and mtinst even though A100 does not implement H. Select
the handler from the current hart instead. An audit of the remaining
extension-dependent paths found that ISA extensions and detected CSR
features are stored per-hart, the generic FDT parser visits every hart,
and vector code reads the current hart's VLENB. The K3 CPU device tree
also exposes the same counter and timer extensions on both core types.
No other cold-boot-hart-derived ISA selection was found.

K1 and K3 share vendor cache-control CSRs, PMU idle fields, cluster
sizing, and the CCI-550 programming sequence, but their CCI topology,
boot flow, and HSM support differ. Factor only the common definitions and
CCI helper so K3 does not depend on K1 and the K1 encoded values and
behavior remain unchanged. Run per-hart register setup from
nascent_init() rather than the policy-only cold_boot_allowed() hook.

On K3, the cold-boot hart programs the four cluster warm-boot vectors,
enables CCI snoop and DVM requests, prevents WFI from powering down cores
or clusters, and wakes the secondary harts. A bounded wait prevents a
non-responsive secondary hart from stalling boot indefinitely. Each hart
programs its own PMA, cache, snooping, and prefetch state, with X100 harts
also enabling H. The warm-boot entry establishes cache coherency before
entering common code so secondary harts can observe state published by
the cold-boot hart.

Runtime validation used the SpacemiT K3 SDK. The UART at 115200 baud
showed OpenSBI and U-Boot starting successfully, followed by Linux
bringing all 16 harts online. The series has also been build-tested with:

  - the generic default configuration
  - a K1 configuration with K3 disabled and the SpacemiT HSM driver
  - a K3 configuration with K1 and the SpacemiT HSM driver disabled

To reproduce the runtime test, build this OpenSBI tree at the address
where the SDK loads it, then copy the resulting firmware into the SDK
output directory:

  K3_SDK_DIR=/path/to/k3-sdk
  make O=build-k3 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic \
       FW_TEXT_START=0x100000000
  cp build-k3/platform/generic/firmware/fw_dynamic.bin \
     "$K3_SDK_DIR/output/fw_dynamic.bin"

Before rebuilding U-Boot, update the UART0 node in the K3 board DT
selected by SPL and passed to OpenSBI. The SDK describes it only as
"ns16550", so upstream OpenSBI initializes it without UART_CAP_UUE and
writes 0x00 to UART_IER. The K3 UART requires UART_IER_UUE (bit 6).
Change the node in uboot-2022.10/arch/riscv/dts/k3.dtsi to:

  uart0: uart@d4017000 {
          ...
          compatible = "spacemit,k1-uart", "intel,xscale-uart",
                       "ns16550";
          ...
  };

The compatible order is significant. Upstream OpenSBI skips the vendor
string, then matches "intel,xscale-uart", which selects UART_CAP_UUE and
writes 0x40 to UART_IER. The final "ns16550" remains a generic fallback.
This is the DT used for the successful boot test.

With output/fw_dynamic.bin already present, rebuild U-Boot. The SDK
preserves that OpenSBI binary and packages it with U-Boot:

  make -C "$K3_SDK_DIR" uboot

This produces output/FSBL.bin and output/u-boot-opensbi.itb. Using the
SDK-built output/Image.itb, enter BROM fastboot mode with FEL+RESET and
stage all three images into RAM:

  fastboot stage "$K3_SDK_DIR/output/FSBL.bin"
  fastboot continue
  sleep 8
  fastboot stage "$K3_SDK_DIR/output/u-boot-opensbi.itb"
  fastboot continue
  sleep 3
  fastboot stage "$K3_SDK_DIR/output/Image.itb"
  fastboot continue

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
  - correct the K3 PMACFG0 CSR number from 0xbc0 to 0x7de
  - select the expected-trap handler per hart for heterogeneous H support
  - move K1 and K3 per-hart setup out of cold_boot_allowed()
  - split the generic and K1 fixes into standalone patches, growing the
    series from three patches to five
  - document X100/A100 ISA and VLEN differences and the homogeneous-core
    audit
  - document OpenSBI/U-Boot packaging, the UART compatible adjustment,
    and the USB fastboot test procedure
  - Link to v1: https://lore.kernel.org/r/20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com

---
Troy Mitchell (2):
      lib: sbi: select expected trap handler per hart
      platform: generic: spacemit: k1: move hart init to nascent hook

Xianbin Zhu (3):
      platform: generic: spacemit: k1: rename cache flush operation
      platform: generic: spacemit: k1: refactor platform support
      platform: generic: spacemit: k3: add platform support

 include/sbi/sbi_csr_detect.h                 |   4 +-
 include/sbi/sbi_hart.h                       |   2 +-
 lib/sbi/sbi_hart.c                           |   9 +-
 lib/sbi/sbi_illegal_atomic.c                 |   4 +-
 lib/sbi/sbi_unpriv.c                         |   6 +-
 lib/utils/hsm/fdt_hsm_spacemit.c             |   7 +-
 platform/generic/Kconfig                     |   9 +
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/spacemit/common.h   |  88 +++++++++
 platform/generic/include/spacemit/k1.h       |  96 ++--------
 platform/generic/include/spacemit/k3.h       | 144 +++++++++++++++
 platform/generic/include/spacemit/k3_asm.h   |  16 ++
 platform/generic/include/spacemit/spacemit.h |  14 ++
 platform/generic/spacemit/k1.c               |  45 ++---
 platform/generic/spacemit/k3.c               | 266 +++++++++++++++++++++++++++
 platform/generic/spacemit/k3_asm.S           |  33 ++++
 platform/generic/spacemit/objects.mk         |   3 +
 platform/generic/spacemit/spacemit.c         |  36 ++++
 18 files changed, 661 insertions(+), 122 deletions(-)
---
base-commit: c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04
change-id: 20260723-spacemit-k3-84720a7be53d

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
