From: Clément Léger <cleger@rivosinc.com>
Date: Thu,  2 Jan 2025 14:39:12 +0100
Subject: [PATCH v5 3/6] include: lib: add a simple simply linked list implementation
In-Reply-To: <20250102133916.413899-1-cleger@rivosinc.com>
References: <20250102133916.413899-1-cleger@rivosinc.com>
Message-ID: <20250102133916.413899-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a simple linked list implementation when double linked list are not
needed. This allows to easily have statically defined linked list that
can be extended at runtime.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_slist.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 include/sbi/sbi_slist.h

diff --git a/include/sbi/sbi_slist.h b/include/sbi/sbi_slist.h
new file mode 100644
index 00000000..e4b83cfd
--- /dev/null
+++ b/include/sbi/sbi_slist.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Simple simply-linked list library.
+ *
+ * Copyright (c) 2025 Rivos Inc.
+ *
+ * Authors:
+ *   Cl?ment L?ger <cleger@rivosinc.com>
+ */
+
+#ifndef __SBI_SLIST_H__
+#define __SBI_SLIST_H__
+
+#include <sbi/sbi_types.h>
+
+#define SBI_SLIST_HEAD_INIT(_ptr)	(_ptr)
+#define SBI_SLIST_HEAD(_lname, _stype) struct _stype *_lname
+#define SBI_SLIST_NODE(_stype) SBI_SLIST_HEAD(next, _stype)
+#define SBI_SLIST_NODE_INIT(_ptr) .next = _ptr
+
+#define SBI_INIT_SLIST_HEAD(_head) (_head) = NULL
+
+#define SBI_SLIST_ADD(_ptr, _head) \
+do { \
+	(_ptr)->next = _head; \
+	(_head) = _ptr; \
+} while (0)
+
+#define SBI_SLIST_FOR_EACH_ENTRY(_ptr, _head) \
+	for (_ptr = _head; _ptr; _ptr = _ptr->next)
+
+#endif
-- 
2.45.2


