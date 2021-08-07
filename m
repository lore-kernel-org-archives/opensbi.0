From: Anup Patel <anup.patel@wdc.com>
Date: Sat,  7 Aug 2021 19:03:17 +0530
Subject: [PATCH v2 0/5] ACLINT MTIMER improvements
Message-ID: <20210807133322.545675-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To support more flexibility in ACLINT MTIMER implementation, the ACLINT
specification now allows separate base address of MTIME and MTIMECMP
registers so that multiple MTIMER devices can share the same physical
MTIME register.

This series extends ACLINT support in OpenSBI to incorporate above changes
in ACLINT MTIMER definition. It can be found in the riscv_aclint_imp_v2
branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Simplified defines in PATCH1
 - Renamed parameter of fdt_get_node_addr_size() in PATCH2
 - Rebased patch series on latest OpenSBI master

Anup Patel (5):
  lib: utils/timer: Allow separate base addresses for MTIME and MTIMECMP
  lib: utils: Extend fdt_get_node_addr_size() for multiple register sets
  lib: utils/fdt: Extend fdt_parse_aclint_node() function
  lib: utils/timer: Allow ACLINT MTIMER supporting only 32-bit MMIO
  lib: utils/timer: Simplify MTIMER synchronization

 include/sbi_utils/fdt/fdt_helper.h      |   7 +-
 include/sbi_utils/timer/aclint_mtimer.h |  23 +++-
 lib/utils/fdt/fdt_helper.c              |  81 +++++++++-----
 lib/utils/gpio/fdt_gpio_sifive.c        |   2 +-
 lib/utils/ipi/fdt_ipi_mswi.c            |   3 +-
 lib/utils/reset/fdt_reset_sifive_test.c |   2 +-
 lib/utils/timer/aclint_mtimer.c         | 141 ++++++++++++++++--------
 lib/utils/timer/fdt_timer_mtimer.c      |  67 +++++++++--
 platform/fpga/ariane/platform.c         |   8 +-
 platform/fpga/openpiton/platform.c      |  13 ++-
 platform/kendryte/k210/platform.c       |   8 +-
 platform/nuclei/ux600/platform.c        |   8 +-
 platform/template/platform.c            |   8 +-
 13 files changed, 264 insertions(+), 107 deletions(-)

-- 
2.25.1


