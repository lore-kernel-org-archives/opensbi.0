From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Thu,  8 Feb 2024 09:50:47 +0000
Subject: [PATCH 1/4] docs: Add documentation about tests and SBIUnit
Message-ID: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is good when the code is covered with tests. Tests help us to keep
the code clean and avoid regressions. Also, a good test is always a nice
documentation for the code it covers.

This and the subsequent patches in this series introduce SBIUnit - the
set of macros and functions which simplify the unit test development
for OpenSBI and automate tests execution and evaluation. Also, this
patch series contains two of the tests: one which covers functions from
lib/sbi_bitmap.c, and another covering a part of functions from
lib/sbi_console.c.

This patch contains the documentation for SBIUnit. It describes:

- What is SBIUnit
- Simple test writing scenario
- How we can cover static functions
- How we can "mock" structures in order to test the functions which
operate on them
- SBIUnit API Reference

This thing is mainly inspired by the KUnit framework from the Linux
Kernel, where the similar unit-test development tooling have been used
successfully for a pretty long time now. I believe it would be good to
have such a thing in OpenSBI as well.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 docs/writing_tests.md | 143 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 docs/writing_tests.md

diff --git a/docs/writing_tests.md b/docs/writing_tests.md
new file mode 100644
index 0000000..481f2ee
--- /dev/null
+++ b/docs/writing_tests.md
@@ -0,0 +1,143 @@
+Writing tests for OpenSBI
+=========================
+
+SBIUnit
+-------
+SBIUnit is a set of macros and functions which simplify the test development and automate the
+test execution and evaluation. All of the SBIUnit definitions could be found in
+`include/sbi/sbi_unit.h` header file, and implementations are available in `lib/sbi/sbi_unit.c`.
+
+Simple SBIUnit test
+-------------------
+
+For instance, we would like to test the following function from `lib/sbi/sbi_string.c`:
+
+```c
+size_t sbi_strlen(const char *str)
+{
+	unsigned long ret = 0;
+
+	while (*str != '\0') {
+		ret++;
+		str++;
+	}
+
+	return ret;
+}
+```
+
+Apparently, it calculates the string length.
+
+Create the file `lib/sbi/sbi_string_test.c` with the following content:
+
+```c
+#include <sbi/sbi_unit.h>
+#include <sbi/sbi_string.h>
+
+static void strlen_test(struct sbiunit_test_case *test)
+{
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 5);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hell\0o"), 4);
+}
+
+static struct sbiunit_test_case string_test_cases[] = {
+	SBIUNIT_TEST_CASE(strlen_test),
+	{},
+};
+
+SBIUNIT_TEST_SUITE(string_test_suite, string_test_cases);
+```
+
+After that, add the corresponding entry to `lib/sbi/sbi_unit.c` and update the `test_suites` array:
+```c
+...
+extern struct sbiunit_test_suite string_test_suite;
+...
+static struct sbiunit_test_suite *test_suites[] = {
+    ...
+    &string_test_suite,
+};
+...
+```
+
+Add the corresponding Makefile entry to `lib/sbi/objects.mk`:
+```lang-makefile
+...
+libsbi-objs-$(CONFIG_SBIUNIT) += sbi_string_test.o
+```
+
+Now recompile OpenSBI with CONFIG_SBIUNIT option enabled and run it in the QEMU. You will see
+something like this:
+```
+# make PLATFORM=generic run
+...
+# Running SBIUNIT tests #
+...
+## Running test suite: string_test_suite
+[OK] strlen_test
+1 SUCCESS / 0 FAIL / 1 TOTAL
+```
+
+Now let's try to change this test in the way that it will fail:
+
+```c
+- SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 5);
++ SBIUNIT_EXPECT_EQ(test, sbi_strlen("Hello"), 100);
+```
+
+Compile and run it again:
+```
+...
+# Running SBIUNIT tests #
+...
+## Running test suite: string_test_suite
+strlen_test: Condition "sbi_strlen("Hello") == 100" expected to be true!
+[FAIL] strlen_test
+0 SUCCESS / 1 FAIL / 1 TOTAL
+```
+Covering the static functions / using the static definitions
+------------------------------------------------------------
+
+SBIUnit also allows you to test static functions. In order to do so, simply include your test source
+in the file you would like to test. Complementing the example above, just add this to the
+`lib/sbi/sbi_string.c` file:
+
+```c
+#ifdef CONFIG_SBIUNIT
+#include "sbi_string_test.c"
+#endif
+```
+
+In this case you should not add a new entry to `lib/sbi/objects.mk`, because the test code will be
+included into the `sbi_string` object file.
+
+See example in `lib/sbi/sbi_console_test.c`, where statically declared `console_dev` variable is
+used to mock the `sbi_console_device` structure.
+
+"Mocking" the structures
+------------------------
+See the example of structure "mocking" in the `lib/sbi/sbi_console_test.c`, where the
+sbi_console_device structure was mocked to be used in various console-related functions in order to
+test them.
+
+API Reference
+-------------
+All of the `SBIUNIT_EXPECT_*` macros will cause a test case to fail if the corresponding conditions
+are not met, however, the execution of a particular test case will not be stopped.
+
+All of the `SBIUNIT_ASSERT_*` macros will cause a test case to fail and stop immediately.
+
+- `SBIUNIT_EXPECT(test_case, condition)` - sets an expectation that 'condition' is true
+- `SBIUNIT_ASSERT(test_case, condition)` - sets an assertion that 'condition' is true
+- `SBIUNIT_EXPECT_EQ(test_case, a, b)` - sets an expectation that a = b
+- `SBIUNIT_ASSERT_EQ(test_case, a, b)` - sets an assertion that a = b
+- `SBIUNIT_EXPECT_NE(test_case, a, b)` - sets an expectation that a != b
+- `SBIUNIT_ASSERT_NE(test_case, a, b)` - sets an assertion that a != b
+- `SBIUNIT_EXPECT_MEMEQ(test_case, a, b, len)` - performs sbi_memcmp on memory regions a and b with
+a length 'len', and sets an expectation that they are equal
+- `SBIUNIT_ASSERT_MEMEQ(test_case, a, b, len)` - performs sbi_memcmp on memory regions a and b with
+a length 'len', and sets an assertion that they are equal
+- `SBIUNIT_EXPECT_STREQ(test_case, a, b)` - performs sbi_strcmp on strings a and b and sets
+an expectation that they are equal
+- `SBIUNIT_ASSERT_STREQ(test_case, a, b)` - performs sbi_strcmp on strings a and b and sets
+an assertion that they are equal
-- 
2.34.1


