From: Anup Patel <anup.patel@wdc.com>
Date: Fri,  9 Jul 2021 18:40:53 +0530
Subject: [PATCH v2 0/6] GPIO reset support
Message-ID: <20210709131059.1502293-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds generic GPIO reset (poweroff/restart) support which is
required by SiFive platforms.

These patches can be found in gpio_reset_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v2:
 - Re-designed the GPIO framework to probe GPIO drivers on demand
   and avoid touching generic OpenSBI library.

Anup Patel (4):
  lib: utils/fdt: Add fdt_parse_phandle_with_args() API
  lib: utils/gpio: Add generic GPIO configuration library
  lib: utils/gpio: Add simple FDT based GPIO framework
  lib: utils/fdt: Disable GPIO restart and poweroff nodes in
    fdt_fixups()

Green Wan (2):
  lib: utils/gpio: Add minimal SiFive GPIO driver
  lib: utils/reset: Add generic GPIO reset driver

 include/sbi_utils/fdt/fdt_fixup.h  |  17 +++-
 include/sbi_utils/fdt/fdt_helper.h |  11 +++
 include/sbi_utils/gpio/fdt_gpio.h  |  34 +++++++
 include/sbi_utils/gpio/gpio.h      |  99 +++++++++++++++++++
 lib/utils/fdt/fdt_fixup.c          |  25 ++++-
 lib/utils/fdt/fdt_helper.c         |  47 ++++++++++
 lib/utils/gpio/fdt_gpio.c          | 135 ++++++++++++++++++++++++++
 lib/utils/gpio/fdt_gpio_sifive.c   |  90 ++++++++++++++++++
 lib/utils/gpio/gpio.c              | 116 +++++++++++++++++++++++
 lib/utils/gpio/objects.mk          |  12 +++
 lib/utils/reset/fdt_reset.c        |   2 +
 lib/utils/reset/fdt_reset_gpio.c   | 146 +++++++++++++++++++++++++++++
 lib/utils/reset/objects.mk         |   1 +
 13 files changed, 731 insertions(+), 4 deletions(-)
 create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
 create mode 100644 include/sbi_utils/gpio/gpio.h
 create mode 100644 lib/utils/gpio/fdt_gpio.c
 create mode 100644 lib/utils/gpio/fdt_gpio_sifive.c
 create mode 100644 lib/utils/gpio/gpio.c
 create mode 100644 lib/utils/gpio/objects.mk
 create mode 100644 lib/utils/reset/fdt_reset_gpio.c

-- 
2.25.1


