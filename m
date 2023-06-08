From: Xiang W <wxjstz@126.com>
Date: Thu,  8 Jun 2023 15:29:56 +0800
Subject: [PATCH v4 06/13] lib: sbi: implifying the parameters of printi
In-Reply-To: <20230608073003.1565710-1-wxjstz@126.com>
References: <20230608073003.1565710-1-wxjstz@126.com>
Message-ID: <20230608073003.1565710-7-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The information of sg/b/letbase can be obtained by the type character,
simplifying the parameter by passing the type directly.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 126 ++++++++++++++++--------------------------
 1 file changed, 49 insertions(+), 77 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 7f32f81..a9a2ed6 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -184,15 +184,26 @@ static int prints(char **out, u32 *out_len, const char *string, int width,
 	return pc;
 }
 
-static int printi(char **out, u32 *out_len, long long i, int b, int sg,
-		  int width, int flags, int letbase)
+static int printi(char **out, u32 *out_len, long long i,
+		  int width, int flags, int type)
 {
-	char *s, sign, print_buf[PRINT_BUF_LEN];
 	int pc = 0;
-	u64 t;
-	unsigned long long u = i;
+	char *s, sign, letbase, print_buf[PRINT_BUF_LEN];
+	unsigned long long u, b, t;
+
+	b = 10;
+	letbase = 'a';
+	if (type == 'o')
+		b = 8;
+	else if (type == 'x' || type == 'X' || type == 'p' || type == 'P') {
+		b = 16;
+		letbase &= ~0x20;
+		letbase |= type & 0x20;
+	}
 
-	if (sg && b == 10) {
+	u = i;
+	sign = 0;
+	if (type == 'i' || type == 'd') {
 		if ((flags & PAD_SIGN) && i > 0)
 			sign = '+';
 		if (i < 0) {
@@ -242,9 +253,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 {
 	bool flags_done;
 	int width, flags, pc = 0;
-	char scr[2], *tout;
+	char type, scr[2], *tout;
 	bool use_tbuf = (!out) ? true : false;
-	unsigned long long tmp;
 
 	/*
 	 * The console_tbuf is protected by console_out_lock and
@@ -315,83 +325,45 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			}
 			if ((*format == 'd') || (*format == 'i')) {
 				pc += printi(out, out_len, va_arg(args, int),
-					     10, 1, width, flags, '0');
-				continue;
-			}
-			if (*format == 'x') {
-				pc += printi(out, out_len,
-					     va_arg(args, unsigned int), 16, 0,
-					     width, flags, 'a');
-				continue;
-			}
-			if (*format == 'X') {
-				pc += printi(out, out_len,
-					     va_arg(args, unsigned int), 16, 0,
-					     width, flags, 'A');
+					     width, flags, *format);
 				continue;
 			}
-			if (*format == 'u') {
-				pc += printi(out, out_len,
-					     va_arg(args, unsigned int), 10, 0,
-					     width, flags, 'a');
+			if ((*format == 'u') || (*format == 'x') || (*format == 'X')) {
+				pc += printi(out, out_len, va_arg(args, unsigned int),
+					     width, flags, *format);
 				continue;
 			}
-			if (*format == 'p') {
-				pc += printi(out, out_len,
-					     va_arg(args, unsigned long), 16, 0,
-					     width, flags, 'a');
+			if ((*format == 'p') || (*format == 'P')) {
+				pc += printi(out, out_len, (uintptr_t)va_arg(args, void*),
+					     width, flags, *format);
 				continue;
 			}
-			if (*format == 'P') {
-				pc += printi(out, out_len,
-					     va_arg(args, unsigned long), 16, 0,
-					     width, flags, 'A');
-				continue;
-			}
-			if (*format == 'l' && *(format + 1) == 'l') {
-				tmp = va_arg(args, unsigned long long);
-				if (*(format + 2) == 'u') {
-					format += 2;
-					pc += printi(out, out_len, tmp, 10, 0,
-						     width, flags, 'a');
-				} else if (*(format + 2) == 'x') {
-					format += 2;
-					pc += printi(out, out_len, tmp, 16, 0,
-						     width, flags, 'a');
-				} else if (*(format + 2) == 'X') {
-					format += 2;
-					pc += printi(out, out_len, tmp, 16, 0,
-						     width, flags, 'A');
-				} else {
-					format += 1;
-					pc += printi(out, out_len, tmp, 10, 1,
-						     width, flags, '0');
+			if (*format == 'l') {
+				type = 'i';
+				if (format[1] == 'l') {
+					++format;
+					if ((format[1] == 'u')
+							|| (format[1] == 'd') || (format[1] == 'i')
+							|| (format[1] == 'x') || (format[1] == 'X')) {
+						++format;
+						type = *format;
+					}
+					pc += printi(out, out_len, va_arg(args, long long),
+						width, flags, type);
+					continue;
 				}
-				continue;
-			} else if (*format == 'l') {
-				if (*(format + 1) == 'u') {
-					format += 1;
-					pc += printi(
-						out, out_len,
-						va_arg(args, unsigned long), 10,
-						0, width, flags, 'a');
-				} else if (*(format + 1) == 'x') {
-					format += 1;
-					pc += printi(
-						out, out_len,
-						va_arg(args, unsigned long), 16,
-						0, width, flags, 'a');
-				} else if (*(format + 1) == 'X') {
-					format += 1;
-					pc += printi(
-						out, out_len,
-						va_arg(args, unsigned long), 16,
-						0, width, flags, 'A');
-				} else {
-					pc += printi(out, out_len,
-						     va_arg(args, long), 10, 1,
-						     width, flags, '0');
+				if ((format[1] == 'u')
+						|| (format[1] == 'd') || (format[1] == 'i')
+						|| (format[1] == 'x') || (format[1] == 'X')) {
+					++format;
+					type = *format;
 				}
+				if ((type == 'd') || (type == 'i'))
+					pc += printi(out, out_len, va_arg(args, long),
+					     width, flags, type);
+				else
+					pc += printi(out, out_len, va_arg(args, unsigned long),
+					     width, flags, type);
 				continue;
 			}
 			if (*format == 'c') {
-- 
2.39.2


