From: Xiang W <wxjstz@126.com>
Date: Fri,  9 Jun 2023 11:35:38 +0800
Subject: [PATCH v5 11/14] lib: sbi: Add print_info for sbi_console.c
In-Reply-To: <20230609033430.84471-1-wxjstz@126.com>
References: <20230609033430.84471-1-wxjstz@126.com>
Message-ID: <20230609033538.84664-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a structure print_info for print, this structure simplifies
parameter passing.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 235 +++++++++++++++++++++---------------------
 1 file changed, 120 insertions(+), 115 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index af93f51..c227b0f 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -27,11 +27,22 @@
 
 typedef __builtin_va_list va_list;
 
+struct print_info {
+	char *out;
+	int len;
+	int pos;
+	int pc;
+	int flags;
+	int width;
+	int wcnt;
+	char type;
+};
+
 static const struct sbi_console_device *console_dev = NULL;
 static char console_tbuf[CONSOLE_TBUF_MAX];
-static u32 console_tbuf_len;
 static spinlock_t console_out_lock	       = SPIN_LOCK_INITIALIZER;
 
+
 bool sbi_isprintable(char c)
 {
 	if (((31 < c) && (c < 127)) || (c == '\f') || (c == '\r') ||
@@ -128,70 +139,63 @@ unsigned long sbi_ngets(char *str, unsigned long len)
 	return i;
 }
 
-static void printc(char **out, u32 *out_len, char ch)
+static void printc(struct print_info *info, char ch)
 {
-	if (!out) {
+	/* output to the console */
+	if (info->out == NULL) {
 		sbi_putc(ch);
+		info->pc++;
 		return;
 	}
 
-	/*
-	 * The *printf entry point functions have enforced that (*out) can
-	 * only be null when out_len is non-null and its value is zero.
-	 */
-	if (!out_len || *out_len > 1) {
-		*(*out)++ = ch;
-		**out = '\0';
-	}
+	/* unknown buffer length */
+	if (info->len == 0)
+		goto append;
 
-	if (out_len && *out_len > 0)
-		--(*out_len);
+	/* The buffer is long enough to add new characters */
+	if (info->len - info->pos > 1)
+		goto append;
+	return;
+
+append:
+	info->out[info->pos++] = ch;
+	info->out[info->pos] = '\0';
+	info->pc++;
 }
 
-static int prints(char **out, u32 *out_len, const char *string, int width,
-		  int flags)
+static void prints(struct print_info *info, const char *string)
 {
-	int pc = 0;
-	width -= sbi_strlen(string);
-	if (!(flags & PAD_RIGHT)) {
-		for (; width > 0; --width) {
-			printc(out, out_len, flags & PAD_ZERO ? '0' : ' ');
-			++pc;
-		}
-	}
-	for (; *string; ++string) {
-		printc(out, out_len, *string);
-		++pc;
-	}
-	for (; width > 0; --width) {
-		printc(out, out_len, ' ');
-		++pc;
+	info->wcnt += sbi_strlen(string);
+	if (!(info->flags & PAD_RIGHT)) {
+		for (; info->wcnt < info->width; info->wcnt++)
+			printc(info, info->flags & PAD_ZERO ? '0' : ' ');
 	}
-
-	return pc;
+	for (; *string; ++string)
+		printc(info, *string);
+	for (; info->wcnt < info->width; info->wcnt++)
+		printc(info, ' ');
 }
 
-static int printi(char **out, u32 *out_len, long long i,
-		  int width, int flags, int type)
+static void printi(struct print_info *info, long long i)
 {
-	int pc = 0;
 	char *s, sign, letbase, print_buf[PRINT_BUF_LEN];
 	unsigned long long u, b, t;
 
 	b = 10;
 	letbase = 'a';
-	if (type == 'o')
+	if (info->type == 'o')
 		b = 8;
-	else if (type == 'x' || type == 'X' || type == 'p' || type == 'P') {
+	else if (info->type == 'x' || info->type == 'X'
+			 || info->type == 'p' || info->type == 'P') {
 		b = 16;
 		letbase &= ~0x20;
-		letbase |= type & 0x20;
+		letbase |= info->type & 0x20;
 	}
 
 	u = i;
 	sign = 0;
-	if (type == 'i' || type == 'd') {
-		if ((flags & PAD_SIGN) && i > 0)
+	if (info->type == 'i' || info->type == 'd') {
+		if ((info->flags & PAD_SIGN) && i > 0)
 			sign = '+';
 		if (i < 0) {
 			sign = '-';
@@ -214,26 +218,23 @@ static int printi(char **out, u32 *out_len, long long i,
 		}
 	}
 
-	if (flags & PAD_ZERO) {
+	if (info->flags & PAD_ZERO) {
 		if (sign) {
-			printc(out, out_len, sign);
-			++pc;
-			--width;
+			printc(info, sign);
+			++info->wcnt;
 		}
-		if (i && (flags & PAD_ALTERNATE)) {
+		if (i && (info->flags & PAD_ALTERNATE)) {
 			if (b == 16 || b == 8) {
-				printc(out, out_len, '0');
-				++pc;
-				--width;
+				printc(info, '0');
+				++info->wcnt;
 			}
 			if (b == 16) {
-				printc(out, out_len, 'x' - 'a' + letbase);
-				++pc;
-				--width;
+				printc(info, 'x' - 'a' + letbase);
+				++info->wcnt;
 			}
 		}
 	} else {
-		if (i && (flags & PAD_ALTERNATE)) {
+		if (i && (info->flags & PAD_ALTERNATE)) {
 			if (b == 16)
 				*--s = 'x' - 'a' + letbase;
 			if (b == 16 || b == 8)
@@ -243,15 +244,16 @@ static int printi(char **out, u32 *out_len, long long i,
 			*--s = sign;
 	}
 
-	return pc + prints(out, out_len, s, width, flags);
+	prints(info, s);
 }
 
-static int print(char **out, u32 *out_len, const char *format, va_list args)
+static void print(struct print_info *info, const char *format, va_list args)
 {
 	bool flags_done;
-	int width, flags, pc = 0;
-	char type, scr[2], *tout;
-	bool use_tbuf = (!out) ? true : false;
+	char scr[2];
+	bool use_tbuf = (!info->out) ? true : false;
+	info->pos = 0;
+	info->pc = 0;
 
 	/*
 	 * The console_tbuf is protected by console_out_lock and
@@ -259,19 +261,15 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 	 * when out == NULL.
 	 */
 	if (use_tbuf) {
-		console_tbuf_len = CONSOLE_TBUF_MAX;
-		tout = console_tbuf;
-		out = &tout;
-		out_len = &console_tbuf_len;
+		info->out = console_tbuf;
+		info->len = CONSOLE_TBUF_MAX;
 	}
 
 	for (; *format != 0; ++format) {
-		if (use_tbuf && !console_tbuf_len) {
-			nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
-			console_tbuf_len = CONSOLE_TBUF_MAX;
-			tout = console_tbuf;
-		}
-
+		if (use_tbuf && (info->len - info->pos <= 1)) {
+			nputs_all(info->out, info->pos);
+			info->pos = 0;
+		}		
 		if (*format == '%') {
 			++format;
 			if (*format == '\0')
@@ -279,21 +277,21 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			if (*format == '%')
 				goto literal;
 			/* Get flags */
-			flags = 0;
+			info->flags = 0;
 			flags_done = false;
 			while (!flags_done) {
 				switch (*format) {
 				case '-':
-					flags |= PAD_RIGHT;
+					info->flags |= PAD_RIGHT;
 					break;
 				case '+':
-					flags |= PAD_SIGN;
+					info->flags |= PAD_SIGN;
 					break;
 				case '#':
-					flags |= PAD_ALTERNATE;
+					info->flags |= PAD_ALTERNATE;
 					break;
 				case '0':
-					flags |= PAD_ZERO;
+					info->flags |= PAD_ZERO;
 					break;
 				case ' ':
 				case '\'':
@@ -306,153 +304,160 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				if (!flags_done)
 					++format;
 			}
-			if (flags & PAD_RIGHT)
-				flags &= ~PAD_ZERO;
+			if (info->flags & PAD_RIGHT)
+				info->flags &= ~PAD_ZERO;
 			/* Get width */
-			width = 0;
+			info->width = 0;
+			info->wcnt = 0;
 			for (; *format >= '0' && *format <= '9'; ++format) {
-				width *= 10;
-				width += *format - '0';
+				info->width *= 10;
+				info->width += *format - '0';
 			}
+			info->type = *format;
 			if (*format == 's') {
 				char *s = va_arg(args, char *);
-				pc += prints(out, out_len, s ? s : "(null)",
-					     width, flags);
+				prints(info, s ? s : "(null)");
 				continue;
 			}
 			if ((*format == 'd') || (*format == 'i')) {
-				pc += printi(out, out_len, va_arg(args, int),
-					     width, flags, *format);
+				printi(info, va_arg(args, int));
 				continue;
 			}
 			if ((*format == 'u') || (*format == 'o')
 					 || (*format == 'x') || (*format == 'X')) {
-				pc += printi(out, out_len, va_arg(args, unsigned int),
-					     width, flags, *format);
+				printi(info, va_arg(args, unsigned int));
 				continue;
 			}
 			if ((*format == 'p') || (*format == 'P')) {
-				pc += printi(out, out_len, (uintptr_t)va_arg(args, void*),
-					     width, flags, *format);
+				printi(info, (uintptr_t)va_arg(args, void*));
 				continue;
 			}
 			if (*format == 'l') {
-				type = 'i';
+				info->type = 'i';
 				if (format[1] == 'l') {
 					++format;
 					if ((format[1] == 'u') || (format[1] == 'o')
 							|| (format[1] == 'd') || (format[1] == 'i')
 							|| (format[1] == 'x') || (format[1] == 'X')) {
 						++format;
-						type = *format;
+						info->type = *format;
 					}
-					pc += printi(out, out_len, va_arg(args, long long),
-						width, flags, type);
+					printi(info, va_arg(args, long long));
 					continue;
 				}
 				if ((format[1] == 'u') || (format[1] == 'o')
 						|| (format[1] == 'd') || (format[1] == 'i')
 						|| (format[1] == 'x') || (format[1] == 'X')) {
 					++format;
-					type = *format;
+					info->type = *format;
 				}
-				if ((type == 'd') || (type == 'i'))
-					pc += printi(out, out_len, va_arg(args, long),
-					     width, flags, type);
+				if ((info->type == 'd') || (info->type == 'i'))
+					printi(info, va_arg(args, long));
 				else
-					pc += printi(out, out_len, va_arg(args, unsigned long),
-					     width, flags, type);
+					printi(info, va_arg(args, unsigned long));
 				continue;
 			}
 			if (*format == 'c') {
 				/* char are converted to int then pushed on the stack */
 				scr[0] = va_arg(args, int);
 				scr[1] = '\0';
-				pc += prints(out, out_len, scr, width, flags);
+				prints(info, scr);
 				continue;
 			}
 		} else {
 literal:
-			printc(out, out_len, *format);
-			++pc;
+			printc(info, *format);
 		}
 	}
 
-	if (use_tbuf && console_tbuf_len < CONSOLE_TBUF_MAX)
-		nputs_all(console_tbuf, CONSOLE_TBUF_MAX - console_tbuf_len);
-
-	return pc;
+	if (use_tbuf && info->pos > 0)
+		nputs_all(info->out, info->pos);
 }
 
 int sbi_sprintf(char *out, const char *format, ...)
 {
 	va_list args;
-	int retval;
+	struct print_info info;
+	info.out = out;
+	info.len = 0;
+
 
 	if (unlikely(!out))
 		sbi_panic("sbi_sprintf called with NULL output string\n");
 
 	va_start(args, format);
-	retval = print(&out, NULL, format, args);
+	print(&info, format, args);
 	va_end(args);
 
-	return retval;
+	return info.pc;
 }
 
 int sbi_snprintf(char *out, u32 out_sz, const char *format, ...)
 {
 	va_list args;
-	int retval;
+	struct print_info info;
+	info.out = out;
+	info.len = out_sz;
+
 
 	if (unlikely(!out && out_sz != 0))
 		sbi_panic("sbi_snprintf called with NULL output string and "
 			  "output size is not zero\n");
 
 	va_start(args, format);
-	retval = print(&out, &out_sz, format, args);
+	print(&info, format, args);
 	va_end(args);
 
-	return retval;
+	return info.pc;
 }
 
 int sbi_printf(const char *format, ...)
 {
 	va_list args;
-	int retval;
+	struct print_info info;
+	info.out = NULL;
+	info.len = 0;
+
 
 	spin_lock(&console_out_lock);
 	va_start(args, format);
-	retval = print(NULL, NULL, format, args);
+	print(&info, format, args);
 	va_end(args);
 	spin_unlock(&console_out_lock);
 
-	return retval;
+	return info.pc;
 }
 
 int sbi_dprintf(const char *format, ...)
 {
 	va_list args;
-	int retval = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	struct print_info info;
+	info.out = NULL;
+	info.len = 0;
+
 
 	va_start(args, format);
 	if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS) {
 		spin_lock(&console_out_lock);
-		retval = print(NULL, NULL, format, args);
+		print(&info, format, args);
 		spin_unlock(&console_out_lock);
 	}
 	va_end(args);
 
-	return retval;
+	return info.pc;
 }
 
 void sbi_panic(const char *format, ...)
 {
 	va_list args;
+	struct print_info info;
+	info.out = NULL;
+	info.len = 0;
 
 	spin_lock(&console_out_lock);
 	va_start(args, format);
-	print(NULL, NULL, format, args);
+	print(&info, format, args);
 	va_end(args);
 	spin_unlock(&console_out_lock);
 
-- 
2.39.2


