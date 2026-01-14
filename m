Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2243D29FF7
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c/Cj9f6YW0xSGz3HA6hifMMARl2Mxoh9vHSNoa7fOR8=; b=D097LzUr3gtuIl
	oarLWk1uwUTATjPOp/ScpyDhagK9j5Y/aB6ychVOY0f/jj+KjLeg5R5Y2IrwECFXWDcxa+Vb0GYsu
	lE18cxWdnii9Y3ail111AGiWwJbate5D68zXojb9fNeH4aEgLaz5MJQwkIXAof596tDpgtw9Q/8DP
	TBLWQYGFMWyEhQuHxnkDw05fBfVU+7GwKAEtJVQ3tOzVm2dS0Mkzvanyo9fwysTTm0Nvl5oE8UqKj
	yRc7RBxncAit+mo2yMfsPlsCIXFob/HLgOkTdt6gKbGdU2rJbuEDcOmV7sMZkc0esxNJnbYovSO1r
	qZ9RMBR69epGY0ZULsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzNO-000000091yz-3uWS;
	Wed, 14 Jan 2026 11:49:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzNE-000000091rQ-33S8
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 11:49:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fbc3056afso5011806f8f.2
        for <opensbi@lists.infradead.org>; Wed, 14 Jan 2026 03:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768391355; x=1768996155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/RAKWWBKfsUApCG1rWX585Z6Zeos/xWIk/D1N8ZeBU=;
        b=UUENyWR5FqjQpP31X0Q9KByZ+mHko34xyIUL52odFDl/sbdXF53+1uhsnN6VqqYTiD
         jhOMPh6oRS+0vsscCY/SY8IVYBOQZ0ERVnj8/6ZOvVzI0szndvjRxfIqCeB9MRzaYZyr
         MJZTiEMR4QMiTwLLCkLsC2uGMSRg35cp7LHCHlDl8G05T4BmzdD4/dQr1JhO/RB7XVGd
         Qxs37EIle2cqRpp9f1grOs6zUJrMvAmk6W1UH5nsKOCczHon2c+73D0mLXJr2/QobHwM
         9TAFebQAJoFaA4UxpeB+y03B+K1RxB1u85q8ucp7+4nWF8cwMAv7JC0GM8IktI9zxwq2
         cing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768391355; x=1768996155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/RAKWWBKfsUApCG1rWX585Z6Zeos/xWIk/D1N8ZeBU=;
        b=gAFQMxiKc+R/A615QmYwPP+cc/5giLie7DWzYWQC3z45V7U+n+e2gpPUCL2CX3BAWJ
         Ih2MhMf6EXsEGTw8P5Px9pbYgBF3Po9KAWzcMDxn6D/AQ/PjMcD10tl0ZlXXCgjleBri
         l4fD7zEveLYNH0lNkiAlJBuJ1CNdQr9YAcMdIX6ys08Weasu3Q8kCd0DJQBJfdO54LHu
         IXP8GblGD8jtcweU5n0mIODduBZ6RYJdPvS6j6RGZHJJzra8jMS9Hf7J8VwynmNgjusN
         GqI68lf/7or4dfo2fZSNT1qKyyCb2R7C4L2PQq2HNZL2LsDycwTCplD4WOi/wL3xgRkE
         v4Aw==
X-Gm-Message-State: AOJu0YyZqaWmHNwRErEB8emVxPtjhnILm8DFto2/xpIL8jJVLNRZgQh8
	SbdRDopy8ynhNvDN3MC9UcQtP0Z0HTm26JowF3j5FtYRTsAr5H8oGP96OYcBpg==
