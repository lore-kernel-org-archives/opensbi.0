From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Nov 2024 21:20:35 +0530
Subject: [PATCH v2 00/17] RPMI and SBI MPXY support for OpenSBI
Message-ID: <20241129155052.2866712-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds RPMI and SBI MPXY support for OpenSBI. The RPMI service
groups supported include system reset, system suspend, HSM, CPPC, and
clock. The RPMI clock serivice group is exposed to supervisor software
as an MPXY channel.

These patches can also be found in the rpmi_mpxy_v2 branch at:
https://github.com/avpatel/opensbi.git

To test these patches, use the dev-upstream branch of the following repos:
* https://github.com/ventanamicro/qemu.git
* https://github.com/ventanamicro/linux.git

To enable QEMU RPMI emulation (using librpmi) for virt machine, use
"virt,rpmi=on" as the QEMU machine name.

Changes since v1:
 - Rebased on latest OpenSBI
 - Use the recently introduced helpers for generic driver initialization
 - Updated RPMI drivers to match the latest RPMI specification
 - Don't support fixed number of channels in RPMI shared memory mailbox driver
 - Added new patch9 for support RPMI HSM based FDT fixup
 - Improved arrangment of barrier in __smq_rx() and __smq_tx()

Anup Patel (8):
  lib: utils/mailbox: Add generic mailbox library
  lib: utils/mailbox: Add simple FDT based mailbox framework
  lib: utils: Add simple FDT based system suspend driver framework
  lib: utils/fdt: Allow dynamic registration of FDT fixup callbacks
  lib: utils: Add simple FDT based HSM driver framework
  lib: utils: Add simple FDT based CPPC driver framework
  lib: sbi: Implement SBI MPXY extension
  lib: utils: Add simple FDT based MPXY driver framework

Rahul Pathak (5):
  lib: Increase ROOT_REGION_MAX to accomodate more memregions
  lib/utils: Add RPMI messaging protocol and shared memory transport
    support
  lib/utils: reset: Add RPMI System Reset driver
  lib: sbi: Add SBI Message Proxy (MPXY) framework
  lib: utils/mpxy: Add RPMI client driver for MPXY

