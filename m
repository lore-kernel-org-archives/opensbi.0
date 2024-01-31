From: Nam Cao <namcao@linutronix.de>
Date: Wed, 31 Jan 2024 14:09:02 +0100
Subject: [PATCH 0/5] starfive reboot cleanup & fix
Message-ID: <cover.1706705649.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series:
  - add gracefully error handling when reboot devices are not present
  - correct a device tree compatibility string
  - some minor cleanup

This series complements my other series:
http://lists.infradead.org/pipermail/opensbi/2024-January/006300.html

Nam Cao (5):
  platform: starfive: remove redundant compatibility check in pmic_ops
  platform: starfive: rename "stf,axp15060-regulator" ->
    "x-powers,axp15060"
  platform: starfive: drop "compatible" from struct pmic
  platform: starfive: return error if needed devices are not present
  platform: starfive: call starfive_jh7110_inst_init() in
    pm_reset_init()

 platform/generic/starfive/jh7110.c | 49 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 22 deletions(-)

-- 
2.39.2


