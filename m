From: Nam Cao <namcao@linutronix.de>
Date: Thu, 22 Feb 2024 09:16:16 +0100
Subject: [PATCH v5 3/6] platform: starfive: remove redundant compatibility check in pmic_ops
In-Reply-To: <20240222081619.275869-1-namcao@linutronix.de>
References: <20240222081619.275869-1-namcao@linutronix.de>
Message-ID: <20240222081619.275869-4-namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pmic_ops() is only called if a compatible device is found in device
tree. It is redundant for this function to check the compability again.
Remove this check.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Tested-by: Minda Chen <minda.chen@starfivetech.com>
---
 platform/generic/starfive/jh7110.c | 36 +++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 308fe39..3161bf1 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -23,7 +23,6 @@
 struct pmic {
 	struct i2c_adapter *adapter;
 	u32 dev_addr;
-	const char *compatible;
 };
 
 struct jh7110 {
@@ -133,28 +132,26 @@ static void pmic_ops(struct pmic *pmic, int type)
 	if (ret)
 		return;
 
-	if (!sbi_strcmp("stf,axp15060-regulator", pmic->compatible)) {
-		ret = i2c_adapter_reg_read(pmic->adapter, pmic->dev_addr,
-					   AXP15060_POWER_REG, &val);
+	ret = i2c_adapter_reg_read(pmic->adapter, pmic->dev_addr,
+					AXP15060_POWER_REG, &val);
 
-		if (ret) {
-			sbi_printf("%s: cannot read pmic power register\n",
-				   __func__);
-			return;
-		}
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
@@ -206,7 +203,6 @@ static int pm_reset_init(void *fdt, int nodeoff,
 		return rc;
 
 	pmic_inst.dev_addr = addr;
-	pmic_inst.compatible = match->compatible;
 
 	i2c_bus = fdt_parent_offset(fdt, nodeoff);
 	if (i2c_bus < 0)
-- 
2.39.2


