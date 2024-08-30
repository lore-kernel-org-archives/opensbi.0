From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:04 -0700
Subject: [PATCH 00/12] OpenSBI Hart Index Optimizations
Message-ID: <20240830154929.3971790-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series converts more of OpenSBI to use hart indexes instead of
hartids, which minimizes the number of calls to the somewhat expensive
sbi_hartid_to_hartindex() function. This reduces both static code size
(728 bytes for a generic firmware with GCC 13.3) and the dynamic number
of hart index lookups. A quick test in QEMU shows 98% fewer calls to
sbi_hartid_to_hartindex() during the Linux kernel boot process. (Tested
by printing the number of calls in sbi_system_reset() and booting Linux
with the command line "rdinit=/bin/busybox -- reboot -f". Calls reduced
from about 39000 to about 800.)


Samuel Holland (12):
  lib: sbi_init: Remove obsolete hartid check
  include: sbi: Store the hart index in struct sbi_scratch
  lib: sbi: Use current_hartindex() where possible
  lib: sbi_sse: Cache the event's target hart index
  lib: utils/irqchip: Look up IMSIC data by hart index
  lib: sbi_ecall_legacy: Use SBI v0.2 encoding for "all harts"
  lib: sbi: Simplify halt broadcast logic
  lib: sbi: Update __sbi_hsm_hart_get_state() to take a hart index
  lib: sbi: Use sbi_hartmask in sbi_hsm_hart_interruptible_mask()
  lib: sbi: Update sbi_domain_is_assigned_hart() to take a hart index
  lib: sbi: Update sbi_{entry,init}_count() to take a hart index
  lib: sbi: Remove unused hartid parameters

 firmware/fw_base.S                |  2 +
 include/sbi/sbi_domain.h          | 17 ++++----
 include/sbi/sbi_domain_context.h  |  7 ++--
 include/sbi/sbi_hsm.h             |  7 ++--
 include/sbi/sbi_init.h            |  4 +-
 include/sbi/sbi_scratch.h         | 10 ++++-
 include/sbi_utils/irqchip/imsic.h |  4 +-
 lib/sbi/sbi_dbtr.c                |  3 +-
 lib/sbi/sbi_domain.c              | 19 +++++----
 lib/sbi/sbi_domain_context.c      |  6 +--
 lib/sbi/sbi_ecall_legacy.c        | 25 ++++++------
 lib/sbi/sbi_hsm.c                 | 64 +++++++++++++++----------------
 lib/sbi/sbi_init.c                | 30 +++++----------
 lib/sbi/sbi_ipi.c                 | 44 +++++++++++----------
 lib/sbi/sbi_sse.c                 | 10 +++--
 lib/sbi/sbi_system.c              | 20 +++-------
 lib/utils/fdt/fdt_fixup.c         |  5 ++-
 lib/utils/irqchip/imsic.c         | 10 ++---
 platform/generic/andes/ae350.c    |  6 ++-
 19 files changed, 143 insertions(+), 150 deletions(-)

-- 
2.45.1


