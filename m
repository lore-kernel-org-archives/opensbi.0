Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA67C636C1
	for <opensbi@archiver.kernel.org>; Sun, 22 Feb 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E86sMmn3aJ3/cybQvyTCNDOZPjpXH0XeNIPn5FrPytM=; b=mAUURUb1e9wl48
	kfe5M0cyIoTIf2LpIl+WiY5cr6E7RPuyYS/6aazjkaWUAqIlGoyVENDLpdhT9Rj/V54gtlfhLvSzP
	My/x6wfWkPHcBkZfp61X599lew+V17gPe9bPchDjHuvgcDzSoT7/Vm+N8KKpwTIE9FfQKmzm8hlyH
	X1oXfKqEuqy3zEEKjnWjBNDyPodKfJpWmwwV7jCj46UQn0PjQRA7bu6DTHwk4GqolIqILuCjHzQqa
	wFAGGZipmQgF6wEtGbg4GDVQW9ExS3ZDQqLQBRF5c0Km//hTuTf4IRY8Gi5t936NB2Rbe3SvP+TGn
	I+sJlA95/Kk5/qGfln/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI7Q-0000000H0NF-1FIW;
	Sun, 22 Feb 2026 22:40:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI77-0000000H05C-10Hj
	for opensbi@lists.infradead.org;
	Sun, 22 Feb 2026 22:39:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4359249bbacso2768421f8f.0
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 14:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771799983; x=1772404783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlk3resaXEsdA6yx5Pwj3ILeRGHL9yCGUK6xi5MrhuE=;
        b=O4tAlsOqwiiJ1GcWliITGer1hwqdNeZn/b12rGEGVMbrgzoFd6a27faOPK404fG2hL
         ZwZmI+5RHGB276a6YAyXxqVjRkl6oICucKcHnVm77TGxA1kkhXg60JhSRIw2wddYh6tp
         nRD9kqgzP0faDYgLgLCiBwrsdLmvGGKbM9IAkIyB7VV54Kf2v/dbQersvMBwpkYxvMJO
         eOLw+D2sy6Bra/lUKzDZo2Ujnf7eu/F2BRYjTz8lfKAral3CGx703SPikySGNsGdZ3zq
         AbSyrvmEccMUirD7k1cKvpL5kbty8Ib2tXtItRucjOngLHyobx6jE5kRvZgnzYhQm8GL
         7tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771799983; x=1772404783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlk3resaXEsdA6yx5Pwj3ILeRGHL9yCGUK6xi5MrhuE=;
        b=NNcAJrsDIZL3Njs5gdpHivjGRIfT470xfek/ldns6Xt6aF5k57R1hHepWW2RsqxDDq
         nxdp1ani+C1SAnUu/uaIyJZymwOBQ+0TtLC33bJzEzhMWPai3kVrs1dzkFwQGto+SeN/
         2+QNXwkDGse/BscjG2WkZ3BSh+RjA6GSARSIImEEDtlt8CllRiqRhnfM46JueqZ3Ulk5
         j9yKkVeTTn/jyuP5vIj3n7hLhpX3o5ykbR76QOK1OFKtPwMFq4vEDGuTYWh3ylpoS4Ft
         fCycsDNvlsbNjSht8jgDHdcMaASlaHz6Cw2ssU9VYH4w3SXCYhx6OAxsphpI2++/DehJ
         +UOw==
X-Gm-Message-State: AOJu0Yzf8R0RFESktTZrAgvcbWouPJkpzm3AOSk5lXIWTKvX8wDk7Oq8
	lC5RXzlUeW+MsNsdPq5/b3/tAJ8/f1783XEPvoFtUhMCEu+wv7uIvRkguSG+jw==
X-Gm-Gg: AZuq6aK+5EdPgZVoHFbhwz5jHaqswksOqsyR/9j1uy2/nHWvV9KZqhlUfMhMUCn1pDu
	gZL5q4EUe55F6xKwHJK9APEjhjV7fnE7x8N+yblDZRuDxwWqCPipLkLgYopT+qEpieg5L0Lip4s
	yMlIQzGlHwmXe4InWCKqxuWPawFIclqyLy8Nep7qn6oNGGAhsbnU7IirLe4yG4eEfKTCxPvp53D
	+0kkazBDGk4U5RdfHdfGZidAsIVS2kXZ1Y+aM16E56mD0ekCj3CJ+Ni/XkRne4qsSYPVrhKH6Uv
	lL5zoobtSffJS+pFukmcz1iQHDjuPY5n8sWoL2O8jwBviAf6F+pCtSTlwzQPZT1VHx6PbnkerHn
	UHOnJfSpXjhWtBjyIR3rsulPPxkpkGL9+2GKLxCtdngbKQsYBq7MRUOBHikUeeIUl8JSugTzZsT
	C2wS7xZoPxsmK9wNt78absZBPEsdvjCgSMjfQOj4NfDiLfJLDjepKKuLlUytuD8F9wAmjKCtXal
	xzHIBXQULshvV1xFgZZUhNGObgmGMgvDaDBkFJypM2yPE/ksNrSY0g+qU9VxGeAEg==
X-Received: by 2002:a05:6000:4383:b0:436:180e:78d9 with SMTP id ffacd0b85a97d-4396fd9b890mr12025671f8f.1.1771799982599;
        Sun, 22 Feb 2026 14:39:42 -0800 (PST)
