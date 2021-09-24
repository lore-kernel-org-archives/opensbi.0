From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 24 Sep 2021 14:33:43 +0300
Subject: [PATCH 0/4] reboot SiFive Unmatched via PMIC
Message-ID: <20210924113347.3576-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

This series introduce rebooting via i2c PMIC, currently on
SiFive Unmatched board.

teseted via Linux with reset extension and direct ecall from 
u-boot.

With this it becomes possible to reboot/shutdown the board 
if Linux or u-boot is accompanied with OpenSBI reset extension.

"gpio-poweroff" is required to be removed from u-boot dts file, as
it overrides fdt_reset_da9063.

fdt_reset_da9063 is loaded if "dlg,da9063" is present in device tree.

Moreover it's look like we require a convenient "sleep" functionality,
currently i've implemented sleep via CSR_MCYCLE, assuming we don't normally
communicate with device while operational only on start/shutdown.

```
static inline void wait_cycles(unsigned long cycles)
{
	csr_write(CSR_MCYCLE, 0);
	while (cycles > csr_read_num(CSR_MCYCLE));
}
```

The original sequence was discovered by Alexandre Ghiti posted a patch on 
linux-riscv mail-lists.

https://patchwork.kernel.org/project/linux-riscv/patch/20210921053356.1705833-1-alexandre.ghiti at canonical.com/

These magick numbers are readed as:
- select PAGE0
- set WAKE_UP bit in CONTROL_A reg
- mask setting POWER1, POWER domain and STANDBY, and poweroff SYSTEM domain

Nikita Shubin (4):
  lib: utils/i2c: Add generic I2C configuration library
  lib: utils/gpio: Add simple FDT based I2C framework
  lib: utils/gpio: Add minimal SiFive I2C driver
  lib: utils/reset: Add generic da9063 reset driver

 include/sbi_utils/i2c/fdt_i2c.h    |  26 +++
 include/sbi_utils/i2c/i2c.h        |  65 +++++++
 lib/utils/i2c/fdt_i2c.c            | 110 +++++++++++
 lib/utils/i2c/fdt_i2c_sifive.c     | 289 +++++++++++++++++++++++++++++
 lib/utils/i2c/i2c.c                | 102 ++++++++++
 lib/utils/i2c/objects.mk           |  12 ++
 lib/utils/reset/fdt_reset.c        |   2 +
 lib/utils/reset/fdt_reset_da9063.c | 203 ++++++++++++++++++++
 lib/utils/reset/objects.mk         |   1 +
 9 files changed, 810 insertions(+)
 create mode 100644 include/sbi_utils/i2c/fdt_i2c.h
 create mode 100644 include/sbi_utils/i2c/i2c.h
 create mode 100644 lib/utils/i2c/fdt_i2c.c
 create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c
 create mode 100644 lib/utils/i2c/i2c.c
 create mode 100644 lib/utils/i2c/objects.mk
 create mode 100644 lib/utils/reset/fdt_reset_da9063.c

-- 
2.31.1


