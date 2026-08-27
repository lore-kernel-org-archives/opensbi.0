Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC013C61DC7
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z9/+U4iYUfvgdObkpjmXKxetCTftmc+Q7Cara2qhSQU=; b=C+kQYo6St7cA5C
	Ob8k/oWNVXTg/ffy+kZeZj92wp5jguOa8thHXZ8xy6Wi3K3J2jv3kzDML0ZfH3YYsnm+hFz/dN7s0
	RZNskj4pW6tWE+QLbxg3ohSlfO7Sp7j1xgfkyJV8oNnqvuN9VSbarr2qPJiKou3uXyJ8/1FlnY7L8
	zaoybzKIO+ncSC9zeYYD9d+bwcceqbSYBIBzrjYn25AHvAOCvNKCnXUZBMEP1aSxPL2UzTeVI5JQZ
	42o+Pcn0N6AY40on3oA3X9AwUMgQ+we7FFqi+9XDlvJaTIWM0BxcQOlDx/P3X51fJpcmaGTNwS+Rg
	bNZgIdLc9eXTOwxr4rCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHe-00000003jCs-2iUv;
	Thu, 27 Aug 2026 09:20:30 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHb-00000003j86-0JNr
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 09:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787822384;
	bh=6Ezy0PwtwA7RioxkL4VlLgSRx/+e0/M+M3jVL83l/1A=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=IPgA+KXXvbyC24MrpgK0KPbwL9MX1OLmVkHvBUAF6ACTPgo9ILID4RBS4pDPHxNF6
	 bIfNvrudcUyz387lNVYUSvciKZzLEfDhfGalXxNE17bV2mUrYHx+KcBaKxzcBkk3JA
	 VMhLl63SVk2UdUtgl1gtbtVYfCSS7+jVSEzIKDxk=
X-QQ-mid: esmtpgz11t1787822378t2d7d553b
X-QQ-Originating-IP: xcRBzFQlbtCdLJuhOmIEmzovUwcK7IopQRsrxV8HoUg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:19:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15384141044577881311
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/5] platform: generic: spacemit: add K3 platform
 support
Date: Thu, 27 Aug 2026 17:19:18 +0800
Message-Id: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6CMBAFf4Xs2ZLSom088R+GQymrrEohLRAM4
 d8tEA8eJ5k3b4GAnjDANVnA40SBOhdBnhKwjXEPZFRHBsHFhSshWeiNxZYG9pJM50pwoyo8yxr
 iovd4p3mv3cqDw1g90Q5bYjMaCkPnP/vdJDbvKOtM/5UnwXjM20opJU2us+JNbpzTn5ParoVyX
 dcvNeLFK8EAAAA=
X-Change-ID: 20260723-spacemit-k3-84720a7be53d
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8987;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=VT5KVzNPzNoOT4ve+Bc57iJJunucQdQs3OO7rVBeDGs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkTGOUjcmf7cm7L4H+SmWPJsqTIv2jB71jTkqt5N45ZL
 rl7/2tjRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESYvjEyTLo7744lw7+ImhVJ
 0tXOB7UjloUEvsvy/CKRl/sq1HX+NEaGbafDvfKWztumKZPZkb71UEVNwq+40Ky8gou684MjVG3
 5AQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzTHrHNVHA/UnuDQrUgyUeB8UQvj+CSQD28v96BPCpm7gIePOosrz/A1
	tBmH8GM3PXKb4a8W1tA64ogTQuLXf3fF54n4v6nnkzRC1eAbnsE9SUU3GhcMuQNwduCUTed
	0b8dFSEr01xIb2wsgvKsMpQq/vt8R4U2S/AMh4GoWa457W0MXs5dUuEKLpSsv2MOjB+V893
	T2wX2g1jf3FLR6xXyM8mmxBRCZ7ESk3dK7m+nIx3tHE9Q+8gFbnRyBVd5x4UDppJc+DJ0H8
	R5bo97nF4WmsQBIzbC604n6aJarmVVccXvYzoo7Ri67HAsIsHvDR6rOoyLcUaIuYQRdJLyy
	FErz/kE0W/Vajwshof/EjqqRC4aJ0xXsU6tj/X7edYlKFtrquD6XS8JA8hhJoHGKfHu8ksm
	hP1I4zWeJ9nz1W8+52OWplgSDLKPPdlbBe2kSqkNM0WleWgrbcx4c47Bxb0pAXbuvcrLD0R
	StBcYI/Ntw8AQpLmX9x3fAjn8IrwprQaT8cOK/HPHpUMurl3uAf204BsDHh2P1XUKGXoyzN
	Hni7v5HIhqORQPmPegFW4udMHOGu/SbVfU0GbX4uEab4lVKAjlZAh/bpBAuedL8kyeluuCA
	/xN2WPN9+ykfh/f8EdTVWR6xZ1PPOLFuwj44Vv8zNLo9aed53qUgvsVaEJq0OBRzmuGF0FF
	+ZDrw6izvnpLdon1Ol65fEaOtLMbgdeDRvDc6t77uNQxQmjKA/Zvgep853+JvVrVEfgulIi
	klLDuvq/X+7A9B4lKAzlQG6ohyF699xW3doIwgU5qXPJbwBK5AUX4AhzakQG1LClFfrJNB+
	RU1ZNOsh0AXFx1P4gg0XlLM5qK2LT94UYXb9Pm3Kl3kKJzSkq2jsNMmSpabTqEPnTdoDPgm
	dovflqFIFuX29TkzojK1or3mv9YiLnFCgrJEsleqBq+lFHSUYMijJ15TKXGO0ZptGqlzhUd
	cPAwbZDGvx1yIElvr5llWJw3yYEJluN3sodAVamDY4jziNHKtTLz8qB4lKMAibq6zvlbaxU
	i2ZitOuhQcaRZTJjWVeX3KZI7ZMzYmS8v5dt2pzu+NfzyblTR2BO33UrPRPjxOua2qc3EYo
	/KJ31LLoiKIWybL0JeshXa4jpb8R+ixuA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_022027_617645_5A67A065 