Subrahmanya Lingappa (4):
  lib: utils/suspend: Add RPMI system suspend driver
  lib: sbi: Add optional resume address to hart suspend
  lib: utils/hsm: Add RPMI HSM driver
  lib: utils/cppc: Add RPMI CPPC driver

 include/sbi/sbi_ecall_interface.h            |  12 +
 include/sbi/sbi_error.h                      |  15 +-
 include/sbi/sbi_hsm.h                        |   6 +-
 include/sbi/sbi_mpxy.h                       | 183 +++++
 include/sbi/sbi_platform.h                   |  17 +
 include/sbi_utils/cppc/fdt_cppc.h            |  26 +
 include/sbi_utils/fdt/fdt_fixup.h            |  15 +
 include/sbi_utils/hsm/fdt_hsm.h              |  26 +
 include/sbi_utils/mailbox/fdt_mailbox.h      |  35 +
 include/sbi_utils/mailbox/mailbox.h          | 180 +++++
 include/sbi_utils/mailbox/rpmi_mailbox.h     |  32 +
 include/sbi_utils/mailbox/rpmi_msgprot.h     | 607 +++++++++++++++
 include/sbi_utils/mpxy/fdt_mpxy.h            |  26 +
 include/sbi_utils/suspend/fdt_suspend.h      |  26 +
 lib/sbi/Kconfig                              |   3 +
 lib/sbi/objects.mk                           |   4 +
 lib/sbi/sbi_domain.c                         |   2 +-
 lib/sbi/sbi_ecall_mpxy.c                     |  68 ++
 lib/sbi/sbi_hsm.c                            |   6 +-
 lib/sbi/sbi_init.c                           |   6 +
 lib/sbi/sbi_mpxy.c                           | 698 +++++++++++++++++
 lib/utils/Kconfig                            |  10 +
 lib/utils/cppc/Kconfig                       |  19 +
 lib/utils/cppc/fdt_cppc.c                    |  22 +
 lib/utils/cppc/fdt_cppc_drivers.carray       |   3 +
 lib/utils/cppc/fdt_cppc_rpmi.c               | 377 +++++++++
 lib/utils/cppc/objects.mk                    |  14 +
 lib/utils/fdt/fdt_fixup.c                    |  33 +
 lib/utils/hsm/Kconfig                        |  19 +
 lib/utils/hsm/fdt_hsm.c                      |  22 +
 lib/utils/hsm/fdt_hsm_drivers.carray         |   3 +
 lib/utils/hsm/fdt_hsm_rpmi.c                 | 362 +++++++++
 lib/utils/hsm/objects.mk                     |  14 +
 lib/utils/mailbox/Kconfig                    |  29 +
 lib/utils/mailbox/fdt_mailbox.c              |  96 +++
 lib/utils/mailbox/fdt_mailbox_drivers.carray |   5 +
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c   | 773 +++++++++++++++++++
 lib/utils/mailbox/mailbox.c                  | 138 ++++
 lib/utils/mailbox/objects.mk                 |  18 +
 lib/utils/mailbox/rpmi_mailbox.c             |  91 +++
 lib/utils/mpxy/Kconfig                       |  19 +
 lib/utils/mpxy/fdt_mpxy.c                    |  22 +
 lib/utils/mpxy/fdt_mpxy_drivers.carray       |   3 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c          | 442 +++++++++++
 lib/utils/mpxy/objects.mk                    |  14 +
 lib/utils/reset/Kconfig                      |   5 +
 lib/utils/reset/fdt_reset_rpmi.c             | 141 ++++
 lib/utils/reset/objects.mk                   |   3 +
 lib/utils/suspend/Kconfig                    |  19 +
 lib/utils/suspend/fdt_suspend.c              |  22 +
 lib/utils/suspend/fdt_suspend_drivers.carray |   3 +
 lib/utils/suspend/fdt_suspend_rpmi.c         | 138 ++++
 lib/utils/suspend/objects.mk                 |  14 +
 platform/generic/allwinner/sun20i-d1.c       |   2 +-
 platform/generic/configs/defconfig           |  12 +
 platform/generic/platform.c                  |  16 +
 56 files changed, 4903 insertions(+), 13 deletions(-)
 create mode 100644 include/sbi/sbi_mpxy.h
 create mode 100644 include/sbi_utils/cppc/fdt_cppc.h
 create mode 100644 include/sbi_utils/hsm/fdt_hsm.h
 create mode 100644 include/sbi_utils/mailbox/fdt_mailbox.h
 create mode 100644 include/sbi_utils/mailbox/mailbox.h
 create mode 100644 include/sbi_utils/mailbox/rpmi_mailbox.h
 create mode 100644 include/sbi_utils/mailbox/rpmi_msgprot.h
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy.h
 create mode 100644 include/sbi_utils/suspend/fdt_suspend.h
 create mode 100644 lib/sbi/sbi_ecall_mpxy.c
 create mode 100644 lib/sbi/sbi_mpxy.c
 create mode 100644 lib/utils/cppc/Kconfig
 create mode 100644 lib/utils/cppc/fdt_cppc.c
 create mode 100644 lib/utils/cppc/fdt_cppc_drivers.carray
 create mode 100644 lib/utils/cppc/fdt_cppc_rpmi.c
 create mode 100644 lib/utils/cppc/objects.mk
 create mode 100644 lib/utils/hsm/Kconfig
 create mode 100644 lib/utils/hsm/fdt_hsm.c
 create mode 100644 lib/utils/hsm/fdt_hsm_drivers.carray
 create mode 100644 lib/utils/hsm/fdt_hsm_rpmi.c
 create mode 100644 lib/utils/hsm/objects.mk
 create mode 100644 lib/utils/mailbox/Kconfig
 create mode 100644 lib/utils/mailbox/fdt_mailbox.c
 create mode 100644 lib/utils/mailbox/fdt_mailbox_drivers.carray
 create mode 100644 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
 create mode 100644 lib/utils/mailbox/mailbox.c
 create mode 100644 lib/utils/mailbox/objects.mk
 create mode 100644 lib/utils/mailbox/rpmi_mailbox.c
 create mode 100644 lib/utils/mpxy/Kconfig
 create mode 100644 lib/utils/mpxy/fdt_mpxy.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_drivers.carray
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
 create mode 100644 lib/utils/mpxy/objects.mk
 create mode 100644 lib/utils/reset/fdt_reset_rpmi.c
 create mode 100644 lib/utils/suspend/Kconfig
 create mode 100644 lib/utils/suspend/fdt_suspend.c
 create mode 100644 lib/utils/suspend/fdt_suspend_drivers.carray
 create mode 100644 lib/utils/suspend/fdt_suspend_rpmi.c
 create mode 100644 lib/utils/suspend/objects.mk

-- 
2.43.0


