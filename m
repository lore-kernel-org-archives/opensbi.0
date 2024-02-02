From: Nam Cao <namcao@linutronix.de>
Date: Fri,  2 Feb 2024 14:43:24 +0100
Subject: [PATCH v3 3/7] platform: starfive: remove redundant compatibility check in pmic_ops
In-Reply-To: <cover.1706880734.git.namcao@linutronix.de>
References: <cover.1706880734.git.namcao@linutronix.de>
Message-ID: <16ada695eb73656550b0474b6640dc0d42f1f1fe.1706880734.git.namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pmic_ops() is only called if a compatible device is found in device
tree. It is redundant for this function to check the compability again.
Remove this check.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 platform/generic/starfive/jh7110.c | 36 ++++++++++++++----------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 846b068..d3647c2 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -134,28 +134,26 @@ static void pmic_ops(struct pmic *pmic, int type)
 	if (ret)
 		return;
 
-	if (!sbi_strcmp("stf,axp15060-regulator", pmic->compatible)) {
-		ret = i2c_adapter_reg_read(pmic->adapter, pmic->dev_addr,
-					   AXP15060_POWER_REG, &val);
-
-		if (ret) {
-			sbi_printf("%s: cannot read pmic power register\n",
-				   __func__);
-			return;
-		}
+	ret = i2c_adapter_reg_read(pmic->adapter, pmic->dev_addr,
+					AXP15060_POWER_REG, &val);
+
+	if (ret) {
+		sbi_printf("%s: cannot read pmic power register\n",
+				__func__);
+		return;
+	}
 
+	val |= AXP15060_POWER_OFF_BIT;
+	if (type == SBI_SRST_RESET_TYPE_SHUTDOWN)
 		val |= AXP15060_POWER_OFF_BIT;
-		if (type == SBI_SRST_RESET_TYPE_SHUTDOWN)
-			val |= AXP15060_POWER_OFF_BIT;
-		else
-			val |= AXP15060_RESET_BIT;
+	else
+		val |= AXP15060_RESET_BIT;
 
-		ret = i2c_adapter_reg_write(pmic->adapter, pmic->dev_addr,
-					    AXP15060_POWER_REG, val);
-		if (ret)
-			sbi_printf("%s: cannot write pmic power register\n",
-				   __func__);
-	}
+	ret = i2c_adapter_reg_write(pmic->adapter, pmic->dev_addr,
+					AXP15060_POWER_REG, val);
+	if (ret)
+		sbi_printf("%s: cannot write pmic power register\n",
+				__func__);
 }
 
 static void pmic_i2c_clk_enable(void)
-- 
2.39.2


