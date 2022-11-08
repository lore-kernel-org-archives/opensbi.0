From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  8 Nov 2022 08:55:09 +0530
Subject: [PATCH] lib: utils/serial: Fix semihosting compile error using LLVM
Message-ID: <20221108032509.1382464-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We fix the following semihosting compile error observed using LLVM:
lib/utils/serial/semihosting.c:158:12: error: result of comparison of constant -1 with expression of type 'char' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
                ret = ch > -1 ? ch : -1;
                      ~~ ^ ~~

Fixes: 7f09fba86e43 ("lib: utils/serial: add semihosting support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/serial/semihosting.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index 5012fa1..72bbbb3 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -155,7 +155,7 @@ static int semihosting_getc(void)
 
 	if (semihosting_infd < 0)  {
 		ch = semihosting_trap(SYSREADC, NULL);
-		ret = ch > -1 ? ch : -1;
+		ret = ((int)ch > -1) ? ch : -1;
 	} else
 		ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;
 
-- 
2.34.1


