From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Nov 2024 18:10:17 +0530
Subject: [PATCH v2 00/11] Deduplicate driver initialization code
In-Reply-To: <20241111220304.1228821-1-samuel.holland@sifive.com>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0uZpd5LXfPhswM3k7OfsN=gOna5zCbNqM=ed5yfsaq6Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 12, 2024 at 3:33?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Upstreaming support for some of SiFive's security and power management
> features will require adding some new driver subsystems (e.g. caches,
> WorldGuard gadgets, power management domains, etc.). To avoid copy-and-
> pasting the FDT-based driver matching code to each new subsystem, this
> series refactors it into some efficient and easily-reusable helper
> functions.
>
> Version 2 of this series converts everything but the irqchip subsystem
> to use the new helpers. Once the irqchip subsystem is converted, the old
> fdt_find_match() helper can be removed. The following series prepares
> the irqchip subsystem for conversion to use the fdt_driver helpers:
> http://lists.infradead.org/pipermail/opensbi/2024-November/007555.html
>
> Changes in v2:
>  - Shell script cleanup in carray.sh
>  - Update carray.sh to support embedding struct fdt_driver
>  - Add conversion of gpio drivers
>  - Add conversion of ipi drivers
>  - Add conversion of regmap drivers
>  - Add conversion of timer drivers
>
> Samuel Holland (11):
>   treewide: Make carray arrays const and NULL-terminated
>   lib: utils/fdt: Add helpers for generic driver initialization
>   scripts/carray.sh: Avoid useless use of cat
>   scripts/carray.sh: Allow referencing a struct member
>   lib: utils/gpio: Use fdt_driver for initialization
>   lib: utils/i2c: Use fdt_driver for initialization
>   lib: utils/ipi: Use fdt_driver for initialization
>   lib: utils/regmap: Use fdt_driver for initialization
>   lib: utils/reset: Use fdt_driver for initialization
>   lib: utils/serial: Use fdt_driver for initialization
>   lib: utils/timer: Use fdt_driver for initialization

Very nice improvements !
Great work !

Applied this series to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi_utils/fdt/fdt_driver.h           | 59 +++++++++++++++
>  include/sbi_utils/gpio/fdt_gpio.h            |  5 +-
>  include/sbi_utils/gpio/gpio.h                |  2 +-
>  include/sbi_utils/i2c/fdt_i2c.h              |  8 +-
>  include/sbi_utils/ipi/fdt_ipi.h              |  6 +-
>  include/sbi_utils/regmap/fdt_regmap.h        |  8 +-
>  include/sbi_utils/reset/fdt_reset.h          | 15 +---
>  include/sbi_utils/serial/fdt_serial.h        |  6 +-
>  include/sbi_utils/timer/fdt_timer.h          |  6 +-
>  lib/sbi/sbi_ecall.c                          |  5 +-
>  lib/sbi/tests/sbi_unit_test.c                |  5 +-
>  lib/utils/fdt/fdt_driver.c                   | 80 ++++++++++++++++++++
>  lib/utils/fdt/objects.mk                     |  1 +
>  lib/utils/gpio/fdt_gpio.c                    | 28 +------
>  lib/utils/gpio/fdt_gpio_designware.c         | 10 ++-
>  lib/utils/gpio/fdt_gpio_drivers.carray       |  4 +-
>  lib/utils/gpio/fdt_gpio_sifive.c             | 10 ++-
>  lib/utils/gpio/fdt_gpio_starfive.c           | 10 ++-
>  lib/utils/i2c/fdt_i2c.c                      | 31 +-------
>  lib/utils/i2c/fdt_i2c_adapter_drivers.carray |  2 +-
>  lib/utils/i2c/fdt_i2c_dw.c                   |  2 +-
>  lib/utils/i2c/fdt_i2c_sifive.c               |  2 +-
>  lib/utils/ipi/fdt_ipi.c                      | 43 +----------
>  lib/utils/ipi/fdt_ipi_drivers.carray         |  2 +-
>  lib/utils/ipi/fdt_ipi_mswi.c                 |  4 +-
>  lib/utils/ipi/fdt_ipi_plicsw.c               |  4 +-
>  lib/utils/irqchip/fdt_irqchip.c              |  5 +-
>  lib/utils/regmap/fdt_regmap.c                | 29 +------
>  lib/utils/regmap/fdt_regmap_drivers.carray   |  2 +-
>  lib/utils/regmap/fdt_regmap_syscon.c         |  2 +-
>  lib/utils/reset/fdt_reset.c                  | 37 +--------
>  lib/utils/reset/fdt_reset_atcwdt200.c        |  2 +-
>  lib/utils/reset/fdt_reset_drivers.carray     |  2 +-
>  lib/utils/reset/fdt_reset_gpio.c             |  4 +-
>  lib/utils/reset/fdt_reset_htif.c             |  2 +-
>  lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c |  2 +-
>  lib/utils/reset/fdt_reset_sunxi_wdt.c        |  2 +-
>  lib/utils/reset/fdt_reset_syscon.c           |  4 +-
>  lib/utils/serial/fdt_serial.c                | 53 ++-----------
>  lib/utils/serial/fdt_serial_cadence.c        |  2 +-
>  lib/utils/serial/fdt_serial_drivers.carray   |  2 +-
>  lib/utils/serial/fdt_serial_gaisler.c        |  2 +-
>  lib/utils/serial/fdt_serial_htif.c           |  2 +-
>  lib/utils/serial/fdt_serial_litex.c          |  2 +-
>  lib/utils/serial/fdt_serial_renesas_scif.c   |  2 +-
>  lib/utils/serial/fdt_serial_shakti.c         |  2 +-
>  lib/utils/serial/fdt_serial_sifive.c         |  2 +-
>  lib/utils/serial/fdt_serial_uart8250.c       |  2 +-
>  lib/utils/serial/fdt_serial_xlnx_uartlite.c  |  2 +-
>  lib/utils/timer/fdt_timer.c                  | 40 +---------
>  lib/utils/timer/fdt_timer_drivers.carray     |  2 +-
>  lib/utils/timer/fdt_timer_mtimer.c           |  4 +-
>  lib/utils/timer/fdt_timer_plmt.c             |  4 +-
>  platform/generic/platform.c                  |  5 +-
>  platform/generic/sifive/fu740.c              |  9 ++-
>  platform/generic/starfive/jh7110.c           |  9 ++-
>  scripts/carray.sh                            | 22 ++++--
>  57 files changed, 267 insertions(+), 352 deletions(-)
>  create mode 100644 include/sbi_utils/fdt/fdt_driver.h
>  create mode 100644 lib/utils/fdt/fdt_driver.c
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

