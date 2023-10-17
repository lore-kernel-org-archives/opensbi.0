From: cp0613@linux.alibaba.com <cp0613@linux.alibaba.com>
Date: Tue, 17 Oct 2023 19:53:12 +0800
Subject: [PATCH] lib: utils/serial: Optimize semihosting_putc implementation
Message-ID: <20231017115312.268-1-cp0613@linux.alibaba.com>
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
---
 lib/utils/serial/semihosting.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index ce65887..9bbf2e2 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -162,7 +162,10 @@ static long semihosting_write(long fd, const void *memp, size_t len)
 
 static void semihosting_putc(char ch)
 {
-	semihosting_trap(SYSWRITEC, &ch);
+	if (semihosting_outfd < 0)
+		semihosting_trap(SYSWRITEC, &ch);
+	else
+		semihosting_write(semihosting_outfd, &ch, 1);
 }
 
 static unsigned long semihosting_puts(const char *str, unsigned long len)
-- 
2.25.1


