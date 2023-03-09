From: Minda Chen <minda.chen@starfivetech.com>
Date: Thu, 9 Mar 2023 14:19:58 +0800
Subject: [PATCH v3 1/2] lib: utils/i2c: Add minimal StarFive jh7110 I2C driver
In-Reply-To: <20230309061959.10916-1-minda.chen@starfivetech.com>
References: <20230309061959.10916-1-minda.chen@starfivetech.com>
Message-ID: <20230309061959.10916-2-minda.chen@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Starfive JH7110 I2C IP is synopsys designware.
Minimum StarFIve I2C driver to read/send bytes over I2C bus.

This allows querying information and perform operation of onboard PMIC,
as well as power-off and reset.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/i2c/dw_i2c.h |  21 ++++
 lib/utils/i2c/Kconfig          |   8 ++
 lib/utils/i2c/dw_i2c.c         | 190 +++++++++++++++++++++++++++++++++
 lib/utils/i2c/fdt_i2c_dw.c     |  62 +++++++++++
 lib/utils/i2c/objects.mk       |   5 +
 5 files changed, 286 insertions(+)
 create mode 100644 include/sbi_utils/i2c/dw_i2c.h
 create mode 100644 lib/utils/i2c/dw_i2c.c
 create mode 100644 lib/utils/i2c/fdt_i2c_dw.c

diff --git a/include/sbi_utils/i2c/dw_i2c.h b/include/sbi_utils/i2c/dw_i2c.h
new file mode 100644
index 0000000..88703e0
--- /dev/null
+++ b/include/sbi_utils/i2c/dw_i2c.h
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Minda Chen <minda.chen@starfivetech.com>
+ */
+
+#ifndef __DW_I2C_H__
+#define __DW_I2C_H__
+
+#include <sbi_utils/i2c/i2c.h>
+
+int dw_i2c_init(struct i2c_adapter *, int nodeoff);
+
+struct dw_i2c_adapter {
+	unsigned long addr;
+	struct i2c_adapter adapter;
+};
+
+#endif
diff --git a/lib/utils/i2c/Kconfig b/lib/utils/i2c/Kconfig
index 46a3454..7fa32fc 100644
--- a/lib/utils/i2c/Kconfig
+++ b/lib/utils/i2c/Kconfig
@@ -14,8 +14,16 @@ config FDT_I2C_SIFIVE
 	bool "SiFive I2C FDT driver"
 	default n
 
+config FDT_I2C_DW
+	bool "Synopsys Designware I2C FDT driver"
+	select I2C_DW
+	default n
 endif
 
+config I2C_DW
+	bool "Synopsys Designware I2C support"
+	default n
+
 config I2C
 	bool "I2C support"
 	default n
