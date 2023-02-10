From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 11:16:52 +0530
Subject: [PATCH v6 8/8] lib: sbi: Speed-up sbi_printf() and friends using nputs()
In-Reply-To: <20230210054652.495628-1-apatel@ventanamicro.com>
References: <20230210054652.495628-1-apatel@ventanamicro.com>
Message-ID: <20230210054652.495628-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_printf() is slow for semihosting because it prints one
character at a time. To speed-up sbi_printf() for semihosting,
we use a temporary buffer and nputs().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_console.c | 76 ++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 8a5d9de..f3ac003 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -14,7 +14,11 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
+#define CONSOLE_TBUF_MAX 256
+
 static const struct sbi_console_device *console_dev = NULL;
+static char console_tbuf[CONSOLE_TBUF_MAX];
+static u32 console_tbuf_len;
 static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
 
 bool sbi_isprintable(char c)
@@ -42,37 +46,44 @@ void sbi_putc(char ch)
 	}
 }
 
-void sbi_puts(const char *str)
+static unsigned long nputs(const char *str, unsigned long len)
 {
-	unsigned long p, len;
+	unsigned long i, ret;
 
-	spin_lock(&console_out_lock);
 	if (console_dev && console_dev->console_puts) {
-		p = 0;
-		len = sbi_strlen(str);
-		while (p < len)
-			p += console_dev->console_puts(&str[p], len - p);
+		ret = console_dev->console_puts(str, len);
 	} else {
-		while (*str) {
-			sbi_putc(*str);
-			str++;
-		}
+		for (i = 0; i < len; i++)
+			sbi_putc(str[i]);
+		ret = len;
 	}
+
+	return ret;
+}
+
+static void nputs_all(const char *str, unsigned long len)
+{
+	unsigned long p = 0;
+
+	while (p < len)
+		p += nputs(&str[p], len - p);
+}
+
+void sbi_puts(const char *str)
+{
+	unsigned long len = sbi_strlen(str);
+
+	spin_lock(&console_out_lock);
+	nputs_all(str, len);
 	spin_unlock(&console_out_lock);
 }
 
 unsigned long sbi_nputs(const char *str, unsigned long len)
 {
-	unsigned long i, ret;
+	unsigned long ret;
 
 	spin_lock(&console_out_lock);
-	if (console_dev && console_dev->console_puts) {
-		ret = console_dev->console_puts(str, len);
-	} else {
-		for (i = 0; i < len; i++)
-			sbi_putc(str[i]);
-		ret = len;
-	}
+	ret = nputs(str, len);
 	spin_unlock(&console_out_lock);
 
 	return ret;
@@ -225,12 +236,30 @@ static int printi(char **out, u32 *out_len, long long i, int b, int sg,
 
 static int print(char **out, u32 *out_len, const char *format, va_list args)
 {
-	int width, flags;
-	int pc = 0;
-	char scr[2];
+	int width, flags, pc = 0;
+	char scr[2], *tout;
+	bool use_tbuf = (!out) ? true : false;
 	unsigned long long tmp;
 
+	/*
+	 * The console_tbuf is protected by console_out_lock and
+	 * print() is always called with console_out_lock held
+	 * when out == NULL.
+	 */
+	if (use_tbuf) {
+		console_tbuf_len = CONSOLE_TBUF_MAX;
+		tout = console_tbuf;
+		out = &tout;
+		out_len = &console_tbuf_len;
+	}
+
 	for (; *format != 0; ++format) {
+		if (use_tbuf && !console_tbuf_len) {
+			nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
+			console_tbuf_len = CONSOLE_TBUF_MAX;
+			tout = console_tbuf;
+		}
+
 		if (*format == '%') {
 			++format;
 			width = flags = 0;
@@ -356,6 +385,9 @@ literal:
 		}
 	}
 
+	if (use_tbuf && console_tbuf_len < CONSOLE_TBUF_MAX)
+		nputs_all(console_tbuf, CONSOLE_TBUF_MAX - console_tbuf_len);
+
 	return pc;
 }
 
-- 
2.34.1


