Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E28F0181A
	for <opensbi@archiver.kernel.org>; Fri,  6 Mar 2026 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCItSw/44qhyRZS7J0rn58KiSR6SnyOt732VIfwfn5g=; b=UdSRCyRQtqG4ej
	qhs3dRQRsGSpPiBJzxzUKgBe+vtc9XLzMspw/gphPDKbe/FskSxrXNA0egaZ+UVZSPXnOpQCpegKI
	bM4dTfhqC/1qAOmSIlmFPziFCLhlAjPQouqNfD5ka2ryJ2EcHLwOy7I7Nbqb10C9wrrCxwbIRlBJP
	C8axjJU9B3OGyk0ZLKbLh+cCFf8bKLt4D6tACHdXA39j7WmSBejw67qJk07u5NqgcXVdo9Qa6xOtK
	XpaMaToh4UCFAM8ODw2jDgFMOIuUg2S7nnjsseeKi7ICqoS/nVgLOxR3mmXu0gJEJRsymvdGJebU3
	u6MUG/cXVT8b1PoSfdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRq6-00000003Nfi-0h7l;
	Fri, 06 Mar 2026 09:51:22 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRpz-00000003Neu-2Vg0
	for opensbi@lists.infradead.org;
	Fri, 06 Mar 2026 09:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772790286; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rb8JSdoOgsxTdOSDY+FF9BCoDIYBMMvns5AKG5dZjNY=;
	b=mburwlrcZ+BJ3gm/9KzuA6x/w04ZBV51dSLHzhJNOZmVEyRJ0DsIq1pHC27EDoiy+Lb1Y6LmAcvs5IY5FdzSffzCwby/YM8s9zbO5jhpjBLis/7b0p1MCZQux149I8JP7Ctp8OqQp4+0UxM4ZjhjjnwSudslGXUIfVqlkwJb8rw=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X-N0CM-_1772790285 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 17:44:45 +0800
