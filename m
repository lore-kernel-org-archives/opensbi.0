From: Nam Cao <namcao@linutronix.de>
Date: Thu, 22 Feb 2024 09:16:13 +0100
Subject: [PATCH v5 0/6] starfive reboot cleanup & fix
Message-ID: <20240222081619.275869-1-namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series:
 - Rename device tree compatible strings to match U-Boot
 - Fix code that extract I2C address from device tree
 - Cleanup

v5:
 - Collect reviewed-by and tested-by tags
 - squash 2 commits:
     platform: starfive: remove redundant compatibility check in pmic_ops
     platform: starfive: drop "compatible" from struct pmic


Nam Cao (6):
  platform: starfive: correct system clock device tree node
  platform: starfive: get I2C offset address from clocks property
  platform: starfive: remove redundant compatibility check in pmic_ops
  platform: starfive: rename "stf,axp15060-regulator" ->
    "x-powers,axp15060"
  platform: starfive: return error if needed devices are not present
  platform: starfive: call starfive_jh7110_inst_init() in
    pm_reset_init()

 platform/generic/starfive/jh7110.c | 71 ++++++++++++++++--------------
 1 file changed, 38 insertions(+), 33 deletions(-)

-- 
2.39.2


