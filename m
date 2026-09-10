Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FF4C88E40
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dSWWE+IWUeA16RFH/zHa9ERrBISZ1Puhc69OxEzQqQ4=; b=LABhKYtODD1X6r
	2lYI8UZO/66VWCR1IqSE7U487HPUEl+/u0POC0EaZt651AOseSFFoWyQGWCxJHUgLGB9W9L4Jf2dv
	Jf0rB/z1hjL4zgL3hweeowQpcP25jNCDcw/lTgzmL6Wc6mbtrXQ6HriisPcDzEAzQnRD3XdWejSwO
	LEDfwmmKECPitd9ELyG2NWpuSl8V88BwZbUlpQDamRMXy3RCE2ax2+aw/czAVIrugr14fuHEbec12
	4KUgOT8hY4fyzPhpQkPpsnGCT46OGdnACRj4zOBKd/igxEsPD2vY3pwf6OW0IzpMNYYMQHi3V6iGp
	b8IQCGsJFyQKHl66Tu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fM2-0000000EY0Y-3ZVp;
	Thu, 10 Sep 2026 14:02:18 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fLz-0000000EXx8-2kVL
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789048890;
	bh=eeDr92bHEC6qvcWjGDdY1ydhMEcOv9bxJzZuyDL00Qg=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=sdgUP8ZluYDoQ/KYD/jqiiusJMnrc0LevABro2mUzDUc7T1s6aYBkk4dKhojHM5YP
	 XTLGwY7MMbHi+I22STw1lG57UA7tFeaRN4H09YlbOFABHiKdZCayxWrwk85+8b3XqS
	 +Hu3yuvgtNpKaKm1lmi/lC7Fk9wmTO2nb3UZ+cLU=
X-QQ-mid: zesmtpgz8t1789048884ta6809b3d
X-QQ-Originating-IP: vL/CmltVCErN0/VphzPZI8XTDnYfFZLs6sIRncIyD8E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:01:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3694407523367166055
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/6] platform: generic: spacemit: add K3 platform
 support
Date: Thu, 10 Sep 2026 22:00:01 +0800
Message-Id: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSw6CMBgE4KuQri2BFmh15T2Mi76UX+WRFhoM4
 e62EBNJXE4y882MnLFgHDolM7LGg4OuDaE4JEjVor0bDDpkRDJSZYxQ7HqhTAMDflLMC0YywaQ
 pqUZh0Vtzg2nVLtctu1E+jBoiERs1uKGz7/XOk9jbZJ7znewJzgKvJGOMioLn5xe045R+O6nqG
 hQvPP1BCNsjNCCl5lrKipf0qP8iy7J8ADz2lm0GAQAA
