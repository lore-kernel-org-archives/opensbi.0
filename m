From: Xiang W <wxjstz@126.com>
Date: Thu, 30 Dec 2021 01:39:09 +0800
Subject: [PATCH] lib: utils/i2c: update i2c interface
Message-ID: <20211229173909.282858-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Remove i2c register related operations
2. Simplify the low-level interface
3. Add 10bit address support
4. Add combination operation
5. Update fdt_i2c_sifive.c
6. Update sifive_fu740.c

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/i2c/i2c.h     |  80 ++++++++++----------
 lib/utils/i2c/fdt_i2c_sifive.c  | 130 +++++++++-----------------------
 lib/utils/i2c/i2c.c             | 123 ++++++++++++++++++++++++++----
 platform/generic/sifive_fu740.c |  31 ++++++--
 4 files changed, 208 insertions(+), 156 deletions(-)

diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
index 5a70364..53e76e3 100644
--- a/include/sbi_utils/i2c/i2c.h
+++ b/include/sbi_utils/i2c/i2c.h
@@ -13,6 +13,11 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
+enum i2c_op {
+	I2C_OP_W = 0,
+	I2C_OP_R = 1
+};
+
 /** Representation of a I2C adapter */
 struct i2c_adapter {
 	/** Pointer to I2C driver owning this I2C adapter */
@@ -21,21 +26,11 @@ struct i2c_adapter {
 	/** Unique ID of the I2C adapter assigned by the driver */
 	int id;
 
-	/**
-	 * Send buffer to given address, register
-	 *
-	 * @return 0 on success and negative error code on failure
-	 */
-	int (*write)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		    uint8_t *buffer, int len);
-
-	/**
-	 * Read buffer from given address, register
-	 *
-	 * @return 0 on success and negative error code on failure
-	 */
-	int (*read)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		    uint8_t *buffer, int len);
+	int (*write_byte)(struct i2c_adapter *ia, uint8_t byte,
+			bool send_start, bool send_stop);
+
+	int (*read_byte)(struct i2c_adapter *ia, uint8_t *byte,
+			bool nack, bool send_stop);
 
 	/** List */
 	struct sbi_dlist node;
@@ -46,6 +41,13 @@ static inline struct i2c_adapter *to_i2c_adapter(struct sbi_dlist *node)
 	return container_of(node, struct i2c_adapter, node);
 }
 
+/**
+ * This function is used to pack a 10bit address into a 15-bit address.
+ * The 10bit address during read and write operations needs to be processed by
+ * this function.
+ * */
+unsigned i2c_10bit_address(unsigned addr);
+
 /** Find a registered I2C adapter */
 struct i2c_adapter *i2c_adapter_find(int id);
 
@@ -55,31 +57,27 @@ int i2c_adapter_add(struct i2c_adapter *ia);
 /** Un-register I2C adapter */
 void i2c_adapter_remove(struct i2c_adapter *ia);
 
-/** Send to device on I2C adapter bus */
-int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		      uint8_t *buffer, int len);
-
-/** Read from device on I2C adapter bus */
-int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		     uint8_t *buffer, int len);
-
-static inline int i2c_adapter_reg_write(struct i2c_adapter *ia, uint8_t addr,
-				 uint8_t reg, uint8_t val)
-{
-	return i2c_adapter_write(ia, addr, reg, &val, 1);
-}
-
-static inline int i2c_adapter_reg_read(struct i2c_adapter *ia, uint8_t addr,
-				       uint8_t reg, uint8_t *val)
-{
-	uint8_t buf;
-	int ret = i2c_adapter_read(ia, addr, reg, &buf, 1);
-
-	if (ret)
-		return ret;
-
-	*val = buf;
-	return 0;
-}
+/**
+ * Read data from the device with address addr to buff
+ * For 10bit address operation, addr = i2c_10bit_address (orig_addr)
+*/
+int i2c_adapter_read(struct i2c_adapter *ia, unsigned addr,
+		uint8_t *buff, unsigned len);
+
+/**
+ * Write buff data to the device with address addr
+ * For 10bit address operation, addr = i2c_10bit_address (orig_addr)
+*/
+int i2c_adapter_write(struct i2c_adapter *ia, unsigned addr,
+		uint8_t *buff, unsigned len);
+
+/**
+ * Combined operation, there is no stop signal between two iic operations
+ * For 10bit address operation, addr = i2c_10bit_address (orig_addr)
+ * op0 and op1 can only be I2C_OP_R (read operate) or I2C_OP_W (write operate)
+ */
+int i2c_adapter_comb(struct i2c_adapter *ia, unsigned addr,
+		enum i2c_op op0, uint8_t *buff0, unsigned len0,
+		enum i2c_op op1, uint8_t *buff1, unsigned len1);
 
 #endif
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index 871241a..bb0456f 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -113,127 +113,71 @@ static int sifive_i2c_adapter_start(struct sifive_i2c_adapter *adap,
 	return sifive_i2c_adapter_poll_tip(adap);
 }
 
