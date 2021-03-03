From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  3 Mar 2021 17:25:01 +0530
Subject: [PATCH v3 00/11] SBI HSM suspend implementation
Message-ID: <20210303115512.470786-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends OpenSBI HSM implemenation to include HSM suspend
function.

These patches can be found in hsm_suspend_v3 branch at
https://github.com/avpatel/opensbi

The proposed SBI HSM suspend definition can be found in hsm_suspend_v3
branch at https://github.com/avpatel/riscv-sbi-doc

Changes since v2:
 - Addressed Atish's comments in PATCH9

Changes since v1:
 - Addressed Atish's comments in PATCH4 and PATCH7
 - Added new PATCH5 to fix error codes returned by HSM start()/stop()

Anup Patel (11):
  include: sbi: Simplify HSM state define names
  lib: sbi: Use SBI_HSM_STATE_xyz defines instead of SBI_STATE_xyz
    defines
  lib: sbi: Rename sbi_hsm_hart_started_mask() function
  lib: sbi: Remove redundant sbi_hsm_hart_started() function
  lib: sbi: Fix error codes returned by HSM start() and stop() functions
  include: sbi: Add HSM suspend related defines
  lib: sbi: Add sbi_hart_reinit() function
  include: sbi: Add hart_suspend() platform callback
  lib: sbi: Implement SBI HSM suspend function
  include: sbi: Upgrade SBI implementation version to v0.3
  lib: Remove redundant sbi_platform_ipi_clear() calls

 include/sbi/sbi_ecall.h           |   2 +-
 include/sbi/sbi_ecall_interface.h |  27 ++-
 include/sbi/sbi_hart.h            |   1 +
 include/sbi/sbi_hsm.h             |  16 +-
 include/sbi/sbi_platform.h        |  30 ++++
 lib/sbi/sbi_ecall_hsm.c           |  16 +-
 lib/sbi/sbi_ecall_legacy.c        |   4 +-
 lib/sbi/sbi_hart.c                |  29 +--
 lib/sbi/sbi_hsm.c                 | 282 +++++++++++++++++++++++-------
 lib/sbi/sbi_init.c                |  49 +++++-
 lib/sbi/sbi_ipi.c                 |   9 +-
 lib/sbi/sbi_system.c              |   2 +-
 12 files changed, 358 insertions(+), 109 deletions(-)

-- 
2.25.1


