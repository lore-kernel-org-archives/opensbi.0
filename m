From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jul 2023 14:12:17 +0530
Subject: [PATCH 0/6] Syscon reboot and poweroff drivers
In-Reply-To: <20230721171010.2572232-1-apatel@ventanamicro.com>
References: <20230721171010.2572232-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2j2kWzbFxD9njo__gKyeVn+rxyWPyhM76oTfXeP5n0qg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023 at 10:40?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds syscon reboot and poweroff drivers which replaces the
> SiFive Test reset driver. These new drivers need a lightweight or simple
> regmap framework which is also added by this series.
>
> These patches can also be found in the syscon_reboot_v1 branch at:
> https://github.com/avpatel/opensbi.git
>
> Anup Patel (6):
>   include: sbi_utils: Remove driver pointer from struct i2c_adapter
>   lib: utils/regmap: Add generic regmap access library
>   lib: utils/regmap: Add simple FDT based regmap framework
>   lib: utils/regmap: Add simple FDT based syscon regmap driver
>   lib: utils/reset: Add syscon based reboot and poweroff
>   lib: utils/reset: Remove SiFive Test reset driver

Applied this series to the riscv/opensbi repo.

Regards,
Anup

>
>  include/sbi_utils/i2c/i2c.h                |   3 -
>  include/sbi_utils/regmap/fdt_regmap.h      |  31 +++
>  include/sbi_utils/regmap/regmap.h          |  67 ++++++
>  include/sbi_utils/sys/sifive_test.h        |  17 --
>  lib/utils/Kconfig                          |   2 +
>  lib/utils/i2c/fdt_i2c_dw.c                 |   3 -
>  lib/utils/i2c/fdt_i2c_sifive.c             |   3 -
>  lib/utils/regmap/Kconfig                   |  22 ++
>  lib/utils/regmap/fdt_regmap.c              |  94 ++++++++
>  lib/utils/regmap/fdt_regmap_drivers.carray |   3 +
>  lib/utils/regmap/fdt_regmap_syscon.c       | 262 +++++++++++++++++++++
>  lib/utils/regmap/objects.mk                |  16 ++
>  lib/utils/regmap/regmap.c                  | 114 +++++++++
>  lib/utils/reset/Kconfig                    |  10 +-
>  lib/utils/reset/fdt_reset_sifive_test.c    |  36 ---
>  lib/utils/reset/fdt_reset_syscon.c         | 167 +++++++++++++
>  lib/utils/reset/objects.mk                 |   7 +-
>  lib/utils/sys/Kconfig                      |   4 -
>  lib/utils/sys/objects.mk                   |   1 -
>  lib/utils/sys/sifive_test.c                |  65 -----
>  platform/generic/configs/defconfig         |   6 +-
>  21 files changed, 791 insertions(+), 142 deletions(-)
>  create mode 100644 include/sbi_utils/regmap/fdt_regmap.h
>  create mode 100644 include/sbi_utils/regmap/regmap.h
>  delete mode 100644 include/sbi_utils/sys/sifive_test.h
>  create mode 100644 lib/utils/regmap/Kconfig
>  create mode 100644 lib/utils/regmap/fdt_regmap.c
>  create mode 100644 lib/utils/regmap/fdt_regmap_drivers.carray
>  create mode 100644 lib/utils/regmap/fdt_regmap_syscon.c
>  create mode 100644 lib/utils/regmap/objects.mk
>  create mode 100644 lib/utils/regmap/regmap.c
>  delete mode 100644 lib/utils/reset/fdt_reset_sifive_test.c
>  create mode 100644 lib/utils/reset/fdt_reset_syscon.c
>  delete mode 100644 lib/utils/sys/sifive_test.c
>
> --
> 2.34.1
>

