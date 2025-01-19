From: Samuel Holland <samuel.holland@sifive.com>
Date: Sun, 19 Jan 2025 11:03:54 -0800
Subject: [PATCH 0/3] Finish fdt_driver conversion
Message-ID: <20250119190435.3603452-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series completes the fdt_driver conversion by switching over the
last subsystem (irqchip) and removing the old fdt_find_match() function.
An additional optimization is to minimize the number of passes through
the devicetree blob by sharing the driver array between subsystems where
possible.


Samuel Holland (3):
  lib: utils/irqchip: Use fdt_driver for initialization
  lib: utils/fdt: Remove fdt_find_match()
  lib: utils: Initialize miscellaneous drivers in one pass

 include/sbi_utils/cppc/fdt_cppc.h            | 26 ----------------
 include/sbi_utils/fdt/fdt_driver.h           |  3 ++
 include/sbi_utils/fdt/fdt_helper.h           |  4 ---
 include/sbi_utils/hsm/fdt_hsm.h              | 26 ----------------
 include/sbi_utils/irqchip/fdt_irqchip.h      |  6 +---
 include/sbi_utils/reset/fdt_reset.h          | 31 --------------------
 include/sbi_utils/suspend/fdt_suspend.h      | 26 ----------------
 lib/utils/cppc/fdt_cppc.c                    | 22 --------------
 lib/utils/cppc/fdt_cppc_drivers.carray       |  3 --
 lib/utils/cppc/fdt_cppc_rpmi.c               |  2 +-
 lib/utils/cppc/objects.mk                    |  5 +---
 lib/utils/fdt/fdt_early_drivers.carray       |  3 ++
 lib/utils/fdt/fdt_helper.c                   | 23 ---------------
 lib/utils/fdt/objects.mk                     |  2 ++
 lib/utils/hsm/fdt_hsm.c                      | 22 --------------
 lib/utils/hsm/fdt_hsm_drivers.carray         |  3 --
 lib/utils/hsm/fdt_hsm_rpmi.c                 |  4 +--
 lib/utils/hsm/objects.mk                     |  5 +---
 lib/utils/irqchip/fdt_irqchip.c              | 31 ++------------------
 lib/utils/irqchip/fdt_irqchip_aplic.c        |  4 +--
 lib/utils/irqchip/fdt_irqchip_drivers.carray |  2 +-
 lib/utils/irqchip/fdt_irqchip_imsic.c        |  4 +--
 lib/utils/irqchip/fdt_irqchip_plic.c         |  4 +--
 lib/utils/reset/fdt_reset.c                  | 18 ------------
 lib/utils/reset/fdt_reset_atcwdt200.c        |  2 +-
 lib/utils/reset/fdt_reset_drivers.carray     |  3 --
 lib/utils/reset/fdt_reset_gpio.c             |  2 +-
 lib/utils/reset/fdt_reset_htif.c             |  2 +-
 lib/utils/reset/fdt_reset_rpmi.c             |  2 +-
 lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c |  2 +-
 lib/utils/reset/fdt_reset_sunxi_wdt.c        |  2 +-
 lib/utils/reset/fdt_reset_syscon.c           |  2 +-
 lib/utils/reset/objects.mk                   | 21 ++++++-------
 lib/utils/suspend/fdt_suspend.c              | 22 --------------
 lib/utils/suspend/fdt_suspend_drivers.carray |  3 --
 lib/utils/suspend/fdt_suspend_rpmi.c         |  2 +-
 lib/utils/suspend/objects.mk                 |  5 +---
 platform/generic/platform.c                  | 16 ++++------
 platform/generic/sifive/fu740.c              |  4 +--
 platform/generic/starfive/jh7110.c           |  2 +-
 40 files changed, 49 insertions(+), 322 deletions(-)
 delete mode 100644 include/sbi_utils/cppc/fdt_cppc.h
 delete mode 100644 include/sbi_utils/hsm/fdt_hsm.h
 delete mode 100644 include/sbi_utils/reset/fdt_reset.h
 delete mode 100644 include/sbi_utils/suspend/fdt_suspend.h
 delete mode 100644 lib/utils/cppc/fdt_cppc.c
 delete mode 100644 lib/utils/cppc/fdt_cppc_drivers.carray
 create mode 100644 lib/utils/fdt/fdt_early_drivers.carray
 delete mode 100644 lib/utils/hsm/fdt_hsm.c
 delete mode 100644 lib/utils/hsm/fdt_hsm_drivers.carray
 delete mode 100644 lib/utils/reset/fdt_reset.c
 delete mode 100644 lib/utils/reset/fdt_reset_drivers.carray
 delete mode 100644 lib/utils/suspend/fdt_suspend.c
 delete mode 100644 lib/utils/suspend/fdt_suspend_drivers.carray

-- 
2.47.0


