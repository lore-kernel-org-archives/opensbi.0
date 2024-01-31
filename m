From: Nam Cao <namcao@linutronix.de>
Date: Wed, 31 Jan 2024 14:09:04 +0100
Subject: [PATCH 2/5] platform: starfive: rename "stf,axp15060-regulator" -> "x-powers,axp15060"
In-Reply-To: <cover.1706705649.git.namcao@linutronix.de>
References: <cover.1706705649.git.namcao@linutronix.de>
Message-ID: <dc1c0ec86fa2838f4d51fda6319646ab14c54e93.1706705649.git.namcao@linutronix.de>
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
---
Actually "x-powers,axp15060" does not exist in U-Boot at the moment. But
it is being added:
https://lore.kernel.org/u-boot/47fd2b2225f52a2d5c3a91494ef7b9036e944199.1706517351.git.namcao at linutronix.de/

 platform/generic/starfive/jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 72969e4..9f5261b 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -227,7 +227,7 @@ static int pm_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match pm_reset_match[] = {
-	{ .compatible = "stf,axp15060-regulator", .data = (void *)true },
+	{ .compatible = "x-powers,axp15060", .data = (void *)true },
 	{ },
 };
 
-- 
2.39.2


