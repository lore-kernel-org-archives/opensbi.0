From: Xiang W <wxjstz@126.com>
Date: Wed, 15 Sep 2021 17:03:29 +0800
Subject: [PATCH V2 1/2] lib: sbi: add some macros to detect BUG at runtime
Message-ID: <20210915090330.23354-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Two macros are mainly added. One is called BUG(), which is used to put
in unreachable branches. One named BUG_ON, used for assertion.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_console.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index e24ba5f..e75a279 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -11,6 +11,7 @@
 #define __SBI_CONSOLE_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/riscv_asm.h>
 
 struct sbi_console_device {
 	/** Name of the console device */
@@ -51,4 +52,16 @@ struct sbi_scratch;
 
 int sbi_console_init(struct sbi_scratch *scratch);
 
+#define BUG() do { \
+	sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
+	while (1)	\
+		wfi();	\
+	__builtin_unreachable(); \
+} while (0)
+
+#define BUG_ON(cond) do { \
+	if (!(cond))	\
+		BUG(); \
+} while (0)
+
 #endif
-- 
2.30.2


