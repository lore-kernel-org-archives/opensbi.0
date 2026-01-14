Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA8BD39008
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y5HAR4dAbdD7E4qgpaZKtNWh/9nRi12BsadmggP8rPs=; b=TdF4bsV/TYtJwu
	wQolCiMIysg1TzE+OuUIsnGucTGZMw+iA0yTiKYDqZ/n7IRNqoi9bMwYHSjKhdaVg05g5Rc/Czkb8
	ltWSOfNTUlpWFVzSls2Dz2PE0+82wUvdJJQlk3H1jCKGp71yMqoxeb3B7HZdGyOeLZAudzsqz46gq
	7z9TAG37TVhRZDextXugpuQGvWYvZmTmTZZZ50KiWb93FiYX0amuYBJ2CoGc9eyFU9UVjWmB0cqEv
	JuvEIDQ8qtiIA++MKRFuMcbVZUDBCM4WqIcMsBxUGd15gvgD2sVgD+H5P2xq8cAzTRMVo4p+8BjZ3
	71NjqN7anMVcbJsk7Jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5q2-0000000AMTs-3Pus;
	Wed, 14 Jan 2026 18:43:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg5q0-0000000AMTE-2xSK
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 18:43:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so752435e9.0
        for <opensbi@lists.infradead.org>; Wed, 14 Jan 2026 10:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416202; x=1769021002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdeOahvcXvInu0SrbBlFTlOZySQROD2ZS2X3DCzBDpc=;
        b=H8H74jfmpPah5uR9BAr2vrF761DrKgnPng5Oqwrv73030vsgiiwtga+3sMCg3JdXbT
         XdOnVigk3F1V+MXToXxlv8pY10CEeeGv0/Ch2xpViiZgGWwbKATctfeph7w8EtSUZ5v7
         /9I2rtzKd2r1mNS8UC6e8xsLHliBkEkt8rvTCpqx8yPcfuDEmsc2fzlBfOf/2VupAlsF
         z0YtSx9kFg05DcKLDwPJDYIN/pa6w1PNo7PgFQxWQQsCRGp6sqM3YKiUBpJb5OMSWCDc
         tV6HFsfyGhjbfo2jru5XuweEuVlQNNZ64/FU19gWVtrm33PJHDVHMZI2SQfhQmJmMtKf
         j85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416202; x=1769021002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdeOahvcXvInu0SrbBlFTlOZySQROD2ZS2X3DCzBDpc=;
        b=ey6n4kGq9K32y0p/mUaIZnpknsutl9KEuaM5IiwCxsobONTRmxHNIH5dq6QVNnpSL7
         6N9+61Ajvg64cVC/iIbEkAqtrT6gTm1iA+bX0KCLDrH21C+l9OVkPGRenrFdSXbu/Ob1
         qaaymi1TEgTwTAtybYwa3INWl231b+o4G8zjf8z3dZIDNHXVlEhtrhF2R02Tk0GScJBm
         E9eq4eu49TylNHUxxaYvRmo/7afN1OzPM8DAhLtikVaD6AS4RQGoDi+cqgyn53Pqa/fa
         +e2ydflDqYh8pEHDht4Mj9dr5dN+XMfXVBwAkf+uuvbhqOQQdkTruol/wWPeGyslVGLf
         TzIw==
X-Gm-Message-State: AOJu0YyAjUQLRhouD1DgLowF2gKHfQdhH38mrkURSA2CUhuKFIViZCzM
	Roxp/yZOOLBiPv3g6Pn8ponTT+PRtGLqiaz83EqHPP7Kw9o/q4sPEtcEfQt4lQ==
X-Gm-Gg: AY/fxX7hdpGJPuy9vd0zTllevooQtlHdUgBmIx7LnWGxKrJNC4xvvhguT2XSuOuQGvj
	Blje/HcEjTNVg/GNR5/IpA0SkeEkddltkku2xxFpEfEmWr6/eKJrm5gJ5rVOasMykC5O8wf9++I
	Umkf9wGSfX9kjrK5gZVnV6+mPxdtzeQPPS9XxKMufSSpFg+CxEy/tDaJpWeJvRi/BQ6YQTpFfDv
	gxGj1ZEZCZBjcHbWl7rAE1P1AK2HRPa3r8qHjvmiO2ZOH2oQ8b/ryFOT8VypJv7moPbe4C76M7e
	YZDoAEhC2lAOCrlBc2SNvgZD3IP9EYEK6QkkkxkVjFfYgQ54ibqpeSWqq9JzFYMkaX1VKNYHywy
	TeI83ZxgzyPEEz2CgR/PGQrcgI+eGyCONykGxcG5WrBWscWA2tdhDwQebgOpt/Ger1xClSFy9mK
	OieXeZ7GH6hPJqlu5Mtv4EP7v2lLz5NIvRXro2DQl3NoH7mC3S4unXy06IwbrFz8LBWD5KPNg94
	ecINBGa1qV9UfmpfnxVg6JpOolq5c9JRrPKr8Uk1XCrRnrIRDx5Vy9X
X-Received: by 2002:a05:600c:1988:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47f4289b6cbmr6117985e9.1.1768416202011;
        Wed, 14 Jan 2026 10:43:22 -0800 (PST)
