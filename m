From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 15 Oct 2021 16:19:20 +0300
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
Message-ID: <20211015131925.22585-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

This series introduce rebooting via i2c da9063 PMIC, currently on
SiFive Unmatched board.

"gpio-poweroff" remains with default priority of 128 - default priority,
da9063 is 1 by default the least priority.

da9063-reset {
	compatible = "da9063-reset";
	priority = <1>;
};

Is required to be added as a child node of PMIC.

tested via Linux and U-Boot with reset extension:

OpenSBI:
Platform Reboot Device    : da9063-reset
Platform Shutdown Device  : gpio-reset

v1 -> v2:
Added:
lib: sbi: add priority for reset handler

Renamed read/write to smbus_write/smbus_read, as actually this 
is not a "raw" read/write but a one with a register address provided,
later a "raw" version will be need but currently i don't have anything 
to test it.

To Xiang W:
I have analized your proposal of switching to sbi_list, 
and switched i2c adapters array to list. Unfortunately
to switch drivers we require "init" functions.

to Alexander Ghiti:

> No need for the struct i2c_adapter argument as it is globally accessible.

It looks like a more clean and reusable way to me, let's here more opinions

> Why should the da9063 device care about the adapter configuration here?
> I think It should just rely on an already configured/initialized i2c
> controller.

With clocks init added to sifive_i2c configure it can become usable even if nobody 
cared about controller initialization.

> Establishing the link between the i2c device and its adapter should
> somehow be implicitly done by the i2c library, IMO the device should not
> care about its controller.

And how do you think it will look like ? In out case it's not a separate driver/client
entity but all togather for simplicity.

Nikita Shubin (5):
  lib: utils/reset: add priority to gpio reset
  lib: utils/i2c: Add generic I2C configuration library
  lib: utils/i2c: Add simple FDT based I2C framework
  lib: utils/i2c: Add minimal SiFive I2C driver
  lib: utils/reset: Add generic da9063 reset driver

 include/sbi_utils/i2c/fdt_i2c.h    |  26 +++
 include/sbi_utils/i2c/i2c.h        |  99 +++++++++++
 lib/utils/i2c/fdt_i2c.c            | 111 ++++++++++++
 lib/utils/i2c/fdt_i2c_sifive.c     | 271 +++++++++++++++++++++++++++++
 lib/utils/i2c/i2c.c                |  85 +++++++++
 lib/utils/i2c/objects.mk           |  12 ++
 lib/utils/reset/fdt_reset.c        |   2 +
 lib/utils/reset/fdt_reset_da9063.c | 214 +++++++++++++++++++++++
 lib/utils/reset/fdt_reset_gpio.c   |  18 +-
 lib/utils/reset/objects.mk         |   1 +
 10 files changed, 836 insertions(+), 3 deletions(-)
 create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
 create mode 100644 include/sbi_utils/i2c/i2c.h
 create mode 100644 lib/utils/i2c/fdt_i2c.c
 create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c
 create mode 100644 lib/utils/i2c/i2c.c
 create mode 100644 lib/utils/i2c/objects.mk
 create mode 100644 lib/utils/reset/fdt_reset_da9063.c

-- 
2.31.1


