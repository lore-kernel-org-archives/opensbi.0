From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 15 Oct 2021 16:19:24 +0300
Subject: [PATCH v2 4/5] lib: utils/i2c: Add minimal SiFive I2C driver
In-Reply-To: <20211015131925.22585-1-nikita.shubin@maquefel.me>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
Message-ID: <20211015131925.22585-5-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Nikita Shubin <n.shubin@yadro.com>

Minimum SiFive I2C driver to read/send bytes over I2C bus.

This allows querying information and perform operation of onboard PMIC,
as well as power-off and reset.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
v1 -> v2:
- setreg/getreg add sifive_i2c_ prefix
- use sbi_timer_mdelay for delay
- renamed send to write
- reworked read/write to support buffers
- renamed read/write to smbus_read/smbus_write
---
 lib/utils/i2c/fdt_i2c.c        |   3 +
 lib/utils/i2c/fdt_i2c_sifive.c | 271 +++++++++++++++++++++++++++++++++
 lib/utils/i2c/objects.mk       |   1 +
 3 files changed, 275 insertions(+)
 create mode 100644 lib/utils/i2c/fdt_i2c_sifive.c

diff --git a/lib/utils/i2c/fdt_i2c.c b/lib/utils/i2c/fdt_i2c.c
index fce6d73..bbf9df6 100644
--- a/lib/utils/i2c/fdt_i2c.c
+++ b/lib/utils/i2c/fdt_i2c.c
@@ -18,7 +18,10 @@
 
 #include <sbi/sbi_console.h>
 
+extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
+
 static struct fdt_i2c_adapter *i2c_adapter_drivers[] = {
+	&fdt_i2c_adapter_sifive
 };
 
 static struct fdt_i2c_adapter
