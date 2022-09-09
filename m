From: Kautuk Consul <kconsul@ventanamicro.com>
Date: Fri,  9 Sep 2022 11:43:03 +0530
Subject: [PATCH v2 1/1] lib: utils/serial: add semihosting support
In-Reply-To: <20220909061303.3378980-1-kconsul@ventanamicro.com>
References: <20220909061303.3378980-1-kconsul@ventanamicro.com>
Message-ID: <20220909061303.3378980-2-kconsul@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add RISC-V semihosting based serial console for JTAG based early
debugging.

The RISC-V semihosting specification is available at:
https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Kautuk Consul <kconsul@ventanamicro.com>
---
 include/sbi_utils/serial/semihosting.h |  47 +++++++
 lib/utils/serial/Kconfig               |   4 +
 lib/utils/serial/objects.mk            |   1 +
 lib/utils/serial/semihosting.c         | 175 +++++++++++++++++++++++++
 platform/generic/configs/defconfig     |   1 +
 platform/generic/platform.c            |  11 +-
 6 files changed, 238 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/serial/semihosting.h
 create mode 100644 lib/utils/serial/semihosting.c

diff --git a/include/sbi_utils/serial/semihosting.h b/include/sbi_utils/serial/semihosting.h
new file mode 100644
index 0000000..8cc4a86
--- /dev/null
+++ b/include/sbi_utils/serial/semihosting.h
@@ -0,0 +1,47 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ *   Kautuk Consul <kconsul@ventanamicro.com>
+ */
+
+#ifndef __SERIAL_SEMIHOSTING_H__
+#define __SERIAL_SEMIHOSTING_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * enum semihosting_open_mode - Numeric file modes for use with semihosting_open()
+ * MODE_READ: 'r'
+ * MODE_BINARY: 'b'
+ * MODE_PLUS: '+'
+ * MODE_WRITE: 'w'
+ * MODE_APPEND: 'a'
+ *
+ * These modes represent the mode string used by fopen(3) in a form which can
+ * be passed to semihosting_open(). These do NOT correspond directly to %O_RDONLY,
+ * %O_CREAT, etc; see fopen(3) for details. In particular, @MODE_PLUS
+ * effectively results in adding %O_RDWR, and @MODE_WRITE will add %O_TRUNC.
+ * For compatibility, @MODE_BINARY should be added when opening non-text files
+ * (such as images).
+ */
+enum semihosting_open_mode {
+	MODE_READ	= 0x0,
+	MODE_BINARY	= 0x1,
+	MODE_PLUS	= 0x2,
+	MODE_WRITE	= 0x4,
+	MODE_APPEND	= 0x8,
+};
+
+#ifdef CONFIG_SERIAL_SEMIHOSTING
+int semihosting_init(void);
+int semihosting_enabled(void);
+#else
+static inline int semihosting_init(void) { return SBI_ENODEV; }
+static inline int semihosting_enabled(void) { return 0; }
+#endif
+
+#endif
diff --git a/lib/utils/serial/Kconfig b/lib/utils/serial/Kconfig
index 6e425f2..da549a7 100644
--- a/lib/utils/serial/Kconfig
+++ b/lib/utils/serial/Kconfig
@@ -79,4 +79,8 @@ config SERIAL_XILINX_UARTLITE
 	bool "Xilinx UART Lite support"
 	default n
 
+config SERIAL_SEMIHOSTING
+	bool "Semihosting support"
+	default n
+
 endmenu
diff --git a/lib/utils/serial/objects.mk b/lib/utils/serial/objects.mk
index efb1d9e..98f3f9a 100644
--- a/lib/utils/serial/objects.mk
+++ b/lib/utils/serial/objects.mk
@@ -41,3 +41,4 @@ libsbiutils-objs-$(CONFIG_SERIAL_SIFIVE) += serial/sifive-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_LITEX) += serial/litex-uart.o
 libsbiutils-objs-$(CONFIG_SERIAL_UART8250) += serial/uart8250.o
 libsbiutils-objs-$(CONFIG_SERIAL_XILINX_UARTLITE) += serial/xlnx-uartlite.o
