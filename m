From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:51 +0530
Subject: [PATCH v6 7/8] lib: utils/serial: Implement console_puts() for semihosting
In-Reply-To: <20230210054652.495628-1-apatel@ventanamicro.com>
References: <20230210054652.495628-1-apatel@ventanamicro.com>
Message-ID: <20230210054652.495628-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We implement console_puts() for semihosting serial driver to speed-up
semihosting based prints.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/serial/semihosting.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index 86fa296..ce65887 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -15,6 +15,7 @@
 
 #define SYSOPEN     0x01
 #define SYSWRITEC   0x03
+#define SYSWRITE    0x05
 #define SYSREAD     0x06
 #define SYSREADC    0x07
 #define SYSERRNO	0x13
@@ -93,6 +94,7 @@ static int semihosting_errno(void)
 }
 
 static int semihosting_infd = SBI_ENODEV;
+static int semihosting_outfd = SBI_ENODEV;
 
 static long semihosting_open(const char *fname, enum semihosting_open_mode mode)
 {
@@ -141,6 +143,21 @@ static long semihosting_read(long fd, void *memp, size_t len)
 	return len - ret;
 }
 
+static long semihosting_write(long fd, const void *memp, size_t len)
+{
+	long ret;
+	struct semihosting_rdwr_s write;
+
+	write.fd = fd;
+	write.memp = (void *)memp;
+	write.len = len;
+
+	ret = semihosting_trap(SYSWRITE, &write);
+	if (ret < 0)
+		return semihosting_errno();
+	return len - ret;
+}
+
 /* clang-format on */
 
 static void semihosting_putc(char ch)
@@ -148,6 +165,24 @@ static void semihosting_putc(char ch)
 	semihosting_trap(SYSWRITEC, &ch);
 }
 
+static unsigned long semihosting_puts(const char *str, unsigned long len)
+{
+	char ch;
+	long ret;
+	unsigned long i;
+
+	if (semihosting_outfd < 0) {
+		for (i = 0; i < len; i++) {
+			ch = str[i];
+			semihosting_trap(SYSWRITEC, &ch);
+		}
+		ret = len;
+	} else
+		ret = semihosting_write(semihosting_outfd, str, len);
+
+	return (ret < 0) ? 0 : ret;
+}
+
 static int semihosting_getc(void)
 {
 	char ch = 0;
@@ -165,12 +200,14 @@ static int semihosting_getc(void)
 static struct sbi_console_device semihosting_console = {
 	.name = "semihosting",
 	.console_putc = semihosting_putc,
+	.console_puts = semihosting_puts,
 	.console_getc = semihosting_getc
 };
 
 int semihosting_init(void)
 {
 	semihosting_infd = semihosting_open(":tt", MODE_READ);
+	semihosting_outfd = semihosting_open(":tt", MODE_WRITE);
 
 	sbi_console_set_device(&semihosting_console);
 
-- 
2.34.1


