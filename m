From: Nam Cao <namcao@linutronix.de>
Date: Mon,  5 Feb 2024 09:48:59 +0100
Subject: [PATCH v4 4/7] platform: starfive: rename "stf,axp15060-regulator" -> "x-powers,axp15060"
In-Reply-To: <cover.1707122766.git.namcao@linutronix.de>
References: <cover.1707122766.git.namcao@linutronix.de>
Message-ID: <e09ff63f70ea43b2e4d3a92815a5490e0c80d0ce.1707122766.git.namcao@linutronix.de>
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
 platform/generic/starfive/jh7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 1956fd8..1f7cfe2 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -223,7 +223,7 @@ static int pm_reset_init(void *fdt, int nodeoff,
 }
 
 static const struct fdt_match pm_reset_match[] = {
-	{ .compatible = "stf,axp15060-regulator", .data = (void *)true },
+	{ .compatible = "x-powers,axp15060", .data = (void *)true },
 	{ },
 };
 
-- 
2.39.2