X-Change-ID: 20260723-spacemit-k3-84720a7be53d
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Alvin Chang <alvinga@andestech.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9868;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=zc+LKhb7gjxXD0+UhLqoQyR+fuvsFFrb807ZUwSdU28=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmLdmhkCviL7klf4MQvPN3mi3BvilvU6dijB1IPSxXw6
 geLP73YUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBF2d0aGO8e4VnRxLnb4O+OF
 yRGJu9VfdpsfCjrU5Xxr4vI3Te1ulxkZDrq03HRw7ViuzuQ449bz0vkhF/vft75b9JChlOuu5sR
 8VgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMk0zjEMUgTJG5iNz8gZRcIrOtM2GtSmw+zMqw4z1dR1xb/TSI3GAUvP
	stPCuqNDn78pNj/GNMUfhaqlrh+2aNlo8zYvTQlwVg5HE/B6779vNRbWwqgON7YL8CffqwA
	9CDECLxv5WH+Zvk469RpLKKnTXNwNFlJISmVFJLQCVatnTRUtMkFGfQ/Lu7+PDe4PuCfd6x
	qwu0u/pLzsbawa5FdYEegh70YY5mJEJYQBRn86XctzeY9K1r8SvsOE4Rxp3PQbGha+WjGix
	6ngN8FTjJ/UCKWSAbbVYGpregw/xd2KBMApS1w8AOSpsWyYWj/oYymxQfnW1x67RaNKgR8/
	Icw29dcacwI2Ja/fr+oXEYqcsjyKaLFu2W7zTWueJN0voE5VduoLCvgW/hXJx9wi7knkNA0
	0vDzAPuLLQPJgxCE+uQ4dsfFwwEVpuFYxt4QLZ5U9Etq/vX8uZLw+KfCXZso6uXMuLsEPzf
	cXAIUQZFDc8fyAu3VZheu7UiLdIYgcgr7XehHHsPiC46gCUSuPNQQ7SAkRCR3ICZxiSvfmQ
	UsVDg1u2igMN0zzYxZ0CWbroJPZefL7txdivp9bgmyiOpkWwd71XBuCS1dVaH7Z/TynDWRF
	r9tkEy3DkV+E4seeEOVJ+EdFIj8fDTu2dMti7t34kPCkxkAP072kZsE19f5s6INKr6VMsOW
	h/g9U8VCZZZsKe0z4/dYeyq7zQGN7Eq+qYnulrCascQS/zfCbzhUp+n8jLc1k8+afvjHXcA
	OkB8MDlnzBuy6vpCh7RbtHDUMyZDJctN+MK8Ij067wVQgiOM49GHSRshFXT3+XlBAnlpKcF
	PPOpH70e/ygr6l0tTPcrv7CO6M5UF4sE9hw9XGjbN17abem0oqSlsj7kcPR4m+qTAktzTqI
	t4YQXANc/aeSBBkQH7F99MkNFacCTYN9VCrX+WfRvzSHhzSpQ70cvANDy4J4rXspT+wTlv4
	VxSyt5A9K9pqQFmu/VBvwOoFNkbjHwzSU2ZzqUAa1/m28QWntWtBka7WLQVmtsrctvn1GLB
	WK9ZIth2zi3vA/IEmmOXvDYLlQJmPGyFvaLPe/8cZNperRY5tCZavBNUDzOeeo7fqkAMWHR
	wM+FMG7eL8IgjW4In2KTdi3Pc+XcWGci/PtbUp9Jb8ojxrIvTMh0KbJPi6DvtIde2UJorHC
	AxpZTIXAvKQXPpMz5H/BMWC6N8xZ7awDOAUvLiaqVl10NUpNVPpHxZHxAe/Xk0phbtT5
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_070216_246620_2575FC61 
X-CRM114-Status: GOOD (  23.30  )
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

This series adds basic K3 platform initialization and start-only HSM
support. Secondary harts are started directly through the SoC PMU. RPMI
support for the vendor kernel is outside the scope of this series; the
upstream Linux boot path does not depend on ESOS.

K3 has eight X100 harts and eight A100 harts across four clusters. X100
implements H with a 256-bit VLEN; A100 has no H and a 1024-bit VLEN. The
existing expected-trap handler is chosen by the cold-boot hart, which
fails if that hart implements H and another does not. Store the handler
per hart in scratch space and load it directly, avoiding an accessor call
in CSR probes. Other extension and vector state is already maintained or
queried per hart.

Only hart 0 is powered at reset. The HSM backend clears the requested
hart's core and cluster power-down votes and wakes it on demand. PMA,
cache and X100 H-extension setup precede the common warm-boot entry.
Cold boot programs the cluster reset vectors and enables CCI-550 snoop
and DVM requests before secondary harts start.

The shared SpacemiT code is limited to common register definitions and
the CCI-550 helper. K1 retains its topology, boot flow and HSM behavior.

I tested this on a K3 COM260 with Linux v7.3-rc1 and only the v5 CPU PLL
rate table patch [1] applied, using the unmodified upstream
k3-com260-ifx.dtb and a minimal initramfs. The board booted from SPI NOR
using the public SDK FSBL and U-Boot, with OpenSBI installed as a
separate FIT using the procedure below.

OpenSBI used the SDK's 16-hart DT and booted on hart 0. Linux brought up
the eight X100 harts described by its DT and reached a shell. I did not
reproduce the hang Valentin reported with Linux 7.2 and an eight-CPU
kernel DT [2].

