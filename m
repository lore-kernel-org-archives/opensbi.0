From: Green Wan <green.wan@sifive.com>
Date: Thu,  1 Jul 2021 15:39:54 +0800
Subject: [RFC PATCH 0/4] add sifive reset device
Message-ID: <20210701073958.15558-1-green.wan@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To enable reset device for SiFive Unmatched board, the patchset starts
with a preparetory patch [1/4] to unify the file and function names of
current 'sifive_test' reset device.

Then, adding 'gpio-poweroff' DT parsing and a gpio output interface to
lib/utils in patch [2/4] and [3/4].

The reset device 'sifive_reset' is added in the last patch [4/4].

'sifive_reset' device uses gpio_direction_output() to do the reset.
The entry point for GPIO initialization must be initialized first and
is placed at patform/generic/platform.c.

Current GPIO interface is simple and only ouput control callback is
available.

Green Wan (4):
  lib: utils: reset: unify naming of 'sifive_test' device
  lib: utils: add GPIO and poweroff parsing
  lib: utils: add gpio generic interface
  lib: utils: add sifive reset device

 include/sbi/sbi_gpio.h                  | 23 ++++++++
 include/sbi_utils/fdt/fdt_helper.h      | 21 ++++++++
 include/sbi_utils/gpio/fdt_gpio.h       | 32 +++++++++++
 include/sbi_utils/sys/sifive_reset.h    | 18 +++++++
 lib/utils/fdt/fdt_helper.c              | 51 +++++++++++++++++-
 lib/utils/gpio/fdt_gpio.c               | 55 +++++++++++++++++++
 lib/utils/gpio/objects.mk               | 11 ++++
 lib/utils/gpio/sifive_gpio.c            | 70 +++++++++++++++++++++++++
 lib/utils/reset/fdt_reset.c             |  2 +
 lib/utils/reset/fdt_reset_sifive.c      | 37 ++++++++-----
 lib/utils/reset/fdt_reset_sifive_test.c | 36 +++++++++++++
 lib/utils/reset/objects.mk              |  1 +
 lib/utils/sys/objects.mk                |  1 +
 lib/utils/sys/sifive_reset.c            | 66 +++++++++++++++++++++++
 platform/generic/platform.c             |  3 ++
 15 files changed, 413 insertions(+), 14 deletions(-)
 create mode 100644 include/sbi/sbi_gpio.h
 create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
 create mode 100644 include/sbi_utils/sys/sifive_reset.h
 create mode 100644 lib/utils/gpio/fdt_gpio.c
 create mode 100644 lib/utils/gpio/objects.mk
 create mode 100644 lib/utils/gpio/sifive_gpio.c
 create mode 100644 lib/utils/reset/fdt_reset_sifive_test.c
 create mode 100644 lib/utils/sys/sifive_reset.c

-- 
2.17.1


