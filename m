From: zhangdongdong@eswincomputing.com <zhangdongdong@eswincomputing.com>
Date: Mon,  1 Jul 2024 10:17:28 +0800
Subject: [PATCH] lib:tests: enhance test output with colored pass/fail messages
Message-ID: <20240701021728.10462-1-zhangdongdong@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

This patch improves the readability of the SBI unit test
output by adding color-coded status messages.

Adding ANSI color codes for green (pass) and red (fail)
in sbi_unit_test.c.

Now, the test results will be displayed in green for passed
tests and red for failed tests, making it easier to quickly
distinguish between them.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 lib/sbi/tests/sbi_unit_test.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/tests/sbi_unit_test.c b/lib/sbi/tests/sbi_unit_test.c
index c2a0be6..cd09166 100644
--- a/lib/sbi/tests/sbi_unit_test.c
+++ b/lib/sbi/tests/sbi_unit_test.c
@@ -7,6 +7,10 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_console.h>
 
+#define ANSI_COLOR_GREEN "\x1b[32m"
+#define ANSI_COLOR_RED "\x1b[31m"
+#define ANSI_COLOR_RESET "\x1b[0m"
+
 extern struct sbiunit_test_suite *sbi_unit_tests[];
 extern unsigned long sbi_unit_tests_size;
 
@@ -27,10 +31,13 @@ static void run_test_suite(struct sbiunit_test_suite *suite)
 			count_fail++;
 		else
 			count_pass++;
-		sbi_printf("[%s] %s\n", s_case->failed ? "FAILED" : "PASSED",
-			   s_case->name);
+		sbi_printf("%s[%s]%s %s\n",
+			   s_case->failed ? ANSI_COLOR_RED : ANSI_COLOR_GREEN,
+			   s_case->failed ? "FAILED" : "PASSED",
+			   ANSI_COLOR_RESET, s_case->name);
 		s_case++;
 	}
+
 	sbi_printf("%u PASSED / %u FAILED / %u TOTAL\n", count_pass, count_fail,
 		   count_pass + count_fail);
 }
-- 
2.17.1


