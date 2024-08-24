From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 13:04:16 +0530
Subject: [PATCH 00/16] Improve FDT blob lifecycle self-documentation
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1Yap8J9iz2VZxqg4v6MV0ET3D0yjv9HfxtwLzbNeOOuQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024 at 10:29?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This series improves the documentation of the FDT blob lifecycle within
> the OpenSBI code by more explicitly indicating which functions and
> platform callbacks may modify the FDT blob, and by avoiding ad-hoc calls
> to fdt_get_address() outside the top-level platform callbacks.
>
>
> Samuel Holland (16):
>   lib: utils/fdt: Fix fdt_add_cpu_idle_states() prototype
>   lib: utils/regmap: Fix typo in comment
>   lib: utils/fdt: Constify FDT parsing functions
>   lib: utils/gpio: Constify FDT pointers in parsing functions
>   lib: utils/i2c: Constify FDT pointers in parsing functions
>   lib: utils/ipi: Constify FDT pointers in parsing functions
>   lib: utils/irqchip: Constify FDT pointers in parsing functions
>   lib: utils/regmap: Constify FDT pointers in parsing functions
>   lib: utils/reset: Constify FDT pointers in parsing functions
>   lib: utils/serial: Constify FDT pointers in parsing functions
>   lib: utils/timer: Constify FDT pointers in parsing functions
>   platform: generic: Constify FDT pointers in fw_platform_init()
>   platform: generic: Pass FDT to early/final_init overrides
>   lib: utils/reset: Pass the FDT to fdt_reset_init()
>   lib: utils/serial: Pass the FDT to fdt_serial_init()
>   lib: utils/fdt: Add fdt_get_address_rw() helper

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi_utils/fdt/fdt_domain.h           |  4 +-
>  include/sbi_utils/fdt/fdt_fixup.h            |  2 +-
>  include/sbi_utils/fdt/fdt_helper.h           | 61 ++++++++++---------
>  include/sbi_utils/fdt/fdt_pmu.h              |  4 +-
>  include/sbi_utils/gpio/fdt_gpio.h            |  4 +-
>  include/sbi_utils/i2c/fdt_i2c.h              |  4 +-
>  include/sbi_utils/ipi/fdt_ipi.h              |  2 +-
>  include/sbi_utils/irqchip/fdt_irqchip.h      |  2 +-
>  include/sbi_utils/regmap/fdt_regmap.h        |  8 +--
>  include/sbi_utils/reset/fdt_reset.h          | 10 ++--
>  include/sbi_utils/serial/fdt_serial.h        |  6 +-
>  include/sbi_utils/timer/fdt_timer.h          |  2 +-
>  lib/utils/fdt/fdt_domain.c                   | 31 +++++++---
>  lib/utils/fdt/fdt_helper.c                   | 62 ++++++++++----------
>  lib/utils/fdt/fdt_pmu.c                      |  2 +-
>  lib/utils/gpio/fdt_gpio.c                    |  6 +-
>  lib/utils/gpio/fdt_gpio_designware.c         |  2 +-
>  lib/utils/gpio/fdt_gpio_sifive.c             |  2 +-
>  lib/utils/gpio/fdt_gpio_starfive.c           |  2 +-
>  lib/utils/i2c/fdt_i2c.c                      |  6 +-
>  lib/utils/i2c/fdt_i2c_dw.c                   |  4 +-
>  lib/utils/i2c/fdt_i2c_sifive.c               |  4 +-
>  lib/utils/ipi/fdt_ipi.c                      |  2 +-
>  lib/utils/ipi/fdt_ipi_mswi.c                 |  2 +-
>  lib/utils/ipi/fdt_ipi_plicsw.c               |  4 +-
>  lib/utils/irqchip/fdt_irqchip.c              |  2 +-
>  lib/utils/irqchip/fdt_irqchip_aplic.c        |  4 +-
>  lib/utils/irqchip/fdt_irqchip_imsic.c        |  6 +-
>  lib/utils/irqchip/fdt_irqchip_plic.c         |  4 +-
>  lib/utils/regmap/fdt_regmap.c                |  8 +--
>  lib/utils/regmap/fdt_regmap_syscon.c         |  2 +-
>  lib/utils/reset/fdt_reset.c                  |  5 +-
>  lib/utils/reset/fdt_reset_atcwdt200.c        |  2 +-
>  lib/utils/reset/fdt_reset_gpio.c             |  2 +-
>  lib/utils/reset/fdt_reset_htif.c             |  2 +-
>  lib/utils/reset/fdt_reset_sg2042_hwmon_mcu.c |  2 +-
>  lib/utils/reset/fdt_reset_sunxi_wdt.c        |  2 +-
>  lib/utils/reset/fdt_reset_syscon.c           |  4 +-
>  lib/utils/serial/fdt_serial.c                |  3 +-
>  lib/utils/serial/fdt_serial_cadence.c        |  2 +-
>  lib/utils/serial/fdt_serial_gaisler.c        |  2 +-
>  lib/utils/serial/fdt_serial_htif.c           |  2 +-
>  lib/utils/serial/fdt_serial_litex.c          |  2 +-
>  lib/utils/serial/fdt_serial_renesas_scif.c   |  2 +-
>  lib/utils/serial/fdt_serial_shakti.c         |  4 +-
>  lib/utils/serial/fdt_serial_sifive.c         |  4 +-
>  lib/utils/serial/fdt_serial_uart8250.c       |  2 +-
>  lib/utils/serial/fdt_serial_xlnx_uartlite.c  |  4 +-
>  lib/utils/timer/fdt_timer.c                  |  2 +-
>  lib/utils/timer/fdt_timer_mtimer.c           |  2 +-
>  lib/utils/timer/fdt_timer_plmt.c             |  2 +-
>  platform/fpga/ariane/platform.c              |  2 +-
>  platform/fpga/openpiton/platform.c           |  4 +-
>  platform/generic/allwinner/sun20i-d1.c       |  3 +-
>  platform/generic/andes/ae350.c               | 10 ++--
>  platform/generic/andes/andes_pma.c           |  6 +-
>  platform/generic/include/andes/andes_pma.h   |  3 +-
>  platform/generic/include/platform_override.h |  6 +-
>  platform/generic/platform.c                  | 21 ++++---
>  platform/generic/renesas/rzfive/rzfive.c     |  8 ++-
>  platform/generic/sifive/fu740.c              |  5 +-
>  platform/generic/sophgo/sg2042.c             |  2 +-
>  platform/generic/starfive/jh7110.c           | 12 ++--
>  platform/generic/thead/thead-generic.c       |  2 +-
>  platform/kendryte/k210/platform.c            |  2 +-
>  platform/nuclei/ux600/platform.c             |  2 +-
>  66 files changed, 210 insertions(+), 194 deletions(-)
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

