From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Mon,  1 Jul 2024 10:30:06 +0800
Subject: [PATCH 1/1] lib:tests: add math test suite
In-Reply-To: <20240701023006.16977-1-zhangdongdong@eswincomputing.com>
References: <20240701023006.16977-1-zhangdongdong@eswincomputing.com>
Message-ID: <20240701023006.16977-2-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

This patch introduces a new math test suite to the SBI unit
tests. The changes include:

* Updating lib/sbi/tests/objects.mk to include
  math_test_suite and sbi_math_test.o.
* Adding a new file lib/sbi/tests/sbi_math_test.c which
  contains tests for log2roundup function using various cases.

The addition of this test suite ensures that mathematical
functions are verified and work as expected.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 lib/sbi/tests/objects.mk      |  3 +++
 lib/sbi/tests/sbi_math_test.c | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_math_test.c

diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 8f27289..82b6061 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -12,3 +12,6 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_atomic_test.o
 
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += locks_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/riscv_locks_test.o
+
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += math_test_suite
+libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_math_test.o
\ No newline at end of file
diff --git a/lib/sbi/tests/sbi_math_test.c b/lib/sbi/tests/sbi_math_test.c
new file mode 100644
index 0000000..81ed832
--- /dev/null
+++ b/lib/sbi/tests/sbi_math_test.c
@@ -0,0 +1,46 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2024  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Author: Dongdong Zhang <zhangdongdong@eswincomputing.com>
+ */
+#include <sbi/sbi_math.h>
+#include <sbi/sbi_unit_test.h>
+
+static void log2roundup_test(struct sbiunit_test_case *test)
+{
+    struct {
+        unsigned long input;
+        unsigned long expected;
+    } cases[] = {
+        {1, 0},
+        {2, 1},
+        {3, 2},
+        {4, 2},
+        {5, 3},
+        {8, 3},
+        {9, 4},
+        {15, 4},
+        {16, 4},
+        {17, 5},
+        {31, 5},
+        {32, 5},
+        {33, 6},
+        {63, 6},
+        {64, 6},
+        {65, 7},
+    };
+
+    for (int i = 0; i < sizeof(cases)/sizeof(cases[0]); i++) {
+        unsigned long result = log2roundup(cases[i].input);
+        SBIUNIT_EXPECT_EQ(test, result, cases[i].expected);
+    }
+}
+
+static struct sbiunit_test_case math_test_cases[] = {
+    SBIUNIT_TEST_CASE(log2roundup_test),
+    SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(math_test_suite, math_test_cases);
-- 
2.17.1