Received: from LT-1H84393QVK.localdomain ([79.116.216.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428b954esm5326965e9.7.2026.01.14.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:43:20 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos.oduardo@gmail.com
Subject: [PATCH] lib: sbi: KASan implementation for OpenSBI
Date: Wed, 14 Jan 2026 19:43:16 +0100
Message-ID: <20260114184316.45312-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_104324_997683_F8CBDAD4 
X-CRM114-Status: GOOD (  26.74  )
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

KASan (Kernel Address Sanitizer) is a tool implemented using compiler
instrumentation at runtime that allows checking for memory management
bugs such as heap OOB access, stack overflow or global OOB write.
Compiling and testing the OpenSBI firmware against KASan will print a
message in the console highlighting the memory access that caused the
bug and its address.

Support for this implementation involves two main components:
1. The KASan implementation hooks: Custom malloc, memset, memcpy to
   check for bugs and the handlers when finding a bug.
2. A test suite to verify correct operation at runtime.

KASan needs to keep a copy of the sanitized memory region. This copy is
named shadowmap, and each byte of this map corresponds to 8 bytes of
real memory. KASan keeps a record of the state of each address and
checks each memory access performed by OpenSBI.

In addition, this patch increases FW_PAYLOAD_OFFSET to accommodate the
memory overhead when both KASan and UBSan are enabled simultaneously,
ensuring that the OpenSBI binary fits within the limits.

Users may compile OpenSBI with the KASan instrumentation by adding the
flag ENABLEKASAN=y to the make command. To compile with the tests, add
the flag ENABLEKASANTESTS=y.

Note that the implementation of KASan adds a certain overhead caused by
the checks performed at runtime and the shadowmap loaded in memory;
therefore, it is only expected to be used in development builds, never
in production. If ENABLEKASAN is not set, tests won't be compiled even
if the ENABLEKASANTESTS flag is enabled.

Signed-off-by: Marcos Oduardo <marcos.oduardo@gmail.com>
---
 Makefile                     |  32 ++++
 firmware/fw_base.S           |   4 +-
 firmware/fw_base.ldS         |   9 +-
 include/sbi/sbi_heap.h       |  22 ++-
 include/sbi/sbi_kasan.h      |  35 ++++
 include/sbi/sbi_kasan_test.h |  24 +++
 include/sbi/sbi_string.h     |  13 +-
 include/sbi/sbi_types.h      |   1 +
 lib/sbi/objects.mk           |   3 +
 lib/sbi/sbi_heap.c           |   5 +-
 lib/sbi/sbi_init.c           |  19 ++
 lib/sbi/sbi_kasan.c          | 343 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_kasan_test.c     |  60 ++++++
 lib/sbi/sbi_string.c         |  55 +++++-
 platform/generic/objects.mk  |   5 +-
 15 files changed, 616 insertions(+), 14 deletions(-)
 create mode 100644 include/sbi/sbi_kasan.h
 create mode 100644 include/sbi/sbi_kasan_test.h
 create mode 100644 lib/sbi/sbi_kasan.c
 create mode 100644 lib/sbi/sbi_kasan_test.c

diff --git a/Makefile b/Makefile
index 46541063..0faa8141 100644
--- a/Makefile
+++ b/Makefile
@@ -19,6 +19,13 @@ else
 READLINK ?= readlink
 endif
 
+TARGET_DRAM_START := 0x80000000
+TARGET_DRAM_END := 0x8fffffff
+
+KASAN_SHADOW_MAPPING_OFFSET := 0xD7000000
+KASAN_SHADOW_MEMORY_START := 0xE7000000
+KASAN_SHADOW_MEMORY_SIZE := 0x2000000
+
 # Find out source, build, and install directories
 src_dir=$(CURDIR)
 ifdef O
@@ -400,6 +407,31 @@ CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	-fPIE -pie
 CFLAGS		+=	$(firmware-cflags-y)
 
+
+#KASAN Cflags
+ifeq ($(ENABLEKASAN),y) 
+CFLAGS += -DTARGET_ARCH_$(ARCH)
+CFLAGS += -DKASAN_SHADOW_MAPPING_OFFSET=$(KASAN_SHADOW_MAPPING_OFFSET)
+CFLAGS += -DKASAN_SHADOW_MEMORY_START=$(KASAN_SHADOW_MEMORY_START)
+CFLAGS += -DKASAN_SHADOW_MEMORY_SIZE=$(KASAN_SHADOW_MEMORY_SIZE)
+CFLAGS += -DTARGET_DRAM_START=$(TARGET_DRAM_START)
+CFLAGS += -DTARGET_DRAM_END=$(TARGET_DRAM_END)
+# KASan-specific compiler options
+KASAN_SANITIZE_STACK := 1
+KASAN_SANITIZE_GLOBALS := 1
+KASAN_CC_FLAGS += -fsanitize=kernel-address
+KASAN_CC_FLAGS += -mllvm -asan-mapping-offset=$(KASAN_SHADOW_MAPPING_OFFSET)
+KASAN_CC_FLAGS += -mllvm -asan-instrumentation-with-call-threshold=0
+KASAN_CC_FLAGS += -mllvm -asan-stack=$(KASAN_SANITIZE_STACK)
+KASAN_CC_FLAGS += -mllvm -asan-globals=$(KASAN_SANITIZE_GLOBALS)
+KASAN_CC_FLAGS += -fno-sanitize-address-use-after-scope #unimplemented handler
+KASAN_CC_FLAGS += -DKASAN_ENABLED
+ifeq ($(ENABLEKASANTESTS),y) 
+KASAN_CC_FLAGS += -DKASAN_TESTS_ENABLED
+endif
+CFLAGS += $(KASAN_CC_FLAGS)
+endif
+
 CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
 CPPFLAGS	+=	$(firmware-cppflags-y)
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index bce9e226..806e1465 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -437,14 +437,14 @@ fw_platform_init:
 	/* Map implicit memcpy() added by compiler to sbi_memcpy() */
 	.section .text
 	.align 3
-	.globl memcpy
+	.weak memcpy
 memcpy:
 	tail	sbi_memcpy
 
 	/* Map implicit memset() added by compiler to sbi_memset() */
 	.section .text
 	.align 3
-	.globl memset
+	.weak memset
 memset:
 	tail	sbi_memset
 
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 12c7a844..d9e1cf95 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -39,6 +39,13 @@
 		. = ALIGN(8);
 	}
 
+	.init_array :  /* Needed for KASAn write to globals test */
+	{
+    __global_ctors_start = .;
+    *(.init_array*)
+    __global_ctors_end = .;
+ 	}
+
 	.dynsym :
 	{
 		*(.dynsym)
@@ -61,7 +68,7 @@
 	 * regions, so ensure that the split is power-of-2.
 	 */
 	. = ALIGN(1 << LOG2CEIL((SIZEOF(.rodata) + SIZEOF(.text)
-				+ SIZEOF(.dynsym) + SIZEOF(.rela.dyn))));
+				+ SIZEOF(.dynsym) + SIZEOF(.rela.dyn) + SIZEOF(.init_array))));
 
 	PROVIDE(_fw_rw_start = .);
 
diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
index a4b3f0c6..316c4a00 100644
--- a/include/sbi/sbi_heap.h
+++ b/include/sbi/sbi_heap.h
@@ -11,6 +11,9 @@
 #define __SBI_HEAP_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_kasan.h>
+#include <sbi/sbi_list.h>
+#include <sbi/riscv_locks.h>
 
 /* Opaque declaration of heap control struct */
 struct sbi_heap_control;
@@ -26,11 +29,26 @@ struct sbi_scratch;
 /** Allocate from heap area */
 void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size);
 
-static inline void *sbi_malloc(size_t size)
-{
+#ifdef KASAN_ENABLED 
+
+static inline void *sbi_malloc(size_t size){
+	return kasan_malloc_hook(&global_hpctrl, size); 
+}
+
+static inline void *zalloc_from (struct sbi_heap_control *hpctrl, size_t size){ //function needed for KASAn integration in compile options
+	return kasan_malloc_hook(&global_hpctrl, size);
+}
+#else 
+
+static inline void *zalloc_from (struct sbi_heap_control *hpctrl, size_t size){
 	return sbi_malloc_from(&global_hpctrl, size);
 }
 
+static inline void *sbi_malloc(size_t size){
+       return sbi_malloc_from(&global_hpctrl, size);
+}
+#endif
+
 /** Allocate aligned from heap area */
 void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
 			     size_t alignment,size_t size);
diff --git a/include/sbi/sbi_kasan.h b/include/sbi/sbi_kasan.h
new file mode 100644
index 00000000..2a3c027a
--- /dev/null
+++ b/include/sbi/sbi_kasan.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2024 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __SBI_KASAN_H__
+#define __SBI_KASAN_H__
+
+#include <sbi/sbi_list.h>
+#include <sbi/riscv_locks.h>
+
+struct heap_node;
+struct sbi_heap_control;
+
+
+
+void initialize_kasan(void);
+void * __kasan_memcpy(void *dst, const void *src, size_t size,
+                     unsigned long pc);
+void * __kasan_memset(void *buf, int c, size_t size, unsigned long pc);
+void *kasan_malloc_hook(struct sbi_heap_control *hpctrl, size_t size); 
+void kasan_free_hook(struct sbi_heap_control *hpctrl, void *ptr);
+extern char __global_ctors_start;
+extern char __global_ctors_end;
+
+void call_global_ctors(void);
+#endif
diff --git a/include/sbi/sbi_kasan_test.h b/include/sbi/sbi_kasan_test.h
new file mode 100644
index 00000000..e58c7d26
--- /dev/null
+++ b/include/sbi/sbi_kasan_test.h
@@ -0,0 +1,24 @@
+#ifndef __SBI_KASAN_TEST_H__
+#define __SBI_KASAN_TEST_H__
+
+#ifdef KASAN_TESTS_ENABLED
+
+#include <sbi/sbi_kasan.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_heap.h>
+
+typedef void (*global_ctor)(void);
+
+// These symbols are defined in the linker script.
+extern char __global_ctors_start;
+extern char __global_ctors_end;
+
+void call_global_ctors(void);
+void test_heap_overflow(void);
+void test_stack_overflow(void);
+void test_globals_overflow(void);
+void test_memset_overflow(void);
+void test_memcpy_overflow(void);
+#endif
+#endif
\ No newline at end of file
diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
index b7c2bc22..94a70dc7 100644
--- a/include/sbi/sbi_string.h
+++ b/include/sbi/sbi_string.h
@@ -10,6 +10,7 @@
 #ifndef __STRING_H__
 #define __STRING_H__
 
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_types.h>
 
 /*
@@ -27,16 +28,20 @@ size_t sbi_strnlen(const char *str, size_t count);
 
 char *sbi_strcpy(char *dest, const char *src);
 
+void *sbi_memset(void *s, int c, size_t count);
+
+void *sbi_memcpy(void *dest, const void *src, size_t count);
+
+void *_real_sbi_memset(void *s, int c, size_t count);
+
+void *_real_sbi_memcpy(void *dest, const void *src, size_t count);
+
 char *sbi_strncpy(char *dest, const char *src, size_t count);
 
 char *sbi_strchr(const char *s, int c);
 
 char *sbi_strrchr(const char *s, int c);
 
-void *sbi_memset(void *s, int c, size_t count);
-
-void *sbi_memcpy(void *dest, const void *src, size_t count);
-
 void *sbi_memmove(void *dest, const void *src, size_t count);
 
 int sbi_memcmp(const void *s1, const void *s2, size_t count);
diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index b8a7e6cb..b4488ed5 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -14,6 +14,7 @@
 
 /* clang-format off */
 