-static int sifive_i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr,
-				    uint8_t reg, uint8_t *buffer, int len)
+static int sifive_i2c_adapter_write_byte(struct i2c_adapter *ia,
+				uint8_t byte, bool send_start, bool send_stop)
 {
 	struct sifive_i2c_adapter *adap =
 		container_of(ia, struct sifive_i2c_adapter, adapter);
-	int rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
-
-	if (rc)
-		return rc;
-
-	rc = sifive_i2c_adapter_rxack(adap);
-	if (rc)
-		return rc;
-
-	/* set register address */
-	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
-				SIFIVE_I2C_CMD_IACK);
-	rc = sifive_i2c_adapter_poll_tip(adap);
-	if (rc)
-		return rc;
-
-	rc = sifive_i2c_adapter_rxack(adap);
-	if (rc)
-		return rc;
-
-	/* set value */
-	while (len) {
-		sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, *buffer);
+	int rc;
+	if (send_start) {
+		rc = sifive_i2c_adapter_start(adap, byte >> 1, byte & 1);
+		if (rc)
+			return rc;
+	} else {
+		sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, byte);
 		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
 						       SIFIVE_I2C_CMD_IACK);
 
 		rc = sifive_i2c_adapter_poll_tip(adap);
 		if (rc)
 			return rc;
-
-		rc = sifive_i2c_adapter_rxack(adap);
-		if (rc)
-			return rc;
-
-		buffer++;
-		len--;
 	}
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
-					       SIFIVE_I2C_CMD_IACK);
-
-	/* poll BUSY instead of ACK*/
-	rc = sifive_i2c_adapter_poll_busy(adap);
+	rc = sifive_i2c_adapter_rxack(adap);
 	if (rc)
 		return rc;
 
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
+	if (send_stop) {
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
+					       SIFIVE_I2C_CMD_IACK);
+		rc = sifive_i2c_adapter_poll_busy(adap);
+		if (rc)
+			return rc;
 
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
+	}
 	return 0;
 }
 
-static int sifive_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
-				   uint8_t reg, uint8_t *buffer, int len)
+static int sifive_i2c_adapter_read_byte(struct i2c_adapter *ia,
+				uint8_t *byte, bool nack, bool send_stop)
 {
 	struct sifive_i2c_adapter *adap =
 		container_of(ia, struct sifive_i2c_adapter, adapter);
 	int rc;
-
-	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
-	if (rc)
-		return rc;
-
-	rc = sifive_i2c_adapter_rxack(adap);
-	if (rc)
-		return rc;
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
-					       SIFIVE_I2C_CMD_IACK);
-
+	if (nack)
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
+					SIFIVE_I2C_CMD_ACK |
+					SIFIVE_I2C_CMD_RD |
+					SIFIVE_I2C_CMD_IACK);
+	else
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
+					SIFIVE_I2C_CMD_RD |
+					SIFIVE_I2C_CMD_IACK);
 	rc = sifive_i2c_adapter_poll_tip(adap);
 	if (rc)
 		return rc;
 
-	rc = sifive_i2c_adapter_rxack(adap);
-	if (rc)
-		return rc;
-
-	/* setting addr with high 0 bit */
-	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_READ_BIT);
-	if (rc)
-		return rc;
-
-	rc = sifive_i2c_adapter_rxack(adap);
-	if (rc)
-		return rc;
+	*byte = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
 
-	while (len) {
-		if (len == 1)
-			sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
-					  SIFIVE_I2C_CMD_ACK |
-					  SIFIVE_I2C_CMD_RD |
-					  SIFIVE_I2C_CMD_IACK);
-		else
-			sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
-					  SIFIVE_I2C_CMD_RD |
-					  SIFIVE_I2C_CMD_IACK);
-
-		rc = sifive_i2c_adapter_poll_tip(adap);
+	if (send_stop) {
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
+					       SIFIVE_I2C_CMD_IACK);
+		rc = sifive_i2c_adapter_poll_busy(adap);
 		if (rc)
 			return rc;
 
-		*buffer = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
-		buffer++;
-		len--;
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
 	}
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
-					       SIFIVE_I2C_CMD_IACK);
-	rc = sifive_i2c_adapter_poll_busy(adap);
-	if (rc)
-		return rc;
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
-
 	return 0;
 }
 
