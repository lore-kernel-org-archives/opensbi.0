From: Xiang W <wxjstz@126.com>
Date: Tue, 11 Jan 2022 00:00:19 +0800
Subject: [PATCH V3] lib: utils/i2c: update i2c interface
Message-ID: <20220110160019.243070-1-wxjstz@126.com>
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
Changes since v2:

In the 10-bit address mode, the addresses sent by repeated START and
START are different, so a new flag I2C_M_RSTART is introduced. And
change the old I2C_M_NOSTART to I2C_M_START.

Not all adapters can implement 8bit read and write operations, so add
interfaces to allow the lower layer to implement i2c transmission.

Add support for I2C_M_RECV_LEN, which needs to be used when smbus
block read

 include/sbi_utils/i2c/i2c.h     |  99 +++++++++++++++--------
 lib/utils/i2c/fdt_i2c_sifive.c  | 137 +++++++-------------------------
 lib/utils/i2c/i2c.c             | 106 +++++++++++++++++++++---
 platform/generic/sifive_fu740.c |  74 +++++++++++++++--
 4 files changed, 252 insertions(+), 164 deletions(-)

diff --git a/include/sbi_utils/i2c/i2c.h b/include/sbi_utils/i2c/i2c.h
index 5a70364..5edd0d1 100644
--- a/include/sbi_utils/i2c/i2c.h
+++ b/include/sbi_utils/i2c/i2c.h
@@ -13,6 +13,36 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_list.h>
 
+struct i2c_msg {
+	uint16_t addr;
+	uint16_t flags;
+
+/* standard i2c flags, the adapter needs to support all, I2C_M_TEN can choose to support */
+#define I2C_M_RD		0x0001 /* set this flag to read, otherwise write */
+#define I2C_M_START		0x0002 /* START before this message */
+#define I2C_M_RSTART		0x0004 /* send repeated START befor message */
+#define I2C_M_STOP		0x0008 /* send stop after this message */
+#define I2C_M_TEN		0x0010 /* 10 bit address */
+/* non-standard i2c flags, adapter does not necessarily support  */
+#define I2C_M_RECV_LEN		0x0400 /* length is first received byte */
+#define I2C_M_NO_RD_ACK		0x0800 /* skip the Ack bit on reads */
+#define I2C_M_IGNORE_NAK	0x1000 /* continue after NAK */
+#define I2C_M_REV_DIR_ADDR	0x2000 /* invert polarity of R/W bit */
+
+#define I2C_SIMPLE_SUPPORTED_FLAGS \
+	(I2C_M_RD \
+	| I2C_M_START \
+	| I2C_M_RSTART \
+	| I2C_M_STOP \
+	| I2C_M_TEN \
+	| I2C_M_RECV_LEN)
+
+	uint16_t len;
+	uint8_t *buf;
+};
+
+
+
 /** Representation of a I2C adapter */
 struct i2c_adapter {
 	/** Pointer to I2C driver owning this I2C adapter */
@@ -22,20 +52,41 @@ struct i2c_adapter {
 	int id;
 
 	/**
-	 * Send buffer to given address, register
+	 * The flags supported by the adapter
 	 *
-	 * @return 0 on success and negative error code on failure
-	 */
-	int (*write)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		    uint8_t *buffer, int len);
+	 * if the device supports write_byte/read_byte will support
+	 * I2C_SIMPLE_SUPPORTED_FLAGS
+	 * */
+	uint16_t supported_flags;
+
+	/**
+	 * Send 8 bits
+	 * can send a START condition before
+	 * can send a STOP condition at the end
+	 *
+	 * can be used to send addresses and data
+	 *
+	 * Not all adapters can implement this method
+	 * */
+	int (*write_byte)(struct i2c_adapter *ia, uint8_t byte,
+			bool send_start, bool send_stop);
+
+	/**
+	 * receive 8 bits
+	 * can respond with ack or nack after receiving
+	 * A stop can be sent after ack or nack
+	 * */
+	int (*read_byte)(struct i2c_adapter *ia, uint8_t *byte,
+			bool nak, bool send_stop);
 
 	/**
-	 * Read buffer from given address, register
+	 * i2c transfer
 	 *
-	 * @return 0 on success and negative error code on failure
-	 */
-	int (*read)(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		    uint8_t *buffer, int len);
+	 * If need to support flags other than I2C_SIMPLE_SUPPORTED_FLAGS,
+	 * need to implement this method
+	*/
+	int (*transfer)(struct i2c_adapter *ia,
+			struct i2c_msg *msgs, int msg_num);
 
 	/** List */
 	struct sbi_dlist node;
@@ -55,31 +106,9 @@ int i2c_adapter_add(struct i2c_adapter *ia);
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
+/** i2c transfer, transfer multiple i2c_msg */
+int i2c_adapter_transfer(struct i2c_adapter *ia,
+		struct i2c_msg *msgs, int msg_num);
 
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
 
 #endif
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
index 871241a..bc1e0f7 100644
--- a/lib/utils/i2c/fdt_i2c_sifive.c
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -101,139 +101,59 @@ static int sifive_i2c_adapter_poll(struct sifive_i2c_adapter *adap,
 #define sifive_i2c_adapter_poll_busy(adap)	\
 sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_BUSY)
 
-static int sifive_i2c_adapter_start(struct sifive_i2c_adapter *adap,
-				    uint8_t addr, uint8_t bit)
-{
-	uint8_t val = (addr << 1) | bit;
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, val);
-	val = SIFIVE_I2C_CMD_STA | SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
-
-	return sifive_i2c_adapter_poll_tip(adap);
-}
-
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
+	int rc;
+	uint8_t val;
+	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, byte);
+	val = SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
+	if (send_start)
+		val |= SIFIVE_I2C_CMD_STA;
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
 	rc = sifive_i2c_adapter_poll_tip(adap);
 	if (rc)
 		return rc;