+typedef int 			int8_t;
 typedef signed char		s8;
 typedef unsigned char		u8;
 typedef unsigned char		uint8_t;
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..a03dde2e 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+
+libsbi-objs-y += sbi_kasan.o
+libsbi-objs-y += sbi_kasan_test.o
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 1de6dc1e..4ddb54eb 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -137,11 +137,13 @@ out:
 	return ret;
 }
 
+__attribute__((no_sanitize("address")))
 void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size)
 {
 	return alloc_with_align(hpctrl, HEAP_ALLOC_ALIGN, size);
 }
 
+__attribute__((no_sanitize("address")))
 void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
 			     size_t alignment, size_t size)
 {
@@ -159,9 +161,10 @@ void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
 	return alloc_with_align(hpctrl, alignment, size);
 }
 
+__attribute__((no_sanitize("address")))
 void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size)
 {
-	void *ret = sbi_malloc_from(hpctrl, size);
+	void *ret = zalloc_from(hpctrl, size); //function needed for KASAn integration in compile options
 
 	if (ret)
 		sbi_memset(ret, 0, size);
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..681cfa48 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,10 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_kasan.h>
+#include <sbi/sbi_kasan_test.h>
+
+
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -231,6 +235,11 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	rc = sbi_scratch_init(scratch);
 	if (rc)
 		sbi_hart_hang();
+	
+	#ifdef KASAN_ENABLED
+	call_global_ctors();
+    initialize_kasan();
+	#endif
 
 	/* Note: This has to be second thing in coldboot init sequence */
 	rc = sbi_heap_init(scratch);
@@ -288,6 +297,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_double_trap_init(scratch);
 
+	#ifdef KASAN_TESTS_ENABLED
+
+	test_heap_overflow();
+	test_stack_overflow();
+	test_globals_overflow();
+	test_memset_overflow();
+	test_memcpy_overflow();
+
+	#endif
+
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
diff --git a/lib/sbi/sbi_kasan.c b/lib/sbi/sbi_kasan.c
new file mode 100644
index 00000000..cbdc5eaa
--- /dev/null
+++ b/lib/sbi/sbi_kasan.c
@@ -0,0 +1,343 @@
+/*
+ * Copyright 2024 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+
+#ifdef KASAN_ENABLED
+
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_string.h>
+
+#define CALLER_PC ((unsigned long)__builtin_return_address(0))
+
+#define KASAN_SHADOW_SHIFT 3 
+#define KASAN_SHADOW_GRANULE_SIZE (1UL << KASAN_SHADOW_SHIFT) //8
+#define KASAN_SHADOW_MASK (KASAN_SHADOW_GRANULE_SIZE - 1)
+
+#define ASAN_SHADOW_UNPOISONED_MAGIC 0x00
+#define ASAN_SHADOW_RESERVED_MAGIC 0xff
+#define ASAN_SHADOW_GLOBAL_REDZONE_MAGIC 0xf9
+#define ASAN_SHADOW_HEAP_HEAD_REDZONE_MAGIC 0xfa
+#define ASAN_SHADOW_HEAP_TAIL_REDZONE_MAGIC 0xfb
+#define ASAN_SHADOW_HEAP_FREE_MAGIC 0xfd
+
+#define KASAN_HEAP_HEAD_REDZONE_SIZE 0x20 
+#define KASAN_HEAP_TAIL_REDZONE_SIZE 0x20 
+
+#define KASAN_MEM_TO_SHADOW(addr) \
+  (((addr) >> KASAN_SHADOW_SHIFT) + KASAN_SHADOW_MAPPING_OFFSET)
+#define KASAN_SHADOW_TO_MEM(shadow) \
+  (((shadow) - KASAN_SHADOW_MAPPING_OFFSET) << KASAN_SHADOW_SHIFT)
+
+__attribute__((no_sanitize("address")))
+void kasan_bug_report(unsigned long addr, size_t size,
+                      unsigned long buggy_shadow_address, uint8_t is_write,
+                      unsigned long ip);
+
+__attribute__((no_sanitize("address")))
+static inline unsigned long get_poisoned_shadow_address(unsigned long addr,
+                                                        size_t size) {
+  unsigned long addr_shadow_start = KASAN_MEM_TO_SHADOW(addr);
+  unsigned long addr_shadow_end = KASAN_MEM_TO_SHADOW(addr + size - 1) + 1;
+  unsigned long non_zero_shadow_addr = 0;
+
+  for (unsigned long i = 0; i < addr_shadow_end - addr_shadow_start; i++) {
+    if (*(uint8_t *)(addr_shadow_start + i) != 0) {
+      non_zero_shadow_addr = addr_shadow_start + i;
+      break;
+    }
+  }
+
+  if (non_zero_shadow_addr) {
+    unsigned long last_byte = addr + size - 1;
+    s8 *last_shadow_byte = (s8 *)KASAN_MEM_TO_SHADOW(last_byte);
+
+    /* Non-zero bytes in shadow memory may indicate either:
+    *  1) invalid memory access (0xff, 0xfa, ...)
+    *  2) access to a 8-byte region which isn't entirely accessible, i.e. only
+    *     n bytes can be read/written in the 8-byte region, where n < 8
+    *     (in this case shadow byte encodes how much bytes in an 8-byte region
+    *     are accessible).
+    * Thus, if there is a non-zero shadow byte we need to check if it
+    * corresponds to the last byte in the checked region:
+    *   not last - OOB memory access
+    *   last - check if we don't access beyond what's encoded in the shadow byte.
+    */         
+    if (non_zero_shadow_addr != (unsigned long)last_shadow_byte || ((s8)(last_byte & KASAN_SHADOW_MASK) >= *last_shadow_byte))
+     { 
+      return non_zero_shadow_addr;
+     }
+  }
+
+  return 0;
+}
+
+// Both `address` and `size` must be 8-byte aligned.
+__attribute__((no_sanitize("address")))
+static void poison_shadow(unsigned long address, size_t size, uint8_t value) {
+  unsigned long shadow_start, shadow_end;
+  size_t shadow_length = 0;
+
+  shadow_start = KASAN_MEM_TO_SHADOW(address);
+  shadow_end = KASAN_MEM_TO_SHADOW(address + size - 1) + 1;
+  shadow_length = shadow_end - shadow_start;
+
+  sbi_memset((void *)shadow_start, value, shadow_length);
+}
+
+// `address` must be 8-byte aligned
+__attribute__((no_sanitize("address")))
+static void unpoison_shadow(unsigned long address, size_t size) {
+  poison_shadow(address, size & (~KASAN_SHADOW_MASK),
+                ASAN_SHADOW_UNPOISONED_MAGIC);
+
+  if (size & KASAN_SHADOW_MASK) {
+    uint8_t *shadow = (uint8_t *)KASAN_MEM_TO_SHADOW(address + size);
+    *shadow = size & KASAN_SHADOW_MASK;
+  }
+}
+
+__attribute__((no_sanitize("address")))
+static inline int kasan_check_memory(unsigned long addr, size_t size,
+                                     uint8_t write, unsigned long pc) {
+  unsigned long buggy_shadow_address;
+  if (size == 0) return 1;
+
+  // there is 256 MB of RAM starting at 0x40000000
+  if (addr < TARGET_DRAM_START || addr > TARGET_DRAM_END) return 1;
+
+  buggy_shadow_address = get_poisoned_shadow_address(addr, size);
+  if (buggy_shadow_address == 0) return 1;
+
+  kasan_bug_report(addr, size, buggy_shadow_address, write, pc);
+  return 0;
+}
+
+// Implement necessary routines for KASan sanitization of globals.
+
+// See struct __asan_global definition at
+// https://github.com/llvm-mirror/compiler-rt/blob/master/lib/asan/asan_interface_internal.h.
+struct kasan_global_info {
+  // Starting address of the variable
+  const void *start;
+  // Variable size
+  size_t size;
+  // 32-bit aligned size of global including the redzone
+  size_t size_with_redzone;
+  // Symbol name
+  const void *name;
+  const void *module_name;
+  unsigned long has_dynamic_init;
+  void *location;
+  unsigned int odr_indicator;
+};
+
+__attribute__((no_sanitize("address")))
+static void asan_register_global(struct kasan_global_info *global) {
+  unpoison_shadow((unsigned long)global->start, global->size);
+
+  size_t aligned_size = (global->size + KASAN_SHADOW_MASK) & ~KASAN_SHADOW_MASK;
+  poison_shadow((unsigned long)global->start + aligned_size,
+                global->size_with_redzone - aligned_size,
+                ASAN_SHADOW_GLOBAL_REDZONE_MAGIC);
+}
+
+void __asan_register_globals(struct kasan_global_info *globals, size_t size) {
+  for (size_t i = 0; i < size; i++) asan_register_global(&globals[i]);
+}
+
+void __asan_unregister_globals(void *globals, size_t size) {}
+
+// Empty placeholder implementation to supress linker error for undefined symbol
+void __asan_handle_no_return(void) {}
+
+// KASan memcpy/memset hooks.
+
+__attribute__((no_sanitize("address")))
+void * __kasan_memcpy(void *dst, const void *src, size_t size,
+                     unsigned long pc){
+  kasan_check_memory((unsigned long)dst, size, /*is_write*/ true, pc);
+  kasan_check_memory((unsigned long)src, size, /*is_write*/ false, pc);
+
+  return _real_sbi_memcpy(dst, src, size); //added sbi_memcpy to the KASAN hook
+}
+
+__attribute__((no_sanitize("address")))
+void * __kasan_memset(void *buf, int c, size_t size, unsigned long pc)  {
+  kasan_check_memory((unsigned long)buf, size, /*is_write*/ true, pc);
+
+  return _real_sbi_memset(buf, c, size);  //added sbi_memset to the KASAN hook
+}
+
+// Implement KASan heap management hooks.
+
+struct KASAN_HEAP_HEADER {
+  unsigned int aligned_size;
+};
+
+__attribute__((no_sanitize("address")))
+void *kasan_malloc_hook(struct sbi_heap_control *hpctrl, size_t size) {
+  
+  struct KASAN_HEAP_HEADER *kasan_heap_hdr = NULL;
+  unsigned int algined_size = (size + KASAN_SHADOW_MASK) & (~KASAN_SHADOW_MASK);
+  unsigned int total_size = algined_size + KASAN_HEAP_HEAD_REDZONE_SIZE +
+                            KASAN_HEAP_TAIL_REDZONE_SIZE;
+  //allocating chunk with sbi_malloc_from
+ 
+  void *ptr = sbi_malloc_from(hpctrl, total_size);    
+  if (ptr == NULL) return NULL;
+
+  kasan_heap_hdr = (struct KASAN_HEAP_HEADER *)ptr;
+  kasan_heap_hdr->aligned_size = algined_size;
+  //shadow memory configuration
+  unpoison_shadow((unsigned long)(ptr + KASAN_HEAP_HEAD_REDZONE_SIZE), size);
+  poison_shadow((unsigned long)ptr, KASAN_HEAP_HEAD_REDZONE_SIZE,
+                ASAN_SHADOW_HEAP_HEAD_REDZONE_MAGIC);
+  poison_shadow(
+      (unsigned long)(ptr + KASAN_HEAP_HEAD_REDZONE_SIZE + algined_size),
+      KASAN_HEAP_TAIL_REDZONE_SIZE, ASAN_SHADOW_HEAP_TAIL_REDZONE_MAGIC);
+
+  return ptr + KASAN_HEAP_HEAD_REDZONE_SIZE;
+}
+
+__attribute__((no_sanitize("address")))
+void kasan_free_hook(struct sbi_heap_control *hpctrl, void *ptr) {
+  struct KASAN_HEAP_HEADER *kasan_heap_hdr = NULL;
+  unsigned int aligned_size = 0;
+
+  if (ptr == NULL) return;
+
+  kasan_heap_hdr =
+      (struct KASAN_HEAP_HEADER *)(ptr - KASAN_HEAP_HEAD_REDZONE_SIZE);
+  aligned_size = kasan_heap_hdr->aligned_size;
+
+  sbi_free_from(hpctrl, kasan_heap_hdr);
+  poison_shadow((unsigned long)ptr, aligned_size, ASAN_SHADOW_HEAP_FREE_MAGIC);
+
+  return;
+}
+
+// Implement KAsan error reporting routines.
+__attribute__((no_sanitize("address")))
+static void kasan_print_16_bytes_no_bug(const char *prefix,
+                                        unsigned long address) {
+  sbi_printf("%s0x%lX:", prefix, address);
+  for (int i = 0; i < 16; i++) sbi_printf(" %02X", *(uint8_t *)(address + i));
+  sbi_printf("\n");
+}
+
+__attribute__((no_sanitize("address")))
+static void kasan_print_16_bytes_with_bug(const char *prefix,
+                                          unsigned long address,
+                                          int buggy_offset) {
+  sbi_printf("%s0x%lX:", prefix, address);
+  for (int i = 0; i < buggy_offset; i++)
+    sbi_printf(" %02X", *(uint8_t *)(address + i));
+  sbi_printf("[%02X]", *(uint8_t *)(address + buggy_offset));
+  if (buggy_offset < 15)
+    sbi_printf("%02X", *(uint8_t *)(address + buggy_offset + 1));
+  for (int i = buggy_offset + 2; i < 16; i++)
+    sbi_printf(" %02X", *(uint8_t *)(address + i));
+  sbi_printf("\n");
+}
+
+__attribute__((no_sanitize("address")))
+static void kasan_print_shadow_memory(unsigned long address, int range_before,
+                                      int range_after) {
+  unsigned long shadow_address = KASAN_MEM_TO_SHADOW(address);
+  unsigned long aligned_shadow = shadow_address & 0xfffffff0;
+  int buggy_offset = shadow_address - aligned_shadow;
+
+  sbi_printf("[KASan] Shadow bytes around the buggy address 0x%lX (shadow 0x%lX):\n",
+         address, shadow_address);
+
+  for (int i = range_before; i > 0; i--) {
+    kasan_print_16_bytes_no_bug("[KASan]   ", aligned_shadow - i * 16);
+  }
+
+  kasan_print_16_bytes_with_bug("[KASan] =>", aligned_shadow, buggy_offset);
+
+  for (int i = 1; i <= range_after; i++) {
+    kasan_print_16_bytes_no_bug("[KASan]   ", aligned_shadow + i * 16);
+  }
+}
+
+void kasan_bug_report(unsigned long addr, size_t size,
+                      unsigned long buggy_shadow_address, uint8_t is_write,
+                      unsigned long ip) {
+  unsigned long buggy_address = KASAN_SHADOW_TO_MEM(buggy_shadow_address);
+  sbi_printf("[KASan] ===================================================\n");
+  sbi_printf(
+      "[KASan] ERROR: Invalid memory access: address 0x%lX, size 0x%lX, is_write "
+      "%d, ip 0x%lX\n",
+      addr, size, is_write, ip);
+
+  kasan_print_shadow_memory(buggy_address, 3, 3);
+}
+
+typedef void (*global_ctor)(void);
+
+
+void call_global_ctors(void) {
+  global_ctor *ctor = (global_ctor *)&__global_ctors_start;
+
+  while (ctor != (global_ctor *)&__global_ctors_end) {
+    (*ctor)();
+    ctor++;
+  }
+}
+
+void initialize_kasan(void) {
+  // Mark shadow memory region not accessible by the sanitized code.
+  poison_shadow(KASAN_SHADOW_MEMORY_START, KASAN_SHADOW_MEMORY_SIZE,
+                ASAN_SHADOW_RESERVED_MAGIC);
+}
+
+// Define KASan handlers exposed used by the compiler instrumentation.
+__attribute__((no_sanitize("address")))
+void __asan_loadN_noabort(unsigned int addr, unsigned int size) {
+  kasan_check_memory(addr, size, /*is_write*/ false, CALLER_PC);
+}
+
+__attribute__((no_sanitize("address")))
+void __asan_storeN_noabort(unsigned int addr, size_t size) {
+  kasan_check_memory(addr, size, /*is_write*/ true, CALLER_PC);
+}
+
+#define DEFINE_KASAN_LOAD_STORE_ROUTINES(size)                     \
+  void __asan_load##size##_noabort(unsigned long addr) {           \
+    kasan_check_memory(addr, size, /*is_write*/ false, CALLER_PC); \
+  }                                                                \
+  void __asan_store##size##_noabort(unsigned long addr) {          \
+    kasan_check_memory(addr, size, /*is_write*/ true, CALLER_PC);  \
+  }
+
+DEFINE_KASAN_LOAD_STORE_ROUTINES(1)
+DEFINE_KASAN_LOAD_STORE_ROUTINES(2)
+DEFINE_KASAN_LOAD_STORE_ROUTINES(4)
+DEFINE_KASAN_LOAD_STORE_ROUTINES(8)
+DEFINE_KASAN_LOAD_STORE_ROUTINES(16)
+
+// Local variable KASan instrumentation
+#define DEFINE_KASAN_SET_SHADOW_ROUTINE(byte)              \
+  __attribute__((no_sanitize("address")))                   \
+  void __asan_set_shadow_##byte(void *addr, size_t size) { \
+    sbi_memset(addr, 0x##byte, size);                          \
+  }
+
+DEFINE_KASAN_SET_SHADOW_ROUTINE(00)  // addressable memory
+DEFINE_KASAN_SET_SHADOW_ROUTINE(f1)  // stack left redzone
+DEFINE_KASAN_SET_SHADOW_ROUTINE(f2)  // stack mid redzone
+DEFINE_KASAN_SET_SHADOW_ROUTINE(f3)  // stack right redzone
+
+#endif
\ No newline at end of file
diff --git a/lib/sbi/sbi_kasan_test.c b/lib/sbi/sbi_kasan_test.c
new file mode 100644
index 00000000..08ec3f12
--- /dev/null
+++ b/lib/sbi/sbi_kasan_test.c
@@ -0,0 +1,60 @@
+
+#ifdef KASAN_TESTS_ENABLED
+#include <sbi/sbi_kasan_test.h>
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Warray-bounds"
+
+void test_heap_overflow(void) {
+  int oob_index = 18;
+  int size = 17;
+  unsigned char *ptr = sbi_malloc(size);//sbi_malloc(size);
+  sbi_printf("\nKASan test: heap OOB write\n");
+  sbi_printf("Writing 1 byte at offset %d in %d-byte heap buffer allocated at %p\n",
+         oob_index, size, ptr);
+  ptr[oob_index] = 0;
+}
+
+char oob_value;
+
+void test_stack_overflow(void) {
+  char buffer[17];
+  int oob_index = 18;
+  sbi_printf("\nKASan test: stack OOB read\n");
+  sbi_printf("Reading 1 byte at offset %d in %ld-byte stack buffer at %p\n",
+         oob_index, sizeof(buffer), (void*)&buffer);
+  oob_value = buffer[oob_index];
+}
+
+int global_array[17];
+
+void test_globals_overflow(void) {
+  int oob_index = 18;
+  sbi_printf("\nKASan test: global OOB write\n");
+  sbi_printf(
+      "Writing an integer at index %d in %ld-element global integer array at "
+      "%p\n",
+      oob_index, sizeof(global_array) / sizeof(int), (void*)&global_array);
+  global_array[oob_index] = 0;
+}
+
+char global_char_buffer[17];
+
+void test_memset_overflow(void) {
+  int oob_size = 18;
+  sbi_printf("\nKASan test: memset OOB write in globals\n");
+  sbi_printf("Memsetting global %ld-byte buffer at %p with %d values of 0xaa\n",
+         sizeof(global_char_buffer), (void*)&global_char_buffer, oob_size);
+  sbi_memset(global_char_buffer, 0xaa, oob_size);
+}
+
+void test_memcpy_overflow(void) {
+  char buffer[18];
+  int oob_size = sizeof(buffer);
+  sbi_printf("\nKASan test: memcpy OOB read from globals\n");
+  sbi_printf("Memcopying %d bytes from %ld-byte global buffer into local array\n",
+         oob_size, sizeof(global_char_buffer));
+  sbi_memcpy(buffer, global_char_buffer, oob_size);
+}
+#pragma GCC diagnostic pop
+#endif
\ No newline at end of file
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index f4f13942..90f6363a 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -14,6 +14,7 @@
 
 #include <sbi/sbi_string.h>
 
