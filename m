From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:31 +0530
Subject: [PATCH v2 00/18] Introduce and use simple heap allocator
Message-ID: <20230605113749.230696-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we use global variables instead of explicitly allocating
memory in different parts of OpenSBI. This leads to a bloated BSS
section in the firmware binaries and this will continue to grow as
more drivers (and frameworks) with global variables are added.

To improve memory utilizaiton in OpenSBI:
1) We introduce a simple heap allocator which based on linked list.
   This is a reasonable heap implementation to start with because
   heap allocation and free-up won't be in hot path.
2) Use a combination of heap allocations and scratch space allocations
   to improve the reduce the BSS memory foot-print.

As a by-product, this series also redunces global arrays indexed by hartid
which is preparatory work for the upcoming full sparse hartid support.

These patches can also be found in simple_heap_v2 branch at:
https://github.com/avpatel/opensbi.git

Chagnes since v1:
 - Addressed Drew's comments in PATCH2, PATCH6, PATCH10, PATCH12, and
   PATCH15
 - New PATCH which adds helper macros in sbi_scratch.h to access
   data type from scratch space.

Anup Patel (18):
  include: sbi_scratch: Add helper macros to access data type
  platform: Allow platforms to specify heap size
  lib: sbi: Introduce simple heap allocator
  lib: sbi: Print scratch size and usage at boot time
  lib: sbi_pmu: Use heap for per-HART PMU state
  lib: sbi: Use heap for root domain creation
  lib: sbi: Use scratch space to save per-HART domain pointer
  lib: utils/gpio: Use heap in SiFive and StartFive GPIO drivers
  lib: utils/i2c: Use heap in DesignWare and SiFive I2C drivers
  lib: utils/ipi: Use heap in ACLINT MSWI driver
  lib: utils/irqchip: Use heap in PLIC, APLIC and IMSIC drivers
  lib: utils/timer: Use heap in ACLINT MTIMER driver
  lib: utils/fdt: Use heap in FDT domain parsing
  lib: utils/ipi: Use scratch space to save per-HART MSWI pointer
  lib: utils/timer: Use scratch space to save per-HART MTIMER pointer
  lib: utils/irqchip: Use scratch space to save per-HART PLIC pointer
  lib: utils/irqchip: Don't check hartid in imsic_update_hartid_table()
  lib: utils/irqchip: Use scratch space to save per-HART IMSIC pointer

 firmware/fw_base.S                    |  15 ++
 include/sbi/sbi_domain.h              |   6 +-
 include/sbi/sbi_heap.h                |  44 ++++++
 include/sbi/sbi_platform.h            |  18 ++-
 include/sbi/sbi_scratch.h             |  48 ++++--
 lib/sbi/objects.mk                    |   1 +
 lib/sbi/sbi_domain.c                  |  84 ++++++++--
 lib/sbi/sbi_heap.c                    | 206 ++++++++++++++++++++++++
 lib/sbi/sbi_init.c                    |  20 +++
 lib/sbi/sbi_pmu.c                     | 215 +++++++++++++++-----------
 lib/sbi/sbi_scratch.c                 |  11 ++
 lib/utils/fdt/fdt_domain.c            | 113 +++++++++-----
 lib/utils/gpio/fdt_gpio_sifive.c      |  21 ++-
 lib/utils/gpio/fdt_gpio_starfive.c    |  20 +--
 lib/utils/i2c/fdt_i2c_dw.c            |  24 ++-
 lib/utils/i2c/fdt_i2c_sifive.c        |  23 ++-
 lib/utils/ipi/aclint_mswi.c           |  43 ++++--
 lib/utils/ipi/fdt_ipi_mswi.c          |  21 ++-
 lib/utils/irqchip/fdt_irqchip_aplic.c |  24 +--
 lib/utils/irqchip/fdt_irqchip_imsic.c |  35 ++---
 lib/utils/irqchip/fdt_irqchip_plic.c  | 118 +++++++++-----
 lib/utils/irqchip/imsic.c             |  76 +++++++--
 lib/utils/timer/aclint_mtimer.c       |  76 +++++++--
 lib/utils/timer/fdt_timer_mtimer.c    |  47 ++++--
 platform/fpga/ariane/platform.c       |   1 +
 platform/fpga/openpiton/platform.c    |   2 +
 platform/generic/platform.c           |   3 +-
 platform/kendryte/k210/platform.c     |   2 +
 platform/nuclei/ux600/platform.c      |   2 +
 platform/template/platform.c          |   1 +
 30 files changed, 971 insertions(+), 349 deletions(-)
 create mode 100644 include/sbi/sbi_heap.h
 create mode 100644 lib/sbi/sbi_heap.c

-- 
2.34.1


