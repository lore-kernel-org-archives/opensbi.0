From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 26 Jul 2022 13:25:22 +0200
Subject: [PATCH] lib: sbi: Fix sbi_snprintf
Message-ID: <20220726112522.5070-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

printc would happily write to 'out' even when 'out_len' was zero,
potentially overflowing buffers. Rework printc to not do that and
also ensure the null byte is written at the last position when
necessary, as stated in the snprintf man page. Finally, ensure all
writes to 'out' go through printc and rename a goto label which
clashed with it.

Fixes: 9e8ff05cb61f ("Initial commit.")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_console.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 34c843d3f9e3..47f361705fc7 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -76,20 +76,24 @@ typedef __builtin_va_list va_list;
 
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
+	if (!*out)
+		return;
+
+	if (!out_len || *out_len > 1)
+		**out = ch;
+	else if (*out_len == 1)
+		**out = '\0';
+
+	if (out_len && *out_len > 0)
+		--(*out_len);
+
+	if (!out_len || *out_len > 0)
+		++(*out);
 }
 
 static int prints(char **out, u32 *out_len, const char *string, int width,
@@ -193,7 +197,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			if (*format == '\0')
 				break;
 			if (*format == '%')
-				goto out;
+				goto literal;
 			/* Get flags */
 			if (*format == '-') {
 				++format;
@@ -332,13 +336,14 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				continue;
 			}
 		} else {
-		out:
+literal:
 			printc(out, out_len, *format);
 			++pc;
 		}
 	}
+
 	if (out)
-		**out = '\0';
+		printc(out, out_len, '\0');
 
 	return pc;
 }
-- 
2.36.1


