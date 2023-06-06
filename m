From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Jun 2023 21:24:37 +0800
Subject: [PATCH v3 04/12] lib: sbi: Add '+' flags for print
In-Reply-To: <20230606132445.1239808-1-wxjstz@126.com>
References: <20230606132445.1239808-1-wxjstz@126.com>
Message-ID: <20230606132445.1239808-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index b18f9c5..a616316 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -120,6 +120,7 @@ unsigned long sbi_ngets(char *str, unsigned long len)
 #define PAD_RIGHT 1
 #define PAD_ZERO 2
 #define PAD_ALTERNATE 4
+#define PAD_SIGN 8
 #define PRINT_BUF_LEN 64
 
 #define va_start(v, l) __builtin_va_start((v), l)
@@ -186,15 +187,18 @@ static int prints(char **out, u32 *out_len, const char *string, int width,
 static int printi(char **out, u32 *out_len, long long i, int b, int sg,
 		  int width, int flags, int letbase)
 {
-	char print_buf[PRINT_BUF_LEN];
-	char *s;
-	int neg = 0, pc = 0;
+	char *s, sign, print_buf[PRINT_BUF_LEN];
+	int pc = 0;
 	u64 t;
 	unsigned long long u = i;
 
-	if (sg && b == 10 && i < 0) {
-		neg = 1;
-		u   = -i;
+	if (sg && b == 10) {
+		if ((flags & PAD_SIGN) && i > 0)
+			sign = '+';
+		if (i < 0) {
+			sign = '-';
+			u = -i;
+		}
 	}
 
 	s  = print_buf + PRINT_BUF_LEN - 1;
@@ -221,13 +225,13 @@ static int printi(char **out, u32 *out_len, long long i, int b, int sg,
 		*--s = '0';
 	}
 
-	if (neg) {
+	if (sign) {
 		if (width && (flags & PAD_ZERO)) {
-			printc(out, out_len, '-');
+			printc(out, out_len, sign);
 			++pc;
 			--width;
 		} else {
-			*--s = '-';
+			*--s = sign;
 		}
 	}
 
@@ -275,6 +279,9 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				case '-':
 					flags |= PAD_RIGHT;
 					break;
+				case '+':
+					flags |= PAD_SIGN;
+					break;
 				case '#':
 					flags |= PAD_ALTERNATE;
 					break;
-- 
2.39.2


