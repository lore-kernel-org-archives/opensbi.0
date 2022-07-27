From: dramforever <dramforever@live.com>
Date: Wed, 27 Jul 2022 22:07:39 +0800
Subject: [PATCH] lib: sbi: Fix printf handling of long long
Message-ID: <TYYP286MB1439FD2B8C624B5346185D7DC6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not attempt to unnecessarily align va_list before reading long long
arguments.

Signed-off-by: dramforever <dramforever@live.com>
---
 lib/sbi/sbi_console.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
index 34c843d..7af50e5 100644
--- a/lib/sbi/sbi_console.c
+++ b/lib/sbi/sbi_console.c
@@ -261,11 +261,6 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
 				continue;
 			}
 			if (*format == 'l' && *(format + 1) == 'l') {
-				while (acnt &
-				       (sizeof(unsigned long long) - 1)) {
-					va_arg(args, int);
-					acnt += sizeof(int);
-				}
 				if (sizeof(unsigned long long) ==
 				    sizeof(unsigned long)) {
 					tmp = va_arg(args, unsigned long long);
-- 
2.37.0


