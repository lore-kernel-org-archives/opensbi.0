From: Nam Cao <namcao@linutronix.de>
Date: Wed, 31 Jan 2024 14:09:05 +0100
Subject: [PATCH 3/5] platform: starfive: drop "compatible" from struct pmic
In-Reply-To: <cover.1706705649.git.namcao@linutronix.de>
References: <cover.1706705649.git.namcao@linutronix.de>
Message-ID: <0abbfca26af666f06268003c40ecc2069b5fcecf.1706705649.git.namcao@linutronix.de>
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
index 9f5261b..cb8c48d 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -23,7 +23,6 @@
 struct pmic {
 	struct i2c_adapter *adapter;
 	u32 dev_addr;
-	const char *compatible;
 };
 
 struct jh7110 {
@@ -208,7 +207,6 @@ static int pm_reset_init(void *fdt, int nodeoff,
 		return rc;
 
 	pmic_inst.dev_addr = addr;
-	pmic_inst.compatible = match->compatible;
 
 	i2c_bus = fdt_parent_offset(fdt, nodeoff);
 	if (i2c_bus < 0)
-- 
2.39.2


