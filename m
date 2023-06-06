From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Jun 2023 18:32:48 +0800
Subject: [PATCH v2 12/12] lib: sbi: Fix timing of clearing tbuf
Message-ID: <20230606103248.1218864-1-wxjstz@126.com>
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
 lib/sbi/sbi_console.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 922de20..d4e2651 100644
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
@@ -248,6 +255,7 @@ static void print(struct print_info *info, const char *format, va_list args)
 	bool use_tbuf = (!info->out) ? true : false;
 	info->pos = 0;
 	info->pc = 0;
+	info->flags = 0;
 
 	/*
 	 * The console_tbuf is protected by console_out_lock and
@@ -255,16 +263,12 @@ static void print(struct print_info *info, const char *format, va_list args)
 	 * when out == NULL.
 	 */
 	if (use_tbuf) {
+		info->flags |= USED_TBUF;
 		info->out = console_tbuf;
 		info->len = CONSOLE_TBUF_MAX;
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
@@ -272,7 +276,7 @@ static void print(struct print_info *info, const char *format, va_list args)
 			if (*format == '%')
 				goto literal;
 			/* Get flags */
-			info->flags = 0;
+			info->flags &= USED_TBUF;
 			flags_done = false;
 			while (!flags_done) {
 				switch (*format) {
-- 
2.39.2


