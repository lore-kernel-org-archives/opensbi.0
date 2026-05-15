Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A284FCD343F
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nsxEtuElCmPmwMFv3oQsGiJ5o3uLHKZEWZR6/IZJZ2I=; b=h5SSJh/bYuJIJF
	MQpggIyksQL38Lyj08pylujX51bF/++o7tPH2vacwq96V3z+ZS3ARVrllE29qVB8oo3WVsN4+bguC
	9fOrL00LUxQG5wAcrKbGey6flmzMlckylxONSgmiuZKQk190qIZ0dH+Xc2gS1CyN/11Wta4bYSmCA
	dfMdGM3d6USq+JQXZc8O1H1Yg2uX1sT14Ic3yrreAQfh+NnNB17/pBjmvX28FiRJYO4nxE0JBMb3h
	E4cvEiUnhmR9oUJgnUJt79pTp06ChxpGgpL8qr1Ayp56/zatXx77yCV3sjV/oknISsHD5YXz8a3be
	FSaRlNGdpNH0blVBCTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvTa-00000008sYo-3qZG;
	Fri, 15 May 2026 16:33:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvTW-00000008sXx-2SwD
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 16:33:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891b0786beso67375e9.1
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862800; x=1779467600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2o9bHLPQmymIPtfscu7GsvZrVy124j2aWBRd1aqA2vk=;
        b=P5bDlgE3R8rbwIYDg+iL8p3QJvrZ33cFViGU28ctJiEaBwhXYf6zV+O7irdwlJYDh8
         G1q+47WZIAiAiDKQXTO7ozr/q8PBbEC256FyWGkxPgZNZQAHRUtGGbzsHL3KmIX/F/Nf
         BqlQbs6VgymiDE5F7hpbLnwhOpYEYKBeO37QfH4dAm8mWQIT3AfXpy/ryF0TqdEBA2PV
         diNLGOTWb9XOrA1/SKmg//dRiZOwfdvm2oPqv9e1JEJ5VnECjMOYysvtlofSKL7qIOXl
         X3Z+9TRm+KakXygvxRVvGP4FyUfyCAxqNAyJQOlAaibFMgDW4dbmynu2yaNlYejpAHrN
         f4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862800; x=1779467600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o9bHLPQmymIPtfscu7GsvZrVy124j2aWBRd1aqA2vk=;
        b=bxg1HasQhoSDhGR06oap8grsuqQ8w2IVXJNzkyHuW8Ep+YQndvz7B2LeOmupTlBfqd
         qOqE8R5DFVxcBY4iDxE6Bklf2D0N1Q/d80fKnLBimJrC0ssJK9mFkvSl7kRaDUgIu/Wg
         opiPPZC1fWTWrsJ109obN1Gs8Mo9x/gluBmFwczLAJCs12PeKwNnUyXRfMtXVQWSCjt1
         Kzld69G1jTI12+dCv9J3MOGqZFyLMGNxnZ1mJ7W6lBP75XP1YZEZtFmaN5wT2pgAl7s9
         gPGlj4EZZweSKCGsQDc+fuUi3NoTPjwHB1h6/IsCJKVF8F04bBxG32T3nZoaTSh68NFF
         wfmA==
X-Gm-Message-State: AOJu0YxztZdR1xTbupgE8tqOyAyrxKhNHSnqI9/BfGygaIrYgd0pf1Da
	55aFKdj05dr9dDu1UrrO1Ecsi+a24JQ42xkrzJreNn6p+Lr2lmFHHQDn0kdR76DK
X-Gm-Gg: Acq92OEsd18SaKp9WOYSocKIo3PyGDqjVqLmYiebLO5/UEZjPBGS3gR1atLKVODyha4
	VOWCkJ173lcNfhi3WOW5KAQFhzJh/1joPdOW9/34h9i98JFnyAieSrXc6FW8ss8dd+UkW/eInT1
	ZpjzyRdSrMCPEnvKlDaYq5hZxmw3DStKRaX4oeE/hcqHanX1LTV32NLBZhW0RtZGmp4tDiL/cDo
	/rKUnD7wtPm9zqUA/3EupApNPLhE6+PzbdSt8VSp1RakMV24N2ONCv0w0e9aro6jjOhHQWiualz
	+Jkcy7TNLGqW1uQwwINGxwhn/acEM3+/VUseY/nN8WgxvdT/Tv3FT6oJH1nj95ZKJUqA1ud0zoH
	M8LzHaIYRzBR16tbUxnhqC/lSVlXvRxKIQTwKM1iGMSDGm4bbrth187WG6qoNw/ZHy++YKxnjSo
	SnOgu+EEk42iOndwv8RMZaLCFearzUd8oyvwtKoJX2pOJlacw9iH5LaPef+cc4rGCoh6hCNLj8R
	4a1wiYCGTUnA1SpSEI0vasb4xDs1dWeIDI2Ygrkb47Mzuxm0Y5FHBLIf4bA3+F5oa5hCWvM