Received: from marcosthinkpad ([79.116.216.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm16193093f8f.22.2026.02.22.14.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 14:39:42 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos <marcos.oduardo@gmail.com>
Subject: [PATCH v2] lib: sbi: add UBSan support
Date: Sun, 22 Feb 2026 23:40:33 +0100
Message-ID: <20260222224033.237725-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143945_722112_21998F8E 
X-CRM114-Status: GOOD (  23.49  )
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

From: marcos <marcos.oduardo@gmail.com>

UBSan (Undefined Behavior Sanitizer) is a tool implemented using
compiler instrumentation at runtime that allows checking for statements
whose output is not deterministic or defined by the C standard,
incurring unexpected results in the execution of the program. Compiling
and testing the OpenSBI firmware against UBSan will print a message in
the console if any sentence performs any of these actions.

Support for this implementation involves two main components:
1.- The UBSan implementation hooks (derived from NetBSD), used by the
    compiler to handle the check output.
2.- A test suite to verify correct operation at runtime.

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
 Makefile                                |   14 +
 include/sbi/sbi_ubsan_test.h            |    8 +
 lib/sbi/objects.mk                      |    6 +
 lib/sbi/sbi_init.c                      |    6 +
 lib/sbi/sbi_ubsan.c                     |  849 +++++++++++++++++
 lib/sbi/sbi_ubsan_test.c                |  147 +++
 v2-0001-lib-sbi-add-UBSan-support.patch | 1145 +++++++++++++++++++++++
 7 files changed, 2175 insertions(+)
 create mode 100644 include/sbi/sbi_ubsan_test.h
 create mode 100644 lib/sbi/sbi_ubsan.c
 create mode 100644 lib/sbi/sbi_ubsan_test.c
 create mode 100644 v2-0001-lib-sbi-add-UBSan-support.patch

diff --git a/Makefile b/Makefile
index 46541063..0689242b 100644
--- a/Makefile
+++ b/Makefile
@@ -455,6 +455,20 @@ else
 CFLAGS		+=	-O2
 endif
 
+ifeq ($(ENABLEUBSAN),y)
+UBSAN_CC_FLAGS := -fsanitize=undefined
+UBSAN_CC_FLAGS += -DUBSAN_ENABLED
+ifeq ($(ENABLEUBSANTESTS),y)
+UBSAN_CC_FLAGS += -DUBSAN_TESTS_ENABLED
+endif
+UBSAN_CC_FLAGS += -fno-sanitize=vptr
+UBSAN_CC_FLAGS += -fno-sanitize=float-cast-overflow
+UBSAN_CC_FLAGS += -fno-sanitize=float-divide-by-zero
+UBSAN_CC_FLAGS += -fsanitize-recover=undefined
+UBSAN_CC_FLAGS += -fsanitize=pointer-overflow
+CFLAGS += $(UBSAN_CC_FLAGS)
+endif
+
 ifeq ($(V), 1)
 ELFFLAGS	+=	-Wl,--print-gc-sections
 endif
diff --git a/include/sbi/sbi_ubsan_test.h b/include/sbi/sbi_ubsan_test.h
new file mode 100644
index 00000000..13c6a562
--- /dev/null
+++ b/include/sbi/sbi_ubsan_test.h
@@ -0,0 +1,8 @@
+#ifdef UBSAN_TESTS_ENABLED
+#ifndef __SBI_UBSAN_TEST_H__
+#define __SBI_UBSAN_TEST_H__
+
+void sbi_ubsan_test_suite(void);
+
+#endif
+#endif
\ No newline at end of file
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..b6f97120 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -99,6 +99,12 @@ libsbi-objs-y += sbi_tlb.o
 libsbi-objs-y += sbi_trap.o
 libsbi-objs-y += sbi_trap_ldst.o
 libsbi-objs-y += sbi_trap_v_ldst.o
+ifeq ($(ENABLEUBSAN), y)
+libsbi-objs-y += sbi_ubsan.o
+ifeq ($(ENABLEUBSANTESTS), y)
+libsbi-objs-y += sbi_ubsan_test.o
+endif
+endif
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..5155716c 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,8 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_ubsan_test.h>
+
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -288,6 +290,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_double_trap_init(scratch);
 
+	#ifdef UBSAN_TESTS_ENABLED
+	sbi_ubsan_test_suite();
+	#endif
+
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
diff --git a/lib/sbi/sbi_ubsan.c b/lib/sbi/sbi_ubsan.c
new file mode 100644
index 00000000..f341275f
--- /dev/null
+++ b/lib/sbi/sbi_ubsan.c
@@ -0,0 +1,849 @@
+/* SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2018 The NetBSD Foundation, Inc.
+ * All rights reserved.
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ * 
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+ * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
+ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifdef UBSAN_ENABLED
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+
+/* Undefined Behavior specific defines and structures. Type descriptors defined by the compiler ABI */
+
+#define KIND_INTEGER	0
+#define KIND_FLOAT	1
+#define KIND_UNKNOWN	UINT16_MAX
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
+	struct CSourceLocation mLocation;	/* This field exists in this struct since 2015 August 11th */
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
+void __ubsan_handle_add_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_add_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
+void __ubsan_handle_alignment_assumption_abort(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
+void __ubsan_handle_builtin_unreachable(struct CUnreachableData *pData);
+void __ubsan_handle_divrem_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_function_type_mismatch(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
+void __ubsan_handle_function_type_mismatch_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
+void __ubsan_handle_function_type_mismatch_v1(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction, unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
+void __ubsan_handle_function_type_mismatch_v1_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction, unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
+void __ubsan_handle_invalid_builtin(struct CInvalidBuiltinData *pData);
+void __ubsan_handle_invalid_builtin_abort(struct CInvalidBuiltinData *pData);
+void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData, unsigned long ulVal);
+void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData, unsigned long ulVal);
+void __ubsan_handle_missing_return(struct CUnreachableData *pData);
+void __ubsan_handle_mul_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_negate_overflow(struct COverflowData *pData, unsigned long ulOldVal);
+void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData, unsigned long ulOldVal);
+void __ubsan_handle_nullability_arg(struct CNonNullArgData *pData);
+void __ubsan_handle_nullability_arg_abort(struct CNonNullArgData *pData);
+void __ubsan_handle_nullability_return_v1(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_nullability_return_v1_abort(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData, unsigned long ulIndex);
+void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData, unsigned long ulIndex);
+void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
+void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
+void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_shift_out_of_bounds_abort(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_sub_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
+void __ubsan_handle_type_mismatch(struct CTypeMismatchData *pData, unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_abort(struct CTypeMismatchData *pData, unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer);
+void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer);
+void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData, unsigned long ulBound);
+void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData, unsigned long ulBound);
+void __ubsan_get_current_report_data(const char **ppOutIssueKind, const char **ppOutMessage, const char **ppOutFilename, uint32_t *pOutLine, uint32_t *pOutCol, char **ppOutMemoryAddr);
+
+#if 0
+Unimplemented:
+
+void __ubsan_handle_implicit_conversion(struct CImplicitConversionData *pData, unsigned long ulFrom, unsigned long ulTo);
+void __ubsan_handle_implicit_conversion_abort(struct CImplicitConversionData *pData, unsigned long ulFrom, unsigned long ulTo);
+void __ubsan_handle_nonnull_arg(struct CNonNullArgData *pData);
+void __ubsan_handle_nonnull_arg_abort(struct CNonNullArgData *pData);
+void __ubsan_handle_nonnull_return_v1(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_nonnull_return_v1_abort(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
+void __ubsan_handle_float_cast_overflow(struct CFloatCastOverflowData *pData, unsigned long ulFrom);
+void __ubsan_handle_float_cast_overflow_abort(struct CFloatCastOverflowData *pData, unsigned long ulFrom);
+void __ubsan_handle_dynamic_type_cache_miss(struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
+void __ubsan_handle_dynamic_type_cache_miss_abort(struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
+void __ubsan_handle_cfi_bad_type(struct CCFICheckFailData *pData, unsigned long ulVtable, bool bValidVtable, bool FromUnrecoverableHandler, unsigned long ProgramCounter, unsigned long FramePointer);
+void __ubsan_handle_cfi_check_fail(struct CCFICheckFailData *pData, unsigned long ulValue, unsigned long ulValidVtable);
+void __ubsan_handle_cfi_check_fail_abort(struct CCFICheckFailData *pData, unsigned long ulValue, unsigned long ulValidVtable);
+#endif
+
+static void HandleOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS, const char *szOperation);
+static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulOldValue);
+static void HandleBuiltinUnreachable(bool isFatal, struct CUnreachableData *pData);
+static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation, struct CTypeDescriptor *mType, unsigned long mLogAlignment, uint8_t mTypeCheckKind, unsigned long ulPointer);
+static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData, unsigned long ulBound);
+static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData, unsigned long ulIndex);
+static void HandleShiftOutOfBounds(bool isFatal, struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
+static void HandleLoadInvalidValue(bool isFatal, struct CInvalidValueData *pData, unsigned long ulValue);
+static void HandleInvalidBuiltin(bool isFatal, struct CInvalidBuiltinData *pData);
+static void HandleFunctionTypeMismatch(bool isFatal, struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
+static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData);
+static void HandlePointerOverflow(bool isFatal, struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
+static void HandleAlignmentAssumption(bool isFatal, struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
+
+#if 0
+Unimplemented:
+
+static void HandleCFIBadType(bool isFatal, struct CCFICheckFailData *pData, unsigned long ulVtable, bool *bValidVtable, bool *FromUnrecoverableHandler, unsigned long *ProgramCounter, unsigned long *FramePointer);
+static void HandleNonnullArg(bool isFatal, struct CNonNullArgData *pData);
+static void HandleNonnullReturn(bool isFatal, struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
+static void HandleDynamicTypeCacheMiss(bool isFatal, struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
+static void HandleFloatCastOverflow(bool isFatal, struct CFloatCastOverflowData *pData, unsigned long ulFrom);
+#endif
+
+
+#define NUMBER_SIGNED_BIT 1
+#define NUMBER_MAXLEN	128
+#define __arraycount(__a) (sizeof(__a) / sizeof(__a[0]))
+#define __BIT(__n) (1UL << (__n))
+#define SEPARATOR sbi_printf("===========================================\n")
+#define ACK_REPORTED (1U << 31)
+
+static bool isAlreadyReported(struct CSourceLocation *pLocation)
+{
+    uint32_t siOldValue;
+    volatile uint32_t *pLine;
+
+    if (!pLocation)
+        return false;
+
+    pLine = &pLocation->mLine;
+
+	do {
+        siOldValue = *pLine;
+    } while (__sync_val_compare_and_swap(pLine, siOldValue, siOldValue | ACK_REPORTED) != siOldValue);
+
+    return ((siOldValue) & (ACK_REPORTED));
+}
+
+static void HandleOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS, const char *szOperation)
+{
+    if(!pData)
+	{
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);	
+
+    bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+    sbi_printf("UBSan: %s integer overflow: ", is_signed ? "signed" : "unsigned");
+
+    if (is_signed){
+        sbi_printf("%ld %s %ld ",(long)ulLHS, szOperation, (long)ulRHS);
+    }
+    else{
+        sbi_printf("%lu %s %lu ", ulLHS, szOperation, ulRHS);
+    }
+
+    sbi_printf("cannot be represented in type %s\n", pData->mType->mTypeName);
+    
+	SEPARATOR;
+}
+
+static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulOldValue)
+{
+    if(!pData)
+	{
+		return;
+	}
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+	
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+    
+    bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+    sbi_printf("UBSan: Negation of ");
+
+    if (is_signed){
+        sbi_printf("%ld", (long)ulOldValue);
+    }
+    else{
+        sbi_printf("%lu", ulOldValue);
+    }
+
+    sbi_printf("cannot be represented in type %s\n", pData->mType->mTypeName);
+    
+	SEPARATOR;
+}
+
+static void HandleBuiltinUnreachable(bool isFatal, struct CUnreachableData *pData)
+{
+    if(!pData)
+	{
+		return;
+	}	
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+    
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+
+	SEPARATOR;
+}
+
+const char *rgczTypeCheckKinds[] = {
+    "load of",
+    "store to",
+    "reference binding to",
+    "member access within",
+    "member call on",
+    "constructor call on",
+    "downcast of",
+    "downcast of",
+    "upcast of",
+    "cast to virtual base of",
+    "_Nonnull binding to",
+    "dynamic operation on"
+};
+
+static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation, struct CTypeDescriptor *mType, unsigned long mLogAlignment, uint8_t mTypeCheckKind, unsigned long ulPointer)
+{
+
+    if((!mLocation) || (!mType)) {
+		return;
+	}
+	
+	if (isAlreadyReported(mLocation))
+	{
+        return;
+	}
+
+	
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            mLocation->mFilename, 
+            mLocation->mLine & ~ACK_REPORTED, 
+            mLocation->mColumn);
+    
+	const char *kind = (mTypeCheckKind < __arraycount(rgczTypeCheckKinds)) ? rgczTypeCheckKinds[mTypeCheckKind] : "access to";
+    
+    if (ulPointer == 0) {
+    	sbi_printf("%s null pointer of type %s\n", kind, mType->mTypeName);
+	}
+	else if ((mLogAlignment - 1) & ulPointer) { //mLogAlignment is converted on the wrapper function call
+		sbi_printf("%s misaligned address %p for type %s which requires %ld byte alignment\n", kind, (void *)ulPointer, mType->mTypeName, mLogAlignment); 
+	}
+	else {
+		sbi_printf("%s address %p with insufficient space for an object of type %s\n", kind, (void*)ulPointer, mType->mTypeName);
+	}
+	SEPARATOR;
+}
+
+static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData, unsigned long ulBound)
+{
+    if(!pData)
+	{
+		return;
+	}	
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	sbi_printf("variable length array bound value ");
+
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+    if (is_signed){
+        sbi_printf("%ld", (long)ulBound);
+    }
+    else{
+        sbi_printf("%lu", ulBound);
+    }
+
+	sbi_printf(" <= 0\n");
+	
+	SEPARATOR;
+}
+
+static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData, unsigned long ulIndex)
+{
+    if(!pData)
+	{
+		return;
+	}	
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	bool is_signed = pData->mIndexType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+    if (is_signed){
+        sbi_printf("index %ld", (long)ulIndex);
+    }
+    else{
+        sbi_printf("index %lu", ulIndex);
+    }
+	
+	sbi_printf(" is out of range for type %s\n", pData->mArrayType->mTypeName);
+
+	SEPARATOR;
+}
+
+static bool isNegativeNumber(struct CTypeDescriptor *pType, unsigned long ulVal)
+{
+    if (!(pType->mTypeInfo & NUMBER_SIGNED_BIT))
+	{
+        return false;
+	}
+    
+    return (long)ulVal < 0;
+}
+
+static size_t type_width(struct CTypeDescriptor *pType)
+{
+    return 1UL << (pType->mTypeInfo >> 1);
+}
+
+static void HandleShiftOutOfBounds(bool isFatal, struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+    if(!pData)
+	{
+		return;
+	}	
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	if (isNegativeNumber(pData->mRHSType, ulRHS)) {
+		sbi_printf("shift exponent %ld is negative\n", (long)ulRHS);	
+	}
+	else if (ulRHS >= type_width(pData->mLHSType)) {
+		sbi_printf("shift exponent %lu is too large for %lu-bit type %s\n", ulRHS, (unsigned long)type_width(pData->mLHSType), pData->mLHSType->mTypeName);	
+
+	}
+	else if (isNegativeNumber(pData->mLHSType, ulLHS)) {
+		sbi_printf("left shift of negative value %ld\n", (long)ulLHS);
+	}
+	else {
+		sbi_printf("left shift of %lu by %lu places cannot be represented in type %s\n", ulLHS, ulRHS, pData->mLHSType->mTypeName);
+	}
+
+	SEPARATOR;
+}
+
+static void HandleLoadInvalidValue(bool isFatal, struct CInvalidValueData *pData, unsigned long ulValue)
+{
+    if(!pData)
+	{
+		return;
+	}	
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
+
+    sbi_printf("load of value ");
+
+    if (is_signed){
+        sbi_printf("%ld ", (long)ulValue);
+    }
+    else{
+        sbi_printf("%lu ", ulValue);
+    }
+
+	sbi_printf("is not a valid value for type %s\n", pData->mType->mTypeName);
+
+	SEPARATOR;
+}
+
+const char *rgczBuiltinCheckKinds[] = {
+	"ctz()",
+	"clz()"
+};
+
+
+static void HandleInvalidBuiltin(bool isFatal, struct CInvalidBuiltinData *pData)
+{
+    if(!pData)
+	{
+		return;
+	}	
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	const char *builtin = (pData->mKind < __arraycount(rgczBuiltinCheckKinds)) ? rgczBuiltinCheckKinds[pData->mKind] : "unknown builtin";
+
+	sbi_printf("passing zero to %s, which is not a valid argument\n", builtin);
+	
+	SEPARATOR;
+}
+
+static void HandleFunctionTypeMismatch(bool isFatal, struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
+{
+    if(!pData)
+	{
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+
+	
+	sbi_printf("call to function %#lx through pointer to incorrect function type %s\n", ulFunction, pData->mType->mTypeName);
+    
+	SEPARATOR;
+}
+
+static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData)
+{
+    if(!pData)
+	{
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+
+	sbi_printf("execution reached the end of a value-returning function without returning a value\n");
+	
+	SEPARATOR;
+}
+
+static void HandlePointerOverflow(bool isFatal, struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
+{
+    if(!pData)
+	{
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+	SEPARATOR;
+
+  	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+
+	sbi_printf("pointer expression with base %#lx overflowed to %#lx\n", ulBase, ulResult);
+	
+	SEPARATOR;
+}
+
+static void HandleAlignmentAssumption(bool isFatal, struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
+{
+
+    if(!pData)
+	{
+		return;
+	}
+
+	if (isAlreadyReported(&pData->mLocation))
+	{
+        return;
+	}
+
+	SEPARATOR;
+
+	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
+            pData->mLocation.mFilename, 
+            pData->mLocation.mLine & ~ACK_REPORTED, 
+            pData->mLocation.mColumn);
+	
+	unsigned long ulRealPointer = ulPointer - ulOffset;
+	sbi_printf("alignment assumption of %lu for pointer %p (offset %p)", ulAlignment, (void*) ulRealPointer, (void*) ulOffset);
+
+	if (pData->mAssumptionLocation.mFilename != NULL) {
+        sbi_printf(", assumption made in %s:%u:%u",
+            pData->mAssumptionLocation.mFilename,
+            pData->mAssumptionLocation.mLine,
+            pData->mAssumptionLocation.mColumn);
+    }
+
+	sbi_printf("\n");
+
+	SEPARATOR;
+}
+
+/* Definions of public symbols emitted by the instrumentation code */
+void __ubsan_handle_add_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "+");
+}
+
+void __ubsan_handle_add_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "+");
+}
+
+void __ubsan_handle_sub_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "-");
+}
+
+void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "-");
+}
+
+void __ubsan_handle_mul_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "*");
+}
+
+void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "*");
+}
+
+void __ubsan_handle_negate_overflow(struct COverflowData *pData, unsigned long ulOldValue)
+{
+	HandleNegateOverflow(false, pData, ulOldValue);
+}
+
+void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData, unsigned long ulOldValue)
+{
+	HandleNegateOverflow(true, pData, ulOldValue);
+}
+
+void __ubsan_handle_divrem_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(false, pData, ulLHS, ulRHS, "divrem");
+}
+
+void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleOverflow(true, pData, ulLHS, ulRHS, "divrem");
+}
+
+void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer)
+{
+    HandleTypeMismatch(false, &pData->mLocation, pData->mType, __BIT(pData->mLogAlignment), pData->mTypeCheckKind, ulPointer);
+}
+
+void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer)
+{
+	HandleTypeMismatch(true, &pData->mLocation, pData->mType, __BIT(pData->mLogAlignment), pData->mTypeCheckKind, ulPointer);
+}
+
+void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData, unsigned long ulIndex)
+{
+	HandleOutOfBounds(false, pData, ulIndex);
+}
+
+void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData, unsigned long ulIndex)
+{
+	HandleOutOfBounds(true, pData, ulIndex);
+}
+
+void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleShiftOutOfBounds(false, pData, ulLHS, ulRHS);
+}
+
+void __ubsan_handle_shift_out_of_bounds_abort(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
+{
+	HandleShiftOutOfBounds(true, pData, ulLHS, ulRHS);
+}
+
+void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
+{
+	HandlePointerOverflow(false, pData, ulBase, ulResult);
+}
+
+void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
+{
+	HandlePointerOverflow(true, pData, ulBase, ulResult);
+}
+
+void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
+{
+	HandleAlignmentAssumption(false, pData, ulPointer, ulAlignment, ulOffset);
+}
+
+void __ubsan_handle_alignment_assumption_abort(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
+{
+	HandleAlignmentAssumption(true, pData, ulPointer, ulAlignment, ulOffset);
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
+void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData, unsigned long ulValue)
+{
+	HandleLoadInvalidValue(false, pData, ulValue);
+}
+
+void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData, unsigned long ulValue)
+{
+	HandleLoadInvalidValue(true, pData, ulValue);
+}
+
+void __ubsan_handle_missing_return(struct CUnreachableData *pData)
+{
+	HandleMissingReturn(true, pData);
+}
+
+void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData, unsigned long ulBound)
+{
+	HandleVlaBoundNotPositive(false, pData, ulBound);
+}
+
+void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData, unsigned long ulBound)
+{
+	HandleVlaBoundNotPositive(true, pData, ulBound);
+}
+
+void __ubsan_handle_function_type_mismatch(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
+{
+    HandleFunctionTypeMismatch(false, pData, ulFunction);
+}
+
+void __ubsan_handle_function_type_mismatch_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
+{
+    HandleFunctionTypeMismatch(true, pData, ulFunction);
+}
+#endif
\ No newline at end of file
diff --git a/lib/sbi/sbi_ubsan_test.c b/lib/sbi/sbi_ubsan_test.c
new file mode 100644
index 00000000..487790ef
--- /dev/null
+++ b/lib/sbi/sbi_ubsan_test.c
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2018 The NetBSD Foundation, Inc.
+ * All rights reserved.
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ * 
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+ * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
+ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifdef UBSAN_TESTS_ENABLED
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_console.h>
+
+void sbi_ubsan_test_suite(void)
+{
+    sbi_printf("\n[UBSan Test] Starting NetBSD-based test suite\n");
+
+    {
+        sbi_printf("\n[UBSan Test] Add Overflow Test\n");
+        volatile int a = 0x7FFFFFFF;
+        (void)a;
+        volatile int b = 1;
+        (void)b;
+        volatile int c = a + b;
+        (void)c;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Sub Overflow Test\n");
+        volatile int a = 0x80000000;
+        (void)a;
+        volatile int b = 1;
+        (void)b;
+        volatile int c = a - b;
+        (void)c;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Mul Overflow Test\n");
+        volatile int a = 0x7FFFFFFF;
+        (void)a;
+        volatile int b = 2;
+        (void)b;
+        volatile int c = a * b;
+        (void)c;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Div/Rem Overflow Test\n");
+        volatile int a = 10;
+        (void)a;
+        volatile int b = 0;
+        (void)b;
+        volatile int c = a / b;
+        (void)c;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Index Out of Bounds Test\n");
+        volatile int idx = 5;
+        (void)idx;
+        int arr[3] = {1, 2, 3};
+        volatile int val = arr[idx];
+        (void)val;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Shift Exponent Too Large Test\n");
+        volatile unsigned long val = 1;
+        (void)val;
+        volatile int shift = 64;
+        (void)shift;
+        volatile unsigned long res = val << shift;
+        (void)res;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Shift Exponent Negative Test\n");
+        volatile int val = 1;
+        (void)val;
+        volatile int shift = -1;
+        (void)shift;
+        volatile int res = val << shift;
+        (void)res;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Misaligned Access Test\n");
+        char buffer[16] __attribute__((aligned(16)));
+        volatile int *ptr = (int *)&buffer[1];
+        (void)ptr;
+        volatile int val = *ptr;
+        (void)val;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Null Dereference Test\n");
+        volatile int *ptr = NULL;
+        (void)ptr;
+        sbi_printf("\n[UBSan Test] Uncomment next two lines of code for testing Null dereference\n");
+
+        //volatile int val = *ptr;
+        //(void)val;
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Load Invalid Value Test\n");
+        volatile char bool_val = 5;
+        (void)bool_val;
+        volatile bool *b_ptr = (bool *)&bool_val;
+        (void)b_ptr;
+        if (*b_ptr) { (void)0; }
+    }
+
+    {
+        sbi_printf("\n[UBSan Test] Pointer Overflow Test\n");
+        volatile uintptr_t base = 0xFFFFFFFFFFFFFFFEUL;
+        (void)base;
+        volatile char *ptr = (char *)base;
+        (void)ptr;
+        volatile char *res = ptr + 5;
+        (void)res;
+    }
+
+    sbi_printf("\n[UBSan Test] All tests dispatched successfully.\n\n");
+}
+#endif
\ No newline at end of file
diff --git a/v2-0001-lib-sbi-add-UBSan-support.patch b/v2-0001-lib-sbi-add-UBSan-support.patch
new file mode 100644
index 00000000..d27729d0
--- /dev/null
+++ b/v2-0001-lib-sbi-add-UBSan-support.patch
@@ -0,0 +1,1145 @@
+From 8d4d6025f448bbbcc07117dbd12bdd6f95c16606 Mon Sep 17 00:00:00 2001
+From: Marcos Oduardo <marcos.oduardo@gmail.com>
+Date: Sun, 22 Feb 2026 23:00:45 +0100
+Subject: [PATCH v2] lib: sbi: add UBSan support
+
+UBSan (Undefined Behavior Sanitizer) is a tool implemented using
+compiler instrumentation at runtime that allows checking for statements
+whose output is not deterministic or defined by the C standard,
+incurring unexpected results in the execution of the program. Compiling
+and testing the OpenSBI firmware against UBSan will print a message in
+the console if any sentence performs any of these actions.
+
+Support for this implementation involves two main components:
+1.- The UBSan implementation hooks (derived from NetBSD), used by the
+    compiler to handle the check output.
+2.- A test suite to verify correct operation at runtime.
+
+Usage:
+
+Users may compile OpenSBI with the UBSan instrumentation adding the
+next flag to the make command:
+ENABLEUBSAN=y
+
+Users may compile OpenSBI with the UBSan tests adding the next flag to
+the make command:
+ENABLEUBSANTESTS=y
+
+Note that the implementation of UBSan in the compilation of OpenSBI
+adds a certain overhead caused by the checks performed at runtime;
+therefore, it is only expected to be used in development builds, never
+in production. If ENABLEUBSAN is not set, tests won't be compiled even
+if the ENABLEUBSANTESTS flag is enabled.
+
+Signed-off-by: Marcos Oduardo <marcos.oduardo@gmail.com>
+---
+Changes since v1:
+
+ - Based the UBSan implementation from NetBSD, fixing the incompatible
+   licenses problem.
+
+ Makefile                     |  14 +
+ include/sbi/sbi_ubsan_test.h |   8 +
+ lib/sbi/objects.mk           |   6 +
+ lib/sbi/sbi_init.c           |   6 +
+ lib/sbi/sbi_ubsan.c          | 849 +++++++++++++++++++++++++++++++++++
+ lib/sbi/sbi_ubsan_test.c     | 147 ++++++
+ 6 files changed, 1030 insertions(+)
+ create mode 100644 include/sbi/sbi_ubsan_test.h
+ create mode 100644 lib/sbi/sbi_ubsan.c
+ create mode 100644 lib/sbi/sbi_ubsan_test.c
+
+diff --git a/Makefile b/Makefile
+index 46541063..0689242b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -455,6 +455,20 @@ else
+ CFLAGS		+=	-O2
+ endif
+ 
++ifeq ($(ENABLEUBSAN),y)
++UBSAN_CC_FLAGS := -fsanitize=undefined
++UBSAN_CC_FLAGS += -DUBSAN_ENABLED
++ifeq ($(ENABLEUBSANTESTS),y)
++UBSAN_CC_FLAGS += -DUBSAN_TESTS_ENABLED
++endif
++UBSAN_CC_FLAGS += -fno-sanitize=vptr
++UBSAN_CC_FLAGS += -fno-sanitize=float-cast-overflow
++UBSAN_CC_FLAGS += -fno-sanitize=float-divide-by-zero
++UBSAN_CC_FLAGS += -fsanitize-recover=undefined
++UBSAN_CC_FLAGS += -fsanitize=pointer-overflow
++CFLAGS += $(UBSAN_CC_FLAGS)
++endif
++
+ ifeq ($(V), 1)
+ ELFFLAGS	+=	-Wl,--print-gc-sections
+ endif
+diff --git a/include/sbi/sbi_ubsan_test.h b/include/sbi/sbi_ubsan_test.h
+new file mode 100644
+index 00000000..13c6a562
+--- /dev/null
++++ b/include/sbi/sbi_ubsan_test.h
+@@ -0,0 +1,8 @@
++#ifdef UBSAN_TESTS_ENABLED
++#ifndef __SBI_UBSAN_TEST_H__
++#define __SBI_UBSAN_TEST_H__
++
++void sbi_ubsan_test_suite(void);
++
++#endif
++#endif
+\ No newline at end of file
+diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
+index 07d13229..b6f97120 100644
+--- a/lib/sbi/objects.mk
++++ b/lib/sbi/objects.mk
+@@ -99,6 +99,12 @@ libsbi-objs-y += sbi_tlb.o
+ libsbi-objs-y += sbi_trap.o
+ libsbi-objs-y += sbi_trap_ldst.o
+ libsbi-objs-y += sbi_trap_v_ldst.o
++ifeq ($(ENABLEUBSAN), y)
++libsbi-objs-y += sbi_ubsan.o
++ifeq ($(ENABLEUBSANTESTS), y)
++libsbi-objs-y += sbi_ubsan_test.o
++endif
++endif
+ libsbi-objs-y += sbi_unpriv.o
+ libsbi-objs-y += sbi_expected_trap.o
+ libsbi-objs-y += sbi_cppc.o
+diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
+index 5259064b..5155716c 100644
+--- a/lib/sbi/sbi_init.c
++++ b/lib/sbi/sbi_init.c
+@@ -35,6 +35,8 @@
+ #include <sbi/sbi_tlb.h>
+ #include <sbi/sbi_version.h>
+ #include <sbi/sbi_unit_test.h>
++#include <sbi/sbi_ubsan_test.h>
++
+ 
+ #define BANNER                                              \
+ 	"   ____                    _____ ____ _____\n"     \
+@@ -288,6 +290,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
+ 
+ 	sbi_double_trap_init(scratch);
+ 
++	#ifdef UBSAN_TESTS_ENABLED
++	sbi_ubsan_test_suite();
++	#endif
++
+ 	rc = sbi_irqchip_init(scratch, true);
+ 	if (rc) {
+ 		sbi_printf("%s: irqchip init failed (error %d)\n",
+diff --git a/lib/sbi/sbi_ubsan.c b/lib/sbi/sbi_ubsan.c
+new file mode 100644
+index 00000000..df3d1742
+--- /dev/null
++++ b/lib/sbi/sbi_ubsan.c
+@@ -0,0 +1,849 @@
++/* SPDX-License-Identifier: BSD-2-Clause
++ *
++ * Copyright (c) 2018 The NetBSD Foundation, Inc.
++ * All rights reserved.
++ *
++ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
++ * 
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
++ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++ * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
++ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifdef UBSAN_ENABLED
++
++#include <sbi/sbi_types.h>
++#include <sbi/sbi_console.h>
++
++/* Undefined Behavior specific defines and structures. Type descriptors defined by the compiler ABI */
++
++#define KIND_INTEGER	0
++#define KIND_FLOAT	1
++#define KIND_UNKNOWN	UINT16_MAX
++
++struct CSourceLocation {
++	char *mFilename;
++	uint32_t mLine;
++	uint32_t mColumn;
++};
++
++struct CTypeDescriptor {
++	uint16_t mTypeKind;
++	uint16_t mTypeInfo;
++	uint8_t mTypeName[1];
++};
++
++struct COverflowData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++};
++
++struct CUnreachableData {
++	struct CSourceLocation mLocation;
++};
++
++struct CCFICheckFailData {
++	uint8_t mCheckKind;
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++};
++
++struct CDynamicTypeCacheMissData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++	void *mTypeInfo;
++	uint8_t mTypeCheckKind;
++};
++
++struct CFunctionTypeMismatchData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++};
++
++struct CInvalidBuiltinData {
++	struct CSourceLocation mLocation;
++	uint8_t mKind;
++};
++
++struct CInvalidValueData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++};
++
++struct CNonNullArgData {
++	struct CSourceLocation mLocation;
++	struct CSourceLocation mAttributeLocation;
++	int mArgIndex;
++};
++
++struct CNonNullReturnData {
++	struct CSourceLocation mAttributeLocation;
++};
++
++struct COutOfBoundsData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mArrayType;
++	struct CTypeDescriptor *mIndexType;
++};
++
++struct CPointerOverflowData {
++	struct CSourceLocation mLocation;
++};
++
++struct CShiftOutOfBoundsData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mLHSType;
++	struct CTypeDescriptor *mRHSType;
++};
++
++struct CTypeMismatchData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++	unsigned long mLogAlignment;
++	uint8_t mTypeCheckKind;
++};
++
++struct CTypeMismatchData_v1 {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++	uint8_t mLogAlignment;
++	uint8_t mTypeCheckKind;
++};
++
++struct CVLABoundData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mType;
++};
++
++struct CFloatCastOverflowData {
++	struct CSourceLocation mLocation;	/* This field exists in this struct since 2015 August 11th */
++	struct CTypeDescriptor *mFromType;
++	struct CTypeDescriptor *mToType;
++};
++
++struct CImplicitConversionData {
++	struct CSourceLocation mLocation;
++	struct CTypeDescriptor *mFromType;
++	struct CTypeDescriptor *mToType;
++	uint8_t mKind;
++};
++
++struct CAlignmentAssumptionData {
++	struct CSourceLocation mLocation;
++	struct CSourceLocation mAssumptionLocation;
++	struct CTypeDescriptor *mType;
++};
++
++/* Public symbols used in the instrumentation of the code generation part */
++void __ubsan_handle_add_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_add_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
++void __ubsan_handle_alignment_assumption_abort(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
++void __ubsan_handle_builtin_unreachable(struct CUnreachableData *pData);
++void __ubsan_handle_divrem_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_function_type_mismatch(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
++void __ubsan_handle_function_type_mismatch_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
++void __ubsan_handle_function_type_mismatch_v1(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction, unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
++void __ubsan_handle_function_type_mismatch_v1_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction, unsigned long ulCalleeRTTI, unsigned long ulFnRTTI);
++void __ubsan_handle_invalid_builtin(struct CInvalidBuiltinData *pData);
++void __ubsan_handle_invalid_builtin_abort(struct CInvalidBuiltinData *pData);
++void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData, unsigned long ulVal);
++void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData, unsigned long ulVal);
++void __ubsan_handle_missing_return(struct CUnreachableData *pData);
++void __ubsan_handle_mul_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_negate_overflow(struct COverflowData *pData, unsigned long ulOldVal);
++void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData, unsigned long ulOldVal);
++void __ubsan_handle_nullability_arg(struct CNonNullArgData *pData);
++void __ubsan_handle_nullability_arg_abort(struct CNonNullArgData *pData);
++void __ubsan_handle_nullability_return_v1(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
++void __ubsan_handle_nullability_return_v1_abort(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
++void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData, unsigned long ulIndex);
++void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData, unsigned long ulIndex);
++void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
++void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
++void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_shift_out_of_bounds_abort(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_sub_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS);
++void __ubsan_handle_type_mismatch(struct CTypeMismatchData *pData, unsigned long ulPointer);
++void __ubsan_handle_type_mismatch_abort(struct CTypeMismatchData *pData, unsigned long ulPointer);
++void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer);
++void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer);
++void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData, unsigned long ulBound);
++void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData, unsigned long ulBound);
++void __ubsan_get_current_report_data(const char **ppOutIssueKind, const char **ppOutMessage, const char **ppOutFilename, uint32_t *pOutLine, uint32_t *pOutCol, char **ppOutMemoryAddr);
++
++#if 0
++Unimplemented:
++
++void __ubsan_handle_implicit_conversion(struct CImplicitConversionData *pData, unsigned long ulFrom, unsigned long ulTo);
++void __ubsan_handle_implicit_conversion_abort(struct CImplicitConversionData *pData, unsigned long ulFrom, unsigned long ulTo);
++void __ubsan_handle_nonnull_arg(struct CNonNullArgData *pData);
++void __ubsan_handle_nonnull_arg_abort(struct CNonNullArgData *pData);
++void __ubsan_handle_nonnull_return_v1(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
++void __ubsan_handle_nonnull_return_v1_abort(struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
++void __ubsan_handle_float_cast_overflow(struct CFloatCastOverflowData *pData, unsigned long ulFrom);
++void __ubsan_handle_float_cast_overflow_abort(struct CFloatCastOverflowData *pData, unsigned long ulFrom);
++void __ubsan_handle_dynamic_type_cache_miss(struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
++void __ubsan_handle_dynamic_type_cache_miss_abort(struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
++void __ubsan_handle_cfi_bad_type(struct CCFICheckFailData *pData, unsigned long ulVtable, bool bValidVtable, bool FromUnrecoverableHandler, unsigned long ProgramCounter, unsigned long FramePointer);
++void __ubsan_handle_cfi_check_fail(struct CCFICheckFailData *pData, unsigned long ulValue, unsigned long ulValidVtable);
++void __ubsan_handle_cfi_check_fail_abort(struct CCFICheckFailData *pData, unsigned long ulValue, unsigned long ulValidVtable);
++#endif
++
++static void HandleOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS, const char *szOperation);
++static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulOldValue);
++static void HandleBuiltinUnreachable(bool isFatal, struct CUnreachableData *pData);
++static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation, struct CTypeDescriptor *mType, unsigned long mLogAlignment, uint8_t mTypeCheckKind, unsigned long ulPointer);
++static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData, unsigned long ulBound);
++static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData, unsigned long ulIndex);
++static void HandleShiftOutOfBounds(bool isFatal, struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS);
++static void HandleLoadInvalidValue(bool isFatal, struct CInvalidValueData *pData, unsigned long ulValue);
++static void HandleInvalidBuiltin(bool isFatal, struct CInvalidBuiltinData *pData);
++static void HandleFunctionTypeMismatch(bool isFatal, struct CFunctionTypeMismatchData *pData, unsigned long ulFunction);
++static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData);
++static void HandlePointerOverflow(bool isFatal, struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult);
++static void HandleAlignmentAssumption(bool isFatal, struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset);
++
++#if 0
++Unimplemented:
++
++static void HandleCFIBadType(bool isFatal, struct CCFICheckFailData *pData, unsigned long ulVtable, bool *bValidVtable, bool *FromUnrecoverableHandler, unsigned long *ProgramCounter, unsigned long *FramePointer);
++static void HandleNonnullArg(bool isFatal, struct CNonNullArgData *pData);
++static void HandleNonnullReturn(bool isFatal, struct CNonNullReturnData *pData, struct CSourceLocation *pLocationPointer);
++static void HandleDynamicTypeCacheMiss(bool isFatal, struct CDynamicTypeCacheMissData *pData, unsigned long ulPointer, unsigned long ulHash);
++static void HandleFloatCastOverflow(bool isFatal, struct CFloatCastOverflowData *pData, unsigned long ulFrom);
++#endif
++
++
++#define NUMBER_SIGNED_BIT 1
++#define NUMBER_MAXLEN	128
++#define __arraycount(__a) (sizeof(__a) / sizeof(__a[0]))
++#define __BIT(__n) (1UL << (__n))
++#define SEPARATOR sbi_printf("===========================================\n")
++#define ACK_REPORTED (1U << 31)
++
++static bool isAlreadyReported(struct CSourceLocation *pLocation)
++{
++    uint32_t siOldValue;
++    volatile uint32_t *pLine;
++
++    if (!pLocation)
++        return false;
++
++    pLine = &pLocation->mLine;
++
++	do {
++        siOldValue = *pLine;
++    } while (__sync_val_compare_and_swap(pLine, siOldValue, siOldValue | ACK_REPORTED) != siOldValue);
++
++    return ((siOldValue) & (ACK_REPORTED));
++}
++
++static void HandleOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS, const char *szOperation)
++{
++    if(!pData)
++	{
++		return;
++	}
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);	
++
++    bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
++
++    sbi_printf("UBSan: %s integer overflow: ", is_signed ? "signed" : "unsigned");
++
++    if (is_signed){
++        sbi_printf("%ld %s %ld ",(long)ulLHS, szOperation, (long)ulRHS);
++    }
++    else{
++        sbi_printf("%lu %s %lu ", ulLHS, szOperation, ulRHS);
++    }
++
++    sbi_printf("cannot be represented in type %s\n", pData->mType->mTypeName);
++    
++	SEPARATOR;
++}
++
++static void HandleNegateOverflow(bool isFatal, struct COverflowData *pData, unsigned long ulOldValue)
++{
++    if(!pData)
++	{
++		return;
++	}
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++	
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++    
++    bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
++
++    sbi_printf("UBSan: Negation of ");
++
++    if (is_signed){
++        sbi_printf("%ld", (long)ulOldValue);
++    }
++    else{
++        sbi_printf("%lu", ulOldValue);
++    }
++
++    sbi_printf("cannot be represented in type %s\n", pData->mType->mTypeName);
++    
++	SEPARATOR;
++}
++
++static void HandleBuiltinUnreachable(bool isFatal, struct CUnreachableData *pData)
++{
++    if(!pData)
++	{
++		return;
++	}	
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++    
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++
++    SEPARATOR;
++}
++
++const char *rgczTypeCheckKinds[] = {
++    "load of",
++    "store to",
++    "reference binding to",
++    "member access within",
++    "member call on",
++    "constructor call on",
++    "downcast of",
++    "downcast of",
++    "upcast of",
++    "cast to virtual base of",
++    "_Nonnull binding to",
++    "dynamic operation on"
++};
++
++static void HandleTypeMismatch(bool isFatal, struct CSourceLocation *mLocation, struct CTypeDescriptor *mType, unsigned long mLogAlignment, uint8_t mTypeCheckKind, unsigned long ulPointer)
++{
++
++    if((!mLocation) || (!mType)) {
++		return;
++	}
++	
++	if (isAlreadyReported(mLocation))
++	{
++        return;
++	}
++
++	
++	SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            mLocation->mFilename, 
++            mLocation->mLine & ~ACK_REPORTED, 
++            mLocation->mColumn);
++    
++	const char *kind = (mTypeCheckKind < __arraycount(rgczTypeCheckKinds)) ? rgczTypeCheckKinds[mTypeCheckKind] : "access to";
++    
++    if (ulPointer == 0) {
++    	sbi_printf("%s null pointer of type %s\n", kind, mType->mTypeName);
++	}
++	else if ((mLogAlignment - 1) & ulPointer) { //mLogAlignment is converted on the wrapper function call
++		sbi_printf("%s misaligned address %p for type %s which requires %ld byte alignment\n", kind, (void *)ulPointer, mType->mTypeName, mLogAlignment); 
++	}
++	else {
++		sbi_printf("%s address %p with insufficient space for an object of type %s\n", kind, (void*)ulPointer, mType->mTypeName);
++	}
++	SEPARATOR;
++}
++
++static void HandleVlaBoundNotPositive(bool isFatal, struct CVLABoundData *pData, unsigned long ulBound)
++{
++    if(!pData)
++	{
++		return;
++	}	
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	sbi_printf("variable length array bound value ");
++
++	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
++
++    if (is_signed){
++        sbi_printf("%ld", (long)ulBound);
++    }
++    else{
++        sbi_printf("%lu", ulBound);
++    }
++
++	sbi_printf(" <= 0\n");
++	
++    SEPARATOR;
++}
++
++static void HandleOutOfBounds(bool isFatal, struct COutOfBoundsData *pData, unsigned long ulIndex)
++{
++    if(!pData)
++	{
++		return;
++	}	
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	bool is_signed = pData->mIndexType->mTypeInfo & NUMBER_SIGNED_BIT;
++
++    if (is_signed){
++        sbi_printf("index %ld", (long)ulIndex);
++    }
++    else{
++        sbi_printf("index %lu", ulIndex);
++    }
++	
++	sbi_printf(" is out of range for type %s\n", pData->mArrayType->mTypeName);
++
++	SEPARATOR;
++}
++
++static bool isNegativeNumber(struct CTypeDescriptor *pType, unsigned long ulVal)
++{
++    if (!(pType->mTypeInfo & NUMBER_SIGNED_BIT))
++	{
++        return false;
++	}
++    
++    return (long)ulVal < 0;
++}
++
++static size_t type_width(struct CTypeDescriptor *pType)
++{
++    return 1UL << (pType->mTypeInfo >> 1);
++}
++
++static void HandleShiftOutOfBounds(bool isFatal, struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++    if(!pData)
++	{
++		return;
++	}	
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	if (isNegativeNumber(pData->mRHSType, ulRHS)) {
++		sbi_printf("shift exponent %ld is negative\n", (long)ulRHS);	
++	}
++	else if (ulRHS >= type_width(pData->mLHSType)) {
++		sbi_printf("shift exponent %lu is too large for %lu-bit type %s\n", ulRHS, (unsigned long)type_width(pData->mLHSType), pData->mLHSType->mTypeName);	
++
++	}
++	else if (isNegativeNumber(pData->mLHSType, ulLHS)) {
++		sbi_printf("left shift of negative value %ld\n", (long)ulLHS);
++	}
++	else {
++		sbi_printf("left shift of %lu by %lu places cannot be represented in type %s\n", ulLHS, ulRHS, pData->mLHSType->mTypeName);
++	}
++
++	SEPARATOR;
++}
++
++static void HandleLoadInvalidValue(bool isFatal, struct CInvalidValueData *pData, unsigned long ulValue)
++{
++    if(!pData)
++	{
++		return;
++	}	
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	bool is_signed = pData->mType->mTypeInfo & NUMBER_SIGNED_BIT;
++
++    sbi_printf("load of value ");
++
++    if (is_signed){
++        sbi_printf("%ld ", (long)ulValue);
++    }
++    else{
++        sbi_printf("%lu ", ulValue);
++    }
++
++	sbi_printf("is not a valid value for type %s\n", pData->mType->mTypeName);
++
++	SEPARATOR;
++}
++
++const char *rgczBuiltinCheckKinds[] = {
++	"ctz()",
++	"clz()"
++};
++
++
++static void HandleInvalidBuiltin(bool isFatal, struct CInvalidBuiltinData *pData)
++{
++    if(!pData)
++	{
++		return;
++	}	
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	const char *builtin = (pData->mKind < __arraycount(rgczBuiltinCheckKinds)) ? rgczBuiltinCheckKinds[pData->mKind] : "unknown builtin";
++
++	sbi_printf("passing zero to %s, which is not a valid argument\n", builtin);
++	
++	SEPARATOR;
++}
++
++static void HandleFunctionTypeMismatch(bool isFatal, struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
++{
++    if(!pData)
++	{
++		return;
++	}
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++
++	
++	sbi_printf("call to function %#lx through pointer to incorrect function type %s\n", ulFunction, pData->mType->mTypeName);
++    
++	SEPARATOR;
++}
++
++static void HandleMissingReturn(bool isFatal, struct CUnreachableData *pData)
++{
++    if(!pData)
++	{
++		return;
++	}
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++
++	sbi_printf("execution reached the end of a value-returning function without returning a value\n");
++	
++	SEPARATOR;
++}
++
++static void HandlePointerOverflow(bool isFatal, struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
++{
++    if(!pData)
++	{
++		return;
++	}
++	
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++    SEPARATOR;
++
++  	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++
++	sbi_printf("pointer expression with base %#lx overflowed to %#lx\n", ulBase, ulResult);
++	
++	SEPARATOR;
++}
++
++static void HandleAlignmentAssumption(bool isFatal, struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
++{
++
++    if(!pData)
++	{
++		return;
++	}
++
++	if (isAlreadyReported(&pData->mLocation))
++	{
++        return;
++	}
++
++    SEPARATOR;
++
++	sbi_printf("UBSan: Undefined Behavior in %s:%u:%u\n",
++            pData->mLocation.mFilename, 
++            pData->mLocation.mLine & ~ACK_REPORTED, 
++            pData->mLocation.mColumn);
++	
++	unsigned long ulRealPointer = ulPointer - ulOffset;
++	sbi_printf("alignment assumption of %lu for pointer %p (offset %p)", ulAlignment, (void*) ulRealPointer, (void*) ulOffset);
++
++	if (pData->mAssumptionLocation.mFilename != NULL) {
++        sbi_printf(", assumption made in %s:%u:%u",
++            pData->mAssumptionLocation.mFilename,
++            pData->mAssumptionLocation.mLine,
++            pData->mAssumptionLocation.mColumn);
++    }
++
++	sbi_printf("\n");
++
++	SEPARATOR;
++}
++
++/* Definions of public symbols emitted by the instrumentation code */
++void __ubsan_handle_add_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(false, pData, ulLHS, ulRHS, "+");
++}
++
++void __ubsan_handle_add_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(true, pData, ulLHS, ulRHS, "+");
++}
++
++void __ubsan_handle_sub_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(false, pData, ulLHS, ulRHS, "-");
++}
++
++void __ubsan_handle_sub_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(true, pData, ulLHS, ulRHS, "-");
++}
++
++void __ubsan_handle_mul_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(false, pData, ulLHS, ulRHS, "*");
++}
++
++void __ubsan_handle_mul_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(true, pData, ulLHS, ulRHS, "*");
++}
++
++void __ubsan_handle_negate_overflow(struct COverflowData *pData, unsigned long ulOldValue)
++{
++	HandleNegateOverflow(false, pData, ulOldValue);
++}
++
++void __ubsan_handle_negate_overflow_abort(struct COverflowData *pData, unsigned long ulOldValue)
++{
++	HandleNegateOverflow(true, pData, ulOldValue);
++}
++
++void __ubsan_handle_divrem_overflow(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(false, pData, ulLHS, ulRHS, "divrem");
++}
++
++void __ubsan_handle_divrem_overflow_abort(struct COverflowData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleOverflow(true, pData, ulLHS, ulRHS, "divrem");
++}
++
++void __ubsan_handle_type_mismatch_v1(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer)
++{
++    HandleTypeMismatch(false, &pData->mLocation, pData->mType, __BIT(pData->mLogAlignment), pData->mTypeCheckKind, ulPointer);
++}
++
++void __ubsan_handle_type_mismatch_v1_abort(struct CTypeMismatchData_v1 *pData, unsigned long ulPointer)
++{
++	HandleTypeMismatch(true, &pData->mLocation, pData->mType, __BIT(pData->mLogAlignment), pData->mTypeCheckKind, ulPointer);
++}
++
++void __ubsan_handle_out_of_bounds(struct COutOfBoundsData *pData, unsigned long ulIndex)
++{
++	HandleOutOfBounds(false, pData, ulIndex);
++}
++
++void __ubsan_handle_out_of_bounds_abort(struct COutOfBoundsData *pData, unsigned long ulIndex)
++{
++	HandleOutOfBounds(true, pData, ulIndex);
++}
++
++void __ubsan_handle_shift_out_of_bounds(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleShiftOutOfBounds(false, pData, ulLHS, ulRHS);
++}
++
++void __ubsan_handle_shift_out_of_bounds_abort(struct CShiftOutOfBoundsData *pData, unsigned long ulLHS, unsigned long ulRHS)
++{
++	HandleShiftOutOfBounds(true, pData, ulLHS, ulRHS);
++}
++
++void __ubsan_handle_pointer_overflow(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
++{
++	HandlePointerOverflow(false, pData, ulBase, ulResult);
++}
++
++void __ubsan_handle_pointer_overflow_abort(struct CPointerOverflowData *pData, unsigned long ulBase, unsigned long ulResult)
++{
++	HandlePointerOverflow(true, pData, ulBase, ulResult);
++}
++
++void __ubsan_handle_alignment_assumption(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
++{
++	HandleAlignmentAssumption(false, pData, ulPointer, ulAlignment, ulOffset);
++}
++
++void __ubsan_handle_alignment_assumption_abort(struct CAlignmentAssumptionData *pData, unsigned long ulPointer, unsigned long ulAlignment, unsigned long ulOffset)
++{
++	HandleAlignmentAssumption(true, pData, ulPointer, ulAlignment, ulOffset);
++}
++
++void __ubsan_handle_builtin_unreachable(struct CUnreachableData *pData)
++{
++	HandleBuiltinUnreachable(true, pData);
++}
++
++void __ubsan_handle_invalid_builtin(struct CInvalidBuiltinData *pData)
++{
++	HandleInvalidBuiltin(true, pData);
++}
++
++void __ubsan_handle_invalid_builtin_abort(struct CInvalidBuiltinData *pData)
++{
++	HandleInvalidBuiltin(true, pData);
++}
++
++void __ubsan_handle_load_invalid_value(struct CInvalidValueData *pData, unsigned long ulValue)
++{
++	HandleLoadInvalidValue(false, pData, ulValue);
++}
++
++void __ubsan_handle_load_invalid_value_abort(struct CInvalidValueData *pData, unsigned long ulValue)
++{
++	HandleLoadInvalidValue(true, pData, ulValue);
++}
++
++void __ubsan_handle_missing_return(struct CUnreachableData *pData)
++{
++	HandleMissingReturn(true, pData);
++}
++
++void __ubsan_handle_vla_bound_not_positive(struct CVLABoundData *pData, unsigned long ulBound)
++{
++	HandleVlaBoundNotPositive(false, pData, ulBound);
++}
++
++void __ubsan_handle_vla_bound_not_positive_abort(struct CVLABoundData *pData, unsigned long ulBound)
++{
++	HandleVlaBoundNotPositive(true, pData, ulBound);
++}
++
++void __ubsan_handle_function_type_mismatch(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
++{
++    HandleFunctionTypeMismatch(false, pData, ulFunction);
++}
++
++void __ubsan_handle_function_type_mismatch_abort(struct CFunctionTypeMismatchData *pData, unsigned long ulFunction)
++{
++    HandleFunctionTypeMismatch(true, pData, ulFunction);
++}
++#endif
+\ No newline at end of file
+diff --git a/lib/sbi/sbi_ubsan_test.c b/lib/sbi/sbi_ubsan_test.c
+new file mode 100644
+index 00000000..487790ef
+--- /dev/null
++++ b/lib/sbi/sbi_ubsan_test.c
+@@ -0,0 +1,147 @@
++/* SPDX-License-Identifier: BSD-2-Clause
++ *
++ * Copyright (c) 2018 The NetBSD Foundation, Inc.
++ * All rights reserved.
++ *
++ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
++ * 
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
++ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
++ * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
++ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
++ * POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifdef UBSAN_TESTS_ENABLED
++#include <sbi/sbi_types.h>
++#include <sbi/sbi_console.h>
++
++void sbi_ubsan_test_suite(void)
++{
++    sbi_printf("\n[UBSan Test] Starting NetBSD-based test suite\n");
++
++    {
++        sbi_printf("\n[UBSan Test] Add Overflow Test\n");
++        volatile int a = 0x7FFFFFFF;
++        (void)a;
++        volatile int b = 1;
++        (void)b;
++        volatile int c = a + b;
++        (void)c;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Sub Overflow Test\n");
++        volatile int a = 0x80000000;
++        (void)a;
++        volatile int b = 1;
++        (void)b;
++        volatile int c = a - b;
++        (void)c;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Mul Overflow Test\n");
++        volatile int a = 0x7FFFFFFF;
++        (void)a;
++        volatile int b = 2;
++        (void)b;
++        volatile int c = a * b;
++        (void)c;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Div/Rem Overflow Test\n");
++        volatile int a = 10;
++        (void)a;
++        volatile int b = 0;
++        (void)b;
++        volatile int c = a / b;
++        (void)c;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Index Out of Bounds Test\n");
++        volatile int idx = 5;
++        (void)idx;
++        int arr[3] = {1, 2, 3};
++        volatile int val = arr[idx];
++        (void)val;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Shift Exponent Too Large Test\n");
++        volatile unsigned long val = 1;
++        (void)val;
++        volatile int shift = 64;
++        (void)shift;
++        volatile unsigned long res = val << shift;
++        (void)res;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Shift Exponent Negative Test\n");
++        volatile int val = 1;
++        (void)val;
++        volatile int shift = -1;
++        (void)shift;
++        volatile int res = val << shift;
++        (void)res;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Misaligned Access Test\n");
++        char buffer[16] __attribute__((aligned(16)));
++        volatile int *ptr = (int *)&buffer[1];
++        (void)ptr;
++        volatile int val = *ptr;
++        (void)val;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Null Dereference Test\n");
++        volatile int *ptr = NULL;
++        (void)ptr;
++        sbi_printf("\n[UBSan Test] Uncomment next two lines of code for testing Null dereference\n");
++
++        //volatile int val = *ptr;
++        //(void)val;
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Load Invalid Value Test\n");
++        volatile char bool_val = 5;
++        (void)bool_val;
++        volatile bool *b_ptr = (bool *)&bool_val;
++        (void)b_ptr;
++        if (*b_ptr) { (void)0; }
++    }
++
++    {
++        sbi_printf("\n[UBSan Test] Pointer Overflow Test\n");
++        volatile uintptr_t base = 0xFFFFFFFFFFFFFFFEUL;
++        (void)base;
++        volatile char *ptr = (char *)base;
++        (void)ptr;
++        volatile char *res = ptr + 5;
++        (void)res;
++    }
++
++    sbi_printf("\n[UBSan Test] All tests dispatched successfully.\n\n");
++}
++#endif
+\ No newline at end of file
+-- 
+2.53.0
+
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
