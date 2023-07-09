From: Xiang W <wxjstz@126.com>
Date: Mon, 10 Jul 2023 00:02:21 +0800
Subject: [PATCH v9 01/11] lib: sbi: Fix how print gets flags
In-Reply-To: <20230709160231.202121-1-wxjstz@126.com>
References: <20230709160231.202121-1-wxjstz@126.com>
Message-ID: <20230709160231.202121-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The flags for print should be able to appear in any order. The
previous code required the order to be fixed.

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_console.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 168dffd..d87b5c2 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -236,6 +236,7 @@ static int printi(char **out, u32 *out_len, long long i, int b, int sg,
 
 static int print(char **out, u32 *out_len, const char *format, va_list args)
 {
+	bool flags_done;
 	int width, flags, pc = 0;
 	char scr[2], *tout;
 	bool use_tbuf = (!out) ? true : false;
@@ -268,17 +269,24 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 			if (*format == '%')
 				goto literal;
 			/* Get flags */
-			if (*format == '-') {
-				++format;
-				flags = PAD_RIGHT;
-			}
-			if (*format == '#') {
-				++format;
-				flags |= PAD_ALTERNATE;
-			}
-			while (*format == '0') {
-				++format;
-				flags |= PAD_ZERO;
+			flags_done = false;
+			while (!flags_done) {
+				switch (*format) {
+				case '-':
+					flags |= PAD_RIGHT;
+					break;
+				case '#':
+					flags |= PAD_ALTERNATE;
+					break;
+				case '0':
+					flags |= PAD_ZERO;
+					break;
+				default:
+					flags_done = true;
+					break;
+				}
+				if (!flags_done)
+					++format;
 			}
 			/* Get width */
 			for (; *format >= '0' && *format <= '9'; ++format) {
-- 
2.40.1