X-Received: by 2002:a05:600c:820e:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-48fe60de780mr72574095e9.4.1778862800151;
        Fri, 15 May 2026 09:33:20 -0700 (PDT)
Received: from marcosthinkpad (wifixm-si-gw.uab.cat. [158.109.94.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm16345865e9.30.2026.05.15.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:33:19 -0700 (PDT)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@wdc.com,
	Marcos Oduardo <marcos.oduardo@gmail.com>
Subject: [PATCH v4] lib: sbi: add UBSan support
Date: Fri, 15 May 2026 18:33:21 +0200
Message-ID: <20260515163321.2038366-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_093322_858115_8526B237 
X-CRM114-Status: GOOD (  21.91  )
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

UBSan (Undefined Behavior Sanitizer) is a tool implemented using
compiler instrumentation at runtime that allows checking for
statements whose output is not deterministic or defined by the C
standard. Compiling and running OpenSBI with UBSan instrumentation
will print a message in the console if any sentence performs such
an action.

Support involves two main components:
1. The UBSan implementation hooks (derived from NetBSD),
   used by the compiler to handle the check output.
2. A test suite integrated with the SBI unit test framework to
   verify correct operation at runtime.

Usage:

  make UBSAN=y PLATFORM=generic ...

The test suite is built when both UBSAN=y and CONFIG_SBIUNIT=y are
enabled.

When UBSan is enabled, FW_PAYLOAD_OFFSET may need to be increased
due to the size increase added by the instrumentation. A
value of 0x400000 has been tested.

UBSan adds runtime overhead and is intended for development builds
only, not for production.

Note: This patch marks __stack_chk_guard in sbi_init.c as a weak
symbol to prevent multiple definition errors at compile time with
UBSan instrumentation enabled. This resolves the conflict
between the .globl definitions in sbi_init.c and test_head.S.

Signed-off-by: Marcos Oduardo <marcos.oduardo@gmail.com>
---
Changes added to this patch:
  - Fixed formatting
  - Integrated the previous tests in the sbi unit test
  - Renamed main flag to UBSAN=y
  - Regarding the license header in sbi_ubsan.c: this patch is 
    BSD2-Clause compatible, but I am not sure whether the upstream 
    NetBSD header can be reduced to SPDX-only given COPYING.BSD, or 
    whether it should be kept in full as done for other imported code 
    in the tree (lib/utils/libquad/). In this patch I've trimmed it, 
    but I will follow whichever you prefer if a v5 is needed.

 Makefile                       |  17 +
 include/sbi/sbi_ubsan.h        |  14 +
 lib/sbi/objects.mk             |   3 +
 lib/sbi/sbi_init.c             |   2 +-
 lib/sbi/sbi_ubsan.c            | 924 +++++++++++++++++++++++++++++++++
 lib/sbi/tests/objects.mk       |   5 +
 lib/sbi/tests/sbi_ubsan_test.c | 114 ++++
 platform/generic/objects.mk    |   5 +
 8 files changed, 1083 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_ubsan.h
 create mode 100644 lib/sbi/sbi_ubsan.c
 create mode 100644 lib/sbi/tests/sbi_ubsan_test.c

diff --git a/Makefile b/Makefile
index 46541063..54eb15bc 100644
--- a/Makefile
+++ b/Makefile
@@ -455,6 +455,23 @@ else
 CFLAGS		+=	-O2
 endif
 
+ifeq ($(UBSAN),y)
+UBSAN_CC_FLAGS := -fsanitize=undefined
+UBSAN_CC_FLAGS += -DUBSAN_ENABLED
+UBSAN_CC_FLAGS += -fno-sanitize=vptr
+UBSAN_CC_FLAGS += -fno-sanitize=float-cast-overflow
+UBSAN_CC_FLAGS += -fno-sanitize=float-divide-by-zero
+UBSAN_CC_FLAGS += -fsanitize-recover=undefined
+UBSAN_CC_FLAGS += -fsanitize=pointer-overflow
+UBSAN_CC_FLAGS += -fsanitize=alignment
+UBSAN_CC_FLAGS += -fno-sanitize-recover=alignment
+UBSAN_CC_FLAGS += -fno-stack-protector
+ifeq ($(LLVM), y)
+UBSAN_CC_FLAGS += -fno-sanitize-link-runtime
+endif
+CFLAGS += $(UBSAN_CC_FLAGS)
+endif
+
 ifeq ($(V), 1)
 ELFFLAGS	+=	-Wl,--print-gc-sections
 endif
diff --git a/include/sbi/sbi_ubsan.h b/include/sbi/sbi_ubsan.h
new file mode 100644
index 00000000..f93215c4
--- /dev/null
+++ b/include/sbi/sbi_ubsan.h
@@ -0,0 +1,14 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
+#ifndef __SBI_UBSAN_H__
+#define __SBI_UBSAN_H__
+
+#include <sbi/sbi_types.h>
+
+extern volatile unsigned long sbi_ubsan_report_count;
+
+#endif /* __SBI_UBSAN_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..f1f5cc31 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -99,6 +99,9 @@ libsbi-objs-y += sbi_tlb.o
 libsbi-objs-y += sbi_trap.o
 libsbi-objs-y += sbi_trap_ldst.o
 libsbi-objs-y += sbi_trap_v_ldst.o
+ifeq ($(UBSAN), y)
+libsbi-objs-y += sbi_ubsan.o
+endif
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b248e73f..4e34bbc5 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -218,7 +218,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch)
 	__smp_store_release(&coldboot_done, 1);
 }
 
