From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Thu,  8 Feb 2024 09:50:48 +0000
Subject: [PATCH 2/4] lib: Add SBIUnit testing macros and functions
In-Reply-To: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
Message-ID: <20240208095050.398522-2-ivan.orlov0322@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is good when the code is covered with tests. Tests help us to keep
the code clean and avoid regressions. Also, a good test is always a nice
documentation for the code it covers.

This and the subsequent patches in this series introduce SBIUnit - the
set of macros and functions which simplify the unit test development for
OpenSBI and automate tests execution and evaluation.

This patch introduces all of the SBIUnit macros and functions which
can be used during the test development process. Also, it defines
the 'run_all_tests' function, which is being called during the
'init_coldboot' right after printing the boot hart information.

Also, add the CONFIG_SBIUNIT Kconfig entry in order to be able to
turn the tests on and off. When the CONFIG_SBIUNIT is disabled,
the tests and all related code should be excluded completely on the
compilation stage (and, apparently, it works in this way).

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 include/sbi/sbi_unit.h | 69 ++++++++++++++++++++++++++++++++++++++++++
 lib/sbi/Kconfig        |  4 +++
 lib/sbi/objects.mk     |  1 +
 lib/sbi/sbi_init.c     |  8 +++++
 lib/sbi/sbi_unit.c     | 44 +++++++++++++++++++++++++++
 5 files changed, 126 insertions(+)
 create mode 100644 include/sbi/sbi_unit.h
 create mode 100644 lib/sbi/sbi_unit.c

diff --git a/include/sbi/sbi_unit.h b/include/sbi/sbi_unit.h
new file mode 100644
index 0000000..685e58d
--- /dev/null
+++ b/include/sbi/sbi_unit.h
@@ -0,0 +1,69 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
+ */
+#ifndef __SBI_UNIT_H__
+#define __SBI_UNIT_H__
+
+extern struct sbiunit_test_suite *__start_sbiunit_test_suites;
+extern struct sbiunit_test_suite *__end_sbiunit_test_suites;
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_string.h>
+
+#define _CONCAT(a, b) a ## b
+#define CONCAT(a, b) _CONCAT(a, b)
+
+struct sbiunit_test_case {
+	char *name;
+	bool should_run;
+	bool result;
+	void (*test_func)(struct sbiunit_test_case *test);
+	void (*onerr)(struct sbiunit_test_case *test);
+};
+
+struct sbiunit_test_suite {
+	struct sbiunit_test_case *cases;
+	const char *name;
+};
+
+#define SBIUNIT_TEST_CASE(func)	\
+	{ .name = #func, .should_run = 1, .result = 0, .test_func = &func }
+
+#define SBIUNIT_TEST_SUITE(suite_name, cases_arr) \
+	struct sbiunit_test_suite suite_name = { .name = #suite_name, .cases = cases_arr }
+
+#define SBIUNIT_INFO(test, msg) sbi_printf("%s: %s", test->name, msg)
+
+#define SBIUNIT_EXPECT(test, cond) do {							\
+	if (!(cond)) {									\
+		test->result = 0;							\
+		SBIUNIT_INFO(test, "Condition \"" #cond "\" expected to be true!\n");	\
+	}										\
+} while (0)
+
+#define SBIUNIT_ASSERT(test, cond) do {						\
+	if (!(cond)) {								\
+		test->result = 0;						\
+		SBIUNIT_INFO(test, "Condition \"" #cond "\" must be true!\n");	\
+		return;								\
+	}									\
+} while (0)
+
+#define SBIUNIT_EXPECT_EQ(test, a, b) SBIUNIT_EXPECT(test, a == b)
+#define SBIUNIT_ASSERT_EQ(test, a, b) SBIUNIT_ASSERT(test, a == b)
+#define SBIUNIT_EXPECT_NE(test, a, b) SBIUNIT_EXPECT(test, a != b)
+#define SBIUNIT_ASSERT_NE(test, a, b) SBIUNIT_ASSERT(test, a != b)
+#define SBIUNIT_EXPECT_MEMEQ(test, a, b, len) \
+	SBIUNIT_EXPECT(test, sbi_memcmp(a, b, len) == 0)
+#define SBIUNIT_ASSERT_MEMEQ(test, a, b, len) \
+	SBIUNIT_ASSERT(test, sbi_memcmp(a, b, len) == 0)
+#define SBIUNIT_EXPECT_STREQ(test, a, b) \
+	SBIUNIT_EXPECT(test, sbi_strcmp(a, b) == 0)
+#define SBIUNIT_ASSERT_STREQ(test, a, b) \
+	SBIUNIT_ASSERT(test, sbi_strcmp(a, b) == 0)
+
+void run_all_tests(void);
+#endif
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 81dd2db..e3038ee 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -50,4 +50,8 @@ config SBI_ECALL_DBTR
 	bool "Debug Trigger Extension"
 	default y
 
+config SBIUNIT
+	bool "Enable SBIUNIT tests"
+	default n
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 0a50e95..0a2318b 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -11,6 +11,7 @@ libsbi-objs-y += riscv_asm.o
 libsbi-objs-y += riscv_atomic.o
 libsbi-objs-y += riscv_hardfp.o
 libsbi-objs-y += riscv_locks.o
+libsbi-objs-y += sbi_unit.o
 
 libsbi-objs-y += sbi_ecall.o
 libsbi-objs-y += sbi_ecall_exts.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 804b01c..16d0a00 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -30,6 +30,10 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 
+#ifdef CONFIG_SBIUNIT
+#include <sbi/sbi_unit.h>
+#endif
+
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
 	"  / __ \\                  / ____|  _ \\_   _|\n"  \
@@ -398,6 +402,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_boot_print_hart(scratch, hartid);
 
+#ifdef CONFIG_SBIUNIT
+	run_all_tests();
+#endif
+
 	/*
 	 * Configure PMP at last because if SMEPMP is detected,
 	 * M-mode access to the S/U space will be rescinded.
diff --git a/lib/sbi/sbi_unit.c b/lib/sbi/sbi_unit.c
new file mode 100644
index 0000000..9c7efec
--- /dev/null
+++ b/lib/sbi/sbi_unit.c
@@ -0,0 +1,44 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Ivan Orlov <ivan.orlov0322@gmail.com>
+ */
+#include <sbi/sbi_unit.h>
+#include <sbi/sbi_console.h>
+
+static struct sbiunit_test_suite *test_suites[] = {
+};
+
+static void run_test_suite(struct sbiunit_test_suite *suite)
+{
+	struct sbiunit_test_case *s_case;
+	u32 count_pass, count_fail;
+
+	sbi_printf("## Running test suite: %s\n", suite->name);
+	count_pass = 0;
+	count_fail = 0;
+
+	s_case = suite->cases;
+	while (s_case->should_run) {
+		s_case->result = 1;
+		s_case->test_func(s_case);
+		if (s_case->result)
+			count_pass++;
+		else
+			count_fail++;
+		sbi_printf("[%s] %s\n", s_case->result ? "OK" : "FAIL", s_case->name);
+		s_case++;
+	}
+	sbi_printf("%u SUCCESS / %u FAIL / %u TOTAL\n", count_pass, count_fail,
+		   count_pass + count_fail);
+}
+
+void run_all_tests(void)
+{
+	u32 i;
+
+	sbi_printf("\n# Running SBIUNIT tests #\n");
+
+	for (i = 0; i < sizeof(test_suites) / sizeof(test_suites[0]); i++)
+		run_test_suite(test_suites[i]);
+}
-- 
2.34.1


