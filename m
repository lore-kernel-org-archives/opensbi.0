From: Nam Cao <namcao@linutronix.de>
Date: Thu, 22 Feb 2024 09:16:17 +0100
Subject: [PATCH v5 4/6] platform: starfive: rename "stf,axp15060-regulator" -> "x-powers,axp15060"
In-Reply-To: <20240222081619.275869-1-namcao@linutronix.de>
References: <20240222081619.275869-1-namcao@linutronix.de>
Message-ID: <20240222081619.275869-5-namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI uses the device tree compatible string "stf,axp15060-regulator"
for the regulator node. However, the string used by U-Boot (and Linux)
is actually "x-powers,axp15060". As OpenSBI gets the device tree from
U-Boot, this causes the regulator device to be undetected, and OpenSBI
does not use this device to perform board reset/shutdown.

Rename this device tree compatible string to match U-Boot (and Linux).

Signed-off-by: Nam Cao <namcao@linutronix.de>
Acked-by: Minda Chen <minda.chen@starfivetech.com>
Tested-by: Minda Chen <minda.chen@starfivetech.com>
---
 platform/generic/starfive/jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 3161bf1..b0b1e35 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -221,7 +221,7 @@ static int pm_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match pm_reset_match[] = {
-	{ .compatible = "stf,axp15060-regulator", .data = (void *)true },
+	{ .compatible = "x-powers,axp15060", .data = (void *)true },
 	{ },
 };
 
-- 
2.39.2


