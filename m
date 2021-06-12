From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 12 Jun 2021 21:33:15 +0530
Subject: [PATCH 0/6] RISC-V ACLINT Support
Message-ID: <20210612160321.330638-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
over the SiFive CLINT but also maintains backward compatibility with
the SiFive CLINT.

Latest RISC-V ACLINT specification (will be frozen in a month) can be
found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series adds RISC-V ACLINT support to OpenSBI and can be found in
the riscv_aclint_v1 branch at:
https://github.com/avpatel/qemu.git

To test series, we require QEMU and Linux with ACLINT support which
can be found in riscv_aclint_v1 branch at:
https://github.com/avpatel/qemu.git
https://github.com/avpatel/linux.git

Anup Patel (6):
  lib: utils/timer: Add ACLINT MTIMER library
  lib: utils/ipi: Add ACLINT MSWI library
  lib: utils: Add FDT parsing API common for both ACLINT and CLINT
  lib: utils/ipi: Add FDT based ACLINT MSWI IPI driver
  lib: utils/timer: Add FDT based ACLINT MTIMER driver
  platform: Replace CLINT library usage with ACLINT library

 include/sbi_utils/fdt/fdt_helper.h      |   7 +-
 include/sbi_utils/ipi/aclint_mswi.h     |  33 +++
 include/sbi_utils/sys/clint.h           |  41 ----
 include/sbi_utils/timer/aclint_mtimer.h |  41 ++++
 lib/utils/fdt/fdt_helper.c              |  31 ++-
 lib/utils/ipi/aclint_mswi.c             | 100 +++++++++
 lib/utils/ipi/fdt_ipi.c                 |   4 +-
 lib/utils/ipi/fdt_ipi_clint.c           |  48 -----
 lib/utils/ipi/fdt_ipi_mswi.c            |  67 +++++++
 lib/utils/ipi/objects.mk                |   3 +-
 lib/utils/sys/clint.c                   | 256 ------------------------
 lib/utils/sys/objects.mk                |   1 -
 lib/utils/timer/aclint_mtimer.c         | 180 +++++++++++++++++
 lib/utils/timer/fdt_timer.c             |   4 +-
 lib/utils/timer/fdt_timer_clint.c       |  50 -----
 lib/utils/timer/fdt_timer_mtimer.c      |  74 +++++++
 lib/utils/timer/objects.mk              |   3 +-
 platform/fpga/ariane/platform.c         |  26 ++-
 platform/fpga/openpiton/platform.c      |  32 ++-
 platform/kendryte/k210/platform.c       |  23 ++-
 platform/kendryte/k210/platform.h       |   3 +
 platform/nuclei/ux600/platform.c        |  27 ++-
 platform/template/platform.c            |  30 ++-
 23 files changed, 623 insertions(+), 461 deletions(-)
 create mode 100644 include/sbi_utils/ipi/aclint_mswi.h
 delete mode 100644 include/sbi_utils/sys/clint.h
 create mode 100644 include/sbi_utils/timer/aclint_mtimer.h
 create mode 100644 lib/utils/ipi/aclint_mswi.c
 delete mode 100644 lib/utils/ipi/fdt_ipi_clint.c
 create mode 100644 lib/utils/ipi/fdt_ipi_mswi.c
 delete mode 100644 lib/utils/sys/clint.c
 create mode 100644 lib/utils/timer/aclint_mtimer.c
 delete mode 100644 lib/utils/timer/fdt_timer_clint.c
 create mode 100644 lib/utils/timer/fdt_timer_mtimer.c

-- 
2.25.1