+#define CALLER_PC ((unsigned long)__builtin_return_address(0))
 /*
   Provides sbi_strcmp for the completeness of supporting string functions.
   it is not recommended to use sbi_strcmp() but use sbi_strncmp instead.
@@ -109,7 +110,9 @@ char *sbi_strrchr(const char *s, int c)
 	else
 		return (char *)last;
 }
-void *sbi_memset(void *s, int c, size_t count)
+
+__attribute__((no_sanitize("address")))
+void *_real_sbi_memset(void *s, int c, size_t count)
 {
 	char *temp = s;
 
@@ -121,8 +124,8 @@ void *sbi_memset(void *s, int c, size_t count)
 	return s;
 }
 
-void *sbi_memcpy(void *dest, const void *src, size_t count)
-{
+__attribute__((no_sanitize("address")))
+void *_real_sbi_memcpy(void *dest, const void *src, size_t count){
 	char *temp1	  = dest;
 	const char *temp2 = src;
 
@@ -134,6 +137,29 @@ void *sbi_memcpy(void *dest, const void *src, size_t count)
 	return dest;
 }
 
+
+__attribute__((no_sanitize("address")))
+void *sbi_memset(void *s, int c, unsigned long count) {
+    #ifdef KASAN_ENABLED
+    return __kasan_memset(s, c, count, CALLER_PC);
+    //addedd from SBI
+    #else
+    return _real_sbi_memset(s, c, count);
+    #endif
+}
+
+__attribute__((no_sanitize("address")))
+void *sbi_memcpy(void *dest, const void *src, unsigned long count) {
+    #ifdef KASAN_ENABLED
+    return __kasan_memcpy(dest, src, count, CALLER_PC);
+    //addedd from SBI
+    #else
+    return _real_sbi_memcpy(dest, src, count);
+    #endif
+}
+
+
+__attribute__((no_sanitize("address")))
 void *sbi_memmove(void *dest, const void *src, size_t count)
 {
 	char *temp1	  = (char *)dest;
@@ -160,6 +186,7 @@ void *sbi_memmove(void *dest, const void *src, size_t count)
 	return dest;
 }
 
+__attribute__((no_sanitize("address")))
 int sbi_memcmp(const void *s1, const void *s2, size_t count)
 {
 	const char *temp1 = s1;
@@ -189,3 +216,25 @@ void *sbi_memchr(const void *s, int c, size_t count)
 
 	return NULL;
 }
+
+__attribute__((no_sanitize("address")))
+void *memset(void *s, int c, size_t count)
+{
+    #ifdef KASAN_ENABLED
+    return __kasan_memset(s, c, count, CALLER_PC);
+    //addedd from SBI
+    #else
+    return _real_sbi_memset(s, c, count);
+    #endif
+}
+
+__attribute__((no_sanitize("address")))
+void *memcpy(void *dest, const void *src, size_t count)
+{
+    #ifdef KASAN_ENABLED
+    return __kasan_memcpy(dest, src, count, CALLER_PC);
+    //addedd from SBI
+    #else
+    return _real_sbi_memcpy(dest, src, count);
+    #endif
+}
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index c4a8fee2..90d27b32 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -37,7 +37,10 @@ ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
   FW_PAYLOAD_OFFSET=0x400000
 else
-  # This needs to be 2MB aligned for 64-bit system
+  ifeq ($(ENABLEKASAN),y)   # This needs to be 2MB aligned for 64-bit system: we double the size for KASAn and UBSAn integration
+  FW_PAYLOAD_OFFSET=0x400000
+  else
   FW_PAYLOAD_OFFSET=0x200000
+  endif
 endif
 FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
