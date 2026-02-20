Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563E3C5AD69
	for <opensbi@archiver.kernel.org>; Fri, 20 Feb 2026 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hpT5bst5kXR/S99t502M5sM0zQ5gnUu43T3fhmRyiW8=; b=ifNGzjuGT08JtE
	CZvGl757Jy36LKM57SudDyxMbrO+kNLQLFdtpwapXLcGL8a5QSpt2+MKc3ZtgIc+4OLd13pDoKJEE
	hwehIPfz7MJdfQwxDlddgXMlZLb6AljItIcax0pZvcQHF8/EF7fmqNrvO2sfp1e/LiRCZZGkQGuSw
	yrxtCZm40suVxKwpsijVf8L4LDt1cQmhFqbxQe4yd3cW7GEqFX4wY+sLAgGU/Dwp6bq3w6cSFyGTF
	eMFSS5KQqpUXm/jlQPqBBloSOCcFn20mJnvB2Es7V32fXrbIgEoiQFnx3CQqJKWlY02EBVWV7DlV4
	PJhFHdXv7WUqTzFd8EnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWG8-0000000FVyG-3XdV;
	Fri, 20 Feb 2026 19:33:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWG5-0000000FVxm-2Dyd
	for opensbi@lists.infradead.org;
	Fri, 20 Feb 2026 19:33:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43626796202so2196117f8f.3
        for <opensbi@lists.infradead.org>; Fri, 20 Feb 2026 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771616027; x=1772220827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t09Hfe7jgW7jxqjNZ53vlaHZz1+3aNHmnw7z1P/pbw=;
        b=jqsZwjkWYUNRYULCIAJF8kgM4hwUuXHCMfYLdw+a7L8SM9wH29NeW4L9Kf27B2BGyH
         atqdGcS6YDJaz/n2qbh73WCfQ5zjL/Hss6QwEjpnXWbWA4x1TNnXyqnsIhkN/NwpqpkT
         YHvyv+OBSNCRoRirhyPRUjHs67q+f74z4HEQ2BQwOBgGLBJBmf/YCz2Zly2bi6oLI9jo
         uZL/UCiio6HYxkfFUgN0Sn+pCxT2oJpvVhBN/HVZZPdv6/IFbgYeYqnvA+qqMlnKgfZJ
         EQPkTZI8enrsjUCU7RIyQ4jmyOJT2iL9ec0WUQm1WCO8qup/rijSdpXd6VNTbwUTioOA
         lY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616027; x=1772220827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t09Hfe7jgW7jxqjNZ53vlaHZz1+3aNHmnw7z1P/pbw=;
        b=p2E8IXjgoifyT82OBWdZ8EEtmONcfoGMQIw+hUvob24l8LPhZFqsTuIycFWbyUv+pZ
         1R3dTA8ShScbrT2ZUYdkuX09DlN0QgaqFSfmTeCi0BDF7V2O0eR1gF6DbfzLu5+A05qm
         /htnRKYvqMEsCuAS1ApcwZPgkJojRJuJ90gJwmLXjnMMKdnzexRBLIt0d9PLLvL1cKkk
         Yg3q1m7P40CGLTEadlL7HH3mYO11isAU1Pz92y5O0QjhVUr/V4pU4C1hQag8Cb7CT3ih
         lAg1rSDT/qGW7NB48j9Mtlkbwch1myuFJowaw4//pMgk6lxp5RE2ytMhnHjOhi2iq3NI
         CSkg==
X-Gm-Message-State: AOJu0YwBcL/NcNNuLCtEc+NLuamjWpr7cyhqYbn+0zI4cZqBI30TrKjI
	ZMt3p5s8rP/vWDx1MJx6ZS3I9zlDhDLCCn2rPLzSKSo8ygCKzE0xh88LfR4Tdg==
X-Gm-Gg: AZuq6aIz9N9rb1w0uI5k7XXXbNWzK4/7pketcYaeoF5qZGheAYbkfDkvTsgj69gb6s9
	lwAQX2WL28ueb1AzpFqhG3k3XaxKkun7NSrpce3WkJ3NK/ZREXAuKjc+Uyt4YyRRK6y0wGG8hxj
	Hp8CyHi7iyCd52FL6PfmpD1A5qudb0Dtz5GlfCVa0m3YJhzGwwyYtl1u5FVYlyxWfln9YJWBVBJ
	xJIXJ6d9LJHfgtHwAlWxaHa8PtS8Ub0tHLeHEX3Moeiylgs1sE67/jtvwI6ZvCIh8BKtJUkllf4
	Nxux6f20iiOv33KH8aJ4LHDVaM+FAcQzWTo8DVsFOqvNyEJ4pSN9LCTFxU+Hyv/H6u9/26ZX348
	D3Got6wb5ufybe/0KfZp8iEg80Z51bt8+TB7M8QenL5x//6oPtzM4L1G6N81F0jOgaU+uzaiHMA
	GlbA3v1zQci0OD5cHlTscSd8xLYizaXZDqApqVGdU4rQiU5EvcWe7dV1dtvIvAzm/C9KkNAk8Ia
	WGxcHBFcq4oadY/LtP2d3EJc7V3hFV7CKKpqyFe5BYJqw0SaLVzpeE=
X-Received: by 2002:a05:6000:2285:b0:437:6efe:94cf with SMTP id ffacd0b85a97d-4396f14cb7amr2049657f8f.1.1771616026561;
        Fri, 20 Feb 2026 11:33:46 -0800 (PST)
