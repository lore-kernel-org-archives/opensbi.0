From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Thu, 15 Feb 2024 16:16:24 +0000
Subject: [PATCH v2 4/5] lib: tests: Add a test for sbi_bitmap
In-Reply-To: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
References: <20240215161625.314131-1-ivan.orlov0322@gmail.com>
Message-ID: <20240215161625.314131-5-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add test suite covering all of the functions from lib/sbi/sbi_bitmap.c:
__bitmap_and, __bitmap_or and __bitmap_xor.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Extract the part of the commit description to the cover letter
- Update to use the carray functionality instead of placing the pointer
to the test suite directly into the sources
- Fix codestyle issues
- Use the references to the data_* arrays when defining the expected
test results, instead of repeating the same numbers again and again

 lib/sbi/objects.mk        |   3 ++
 lib/sbi/sbi_bitmap_test.c | 103 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 lib/sbi/sbi_bitmap_test.c

diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 08959f1..b4c273f 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -14,6 +14,9 @@ libsbi-objs-y += riscv_locks.o
 libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_test.o
 libsbi-objs-$(CONFIG_SBIUNIT) += sbi_unit_tests.o
 
+libsbi-objs-$(CONFIG_SBIUNIT) += sbi_bitmap_test.o
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitmap_test_suite
+
 libsbi-objs-y += sbi_ecall.o
 libsbi-objs-y += sbi_ecall_exts.o
 
diff --git a/lib/sbi/sbi_bitmap_test.c b/lib/sbi/sbi_bitmap_test.c
new file mode 100644
index 0000000..918e7d9
--- /dev/null
+++ b/lib/sbi/sbi_bitmap_test.c
@@ -0,0 +1,103 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
+ */
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_console.h>
+
+#define DATA_SIZE sizeof(data_zero)
+#define DATA_BIT_SIZE (DATA_SIZE * 8)
+
+static u64 data_a[] = { 0xDEADBEEF, 0x00BAB10C, 0x1BADB002, 0xABADBABE };
+static u64 data_b[] = { 0xC00010FF, 0x00BAB10C, 0xBAAAAAAD, 0xBADDCAFE };
+static u64 data_zero[] = { 0, 0, 0, 0 };
+
+static void bitmap_and_test(struct sbiunit_test_case *test)
+{
+	u64 res[DATA_SIZE];
+	u64 a_and_b[] = { data_a[0] & data_b[0], data_a[1] & data_b[1],
+			  data_a[2] & data_b[2], data_a[3] & data_b[3] };
+
+	__bitmap_and(res, data_a, data_b, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, a_and_b, DATA_SIZE);
+
+	/* a & a = a */
+	__bitmap_and(res, data_a, data_a, DATA_BIT_SIZE);
+	SBIUNIT_ASSERT_MEMEQ(test, res, data_a, DATA_SIZE);
+
+	/* a & 0 = 0 */
+	__bitmap_and(res, data_a, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+
+	/* 0 & 0 = 0 */
+	__bitmap_and(res, data_zero, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+
+	sbi_memcpy(res, data_zero, DATA_SIZE);
+	/* Cover zero 'bits' argument */
+	__bitmap_and(res, data_a, data_b, 0);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+}
+
+static void bitmap_or_test(struct sbiunit_test_case *test)
+{
+	u64 res[DATA_SIZE];
+	u64 a_or_b[] = { data_a[0] | data_b[0], data_a[1] | data_b[1],
+			 data_a[2] | data_b[2], data_a[3] | data_b[3] };
+
+	__bitmap_or(res, data_a, data_b, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, a_or_b, DATA_SIZE);
+
+	/* a | a = a */
+	__bitmap_or(res, data_a, data_a, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
+
+	/* a | 0 = a */
+	__bitmap_or(res, data_a, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
+
+	/* 0 | 0 = 0 */
+	__bitmap_or(res, data_zero, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+
+	sbi_memcpy(res, data_zero, DATA_SIZE);
+	__bitmap_or(res, data_a, data_b, 0);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+}
+
+static void bitmap_xor_test(struct sbiunit_test_case *test)
+{
+	u64 res[DATA_SIZE];
+	u64 a_xor_b[] = { data_a[0] ^ data_b[0], data_a[1] ^ data_b[1],
+			  data_a[2] ^ data_b[2], data_a[3] ^ data_b[3] };
+
+	__bitmap_xor(res, data_a, data_b, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, a_xor_b, DATA_SIZE);
+
+	/* a ^ 0 = a */
+	__bitmap_xor(res, data_a, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_a, DATA_SIZE);
+
+	/* a ^ a = 0 */
+	__bitmap_xor(res, data_a, data_a, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+
+	/* 0 ^ 0 = 0 */
+	__bitmap_xor(res, data_zero, data_zero, DATA_BIT_SIZE);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+
+	sbi_memcpy(res, data_zero, DATA_SIZE);
+	__bitmap_xor(res, data_a, data_b, 0);
+	SBIUNIT_EXPECT_MEMEQ(test, res, data_zero, DATA_SIZE);
+}
+
+static struct sbiunit_test_case bitmap_test_cases[] = {
+	SBIUNIT_TEST_CASE(bitmap_and_test),
+	SBIUNIT_TEST_CASE(bitmap_or_test),
+	SBIUNIT_TEST_CASE(bitmap_xor_test),
+	{},
+};
+
+SBIUNIT_TEST_SUITE(bitmap_test_suite, bitmap_test_cases);
-- 
2.34.1


