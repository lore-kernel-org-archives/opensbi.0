From: 1220749046@qq.com <1220749046@qq.com>
Date: Thu, 10 Nov 2022 10:11:07 +0800
Subject: [PATCH] lib: utils/serial: Fix compilation errors with LLVM
Message-ID: <tencent_B61B313CB7C38FFC16B03BA1CBEC14BAB906@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: zhangleizheng <zhangleizheng@eswincomputing.com>

Fix: "Getting compilation error on generic firmware #269"
     opensbi/lib/utils/serial/semihosting.c:158:12: error: result
     of comparison of constant -1 with expression of type 'char'
     is always true [-Werror,-Wtautological-constant-out-of-range-compare]
        ret = ch > -1 ? ch : -1;

Using clang16 as the compiler.

Signed-off-by: zhangleizheng <zhangleizheng@eswincomputing.com>
---
 lib/utils/serial/semihosting.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index 5012fa1..27dba6f 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -150,11 +150,11 @@ static void semihosting_putc(char ch)
 
 static int semihosting_getc(void)
 {
-	char ch = 0;
+	signed char ch = 0;
 	int ret;
 
 	if (semihosting_infd < 0)  {
-		ch = semihosting_trap(SYSREADC, NULL);
+		ch = (signed char)semihosting_trap(SYSREADC, NULL);
 		ret = ch > -1 ? ch : -1;
 	} else
 		ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
-- 
2.17.1