X-Gm-Gg: AY/fxX5vC2SGmmQ9LPultHA9ANSMClwzMR/l1bihMxLGryyYXeg8N5Pr8tmzow73mWt
	jTPPWJd0FmE+X7vgqm/P79t75LOsvehkY9lR8n/mSN3Uu/n6w2+0hl6SeZH5Nk1GiCW4/GbsW70
	v13VUqaXEfQJXxqv1xiUzSqDvyEDrB13FHOHGcgY67T2KgUMylrneft5Oq/In9hBdzQd858eEhc
	qyMkxyAq6+Sb0eOy1vOlcOEobH2gGxRaAcaWgPNnGWKz9Vrc/jTtasJJI17MJUWL9JlbS0g7R3Q
	sqYP+wePBKSfRvzYhioK3iQzuBadfpJOYeQsZ9TwFLD5XPa4P7UkWIIUDd66di51mWtxUHnPjs1
	Ih7vt3G4F2NYm0bkOWBcTDvSaS7hoJttadgG/Y551Z8Vuwf1gmgZm0PFDRZRQzKQAoBLIl/C52X
	Gk84EZpA1ENUBKx6lgj++XVAtm2C2jO//9Q269Td+pwRvfjxNSocAN5r6w8C3j16PFhA2gL+8sS
	BBzauKuvfiyMptZ+sJQpjWcowXX+tdtYnNNXT0CPh288XujkZCY1fVC
X-Received: by 2002:a5d:64c5:0:b0:431:488:b9bc with SMTP id ffacd0b85a97d-4342c4f3982mr2703554f8f.10.1768391354497;
        Wed, 14 Jan 2026 03:49:14 -0800 (PST)
