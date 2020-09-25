From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 25 Sep 2020 16:58:58 +0530
Subject: [PATCH 00/16] OpenSBI domain support
Message-ID: <20200925112914.725846-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends OpenSBI to provide system-level partitioning where each
logical system-level partition is referred to as OpenSBI domain. The last
patch of this series provides documentation for OpenSBI domain support.

It will be responsibility of OpenSBI platform support to populate OpenSBI
domains based on use-case of platform vendor.

We will be having separate series to extend OpenSBI generic platform so that
OpenSBI generic platform can populate OpenSBI domains from DTB passed by the
previous booting stage which in-turn provides more configurability to the
previous booting stage.

These patches are also available in domains_v1 branch at
https://github.com/avpatel/opensbi.git

Anup Patel (16):
  include: sbi: Remove redundant includes from sbi_platform.h
  include: sbi: Remove pmp_region callbacks from sbi_platform_operations
  lib: sbi: Configure PMP late in coldboot and warmboot path
  lib: sbi: Remove redundant hartid parameter from sbi_hart_init()
  include: sbi: Make hartmask pointer as const in
    sbi_hartmask_test_hart()
  lib: sbi: Add initial domain support
  lib: sbi: Extend sbi_hsm_hart_started_mask() for domains
  lib: sbi: Extend sbi_hsm_hart_start() for domains
  lib: sbi: Optimize sbi_hsm_hart_started_mask() implementation
  lib: sbi: Extend sbi_system_reset() for domains
  lib: utils: Update fdt_reserved_memory_fixup() to use current domain
  lib: utils: Update fdt_cpu_fixup() to use current domain
  lib: sbi: Remove redundant sbi_hart_pmp_xyz() functions
  lib: sbi: Configure PMP based on domain memory regions
  lib: sbi: Display domain details in boot prints
  docs: Add initial documentation for domain support

 README.md                  |   3 +
 docs/domain_support.md     | 105 +++++++++
 docs/doxygen.cfg           |   1 +
 include/sbi/sbi_domain.h   | 144 ++++++++++++
 include/sbi/sbi_hart.h     |  13 +-
 include/sbi/sbi_hartmask.h |   2 +-
 include/sbi/sbi_hsm.h      |  12 +-
 include/sbi/sbi_platform.h |  56 ++---
 lib/sbi/objects.mk         |   1 +
 lib/sbi/sbi_domain.c       | 461 +++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_hsm.c    |   8 +-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_hart.c         | 152 ++++--------
 lib/sbi/sbi_hsm.c          |  59 +++--
 lib/sbi/sbi_init.c         |  59 +++--
 lib/sbi/sbi_ipi.c          |   6 +-
 lib/sbi/sbi_system.c       |  11 +-
 lib/utils/fdt/fdt_fixup.c  |  55 ++---
 18 files changed, 906 insertions(+), 246 deletions(-)
 create mode 100644 docs/domain_support.md
 create mode 100644 include/sbi/sbi_domain.h
 create mode 100644 lib/sbi/sbi_domain.c

-- 
2.25.1


