From: Bohdan Fedorov <misterjdrg@gmail.com>
Date: Sun, 12 Jun 2022 20:18:21 +0300
Subject: [PATCH 1/2] lib: utils/serial: add virtio mmio driver
Message-ID: <20220612171822.148906-1-misterjdrg@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simple virtio-console driver.
Useful for running opensbi in virtualized environments.

dt-bindings:
<linux>/Documentation/devicetree/bindings/virtio/mmio.yaml

Signed-off-by: Bohdan Fedorov <misterjdrg@gmail.com>
---
 include/sbi_utils/fdt/fdt_helper.h     |  3 +
 include/sbi_utils/serial/virtio-uart.h | 19 +++++++
 lib/utils/fdt/fdt_helper.c             | 18 ++++++
 lib/utils/serial/fdt_serial_virtio.c   | 37 +++++++++++++
 lib/utils/serial/objects.mk            |  4 ++
 lib/utils/serial/virtio-uart.c         | 76 ++++++++++++++++++++++++++
 6 files changed, 157 insertions(+)
 create mode 100644 include/sbi_utils/serial/virtio-uart.h
 create mode 100644 lib/utils/serial/fdt_serial_virtio.c
 create mode 100644 lib/utils/serial/virtio-uart.c

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index c60af35..80307bb 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -65,6 +65,9 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart);
 
+int fdt_parse_virtio_uart_node(void *fdt, int nodeoffset,
+			       struct platform_uart_data *uart);
+
 int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
 			    struct platform_uart_data *uart);
 
diff --git a/include/sbi_utils/serial/virtio-uart.h b/include/sbi_utils/serial/virtio-uart.h
new file mode 100644
index 0000000..4fdfebc
--- /dev/null
+++ b/include/sbi_utils/serial/virtio-uart.h
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Bohdan Fedorov <misterjdrg@gmail.com>
+ *
+ * Based on:
+ *   sifive-uart
+ */
+
+#ifndef __SERIAL_SIFIVE_UART_H__
+#define __SERIAL_SIFIVE_UART_H__
+
+
+int virtio_uart_init(unsigned long base);
+
+#endif
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 2bdb1ef..9bfd5e7 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -388,6 +388,24 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 	return 0;
 }
 
+int fdt_parse_virtio_uart_node(void *fdt, int nodeoffset,
+			       struct platform_uart_data *uart)
+{
+	int rc;
+	uint64_t reg_addr, reg_size;
+
+	if (nodeoffset < 0 || !uart || !fdt)
+		return SBI_ENODEV;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_addr || !reg_size)
+		return SBI_ENODEV;
+	uart->addr = reg_addr;
+
+	return 0;
+}
+
 int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
diff --git a/lib/utils/serial/fdt_serial_virtio.c b/lib/utils/serial/fdt_serial_virtio.c
new file mode 100644
index 0000000..115c5ad
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_virtio.c
@@ -0,0 +1,37 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Bohdan Fedorov <misterjdrg@gmail.com>
+ *
+ * Based on virtio-uart
+ */
+
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/serial/virtio-uart.h>
+
+static int serial_virtio_init(void *fdt, int nodeoff,
+				const struct fdt_match *match)
+{
+	int rc;
+	struct platform_uart_data uart;
+
+	rc = fdt_parse_virtio_uart_node(fdt, nodeoff, &uart);
+	if (rc)
+		return rc;
+
+	return virtio_uart_init(uart.addr);
+}
+
+static const struct fdt_match serial_virtio_match[] = {
+	{ .compatible = "virtio,mmio" },
+	{ },
+};
+
+struct fdt_serial fdt_serial_virtio = {
+	.match_table = serial_virtio_match,
+	.init = serial_virtio_init
+};
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index d26a74e..60e829b 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -22,6 +22,9 @@ libsbiutils-objs-y += serial/fdt_serial_shakti.o
 carray-fdt_serial_drivers-y += fdt_serial_sifive
 libsbiutils-objs-y += serial/fdt_serial_sifive.o
 
+carray-fdt_serial_drivers-y += fdt_serial_virtio
+libsbiutils-objs-y += serial/fdt_serial_virtio.o
+
 carray-fdt_serial_drivers-y += fdt_serial_litex
 libsbiutils-objs-y += serial/fdt_serial_litex.o
 
@@ -34,6 +37,7 @@ libsbiutils-objs-y += serial/fdt_serial_xlnx_uartlite.o
 libsbiutils-objs-y += serial/gaisler-uart.o
 libsbiutils-objs-y += serial/shakti-uart.o
 libsbiutils-objs-y += serial/sifive-uart.o
+libsbiutils-objs-y += serial/virtio-uart.o
 libsbiutils-objs-y += serial/litex-uart.o
 libsbiutils-objs-y += serial/uart8250.o
 libsbiutils-objs-y += serial/xlnx-uartlite.o
diff --git a/lib/utils/serial/virtio-uart.c b/lib/utils/serial/virtio-uart.c
new file mode 100644
index 0000000..1d4266f
--- /dev/null
+++ b/lib/utils/serial/virtio-uart.c
@@ -0,0 +1,76 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Bohdan Fedorov <misterjdrg@gmial.com>
+ *
+ * Based on:
+ *   sifive-uart
+ */
+
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>
+#include <sbi_utils/serial/virtio-uart.h>
+
+/* clang-format off */
+
+#define VIRTIO_MAGIC                  0x0
+#define VIRTIO_MAGIC_VALUE            0x74726976
+#define VIRTIO_DEVICE_ID	      0x8
+#define VIRTIO_DEVICE_ID_CONSOLE      0x3
+#define VIRTIO_CONSOLE_F_EMERG_WRITE  (1 << 2)
+#define VIRTIO_DEVICE_FEATURES 	      0x10
+#define VIRTIO_DEVICE_FEATURES_SEL    0x14
+#define VIRTIO_CONSOLE_EMERG_WR       0x108
+
+/* clang-format on */
+
+static volatile void *uart_base;
+
+static u32 get_reg(u32 off)
+{
+	return readl(uart_base + off);
+}
+
+static void set_reg(u32 off, u32 val)
+{
+	writel(val, uart_base + off);
+}
+
+static void virtio_uart_putc(char ch)
+{
+	set_reg(VIRTIO_CONSOLE_EMERG_WR, ch);
+}
+
+static struct sbi_console_device virtio_console = {
+	.name = "virtio_uart",
+	.console_putc = virtio_uart_putc,
+	.console_getc = NULL,
+};
+
+int virtio_uart_init(unsigned long base)
+{
+	uart_base = (volatile void *)base;
+	
+	// Chech magic
+	if(get_reg(VIRTIO_MAGIC) != VIRTIO_MAGIC_VALUE) {
+		return SBI_ENODEV;
+	}
+
+	// Virtio device is console
+	if(get_reg(VIRTIO_DEVICE_ID) != VIRTIO_DEVICE_ID_CONSOLE) {
+		return SBI_ENODEV;
+	}
+
+	// Virtio console has emergency write feature
+	set_reg(VIRTIO_DEVICE_FEATURES_SEL, 0);
+	if((get_reg(VIRTIO_DEVICE_FEATURES) & VIRTIO_CONSOLE_F_EMERG_WRITE) == 0) {
+		return SBI_ENODEV;
+	}
+
+	sbi_console_set_device(&virtio_console);
+	return 0;
+}
-- 
2.36.1


