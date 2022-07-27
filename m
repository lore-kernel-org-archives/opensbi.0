From: dramforever <dramforever@live.com>
Date: Thu, 28 Jul 2022 00:30:05 +0800
Subject: [PATCH v3] lib: sbi: Fix printf handling of long long
Message-ID: <TYYP286MB14396B0D3F810E64516CFE9DC6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Read long long arguments directly using va_arg. Remove original hack for
RV32 that read a long long arg as two long args.

This un-breaks the case on RV64 where e.g. the long long is followed by
an odd number of ints:

    sbi_printf("%d %lld", (int) 1, (long long) 2LL);

Also remove the acnt variable, which is now unused.

Signed-off-by: dramforever <dramforever@live.com>
---

Changes since v2:

- Remove the acnt variable

Changes since v1:

- Removed hack that reads a long long as two longs 
- Better commit message

 lib/sbi/sbi_console.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 34c843d..6629b43 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -181,7 +181,7 @@ static int printi(char **out, u32 *out_len, long long i, int b, int sg,
 
 static int print(char **out, u32 *out_len, const char *format, va_list args)
 {
-	int width, flags, acnt = 0;
+	int width, flags;
 	int pc = 0;
 	char scr[2];
 	unsigned long long tmp;
@@ -214,7 +214,6 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			}
 			if (*format == 's') {
 				char *s = va_arg(args, char *);
-				acnt += sizeof(char *);
 				pc += prints(out, out_len, s ? s : "(null)",
 					     width, flags);
 				continue;
@@ -222,61 +221,40 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			if ((*format == 'd') || (*format == 'i')) {
 				pc += printi(out, out_len, va_arg(args, int),
 					     10, 1, width, flags, '0');
-				acnt += sizeof(int);
 				continue;
 			}
 			if (*format == 'x') {
 				pc += printi(out, out_len,
 					     va_arg(args, unsigned int), 16, 0,
 					     width, flags, 'a');
-				acnt += sizeof(unsigned int);
 				continue;
 			}
 			if (*format == 'X') {
 				pc += printi(out, out_len,
 					     va_arg(args, unsigned int), 16, 0,
 					     width, flags, 'A');
-				acnt += sizeof(unsigned int);
 				continue;
 			}
 			if (*format == 'u') {
 				pc += printi(out, out_len,
 					     va_arg(args, unsigned int), 10, 0,
 					     width, flags, 'a');
-				acnt += sizeof(unsigned int);
 				continue;
 			}
 			if (*format == 'p') {
 				pc += printi(out, out_len,
 					     va_arg(args, unsigned long), 16, 0,
 					     width, flags, 'a');
-				acnt += sizeof(unsigned long);
 				continue;
 			}
 			if (*format == 'P') {
 				pc += printi(out, out_len,
 					     va_arg(args, unsigned long), 16, 0,
 					     width, flags, 'A');
-				acnt += sizeof(unsigned long);
 				continue;
 			}
 			if (*format == 'l' && *(format + 1) == 'l') {
-				while (acnt &
-				       (sizeof(unsigned long long) - 1)) {
-					va_arg(args, int);
-					acnt += sizeof(int);
-				}
-				if (sizeof(unsigned long long) ==
-				    sizeof(unsigned long)) {
-					tmp = va_arg(args, unsigned long long);
-					acnt += sizeof(unsigned long long);
-				} else {
-					((unsigned long *)&tmp)[0] =
-						va_arg(args, unsigned long);
-					((unsigned long *)&tmp)[1] =
-						va_arg(args, unsigned long);
-					acnt += 2 * sizeof(unsigned long);
-				}
+				tmp = va_arg(args, unsigned long long);
 				if (*(format + 2) == 'u') {
 					format += 2;
 					pc += printi(out, out_len, tmp, 10, 0,
@@ -308,19 +286,16 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 						out, out_len,
 						va_arg(args, unsigned long), 16,
 						0, width, flags, 'a');
-					acnt += sizeof(unsigned long);
 				} else if (*(format + 1) == 'X') {
 					format += 1;
 					pc += printi(
 						out, out_len,
 						va_arg(args, unsigned long), 16,
 						0, width, flags, 'A');
-					acnt += sizeof(unsigned long);
 				} else {
 					pc += printi(out, out_len,
 						     va_arg(args, long), 10, 1,
 						     width, flags, '0');
-					acnt += sizeof(long);
 				}
 			}
 			if (*format == 'c') {
@@ -328,7 +303,6 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				scr[0] = va_arg(args, int);
 				scr[1] = '\0';
 				pc += prints(out, out_len, scr, width, flags);
-				acnt += sizeof(int);
 				continue;
 			}
 		} else {
-- 
2.37.0