diff --git a/lib/utils/i2c/dw_i2c.c b/lib/utils/i2c/dw_i2c.c
new file mode 100644
index 0000000..e2ffc71
--- /dev/null
+++ b/lib/utils/i2c/dw_i2c.c
@@ -0,0 +1,190 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 starfivetech.com
+ *
+ * Authors:
+ *   Minda Chen <minda.chen@starfivetech.com>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_timer.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi_utils/i2c/dw_i2c.h>
+
+#define DW_IC_CON		0x00
+#define DW_IC_TAR		0x04
+#define DW_IC_SAR		0x08
+#define DW_IC_DATA_CMD		0x10
+#define DW_IC_SS_SCL_HCNT	0x14
+#define DW_IC_SS_SCL_LCNT	0x18
+#define DW_IC_FS_SCL_HCNT	0x1c
+#define DW_IC_FS_SCL_LCNT	0x20
+#define DW_IC_HS_SCL_HCNT	0x24
+#define DW_IC_HS_SCL_LCNT	0x28
+#define DW_IC_INTR_STAT		0x2c
+#define DW_IC_INTR_MASK		0x30
+#define DW_IC_RAW_INTR_STAT	0x34
+#define DW_IC_RX_TL		0x38
+#define DW_IC_TX_TL		0x3c
+#define DW_IC_CLR_INTR		0x40
+#define DW_IC_CLR_RX_UNDER	0x44
+#define DW_IC_CLR_RX_OVER	0x48
+#define DW_IC_CLR_TX_OVER	0x4c
+#define DW_IC_CLR_RD_REQ	0x50
+#define DW_IC_CLR_TX_ABRT	0x54
+#define DW_IC_CLR_RX_DONE	0x58
+#define DW_IC_CLR_ACTIVITY	0x5c
+#define DW_IC_CLR_STOP_DET	0x60
+#define DW_IC_CLR_START_DET	0x64
+#define DW_IC_CLR_GEN_CALL	0x68
+#define DW_IC_ENABLE		0x6c
+#define DW_IC_STATUS		0x70
+#define DW_IC_TXFLR		0x74
+#define DW_IC_RXFLR		0x78
+#define DW_IC_SDA_HOLD		0x7c
+#define DW_IC_TX_ABRT_SOURCE	0x80
+#define DW_IC_ENABLE_STATUS	0x9c
+#define DW_IC_CLR_RESTART_DET	0xa8
+#define DW_IC_COMP_PARAM_1	0xf4
+#define DW_IC_COMP_VERSION	0xf8
+
+#define DW_I2C_STATUS_TXFIFO_EMPTY	BIT(2)
+#define DW_I2C_STATUS_RXFIFO_NOT_EMPTY	BIT(3)
+
+#define IC_DATA_CMD_READ	BIT(8)
+#define IC_DATA_CMD_STOP	BIT(9)
+#define IC_DATA_CMD_RESTART	BIT(10)
+#define IC_INT_STATUS_STOPDET	BIT(9)
+
+static inline void dw_i2c_setreg(struct dw_i2c_adapter *adap,
+				 u8 reg, u32 value)
+{
+	writel(value, (void *)adap->addr + reg);
+}
+
+static inline u32 dw_i2c_getreg(struct dw_i2c_adapter *adap,
+				u32 reg)
+{
+	return readl((void *)adap->addr + reg);
+}
+
+static int dw_i2c_adapter_poll(struct dw_i2c_adapter *adap,
+			       u32 mask, u32 addr,
+			       bool inverted)
+{
+	unsigned int timeout = 10; /* msec */
+	int count = 0;
+	u32 val;
+
+	do {
+		val = dw_i2c_getreg(adap, addr);
+		if (inverted) {
+			if (!(val & mask))
+				return 0;
+		} else {
+			if (val & mask)
+				return 0;
+		}
+		sbi_timer_udelay(2);
+		count += 1;
+		if (count == (timeout * 1000))
+			return SBI_ETIMEDOUT;
+	} while (1);
+}
+
+#define dw_i2c_adapter_poll_rxrdy(adap)	\
+	dw_i2c_adapter_poll(adap, DW_I2C_STATUS_RXFIFO_NOT_EMPTY, DW_IC_STATUS, 0)
+#define dw_i2c_adapter_poll_txfifo_ready(adap)	\
+	dw_i2c_adapter_poll(adap, DW_I2C_STATUS_TXFIFO_EMPTY, DW_IC_STATUS, 0)
+
+static int dw_i2c_write_addr(struct dw_i2c_adapter *adap, u8 addr)
+{
+	dw_i2c_setreg(adap, DW_IC_ENABLE, 0);
+	dw_i2c_setreg(adap, DW_IC_TAR, addr);
+	dw_i2c_setreg(adap, DW_IC_ENABLE, 1);
+
+	return 0;
+}
+
+static int dw_i2c_adapter_read(struct i2c_adapter *ia, u8 addr,
+			       u8 reg, u8 *buffer, int len)
+{
+	struct dw_i2c_adapter *adap =
+		container_of(ia, struct dw_i2c_adapter, adapter);
+	int rc;
+
+	dw_i2c_write_addr(adap, addr);
+
+	rc = dw_i2c_adapter_poll_txfifo_ready(adap);
+	if (rc)
+		return rc;
+
+	/* set register address */
+	dw_i2c_setreg(adap, DW_IC_DATA_CMD, reg);
+
+	/* set value */
+	while (len) {
+		if (len == 1)
+			dw_i2c_setreg(adap, DW_IC_DATA_CMD,
+				      IC_DATA_CMD_READ | IC_DATA_CMD_STOP);
+		else
+			dw_i2c_setreg(adap, DW_IC_DATA_CMD, IC_DATA_CMD_READ);
+
+		rc = dw_i2c_adapter_poll_rxrdy(adap);
+		if (rc)
+			return rc;
+
+		*buffer = dw_i2c_getreg(adap, DW_IC_DATA_CMD) & 0xff;
+		buffer++;
+		len--;
+	}
+
+	return 0;
+}
+
+static int dw_i2c_adapter_write(struct i2c_adapter *ia, u8 addr,
+				u8 reg, u8 *buffer, int len)
+{
+	struct dw_i2c_adapter *adap =
+		container_of(ia, struct dw_i2c_adapter, adapter);
+	int rc;
+
+	dw_i2c_write_addr(adap, addr);
+
+	rc = dw_i2c_adapter_poll_txfifo_ready(adap);
+	if (rc)
+		return rc;
+
+	/* set register address */
+	dw_i2c_setreg(adap, DW_IC_DATA_CMD, reg);
+
+	while (len) {
+		rc = dw_i2c_adapter_poll_txfifo_ready(adap);
+		if (rc)
+			return rc;
+
+		if (len == 1)
+			dw_i2c_setreg(adap, DW_IC_DATA_CMD, *buffer | IC_DATA_CMD_STOP);
+		else
+			dw_i2c_setreg(adap, DW_IC_DATA_CMD, *buffer);
+
+		buffer++;
+		len--;
+	}
+	rc = dw_i2c_adapter_poll_txfifo_ready(adap);
+
+	return rc;
+}
+
+int dw_i2c_init(struct i2c_adapter *adapter, int nodeoff)
+{
+	adapter->id = nodeoff;
+	adapter->write = dw_i2c_adapter_write;
+	adapter->read = dw_i2c_adapter_read;
+
+	return i2c_adapter_add(adapter);
+}
diff --git a/lib/utils/i2c/fdt_i2c_dw.c b/lib/utils/i2c/fdt_i2c_dw.c
new file mode 100644
index 0000000..71062f4
--- /dev/null
+++ b/lib/utils/i2c/fdt_i2c_dw.c
@@ -0,0 +1,62 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 starfivetech.com
+ *
+ * Authors:
+ *   Minda Chen <minda.chen@starfivetech.com>
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/i2c/dw_i2c.h>
+#include <sbi_utils/i2c/fdt_i2c.h>
+
+#define FDT_DW_I2C_ADAPTER_MAX	7
+
+static unsigned int fdt_dw_i2c_adapter_count;
+static struct dw_i2c_adapter
+	fdt_dw_i2c_adapter_array[FDT_DW_I2C_ADAPTER_MAX];
+
+extern struct fdt_i2c_adapter fdt_i2c_adapter_dw;
+
+static int fdt_dw_i2c_init(void *fdt, int nodeoff,
+			     const struct fdt_match *match)
+{
+	int rc;
+	struct dw_i2c_adapter *adapter;
+	u64 addr;
+
+	if (fdt_dw_i2c_adapter_count >= FDT_DW_I2C_ADAPTER_MAX)
+		return SBI_ENOSPC;
+
+	adapter = &fdt_dw_i2c_adapter_array[fdt_dw_i2c_adapter_count];
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
+	if (rc)
+		return rc;
+
+	adapter->addr = addr;
+	adapter->adapter.driver = &fdt_i2c_adapter_dw;
+
+	rc = dw_i2c_init(&adapter->adapter, nodeoff);
+	if (rc)
+		return rc;
+
+	fdt_dw_i2c_adapter_count++;
+
+	return 0;
+}
+
+static const struct fdt_match fdt_dw_i2c_match[] = {
+	{ .compatible = "snps,designware-i2c" },
+	{ .compatible = "starfive,jh7110-i2c" },
+	{ },
+};
+
+struct fdt_i2c_adapter fdt_i2c_adapter_dw = {
+	.match_table = fdt_dw_i2c_match,
+	.init = fdt_dw_i2c_init,
+};
diff --git a/lib/utils/i2c/objects.mk b/lib/utils/i2c/objects.mk
index a0fbbb5..5f7a79f 100644
--- a/lib/utils/i2c/objects.mk
+++ b/lib/utils/i2c/objects.mk
@@ -14,3 +14,8 @@ libsbiutils-objs-$(CONFIG_FDT_I2C) += i2c/fdt_i2c_adapter_drivers.o
 
 carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_SIFIVE) += fdt_i2c_adapter_sifive
 libsbiutils-objs-$(CONFIG_FDT_I2C_SIFIVE) += i2c/fdt_i2c_sifive.o
+
+carray-fdt_i2c_adapter_drivers-$(CONFIG_FDT_I2C_DW) += fdt_i2c_adapter_dw
+libsbiutils-objs-$(CONFIG_FDT_I2C_DW) += i2c/fdt_i2c_dw.o
+
+libsbiutils-objs-$(CONFIG_I2C_DW) += i2c/dw_i2c.o
-- 
2.17.1


