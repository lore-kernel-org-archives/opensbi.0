From: cp0613@linux.alibaba.com <cp0613@linux.alibaba.com>
Date: Wed, 18 Oct 2023 10:42:05 +0800
Subject: [PATCH v2] lib: utils/serial: Optimize semihosting_putc implementation
Message-ID: <20231018024205.270-1-cp0613@linux.alibaba.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chen Pei <cp0613@linux.alibaba.com>

For some debuggers that do not implement SYSWRITEC and SYSREADC
operations, we can use SYSWRITE and SYSREAD instead like the
implementation of semihosting_getc().

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Xiang W <wxjstz@126.com>

Changed from v1:
1. simplified by calling semihosting_puts directly.

---
 lib/utils/serial/semihosting.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index ce65887..a27c69e 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -160,11 +160,6 @@ static long semihosting_write(long fd, const void *memp, size_t len)
 
 /* clang-format on */
 
-static void semihosting_putc(char ch)
-{
-	semihosting_trap(SYSWRITEC, &ch);
-}
-
 static unsigned long semihosting_puts(const char *str, unsigned long len)
 {
 	char ch;
@@ -183,6 +178,11 @@ static unsigned long semihosting_puts(const char *str, unsigned long len)
 	return (ret < 0) ? 0 : ret;
 }
 
+static void semihosting_putc(char ch)
+{
+	semihosting_puts(&ch, 1);
+}
+
 static int semihosting_getc(void)
 {
 	char ch = 0;
-- 
2.25.1