+libsbiutils-objs-$(CONFIG_SERIAL_SEMIHOSTING) += serial/semihosting.o
diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
new file mode 100644
index 0000000..57ab5ce
--- /dev/null
+++ b/lib/utils/serial/semihosting.c
@@ -0,0 +1,175 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ *   Kautuk Consul <kconsul@ventanamicro.com>
+ */
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/serial/semihosting.h>
+
+#define SYSOPEN     0x01
+#define SYSWRITEC   0x03
+#define SYSREAD     0x06
+#define SYSREADC    0x07
+#define SYSERRNO	0x13
+
+static long semihosting_trap(int sysnum, void *addr)
+{
+	register int ret asm ("a0") = sysnum;
+	register void *param0 asm ("a1") = addr;
+
+	asm volatile (
+		"\t.option push\n"
+		"\t.option norvc\n"
+		"\tj 1f\n"
+		"\t.align 4\n"
+		"\t1: slli zero, zero, 0x1f\n"
+		"\tebreak\n"
+		"\tsrai zero, zero, 7\n"
+		"\t.option pop\n"
+		: "+r" (ret) : "r" (param0) : "memory");
+
+	return ret;
+}
+
+static bool _semihosting_enabled = true;
+static bool try_semihosting = true;
+
+bool semihosting_enabled(void)
+{
+	register int ret asm ("a0") = SYSERRNO;
+	register void *param0 asm ("a1") = NULL;
+	unsigned long tmp = 0;
+
+	if (!try_semihosting)
+		return _semihosting_enabled;
+
+	asm volatile (
+		"\t.option push\n"
+		"\t.option norvc\n"
+
+		"\tj _semihost_test_vector_next\n"
+		"\t.align 4\n"
+		"\t_semihost_test_vector:\n"
+		"\t\tcsrr %[en], mepc\n"
+		"\t\taddi %[en], %[en], 4\n"
+		"\t\tcsrw mepc, %[en]\n"
+		"\t\tadd %[en], zero, zero\n"
+		"\t\tmret\n"
+		"\t_semihost_test_vector_next:\n"
+
+		"\tla %[tmp], _semihost_test_vector\n"
+		"\tcsrrw %[tmp], mtvec, %[tmp]\n"
+		"\tj 1f\n"
+		"\t.align 4\n"
+		"\t1: slli zero, zero, 0x1f\n"
+		"\tebreak\n"
+		"\tsrai zero, zero, 7\n"
+		"\tcsrw mtvec, %[tmp]\n"
+
+		"\t.option pop\n"
+		: [tmp] "+r" (tmp), [en] "+r" (_semihosting_enabled),
+		  [ret] "+r" (ret)
+		: "r" (param0) : "memory");
+
+	try_semihosting = false;
+	return _semihosting_enabled;
+}
+
+static int semihosting_errno(void)
+{
+	long ret = semihosting_trap(SYSERRNO, NULL);
+
+	if (ret > 0)
+		return -ret;
+	return SBI_EIO;
+}
+
+static int infd = SBI_ENODEV;
+
+static long semihosting_open(const char *fname, enum semihosting_open_mode mode)
+{
+	long fd;
+	struct semihosting_open_s {
+		const char *fname;
+		unsigned long mode;
+		size_t len;
+	} open;
+
+	open.fname = fname;
+	open.len = sbi_strlen(fname);
+	open.mode = mode;
+
+	/* Open the file on the host */
+	fd = semihosting_trap(SYSOPEN, &open);
+	if (fd == -1)
+		return semihosting_errno();
+	return fd;
+}
+
+/**
+ * struct semihosting_rdwr_s - Arguments for read and write
+ * @fd: A file descriptor returned from semihosting_open()
+ * @memp: Pointer to a buffer of memory of at least @len bytes
+ * @len: The number of bytes to read or write
+ */
+struct semihosting_rdwr_s {
+	long fd;
+	void *memp;
+	size_t len;
+};
+
+static long semihosting_read(long fd, void *memp, size_t len)
+{
+	long ret;
+	struct semihosting_rdwr_s read;
+
+	read.fd = fd;
+	read.memp = memp;
+	read.len = len;
+
+	ret = semihosting_trap(SYSREAD, &read);
+	if (ret < 0)
+		return semihosting_errno();
+	return len - ret;
+}
+
+/* clang-format on */
+
+static void semihosting_putc(char ch)
+{
+	semihosting_trap(SYSWRITEC, &ch);
+}
+
+static int semihosting_getc(void)
+{
+	char ch = 0;
+
+	if (infd < 0)
+		return semihosting_trap(SYSREADC, NULL);
+
+	semihosting_read(infd, &ch, sizeof(ch));
+
+	return ch;
+}
+
+static struct sbi_console_device semihosting_console = {
+	.name = "semihosting",
+	.console_putc = semihosting_putc,
+	.console_getc = semihosting_getc
+};
+
+int semihosting_init(void)
+{
+	infd = semihosting_open(":tt", MODE_READ);
+
+	sbi_console_set_device(&semihosting_console);
+
+	return 0;
+}
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index e324173..c95b7fa 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -28,3 +28,4 @@ CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
+CONFIG_SERIAL_SEMIHOSTING=y
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index cc3620f..bf51aba 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -23,6 +23,7 @@
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/reset/fdt_reset.h>
+#include <sbi_utils/serial/semihosting.h>
 
 /* List of platform override modules generated at compile time */
 extern const struct platform_override *platform_override_modules[];
@@ -242,6 +243,14 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
 	return evt_val;
 }
 
+static int generic_console_init(void)
+{
+	if (semihosting_enabled())
+		return semihosting_init();
+	else
+		return fdt_serial_init();
+}
+
 const struct sbi_platform_operations platform_ops = {
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
@@ -249,7 +258,7 @@ const struct sbi_platform_operations platform_ops = {
 	.early_exit		= generic_early_exit,
 	.final_exit		= generic_final_exit,
 	.domains_init		= generic_domains_init,
-	.console_init		= fdt_serial_init,
+	.console_init		= generic_console_init,
 	.irqchip_init		= fdt_irqchip_init,
 	.irqchip_exit		= fdt_irqchip_exit,
 	.ipi_init		= fdt_ipi_init,
-- 
2.34.1


