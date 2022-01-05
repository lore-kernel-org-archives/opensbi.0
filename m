From: Aurelien Jarno <aurelien@aurel32.net>
Date: Wed,  5 Jan 2022 08:20:39 +0100
Subject: [PATCH 2/2] platform: sifive_fu740: fix reset when watchdog is running
In-Reply-To: <20220105072039.2609845-1-aurelien@aurel32.net>
References: <20220105072039.2609845-1-aurelien@aurel32.net>
Message-ID: <20220105072039.2609845-2-aurelien@aurel32.net>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the watchdog is running the HiFive Unmatched board does not reboot
properly and shuts down itself a few seconds after reboot, in the early
stages of the u-boot loading. On a Linux kernel this happens when the
da9063_wdt module is loaded. This does not happen if the module is
unloaded before reboot or if the watchdog module is loaded with
"stop_on_reboot=1".

Fix that by stopping the watchdog before attempting to reset the board.
This is done by zeroing the TWDSCALE field of CONTROL_D register, unless
it was already set to 0.

Reported-by: Tianon Gravi <tianon@debian.org>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 platform/generic/sifive_fu740.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
index 866e924..f595c04 100644
--- a/platform/generic/sifive_fu740.c
+++ b/platform/generic/sifive_fu740.c
@@ -22,6 +22,7 @@
 
 #define DA9063_REG_PAGE_CON		0x00
 #define DA9063_REG_CONTROL_A		0x0e
+#define DA9063_REG_CONTROL_D		0x11
 #define DA9063_REG_CONTROL_F		0x13
 #define DA9063_REG_DEVICE_ID		0x81
 
@@ -29,6 +30,8 @@
 #define DA9063_CONTROL_A_M_POWER_EN	(1 << 5)
 #define DA9063_CONTROL_A_STANDBY	(1 << 3)
 
+#define DA9063_CONTROL_D_TWDSCALE_MASK	0x07
+
 #define DA9063_CONTROL_F_WAKEUP	(1 << 2)
 #define DA9063_CONTROL_F_SHUTDOWN	(1 << 1)
 
@@ -79,6 +82,27 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 	return 0;
 }
 
+static inline int da9063_stop_watchdog(struct i2c_adapter *adap, uint32_t reg)
+{
+	uint8_t val;
+	int rc = i2c_adapter_reg_write(adap, reg,
+					DA9063_REG_PAGE_CON, 0x00);
+
+	if (rc)
+		return rc;
+
+	rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_CONTROL_D, &val);
+	if (rc)
+		return rc;
+
+	if ((val & DA9063_CONTROL_D_TWDSCALE_MASK) == 0)
+		return 0;
+
+	val &= ~DA9063_CONTROL_D_TWDSCALE_MASK;
+
+	return i2c_adapter_reg_write(adap, reg, DA9063_REG_CONTROL_D, val);
+}
+
 static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)
 {
 	int rc = i2c_adapter_reg_write(adap, reg,
@@ -133,6 +157,7 @@ static void da9063_system_reset(u32 type, u32 reason)
 			break;
 		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+			da9063_stop_watchdog(adap, reg);
 			da9063_reset(adap, reg);
 			break;
 		}
-- 
2.34.1


