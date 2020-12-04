From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  4 Dec 2020 21:22:13 +0530
Subject: [PATCH v2 00/11] OpenSBI domain configuration using device tree
Message-ID: <20201204155224.733188-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds mechanism to configure/populate OpenSBI domains from
device tree passed in the platform support. The generic platform is
totally device tree based platform so generic platform is the first
platform providing OpenSBI domain configuration using device tree.

To test this series, we created two domains: trusted-domain (cpu0)
and untrusted-domain (cpu1, cpu2, cpu3, cpu4) on QEMU sifive_u machine.
The trusted-domain ran a baremetal hello world application using UART1
whereas untrusted-domain ran Linux kernel with UART0 as console. The
device tree configuration for this test case is provided as example
in docs/domain_support.md.

These patches can also be found in domains_dtb_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Addressed comments in PATCH8, PATCH9, and PATCH10

Anup Patel (11):
  lib: sbi: Fix sbi_hart_switch_mode() for u-mode
  lib: sbi: Fix typo in sbi_domain_finalize()
  lib: sbi: Fix domain_count check in sbi_domain_finalize()
  lib: sbi: Auto start domain only if boot HART within limits
  include: sbi: Use lower bits for domain memory region permissions
  lib: sbi: Override domain boot HART when coldboot HART assigned to it
  lib: sbi: Add error prints in sbi_domain_finalize()
  include: sbi: Add domains_init() platform operation
  docs: Add domain device tree binding documentation
  lib: utils: Add helper routines to populate domains from FDT
  platform: generic: Populate domains from FDT

 docs/domain_support.md             | 208 ++++++++++++++
 include/sbi/sbi_domain.h           |   6 +-
 include/sbi/sbi_platform.h         |  16 ++
 include/sbi_utils/fdt/fdt_domain.h |  80 ++++++
 lib/sbi/sbi_domain.c               |  90 +++++-
 lib/sbi/sbi_hart.c                 |   8 +-
 lib/utils/fdt/fdt_domain.c         | 445 +++++++++++++++++++++++++++++
 lib/utils/fdt/objects.mk           |   1 +
 platform/generic/platform.c        |   9 +
 9 files changed, 845 insertions(+), 18 deletions(-)
 create mode 100644 include/sbi_utils/fdt/fdt_domain.h
 create mode 100644 lib/utils/fdt/fdt_domain.c

-- 
2.25.1


