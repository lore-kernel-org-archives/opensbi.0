From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  5 Jul 2024 12:45:04 +0530
Subject: [PATCH 6/6] lib: sbi: Introduce an early console buffer for caching early prints
In-Reply-To: <20240705071504.50988-1-apatel@ventanamicro.com>
References: <20240705071504.50988-1-apatel@ventanamicro.com>
Message-ID: <20240705071504.50988-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The console device is registered by platform only in early_init()
callback so any prints before this point will be lost. Introduce an
early console buffer for caching prints before platform early_init().

For crashes before platform early_init(), users can simply dump the
contents of the console_early_buffer[] string using a debugger. The
relative address of the console_early_buffer[] string can be found
using following two commands:

CONSOLE_EARLY_FIFO_ADDR=`${CROSS_COMPILE}objdump -D \
build/platform/generic/firmware/fw_dynamic.elf | \
grep "<console_early_fifo>:" | awk '{print $1}'`

${CROSS_COMPILE}objdump -R build/platform/generic/firmware/fw_dynamic.elf | \
grep $CONSOLE_EARLY_FIFO_ADDR | awk '{print $3}'

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/Kconfig       |  6 +++++-
 lib/sbi/sbi_console.c | 27 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 6cf54ce..bd8ba2b 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: BSD-2-Clause
 
-menu "SBI Extension Support"
+menu "Generic SBI Support"
+
+config CONSOLE_EARLY_BUFFER_SIZE
+	int "Early console buffer size (bytes)"
+	default 256
 
 config SBI_ECALL_TIME
 	bool "Timer extension"
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 194529d..d760885 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -9,6 +9,7 @@
 
 #include <sbi/riscv_locks.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_fifo.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
@@ -21,6 +22,15 @@ static char console_tbuf[CONSOLE_TBUF_MAX];
 static u32 console_tbuf_len;
 static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
 
+#ifdef CONFIG_CONSOLE_EARLY_BUFFER_SIZE
+#define CONSOLE_EARLY_BUFFER_SIZE	CONFIG_CONSOLE_EARLY_BUFFER_SIZE
+#else
+#define CONSOLE_EARLY_BUFFER_SIZE	256
+#endif
+static char console_early_buffer[CONSOLE_EARLY_BUFFER_SIZE] = { 0 };
+static SBI_FIFO_DEFINE(console_early_fifo, console_early_buffer, \
+		       CONSOLE_EARLY_BUFFER_SIZE, sizeof(char));
+
 bool sbi_isprintable(char c)
 {
 	if (((31 < c) && (c < 127)) || (c == '\f') || (c == '\r') ||
@@ -39,6 +49,7 @@ int sbi_getc(void)
 
 static unsigned long nputs(const char *str, unsigned long len)
 {
+	char ch;
 	unsigned long i;
 
 	if (console_dev) {
@@ -51,6 +62,11 @@ static unsigned long nputs(const char *str, unsigned long len)
 				console_dev->console_putc(str[i]);
 			}
 		}
+	} else {
+		for (i = 0; i < len; i++) {
+			ch = str[i];
+			sbi_fifo_enqueue(&console_early_fifo, &ch, true);
+		}
 	}
 	return len;
 }
@@ -472,8 +488,19 @@ const struct sbi_console_device *sbi_console_get_device(void)
 
 void sbi_console_set_device(const struct sbi_console_device *dev)
 {
+	char ch;
+	bool flush_early_fifo = false;
+
 	if (!dev)
 		return;
 
+	if (!console_dev)
+		flush_early_fifo = true;
+
 	console_dev = dev;
+
+	if (flush_early_fifo) {
+		while (!sbi_fifo_dequeue(&console_early_fifo, &ch))
+			sbi_putc(ch);
+	}
 }
-- 
2.34.1