-unsigned long __stack_chk_guard = 0x95B5FF5A;
+unsigned long __attribute__((weak)) __stack_chk_guard = 0x95B5FF5A;
 
 static unsigned long entry_count_offset;
 static unsigned long init_count_offset;
diff --git a/lib/sbi/sbi_ubsan.c b/lib/sbi/sbi_ubsan.c
new file mode 100644
index 00000000..271be7b0
--- /dev/null
+++ b/lib/sbi/sbi_ubsan.c
@@ -0,0 +1,924 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2018 The NetBSD Foundation, Inc.
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
+#ifdef UBSAN_ENABLED
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+
+/* Undefined Behavior specific defines and structures defined by the compiler ABI */
+
+#define KIND_INTEGER 0
+#define KIND_FLOAT 1
+#define KIND_UNKNOWN UINT16_MAX
+
+volatile unsigned long sbi_ubsan_report_count;
+
+struct CSourceLocation {
+	char *mFilename;
+	uint32_t mLine;
+	uint32_t mColumn;
+};
+
+struct CTypeDescriptor {
+	uint16_t mTypeKind;
+	uint16_t mTypeInfo;
+	uint8_t mTypeName[1];
+};
+
+struct COverflowData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+};
+
+struct CUnreachableData {
+	struct CSourceLocation mLocation;
+};
+
+struct CCFICheckFailData {
+	uint8_t mCheckKind;
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+};
+
+struct CDynamicTypeCacheMissData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+	void *mTypeInfo;
+	uint8_t mTypeCheckKind;
+};
+
+struct CFunctionTypeMismatchData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+};
+
+struct CInvalidBuiltinData {
+	struct CSourceLocation mLocation;
+	uint8_t mKind;
+};
+
+struct CInvalidValueData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+};
+
+struct CNonNullArgData {
+	struct CSourceLocation mLocation;
+	struct CSourceLocation mAttributeLocation;
+	int mArgIndex;
+};
+
+struct CNonNullReturnData {
+	struct CSourceLocation mAttributeLocation;
+};
+
+struct COutOfBoundsData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mArrayType;
+	struct CTypeDescriptor *mIndexType;
+};
+
+struct CPointerOverflowData {
+	struct CSourceLocation mLocation;
+};
+
+struct CShiftOutOfBoundsData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mLHSType;
+	struct CTypeDescriptor *mRHSType;
+};
+
+struct CTypeMismatchData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+	unsigned long mLogAlignment;
+	uint8_t mTypeCheckKind;
+};
+
+struct CTypeMismatchData_v1 {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+	uint8_t mLogAlignment;
+	uint8_t mTypeCheckKind;
+};
+
+struct CVLABoundData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mType;
+};
+
+struct CFloatCastOverflowData {
+	struct CSourceLocation
+		mLocation; /* This field exists in this struct since 2015 August 11th */
+	struct CTypeDescriptor *mFromType;
+	struct CTypeDescriptor *mToType;
+};
+
+struct CImplicitConversionData {
+	struct CSourceLocation mLocation;
+	struct CTypeDescriptor *mFromType;
+	struct CTypeDescriptor *mToType;
+	uint8_t mKind;
+};
+
+struct CAlignmentAssumptionData {
+	struct CSourceLocation mLocation;
+	struct CSourceLocation mAssumptionLocation;
+	struct CTypeDescriptor *mType;
+};
+
+/* Public symbols used in the instrumentation of the code generation part */
+void __ubsan_handle_add_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_add_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS,
+				       unsigned long ulRHS);
+void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData,
+					 unsigned long ulPointer,
+					 unsigned long ulAlignment,
+					 unsigned long ulOffset);
+void __ubsan_handle_alignment_assumption_abort(
+	struct CAlignmentAssumptionData *pData, unsigned long ulPointer,
+	unsigned long ulAlignment, unsigned long ulOffset);
+void __ubsan_handle_builtin_unreachable(struct CUnreachableData *pData);
+void __ubsan_handle_divrem_overflow(struct COverflowData *pData,
+				    unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData,
+					  unsigned long ulLHS,
+					  unsigned long ulRHS);
+void __ubsan_handle_function_type_mismatch(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
+void __ubsan_handle_function_type_mismatch_abort(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
+void __ubsan_handle_function_type_mismatch_v1(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction,
+	unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
+void __ubsan_handle_function_type_mismatch_v1_abort(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction,
+	unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
+void __ubsan_handle_invalid_builtin(struct CInvalidBuiltinData *pData);
+void __ubsan_handle_invalid_builtin_abort(struct CInvalidBuiltinData *pData);
+void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData,
+				       unsigned long ulVal);
+void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData,
+					     unsigned long ulVal);
+void __ubsan_handle_missing_return(struct CUnreachableData *pData);
+void __ubsan_handle_mul_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS,
+				       unsigned long ulRHS);
+void __ubsan_handle_negate_overflow(struct COverflowData *pData,
+				    unsigned long ulOldVal);
+void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData,
+					  unsigned long ulOldVal);
+void __ubsan_handle_nullability_arg(struct CNonNullArgData *pData);
+void __ubsan_handle_nullability_arg_abort(struct CNonNullArgData *pData);
+void __ubsan_handle_nullability_return_v1(
+	struct CNonNullReturnData *pData,
+	struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_nullability_return_v1_abort(
+	struct CNonNullReturnData *pData,
+	struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData,
+				  unsigned long ulIndex);
+void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData,
+					unsigned long ulIndex);
+void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData,
+				     unsigned long ulBase,
+				     unsigned long ulResult);
+void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData,
+					   unsigned long ulBase,
+					   unsigned long ulResult);
+void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData,
+					unsigned long ulLHS,
+					unsigned long ulRHS);
+void __ubsan_handle_shift_out_of_bounds_abort(
+	struct CShiftOutOfBoundsData *pData, unsigned long ulLHS,
+	unsigned long ulRHS);
+void __ubsan_handle_sub_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS,
+				       unsigned long ulRHS);
+void __ubsan_handle_type_mismatch(struct CTypeMismatchData *pData,
+				  unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_abort(struct CTypeMismatchData *pData,
+					unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData,
+				     unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData,
+					   unsigned long ulPointer);
+void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData,
+					   unsigned long ulBound);
+void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData,
+						 unsigned long ulBound);
+void __ubsan_get_current_report_data(const char **ppOutIssueKind,
+				     const char **ppOutMessage,
+				     const char **ppOutFilename,
+				     uint32_t *pOutLine, uint32_t *pOutCol,
+				     char **ppOutMemoryAddr);
+static void HandleOverflow(bool isFatal, struct COverflowData *pData,
+			   unsigned long ulLHS, unsigned long ulRHS,
+			   const char *szOperation);
+static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData,
+				 unsigned long ulOldValue);
+static void HandleBuiltinUnreachable(bool isFatal,
+				     struct CUnreachableData *pData);
+static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation,
+			       struct CTypeDescriptor *mType,
+			       unsigned long mLogAlignment,
+			       uint8_t mTypeCheckKind, unsigned long ulPointer);
+static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData,
+				      unsigned long ulBound);
+static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData,
+			      unsigned long ulIndex);
+static void HandleShiftOutOfBounds(bool isFatal,
+				   struct CShiftOutOfBoundsData *pData,
+				   unsigned long ulLHS, unsigned long ulRHS);
+static void HandleLoadInvalidValue(bool isFatal,
+				   struct CInvalidValueData *pData,
+				   unsigned long ulValue);
+static void HandleInvalidBuiltin(bool isFatal,
+				 struct CInvalidBuiltinData *pData);
+static void HandleFunctionTypeMismatch(bool isFatal,
+				       struct CFunctionTypeMismatchData *pData,
+				       unsigned long ulFunction);
+static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData);
+static void HandlePointerOverflow(bool isFatal,
+				  struct CPointerOverflowData *pData,
+				  unsigned long ulBase, unsigned long ulResult);
+static void HandleAlignmentAssumption(bool isFatal,
+				      struct CAlignmentAssumptionData *pData,
+				      unsigned long ulPointer,
+				      unsigned long ulAlignment,
+				      unsigned long ulOffset);
+
+#define NUMBER_SIGNED_BIT 1
+#define NUMBER_MAXLEN 128
+#define __arraycount(__a) (sizeof(__a) / sizeof(__a[0]))
+#define __BIT(__n) (1UL << (__n))
+#define SEPARATOR sbi_printf("===========================================\n")
+#define ACK_REPORTED (1U << 31)
+
+static bool isAlreadyReported(struct CSourceLocation *pLocation)
+{
+	uint32_t siOldValue;
+	volatile uint32_t *pLine;
+
+	if (!pLocation)
+		return false;
+
+	pLine = &pLocation->mLine;
+
+	do {
+		siOldValue = *pLine;
+	} while (__sync_val_compare_and_swap(pLine, siOldValue,
+					     siOldValue | ACK_REPORTED) !=
+		 siOldValue);
+
+	if (!(siOldValue & ACK_REPORTED)) {
+
+		sbi_ubsan_report_count++;
+
+		return false;
+	}
+
+	return true;
+}
+
+static void HandleOverflow(bool isFatal, struct COverflowData *pData,
+			   unsigned long ulLHS, unsigned long ulRHS,
+			   const char *szOperation)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+	sbi_printf("UBSan: %s integer overflow: ",
+		   is_signed ? "signed" : "unsigned");
+
+	if (is_signed) {
+		sbi_printf("%ld %s %ld ", (long)ulLHS, szOperation,
+			   (long)ulRHS);
+	} else {
+		sbi_printf("%lu %s %lu ", ulLHS, szOperation, ulRHS);
+	}
+
+	sbi_printf("cannot be represented in type %s\n",
+		   pData->mType->mTypeName);
+
+	SEPARATOR;
+}
+
+static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData,
+				 unsigned long ulOldValue)
+{
+	if (!pData) {
+		return;
+	}
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+	sbi_printf("UBSan: Negation of ");
+
+	if (is_signed) {
+		sbi_printf("%ld", (long)ulOldValue);
+	} else {
+		sbi_printf("%lu", ulOldValue);
+	}
+
+	sbi_printf("cannot be represented in type %s\n",
+		   pData->mType->mTypeName);
+
+	SEPARATOR;
+}
+
+static void HandleBuiltinUnreachable(bool isFatal,
+				     struct CUnreachableData *pData)
+{
+	if (!pData) {
+		return;
+	}
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	SEPARATOR;
+}
+
+const char *rgczTypeCheckKinds[] = { "load of",
+				     "store to",
+				     "reference binding to",
+				     "member access within",
+				     "member call on",
+				     "constructor call on",
+				     "downcast of",
+				     "downcast of",
+				     "upcast of",
+				     "cast to virtual base of",
+				     "_Nonnull binding to",
+				     "dynamic operation on" };
+
+static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation,
+			       struct CTypeDescriptor *mType,
+			       unsigned long mLogAlignment,
+			       uint8_t mTypeCheckKind, unsigned long ulPointer)
+{
+
+	if ((!mLocation) || (!mType)) {
+		return;
+	}
+
+	if (isAlreadyReported(mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   mLocation->mFilename, mLocation->mLine & ~ACK_REPORTED,
+		   mLocation->mColumn);
+
+	const char *kind = (mTypeCheckKind < __arraycount(rgczTypeCheckKinds))
+				   ? rgczTypeCheckKinds[mTypeCheckKind]
+				   : "access to";
+
+	if (ulPointer == 0) {
+		sbi_printf("%s null pointer of type %s\n", kind,
+			   mType->mTypeName);
+	} else if (
+		(mLogAlignment - 1) &
+		ulPointer) { //mLogAlignment is converted on the wrapper function call
+		sbi_printf(
+			"%s misaligned address %p for type %s which requires %ld byte alignment\n",
+			kind, (void *)ulPointer, mType->mTypeName,
+			mLogAlignment);
+	} else {
+		sbi_printf(
+			"%s address %p with insufficient space for an object of type %s\n",
+			kind, (void *)ulPointer, mType->mTypeName);
+	}
+	SEPARATOR;
+}
+
+static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData,
+				      unsigned long ulBound)
+{
+	if (!pData) {
+		return;
+	}
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	sbi_printf("variable length array bound value ");
+
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+	if (is_signed) {
+		sbi_printf("%ld", (long)ulBound);
+	} else {
+		sbi_printf("%lu", ulBound);
+	}
+
+	sbi_printf(" <= 0\n");
+
+	SEPARATOR;
+}
+
+static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData,
+			      unsigned long ulIndex)
+{
+	if (!pData) {
+		return;
+	}
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	bool is_signed = pData->mIndexType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+	if (is_signed) {
+		sbi_printf("index %ld", (long)ulIndex);
+	} else {
+		sbi_printf("index %lu", ulIndex);
+	}
+
+	sbi_printf(" is out of range for type %s\n",
+		   pData->mArrayType->mTypeName);
+
+	SEPARATOR;
+}
+
+static bool isNegativeNumber(struct CTypeDescriptor *pType, unsigned long ulVal)
+{
+	if (!(pType->mTypeInfo & NUMBER_SIGNED_BIT)) {
+		return false;
+	}
+
+	return (long)ulVal < 0;
+}
+
+static size_t type_width(struct CTypeDescriptor *pType)
+{
+	return 1UL << (pType->mTypeInfo >> 1);
+}
+
+static void HandleShiftOutOfBounds(bool isFatal,
+				   struct CShiftOutOfBoundsData *pData,
+				   unsigned long ulLHS, unsigned long ulRHS)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	if (isNegativeNumber(pData->mRHSType, ulRHS)) {
+		sbi_printf("shift exponent %ld is negative\n", (long)ulRHS);
+	} else if (ulRHS >= type_width(pData->mLHSType)) {
+		sbi_printf(
+			"shift exponent %lu is too large for %lu-bit type %s\n",
+			ulRHS, (unsigned long)type_width(pData->mLHSType),
+			pData->mLHSType->mTypeName);
+
+	} else if (isNegativeNumber(pData->mLHSType, ulLHS)) {
+		sbi_printf("left shift of negative value %ld\n", (long)ulLHS);
+	} else {
+		sbi_printf(
+			"left shift of %lu by %lu places cannot be represented in type %s\n",
+			ulLHS, ulRHS, pData->mLHSType->mTypeName);
+	}
+
+	SEPARATOR;
+}
+
+static void HandleLoadInvalidValue(bool isFatal,
+				   struct CInvalidValueData *pData,
+				   unsigned long ulValue)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+	sbi_printf("load of value ");
+
+	if (is_signed) {
+		sbi_printf("%ld ", (long)ulValue);
+	} else {
+		sbi_printf("%lu ", ulValue);
+	}
+
+	sbi_printf("is not a valid value for type %s\n",
+		   pData->mType->mTypeName);
+
+	SEPARATOR;
+}
+
+const char *rgczBuiltinCheckKinds[] = { "ctz()", "clz()" };
+
+static void HandleInvalidBuiltin(bool isFatal,
+				 struct CInvalidBuiltinData *pData)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	const char *builtin =
+		(pData->mKind < __arraycount(rgczBuiltinCheckKinds))
+			? rgczBuiltinCheckKinds[pData->mKind]
+			: "unknown builtin";
+
+	sbi_printf("passing zero to %s, which is not a valid argument\n",
+		   builtin);
+
+	SEPARATOR;
+}
+
+static void HandleFunctionTypeMismatch(bool isFatal,
+				       struct CFunctionTypeMismatchData *pData,
+				       unsigned long ulFunction)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	sbi_printf(
+		"call to function %#lx through pointer to incorrect function type %s\n",
+		ulFunction, pData->mType->mTypeName);
+
+	SEPARATOR;
+}
+
+static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	sbi_printf(
+		"execution reached the end of a value-returning function without returning a value\n");
+
+	SEPARATOR;
+}
+
+static void HandlePointerOverflow(bool isFatal,
+				  struct CPointerOverflowData *pData,
+				  unsigned long ulBase, unsigned long ulResult)
+{
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	sbi_printf("pointer expression with base %#lx overflowed to %#lx\n",
+		   ulBase, ulResult);
+
+	SEPARATOR;
+}
+
+static void HandleAlignmentAssumption(bool isFatal,
+				      struct CAlignmentAssumptionData *pData,
+				      unsigned long ulPointer,
+				      unsigned long ulAlignment,
+				      unsigned long ulOffset)
+{
+
+	if (!pData) {
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation)) {
+		return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+		   pData->mLocation.mFilename,
+		   pData->mLocation.mLine & ~ACK_REPORTED,
+		   pData->mLocation.mColumn);
+
+	unsigned long ulRealPointer = ulPointer - ulOffset;
+	sbi_printf("alignment assumption of %lu for pointer %p (offset %p)",
+		   ulAlignment, (void *)ulRealPointer, (void *)ulOffset);
+
+	if (pData->mAssumptionLocation.mFilename != NULL) {
+		sbi_printf(", assumption made in %s:%u:%u",
+			   pData->mAssumptionLocation.mFilename,
+			   pData->mAssumptionLocation.mLine,
+			   pData->mAssumptionLocation.mColumn);
+	}
+
+	sbi_printf("\n");
+
+	SEPARATOR;
+}
+
+/* Definions of public symbols emitted by the instrumentation code */
+void __ubsan_handle_add_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "+");
+}
+
+void __ubsan_handle_add_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "+");
+}
+
+void __ubsan_handle_sub_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "-");
+}
+
+void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "-");
+}
+
+void __ubsan_handle_mul_overflow(struct COverflowData *pData,
+				 unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "*");
+}
+
+void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData,
+				       unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "*");
+}
+
+void __ubsan_handle_negate_overflow(struct COverflowData *pData,
+				    unsigned long ulOldValue)
+{
+	HandleNegateOverflow(false, pData, ulOldValue);
+}
+
+void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData,
+					  unsigned long ulOldValue)
+{
+	HandleNegateOverflow(true, pData, ulOldValue);
+}
+
+void __ubsan_handle_divrem_overflow(struct COverflowData *pData,
+				    unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "divrem");
+}
+
+void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData,
+					  unsigned long ulLHS,
+					  unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "divrem");
+}
+
+void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData,
+				     unsigned long ulPointer)
+{
+	HandleTypeMismatch(false, &pData->mLocation, pData->mType,
+			   __BIT(pData->mLogAlignment), pData->mTypeCheckKind,
+			   ulPointer);
+}
+
+void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData,
+					   unsigned long ulPointer)
+{
+	HandleTypeMismatch(true, &pData->mLocation, pData->mType,
+			   __BIT(pData->mLogAlignment), pData->mTypeCheckKind,
+			   ulPointer);
+}
+
+void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData,
+				  unsigned long ulIndex)
+{
+	HandleOutOfBounds(false, pData, ulIndex);
+}
+
+void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData,
+					unsigned long ulIndex)
+{
+	HandleOutOfBounds(true, pData, ulIndex);
+}
+
+void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData,
+					unsigned long ulLHS,
+					unsigned long ulRHS)
+{
+	HandleShiftOutOfBounds(false, pData, ulLHS, ulRHS);
+}
+
+void __ubsan_handle_shift_out_of_bounds_abort(
+	struct CShiftOutOfBoundsData *pData, unsigned long ulLHS,
+	unsigned long ulRHS)
+{
+	HandleShiftOutOfBounds(true, pData, ulLHS, ulRHS);
+}
+
+void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData,
+				     unsigned long ulBase,
+				     unsigned long ulResult)
+{
+	HandlePointerOverflow(false, pData, ulBase, ulResult);
+}
+
+void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData,
+					   unsigned long ulBase,
+					   unsigned long ulResult)
+{
+	HandlePointerOverflow(true, pData, ulBase, ulResult);
+}
+
+void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData,
+					 unsigned long ulPointer,
+					 unsigned long ulAlignment,
+					 unsigned long ulOffset)
+{
+	HandleAlignmentAssumption(false, pData, ulPointer, ulAlignment,
+				  ulOffset);
+}
+
+void __ubsan_handle_alignment_assumption_abort(
+	struct CAlignmentAssumptionData *pData, unsigned long ulPointer,
+	unsigned long ulAlignment, unsigned long ulOffset)
+{
+	HandleAlignmentAssumption(true, pData, ulPointer, ulAlignment,
+				  ulOffset);
+}
+
+void __ubsan_handle_builtin_unreachable(struct CUnreachableData *pData)
+{
+	HandleBuiltinUnreachable(true, pData);
+}
+
+void __ubsan_handle_invalid_builtin(struct CInvalidBuiltinData *pData)
+{
+	HandleInvalidBuiltin(true, pData);
+}
+
+void __ubsan_handle_invalid_builtin_abort(struct CInvalidBuiltinData *pData)
+{
+	HandleInvalidBuiltin(true, pData);
+}
+
+void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData,
+				       unsigned long ulValue)
+{
+	HandleLoadInvalidValue(false, pData, ulValue);
+}
+
+void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData,
+					     unsigned long ulValue)
+{
+	HandleLoadInvalidValue(true, pData, ulValue);
+}
+
+void __ubsan_handle_missing_return(struct CUnreachableData *pData)
+{
+	HandleMissingReturn(true, pData);
+}
+
+void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData,
+					   unsigned long ulBound)
+{
+	HandleVlaBoundNotPositive(false, pData, ulBound);
+}
+
+void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData,
+						 unsigned long ulBound)
+{
+	HandleVlaBoundNotPositive(true, pData, ulBound);
+}
+
+void __ubsan_handle_function_type_mismatch(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
+{
+	HandleFunctionTypeMismatch(false, pData, ulFunction);
+}
+
+void __ubsan_handle_function_type_mismatch_abort(
+	struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
+{
+	HandleFunctionTypeMismatch(true, pData, ulFunction);
+}
+#endif
diff --git a/lib/sbi/tests/objects.mk b/lib/sbi/tests/objects.mk
index 3ee1c635..40c441e1 100644
--- a/lib/sbi/tests/objects.mk
+++ b/lib/sbi/tests/objects.mk
@@ -24,3 +24,8 @@ libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_bitops_test.o
 
 carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += string_test_suite
 libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_string_test.o
+
+ifeq ($(UBSAN),y)
+carray-sbi_unit_tests-$(CONFIG_SBIUNIT) += ubsan_test_suite
+libsbi-objs-$(CONFIG_SBIUNIT) += tests/sbi_ubsan_test.o
+endif
diff --git a/lib/sbi/tests/sbi_ubsan_test.c b/lib/sbi/tests/sbi_ubsan_test.c
new file mode 100644
index 00000000..23409cb1
--- /dev/null
+++ b/lib/sbi/tests/sbi_ubsan_test.c
@@ -0,0 +1,114 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
+#include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_ubsan.h>
+
+#define UBSAN_EXPECT_FIRES(test, stmt)                                    \
+	do {                                                              \
+		unsigned long _before = sbi_ubsan_report_count;           \
+		stmt;                                                     \
+		SBIUNIT_EXPECT_NE(test, sbi_ubsan_report_count, _before); \
+	} while (0)
+
+static void test_ubsan_add_overflow(struct sbiunit_test_case *test)
+{
+	volatile int a = 0x7FFFFFFF; //INT_MAx
+	volatile int b = 1;
+	volatile int c;
+	UBSAN_EXPECT_FIRES(test, c = a + b);
+	(void)c;
+}
+
+static void test_ubsan_sub_overflow(struct sbiunit_test_case *test)
+{
+	volatile int a = 0x80000000; //INT_MIN
+	volatile int b = 1;
+	volatile int c;
+	UBSAN_EXPECT_FIRES(test, c = a - b);
+	(void)c;
+}
+
+static void test_ubsan_mul_overflow(struct sbiunit_test_case *test)
+{
+	volatile int a = 0x7FFFFFFF;
+	volatile int b = 2;
+	volatile int c;
+	UBSAN_EXPECT_FIRES(test, c = a * b);
+	(void)c;
+}
+
+static void test_ubsan_divrem(struct sbiunit_test_case *test)
+{
+	volatile int a = 10;
+	volatile int b = 0;
+	volatile int c;
+	UBSAN_EXPECT_FIRES(test, c = a / b);
+	(void)c;
+}
+
+static void test_ubsan_oob(struct sbiunit_test_case *test)
+{
+	volatile int idx = 5;
+	int arr[3]	 = { 1, 2, 3 };
+	volatile int val;
+	UBSAN_EXPECT_FIRES(test, val = arr[idx]);
+	(void)val;
+}
+
+static void test_ubsan_shift_too_large(struct sbiunit_test_case *test)
+{
+	volatile unsigned long val = 1;
+	volatile int shift	   = 64;
+	volatile unsigned long res;
+	UBSAN_EXPECT_FIRES(test, res = val << shift);
+	(void)res;
+}
+
+static void test_ubsan_shift_negative(struct sbiunit_test_case *test)
+{
+	volatile int val   = 1;
+	volatile int shift = -1;
+	volatile int res;
+
+	UBSAN_EXPECT_FIRES(test, res = val << shift);
+	(void)res;
+}
+
+static void test_ubsan_load_invalid_bool(struct sbiunit_test_case *test)
+{
+	volatile char bool_val = 5;
+	volatile bool *b_ptr   = (bool *)&bool_val;
+	volatile int taken     = 0;
+	UBSAN_EXPECT_FIRES(test, if (*b_ptr) taken = 1);
+	(void)taken;
+}
+
+static void test_ubsan_pointer_overflow(struct sbiunit_test_case *test)
+{
+	volatile uintptr_t base = 0xFFFFFFFFFFFFFFFEUL;
+	volatile char *ptr	= (char *)base;
+	volatile char *res;
+	UBSAN_EXPECT_FIRES(test, res = ptr + 5);
+	(void)res;
+}
+
+static struct sbiunit_test_case ubsan_tests[] = {
+	SBIUNIT_TEST_CASE(test_ubsan_add_overflow),
+	SBIUNIT_TEST_CASE(test_ubsan_sub_overflow),
+	SBIUNIT_TEST_CASE(test_ubsan_mul_overflow),
+	SBIUNIT_TEST_CASE(test_ubsan_divrem),
+	SBIUNIT_TEST_CASE(test_ubsan_oob),
+	SBIUNIT_TEST_CASE(test_ubsan_shift_too_large),
+	SBIUNIT_TEST_CASE(test_ubsan_shift_negative),
+	SBIUNIT_TEST_CASE(test_ubsan_load_invalid_bool),
+	SBIUNIT_TEST_CASE(test_ubsan_pointer_overflow),
+	SBIUNIT_END_CASE,
+};
+
+SBIUNIT_TEST_SUITE(ubsan_test_suite, ubsan_tests);
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index c4a8fee2..3f190625 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -39,5 +39,10 @@ ifeq ($(PLATFORM_RISCV_XLEN), 32)
 else
   # This needs to be 2MB aligned for 64-bit system
   FW_PAYLOAD_OFFSET=0x200000
+  ifeq ($(UBSAN), y)
+  # FW payload size overlaps data for 2MB
+  FW_PAYLOAD_OFFSET=0x400000
+  endif
+
 endif
 FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