Received: from marcosthinkpad ([79.116.216.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm193976f8f.17.2026.02.20.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:33:46 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos <marcos.oduardo@gmail.com>
Subject: [PATCH v3] lib: sbi: Add KASAN support for OpenSBI
Date: Fri, 20 Feb 2026 20:32:17 +0100
Message-ID: <20260220193407.108556-2-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_113349_878044_B481D250 
X-CRM114-Status: GOOD (  28.82  )
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

Users may compile OpenSBI with the KASan instrumentation by adding the
flag ENABLEKASAN=y to the make command. To compile with the tests, add
the flag ENABLEKASANTESTS=y.

Note that the implementation of KASan adds a certain overhead caused by
the checks performed at runtime and the shadowmap loaded in memory;
therefore, it is only expected to be used in development builds, never
in production. If ENABLEKASAN is not set, no instrumentation is added.

Signed-off-by:  Marcos Oduardo <marcos.oduardo@gmail.com>
---
Changes since v2:
- Relocated shadowmap base address to 0x80100000. Initially, the 0xE7...
  address used was for testing purposes. Upon inspecting OpenSBI memory
  allocation, I determined that the new address is a better placement
  for the shadowmap.
- Migrated kasan_enabled variable to scratch for HART-independent
  management.
- Integrated shadow map into OpenSBI domains with PMP protection.
- Optimized string functions instrumentation in sbi_string.c.
- KASAN now initializes dynamically, only needing to pass statically
  to the compiler the base address of the shadowmap.
- KASAN now reports accesses between (fw_start, fw_rw_start] and on
  the shadowmap.

Note on GCC support:
About the GCC implementation, in order to initialize KASAN dynamically
a kasan_ignore.txt is passed to Clang via the -fsanitize-ignorelist
flag. GCC actually doesn't support this functionality, which makes
the addition a lot harder to implement because you would need to add
"__attribute__((no_sanitize("address")))" to each function that gets
called before KASAN initialization. For the time being, I think it is
better to keep KASAN for GCC unsupported as it would need various
modifications to the structure of the Makefile itself.

 Makefile                     |  25 ++
 firmware/fw_base.S           |  12 +-
 firmware/fw_base.ldS         |   9 +-
 include/sbi/sbi_heap.h       |  27 +-
 include/sbi/sbi_kasan.h      |  26 ++
 include/sbi/sbi_kasan_test.h |  29 ++
 include/sbi/sbi_string.h     |  13 +-
 include/sbi/sbi_types.h      |   1 +
 kasan_ignore.txt             |  14 +
 lib/sbi/objects.mk           |   3 +
 lib/sbi/sbi_domain.c         |  16 +-
 lib/sbi/sbi_heap.c           |   9 +-
 lib/sbi/sbi_init.c           |  18 ++
 lib/sbi/sbi_kasan.c          | 514 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_kasan_test.c     |  66 +++++
 lib/sbi/sbi_string.c         | 310 +++++++++++++--------
 platform/generic/objects.mk  |   3 +-
 17 files changed, 971 insertions(+), 124 deletions(-)
 create mode 100644 include/sbi/sbi_kasan.h
 create mode 100644 include/sbi/sbi_kasan_test.h
 create mode 100644 kasan_ignore.txt
 create mode 100644 lib/sbi/sbi_kasan.c
 create mode 100644 lib/sbi/sbi_kasan_test.c

diff --git a/Makefile b/Makefile
index 46541063..890d0874 100644
--- a/Makefile
+++ b/Makefile
@@ -400,6 +400,31 @@ CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	-fPIE -pie
 CFLAGS		+=	$(firmware-cflags-y)
 
+
+#KASAN Cflags
+
+ifeq ($(ENABLEKASAN),y)
+KASAN_SHADOW_MEMORY_START := 0x80100000
+CFLAGS += -DTARGET_ARCH_$(ARCH)
+CFLAGS += -DKASAN_SHADOW_MEMORY_START=$(KASAN_SHADOW_MEMORY_START)
+ifeq ($(CC_IS_CLANG),y)
+KASAN_FLAGS := -fsanitize=kernel-address 
+KASAN_FLAGS += -fno-sanitize-address-use-after-scope
+KASAN_FLAGS += -DKASAN_ENABLED
+KASAN_FLAGS += -fsanitize-ignorelist=$(CURDIR)/kasan_ignore.txt
+KASAN_FLAGS += -mllvm -asan-instrumentation-with-call-threshold=0
+KASAN_FLAGS += -mllvm -asan-stack=1
+KASAN_FLAGS += -mllvm -asan-globals=1        
+ifeq ($(ENABLEKASANTESTS),y) 
+KASAN_FLAGS += -DKASAN_TESTS_ENABLED
+endif
+CFLAGS += $(KASAN_FLAGS)
+else
+$(error OpenSBI KASAN currently requires Clang because GCC is unsupported. Please build with LLVM=y)
+endif
+endif
+
+
 CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
 CPPFLAGS	+=	$(firmware-cppflags-y)
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 63bb4473..8a58d8fe 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -461,22 +461,22 @@ fw_platform_init:
 	/* Map implicit memcpy() added by compiler to sbi_memcpy() */
 	.section .text
 	.align 3
-	.globl memcpy
-memcpy:
+	.globl __asan_memcpy
+__asan_memcpy:
 	tail	sbi_memcpy
 
 	/* Map implicit memset() added by compiler to sbi_memset() */
 	.section .text
 	.align 3
-	.globl memset
-memset:
+	.globl __asan_memset
+__asan_memset:
 	tail	sbi_memset
 
 	/* Map implicit memmove() added by compiler to sbi_memmove() */
 	.section .text
 	.align 3
-	.globl memmove
-memmove:
+	.globl __asan_memmove
+__asan_memmove:
 	tail	sbi_memmove
 
 	/* Map implicit memcmp() added by compiler to sbi_memcmp() */
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 12c7a844..9619a5a5 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -39,6 +39,13 @@
 		. = ALIGN(8);
 	}
 
+	.init_array : /* Needed for KASan - NetBSD style */
+	{
+    __CTOR_LIST__ = .;
+    *(.init_array*)
+    __CTOR_END__ = .;
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
index a4b3f0c6..299a0985 100644
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
@@ -26,11 +29,24 @@ struct sbi_scratch;
 /** Allocate from heap area */
 void *sbi_malloc_from(struct sbi_heap_control *hpctrl, size_t size);
 
-static inline void *sbi_malloc(size_t size)
-{
+#ifdef KASAN_ENABLED 
+static inline void *sbi_malloc(size_t size){
+	return kasan_malloc_hook(&global_hpctrl, size); 
+}
+
+static inline void *zalloc_from (struct sbi_heap_control *hpctrl, size_t size){ //function needed for KASAn integration in compile options
+	return kasan_malloc_hook(hpctrl, size);
+}
+#else 
+static inline void *zalloc_from (struct sbi_heap_control *hpctrl, size_t size){
 	return sbi_malloc_from(&global_hpctrl, size);
 }
 
+static inline void *sbi_malloc(size_t size){
+    return sbi_malloc_from(&global_hpctrl, size);
+}
+#endif
+
 /** Allocate aligned from heap area */
 void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
 			     size_t alignment,size_t size);
@@ -63,10 +79,17 @@ static inline void *sbi_calloc_from(struct sbi_heap_control *hpctrl,
 /** Free-up to heap area */
 void sbi_free_from(struct sbi_heap_control *hpctrl, void *ptr);
 
+#ifdef KASAN_ENABLED 
+static inline void sbi_free(void *ptr)
+{
+	return kasan_free_hook(&global_hpctrl, ptr);
+}
+#else
 static inline void sbi_free(void *ptr)
 {
 	return sbi_free_from(&global_hpctrl, ptr);
 }
+#endif
 
 /** Amount (in bytes) of free space in the heap area */
 unsigned long sbi_heap_free_space_from(struct sbi_heap_control *hpctrl);
diff --git a/include/sbi/sbi_kasan.h b/include/sbi/sbi_kasan.h
new file mode 100644
index 00000000..93ef9208
--- /dev/null
+++ b/include/sbi/sbi_kasan.h
@@ -0,0 +1,26 @@
+/* 
+ * SPDX-License-Identifier: BSD-2-Clause
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
+#ifndef __SBI_KASAN_H__
+#define __SBI_KASAN_H__
+
+#include <sbi/sbi_list.h>
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+
+struct heap_node;
+struct sbi_heap_control;
+struct sbi_domain_memregion;
+
+void kasan_hart_init(struct sbi_scratch *scratch);
+void kasan_init(struct sbi_scratch *scratch);
+void *kasan_malloc_hook(struct sbi_heap_control *hpctrl, size_t size); 
+void kasan_free_hook(struct sbi_heap_control *hpctrl, void *ptr);
+void kasan_shadow_check(unsigned long addr, size_t size, bool write, unsigned long retaddr);
+void sbi_kasan_get_shadow_region(struct sbi_domain_memregion *reg);
+unsigned long sbi_kasan_get_shadow_size(void);
+
+#endif
\ No newline at end of file
diff --git a/include/sbi/sbi_kasan_test.h b/include/sbi/sbi_kasan_test.h
new file mode 100644
index 00000000..a7625f3b
--- /dev/null
+++ b/include/sbi/sbi_kasan_test.h
@@ -0,0 +1,29 @@
+/* 
+ * SPDX-License-Identifier: BSD-2-Clause
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
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
+void heap_kasan_test(void);
+void stack_kasan_test(void);
+void globals_kasan_test(void);
+void memset_kasan_test(void);
+void memcpy_kasan_test(void);
+#endif
+#endif
\ No newline at end of file
diff --git a/include/sbi/sbi_string.h b/include/sbi/sbi_string.h
index b7c2bc22..5feab7e6 100644
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
+#ifdef KASAN_ENABLED
+void *_real_sbi_memset(void *s, int c, size_t count);
+
+void *_real_sbi_memcpy(void *dest, const void *src, size_t count);
+#endif
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
index b8a7e6cb..11ce6eb3 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -14,6 +14,7 @@
 
 /* clang-format off */
 
+typedef signed char 	int8_t;
 typedef signed char		s8;
 typedef unsigned char		u8;
 typedef unsigned char		uint8_t;
diff --git a/kasan_ignore.txt b/kasan_ignore.txt
new file mode 100644
index 00000000..e90edf8d
--- /dev/null
+++ b/kasan_ignore.txt
@@ -0,0 +1,14 @@
+src:*sbi_init.c
+src:*sbi_domain_context.c
+src:*sbi_scratch.c
+src:*sbi_hart.c
+src:*sbi_trap.c
+src:*sbi_console.c
+src:*sbi_kasan.c
+
+src:*sbi_string.c
+
+src:*fdt*.c
+
+src:*platform.c
+src:*fw_base.S
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..34ce07bb 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,7 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
@@ -86,6 +87,8 @@ libsbi-objs-y += sbi_illegal_insn.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
+libsbi-objs-y += sbi_kasan.o
+libsbi-objs-y += sbi_kasan_test.o
 libsbi-objs-y += sbi_platform.o
 libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_dbtr.o
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4f458ac0..0ad3d974 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_kasan.h>
 
 SBI_LIST_HEAD(domain_list);
 
@@ -936,8 +937,21 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 					   SBI_DOMAIN_MEMREGION_M_WRITABLE |
 					   SBI_DOMAIN_MEMREGION_FW),
 					  &root_memregs[root_memregs_count++]);
+		
 	}
 