X-CRM114-Status: GOOD (  20.65  )
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

SpacemiT K3 combines eight X100 harts and eight A100 harts in four
clusters. The two core types expose different ISA capabilities: X100
implements H and has a 256-bit VLEN, while A100 does not implement H and
has a 1024-bit VLEN. OpenSBI currently selects one expected-trap handler
from the cold-boot hart, so an X100 boot hart would make A100 access H-only
CSRs. Select that handler per hart; the remaining extension and vector
state used by OpenSBI is already maintained or queried per hart.

Only hart 0 is powered at reset. Add a start-only HSM backend which removes
the requested hart's core and cluster power-down votes and wakes it on
demand. Before common warm-boot code runs, each hart restores the PMA
attributes expected by later firmware, enables cache snooping and prefetch,
and enables H on X100. The cold-boot hart also programs the cluster reset
vectors and enables CCI-550 snoop and DVM requests before secondary harts
can start.

K1 shares the vendor cache CSRs, PMU fields, cluster sizing, and CCI-550
helper with K3. Factor only those definitions and helpers into common
SpacemiT files; K1 keeps its topology, boot flow, and HSM behavior. Two
independent K1 fixes clarify the cache operation name and move per-hart
setup out of cold_boot_allowed().

The K3 SDK still loads ESOS for RPMI reset, suspend, and MPXY services.
Secondary-hart startup does not depend on the ESOS HSM service: the K3 HSM
driver matches the root node first and uses the SoC PMU directly, following
the SDK firmware's direct wakeup path.

Runtime validation on a SpacemiT K3 COM260 used the SDK's split NOR
firmware layout. OpenSBI was flashed as fw_dynamic.itb, then loaded from
NOR by the SDK FSBL. OpenSBI built from this series selected the
spacemit-k3-hsm device and reported 16 harts. U-Boot and Linux 6.18.3
started, Linux detected SBI v3.0 and the HSM extension, and all 16 CPUs
came online.

The series has been build-tested with:

  - the RV64 generic default configuration
  - RV64 K1-only and K3-only configurations
  - the RV32 generic configuration, where SpacemiT platform objects are
    intentionally omitted
  - the K3 SDK split OpenSBI and U-Boot packaging flow

The public K3 SDK v1.0.7 components needed to reproduce the firmware build
are pinned at:

  manifests:
    https://github.com/spacemit-com/manifests
    6d767b42fdbd759dc9511b8a13523c3de42aaa5a
  scripts:
    https://github.com/spacemit-com/scripts
    96418825a37a1cf07d3275c13d9d3329934224f0
  U-Boot:
    https://github.com/spacemit-com/uboot-2022.10
    676971d3a61f2583dfd53d8f7dfbc9607cea74b7
  ESOS and esos-lite:
    https://github.com/spacemit-com/esos
    eaf9afd83b27583b9bcafe0153028b32219518f5
    https://github.com/spacemit-com/esos-lite
    df4b2665cd4f3af563538cb41ba85c85dd39de7c

The kernel and root filesystem are independent of this firmware build.
Any board-compatible kernel and root filesystem may be used, so neither is
pinned here. EDK II is not used in this fastboot path.

