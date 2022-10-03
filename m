From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 3 Oct 2022 19:52:18 +0800
Subject: [PATCH v2 00/12] Add Andes AE350 fdt driver support
Message-ID: <20221003115230.10127-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We move the devices used by AE350 to fdt driver framework, reuse
existing driver and add timer, ipi and reset drivers.
The OpenSBI domain support is also enabled. As of now, we can use
Kconfig to manage these configurations that can support variants of
Andes platform and SoC like Kendryte K510.

Yu Chien Peter Lin (12):
  platform: andes/ae350: Remove enabling cache from an350_final_init
  platform: andes/ae350: Use kconfig to set platform version and default
    name
  platform: andes/ae350: Use fdt serial driver
  lib: utils/timer: Add Andes fdt timer support
  lib: utils/timer: Add PLMT mmio region to root domain
  lib: utils/reset: Add Andes fdt reset driver support
  platform: andes/ae350: Use fdt irqchip driver
  platform: andes/ae350: Add fw_platform_init for platform
    initialization
  lib: utils/ipi: Add Andes fdt ipi driver support
  lib: utils/ipi: Add PLICSW mmio region to root domain
  platform: andes/ae350: Add AE350 domain support
  docs: andes-ae350.md: Update ae350 documentation for fdt driver
    support

 docs/platform/andes-ae350.md          | 191 +++++++++++++++++++++++++-
 include/sbi_utils/fdt/fdt_helper.h    |   6 +
 include/sbi_utils/ipi/andes_plicsw.h  |  48 +++++++
 include/sbi_utils/timer/andes_plmt.h  |  32 +++++
 lib/utils/fdt/fdt_helper.c            | 113 +++++++++++++++
 lib/utils/ipi/Kconfig                 |   9 ++
 lib/utils/ipi/andes_plicsw.c          |  85 ++++++++++++
 lib/utils/ipi/fdt_ipi_plicsw.c        | 113 +++++++++++++++
 lib/utils/ipi/objects.mk              |   4 +
 lib/utils/reset/Kconfig               |   4 +
 lib/utils/reset/fdt_reset_atcwdt200.c | 122 ++++++++++++++++
 lib/utils/reset/objects.mk            |   3 +
 lib/utils/timer/Kconfig               |   9 ++
 lib/utils/timer/andes_plmt.c          |  54 ++++++++
 lib/utils/timer/fdt_timer_plmt.c      | 107 +++++++++++++++
 lib/utils/timer/objects.mk            |   4 +
 platform/andes/ae350/Kconfig          |  30 +++-
 platform/andes/ae350/objects.mk       |   2 +-
 platform/andes/ae350/platform.c       | 165 ++++++++++------------
 platform/andes/ae350/platform.h       |  17 ---
 platform/andes/ae350/plicsw.c         | 139 -------------------
 platform/andes/ae350/plicsw.h         |  44 ------
 platform/andes/ae350/plmt.c           | 107 ---------------
 platform/andes/ae350/plmt.h           |  17 ---
 24 files changed, 998 insertions(+), 427 deletions(-)
 create mode 100644 include/sbi_utils/ipi/andes_plicsw.h
 create mode 100644 include/sbi_utils/timer/andes_plmt.h
 create mode 100644 lib/utils/ipi/andes_plicsw.c
 create mode 100644 lib/utils/ipi/fdt_ipi_plicsw.c
 create mode 100644 lib/utils/reset/fdt_reset_atcwdt200.c
 create mode 100644 lib/utils/timer/andes_plmt.c
 create mode 100644 lib/utils/timer/fdt_timer_plmt.c
 delete mode 100644 platform/andes/ae350/plicsw.c
 delete mode 100644 platform/andes/ae350/plicsw.h
 delete mode 100644 platform/andes/ae350/plmt.c
 delete mode 100644 platform/andes/ae350/plmt.h

-- 
2.34.1