From: cp0613@linux.alibaba.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 1/2] lib: tests: Add test for string
Date: Fri,  6 Mar 2026 17:44:24 +0800
Message-ID: <20260306094425.1918-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306094425.1918-1-cp0613@linux.alibaba.com>
References: <20260306094425.1918-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_015117_706020_9A3C4E96 
X-CRM114-Status: GOOD (  17.71  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Chen Pei <cp0613@linux.alibaba.com>

Added unit tests for various string operations using SBI unit
test framework.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 lib/sbi/tests/objects.mk        |   3 +
 lib/sbi/tests/sbi_string_test.c | 372 ++++++++++++++++++++++++++++++++
 2 files changed, 375 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_string_test.c

diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 8da839f6..3ee1c635 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -21,3 +21,6 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ecall_test.o
 
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += bitops_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_bitops_test.o
+
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
+libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_string_test.o
diff --git a/lib/sbi/tests/sbi_string_test.c b/lib/sbi/tests/sbi_string_test.c
new file mode 100644
index 00000000..813f6df3
--- /dev/null
+++ b/lib/sbi/tests/sbi_string_test.c
@@ -0,0 +1,372 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Chen Pei <cp0613@linux.alibaba.com>
+ */
+
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_unit_test.h>
+
+/* Test data for string functions */
+static const char test_str1[] = "Hello, World!";
+static const char test_str2[] = "Hello, World!";
+static const char test_str3[] = "Hello, OpenSBI!";
+static const char test_str_empty[] = "";
+static const char test_str_long[] = "This is a very long string for testing purposes";
+static const char test_str_short[] = "Hi";
+static const char test_str_with_char[] = "Testing character search";
+
+static void string_strcmp_test(struct sbiunit_test_case *test)
+{
+	/* Same strings should return 0 */
+	SBIUNIT_EXPECT_EQ(test, sbi_strcmp(test_str1, test_str2), 0);
+
+	/* Different strings should return non-zero */
+	SBIUNIT_EXPECT_NE(test, sbi_strcmp(test_str1, test_str3), 0);
+
+	/* Empty strings */
+	SBIUNIT_EXPECT_EQ(test, sbi_strcmp(test_str_empty, test_str_empty), 0);
+
+	/* One empty, one not */
+	int result1 = sbi_strcmp(test_str1, test_str_empty);
+	int result2 = sbi_strcmp(test_str_empty, test_str1);
+	SBIUNIT_EXPECT_NE(test, result1, 0);
+	SBIUNIT_EXPECT_NE(test, result2, 0);
+	SBIUNIT_EXPECT_EQ(test, result1, -result2);
+
+	/* Different lengths */
+	SBIUNIT_EXPECT_NE(test, sbi_strcmp(test_str1, test_str_short), 0);
+}
+
+static void string_strncmp_test(struct sbiunit_test_case *test)
+{
+	/* Same strings with full length */
+	SBIUNIT_EXPECT_EQ(test, sbi_strncmp(test_str1, test_str2, sbi_strlen(test_str1)), 0);
+
+	/* Same strings with partial length */
+	SBIUNIT_EXPECT_EQ(test, sbi_strncmp(test_str1, test_str2, 5), 0);
+
+	/* Different strings with limited comparison */
+	SBIUNIT_EXPECT_EQ(test, sbi_strncmp(test_str1, test_str3, 7), 0);  /* "Hello, " matches */
+	SBIUNIT_EXPECT_NE(test, sbi_strncmp(test_str1, test_str3, 8), 0);  /* "Hello, " vs "Hello, " + 'W' vs 'O' */
+
+	/* Count is 0 - should always return 0 */
+	SBIUNIT_EXPECT_EQ(test, sbi_strncmp(test_str1, test_str3, 0), 0);
+
+	/* One string shorter than count */
+	SBIUNIT_EXPECT_NE(test, sbi_strncmp(test_str_short, test_str1, 20), 0);
+}
+
+static void string_strlen_test(struct sbiunit_test_case *test)
+{
+	/* Test known lengths */
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen(test_str1), 13UL);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen(test_str_empty), 0UL);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen("A"), 1UL);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen(test_str_long), 47UL);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen(test_str_short), 2UL);
+}
+
+static void string_strnlen_test(struct sbiunit_test_case *test)
+{
+	/* Test with count larger than string length */
+	SBIUNIT_EXPECT_EQ(test, sbi_strnlen(test_str1, 20), 13UL);
+
+	/* Test with count smaller than string length */
+	SBIUNIT_EXPECT_EQ(test, sbi_strnlen(test_str1, 5), 5UL);
+
+	/* Test with count equal to string length */
+	SBIUNIT_EXPECT_EQ(test, sbi_strnlen(test_str1, 13), 13UL);
+
+	/* Test empty string */
+	SBIUNIT_EXPECT_EQ(test, sbi_strnlen(test_str_empty, 10), 0UL);
+
+	/* Test with count 0 */
+	SBIUNIT_EXPECT_EQ(test, sbi_strnlen(test_str1, 0), 0UL);
+}
+
+static void string_strcpy_test(struct sbiunit_test_case *test)
+{
+	char dest[50];
+
+	/* Copy string and verify */
+	sbi_strcpy(dest, test_str1);
+	SBIUNIT_EXPECT_STREQ(test, dest, test_str1, 14);  /* 13 chars + null terminator */
+
+	/* Copy empty string */
+	sbi_strcpy(dest, test_str_empty);
+	SBIUNIT_EXPECT_EQ(test, sbi_strlen(dest), 0UL);
+
+	/* Copy short string */
+	sbi_strcpy(dest, test_str_short);
+	SBIUNIT_EXPECT_STREQ(test, dest, test_str_short, 3);  /* 2 chars + null terminator */
+}
+
+static void string_strncpy_test(struct sbiunit_test_case *test)
+{
+	char dest[50];
+
+	/* Basic functionality test */
+	sbi_strncpy(dest, "Hello", 6);
+	SBIUNIT_EXPECT_STREQ(test, dest, "Hello", 6);
+
+	/* Copy with larger count */
+	sbi_memset(dest, 'X', sizeof(dest));  /* Fill with 'X' to see padding */
+	sbi_strncpy(dest, "Hi", 10);
+	SBIUNIT_EXPECT_STREQ(test, dest, "Hi", 3);  /* "Hi" + null terminator */
+	/* Check that remaining positions are properly handled */
+	SBIUNIT_EXPECT_EQ(test, dest[2], '\0');  /* Should be null-terminated */
+	
+	/* CRITICAL TEST: Source string length equals count - NO null termination added */
+	char buffer[10];
+	const char *src1 = "Hello";  // 5 chars
+	sbi_memset(buffer, 'Z', 10);  // Fill with 'Z' to detect non-termination
+	sbi_strncpy(buffer, src1, 5);  // Copies exactly 5 chars: 'H','e','l','l','o' - NO null terminator!
+	
+	/* Verify the copied content */
+	SBIUNIT_EXPECT_EQ(test, buffer[0], 'H');
+	SBIUNIT_EXPECT_EQ(test, buffer[1], 'e');
+	SBIUNIT_EXPECT_EQ(test, buffer[2], 'l');
+	SBIUNIT_EXPECT_EQ(test, buffer[3], 'l');
+	SBIUNIT_EXPECT_EQ(test, buffer[4], 'o');
+	/* buffer[5] is NOT guaranteed to be null due to the bug - it might still be 'Z' */
+	
+	/* CRITICAL TEST: Source string length greater than count - NO null termination added */
+	const char *src2 = "HelloWorld";  // 10 chars
+	sbi_memset(buffer, 'Y', 10);  // Fill with 'Y' to detect non-termination
+	sbi_strncpy(buffer, src2, 5);  // Copies "Hello", but NO null terminator added!
+	
+	/* Verify the first 5 copied chars */
+	SBIUNIT_EXPECT_EQ(test, buffer[0], 'H');
+	SBIUNIT_EXPECT_EQ(test, buffer[1], 'e');
+	SBIUNIT_EXPECT_EQ(test, buffer[2], 'l');
+	SBIUNIT_EXPECT_EQ(test, buffer[3], 'l');
+	SBIUNIT_EXPECT_EQ(test, buffer[4], 'o');
+	/* buffer[5] is NOT guaranteed to be null due to the bug - it might still be 'Y' */
+	
+	/* Safe case: source shorter than count - properly null-terminated */
+	sbi_memset(buffer, 'X', 10);
+	sbi_strncpy(buffer, "Hi", 10);  // Copies "Hi" and remaining spaces get nulls
+	
+	SBIUNIT_EXPECT_EQ(test, buffer[0], 'H');
+	SBIUNIT_EXPECT_EQ(test, buffer[1], 'i');
+	SBIUNIT_EXPECT_EQ(test, buffer[2], '\0');  /* Should be null-terminated */
+}
+
+static void string_strchr_test(struct sbiunit_test_case *test)
+{
+	const char *pos;
+
+	/* Find existing character */
+	pos = sbi_strchr(test_str1, 'W');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 7);  /* 'W' is at index 7 */
+	}
+
+	/* Find first character */
+	pos = sbi_strchr(test_str1, 'H');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 0);  /* 'H' is at index 0 */
+	}
+
+	/* Find last character */
+	pos = sbi_strchr(test_str1, '!');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 12);  /* '!' is at index 12 */
+	}
+
+	/* Find non-existing character */
+	pos = sbi_strchr(test_str1, 'X');
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+
+	/* Find null terminator - according to standard, strchr should find null terminator */
+	pos = sbi_strchr(test_str1, '\0');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 13);  /* Null terminator at index 13 */
+	}
+
+	/* Find in empty string */
+	pos = sbi_strchr(test_str_empty, 'A');
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+}
+
+static void string_strrchr_test(struct sbiunit_test_case *test)
+{
+	const char *pos;
+
+	/* Find last occurrence of character */
+	pos = sbi_strrchr(test_str_with_char, 't');  /* Multiple 't's: "Test"ing charac"t"er search -> last 't' is at index 14 */
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str_with_char, 14);  /* Last 't' at index 14 */
+	}
+
+	/* Find single occurrence */
+	pos = sbi_strrchr(test_str1, 'W');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 7);  /* 'W' at index 7 */
+	}
+
+	/* Find last character */
+	pos = sbi_strrchr(test_str1, '!');
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, pos - test_str1, 12);  /* '!' at index 12 */
+	}
+
+	/* Find non-existing character */
+	pos = sbi_strrchr(test_str1, 'X');
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+
+	/* Find in empty string */
+	pos = sbi_strrchr(test_str_empty, 'A');
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+}
+
+static void memory_memset_test(struct sbiunit_test_case *test)
+{
+	char buffer[20];
+
+	/* Set all to 'A' */
+	sbi_memset(buffer, 'A', 10);
+	for (int i = 0; i < 10; i++) {
+		SBIUNIT_EXPECT_EQ(test, buffer[i], 'A');
+	}
+
+	/* Set with count 0 */
+	sbi_memset(buffer, 'B', 0);
+	/* Buffer should remain unchanged (not 'B') - depends on previous state */
+
+	/* Set with different value */
+	sbi_memset(buffer, 0, 5);  /* Null out first 5 bytes */
+	for (int i = 0; i < 5; i++) {
+		SBIUNIT_EXPECT_EQ(test, buffer[i], 0);
+	}
+}
+
+static void memory_memcpy_test(struct sbiunit_test_case *test)
+{
+	char dest[50];
+	const char *src = "memcpy test string";
+
+	/* Copy string */
+	sbi_memcpy(dest, src, sbi_strlen(src) + 1);  /* Include null terminator */
+	SBIUNIT_EXPECT_STREQ(test, dest, src, sbi_strlen(src) + 1);
+
+	/* Copy with specific size */
+	sbi_memcpy(dest, src, 6);  /* Copy "memcpy" */
+	SBIUNIT_EXPECT_STREQ(test, dest, "memcpy", 6);
+
+	/* Copy 0 bytes */
+	sbi_memcpy(dest, src, 0);  /* Should not change dest */
+	SBIUNIT_EXPECT_STREQ(test, dest, "memcpy", 6);
+}
+
+static void memory_memmove_test(struct sbiunit_test_case *test)
+{
+	char buffer[50] = "This is a test string for memmove";
+
+	/* Test overlapping copy - forward */
+	sbi_strcpy(buffer, "abcdef");
+	sbi_memmove(buffer + 2, buffer, 4);  /* Move "abcd" to position 2, result: "ababcd" */
+	SBIUNIT_EXPECT_STREQ(test, buffer, "ababcd", 7);
+
+	/* Test overlapping copy - backward */
+	sbi_strcpy(buffer, "abcdef");
+	sbi_memmove(buffer, buffer + 2, 4);  /* Move "cdef" to start, result: "cdefef" */
+	SBIUNIT_EXPECT_STREQ(test, buffer, "cdefef", 7);
+
+	/* Test non-overlapping copy */
+	sbi_strcpy(buffer, "source");
+	sbi_memmove(buffer + 10, buffer, 7);  /* Copy "source" + null to position 10 */
+	SBIUNIT_EXPECT_STREQ(test, buffer, "source", 7);  /* Original string unchanged */
+	SBIUNIT_EXPECT_STREQ(test, buffer + 10, "source", 7);  /* Copy at offset 10 */
+
+	/* Test copy 0 bytes */
+	sbi_memmove(buffer, buffer + 5, 0);  /* Should not change buffer */
+	SBIUNIT_EXPECT_STREQ(test, buffer, "source", 7);
+	SBIUNIT_EXPECT_STREQ(test, buffer + 10, "source", 7);
+}
+
+static void memory_memcmp_test(struct sbiunit_test_case *test)
+{
+	const char *str1 = "compare";
+	const char *str2 = "compare";
+	const char *str3 = "comparf";
+	const char *str4 = "compare longer";
+
+	/* Same strings */
+	SBIUNIT_EXPECT_EQ(test, sbi_memcmp(str1, str2, 7), 0);
+
+	/* Different strings */
+	SBIUNIT_EXPECT_NE(test, sbi_memcmp(str1, str3, 7), 0);
+
+	/* Compare with different lengths */
+	SBIUNIT_EXPECT_EQ(test, sbi_memcmp(str1, str4, 7), 0);  /* First 7 chars match */
+	SBIUNIT_EXPECT_NE(test, sbi_memcmp(str1, str4, 8), 0);  /* 8th char differs */
+	
+	/* Compare 0 bytes */
+	SBIUNIT_EXPECT_EQ(test, sbi_memcmp(str1, str3, 0), 0);
+
+	/* Compare empty regions */
+	SBIUNIT_EXPECT_EQ(test, sbi_memcmp(str1, str1, 0), 0);
+}
+
+static void memory_memchr_test(struct sbiunit_test_case *test)
+{
+	const char *str = "memory search test";
+	void *pos;
+
+	/* Find existing character */
+	pos = sbi_memchr(str, 's', sbi_strlen(str));
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, (char*)pos - str, 7);  /* First 's' at index 7 */
+	}
+
+	/* Find character at specific position */
+	pos = sbi_memchr(str, 'm', sbi_strlen(str));
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, (char*)pos - str, 0);  /* 'm' at index 0 */
+	}
+
+	/* Find first occurrence of 't' character */
+	pos = sbi_memchr(str, 't', sbi_strlen(str));
+	SBIUNIT_EXPECT_NE(test, pos, NULL);
+	if (pos != NULL) {
+		SBIUNIT_EXPECT_EQ(test, (char*)pos - str, 14);  /* First 't' at index 14 */
+	}
+
+	/* Find non-existing character */
+	pos = sbi_memchr(str, 'X', sbi_strlen(str));
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+
+	/* Search with zero count */
+	pos = sbi_memchr(str, 'm', 0);
+	SBIUNIT_EXPECT_EQ(test, pos, NULL);
+}
+
+static struct sbiunit_test_case string_test_cases[] = {
+	SBIUNIT_TEST_CASE(string_strcmp_test),
+	SBIUNIT_TEST_CASE(string_strncmp_test),
+	SBIUNIT_TEST_CASE(string_strlen_test),
+	SBIUNIT_TEST_CASE(string_strnlen_test),
+	SBIUNIT_TEST_CASE(string_strcpy_test),
+	SBIUNIT_TEST_CASE(string_strncpy_test),
+	SBIUNIT_TEST_CASE(string_strchr_test),
+	SBIUNIT_TEST_CASE(string_strrchr_test),
+	SBIUNIT_TEST_CASE(memory_memset_test),
+	SBIUNIT_TEST_CASE(memory_memcpy_test),
+	SBIUNIT_TEST_CASE(memory_memmove_test),
+	SBIUNIT_TEST_CASE(memory_memcmp_test),
+	SBIUNIT_TEST_CASE(memory_memchr_test),
+	SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(string_test_suite, string_test_cases);
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