@@ -256,8 +200,8 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
 	adapter->addr = addr;
 	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
 	adapter->adapter.id = nodeoff;
-	adapter->adapter.write = sifive_i2c_adapter_write;
-	adapter->adapter.read = sifive_i2c_adapter_read;
+	adapter->adapter.write_byte = sifive_i2c_adapter_write_byte;
+	adapter->adapter.read_byte = sifive_i2c_adapter_read_byte;
 	rc = i2c_adapter_add(&adapter->adapter);
 	if (rc)
 		return rc;
diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
index 6be4e24..972c7bb 100644
--- a/lib/utils/i2c/i2c.c
+++ b/lib/utils/i2c/i2c.c
@@ -12,8 +12,12 @@
  */
 
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
 #include <sbi_utils/i2c/i2c.h>
 
+#define I2C_10BIT_MASK	0x7c
+#define I2C_10BIT_VAL	0x78
+
 static SBI_LIST_HEAD(i2c_adapters_list);
 
 struct i2c_adapter *i2c_adapter_find(int id)
@@ -51,25 +55,116 @@ void i2c_adapter_remove(struct i2c_adapter *ia)
 	sbi_list_del(&(ia->node));
 }
 
-int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		     uint8_t *buffer, int len)
+unsigned i2c_10bit_address(unsigned addr)
 {
-	if (!ia)
-		return SBI_EINVAL;
-	if (!ia->write)
-		return SBI_ENOSYS;
+	return (addr & 0x3ff) | (I2C_10BIT_VAL << 8);
+}
 
-	return ia->write(ia, addr, reg, buffer, len);
+static inline int i2c_is_10bit_address(unsigned addr)
+{
+	return ((addr >> 8) & I2C_10BIT_MASK) == I2C_10BIT_VAL;
 }
 
+static int i2c_adapter_read_helper(struct i2c_adapter *ia,
+		unsigned addr, uint8_t *buff, unsigned len, bool send_stop)
+{
+	int ret;
+	if (!i2c_is_10bit_address(addr)) {
+		ret = ia->write_byte(ia, (addr << 1) | I2C_OP_R, true, false);
+		if (ret)
+			return ret;
+	} else {
+		unsigned addr_h = (addr >> 8) & 0x7f;
+		unsigned addr_l = (addr >> 0) & 0xff;
+		ret = ia->write_byte(ia, (addr_h << 1) | I2C_OP_W, true, false);
+		if (ret)
+			return ret;
+		ret = ia->write_byte(ia, addr_l, false, false);
+		if (ret)
+			return ret;
+		ret = ia->write_byte(ia, (addr_h << 1) | I2C_OP_R, true, false);
+		if (ret)
+			return ret;
+	}
+
+	while (len--) {
+		ret = ia->read_byte(ia, buff, len == 0, send_stop && (len == 0));
+		if (ret)
+			return ret;
+		buff++;
+	}
+	return ret;
+}
 
-int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		     uint8_t *buffer, int len)
+static int i2c_adapter_write_helper(struct i2c_adapter *ia,
+		unsigned addr, uint8_t *buff, unsigned len, bool send_stop)
 {
-	if (!ia)
-		return SBI_EINVAL;
-	if (!ia->read)
-		return SBI_ENOSYS;
+	int ret;
+	if (!i2c_is_10bit_address(addr)) {
+		ret = ia->write_byte(ia, (addr << 1) | I2C_OP_W, true, false);
+		if (ret)
+			return ret;
+	} else {
+		unsigned addr_h = (addr >> 8) & 0x7f;
+		unsigned addr_l = (addr >> 0) & 0xff;
+		ret = ia->write_byte(ia, (addr_h << 1) | I2C_OP_W, true, false);
+		if (ret)
+			return ret;
+		ret = ia->write_byte(ia, addr_l, false, false);
+		if (ret)
+			return ret;
+	}
+
+	while (len--) {
+		ret = ia->write_byte(ia, *buff, false,  send_stop && (len == 0));
+		if (ret)
+			return ret;
+		buff++;
+	}
+	return ret;
+}
+
+int i2c_adapter_read(struct i2c_adapter *ia,
+		unsigned addr, uint8_t *buff, unsigned len)
+{
+	return i2c_adapter_read_helper(ia, addr, buff, len, true);
+}
 
-	return ia->read(ia, addr, reg, buffer, len);
+int i2c_adapter_write(struct i2c_adapter *ia,
+		unsigned addr, uint8_t *buff, unsigned len)
+{
+	return i2c_adapter_write_helper(ia, addr, buff, len, true);
 }