diff --git a/lib/utils/i2c/fdt_i2c_sifive.c b/lib/utils/i2c/fdt_i2c_sifive.c
new file mode 100644
index 0000000..aeb67ee
--- /dev/null
+++ b/lib/utils/i2c/fdt_i2c_sifive.c
@@ -0,0 +1,271 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 YADRO
+ *
+ * Authors:
+ *   Nikita Shubin <nshubin@yadro.com>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/i2c/fdt_i2c.h>
+
+#define SIFIVE_I2C_ADAPTER_MAX	2
+
+#define SIFIVE_I2C_PRELO	0x00
+#define SIFIVE_I2C_PREHI	0x04
+#define SIFIVE_I2C_CTR		0x08
+#define SIFIVE_I2C_TXR		0x00c
+#define SIFIVE_I2C_RXR		SIFIVE_I2C_TXR
+#define SIFIVE_I2C_CR		0x010
+#define SIFIVE_I2C_SR		SIFIVE_I2C_CR
+
+#define SIFIVE_I2C_CTR_IEN	(1 << 6)
+#define SIFIVE_I2C_CTR_EN	(1 << 7)
+
+#define SIFIVE_I2C_CMD_IACK	(1 << 0)
+#define SIFIVE_I2C_CMD_ACK	(1 << 3)
+#define SIFIVE_I2C_CMD_WR	(1 << 4)
+#define SIFIVE_I2C_CMD_RD	(1 << 5)
+#define SIFIVE_I2C_CMD_STO	(1 << 6)
+#define SIFIVE_I2C_CMD_STA	(1 << 7)
+
+#define SIFIVE_I2C_STATUS_IF	(1 << 0)
+#define SIFIVE_I2C_STATUS_TIP	(1 << 1)
+#define SIFIVE_I2C_STATUS_AL	(1 << 5)
+#define SIFIVE_I2C_STATUS_BUSY	(1 << 6)
+#define SIFIVE_I2C_STATUS_RXACK	(1 << 7)
+
+#define SIFIVE_I2C_WRITE_BIT	(0 << 0)
+#define SIFIVE_I2C_READ_BIT	(1 << 0)
+
+struct sifive_i2c_adapter {
+	unsigned long addr;
+	struct i2c_adapter adapter;
+};
+
+static unsigned int sifive_i2c_adapter_count;
+static struct sifive_i2c_adapter sifive_i2c_adapter_array[SIFIVE_I2C_ADAPTER_MAX];
+
+extern struct fdt_i2c_adapter fdt_i2c_adapter_sifive;
+
+static inline void sifive_i2c_setreg(struct sifive_i2c_adapter *adap,
+				     int reg, u8 value)
+{
+	writel(value, (volatile void *)adap->addr + reg);
+}
+
+static inline u8 sifive_i2c_getreg(struct sifive_i2c_adapter *adap, int reg)
+{
+	return readl((volatile void *)adap->addr + reg);
+}
+
+static int sifive_i2c_adapter_rxack(struct sifive_i2c_adapter *adap)
+{
+	uint8_t val = sifive_i2c_getreg(adap, SIFIVE_I2C_SR);
+
+	if (val & SIFIVE_I2C_STATUS_RXACK)
+		return SBI_EIO;
+
+	return 0;
+}
+
+static int sifive_i2c_adapter_poll(struct sifive_i2c_adapter *adap, uint32_t mask)
+{
+	int max_retry = 5;
+	uint8_t val;
+
+	do {
+		val = sifive_i2c_getreg(adap, SIFIVE_I2C_SR);
+		sbi_timer_mdelay(100);
+	} while ((val & mask) && (max_retry--) > 0);
+
+	if (max_retry <= 0)
+		return SBI_ETIMEDOUT;
+
+	return 0;
+}
+
+#define sifive_i2c_adapter_poll_tip(adap) sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_TIP)
+#define sifive_i2c_adapter_poll_busy(adap) sifive_i2c_adapter_poll(adap, SIFIVE_I2C_STATUS_BUSY)
+
+static int sifive_i2c_adapter_start(struct sifive_i2c_adapter *adap, uint8_t addr, uint8_t bit)
+{
+	uint8_t val = (addr << 1) | bit;
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, val);
+	val = SIFIVE_I2C_CMD_STA | SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK;
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, val);
+
+	return sifive_i2c_adapter_poll_tip(adap);
+}
+
+static int sifive_i2c_adapter_smbus_write(struct i2c_adapter *ia,
+					uint8_t addr, uint8_t reg,
+					uint8_t *buffer, int len)
+{
+	struct sifive_i2c_adapter *adap =
+		container_of(ia, struct sifive_i2c_adapter, adapter);
+	int rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
+
+	if (rc)
+		return rc;
+
+	rc = sifive_i2c_adapter_rxack(adap);
+	if (rc)
+		return rc;
+
+	/* set register address */
+	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
+	rc = sifive_i2c_adapter_poll_tip(adap);
+	if (rc)
+		return rc;
+
+	rc = sifive_i2c_adapter_rxack(adap);
+	if (rc)
+		return rc;
+
+	/* set value */
+	while (len) {
+		sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, *buffer);
+		sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
+
+		rc = sifive_i2c_adapter_poll_tip(adap);
+		if (rc)
+			return rc;
+
+		rc = sifive_i2c_adapter_rxack(adap);
+		if (rc)
+			return rc;
+
+		buffer++;
+		len--;
+	}
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
+
+	/* poll BUSY instead of ACK*/
+	rc = sifive_i2c_adapter_poll_busy(adap);
+	if (rc)
+		return rc;
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
+
+	return 0;
+}
+
+static int sifive_i2c_adapter_smbus_read(struct i2c_adapter *ia,
+					uint8_t addr, uint8_t reg,
+					uint8_t *buffer, int len)
+{
+	struct sifive_i2c_adapter *adap =
+		container_of(ia, struct sifive_i2c_adapter, adapter);
+	int rc;
+
+	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_WRITE_BIT);
+	if (rc)
+		return rc;
+
+	rc = sifive_i2c_adapter_rxack(adap);
+	if (rc)
+		return rc;
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_TXR, reg);
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_WR | SIFIVE_I2C_CMD_IACK);
+
+	rc = sifive_i2c_adapter_poll_tip(adap);
+	if (rc)
+		return rc;
+
+	rc = sifive_i2c_adapter_rxack(adap);
+	if (rc)
+		return rc;
+
+	/* setting addr with high 0 bit */
+	rc = sifive_i2c_adapter_start(adap, addr, SIFIVE_I2C_READ_BIT);
+	if (rc)
+		return rc;
+
+	rc = sifive_i2c_adapter_rxack(adap);
+	if (rc)
+		return rc;
+
+	while (len) {
+		if (len == 1)
+			sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_ACK | SIFIVE_I2C_CMD_RD | SIFIVE_I2C_CMD_IACK);
+		else
+			sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_RD | SIFIVE_I2C_CMD_IACK);
+
+		rc = sifive_i2c_adapter_poll_tip(adap);
+		if (rc)
+			return rc;
+
+		*buffer = sifive_i2c_getreg(adap, SIFIVE_I2C_RXR);
+		buffer++;
+		len--;
+	}
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_STO | SIFIVE_I2C_CMD_IACK);
+	rc = sifive_i2c_adapter_poll_busy(adap);
+	if (rc)
+		return rc;
+
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CR, SIFIVE_I2C_CMD_IACK);
+
+	return 0;
+}
+
+static int sifive_i2c_adapter_configure(struct i2c_adapter *ia)
+{
+	struct sifive_i2c_adapter *adap =
+		container_of(ia, struct sifive_i2c_adapter, adapter);
+
+	/* enable controller/disable interrupts */
+	sifive_i2c_setreg(adap, SIFIVE_I2C_CTR, SIFIVE_I2C_CTR_EN);
+
+	return 0;
+}
+
+static int sifive_i2c_init(void *fdt, int nodeoff,
+			    const struct fdt_match *match)
+{
+	int rc;
+	struct sifive_i2c_adapter *adapter;
+	uint64_t addr;
+
+	if (sifive_i2c_adapter_count >= SIFIVE_I2C_ADAPTER_MAX)
+		return SBI_ENOSPC;
+
+	adapter = &sifive_i2c_adapter_array[sifive_i2c_adapter_count];
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		return rc;
+
+	adapter->addr = addr;
+	adapter->adapter.driver = &fdt_i2c_adapter_sifive;
+	adapter->adapter.id = nodeoff;
+	adapter->adapter.smbus_write = sifive_i2c_adapter_smbus_write;
+	adapter->adapter.smbus_read = sifive_i2c_adapter_smbus_read;
+	adapter->adapter.configure = sifive_i2c_adapter_configure;
+	rc = i2c_adapter_add(&adapter->adapter);
+	if (rc)
+		return rc;
+
+	sifive_i2c_adapter_count++;
+	return 0;
+}
+
+static const struct fdt_match sifive_i2c_match[] = {
+	{ .compatible = "sifive,i2c0" },
+	{ },
+};
+
+struct fdt_i2c_adapter fdt_i2c_adapter_sifive = {
+	.match_table = sifive_i2c_match,
+	.init = sifive_i2c_init,
+};
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index 06baa65..d52ab18 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -9,3 +9,4 @@
 
 libsbiutils-objs-y += i2c/i2c.o
 libsbiutils-objs-y += i2c/fdt_i2c.o
+libsbiutils-objs-y += i2c/fdt_i2c_sifive.o
-- 
2.31.1


