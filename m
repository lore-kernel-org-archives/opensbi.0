From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Jun 2023 21:29:44 +0800
Subject: [PATCH v3 12/12] lib: sbi: Fix timing of clearing tbuf
Message-ID: <20230606132944.1240924-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A single scan of the format char may add multiple characters to the
tbuf, causing a buffer overflow. You should check if tbuf is full in
printc so that it does not cause a buffer overflow.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_console.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 7608bbd..dfc24af 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -18,6 +18,8 @@
 #define PAD_ZERO 2
 #define PAD_ALTERNATE 4
 #define PAD_SIGN 8
+#define USED_TBUF (1 << (8 * sizeof(int) - 1))
+
 #define PRINT_BUF_LEN 64
 #define CONSOLE_TBUF_MAX 256
 
@@ -155,6 +157,11 @@ static void printc(struct print_info *info, char ch)
 			info->pc++;
 		}
 	}
+
+	if ((info->flags & USED_TBUF) && info->len - info->pos < 2) {
+		nputs_all(info->out, info->pos);
+		info->pos = 0;
+	}
 }
 
 static void prints(struct print_info *info, const char *string)
@@ -260,11 +267,6 @@ static void print(struct print_info *info, const char *format, va_list args)
 	}
 
 	for (; *format != 0; ++format) {
-		if (use_tbuf && info->len - info->pos < 2) {
-			nputs_all(info->out, info->pos);
-			info->pos = 0;
-		}
-
 		if (*format == '%') {
 			++format;
 			if (*format == '\0')
@@ -299,6 +301,8 @@ static void print(struct print_info *info, const char *format, va_list args)
 				if (!flags_done)
 					++format;
 			}
+			if (use_tbuf)
+				info->flags |= USED_TBUF;
 			if (info->flags & PAD_RIGHT)
 				info->flags &= ~PAD_ZERO;
 			/* Get width */
-- 
2.39.2


