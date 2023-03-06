From: Minda Chen <minda.chen@starfivetech.com>
Date: Mon, 6 Mar 2023 16:45:05 +0800
Subject: [PATCH v2 0/2] Add StarFive JH7110 SoC shutdown and reboot ops
Message-ID: <20230306084507.25214-1-minda.chen@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Test board is JH7110 visionfive v2 board. shutdown and reboot function
require to access axp15060 PMIC through i2c.

patch1 is i2c driver. i2c ip is designware. dw_i2c.c includes designware
i2c minimal driver which can be used by other platform.
fdt_i2c_dw.c parse i2c register base and other information.

patch2 is JH7110 visionfive2 board reboot and shutdown ops.
The i2c clk will be disabled by kernel i2c driver in power off progress
(suspend ops).

Before access PMIC control bits to reboot or shutdown. Require
to set off device power domain in JH7110 SoC power management unit.

For more JH7110 and visionFive v2 information and support,
you can visit RVspace wiki[2].

[2] https://wiki.rvspace.org/

Changes v2->v1
 patch1
 - Rename fdt_i2c_starfive.c to fdt_i2c_dw.c
 - Replace prefix of the macros and variables 'starfive' to 'fdt_dw' in
   fdt_i2c_dw.c
 - Replace FDT_I2C_STARFIVE to FDT_I2C_DW in i2c object.mk and Kconfig

Minda Chen (2):
  lib: utils/i2c: Add minimal StarFive jh7110 I2C driver
  config: starfive: add PMIC power ops in JH7110 visionfive2 board

 include/sbi_utils/i2c/dw_i2c.h     |  21 +++
 lib/utils/i2c/Kconfig              |   8 +
 lib/utils/i2c/dw_i2c.c             | 190 ++++++++++++++++++++
 lib/utils/i2c/fdt_i2c_dw.c         |  63 +++++++
 lib/utils/i2c/objects.mk           |   5 +
 platform/generic/configs/defconfig |   1 +
 platform/generic/starfive/jh7110.c | 272 +++++++++++++++++++++++++++++
 7 files changed, 560 insertions(+)
 create mode 100644 include/sbi_utils/i2c/dw_i2c.h
 create mode 100644 lib/utils/i2c/dw_i2c.c
 create mode 100644 lib/utils/i2c/fdt_i2c_dw.c

-- 
2.17.1