-
 	rc = sifive_i2c_adapter_rxack(adap);
 	if (rc)
 		return rc;
 
-	/* set value */
-	while (len) {
-		sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, *buffer);
-		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR |
-						       SIFIVE_I2C_CMD_IACK);
-
-		rc = sifive_i2c_adapter_poll_tip(adap);
-		if (rc)
-			return rc;
-
-		rc = sifive_i2c_adapter_rxack(adap);
+	if (send_stop) {
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
+			SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
+		rc = sifive_i2c_adapter_poll_busy(adap);
 		if (rc)
 			return rc;
-
-		buffer++;
-		len--;
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
 	}
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO |
-					       SIFIVE_I2C_CMD_IACK);
-
-	/* poll BUSY instead of ACK*/
-	rc = sifive_i2c_adapter_poll_busy(adap);
-	if (rc)
-		return rc;
-
-	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
-
 	return 0;
 }
 
-static int sifive_i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr,
-				   uint8_t reg, uint8_t *buffer, int len)
+static int sifive_i2c_adapter_read_byte(struct i2c_adapter *ia,
+				uint8_t *byte, bool nak, bool send_stop)
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
+	uint8_t val = SIFIVE_I2C_CMD_RD | SIFIVE_I2C_CMD_IACK;
+	if (nak)
+		val |= SIFIVE_I2C_CMD_ACK;
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
 	rc = sifive_i2c_adapter_poll_tip(adap);
 	if (rc)
 		return rc;
+	*byte = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
 
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
-
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
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR,
+			SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
+		rc = sifive_i2c_adapter_poll_busy(adap);
 		if (rc)
 			return rc;
-
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
 
@@ -256,8 +176,9 @@ static int sifive_i2c_init(void *fdt, int nodeoff,
 	adapter->addr = addr;
 	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
 	adapter->adapter.id = nodeoff;
-	adapter->adapter.write = sifive_i2c_adapter_write;
-	adapter->adapter.read = sifive_i2c_adapter_read;
+	adapter->adapter.supported_flags = I2C_SIMPLE_SUPPORTED_FLAGS;
+	adapter->adapter.write_byte = sifive_i2c_adapter_write_byte;
+	adapter->adapter.read_byte = sifive_i2c_adapter_read_byte;
 	rc = i2c_adapter_add(&adapter->adapter);
 	if (rc)
 		return rc;
diff --git a/lib/utils/i2c/i2c.c b/lib/utils/i2c/i2c.c
index 6be4e24..49fb32a 100644
--- a/lib/utils/i2c/i2c.c
+++ b/lib/utils/i2c/i2c.c
@@ -12,6 +12,7 @@
  */
 
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
 #include <sbi_utils/i2c/i2c.h>
 
 static SBI_LIST_HEAD(i2c_adapters_list);
@@ -51,25 +52,104 @@ void i2c_adapter_remove(struct i2c_adapter *ia)
 	sbi_list_del(&(ia->node));
 }
 
