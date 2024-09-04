From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue,  3 Sep 2024 19:09:36 -0700
Subject: [PATCH 0/3] Unify driver cold init function prototypes
Message-ID: <20240904021006.3653559-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently two kinds of FDT drivers (GPIO and regmap) use a different
prototype for their driver init functions, additionally passing in the
phandle of the FDT node. However, it turns out that using the phandle is
not necessary. It's only used as a unique ID for a device instance, but
the FDT node offset works just as well for this purpuse, and in fact the
I2C drivers use the FDT node offset as the device ID already.

By removing the phandle argument from these driver init functions, all
FDT drivers now use the same init function prototype, which will allow
further code reuse in the future.


Samuel Holland (3):
  lib: utils/gpio: Remove fdt_gpio_driver() function
  lib: utils/gpio: Use FDT node offset as GPIO chip ID
  lib: utils/regmap: Use FDT node offset as regmap ID

 include/sbi_utils/gpio/fdt_gpio.h     |  2 +-
 include/sbi_utils/regmap/fdt_regmap.h |  2 +-
 lib/utils/gpio/fdt_gpio.c             | 40 ++++++---------------------
 lib/utils/gpio/fdt_gpio_designware.c  |  4 +--
 lib/utils/gpio/fdt_gpio_sifive.c      |  4 +--
 lib/utils/gpio/fdt_gpio_starfive.c    |  4 +--
 lib/utils/regmap/fdt_regmap.c         | 14 +++++-----
 lib/utils/regmap/fdt_regmap_syscon.c  |  4 +--
 8 files changed, 26 insertions(+), 48 deletions(-)

-- 
2.45.1


