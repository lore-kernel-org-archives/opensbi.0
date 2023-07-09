From: Xiang W <wxjstz@126.com>
Date: Mon, 10 Jul 2023 00:02:27 +0800
Subject: [PATCH v9 07/11] lib: sbi: Fix printi
In-Reply-To: <20230709160231.202121-1-wxjstz@126.com>
References: <20230709160231.202121-1-wxjstz@126.com>
Message-ID: <20230709160231.202121-8-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix two bug:
> printf("%#08x", 0x123); /* print 0000x123 */
> printf("%#x", 0); /* print 0x0 */

Signed-off-by: Xiang W <wxjstz@126.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_console.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 2a43e16..963d19f 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -227,23 +227,33 @@ static int printi(char **out, u32 *out_len, long long i,
 		}
 	}
 
-	if (flags & PAD_ALTERNATE) {
-		if ((b == 16) && (letbase == 'A')) {
-			*--s = 'X';
-		} else if ((b == 16) && (letbase == 'a')) {
-			*--s = 'x';
-		}
-		*--s = '0';
-	}
-
-	if (sign) {
-		if (width && (flags & PAD_ZERO)) {
+	if (flags & PAD_ZERO) {
+		if (sign) {
 			printc(out, out_len, sign);
 			++pc;
 			--width;
-		} else {
-			*--s = sign;
 		}
+		if (i && (flags & PAD_ALTERNATE)) {
+			if (b == 16 || b == 8) {
+				printc(out, out_len, '0');
+				++pc;
+				--width;
+			}
+			if (b == 16) {
+				printc(out, out_len, 'x' - 'a' + letbase);
+				++pc;
+				--width;
+			}
+		}
+	} else {
+		if (i && (flags & PAD_ALTERNATE)) {
+			if (b == 16)
+				*--s = 'x' - 'a' + letbase;
+			if (b == 16 || b == 8)
+				*--s = '0';
+		}
+		if (sign)
+			*--s = sign;
 	}
 
 	return pc + prints(out, out_len, s, width, flags);
-- 
2.40.1