Build-tested with RV64 generic (CONFIG_STACK_PROTECTOR_ALL) and RV32
generic. SpacemiT platform objects are excluded from RV32 builds.

Firmware installation
---------------------

The following NOR installation steps use the public K3 SDK v1.0.7:

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

The SDK is used to build the boot firmware; the Linux kernel and root
filesystem are built separately. The commands below assume the SDK is
configured for K3, with its host toolchain available in output/k3/host.

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
stops serial output. Rebuild U-Boot and use the FSBL, bootinfo, and U-Boot
FIT produced by the same SDK build:

  K3_SDK_DIR=/path/to/k3-sdk
  make -C "$K3_SDK_DIR/output/k3" uboot-rebuild

This produces the following files under output/k3/images:

  FSBL.bin
  bootinfo_spinor.bin
  u-boot.itb

From the OpenSBI source directory, build with the SDK toolchain at the
address used by the SDK, then wrap fw_dynamic.bin in the SDK's standalone
OpenSBI FIT:

  SDK_CROSS_COMPILE="$K3_SDK_DIR/output/k3/host/bin/riscv64-unknown-linux-gnu-"
  make -j24 O=build-k3 CROSS_COMPILE="$SDK_CROSS_COMPILE" \
       PLATFORM=generic PLATFORM_RISCV_ISA=rv64gc \
       FW_TEXT_START=0x100000000
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

An existing system can be kept when updating the boot firmware. Flashing
the full Bianbu Minimal system image is only needed for a board without
a usable system.

Link: https://lore.kernel.org/all/20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com/ [1]
Link: https://lore.kernel.org/all/CAPEPrSMsnbuPOUuvj06+PtczdokK42vSpy8n_0hCLh0cEO-QkQ@mail.gmail.com/ [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v4:
- use per-hart scratch for the expected-trap handler, avoiding accessor
  calls and their stack-protector instrumentation; initialize it before
  platform hooks and preserve scratch allocation alignment
- include Valentin Haudiquet's hart-0-only cold-boot restriction as a
  separate patch after K3 platform support
- update the cover letter's test environment, results, and support scope
- Link to v3: https://patch.msgid.link/20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com

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

Valentin Haudiquet (1):
      platform: generic: spacemit: k3: override cold_boot_allowed for hart 0 only

Xianbin Zhu (3):
      platform: generic: spacemit: k1: rename cache flush operation
      platform: generic: spacemit: k1: refactor platform support
      platform: generic: spacemit: k3: add platform support

 include/sbi/sbi_csr_detect.h                 |   4 +-
 include/sbi/sbi_hart.h                       |   5 +-
 include/sbi/sbi_scratch.h                    |   7 +-
 lib/sbi/sbi_hart.c                           |   8 --
 lib/sbi/sbi_illegal_atomic.c                 |   4 +-
 lib/sbi/sbi_init.c                           |   7 ++
 lib/sbi/sbi_scratch.c                        |   4 +
 lib/sbi/sbi_unpriv.c                         |   6 +-
 lib/utils/hsm/fdt_hsm_spacemit.c             | 125 ++++++++++++++++++++------
 platform/generic/Kconfig                     |  11 +++
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/spacemit/common.h   |  90 +++++++++++++++++++
 platform/generic/include/spacemit/k1.h       |  96 ++++----------------
 platform/generic/include/spacemit/k3.h       | 127 ++++++++++++++++++++++++++
 platform/generic/include/spacemit/k3_asm.h   |  16 ++++
 platform/generic/include/spacemit/spacemit.h |  14 +++
 platform/generic/spacemit/k1.c               |  45 ++++------
 platform/generic/spacemit/k3.c               | 128 +++++++++++++++++++++++++++
 platform/generic/spacemit/k3_asm.S           |  52 +++++++++++
 platform/generic/spacemit/objects.mk         |   5 ++
 platform/generic/spacemit/spacemit.c         |  36 ++++++++
 21 files changed, 638 insertions(+), 153 deletions(-)
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
