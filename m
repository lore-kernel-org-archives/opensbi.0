From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Sat, 10 Dec 2022 10:30:08 +0000
Subject: [PATCH v5 2/5] lib: utils: serial: Add FDT driver for Renesas SCIF
In-Reply-To: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221210103011.7814-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add FDT driver for Renesas SCIF.

    dts example:

    soc: soc {
          ....
            scif0: serial at 1004b800 {
                    compatible = "renesas,scif-r9a07g043",
                                 "renesas,scif-r9a07g044";
                    reg = <0 0x1004b800 0 0x400>;
                    interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
                                 <414 IRQ_TYPE_LEVEL_HIGH>,
                                 <415 IRQ_TYPE_LEVEL_HIGH>,
                                 <413 IRQ_TYPE_LEVEL_HIGH>,
                                 <416 IRQ_TYPE_LEVEL_HIGH>,
                                 <416 IRQ_TYPE_LEVEL_HIGH>;
                    interrupt-names = "eri", "rxi", "txi",
                                      "bri", "dri", "tei";
                    clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
                    clock-names = "fck";
                    power-domains = <&cpg>;
                    resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
                    status = "disabled";
            };
          ....
    };

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
v4->v5
* No change

v3->v4
* Included RB tag

v2->v3
* No change

RFC->v2
* Dropped DEFAULT_RENESAS_SCIF_REG_SHIFT and
  DEFAULT_RENESAS_SCIF_REG_IO_WIDTH macros.

DT binding [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/serial/renesas,scif.yaml?h=next-20221111#n80
---
 include/sbi_utils/fdt/fdt_helper.h         |  3 +++
 lib/utils/fdt/fdt_helper.c                 | 11 ++++++++
 lib/utils/serial/Kconfig                   |  5 ++++
 lib/utils/serial/fdt_serial_renesas_scif.c | 31 ++++++++++++++++++++++
 lib/utils/serial/objects.mk                |  3 +++
 5 files changed, 53 insertions(+)
 create mode 100644 lib/utils/serial/fdt_serial_renesas_scif.c

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index c39f77a..09f3095 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -59,6 +59,9 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
 int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
+int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
+				struct platform_uart_data *uart);
+
 int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index d4b38dc..48bc2fe 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -23,6 +23,9 @@
 #define DEFAULT_UART_REG_IO_WIDTH	1
 #define DEFAULT_UART_REG_OFFSET		0
 
+#define DEFAULT_RENESAS_SCIF_FREQ		100000000
+#define DEFAULT_RENESAS_SCIF_BAUD		115200
+
 #define DEFAULT_SIFIVE_UART_FREQ		0
 #define DEFAULT_SIFIVE_UART_BAUD		115200
 
@@ -355,6 +358,14 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 					DEFAULT_UART_BAUD);
 }
 
+int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
+				struct platform_uart_data *uart)
+{
+	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
+					  DEFAULT_RENESAS_SCIF_FREQ,
+					  DEFAULT_RENESAS_SCIF_BAUD);
+}
+
 int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index f6ed803..e3589ca 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -24,6 +24,11 @@ config FDT_SERIAL_HTIF
 	select SYS_HTIF
 	default n
 
+config FDT_SERIAL_RENESAS_SCIF
+	bool "Renesas SCIF FDT driver"
+	select SERIAL_RENESAS_SCIF
+	default n
+
 config FDT_SERIAL_SHAKTI
 	bool "Shakti UART FDT driver"
 	select SERIAL_SHAKTI
diff --git a/lib/utils/serial/fdt_serial_renesas_scif.c b/lib/utils/serial/fdt_serial_renesas_scif.c
new file mode 100644
index 0000000..c331ca1
--- /dev/null
+++ b/lib/utils/serial/fdt_serial_renesas_scif.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/serial/renesas-scif.h>
+
+static int serial_renesas_scif_init(void *fdt, int nodeoff,
+				    const struct fdt_match *match)
+{
+	struct platform_uart_data uart = { 0 };
+	int ret;
+
+	ret = fdt_parse_renesas_scif_node(fdt, nodeoff, &uart);
+	if (ret)
+		return ret;
+
+	return renesas_scif_init(uart.addr, uart.freq, uart.baud);
+}
+
+static const struct fdt_match serial_renesas_scif_match[] = {
+	{ .compatible = "renesas,scif-r9a07g043" },
+	{ /* sentinel */ }
+};
+
+struct fdt_serial fdt_serial_renesas_scif = {
+	.match_table = serial_renesas_scif_match,
+	.init = serial_renesas_scif_init
+};
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index 6520424..1e6bd2e 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -19,6 +19,9 @@ libsbiutils-objs-$(CONFIG_FDT_SERIAL_GAISLER) += serial/fdt_serial_gaisler.o
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_HTIF) += fdt_serial_htif
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_HTIF) += serial/fdt_serial_htif.o
 
+carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_RENESAS_SCIF) += fdt_serial_renesas_scif
+libsbiutils-objs-$(CONFIG_FDT_SERIAL_RENESAS_SCIF) += serial/fdt_serial_renesas_scif.o
+
 carray-fdt_serial_drivers-$(CONFIG_FDT_SERIAL_SHAKTI) += fdt_serial_shakti
 libsbiutils-objs-$(CONFIG_FDT_SERIAL_SHAKTI) += serial/fdt_serial_shakti.o
 
-- 
2.17.1