-int i2c_adapter_write(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		     uint8_t *buffer, int len)
+static int i2c_adapter_simple_transfer(struct i2c_adapter *ia, struct i2c_msg *msg)
 {
-	if (!ia)
+	int rc;
+	int ten = msg->flags & I2C_M_TEN;
+	int rd = msg->flags & I2C_M_RD;
+	int start = msg->flags & I2C_M_START;
+	int repeated_start = msg->flags & I2C_M_RSTART;
+	int stop = msg->flags & I2C_M_STOP;
+	int recv_len = msg->flags & I2C_M_RECV_LEN;
+	uint16_t len;
+	uint8_t * buf = msg->buf;
+
+	if (start && repeated_start)
+		return SBI_EINVAL;
+
+	if (!rd && recv_len)
 		return SBI_EINVAL;
-	if (!ia->write)
-		return SBI_ENOSYS;
 
-	return ia->write(ia, addr, reg, buffer, len);
+	if (ten) {
+		uint8_t addr_h = ((msg->addr >> 8) & 3) | 0x7c;
+		uint8_t addr_l = msg->addr & 0xff;
+		if (start) {
+			rc = ia->write_byte(ia, (addr_h << 1) | 0, true, false);
+			if (rc)
+				return rc;
+			rc = ia->write_byte(ia, addr_l, false, false);
+			if (rc)
+				return rc;
+		}
+		if (repeated_start || (start && rd)) {
+			rc = ia->write_byte(ia, (addr_h << 1) | rd, true, false);
+			if (rc)
+				return rc;
+		}
+	} else {
+		uint8_t addr = msg->addr;
+		if (start || repeated_start) {
+			rc = ia->write_byte(ia, (addr << 1) | rd, true, false);
+			if (rc)
+				return rc;
+		}
+	}
+
+	if (recv_len) {
+		uint8_t rlen;
+		rc = ia->read_byte(ia, &rlen, false, false);
+		if (rc)
+			return rc;
+		msg->len = rlen;
+	}
+
+	len = msg->len;
+
+	while (len-- > 0) {
+		bool last = len == 0;
+		bool send_stop = last && stop;
+		if (rd)
+			rc = ia->read_byte(ia, buf, last, send_stop);
+		else
+			rc = ia->write_byte(ia, *buf, false, send_stop);
+		if (rc)
+			return rc;
+		buf++;
+	}
+	return 0;
 }
 
+static int i2c_adapter_flags_checker(struct i2c_adapter *ia,
+		struct i2c_msg *msgs, int msg_num)
+{
+	uint16_t flags = 0;
+	while (msg_num-- > 0) {
+		flags |= msgs->flags;
+		msgs++;
+	}
+	return (ia->supported_flags | flags) != ia->supported_flags;
+}
 
-int i2c_adapter_read(struct i2c_adapter *ia, uint8_t addr, uint8_t reg,
-		     uint8_t *buffer, int len)
+int i2c_adapter_transfer(struct i2c_adapter *ia,
+		struct i2c_msg *msgs, int msg_num)
 {
-	if (!ia)
-		return SBI_EINVAL;
-	if (!ia->read)
-		return SBI_ENOSYS;
+	int rc;
+
+	if (i2c_adapter_flags_checker(ia, msgs, msg_num))
+		return SBI_ENOTSUPP;
+
+	if (ia->transfer)
+		return ia->transfer(ia, msgs, msg_num);
+
+	if (ia->read_byte && ia->write_byte) {
+		while (msg_num-- > 0) {
+			rc = i2c_adapter_simple_transfer(ia, msgs);
+			if (rc)
+				return rc;
+			msgs++;
+		}
+		return 0;
+	}
 
-	return ia->read(ia, addr, reg, buffer, len);
+	return SBI_ENOTSUPP;
 }
diff --git a/platform/generic/sifive_fu740.c b/platform/generic/sifive_fu740.c
index 333b3fb..cf303a4 100644
--- a/platform/generic/sifive_fu740.c
+++ b/platform/generic/sifive_fu740.c
@@ -22,6 +22,7 @@
 
 #define DA9063_REG_PAGE_CON		0x00
 #define DA9063_REG_CONTROL_A		0x0e
+#define DA9063_REG_CONTROL_D		0x11
 #define DA9063_REG_CONTROL_F		0x13
 #define DA9063_REG_DEVICE_ID		0x81
 
@@ -29,11 +30,49 @@
 #define DA9063_CONTROL_A_M_POWER_EN	(1 << 5)
 #define DA9063_CONTROL_A_STANDBY	(1 << 3)
 
