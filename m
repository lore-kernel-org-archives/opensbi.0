From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 10 Jan 2025 14:15:51 +0100
Subject: [PATCH v6 2/7] lib: sbi: move sbi_double_trap_handler() to a dedicated header
In-Reply-To: <20250110131557.3261411-1-cleger@rivosinc.com>
References: <20250110131557.3261411-1-cleger@rivosinc.com>
Message-ID: <20250110131557.3261411-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We will add new functions to sbi_double_trap.c in order to register an
SSE event, split this to a header as part of preparation work.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_double_trap.h | 20 ++++++++++++++++++++
 include/sbi/sbi_trap_ldst.h   |  2 --
 lib/sbi/sbi_trap.c            |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 include/sbi/sbi_double_trap.h

diff --git a/include/sbi/sbi_double_trap.h b/include/sbi/sbi_double_trap.h
new file mode 100644
index 00000000..c3d64dfd
--- /dev/null
+++ b/include/sbi/sbi_double_trap.h
@@ -0,0 +1,20 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Rivos Inc.
+ *
+ * Authors:
+ *   Cl?ment L?ger <cleger@rivosinc.com>
+ */
+
+#ifndef __SBI_DOUBLE_TRAP_H__
+#define __SBI_DOUBLE_TRAP_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_trap.h>
+
+int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
+
+void sbi_double_trap_init(struct sbi_scratch *scratch);
+
+#endif
diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index 34877ccc..a6a6c75b 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -28,8 +28,6 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx);
 
 int sbi_store_access_handler(struct sbi_trap_context *tcntx);
 
-int sbi_double_trap_handler(struct sbi_trap_context *tcntx);
-
 ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 				 ulong addr_offset);
 
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 242ffe9b..e63a563b 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_double_trap.h>
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
-- 
2.47.1


