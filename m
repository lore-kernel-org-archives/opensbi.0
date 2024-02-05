From: Nam Cao <namcao@linutronix.de>
Date: Mon,  5 Feb 2024 09:49:00 +0100
Subject: [PATCH v4 5/7] platform: starfive: drop "compatible" from struct pmic
In-Reply-To: <cover.1707122766.git.namcao@linutronix.de>
References: <cover.1707122766.git.namcao@linutronix.de>
Message-ID: <23b797311f400cd737a7261a4f84fe30291695d0.1707122766.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The member "compatible" of struct pmic is not used. Delete it.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 platform/generic/starfive/jh7110.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 1f7cfe2..b0b1e35 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -23,7 +23,6 @@
 struct pmic {
 	struct i2c_adapter *adapter;
 	u32 dev_addr;
-	const char *compatible;
 };
 
 struct jh7110 {
@@ -204,7 +203,6 @@ static int pm_reset_init(void *fdt, int nodeoff,
 		return rc;
 
 	pmic_inst.dev_addr = addr;
-	pmic_inst.compatible = match->compatible;
 
 	i2c_bus = fdt_parent_offset(fdt, nodeoff);
 	if (i2c_bus < 0)
-- 
2.39.2


