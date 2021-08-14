From: Samuel Holland <samuel@sholland.org>
Date: Sat, 14 Aug 2021 08:52:10 -0500
Subject: [PATCH] payloads/test: Add support for SBI v0.2 ecalls
Message-ID: <20210814135210.17729-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It can be useful to make SBI v0.2 or newer ecalls from this payload
for testing purposes. To support this, convert the macros to use the
extension/function parameter convention.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 firmware/payloads/test_main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/firmware/payloads/test_main.c b/firmware/payloads/test_main.c
index 0d65930..ae2ed4f 100644
--- a/firmware/payloads/test_main.c
+++ b/firmware/payloads/test_main.c
@@ -9,24 +9,25 @@
 
 #include <sbi/sbi_ecall_interface.h>
 
-#define SBI_ECALL(__num, __a0, __a1, __a2)                                    \
+#define SBI_ECALL(__eid, __fid, __a0, __a1, __a2)                             \
 	({                                                                    \
 		register unsigned long a0 asm("a0") = (unsigned long)(__a0);  \
 		register unsigned long a1 asm("a1") = (unsigned long)(__a1);  \
 		register unsigned long a2 asm("a2") = (unsigned long)(__a2);  \
-		register unsigned long a7 asm("a7") = (unsigned long)(__num); \
+		register unsigned long a6 asm("a6") = (unsigned long)(__fid); \
+		register unsigned long a7 asm("a7") = (unsigned long)(__eid); \
 		asm volatile("ecall"                                          \
 			     : "+r"(a0)                                       \
-			     : "r"(a1), "r"(a2), "r"(a7)                      \
+			     : "r"(a1), "r"(a2), "r"(a6), "r"(a7)             \
 			     : "memory");                                     \
 		a0;                                                           \
 	})
 
-#define SBI_ECALL_0(__num) SBI_ECALL(__num, 0, 0, 0)
-#define SBI_ECALL_1(__num, __a0) SBI_ECALL(__num, __a0, 0, 0)
-#define SBI_ECALL_2(__num, __a0, __a1) SBI_ECALL(__num, __a0, __a1, 0)
+#define SBI_ECALL_0(__eid, __fid) SBI_ECALL(__eid, __fid, 0, 0, 0)
+#define SBI_ECALL_1(__eid, __fid, __a0) SBI_ECALL(__eid, __fid, __a0, 0, 0)
+#define SBI_ECALL_2(__eid, __fid, __a0, __a1) SBI_ECALL(__eid, __fid, __a0, __a1, 0)
 
-#define sbi_ecall_console_putc(c) SBI_ECALL_1(SBI_EXT_0_1_CONSOLE_PUTCHAR, (c))
+#define sbi_ecall_console_putc(c) SBI_ECALL_1(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, (c))
 
 static inline void sbi_ecall_console_puts(const char *str)
 {
-- 
2.31.1


