From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 27 Jul 2022 14:12:01 +0200
Subject: [PATCH v2] lib: sbi: Fix sbi_snprintf
Message-ID: <20220727121201.11508-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

printc would happily write to 'out' even when 'out_len' was zero,
potentially overflowing buffers. Rework printc to not do that and
also ensure the null byte is written at the last position when
necessary, as stated in the snprintf man page. Also, panic if
sprintf or snprintf are called with NULL output strings (except
the special case of snprintf having a NULL output string and
a zero output size, allowing it to be used to get the number of
characters that would have been written). Finally, rename a
goto label which clashed with 'out'.

Fixes: 9e8ff05cb61f ("Initial commit.")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

v2:
  - Simply forbid *out == NULL by panicing when it's detected.
    (The error message for snprintf has been split over two
     lines to avoid going over 80 chars. I'd prefer error messages
     not be split, but that seems like the general practice for
     opensbi.)
  - Drop some branches, particularly the extra 'if (out)' in print(),
    by always writing a '\0' on each printc [Xiang W]


 lib/sbi/sbi_console.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 34c843d3f9e3..e300d710b5c8 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -76,20 +76,18 @@ typedef __builtin_va_list va_list;
 
 static void printc(char **out, u32 *out_len, char ch)
 {
-	if (out) {
-		if (*out) {
-			if (out_len && (0 < *out_len)) {
-				**out = ch;
-				++(*out);
-				(*out_len)--;
-			} else {
-				**out = ch;
-				++(*out);
-			}
-		}
-	} else {
+	if (!out) {
 		sbi_putc(ch);
+		return;
 	}
+
+	if (!out_len || *out_len > 1) {
+		*(*out)++ = ch;
+		**out = '\0';
+	}
+
+	if (out_len && *out_len > 0)
+		--(*out_len);
 }
 
 static int prints(char **out, u32 *out_len, const char *string, int width,
@@ -193,7 +191,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			if (*format == '\0')
 				break;
 			if (*format == '%')
-				goto out;
+				goto literal;
 			/* Get flags */
 			if (*format == '-') {
 				++format;
@@ -332,13 +330,11 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				continue;
 			}
 		} else {
-		out:
+literal:
 			printc(out, out_len, *format);
 			++pc;
 		}
 	}
-	if (out)
-		**out = '\0';
 
 	return pc;
 }
@@ -348,6 +344,9 @@ int sbi_sprintf(char *out, const char *format, ...)
 	va_list args;
 	int retval;
 
+	if (unlikely(!out))
+		sbi_panic("sbi_sprintf called with NULL output string\n");
+
 	va_start(args, format);
 	retval = print(&out, NULL, format, args);
 	va_end(args);
@@ -360,6 +359,10 @@ int sbi_snprintf(char *out, u32 out_sz, const char *format, ...)
 	va_list args;
 	int retval;
 
+	if (unlikely(!out && out_sz != 0))
+		sbi_panic("sbi_snprintf called with NULL output string and "
+			  "output size is not zero\n");
+
 	va_start(args, format);
 	retval = print(&out, &out_sz, format, args);
 	va_end(args);
-- 
2.36.1