+	#ifdef KASAN_ENABLED
+	/*
+	 * Protect KASAN Shadowmap memregion from lower privilege modes
+	 */
+	sbi_domain_memregion_init(KASAN_SHADOW_MEMORY_START,
+                  sbi_kasan_get_shadow_size(),
+                  (SBI_DOMAIN_MEMREGION_M_READABLE |
+                   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+                   SBI_DOMAIN_MEMREGION_FW),
+                  &root_memregs[root_memregs_count++]);
+	#endif
+
 	root.fw_region_inited = true;
 
 	/*
@@ -967,7 +981,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	/* Root domain possible and assigned HARTs */
 	sbi_for_each_hartindex(i)
 		sbi_hartmask_set_hartindex(i, root_hmask);
-
+		
 	/* Finally register the root domain */
 	rc = sbi_domain_register(&root, root_hmask);
 	if (rc)
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 1de6dc1e..13500330 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -39,6 +39,7 @@ struct sbi_heap_control {
 
 struct sbi_heap_control global_hpctrl;
 
+__attribute__((no_sanitize("address")))
 static bool alloc_nodes(struct sbi_heap_control *hpctrl)
 {
 	size_t size = HEAP_NODE_BATCH_SIZE * sizeof(struct heap_node);
@@ -69,6 +70,7 @@ static bool alloc_nodes(struct sbi_heap_control *hpctrl)
 	return true;
 }
 
+__attribute__((no_sanitize("address")))
 static void *alloc_with_align(struct sbi_heap_control *hpctrl,
 			      size_t align, size_t size)
 {
@@ -137,11 +139,13 @@ out:
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
@@ -159,15 +163,17 @@ void *sbi_aligned_alloc_from(struct sbi_heap_control *hpctrl,
 	return alloc_with_align(hpctrl, alignment, size);
 }
 
+__attribute__((no_sanitize("address")))
 void *sbi_zalloc_from(struct sbi_heap_control *hpctrl, size_t size)
 {
-	void *ret = sbi_malloc_from(hpctrl, size);
+	void *ret = zalloc_from(hpctrl, size); //function needed for KASAn integration
 
 	if (ret)
 		sbi_memset(ret, 0, size);
 	return ret;
 }
 
+__attribute__((no_sanitize("address")))
 void sbi_free_from(struct sbi_heap_control *hpctrl, void *ptr)
 {
 	struct heap_node *n, *np;
@@ -239,6 +245,7 @@ unsigned long sbi_heap_reserved_space_from(struct sbi_heap_control *hpctrl)
 	return hpctrl->resv;
 }
 
+__attribute__((no_sanitize("address")))
 int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
 		       unsigned long size)
 {
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 5259064b..af33c266 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,8 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_kasan.h>
+#include <sbi/sbi_kasan_test.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -231,6 +233,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	rc = sbi_scratch_init(scratch);
 	if (rc)
 		sbi_hart_hang();
+	
+	#ifdef KASAN_ENABLED
+	kasan_init(scratch);
+	#endif
 
 	/* Note: This has to be second thing in coldboot init sequence */
 	rc = sbi_heap_init(scratch);
@@ -288,6 +294,14 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_double_trap_init(scratch);
 
+	#ifdef KASAN_TESTS_ENABLED
+	heap_kasan_test();
+	stack_kasan_test();
+	globals_kasan_test();
+	memset_kasan_test();
+	memcpy_kasan_test();
+	#endif
+
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
@@ -431,6 +445,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	rc = sbi_hart_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
+	
+	#ifdef KASAN_ENABLED
+	kasan_hart_init(scratch);
+	#endif
 
 	rc = sbi_pmu_init(scratch, false);
 	if (rc)
diff --git a/lib/sbi/sbi_kasan.c b/lib/sbi/sbi_kasan.c
new file mode 100644
index 00000000..77e0dddf
--- /dev/null
+++ b/lib/sbi/sbi_kasan.c
@@ -0,0 +1,514 @@
+
+/* SPDX-License-Identifier: BSD-2-Clause
+ * Copyright (c) 2018-2020 Maxime Villard, m00nbsd.net
+ *
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ *               
+ * All rights reserved.
+ *
+ * This code is part of the KASAN subsystem of the NetBSD kernel.
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
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+ * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
+ * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#include <sbi/sbi_kasan.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_scratch.h>
+
+#ifdef KASAN_ENABLED
+
+#define __RET_ADDR ((unsigned long) __builtin_return_address(0))
+
+/* ASAN constants. Part of the compiler ABI. */
+#define KASAN_SHADOW_SCALE_SHIFT    3
+#define KASAN_SHADOW_SCALE_SIZE     (1UL << KASAN_SHADOW_SCALE_SHIFT)
+#define KASAN_SHADOW_MASK           (KASAN_SHADOW_SCALE_SIZE - 1)
+
+// Poison Values
+#define KASAN_GENERIC_REDZONE   0xFA
+#define KASAN_MALLOC_REDZONE    0xFB
+#define KASAN_HEAP_FREE         0xFD
+#define KASAN_STACK_LEFT        0xF1
+#define KASAN_STACK_MID         0xF2
+#define KASAN_STACK_RIGHT       0xF3
+#define KASAN_SHADOW_RESERVED   0xFF
+
+#define KASAN_HEAD_SIZE         32
+#define KASAN_TAIL_SIZE         32
+
+// BSD Macros
+#define roundup(x, y)           ((((x) + ((y) - 1)) / (y)) * (y))
+#define __predict_true(x)       __builtin_expect((x) != 0, 1)
+#define __predict_false(x)      __builtin_expect((x) != 0, 0)
+
+#define KASAN_MEM_TO_SHADOW(addr) \
+  (((addr) >> KASAN_SHADOW_SCALE_SHIFT) + __asan_shadow_memory_dynamic_address)
+
+static unsigned long kasan_enabled_offset;
+static bool kasan_early_boot_done = false;
+static unsigned long kasan_fw_base;
+static unsigned long kasan_rw_offset;
+static unsigned long kasan_fw_size;
+unsigned long __asan_shadow_memory_dynamic_address; //shadow offset
+static unsigned long kasan_shadow_size;
+static unsigned long kasan_fw_start; //fw base + offset
+static unsigned long kasan_fw_end; //fw base + size
+
+#define ADDR_CROSSES_SCALE_BOUNDARY(addr, size) \
+    ((addr >> KASAN_SHADOW_SCALE_SHIFT) != ((addr + size - 1) >> KASAN_SHADOW_SCALE_SHIFT))
+
+__attribute__((no_sanitize("address")))
+static inline int8_t *kasan_md_addr_to_shad(const void *addr) {
+    return (int8_t *)(((unsigned long)(addr) >> KASAN_SHADOW_SCALE_SHIFT) + __asan_shadow_memory_dynamic_address);
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_md_illegal(unsigned long addr, bool is_write) {
+    if (addr >= KASAN_SHADOW_MEMORY_START && addr < (KASAN_SHADOW_MEMORY_START + kasan_shadow_size)) 
+    return true;
+
+    if (addr >= kasan_fw_base && addr < kasan_fw_start){
+        if (is_write) {
+            return true;
+        }
+    }
+    
+    return false;
+
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_md_unsupported(unsigned long addr) {
+    if (addr > kasan_fw_end) return true;
+    
+    if (addr < kasan_fw_base) return true;
+
+    return false;
+}
+
+__attribute__((no_sanitize("address")))
+static inline const char *kasan_code_name(uint8_t code) {
+    switch (code) {
+    case KASAN_GENERIC_REDZONE: return "GenericRedZone";
+    case KASAN_MALLOC_REDZONE:  return "MallocRedZone";
+    case KASAN_HEAP_FREE:       return "UseAfterFree";
+    case 1 ... 7:               return "RedZonePartial";
+    case KASAN_STACK_LEFT:      return "StackLeft";
+    case KASAN_STACK_MID:       return "StackMiddle";
+    case KASAN_STACK_RIGHT:     return "StackRight";
+    default:                    return "Unknown";
+    }
+}
+
+__attribute__((no_sanitize("address")))
+static void kasan_report(unsigned long addr, size_t size, bool write, unsigned long pc, uint8_t code) {
+    struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+    bool was_enabled = sbi_scratch_read_type(scratch, bool, kasan_enabled_offset);
+    sbi_scratch_write_type(scratch, bool, kasan_enabled_offset, false);
+
+    sbi_printf("\n");
+    sbi_printf("ASan: Unauthorized Access In %p: Addr %p [%lu byte%s, %s, %s]\n",
+        (void *)pc, (void *)addr, (unsigned long)size, (size > 1 ? "s" : ""),
+        (write ? "write" : "read"), kasan_code_name(code));
+        
+    sbi_scratch_write_type(scratch, bool, kasan_enabled_offset, was_enabled);
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_shadow_1byte_isvalid(unsigned long addr, uint8_t *code) {
+    int8_t *byte = kasan_md_addr_to_shad((void *)addr);
+    int8_t last = (int8_t)((addr & KASAN_SHADOW_MASK) + 1);
+
+    if (__predict_true(*byte == 0 || last <= *byte)) {
+        return true;
+    }
+    *code = (uint8_t)*byte;
+    return false;
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_shadow_2byte_isvalid(unsigned long addr, uint8_t *code) {
+    if (ADDR_CROSSES_SCALE_BOUNDARY(addr, 2)) {
+        return (kasan_shadow_1byte_isvalid(addr, code) && 
+                kasan_shadow_1byte_isvalid(addr+1, code));
+    }
+    int8_t *byte = kasan_md_addr_to_shad((void *)addr);
+    int8_t last = (int8_t)(((addr + 1) & KASAN_SHADOW_MASK) + 1);
+
+    if (__predict_true(*byte == 0 || last <= *byte)) {
+        return true;
+    }
+    *code = (uint8_t)*byte;
+    return false;
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_shadow_4byte_isvalid(unsigned long addr, uint8_t *code) {
+    if (ADDR_CROSSES_SCALE_BOUNDARY(addr, 4)) {
+        return (kasan_shadow_2byte_isvalid(addr, code) && 
+                kasan_shadow_2byte_isvalid(addr+2, code));
+    }
+    int8_t *byte = kasan_md_addr_to_shad((void *)addr);
+    int8_t last = (int8_t)(((addr + 3) & KASAN_SHADOW_MASK) + 1);
+
+    if (__predict_true(*byte == 0 || last <= *byte)) {
+        return true;
+    }
+    *code = (uint8_t)*byte;
+    return false;
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_shadow_8byte_isvalid(unsigned long addr, uint8_t *code) {
+    if (ADDR_CROSSES_SCALE_BOUNDARY(addr, 8)) {
+        return (kasan_shadow_4byte_isvalid(addr, code) && 
+                kasan_shadow_4byte_isvalid(addr+4, code));
+    }
+    int8_t *byte = kasan_md_addr_to_shad((void *)addr);
+    int8_t last = (int8_t)(((addr + 7) & KASAN_SHADOW_MASK) + 1);
+
+    if (__predict_true(*byte == 0 || last <= *byte)) {
+        return true;
+    }
+    *code = (uint8_t)*byte;
+    return false;
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_shadow_Nbyte_isvalid(unsigned long addr, size_t size, uint8_t *code) {
+    size_t i;
+    for (i = 0; i < size; i++) {
+        if (!kasan_shadow_1byte_isvalid(addr+i, code)) return false;
+    }
+    return true;
+}
+
+__attribute__((no_sanitize("address")))
+void kasan_shadow_check(unsigned long addr, size_t size, bool write, unsigned long retaddr) {
+    
+    if (__predict_false(!kasan_early_boot_done)) return;
+    
+    uint8_t code = 0;
+    bool valid = true;
+    struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+    bool enabled = sbi_scratch_read_type(scratch, bool, kasan_enabled_offset);
+    if (__predict_false(!enabled)) return;
+    
+    if (__predict_false(size == 0)) return;
+    if (__predict_false(kasan_md_illegal(addr, write))) {
+        kasan_report(addr, size, write, retaddr, KASAN_SHADOW_RESERVED);
+        return;
+    }
+    if (__predict_false(kasan_md_unsupported(addr))) return;
+
+
+
+    if (__builtin_constant_p(size)) {
+        switch (size) {
+        case 1: valid = kasan_shadow_1byte_isvalid(addr, &code); break;
+        case 2: valid = kasan_shadow_2byte_isvalid(addr, &code); break;
+        case 4: valid = kasan_shadow_4byte_isvalid(addr, &code); break;
+        case 8: valid = kasan_shadow_8byte_isvalid(addr, &code); break;
+        default: valid = kasan_shadow_Nbyte_isvalid(addr, size, &code); break;
+        }
+    } else {
+        valid = kasan_shadow_Nbyte_isvalid(addr, size, &code);
+    }
+
+    if (__predict_false(!valid)) {
+        kasan_report(addr, size, write, retaddr, code);
+    }
+}
+
+__attribute__((no_sanitize("address")))
+static void kasan_shadow_Nbyte_fill(const void *addr, size_t size, uint8_t code)
+{
+    void *shad;
+
+    if (__predict_false(size == 0)) return;
+    if (__predict_false(kasan_md_unsupported((unsigned long)addr))) return;
+    
+    shad = (void *)kasan_md_addr_to_shad(addr);
+    size = size >> KASAN_SHADOW_SCALE_SHIFT;
+
+    _real_sbi_memset(shad, code, size);
+}
+
+__attribute__((no_sanitize("address")))
+static __always_inline void
+kasan_shadow_1byte_markvalid(unsigned long addr)
+{
+    int8_t *byte = kasan_md_addr_to_shad((void *)addr);
+    int8_t last = (addr & KASAN_SHADOW_MASK) + 1;
+
+    *byte = last;
+}
+
+__attribute__((no_sanitize("address")))
+static __always_inline void
+kasan_shadow_Nbyte_markvalid(const void *addr, size_t size)
+{
+    size_t i;
+    for (i = 0; i < size; i++) {
+        kasan_shadow_1byte_markvalid((unsigned long)addr + i);
+    }
+}
+
+/*
+ * In an area of size 'sz_with_redz', mark the 'size' first bytes as valid,
+ * and the rest as invalid. There are generally two use cases:
+ *
+ *  o kasan_mark(addr, origsize, size, code), with origsize < size. This marks
+ *    the redzone at the end of the buffer as invalid.
+ *
+ *  o kasan_mark(addr, size, size, 0). This marks the entire buffer as valid.
+ */
+
+ __attribute__((no_sanitize("address")))
+void kasan_mark(const void *addr, size_t size, size_t sz_with_redz, uint8_t code)
+{
+    size_t i, n, redz;
+    int8_t *shad;
+
+    if (__predict_false(!kasan_early_boot_done)) return;
+    if (kasan_md_unsupported((unsigned long)addr)) return;
+
+    redz = sz_with_redz - roundup(size, KASAN_SHADOW_SCALE_SIZE);
+    shad = kasan_md_addr_to_shad(addr);
+
+    /* Chunks of 8 bytes, valid. */
+    n = size / KASAN_SHADOW_SCALE_SIZE;
+    for (i = 0; i < n; i++) {
+        *shad++ = 0;
+    }
+
+    /* Possibly one chunk, mid. */
+    if ((size & KASAN_SHADOW_MASK) != 0) {
+        *shad++ = (size & KASAN_SHADOW_MASK);
+    }
+    
+    /* Chunks of 8 bytes, invalid. */
+    n = redz / KASAN_SHADOW_SCALE_SIZE;
+    for (i = 0; i < n; i++) {
+        *shad++ = code;
+    }
+}
+__attribute__((no_sanitize("address")))
+void kasan_hart_init(struct sbi_scratch *scratch)
+{
+    sbi_scratch_write_type(scratch, bool, kasan_enabled_offset, true);
+}
+
+__attribute__((no_sanitize("address")))
+void kasan_md_init(struct sbi_scratch *scratch) 
+{
+    kasan_fw_base = scratch->fw_start;
+    kasan_rw_offset = scratch->fw_rw_offset;
+    kasan_fw_size = scratch->fw_size;
+    kasan_fw_start = kasan_fw_base + kasan_rw_offset;
+    kasan_fw_end = kasan_fw_base + kasan_fw_size;
+    __asan_shadow_memory_dynamic_address = KASAN_SHADOW_MEMORY_START - (kasan_fw_start >> KASAN_SHADOW_SCALE_SHIFT);
+    kasan_shadow_size = (kasan_fw_end - kasan_fw_start + 1) >> KASAN_SHADOW_SCALE_SHIFT;
+
+    _real_sbi_memset((void*)KASAN_SHADOW_MEMORY_START, 0, kasan_shadow_size);
+
+    kasan_enabled_offset = sbi_scratch_alloc_offset(sizeof(bool));
+}
+
+__attribute__((no_sanitize("address")))
+void kasan_ctors(void)
+{
+    extern unsigned long __CTOR_LIST__, __CTOR_END__;
+    size_t nentries, i;
+    unsigned long *ptr;
+
+    nentries = ((size_t)&__CTOR_END__ - (size_t)&__CTOR_LIST__) / sizeof(unsigned long);
+
+    ptr = &__CTOR_LIST__;
+    for (i = 0; i < nentries; i++) {
+        void (*func)(void);
+        func = (void *)(*ptr);
+        (*func)();
+        ptr++;
+    }
+}
+
+
+#define DEFINE_ASAN_LOAD_STORE(size) \
+    __attribute__((no_sanitize("address"))) void __asan_load##size(unsigned long addr) { \
+        kasan_shadow_check(addr, size, false, __RET_ADDR); \
+    } \
+    __attribute__((no_sanitize("address"))) void __asan_load##size##_noabort(unsigned long addr) { \
+        kasan_shadow_check(addr, size, false, __RET_ADDR); \
+    } \
+    __attribute__((no_sanitize("address"))) void __asan_store##size(unsigned long addr) { \
+        kasan_shadow_check(addr, size, true, __RET_ADDR); \
+    } \
+    __attribute__((no_sanitize("address"))) void __asan_store##size##_noabort(unsigned long addr) { \
+        kasan_shadow_check(addr, size, true, __RET_ADDR); \
+    }
+
+DEFINE_ASAN_LOAD_STORE(1)
+DEFINE_ASAN_LOAD_STORE(2)
+DEFINE_ASAN_LOAD_STORE(4)
+DEFINE_ASAN_LOAD_STORE(8)
+DEFINE_ASAN_LOAD_STORE(16)
+
+__attribute__((no_sanitize("address"))) void __asan_loadN(unsigned long addr, size_t size) {
+    kasan_shadow_check(addr, size, false, __RET_ADDR);
+}
+__attribute__((no_sanitize("address"))) void __asan_loadN_noabort(unsigned long addr, size_t size) {
+    kasan_shadow_check(addr, size, false, __RET_ADDR);
+}
+__attribute__((no_sanitize("address"))) void __asan_storeN(unsigned long addr, size_t size) {
+    kasan_shadow_check(addr, size, true, __RET_ADDR);
+}
+__attribute__((no_sanitize("address"))) void __asan_storeN_noabort(unsigned long addr, size_t size) {
+    kasan_shadow_check(addr, size, true, __RET_ADDR);
+}
+__attribute__((no_sanitize("address"))) void __asan_handle_no_return(void) {}
+
+struct __asan_global {
+    const void *beg;
+    size_t size;
+    size_t size_with_redzone;
+    const void *name;
+    const void *module_name;
+    unsigned long has_dynamic_init;
+    void *location;
+    unsigned long odr_indicator;
+};
+
+__attribute__((no_sanitize("address")))
+void __asan_register_globals(struct __asan_global *globals, size_t n) {
+    size_t i;
+    for (i = 0; i < n; i++) {
+        kasan_mark(globals[i].beg, globals[i].size, 
+                   globals[i].size_with_redzone, KASAN_GENERIC_REDZONE);
+    }
+}
+
+__attribute__((no_sanitize("address"))) 
+void __asan_unregister_globals(struct __asan_global *globals, size_t n) {
+}
+
+
+__attribute__((no_sanitize("address")))
+void *kasan_malloc_hook(struct sbi_heap_control *hpctrl, size_t size) {
+    size_t aligned_size;
+    size_t total_size;
+    size_t *size_ptr;
+    void *ptr;
+    void *user_ptr;
+
+    if (size == 0)
+        return NULL;
+
+    aligned_size = roundup(size, KASAN_SHADOW_SCALE_SIZE);
+    total_size = sizeof(size_t) + KASAN_HEAD_SIZE + aligned_size + KASAN_TAIL_SIZE;
+    
+    ptr = sbi_malloc_from(hpctrl, total_size);
+    if (ptr == NULL)
+        return NULL;
+
+    size_ptr = (size_t *)ptr;
+    *size_ptr = total_size;
+    
+    user_ptr = (uint8_t *)ptr + sizeof(size_t) + KASAN_HEAD_SIZE;
+    
+    kasan_shadow_Nbyte_fill(ptr, sizeof(size_t) + KASAN_HEAD_SIZE,
+                            KASAN_MALLOC_REDZONE);
+    
+    kasan_mark(user_ptr, size, aligned_size + KASAN_TAIL_SIZE,
+               KASAN_MALLOC_REDZONE);
+
+    return user_ptr;
+}
+
+__attribute__((no_sanitize("address")))
+void kasan_free_hook(struct sbi_heap_control *hpctrl, void *ptr) {
+    void *real_ptr;
+    size_t *size_ptr;
+    size_t total_size;
+    size_t poison_size;
+
+    if (ptr == NULL)
+        return;
+
+    real_ptr = (uint8_t *)ptr - (sizeof(size_t) + KASAN_HEAD_SIZE);
+    
+    size_ptr = (size_t *)real_ptr;
+    total_size = *size_ptr;
+    
+    sbi_free_from(hpctrl, real_ptr);
+    
+    poison_size = total_size - sizeof(size_t) - KASAN_HEAD_SIZE;
+    kasan_shadow_Nbyte_fill(ptr, poison_size, KASAN_HEAP_FREE);
+}
+
+
+#define DEFINE_ASAN_SET_SHADOW(byte)                        \
+  __attribute__((no_sanitize("address")))                   \
+  void __asan_set_shadow_##byte(void *addr, size_t size) {  \
+    _real_sbi_memset(addr, 0x##byte, size);                 \
+  }
+
+DEFINE_ASAN_SET_SHADOW(00)
+DEFINE_ASAN_SET_SHADOW(f1)
+DEFINE_ASAN_SET_SHADOW(f2)
+DEFINE_ASAN_SET_SHADOW(f3)
+
+__attribute__((no_sanitize("address")))
+void __asan_poison_stack_memory(const void *addr, size_t size) {
+    size = roundup(size, KASAN_SHADOW_SCALE_SIZE);
+    kasan_shadow_Nbyte_fill(addr, size, KASAN_STACK_MID);
+}
+
+__attribute__((no_sanitize("address")))
+void __asan_unpoison_stack_memory(const void *addr, size_t size) {
+    kasan_shadow_Nbyte_markvalid(addr, size);
+}
+
+__attribute__((no_sanitize("address"))) 
+void kasan_init(struct sbi_scratch *scratch) {
+    kasan_md_init(scratch);
+    kasan_early_boot_done = true;
+    kasan_ctors();
+    kasan_hart_init(scratch);
+}
+
+__attribute__((no_sanitize("address")))
+void sbi_kasan_get_shadow_region(struct sbi_domain_memregion *reg)
+{
+    sbi_domain_memregion_init(KASAN_SHADOW_MEMORY_START, kasan_shadow_size, 0, reg);
+}
+
+__attribute__((no_sanitize("address")))
+unsigned long sbi_kasan_get_shadow_size(void)
+{
+    return kasan_shadow_size;
+}
+
+#endif
diff --git a/lib/sbi/sbi_kasan_test.c b/lib/sbi/sbi_kasan_test.c
new file mode 100644
index 00000000..d5ecb93a
--- /dev/null
+++ b/lib/sbi/sbi_kasan_test.c
@@ -0,0 +1,66 @@
+/* 
+ * SPDX-License-Identifier: BSD-2-Clause
+ * Author: Marcos Oduardo <marcos.oduardo@gmail.com>
+ */
+
+#ifdef KASAN_TESTS_ENABLED
+#include <sbi/sbi_kasan_test.h>
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Warray-bounds"
+
+int global_int_arr[17];
+
+void globals_kasan_test(void) {
+    int overflow_idx = 18;
+    sbi_printf("\n*** KASAn global overflow test ***\n");
+    sbi_printf("Global array: %lu elements (int), base address: %p\n",
+               sizeof(global_int_arr) / sizeof(int), (void*)&global_int_arr);
+    sbi_printf("Writing integer to index %d (overflow)\n", overflow_idx);
+    global_int_arr[overflow_idx] = 0;
+}
+
+void heap_kasan_test(void) {
+    int bad_idx = 18;
+    int alloc_sz = 17;
+    unsigned char *mem_ptr = sbi_malloc(alloc_sz);
+    sbi_printf("\n*** KASAn heap overflow test ***\n");
+    sbi_printf("Allocated buffer: %d bytes at address %p\n", alloc_sz, mem_ptr);
+    sbi_printf("Writing to index %d (overflow by %d bytes)\n", bad_idx, bad_idx - alloc_sz + 1);
+    mem_ptr[bad_idx] = 0;
+}
+
+char stack_read_result;
+
+void stack_kasan_test(void) {
+    char local_buf[17];
+    int invalid_idx = 17;
+    sbi_printf("\n*** KASAn stack overflow test ***\n");
+    sbi_printf("Stack buffer size: %lu bytes, location: %p\n",
+               sizeof(local_buf), (void*)&local_buf);
+    sbi_printf("Reading from index %d (overflow by %d bytes)\n",
+               invalid_idx, invalid_idx - (int)sizeof(local_buf) + 1);
+    stack_read_result = local_buf[invalid_idx];
+}
+
+char global_byte_buf[17];
+
+void memset_kasan_test(void) {
+    int write_sz = 18;
+    sbi_printf("\n*** KASAn memset overflow test ***\n");
+    sbi_printf("Target buffer: %lu bytes at %p\n",
+               sizeof(global_byte_buf), (void*)&global_byte_buf);
+    sbi_printf("Memset size: %d bytes with pattern 0xaa (overflow by 1)\n", write_sz);
+    sbi_memset(global_byte_buf, 0xaa, write_sz);
+}
+
+void memcpy_kasan_test(void) {
+    char dest_buf[18];
+    int copy_sz = sizeof(dest_buf);
+    sbi_printf("\n*** KASAN memcpy overflow test ***\n");
+    sbi_printf("Source: %lu bytes (global_byte_buf)\n", sizeof(global_byte_buf));
+    sbi_printf("Copying %d bytes to local buffer (read overflow by 1)\n", copy_sz);
+    sbi_memcpy(dest_buf, global_byte_buf, copy_sz);
+}
+
+#pragma GCC diagnostic pop
+#endif
\ No newline at end of file
diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
index f4f13942..89be9fca 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -13,179 +13,275 @@
  */
 
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_kasan.h>
 
+#define __RET_ADDR ((unsigned long) __builtin_return_address(0))
 /*
   Provides sbi_strcmp for the completeness of supporting string functions.
   it is not recommended to use sbi_strcmp() but use sbi_strncmp instead.
 */
 int sbi_strcmp(const char *a, const char *b)
 {
-	/* search first diff or end of string */
-	for (; *a == *b && *a != '\0'; a++, b++)
-		;
+    /* search first diff or end of string */
+    for (; *a == *b && *a != '\0'; a++, b++)
+        ;
 
-	return *a - *b;
+    return *a - *b;
 }
 
 int sbi_strncmp(const char *a, const char *b, size_t count)
 {
-	/* search first diff or end of string */
-	for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
-		;
+    /* search first diff or end of string */
+    for (; count > 0 && *a == *b && *a != '\0'; a++, b++, count--)
+        ;
 
-	/* No difference till the end */
-	if (!count)
-		return 0;
+    /* No difference till the end */
+    if (!count)
+        return 0;
 
-	return *a - *b;
+    return *a - *b;
 }
 
 size_t sbi_strlen(const char *str)
 {
-	unsigned long ret = 0;
+    unsigned long ret = 0;
 
-	while (*str != '\0') {
-		ret++;
-		str++;
-	}
+    while (*str != '\0') {
+        ret++;
+        str++;
+    }
 
-	return ret;
+    return ret;
 }
 
 size_t sbi_strnlen(const char *str, size_t count)
 {
-	unsigned long ret = 0;
+    unsigned long ret = 0;
 
-	while (*str != '\0' && ret < count) {
-		ret++;
-		str++;
-	}
+    while (*str != '\0' && ret < count) {
+        ret++;
+        str++;
+    }
 
-	return ret;
+    return ret;
 }
 
 char *sbi_strcpy(char *dest, const char *src)
 {
-	char *ret = dest;
+    char *ret = dest;
 
-	while ((*dest++ = *src++) != '\0') {
-	}
-	return ret;
+    while ((*dest++ = *src++) != '\0') {
+    }
+    return ret;
 }
 
 char *sbi_strncpy(char *dest, const char *src, size_t count)
 {
-	char *tmp = dest;
-
-	while (count) {
-		if ((*tmp = *src) != 0)
-			src++;
-		tmp++;
-		count--;
-	}
-	return dest;
+    char *tmp = dest;
+
+    while (count) {
+        if ((*tmp = *src) != 0)
+            src++;
+        tmp++;
+        count--;
+    }
+    return dest;
 }
 
 char *sbi_strchr(const char *s, int c)
 {
-	while (*s != '\0' && *s != (char)c)
-		s++;
+    while (*s != '\0' && *s != (char)c)
+        s++;
 
-	if (*s == '\0')
-		return NULL;
-	else
-		return (char *)s;
+    if (*s == '\0')
+        return NULL;
+    else
+        return (char *)s;
 }
 
 char *sbi_strrchr(const char *s, int c)
 {
-	const char *last = s + sbi_strlen(s);
+    const char *last = s + sbi_strlen(s);
 
-	while (last > s && *last != (char)c)
-		last--;
+    while (last > s && *last != (char)c)
+        last--;
 
-	if (*last != (char)c)
-		return NULL;
-	else
-		return (char *)last;
+    if (*last != (char)c)
+        return NULL;
+    else
+        return (char *)last;
 }
-void *sbi_memset(void *s, int c, size_t count)
-{
-	char *temp = s;
+#ifdef KASAN_ENABLED
+__attribute__((no_sanitize("address")))
+void *_real_sbi_memset(void *s, int c, size_t count){
+        
+    char *temp = s;
+
+    while (count > 0) {
+        count--;
+        *temp++ = c;
+    }
 
-	while (count > 0) {
-		count--;
-		*temp++ = c;
-	}
+    return s;
 
-	return s;
 }
+__attribute__((no_sanitize("address")))
+void *_real_sbi_memcpy(void *dest, const void *src, size_t count){
+    
+    char *temp1   = dest;
+    const char *temp2 = src;
 
-void *sbi_memcpy(void *dest, const void *src, size_t count)
-{
-	char *temp1	  = dest;
-	const char *temp2 = src;
+    while (count > 0) {
+        *temp1++ = *temp2++;
+        count--;
+    }
 
-	while (count > 0) {
-		*temp1++ = *temp2++;
-		count--;
-	}
+    return dest;
 
-	return dest;
 }
 
-void *sbi_memmove(void *dest, const void *src, size_t count)
+__attribute__((no_sanitize("address")))
+void *_real_sbi_memmove(void *dest, const void *src, size_t count)
 {
-	char *temp1	  = (char *)dest;
-	const char *temp2 = (char *)src;
-
-	if (src == dest)
-		return dest;
-
-	if (dest < src) {
-		while (count > 0) {
-			*temp1++ = *temp2++;
-			count--;
-		}
-	} else {
-		temp1 = (char *)dest + count - 1;
-		temp2 = (char *)src + count - 1;
+    char *temp1   = (char *)dest;
+    const char *temp2 = (char *)src;
+
+    if (src == dest)
+        return dest;
+
+    if (dest < src) {
+        while (count > 0) {
+            *temp1++ = *temp2++;
+            count--;
+        }
+    } else {
+        temp1 = (char *)dest + count - 1;
+        temp2 = (char *)src + count - 1;
+
+        while (count > 0) {
+            *temp1-- = *temp2--;
+            count--;
+        }
+    }
+
+    return dest;
+}
+#endif
+
+__attribute__((no_sanitize("address")))
+void *sbi_memset(void *s, int c, unsigned long count) {
+    #ifdef KASAN_ENABLED
+    kasan_shadow_check((unsigned long)s, count, true, __RET_ADDR);
+    return _real_sbi_memset(s, c, count);
+    #endif
+    
+    char *temp = s;
+
+    while (count > 0) {
+        count--;
+        *temp++ = c;
+    }
+
+    return s;
+}
 
-		while (count > 0) {
-			*temp1-- = *temp2--;
-			count--;
-		}
-	}
+__attribute__((no_sanitize("address")))
+void *sbi_memcpy(void *dest, const void *src, unsigned long count) {
+    #ifdef KASAN_ENABLED
+    kasan_shadow_check((unsigned long)src, count, false, __RET_ADDR);
+    kasan_shadow_check((unsigned long)dest, count, true, __RET_ADDR); 
+    return _real_sbi_memcpy(dest, src, count);
+   
+    #endif
+    
+    char *temp1   = dest;
+    const char *temp2 = src;
+
+    while (count > 0) {
+        *temp1++ = *temp2++;
+        count--;
+    }
+
+    return dest;
+}
 
-	return dest;
+__attribute__((no_sanitize("address")))
+void *sbi_memmove(void *dest, const void *src, size_t count)
+{
+    #ifdef KASAN_ENABLED
+    kasan_shadow_check((unsigned long)src, count, false, __RET_ADDR);
+    kasan_shadow_check((unsigned long)dest, count, true, __RET_ADDR);
+    return _real_sbi_memmove(dest, src, count);
+    #endif
+    
+    char *temp1   = (char *)dest;
+    const char *temp2 = (char *)src;
+
+    if (src == dest)
+        return dest;
+
+    if (dest < src) {
+        while (count > 0) {
+            *temp1++ = *temp2++;
+            count--;
+        }
+    } else {
+        temp1 = (char *)dest + count - 1;
+        temp2 = (char *)src + count - 1;
+
+        while (count > 0) {
+            *temp1-- = *temp2--;
+            count--;
+        }
+    }
+
+    return dest;
 }
 
 int sbi_memcmp(const void *s1, const void *s2, size_t count)
 {
-	const char *temp1 = s1;
-	const char *temp2 = s2;
-
-	for (; count > 0 && (*temp1 == *temp2); count--) {
-		temp1++;
-		temp2++;
-	}
-
-	if (count > 0)
-		return *(unsigned char *)temp1 - *(unsigned char *)temp2;
-	else
-		return 0;
+    const char *temp1 = s1;
+    const char *temp2 = s2;
+
+    for (; count > 0 && (*temp1 == *temp2); count--) {
+        temp1++;
+        temp2++;
+    }
+
+    if (count > 0)
+        return *(unsigned char *)temp1 - *(unsigned char *)temp2;
+    else
+        return 0;
 }
 
 void *sbi_memchr(const void *s, int c, size_t count)
 {
-	const unsigned char *temp = s;
+    const unsigned char *temp = s;
 
-	while (count > 0) {
-		if ((unsigned char)c == *temp++) {
-			return (void *)(temp - 1);
-		}
-		count--;
-	}
+    while (count > 0) {
+        if ((unsigned char)c == *temp++) {
+            return (void *)(temp - 1);
+        }
+        count--;
+    }
 
-	return NULL;
+    return NULL;
+}
+
+__attribute__((no_sanitize("address")))
+void *memset(void *s, int c, size_t count)
+{
+    return sbi_memset(s, c, count);
 }
+
+__attribute__((no_sanitize("address")))
+void *memcpy(void *dest, const void *src, size_t count)
+{
+    return sbi_memcpy(dest, src, count);
+}
+
+__attribute__((no_sanitize("address")))
+void *memmove(void *dest, const void *src, size_t count)
+{
+    return sbi_memmove(dest, src, count);
+}
\ No newline at end of file
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index c4a8fee2..f1b696f4 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -37,7 +37,6 @@ ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
   FW_PAYLOAD_OFFSET=0x400000
 else
-  # This needs to be 2MB aligned for 64-bit system
-  FW_PAYLOAD_OFFSET=0x200000
+  FW_PAYLOAD_OFFSET=0x200000 # This needs to be 2MB aligned for 64-bit system
 endif
 FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
