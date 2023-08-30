From: Inochi Amaoto <inochiama@outlook.com>
Date: Wed, 30 Aug 2023 08:34:43 +0800
Subject: [PATCH] firmware: payload: test: Change to SBI v2.0 DBCN ecalls
Message-ID: <IA1PR20MB49533BF011EF79795C4226EEBBE6A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As the the "Console Putchar" extension is already legacy and may
be removed in the furture. So replace it with the SBI v2.0 "DBCN"
extension.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 firmware/payloads/test_main.c | 49 +++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/firmware/payloads/test_main.c b/firmware/payloads/test_main.c
index ae2ed4f..194dbbe6 100644
--- a/firmware/payloads/test_main.c
+++ b/firmware/payloads/test_main.c
@@ -8,31 +8,42 @@
  */

 #include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_string.h>

-#define SBI_ECALL(__eid, __fid, __a0, __a1, __a2)                             \
-	({                                                                    \
-		register unsigned long a0 asm("a0") = (unsigned long)(__a0);  \
-		register unsigned long a1 asm("a1") = (unsigned long)(__a1);  \
-		register unsigned long a2 asm("a2") = (unsigned long)(__a2);  \
-		register unsigned long a6 asm("a6") = (unsigned long)(__fid); \
-		register unsigned long a7 asm("a7") = (unsigned long)(__eid); \
-		asm volatile("ecall"                                          \
-			     : "+r"(a0)                                       \
-			     : "r"(a1), "r"(a2), "r"(a6), "r"(a7)             \
-			     : "memory");                                     \
-		a0;                                                           \
-	})
+struct sbiret {
+	unsigned long error;
+	unsigned long value;
+};

-#define SBI_ECALL_0(__eid, __fid) SBI_ECALL(__eid, __fid, 0, 0, 0)
-#define SBI_ECALL_1(__eid, __fid, __a0) SBI_ECALL(__eid, __fid, __a0, 0, 0)
-#define SBI_ECALL_2(__eid, __fid, __a0, __a1) SBI_ECALL(__eid, __fid, __a0, __a1, 0)
+struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+			unsigned long arg1, unsigned long arg2,
+			unsigned long arg3, unsigned long arg4,
+			unsigned long arg5)
+{
+	struct sbiret ret;

-#define sbi_ecall_console_putc(c) SBI_ECALL_1(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, (c))
+	register unsigned long a0 asm ("a0") = (unsigned long)(arg0);
+	register unsigned long a1 asm ("a1") = (unsigned long)(arg1);
+	register unsigned long a2 asm ("a2") = (unsigned long)(arg2);
+	register unsigned long a3 asm ("a3") = (unsigned long)(arg3);
+	register unsigned long a4 asm ("a4") = (unsigned long)(arg4);
+	register unsigned long a5 asm ("a5") = (unsigned long)(arg5);
+	register unsigned long a6 asm ("a6") = (unsigned long)(fid);
+	register unsigned long a7 asm ("a7") = (unsigned long)(ext);
+	asm volatile ("ecall"
+		      : "+r" (a0), "+r" (a1)
+		      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+		      : "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}

 static inline void sbi_ecall_console_puts(const char *str)
 {
-	while (str && *str)
-		sbi_ecall_console_putc(*str++);
+	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+		  sbi_strlen(str), (unsigned long)str, 0, 0, 0, 0);
 }

 #define wfi()                                             \
--
2.42.0


