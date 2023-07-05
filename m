From: Xiang W <wxjstz@126.com>
Date: Wed,  5 Jul 2023 22:36:58 +0800
Subject: [PATCH v8 06/11] lib: sbi: print add 'o' type
In-Reply-To: <20230705143703.635254-1-wxjstz@126.com>
References: <20230705143703.635254-1-wxjstz@126.com>
Message-ID: <20230705143703.635254-7-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add o type for print to print octal numbers

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_console.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 7dd023f..2a43e16 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -327,7 +327,8 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 					     width, flags, *format);
 				continue;
 			}
-			if ((*format == 'u') || (*format == 'x') || (*format == 'X')) {
+			if ((*format == 'u') || (*format == 'o')
+					 || (*format == 'x') || (*format == 'X')) {
 				pc += printi(out, out_len, va_arg(args, unsigned int),
 					     width, flags, *format);
 				continue;
@@ -341,7 +342,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				type = 'i';
 				if (format[1] == 'l') {
 					++format;
-					if ((format[1] == 'u')
+					if ((format[1] == 'u') || (format[1] == 'o')
 							|| (format[1] == 'd') || (format[1] == 'i')
 							|| (format[1] == 'x') || (format[1] == 'X')) {
 						++format;
@@ -351,7 +352,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 						width, flags, type);
 					continue;
 				}
-				if ((format[1] == 'u')
+				if ((format[1] == 'u') || (format[1] == 'o')
 						|| (format[1] == 'd') || (format[1] == 'i')
 						|| (format[1] == 'x') || (format[1] == 'X')) {
 					++format;
-- 
2.40.1


