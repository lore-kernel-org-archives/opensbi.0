From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:50 +0530
Subject: [PATCH v6 6/8] lib: sbi: Add console_puts() callback in the console device
In-Reply-To: <20230210054652.495628-1-apatel@ventanamicro.com>
References: <20230210054652.495628-1-apatel@ventanamicro.com>
Message-ID: <20230210054652.495628-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add console_puts() callback in the console device which allows
console drivers (such as semihosting) to implement a specialized
way to output character string.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_console.h |  3 +++
 lib/sbi/sbi_console.c     | 29 ++++++++++++++++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index 3c1f5e5..0979765 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -19,6 +19,9 @@ struct sbi_console_device {
 	/** Write a character to the console output */
 	void (*console_putc)(char ch);
 
+	/** Write a character string to the console output */
+	unsigned long (*console_puts)(const char *str, unsigned long len);
+
 	/** Read a character from the console input */
 	int (*console_getc)(void);
 };
diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index c734bc0..8a5d9de 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
 
 static const struct sbi_console_device *console_dev = NULL;
 static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
@@ -43,24 +44,38 @@ void sbi_putc(char ch)
 
 void sbi_puts(const char *str)
 {
+	unsigned long p, len;
+
 	spin_lock(&console_out_lock);
-	while (*str) {
-		sbi_putc(*str);
-		str++;
+	if (console_dev && console_dev->console_puts) {
+		p = 0;
+		len = sbi_strlen(str);
+		while (p < len)
+			p += console_dev->console_puts(&str[p], len - p);
+	} else {
+		while (*str) {
+			sbi_putc(*str);
+			str++;
+		}
 	}
 	spin_unlock(&console_out_lock);
 }
 
 unsigned long sbi_nputs(const char *str, unsigned long len)
 {
-	unsigned long i;
+	unsigned long i, ret;
 
 	spin_lock(&console_out_lock);
-	for (i = 0; i < len; i++)
-		sbi_putc(str[i]);
+	if (console_dev && console_dev->console_puts) {
+		ret = console_dev->console_puts(str, len);
+	} else {
+		for (i = 0; i < len; i++)
+			sbi_putc(str[i]);
+		ret = len;
+	}
 	spin_unlock(&console_out_lock);
 
-	return i;
+	return ret;
 }
 
 void sbi_gets(char *s, int maxwidth, char endchar)
-- 
2.34.1


