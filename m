From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 22 Apr 2021 16:50:16 +0530
Subject: [PATCH 0/7] Simplify platform operations
Message-ID: <20210422112023.670521-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we have lot of operations to be provided by a platform
support because we have quite a few platform operations meant for
runtime functionality such as write a character to console, send
IPI, start timer event, reset the system, start/stop HART, etc.

This series aims at simplifying the platform operations such that
platform operation will mostly have initialization functions and
runtime functionality will be registered by platform support (or
drivers) as a abstract device to the generic OpenSBI library.

These patches can be found in plat_callback_imp_v1 branch at
https://github.com/avpatel/opensbi

Anup Patel (7):
  lib: sbi: Remove domains_root_regions() platform callback
  lib: sbi: Simplify console platform operations
  lib: sbi: Simplify timer platform operations
  lib: sbi: Simplify ipi platform operations
  lib: sbi: Simplify system reset platform operations
  lib: sbi: Simplify HSM platform operations
  lib: sbi: Show devices provided by platform in boot prints

 include/sbi/sbi_console.h                    |  15 ++
 include/sbi/sbi_hsm.h                        |  31 +++
 include/sbi/sbi_ipi.h                        |  18 ++
 include/sbi/sbi_platform.h                   | 256 +------------------
 include/sbi/sbi_system.h                     |  16 ++
 include/sbi/sbi_timer.h                      |  21 ++
 include/sbi_utils/ipi/fdt_ipi.h              |   6 -
 include/sbi_utils/reset/fdt_reset.h          |   6 -
 include/sbi_utils/serial/fdt_serial.h        |   6 -
 include/sbi_utils/serial/shakti-uart.h       |   4 -
 include/sbi_utils/serial/sifive-uart.h       |   4 -
 include/sbi_utils/serial/uart8250.h          |   4 -
 include/sbi_utils/sys/clint.h                |  10 -
 include/sbi_utils/sys/htif.h                 |   8 +-
 include/sbi_utils/sys/sifive_test.h          |   4 -
 include/sbi_utils/timer/fdt_timer.h          |   9 -
 lib/sbi/sbi_console.c                        |  31 ++-
 lib/sbi/sbi_domain.c                         |   6 -
 lib/sbi/sbi_hsm.c                            |  70 ++++-
 lib/sbi/sbi_init.c                           |  24 +-
 lib/sbi/sbi_ipi.c                            |  32 ++-
 lib/sbi/sbi_platform.c                       |   9 -
 lib/sbi/sbi_system.c                         |  25 +-
 lib/sbi/sbi_timer.c                          |  55 ++--
 lib/utils/ipi/fdt_ipi.c                      |  20 --
 lib/utils/ipi/fdt_ipi_clint.c                |   2 -
 lib/utils/reset/fdt_reset.c                  |  14 -
 lib/utils/reset/fdt_reset_htif.c             |   9 +-
 lib/utils/reset/fdt_reset_sifive.c           |   2 -
 lib/utils/reset/fdt_reset_thead.c            |  34 ++-
 lib/utils/serial/fdt_serial.c                |  21 --
 lib/utils/serial/fdt_serial_htif.c           |  10 +-
 lib/utils/serial/fdt_serial_shakti.c         |   4 +-
 lib/utils/serial/fdt_serial_sifive.c         |   4 +-
 lib/utils/serial/fdt_serial_uart8250.c       |   2 -
 lib/utils/serial/shakti-uart.c               |  12 +-
 lib/utils/serial/sifive-uart.c               |  12 +-
 lib/utils/serial/uart8250.c                  |  13 +-
 lib/utils/sys/clint.c                        |  42 ++-
 lib/utils/sys/htif.c                         |  38 ++-
 lib/utils/sys/sifive_test.c                  |  12 +-
 lib/utils/timer/fdt_timer.c                  |  31 ---
 lib/utils/timer/fdt_timer_clint.c            |   3 -
 platform/andes/ae350/platform.c              |  16 +-
 platform/andes/ae350/plmt.c                  |  16 +-
 platform/andes/ae350/plmt.h                  |   6 -
 platform/fpga/ariane/platform.c              |   7 -
 platform/fpga/openpiton/platform.c           |   7 -
 platform/generic/include/platform_override.h |   4 -
 platform/generic/platform.c                  |  29 ---
 platform/kendryte/k210/platform.c            |  61 +++--
 platform/nuclei/ux600/platform.c             |  45 ++--
 platform/sifive/fu540/platform.c             |   7 -
 platform/template/platform.c                 |  88 +------
 platform/thead/c910/platform.c               |  62 +++--
 platform/thead/c910/platform.h               |   3 +-
 56 files changed, 550 insertions(+), 756 deletions(-)

-- 
2.25.1


