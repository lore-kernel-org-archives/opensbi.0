From: Minda Chen <minda.chen@starfivetech.com>
Date: Fri, 24 Feb 2023 17:57:44 +0800
Subject: [PATCH 0/2] Add StarFive JH7110 SoC shutdown and reboot ops
Message-ID: <20230224095746.40466-1-minda.chen@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Patch2 needs to apply after patch in [1].

[1] https://lists.infradead.org/pipermail/opensbi/2023-February/004474.html

Test board is JH7110 visionfive v2 board. shutdown and reboot function
require to access axp15060 PMIC through i2c.

patch1 is i2c driver. i2c ip is designware. dw_i2c.c includes designware
i2c minimal driver which can be used by other platform.
fdt_i2c_starfive.c contains StarFive JH7110 platform and fdt information.

patch2 is JH7110 visionfive2 board reboot and shutdown ops.
The i2c clk will be disabled by kernel i2c driver in power off progress
(suspend ops).

Before access PMIC control bits to reboot or shutdown. Require
to set off device power domain in JH7110 SoC power management unit.

For more JH7110 and visionFive v2 information and support,
you can visit RVspace wiki[2].

[2] https://wiki.rvspace.org/

Minda Chen (2):
  lib: utils/i2c: Add minimal StarFive jh7110 I2C driver
  config: starfive: add PMIC power ops in JH7110 visionfive2 board

 include/sbi_utils/i2c/dw_i2c.h     |  21 +++
 lib/utils/i2c/Kconfig              |   8 +
 lib/utils/i2c/dw_i2c.c             | 190 ++++++++++++++++++++
 lib/utils/i2c/fdt_i2c_starfive.c   |  63 +++++++
 lib/utils/i2c/objects.mk           |   5 +
 platform/generic/configs/defconfig |   1 +
 platform/generic/starfive/jh7110.c | 272 +++++++++++++++++++++++++++++
 7 files changed, 560 insertions(+)
 create mode 100644 include/sbi_utils/i2c/dw_i2c.h
 create mode 100644 lib/utils/i2c/dw_i2c.c
 create mode 100644 lib/utils/i2c/fdt_i2c_starfive.c

-- 
2.17.1


