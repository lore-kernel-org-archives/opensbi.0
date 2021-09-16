From: Xiang W <wxjstz@126.com>
Date: Thu, 16 Sep 2021 12:32:49 +0800
Subject: [PATCH V4 1/2] lib: sbi: add some macros to detect BUG at runtime
Message-ID: <20210916043250.8656-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Three macros are added. One is called BUG, which is used to put in an
unreachable branch. One is called BUG_ON, which is used to check bugs
and assert conditions are opposite. One is called SBI_ASSERT, used for
assertion checking.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_console.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
index e24ba5f..05d2f57 100644
--- a/include/sbi/sbi_console.h
+++ b/include/sbi/sbi_console.h
@@ -11,6 +11,8 @@
 #define __SBI_CONSOLE_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_hart.h>
 
 struct sbi_console_device {
 	/** Name of the console device */
@@ -51,4 +53,21 @@ struct sbi_scratch;
 
 int sbi_console_init(struct sbi_scratch *scratch);
 
+#define BUG() do { \
+	sbi_printf("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
+	sbi_hart_hang(); \
+} while (0)
+
+#define BUG_ON(cond) do { \
+	if (cond)	\
+		BUG();	\
+} while (0)
+
+#define SBI_ASSERT(cond) do { \
+	if (!(cond)) { \
+		sbi_printf("ASSERT: %s:%d/%s(): Assertion `%s` failed.\n", __FILE__,__LINE__,__func__, #cond);\
+		sbi_hart_hang(); \
+	} \
+} while (0)
+
 #endif
-- 
2.30.2


