From: Nam Cao <namcao@linutronix.de>
Date: Thu, 22 Feb 2024 09:16:15 +0100
Subject: [PATCH v5 2/6] platform: starfive: get I2C offset address from clocks property
In-Reply-To: <20240222081619.275869-1-namcao@linutronix.de>
References: <20240222081619.275869-1-namcao@linutronix.de>
Message-ID: <20240222081619.275869-3-namcao@linutronix.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The current code gets the I2C offset address using the device tree node
name: it get the I2C device index from the 4th character in the node
name (for example, "i2c5" -> i2c device 5). However, the device tree
node's name in U-Boot is actually just "i2c" without the number, so the
current code cannot be used with the device tree from U-Boot.

Get the I2C offset address from the "clocks" property instead.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Minda Chen <minda.chen@starfivetech.com>
Tested-by: Minda Chen <minda.chen@starfivetech.com>
---
 platform/generic/starfive/jh7110.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 4b22175..308fe39 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -29,7 +29,7 @@ struct pmic {
 struct jh7110 {
 	u64 pmu_reg_base;
 	u64 clk_reg_base;
-	u32 i2c_index;
+	u32 i2c_clk_offset;
 };
 
 static struct pmic pmic_inst;
@@ -67,7 +67,6 @@ static u32 selected_hartid = -1;
 #define AXP15060_POWER_OFF_BIT		BIT(7)
 #define AXP15060_RESET_BIT		BIT(6)
 
-#define I2C_APB_CLK_OFFSET		0x228
 #define I2C_APB_CLK_ENABLE_BIT		BIT(31)
 
 static int pm_system_reset_check(u32 type, u32 reason)
@@ -163,10 +162,7 @@ static void pmic_i2c_clk_enable(void)
 	unsigned long clock_base;
 	unsigned int val;
 
-	clock_base = jh7110_inst.clk_reg_base +
-		I2C_APB_CLK_OFFSET +
-		(jh7110_inst.i2c_index << 2);
-
+	clock_base = jh7110_inst.clk_reg_base + jh7110_inst.i2c_clk_offset;
 	val = readl((void *)clock_base);
 
 	if (!val)
@@ -241,7 +237,8 @@ static struct fdt_reset fdt_reset_pmic = {
 static int starfive_jh7110_inst_init(void *fdt)
 {
 	int noff, rc = 0;
-	const char *name;
+	const fdt32_t *val;
+	int len;
 	u64 addr;
 
 	noff = fdt_node_offset_by_compatible(fdt, -1, "starfive,jh7110-pmu");
@@ -261,9 +258,12 @@ static int starfive_jh7110_inst_init(void *fdt)
 	}
 
 	if (pmic_inst.adapter) {
-		name = fdt_get_name(fdt, pmic_inst.adapter->id, NULL);
-		if (!sbi_strncmp(name, "i2c", 3))
-			jh7110_inst.i2c_index = name[3] - '0';
+		val = fdt_getprop(fdt, pmic_inst.adapter->id, "clocks", &len);
+		/* The clocks property looks like this: clocks = <&syscrg JH7110_SYSCLK_I2C5_APB>;
+		 * So check that the length is 8 bytes, and get the offset from the second value
+		 */
+		if (val && len == 8)
+			jh7110_inst.i2c_clk_offset = fdt32_to_cpu(val[1]) << 2;
 		else
 			rc = SBI_EINVAL;
 	}
-- 
2.39.2