+#define DA9063_CONTROL_D_TWDSCALE_MASK	0x07
+
 #define DA9063_CONTROL_F_WAKEUP	(1 << 2)
 #define DA9063_CONTROL_F_SHUTDOWN	(1 << 1)
 
 #define PMIC_CHIP_ID_DA9063		0x61
 
+static inline int da9063_read_reg(struct i2c_adapter *adap, uint8_t addr,
+	uint8_t reg, uint8_t *val)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = addr,
+			.flags = I2C_M_START,
+			.len = 1,
+			.buf = &reg
+		},{
+			.addr = addr,
+			.flags = I2C_M_RD | I2C_M_RSTART |I2C_M_STOP,
+			.len = 1,
+			.buf = val
+		}
+	};
+	return i2c_adapter_transfer(adap, msgs, array_size(msgs));
+}
+
+static inline int da9063_write_reg(struct i2c_adapter *adap, uint8_t addr,
+	uint8_t reg, uint8_t val)
+{
+	uint8_t buff[2];
+	buff[0] = reg;
+	buff[1] = val;
+	struct i2c_msg msgs[] = {
+		{
+			.addr = addr,
+			.flags = I2C_M_START |I2C_M_STOP,
+			.len = sizeof(buff),
+			.buf = buff
+		}
+	};
+	return i2c_adapter_transfer(adap, msgs, array_size(msgs));
+}
+
 static struct {
 	struct i2c_adapter *adapter;
 	uint32_t reg;
@@ -55,13 +94,13 @@ static int da9063_system_reset_check(u32 type, u32 reason)
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
 
@@ -69,7 +108,7 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 		return SBI_ENODEV;
 
 	/* read and check device id */
-	rc = i2c_adapter_reg_read(adap, reg, DA9063_REG_DEVICE_ID, &val);
+	rc = da9063_read_reg(adap, reg, DA9063_REG_DEVICE_ID, &val);
 	if (rc)
 		return rc;
 
@@ -79,34 +118,52 @@ static inline int da9063_sanity_check(struct i2c_adapter *adap, uint32_t reg)
 	return 0;
 }
 
+static inline int da9063_stop_watchdog(struct i2c_adapter *adap, uint32_t reg)
+{
+	uint8_t val;
+	int rc = da9063_write_reg(adap, reg, DA9063_REG_PAGE_CON, 0x00);
+	if (rc)
+		return rc;
+
+	rc = da9063_read_reg(adap, reg, DA9063_REG_CONTROL_D, &val);
+	if (rc)
+		return rc;
+
+	if ((val & DA9063_CONTROL_D_TWDSCALE_MASK) == 0)
+		return 0;
+
+	val &= ~DA9063_CONTROL_D_TWDSCALE_MASK;
+	return da9063_write_reg(adap, reg, DA9063_REG_CONTROL_D, val);
+}
+
 static inline int da9063_shutdown(struct i2c_adapter *adap, uint32_t reg)
 {
-	int rc = i2c_adapter_reg_write(adap, da9063.reg,
+	int rc = da9063_write_reg(adap, reg,
 					DA9063_REG_PAGE_CON, 0x00);
 
 	if (rc)
 		return rc;
 
-	return i2c_adapter_reg_write(adap, da9063.reg,
+	return da9063_write_reg(adap, reg,
 				     DA9063_REG_CONTROL_F,
 				     DA9063_CONTROL_F_SHUTDOWN);
 }
 
 static inline int da9063_reset(struct i2c_adapter *adap, uint32_t reg)
 {
-	int rc = i2c_adapter_reg_write(adap, da9063.reg,
+	int rc = da9063_write_reg(adap, reg,
 					DA9063_REG_PAGE_CON, 0x00);
 
 	if (rc)
 		return rc;
 
-	rc = i2c_adapter_reg_write(adap, da9063.reg,
+	rc = da9063_write_reg(adap, reg,
 				   DA9063_REG_CONTROL_F,
 				   DA9063_CONTROL_F_WAKEUP);
 	if (rc)
 		return rc;
 
-	return i2c_adapter_reg_write(adap, da9063.reg,
+	return da9063_write_reg(adap, reg,
 				DA9063_REG_CONTROL_A,
 				DA9063_CONTROL_A_M_POWER1_EN |
 				DA9063_CONTROL_A_M_POWER_EN |
@@ -133,6 +190,7 @@ static void da9063_system_reset(u32 type, u32 reason)
 			break;
 		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
 		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+			da9063_stop_watchdog(adap, reg);
 			da9063_reset(adap, reg);
 			break;
 		}
-- 
2.30.2


