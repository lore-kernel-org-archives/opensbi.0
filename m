From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jan 2025 21:26:39 +0530
Subject: [PATCH 00/12] More RPMI and MPXY updates
Message-ID: <20250116155651.103782-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does the following:
1) MPXY driver and framework cleanups
2) Update RPMI drivers as-per latest specification
3) Add MPXY RPMI driver for System MSI service group

These patches can also be found in the rpmi_updates_v1 branch at:
https://github.com/avpatel/opensbi.git

To test these patches, use the dev-upstream branch of the following repos:
* https://github.com/ventanamicro/qemu.git
* https://github.com/ventanamicro/linux.git

To enable QEMU RPMI emulation (using librpmi) for virt machine, use
"virt,rpmi=on,aia=aplic-imsic" as the QEMU machine name.

Anup Patel (12):
  lib: utils: Split the FDT MPXY RPMI mailbox client into two parts
  lib: utils: Constantify mpxy_rpmi_mbox_data in mpxy_rpmi_mbox
  lib: utils: Introduce optional MPXY RPMI service group operations
  lib: sbi: Fix capability bit assignment in MPXY framework
  lib: sbi: Improve local variable declarations in MPXY framework
  lib: utils: Drop notifications from MPXY RPMI mailbox client
  lib: utils: Improve variable declarations in MPXY RPMI mailbox client
  include: sbi_utils: Include mailbox.h in rpmi_mailbox.h header
  lib: utils: Implement get_attribute() for the RPMI shared memory
    mailbox
  lib: utils: Populate MPXY channel attributes from RPMI channel
    attributes
  include: sbi_utils: Update RPMI service group IDs and BASE service
    group
  lib: utils: Add MPXY RPMI mailbox driver for System MSI service group

 include/sbi_utils/mailbox/rpmi_mailbox.h    |   1 +
 include/sbi_utils/mailbox/rpmi_msgprot.h    | 117 +++++++-
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  84 ++++++
 lib/sbi/sbi_mpxy.c                          |  77 ++---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c  |  39 ++-
 lib/utils/mpxy/Kconfig                      |  16 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  91 ++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 312 +++++++-------------
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c       | 208 +++++++++++++
 lib/utils/mpxy/objects.mk                   |   7 +-
 platform/generic/configs/defconfig          |   2 +
 11 files changed, 684 insertions(+), 270 deletions(-)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c

-- 
2.43.0


