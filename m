From: Nam Cao <namcao@linutronix.de>
Date: Mon,  5 Feb 2024 09:48:55 +0100
Subject: [PATCH v4 0/7] starfive reboot cleanup & fix 
Message-ID: <cover.1707122766.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series:
 - Rename device tree compatible strings to match U-Boot
 - Fix code that extract I2C address from device tree
 - Cleanup

The device tree nodes in this series have just been merged to U-Boot a few
days ago. So please use most recent upstream U-Boot for testing this
series.

Nam Cao (7):
  platform: starfive: correct system clock device tree node
  platform: starfive: get I2C offset address from clocks property
  platform: starfive: remove redundant compatibility check in pmic_ops
  platform: starfive: rename "stf,axp15060-regulator" ->
    "x-powers,axp15060"
  platform: starfive: drop "compatible" from struct pmic
  platform: starfive: return error if needed devices are not present
  platform: starfive: call starfive_jh7110_inst_init() in
    pm_reset_init()

 platform/generic/starfive/jh7110.c | 71 ++++++++++++++++--------------
 1 file changed, 38 insertions(+), 33 deletions(-)

-- 
2.39.2


