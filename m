From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 20 Feb 2025 09:53:01 -0800
Subject: [PATCH] lib: sbi: Avoid GOT indirection for global symbol references
Message-ID: <20250220175307.9672-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI is compiled with -fPIE, which generally implies dynamic linking.
This causes the compiler to generate GOT references for global symbols
in order to support runtime symbol interposition. However, OpenSBI does
not actually perform dynamic linking, so the GOT indirection just adds
unnecessary overhead.

The GOT references can be avoided by declaring global symbols with
hidden visibility, thus making them local to this dynamic object and
non-interposable. GCC/Clang's -fvisibility parameter is insufficient for
this purpose when referencing objects from other translation units;
either __attribute__((visibility(...)) or the pragma is required. Use
the pragma since it is easier to apply to every symbol. Additionally
clean up the one GOT reference from inline assembly.

With this change, a firmware linked with LLD does not contain either a
GOT or a PLT, and a firmware linked with BFD ld contains only a GOT with
a single (unreferenced, legacy) _GLOBAL_OFFSET_TABLE_ entry.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Makefile                       |  1 +
 include/sbi/sbi_visibility.h   | 16 ++++++++++++++++
 lib/utils/serial/semihosting.c |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_visibility.h

diff --git a/Makefile b/Makefile
index 419ce66b..7de3fc96 100644
--- a/Makefile
+++ b/Makefile
@@ -350,6 +350,7 @@ ifeq ($(BUILD_INFO),y)
 GENFLAGS	+=	-DOPENSBI_BUILD_TIME_STAMP="\"$(OPENSBI_BUILD_TIME_STAMP)\""
 GENFLAGS	+=	-DOPENSBI_BUILD_COMPILER_VERSION="\"$(OPENSBI_BUILD_COMPILER_VERSION)\""
 endif
+GENFLAGS	+=	-include $(include_dir)/sbi/sbi_visibility.h
 ifdef PLATFORM
 GENFLAGS	+=	-include $(KCONFIG_AUTOHEADER)
 endif
diff --git a/include/sbi/sbi_visibility.h b/include/sbi/sbi_visibility.h
new file mode 100644
index 00000000..e9c401c5
--- /dev/null
+++ b/include/sbi/sbi_visibility.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive
+ */
+
+#ifndef __SBI_VISIBILITY_H__
+#define __SBI_VISIBILITY_H__
+
+/*
+ * Declare all global objects with hidden visibility so access is PC-relative
+ * instead of going through the GOT.
+ */
+#pragma GCC visibility push(hidden)
+
+#endif
diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
index 19ebaa07..3a42ba60 100644
--- a/lib/utils/serial/semihosting.c
+++ b/lib/utils/serial/semihosting.c
@@ -67,7 +67,7 @@ bool semihosting_enabled(void)
 		"	mret\n"
 		"_semihost_test_vector_next:\n"
 
-		"	la %[tmp], _semihost_test_vector\n"
+		"	lla %[tmp], _semihost_test_vector\n"
 		"	csrrw %[tmp], mtvec, %[tmp]\n"
 		"	.align 4\n"
 		"	slli zero, zero, 0x1f\n"
-- 
2.47.2