Received: from LT-1H84393QVK.localdomain ([79.116.216.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432dd78f5a8sm29915864f8f.27.2026.01.14.03.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 03:49:13 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos.oduardo@gmail.com
Subject: [PATCH] lib : sbi: UBSan implementation for OpenSBI
Date: Wed, 14 Jan 2026 12:49:06 +0100
Message-ID: <20260114114906.16661-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_034916_996335_EE17A1FC 
X-CRM114-Status: GOOD (  19.63  )
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

UBSan (Undefined Behaviour Sanitizer) is a tool implemented using
compiler instrumentation at runtime that allows checking for statements
whose output is not deterministic or defined by the C standard,
incurring unexpected results in the execution of the program. Compiling
and testing the OpenSBI firmware against UBSan will print a message in
the console if any sentence performs any of these actions.

Support for this implementation involves two main components:
1.- The UBSan implementation hooks, used by the compiler to handle the
    check output
2.- A test suite to verify correct operation at runtime

Usage:

Users may compile OpenSBI with the UBSan instrumentation adding the
next flag to the make command:
ENABLEUBSAN=y

Users may compile OpenSBI with the UBSan tests adding the next flag to
the make command:
ENABLEUBSANTESTS=y

Note that the implementation of UBSan in the compilation of OpenSBI
adds a certain overhead caused by the checks performed at runtime;
therefore, it is only expected to be used in development builds, never
in production. If ENABLEUBSAN is not set, tests won't be compiled even
if the ENABLEUBSANTESTS flag is enabled.

Signed-off-by: Marcos Oduardo <marcos.oduardo@gmail.com>
---
 Makefile                     |  14 ++
 include/sbi/sbi_ubsan.h      | 182 ++++++++++++++++++
 include/sbi/sbi_ubsan_test.h |  28 +++
 lib/sbi/objects.mk           |   2 +
 lib/sbi/sbi_init.c           |  15 ++
 lib/sbi/sbi_ubsan.c          | 344 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_ubsan_test.c     | 135 ++++++++++++++
 7 files changed, 720 insertions(+)
 create mode 100644 include/sbi/sbi_ubsan.h
 create mode 100644 include/sbi/sbi_ubsan_test.h
 create mode 100644 lib/sbi/sbi_ubsan.c
 create mode 100644 lib/sbi/sbi_ubsan_test.c

diff --git a/Makefile b/Makefile
index 46541063..200130e3 100644
--- a/Makefile
+++ b/Makefile
@@ -455,6 +455,20 @@ else
 CFLAGS		+=	-O2
 endif
 
+ifeq ($(ENABLEUBSAN),y) 
+#UBsan-specific compiler options
+KUBSAN_CC_FLAGS := -fsanitize=undefined
+KUBSAN_CC_FLAGS += -fno-sanitize=pointer-overflow #unimplemented handler
+KUBSAN_CC_FLAGS += -fsanitize=implicit-signed-integer-truncation
+KUBSAN_CC_FLAGS += -fno-sanitize=function #unimplemented handler
+KUBSAN_CC_FLAGS += -fno-sanitize-link-runtime
+KUBSAN_CC_FLAGS += -DUBSAN_ENABLED
+ifeq ($(ENABLEUBSANTESTS),y) 
+KUBSAN_CC_FLAGS += -DUBSAN_TESTS_ENABLED
+endif
+CFLAGS += $(KUBSAN_CC_FLAGS)
+endif
+
 ifeq ($(V), 1)
 ELFFLAGS	+=	-Wl,--print-gc-sections
 endif
diff --git a/include/sbi/sbi_ubsan.h b/include/sbi/sbi_ubsan.h
new file mode 100644
index 00000000..7ecd17ec
--- /dev/null
+++ b/include/sbi/sbi_ubsan.h
@@ -0,0 +1,182 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LIB_UBSAN_H
+#define _LIB_UBSAN_H
+
+#include <sbi/sbi_types.h>
+
+
+
+#ifndef INT_MIN
+#define INT_MIN          (-__INT_MAX__ - 1)
+#endif
+#ifndef INT_MAX
+#define INT_MAX          __INT_MAX__
+#endif
+
+#ifndef LONG_MIN
+#define LONG_MIN         (-__LONG_MAX__ - 1)
+#endif
+#ifndef LONG_MAX
+#define LONG_MAX         __LONG_MAX__
+#endif
+
+/*
+ * ABI defined by Clang's UBSAN enum SanitizerHandler:
+ * https://github.com/llvm/llvm-project/blob/release/16.x/clang/lib/CodeGen/CodeGenFunction.h#L113
+ */
+enum ubsan_checks {
+	ubsan_add_overflow,
+	ubsan_builtin_unreachable,
+	ubsan_cfi_check_fail,
+	ubsan_divrem_overflow,
+	ubsan_dynamic_type_cache_miss,
+	ubsan_float_cast_overflow,
+	ubsan_function_type_mismatch,
+	ubsan_implicit_conversion,
+	ubsan_invalid_builtin,
+	ubsan_invalid_objc_cast,
+	ubsan_load_invalid_value,
+	ubsan_missing_return,
+	ubsan_mul_overflow,
+	ubsan_negate_overflow,
+	ubsan_nullability_arg,
+	ubsan_nullability_return,
+	ubsan_nonnull_arg,
+	ubsan_nonnull_return,
+	ubsan_out_of_bounds,
+	ubsan_pointer_overflow,
+	ubsan_shift_out_of_bounds,
+	ubsan_sub_overflow,
+	ubsan_type_mismatch,
+	ubsan_alignment_assumption,
+	ubsan_vla_bound_not_positive,
+};
+
+enum {
+	type_kind_int = 0,
+	type_kind_float = 1,
+	type_unknown = 0xffff
+};
+
+struct type_descriptor {
+	u16 type_kind;
+	u16 type_info;
+	char type_name[];
+};
+
+struct source_location {
+	const char *file_name;
+	union {
+		unsigned long reported;
+		struct {
+			u32 line;
+			u32 column;
+		};
+	};
+};
+
+struct overflow_data {
+	struct source_location location;
+	struct type_descriptor *type;
+};
+
+struct implicit_conversion_data {
+	struct source_location location;
+	struct type_descriptor *from_type;
+	struct type_descriptor *to_type;
+	unsigned char type_check_kind;
+};
+
+struct type_mismatch_data {
+	struct source_location location;
+	struct type_descriptor *type;
+	unsigned long alignment;
+	unsigned char type_check_kind;
+};
+
+struct type_mismatch_data_v1 {
+	struct source_location location;
+	struct type_descriptor *type;
+	unsigned char log_alignment;
+	unsigned char type_check_kind;
+};
+
+struct type_mismatch_data_common {
+	struct source_location *location;
+	struct type_descriptor *type;
+	unsigned long alignment;
+	unsigned char type_check_kind;
+};
+
+struct nonnull_arg_data {
+	struct source_location location;
+	struct source_location attr_location;
+	int arg_index;
+};
+
+struct out_of_bounds_data {
+	struct source_location location;
+	struct type_descriptor *array_type;
+	struct type_descriptor *index_type;
+};
+
+struct shift_out_of_bounds_data {
+	struct source_location location;
+	struct type_descriptor *lhs_type;
+	struct type_descriptor *rhs_type;
+};
+
+struct unreachable_data {
+	struct source_location location;
+};
+
+struct invalid_value_data {
+	struct source_location location;
+	struct type_descriptor *type;
+};
+
+struct alignment_assumption_data {
+	struct source_location location;
+	struct source_location assumption_location;
+	struct type_descriptor *type;
+};
+
+
+#if defined(CONFIG_ARCH_SUPPORTS_INT128)
+typedef __int128 s_max;
+typedef unsigned __int128 u_max;
+#else
+typedef s64 s_max;
+typedef u64 u_max;
+#endif
+
+/*
+ * When generating Runtime Calls, Clang doesn't respect the -mregparm=3
+ * option used on i386: https://github.com/llvm/llvm-project/issues/89670
+ * Fix this for earlier Clang versions by forcing the calling convention
+ * to use non-register arguments.
+ */
+#if defined(CONFIG_X86_32) && \
+    defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 190000
+# define ubsan_linkage asmlinkage
+#else
+# define ubsan_linkage
+#endif
+
+void ubsan_linkage __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_negate_overflow(void *_data, void *old_val);
+void ubsan_linkage __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_implicit_conversion(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
+void ubsan_linkage __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
+void ubsan_linkage __ubsan_handle_out_of_bounds(void *_data, void *index);
+void ubsan_linkage __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_builtin_unreachable(void *_data);
+void ubsan_linkage __ubsan_handle_load_invalid_value(void *_data, void *val);
+void ubsan_linkage __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
+						       unsigned long align,
+						       unsigned long offset);
+
+#endif
\ No newline at end of file
diff --git a/include/sbi/sbi_ubsan_test.h b/include/sbi/sbi_ubsan_test.h
new file mode 100644
index 00000000..7ce8b7ba
--- /dev/null
+++ b/include/sbi/sbi_ubsan_test.h
@@ -0,0 +1,28 @@
+#ifndef __SBI_UBSAN_TEST_H__
+#define __SBI_UBSAN_TEST_H__
+
+#ifdef UBSAN_TESTS_ENABLED
+
+#include <sbi/sbi_ubsan.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_heap.h>
+
+void test_ubsan_add_overflow(void);
+void test_ubsan_sub_overflow(void);
+void test_ubsan_mul_overflow(void);
+void test_ubsan_negate_overflow(void);
+void test_ubsan_divrem_overflow(void);
+void test_ubsan_truncate_signed(void);
+void test_ubsan_shift_out_of_bounds(void);
+void test_ubsan_out_of_bounds(void);
+
+enum ubsan_test_enum {
+	UBSAN_TEST_ZERO = 0,
+	UBSAN_TEST_ONE,
+	UBSAN_TEST_MAX,
+};
+
+void test_ubsan_load_invalid_value(void);
+#endif
+#endif
\ No newline at end of file
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..837d861e 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,8 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+libsbi-objs-y += sbi_ubsan.o
+libsbi-objs-y += sbi_ubsan_test.o
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..dcf96d20 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,8 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_ubsan.h>
+#include <sbi/sbi_ubsan_test.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -288,6 +290,19 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_double_trap_init(scratch);
 
+	#ifdef UBSAN_TESTS_ENABLED
+
+    test_ubsan_add_overflow();
+	test_ubsan_sub_overflow();
+	test_ubsan_mul_overflow();
+	test_ubsan_negate_overflow();
+    test_ubsan_divrem_overflow();
+	test_ubsan_truncate_signed();
+	test_ubsan_shift_out_of_bounds();
+	test_ubsan_out_of_bounds();
+	
+	#endif
+	
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
diff --git a/lib/sbi/sbi_ubsan.c b/lib/sbi/sbi_ubsan.c
new file mode 100644
index 00000000..1118203c
--- /dev/null
+++ b/lib/sbi/sbi_ubsan.c
@@ -0,0 +1,344 @@
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ubsan.h>
+
+#define REPORTED_BIT 31
+
+#if (BITS_PER_LONG == 64) && defined(__BIG_ENDIAN)
+#define COLUMN_MASK (~(1U << REPORTED_BIT))
+#define LINE_MASK   (~0U)
+#else
+#define COLUMN_MASK   (~0U)
+#define LINE_MASK (~(1U << REPORTED_BIT))
+#endif
+
+#define VALUE_LENGTH 40
+#define IS_ALIGNED(x, a)        (((x) & ((typeof(x))(a) - 1)) == 0)
+#define BIT(nr) (1UL << (nr))
+#define __attribute_const__             __attribute__((__const__))
+
+#define ffs(x) __builtin_ffs(x)
+
+typedef long ssize_t;
+
+static const char * const type_check_kinds[] = {
+	"load of",
+	"store to",
+	"reference binding to",
+	"member access within",
+	"member call on",
+	"constructor call on",
+	"downcast of",
+	"downcast of"
+};
+
+
+static bool type_is_signed(struct type_descriptor *type)
+{
+	return  type->type_info & 1;
+}
+
+static unsigned type_bit_width(struct type_descriptor *type)
+{
+	return 1 << (type->type_info >> 1);
+}
+
+static bool is_inline_int(struct type_descriptor *type)
+{
+	unsigned inline_bits = sizeof(unsigned long)*8;
+	unsigned bits = type_bit_width(type);
+
+	return bits <= inline_bits;
+}
+
+static s_max get_signed_val(struct type_descriptor *type, void *val)
+{
+	if (is_inline_int(type)) {
+		unsigned extra_bits = sizeof(s_max)*8 - type_bit_width(type);
+		unsigned long ulong_val = (unsigned long)val;
+
+		return ((s_max)ulong_val) << extra_bits >> extra_bits;
+	}
+
+	if (type_bit_width(type) == 64)
+		return *(s64 *)val;
+
+	return *(s_max *)val;
+}
+
+static bool val_is_negative(struct type_descriptor *type, void *val)
+{
+	return type_is_signed(type) && get_signed_val(type, val) < 0;
+}
+
+static u_max get_unsigned_val(struct type_descriptor *type, void *val)
+{
+	if (is_inline_int(type))
+		return (unsigned long)val;
+
+	if (type_bit_width(type) == 64)
+		return *(u64 *)val;
+
+	return *(u_max *)val;
+}
+
+
+static void ubsan_prologue(struct source_location *loc, const char *reason)
+{
+
+	sbi_printf("================================================================================\n");//pr_warn(CUT_HERE);
+
+	sbi_printf("UBSAN: %s in %s:%d:%d\n", reason, loc->file_name,
+		loc->line & LINE_MASK, loc->column & COLUMN_MASK); 
+}
+
+static void ubsan_epilogue(void)
+{
+	sbi_printf("----------------------\n");
+}
+
+static void handle_overflow(struct overflow_data *data, void *lhs,
+			void *rhs, char op)
+{
+
+	struct type_descriptor *type = data->type;
+
+	ubsan_prologue(&data->location, type_is_signed(type) ?
+			"signed-integer-overflow" :
+			"unsigned-integer-overflow");
+	
+    sbi_printf("%c operation cannot be represented in type %s with those operands\n",
+		op,
+		type->type_name);
+    
+
+	ubsan_epilogue();
+}
+
+
+void __ubsan_handle_add_overflow(void *data,
+				void *lhs, void *rhs)
+{
+
+	handle_overflow(data, lhs, rhs, '+');
+}
+
+
+void __ubsan_handle_sub_overflow(void *data,
+				void *lhs, void *rhs)
+{
+	handle_overflow(data, lhs, rhs, '-');
+}
+
+void __ubsan_handle_mul_overflow(void *data,
+				void *lhs, void *rhs)
+{
+	handle_overflow(data, lhs, rhs, '*');
+}
+
+void __ubsan_handle_negate_overflow(void *_data, void *old_val)
+{
+	struct overflow_data *data = _data;
+
+	ubsan_prologue(&data->location, "negation-overflow");
+
+    sbi_printf("negation of this value cannot be represented in type %s\n",
+    data->type->type_name);
+
+	ubsan_epilogue();
+}
+
+void __ubsan_handle_implicit_conversion(void *_data, void *from_val, void *to_val)
+{
+	struct implicit_conversion_data *data = _data;
+	char from_val_str[VALUE_LENGTH];
+
+	ubsan_prologue(&data->location, "implicit-conversion");
+    	
+    sbi_printf("cannot represent %s value %s during %s %s: truncated.\n",
+        data->from_type->type_name,
+        from_val_str,
+        type_check_kinds[data->type_check_kind],
+        data->to_type->type_name);
+    
+
+	ubsan_epilogue();
+}
+
+
+void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
+{
+	struct overflow_data *data = _data;
+
+	ubsan_prologue(&data->location, "division-overflow");
+
+	if (type_is_signed(data->type) && get_signed_val(data->type, rhs) == -1)
+		sbi_printf("division of this value by -1 cannot be represented in type %s\n",
+			 data->type->type_name);
+	else
+		sbi_printf("division by zero\n");
+
+     
+
+	ubsan_epilogue();
+}
+
+static void handle_null_ptr_deref(struct type_mismatch_data_common *data)
+{
+
+	ubsan_prologue(data->location, "null-ptr-deref");
+
+	sbi_printf("%s null pointer of type %s\n",
+		type_check_kinds[data->type_check_kind],
+		data->type->type_name);
+
+	ubsan_epilogue();
+}
+
+static void handle_misaligned_access(struct type_mismatch_data_common *data,
+				unsigned long ptr)
+{
+
+	ubsan_prologue(data->location, "misaligned-access");
+
+	sbi_printf("%s misaligned address %p for type %s\n",
+		type_check_kinds[data->type_check_kind],
+		(void *)ptr, data->type->type_name);
+	sbi_printf("which requires %ld byte alignment\n", data->alignment);
+
+	ubsan_epilogue();
+}
+
+static void handle_object_size_mismatch(struct type_mismatch_data_common *data,
+					unsigned long ptr)
+{
+
+	ubsan_prologue(data->location, "object-size-mismatch");
+	sbi_printf("%s address %p with insufficient space\n",
+		type_check_kinds[data->type_check_kind],
+		(void *) ptr);
+	sbi_printf("for an object of type %s\n", data->type->type_name);
+	ubsan_epilogue();
+}
+
+static void ubsan_type_mismatch_common(struct type_mismatch_data_common *data,
+				unsigned long ptr)
+{
+
+	if (!ptr)
+		handle_null_ptr_deref(data);
+	else if (data->alignment && !IS_ALIGNED(ptr, data->alignment))
+		handle_misaligned_access(data, ptr);
+	else
+		handle_object_size_mismatch(data, ptr);
+
+}
+
+void __ubsan_handle_type_mismatch(struct type_mismatch_data *data,
+				void *ptr)
+{
+	struct type_mismatch_data_common common_data = {
+		.location = &data->location,
+		.type = data->type,
+		.alignment = data->alignment,
+		.type_check_kind = data->type_check_kind
+	};
+
+	ubsan_type_mismatch_common(&common_data, (unsigned long)ptr);
+}
+
+void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr)
+{
+	struct type_mismatch_data_v1 *data = _data;
+	struct type_mismatch_data_common common_data = {
+		.location = &data->location,
+		.type = data->type,
+		.alignment = 1UL << data->log_alignment,
+		.type_check_kind = data->type_check_kind
+	};
+
+	ubsan_type_mismatch_common(&common_data, (unsigned long)ptr);
+}
+
+void __ubsan_handle_out_of_bounds(void *_data, void *index)
+{
+	struct out_of_bounds_data *data = _data;
+
+	ubsan_prologue(&data->location, "array-index-out-of-bounds");
+
+    sbi_printf("used index is out of range for type %s\n",
+		data->array_type->type_name);
+	ubsan_epilogue();
+
+
+}
+
+void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs)
+{
+	struct shift_out_of_bounds_data *data = _data;
+	struct type_descriptor *rhs_type = data->rhs_type;
+	struct type_descriptor *lhs_type = data->lhs_type;
+
+	ubsan_prologue(&data->location, "shift-out-of-bounds");
+
+    if (val_is_negative(rhs_type, rhs))
+    sbi_printf("shift exponent is negative\n");
+
+	else if (get_unsigned_val(rhs_type, rhs) >=
+		type_bit_width(lhs_type))
+		sbi_printf("shift exponent is too large for %u-bit type %s\n",
+			type_bit_width(lhs_type),
+			lhs_type->type_name);
+	else if (val_is_negative(lhs_type, lhs))
+		sbi_printf("left shift of negative value\n");
+	else
+		sbi_printf("left shift of this value by this places cannot be"
+			" represented in type %s\n", lhs_type->type_name);
+
+	ubsan_epilogue();
+
+}
+
+void __ubsan_handle_builtin_unreachable(void *_data)
+{
+	struct unreachable_data *data = _data;
+	ubsan_prologue(&data->location, "unreachable");
+	sbi_printf("calling __builtin_unreachable()\n");
+	ubsan_epilogue();
+}
+
+void __ubsan_handle_load_invalid_value(void *_data, void *val)
+{
+	struct invalid_value_data *data = _data;
+
+	ubsan_prologue(&data->location, "invalid-load");
+
+   	sbi_printf("load of this value is not a valid value for type %s\n", data->type->type_name);
+
+	ubsan_epilogue();
+
+}
+
+void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
+					 unsigned long align,
+					 unsigned long offset)
+{
+	struct alignment_assumption_data *data = _data;
+	unsigned long real_ptr;
+
+	ubsan_prologue(&data->location, "alignment-assumption");
+
+	if (offset)
+		sbi_printf("assumption of %lu byte alignment (with offset of %lu byte) for pointer of type %s failed",
+		       align, offset, data->type->type_name);
+	else
+		sbi_printf("assumption of %lu byte alignment for pointer of type %s failed",
+		       align, data->type->type_name);
+
+	real_ptr = ptr - offset;
+	sbi_printf("%saddress is %lu aligned, misalignment offset is %lu bytes",
+	       offset ? "offset " : "", BIT(real_ptr ? ffs(real_ptr) : 0),
+	       real_ptr & (align - 1));
+
+	ubsan_epilogue();
+}
\ No newline at end of file
diff --git a/lib/sbi/sbi_ubsan_test.c b/lib/sbi/sbi_ubsan_test.c
new file mode 100644
index 00000000..35d16930
--- /dev/null
+++ b/lib/sbi/sbi_ubsan_test.c
@@ -0,0 +1,135 @@
+#ifdef UBSAN_TESTS_ENABLED
+#include <sbi/sbi_ubsan_test.h>
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Warray-bounds"
+#pragma GCC diagnostic ignored "-Wpointer-sign"
+#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
+#pragma GCC diagnostic ignored "-Wunused-function"
+
+
+void test_ubsan_add_overflow(void)
+{
+	volatile int val = INT_MAX;
+  sbi_printf("\nKUBSan test: integer overflow in add operation\n");
+  sbi_printf("Overflowing integer variable with INT_MAX value\n");
+  
+	val += 2;
+}
+
+void test_ubsan_sub_overflow(void)
+{
+	volatile int val = INT_MIN;
+	volatile int val2 = 2;
+
+  sbi_printf("\nKUBSan test: integer underflow in sub operation\n");
+  sbi_printf("Underflowing integer variable with INT_MIN value\n");
+
+	val -= val2;
+
+}
+
+void test_ubsan_mul_overflow(void)
+{
+	volatile int val = INT_MAX / 2;
+
+  
+  sbi_printf("\nKUBSan test: integer overflow in mul operation\n");
+  sbi_printf("Overflowing integer variable with INT_MAX value\n");
+
+	val *= 3;
+}
+
+void test_ubsan_negate_overflow(void)
+{
+	volatile int val = INT_MIN;
+
+  sbi_printf("\nKUBSan test: integer negate overflow\n");
+  sbi_printf("Overflowing by negating integer variable with INT_MIN value\n");
+
+	val = -val;
+}
+
+void test_ubsan_divrem_overflow(void)
+{
+	volatile int val = 16;
+	volatile int val2 = 0;
+
+  sbi_printf("\nKUBSan test: integer division by zero\n");
+  sbi_printf("Dividing by zero variable with %d value\n", val);
+
+	val /= val2;
+}
+
+void test_ubsan_truncate_signed(void)
+{
+	volatile long val = LONG_MAX;
+	volatile int val2 = 0;
+
+  sbi_printf("\nKUBSan test: signed variable truncation\n");
+  sbi_printf("Truncating long variable with LONG_MAX value assigning its value to a int variable\n");
+
+	val2 = val;
+
+  
+}
+
+void test_ubsan_shift_out_of_bounds(void)
+{
+	volatile int neg = -1, wrap = 4;
+	volatile int val1 = 10;
+	volatile int val2 = INT_MAX;
+
+  sbi_printf("\nKUBSan test: OOB shift\n");
+  sbi_printf("Performing negative exponent right shift and left overflow shift in INT_MAX variable\n");
+
+	val1 <<= neg;
+
+	val2 <<= wrap;
+}
+
+
+void test_ubsan_out_of_bounds(void)
+{
+	int i = 4, j = 4, k = -1;
+	volatile struct {
+		char above[4]; /* Protect surrounding memory. */
+		int arr[4];
+		char below[4]; /* Protect surrounding memory. */
+	} data;
+
+  sbi_printf("\nKUBSan test: OOB write\n");
+  sbi_printf("Attempting to write data in OOB space of a %d positions array\n", i);
+
+	data.arr[j] = i;
+
+	data.arr[k] = i;
+}
+
+void test_ubsan_load_invalid_value(void)
+{
+	volatile char *dst, *src;
+	bool val, val2, *ptr;
+	enum ubsan_test_enum eval, eval2, *eptr;
+	unsigned char c = 0xff;
+
+  sbi_printf("\nKUBSan test: Invalid load value\n");
+  sbi_printf("Attempting to load a value with wrong type pointers\n");
+
+	dst = (char *)&val;
+	src = &c;
+	*dst = *src;
+
+	ptr = &val2;
+	val2 = val;
+
+	dst = (char *)&eval;
+	src = &c;
+	*dst = *src;
+
+	eptr = &eval2;
+	eval2 = eval;
+}
+
+#pragma GCC diagnostic pop
+#endif
\ No newline at end of file
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
