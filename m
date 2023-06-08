From: Xiang W <wxjstz@126.com>
Date: Thu,  8 Jun 2023 15:32:13 +0800
Subject: [PATCH v4 12/13] lib: sbi: Fix timing of clearing tbuf
In-Reply-To: <20230608073214.1566095-1-wxjstz@126.com>
References: <20230608073003.1565710-1-wxjstz@126.com>
 <20230608073214.1566095-1-wxjstz@126.com>
Message-ID: <20230608073214.1566095-2-wxjstz@126.com>
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
index 7f6ab14..7d811e7 100644
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
 
@@ -161,6 +163,11 @@ append:
 	info->out[info->pos++] = ch;
 	info->out[info->pos] = '\0';
 	info->pc++;
+
+	if ((info->flags & USED_TBUF) && (info->len - info->pos <= 1)) {
+		nputs_all(info->out, info->pos);
+		info->pos = 0;
+	}
 }
 
 static void prints(struct print_info *info, const char *string)
@@ -266,11 +273,6 @@ static void print(struct print_info *info, const char *format, va_list args)
 	}
 
 	for (; *format != 0; ++format) {
-		if (use_tbuf && (info->len - info->pos <= 1)) {
-			nputs_all(info->out, info->pos);
-			info->pos = 0;
-		}
-
 		if (*format == '%') {
 			++format;
 			if (*format == '\0')
@@ -305,6 +307,8 @@ static void print(struct print_info *info, const char *format, va_list args)
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