Before building U-Boot, update UART0 in
bsp-src/uboot-2022.10/arch/riscv/dts/k3.dtsi. This DT is passed to OpenSBI:

  uart0: uart@d4017000 {
          ...
          compatible = "spacemit,k1-uart", "intel,xscale-uart",
                       "ns16550";
          ...
  };

The compatible order makes OpenSBI select UART_CAP_UUE and preserve
UART_IER_UUE (bit 6); matching only "ns16550" writes 0x00 to UART_IER and
stops serial output. Build U-Boot and use the FSBL, bootinfo, and U-Boot
FIT produced by the same SDK build:

  K3_SDK_DIR=/path/to/k3-sdk
  make -C "$K3_SDK_DIR" uboot

This produces the following files under output/k3/images:

  FSBL.bin
  bootinfo_spinor.bin
  u-boot.itb

Build OpenSBI at the address used by the SDK, then wrap fw_dynamic.bin in
the SDK's standalone OpenSBI FIT:

  make O=build-k3 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic \
       PLATFORM_RISCV_ISA=rv64gc FW_TEXT_START=0x100000000
  FW_DIR="$PWD/build-k3/platform/generic/firmware"
  cp "$K3_SDK_DIR/bsp-src/opensbi/platform/generic/spacemit/fw_dynamic.its" \
     "$FW_DIR/"
  (cd "$FW_DIR" && \
   "$K3_SDK_DIR/output/k3/build/uboot-custom/tools/mkimage" \
     -f fw_dynamic.its fw_dynamic.itb)

There are two ways to enter U-Boot fastboot. On a provisioned board, hold
`s` during U-Boot startup and run:

  => fastboot 0

Alternatively, extract factory/FSBL.bin and u-boot.itb from
Bianbu-Minimal-K3-20260728010729.tar.gz. Hold FEL while resetting the
board to enter BROM fastboot, then run on the host:

  fastboot stage factory/FSBL.bin
  fastboot continue
  sleep 8
  fastboot stage u-boot.itb
  fastboot continue

COM260 boots from SPI NOR and uses partition_4M.json from the Bianbu image
for its firmware layout. Select that MTD layout before writing a firmware
partition:

  fastboot flash mtd partition_4M.json

If the installed FSBL and U-Boot already match the prerequisites above,
only the OpenSBI partition needs updating:

  fastboot flash opensbi "$FW_DIR/fw_dynamic.itb"
  fastboot reboot

For an older boot firmware, update the boot-chain components from the
pinned SDK build in the same fastboot session before rebooting:

  SDK_IMAGES="$K3_SDK_DIR/output/k3/images"
  fastboot flash bootinfo "$SDK_IMAGES/bootinfo_spinor.bin"
  fastboot flash fsbl "$SDK_IMAGES/FSBL.bin"
  fastboot flash uboot "$SDK_IMAGES/u-boot.itb"
  fastboot flash opensbi "$FW_DIR/fw_dynamic.itb"
  fastboot reboot

The full Bianbu Minimal image is only needed to initialize a board without
a usable system; this OpenSBI test does not otherwise depend on its Linux
or root filesystem images.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v3:
  - select the HSM backend from the root compatible while preserving K1's
    existing start and stop behavior
  - start secondary harts on demand from the K3 HSM callback; remove the
    cold-boot wake-all loop, WFI tables, and timeout
  - perform PMA, cache, and H-extension setup before the common warm entry;
    use the OpenSBI VMA and guest-translation fence helpers
  - use assembler-safe constants shared by the C and assembly paths
  - omit the 64-bit-only SpacemiT platform objects from RV32 builds
  - clarify the boundary between the K3 HSM backend and ESOS services
  - update the cover letter with the public SDK build and split NOR
    validation procedure
  - add Reviewed-by trailers from Bo Gan
  - Link to v2: https://patch.msgid.link/20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com

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
 lib/utils/hsm/fdt_hsm_spacemit.c             | 125 ++++++++++++++++++++------
 platform/generic/Kconfig                     |  11 +++
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/spacemit/common.h   |  90 +++++++++++++++++++
 platform/generic/include/spacemit/k1.h       |  96 ++++----------------
 platform/generic/include/spacemit/k3.h       | 127 +++++++++++++++++++++++++++
 platform/generic/include/spacemit/k3_asm.h   |  16 ++++
 platform/generic/include/spacemit/spacemit.h |  14 +++
 platform/generic/spacemit/k1.c               |  45 ++++------
 platform/generic/spacemit/k3.c               | 122 +++++++++++++++++++++++++
 platform/generic/spacemit/k3_asm.S           |  52 +++++++++++
 platform/generic/spacemit/objects.mk         |   5 ++
 platform/generic/spacemit/spacemit.c         |  36 ++++++++
 18 files changed, 617 insertions(+), 148 deletions(-)
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
