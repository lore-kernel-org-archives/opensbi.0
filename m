From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 15 Oct 2020 18:56:44 +0530
Subject: [PATCH v2 00/16] OpenSBI domain support
Message-ID: <20201015132700.2232820-1-anup.patel@wdc.com>
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

These patches are also available in domains_v2 branch at
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Updated PATCH subject in PATCH5
 - Updated PATCH6 to allow next stage mode as S-mode or U-mode only
 - Added SBI_DOMAIN_MAX_INDEX define in PATCH6
 - Renamed sbi_domain_assigned_hart to sbi_domain_is_assigned_hart in PATCH6
 - Renamed sbi_domain_assigned_hartmask to sbi_domain_get_assigned_hartmask
   in PATCH6
 - Addressed nit comments in PATCH16

Anup Patel (16):
  include: sbi: Remove redundant includes from sbi_platform.h
  include: sbi: Remove pmp_region callbacks from sbi_platform_operations
  lib: sbi: Configure PMP late in coldboot and warmboot path
  lib: sbi: Remove redundant hartid parameter from sbi_hart_init()
  include: sbi: Make hartmask pointer const in sbi_hartmask_test_hart()
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
 docs/domain_support.md     | 106 +++++++++
 docs/doxygen.cfg           |   1 +
 include/sbi/sbi_domain.h   | 148 ++++++++++++
 include/sbi/sbi_hart.h     |  13 +-
 include/sbi/sbi_hartmask.h |   2 +-
 include/sbi/sbi_hsm.h      |  12 +-
 include/sbi/sbi_platform.h |  56 +----
 lib/sbi/objects.mk         |   1 +
 lib/sbi/sbi_domain.c       | 473 +++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_hsm.c    |   8 +-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_hart.c         | 152 ++++--------
 lib/sbi/sbi_hsm.c          |  59 +++--
 lib/sbi/sbi_init.c         |  59 +++--
 lib/sbi/sbi_ipi.c          |   6 +-
 lib/sbi/sbi_system.c       |  11 +-
 lib/utils/fdt/fdt_fixup.c  |  55 ++---
 18 files changed, 923 insertions(+), 246 deletions(-)
 create mode 100644 docs/domain_support.md
 create mode 100644 include/sbi/sbi_domain.h
 create mode 100644 lib/sbi/sbi_domain.c

-- 
2.25.1