+
+int i2c_adapter_comb(struct i2c_adapter *ia, unsigned addr,
+		enum i2c_op op0, uint8_t *buff0, unsigned len0,
+		enum i2c_op op1, uint8_t *buff1, unsigned len1)
+{
+	int ret;
+	switch (op0) {
+		case I2C_OP_W:
+			ret = i2c_adapter_write_helper(ia, addr, buff0, len0, false);
+			break;
+		case I2C_OP_R:
+			ret = i2c_adapter_read_helper(ia, addr, buff0, len0, false);
+			break;
+		default:
+			return SBI_EINVAL;
+	}
+	if (ret)
+		return ret;
+
+	if (i2c_is_10bit_address(addr))
+		addr = (addr >> 8) & 0x7f;
+	switch (op0) {
+		case I2C_OP_W:
+			ret = i2c_adapter_write_helper(ia, addr, buff0, len0, true);
+			break;
+		case I2C_OP_R:
+			ret = i2c_adapter_read_helper(ia, addr, buff0, len0, true);
+			break;
+		default:
+			return SBI_EINVAL;
+	}
+	return ret;
+}
\ No newline at end of file
diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
index 333b3fb..8e42a5d 100644
--- a/platform/generic/sifive_fu740.c
+++ b/platform/generic/sifive_fu740.c
@@ -34,6 +34,21 @@
 
 #define PMIC_CHIP_ID_DA9063		0x61
 
+static inline int da9063_read_reg(struct i2c_adapter *adap, uint8_t addr,
+	uint8_t reg, uint8_t *val)
+{
+	return i2c_adapter_comb(adap, addr, I2C_OP_W, &reg, 1, I2C_OP_R, val, 1);
+}
+
+static inline int da9063_write_reg(struct i2c_adapter *adap, uint8_t addr,
+	uint8_t reg, uint8_t val)
+{
+	uint8_t buff[2];
+	buff[0] = reg;
+	buff[1] = val;
+	return i2c_adapter_write(adap, addr, buff, 2);
+}
+
 static struct {
 	struct i2c_adapter *adapter;
 	uint32_t reg;
@@ -55,13 +70,13 @@ static int da9063_system_reset_check(u32 type, u32 reason)
 static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 {
 	uint8_t val;
-	int rc = i2c_adapter_reg_write(adap, reg, DA9063_REG_PAGE_CON, 0x02);
+	int rc = da9063_write_reg(adap, reg, DA9063_REG_PAGE_CON, 0x02);
 
 	if (rc)
 		return rc;
 
 	/* check set page*/
-	rc = i2c_adapter_reg_read(adap, reg, 0x0, &val);
+	rc = da9063_read_reg(adap, reg, 0x0, &val);
 	if (rc)
 		return rc;
 
@@ -69,7 +84,7 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 		return SBI_ENODEV;
 
 	/* read and check device id */
-	rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_DEVICE_ID, &val);
+	rc = da9063_read_reg(adap, reg, DA9063_REG_DEVICE_ID, &val);
 	if (rc)
 		return rc;
 
@@ -81,32 +96,32 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 
 static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)
 {
-	int rc = i2c_adapter_reg_write(adap, da9063.reg,
+	int rc = da9063_write_reg(adap, da9063.reg,
 					DA9063_REG_PAGE_CON, 0x00);
 
 	if (rc)
 		return rc;
 
-	return i2c_adapter_reg_write(adap, da9063.reg,
+	return da9063_write_reg(adap, da9063.reg,
 				     DA9063_REG_CONTROL_F,
 				     DA9063_CONTROL_F_SHUTDOWN);
 }
 
 static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)
 {
-	int rc = i2c_adapter_reg_write(adap, da9063.reg,
+	int rc = da9063_write_reg(adap, da9063.reg,
 					DA9063_REG_PAGE_CON, 0x00);
 
 	if (rc)
 		return rc;
 
-	rc = i2c_adapter_reg_write(adap, da9063.reg,
+	rc = da9063_write_reg(adap, da9063.reg,
 				   DA9063_REG_CONTROL_F,
 				   DA9063_CONTROL_F_WAKEUP);
 	if (rc)
 		return rc;
 
-	return i2c_adapter_reg_write(adap, da9063.reg,
+	return da9063_write_reg(adap, da9063.reg,
 				DA9063_REG_CONTROL_A,
 				DA9063_CONTROL_A_M_POWER1_EN |
 				DA9063_CONTROL_A_M_POWER_EN |
-- 
2.30.2


