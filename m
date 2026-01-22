Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4972DD6CFAC
	for <opensbi@archiver.kernel.org>; Thu, 22 Jan 2026 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yj4YnUYgMqVsorgwzc4+yz9ILz5zsBxawOv5F8L6Nc=; b=SjffRhFd/Afxc1
	G9+nQNJC5p/7qo5XN0h/0nkPYaWDg9zcluv2dJh2pT6nvZK/EJ+CkkWbv/jIvRRz72yMBraP0x9Rt
	DewpA9TDpSlmu7IVkvW8woJHPk7NlM3IEc4tuhLTcPSr96eAb99TdMzNYUQcxAybofV0981pkDFa8
	tNDTP8YeoZzsI1SDvhdDVPKtYqEfXIYSDoVMePBS2Aid79dCxxTCFfdBI2eKq48jFswEVINhg8CW0
	VW0Elk+I99mYXX2Q+xVom69wd6zS+RPPf02Ra3HKBMDu74tyLrpVQrQjK+juzghIyAKX1avjkEc4w
	GUiihgKijBr+91P3475Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj498-00000007tAA-3Voi;
	Thu, 22 Jan 2026 23:31:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj495-00000007t9X-2HXT
	for opensbi@lists.infradead.org;
	Thu, 22 Jan 2026 23:31:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so16448995e9.3
        for <opensbi@lists.infradead.org>; Thu, 22 Jan 2026 15:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769124681; x=1769729481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4AeeRsw57FUtUg+5cxCE4lnpW/b4P+eciefD0waV4c=;
        b=ZEj0hNrG41M6oXO8GyGFfI1hyuaQ7o3ZC6Yp6uUHb0hcewm5diDR4yFLE8vlzvZ6bE
         7NT2MeUpj8XAbV64HN7Gs2w55dt59Q3l/iKCnlTfiqf4c1KOiB+aBTu9gbhaqydve27j
         8ePzWybmc1DaZM/SlFqRk+rV3qJhtG3rQfaAkEFWCwDIVDtBFybZJ5AhieucDMWYRB5m
         GxU8xjA6KeHPLIaYJY/TkFuQyGMGthRTw5TMJEjvSt8QuvnFYEFAsHdpvNf1DOdpXKYa
         Icen64uzncpjF/0/lATh2gTuWIguVsiij5WT3i6UfBEnI1ve9VUKrxNBy080JWIGBSR2
         oOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769124681; x=1769729481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4AeeRsw57FUtUg+5cxCE4lnpW/b4P+eciefD0waV4c=;
        b=N6NIqbogvBbJcPzGGUKbzgokbdf/cB3BTTxfupCs4VG4KfzFzTLn5xqPsyyfS8eonK
         EeJQobpWyvNIJ9B37jqEf/8jfr0kgoERBCC4JnTXkVZYdzWv9Q7++XjNPLfpPMmr153c
         /hGDikLXWl6r1aSK/1rhQwAJdMrBvBQ93bZcF3qkqdi89MN2qAOmOlT6IKV/c7Dpdl4c
         SmQ+CMiANiVYzX0LnQ8iqPGKxI/xVhDUsXTIiI3Ba/VXhUUncC4gKb8ccYGQGTbjkQYr
         oVx7tbIPGBF2CMkO+0aJD7gd0GlWnlCK240tavHiOAQZnVmHea5dxNsnztR5IqSzHmYG
         lP4w==
X-Gm-Message-State: AOJu0YyezWtFH4fbVN1wYDOQ17jlmvgLkMFFZcocTnpWbEM10qjYvnMu
	yfj49ia6IrBPmKR9+tVbWjjp/Tw6ME1ZBPN5gXIgitbuAt+F5reXHQuXXgWAGw==
X-Gm-Gg: AZuq6aIBznRGI6pqh2ys9drTOoiu46OZ0LQ0xdf+D+NS9E19TCZVOx95ODgvfIPlxH0
	pY577xIoeL+Ru++6UyvH0UpAz8sIsMkc61tsg5V59dU1ts5sNJeLqFdHXbxVPjWFkm+aeBm0z2G
	VoX2lhC0Ln5Ps/a+c20G4YZMZLRc11m5KFgYESITr5AyTYXoQ6cPIoG/CfJRNrlyT4J5Xhmt1V9
	Q4pdWzMt15pFaFTp2a1mMcZ7FPCfEiIWk3rJy78FBNDh6pLv2QenfULsPgWhjWrJLeEen6YizUn
	I+jujxUxl6ycWS9EZVbwljFvl+sNeMKszWyMZwCnqi8ZehWUQ818D5SpUnC5TZiaeX/ZgLAtFaZ
	MfeXZ4nr1wR3kzAGhYWyowA7GBio88ocIytUA6rQZ+94Hp6BNVGS0RU01fUXAXV0nX0NNKtejVA
	oonAJgaYvXPEGuN2AWdJnHwYitgRzxWhKDzZgweCrWY6il5Ecnam2nZcRdlz0qUBobXPlOq9kL8
	aOO3h2y3BIdh77LYnrVzzX8nFjhNzaRyMOn3kamH1EMZS1al25KgHE=
X-Received: by 2002:a05:600c:35ce:b0:480:3338:2939 with SMTP id 5b1f17b1804b1-4804c9ce39bmr18543235e9.26.1769124681039;
        Thu, 22 Jan 2026 15:31:21 -0800 (PST)
Received: from LT-1H84393QVK.localdomain ([79.117.246.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d4faecbsm6986445e9.1.2026.01.22.15.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:31:19 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos.oduardo@gmail.com
Subject: [PATCH v2] lib: sbi: Add KASan implementation for OpenSBI
Date: Fri, 23 Jan 2026 00:31:03 +0100
Message-ID: <20260122233104.190844-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f7f86129-0118-4eaf-8699-69bd4398a0bb@sifive.com>
References: <f7f86129-0118-4eaf-8699-69bd4398a0bb@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_153123_828083_2854C26C 
X-CRM114-Status: GOOD (  28.66  )
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
 Makefile                     |  32 +++
 firmware/fw_base.S           |   4 +-
 firmware/fw_base.ldS         |   9 +-
 include/sbi/sbi_heap.h       |  22 +-
 include/sbi/sbi_kasan.h      |  48 ++++
 include/sbi/sbi_kasan_test.h |  17 ++
 include/sbi/sbi_string.h     |  13 +-
 include/sbi/sbi_types.h      |   1 +
 lib/sbi/objects.mk           |   3 +
 lib/sbi/sbi_heap.c           |   5 +-
 lib/sbi/sbi_init.c           |  18 ++
 lib/sbi/sbi_kasan.c          | 480 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_kasan_test.c     |  61 +++++
 lib/sbi/sbi_string.c         |  55 +++-
 platform/generic/objects.mk  |   5 +-
 15 files changed, 759 insertions(+), 14 deletions(-)
 create mode 100644 include/sbi/sbi_kasan.h
 create mode 100644 include/sbi/sbi_kasan_test.h
 create mode 100644 lib/sbi/sbi_kasan.c
 create mode 100644 lib/sbi/sbi_kasan_test.c

diff --git a/Makefile b/Makefile
index 46541063..a3319ef0 100644
--- a/Makefile
+++ b/Makefile
@@ -19,6 +19,13 @@ else
 READLINK ?= readlink
 endif
 
+MEMORY_START := 0x80000000
+MEMORY_END := 0x8fffffff
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
+CFLAGS += -DMEMORY_START=$(MEMORY_START)
+CFLAGS += -DMEMORY_END=$(MEMORY_END)
+# KASan-specific compiler options
+KASAN_SANITIZE_STACK := 1
+KASAN_SANITIZE_GLOBALS := 1
+KASAN_FLAGS += -fsanitize=kernel-address
+KASAN_FLAGS += -mllvm -asan-mapping-offset=$(KASAN_SHADOW_MAPPING_OFFSET)
+KASAN_FLAGS += -mllvm -asan-instrumentation-with-call-threshold=0
+KASAN_FLAGS += -mllvm -asan-stack=$(KASAN_SANITIZE_STACK)
+KASAN_FLAGS += -mllvm -asan-globals=$(KASAN_SANITIZE_GLOBALS)
+KASAN_FLAGS += -fno-sanitize-address-use-after-scope #unimplemented handler
+KASAN_FLAGS += -DKASAN_ENABLED
+ifeq ($(ENABLEKASANTESTS),y) 
+KASAN_FLAGS += -DKASAN_TESTS_ENABLED
+endif
+CFLAGS += $(KASAN_FLAGS)
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
index 12c7a844..6294f589 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -39,6 +39,13 @@
 		. = ALIGN(8);
 	}
 
+	.init_array :  /* Needed for KASan - NetBSD style */
+	{
+    	__CTOR_LIST__ = .;
+    	*(.init_array*)
+    	__CTOR_END__ = .;
+	}
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
index 00000000..1e9147e7
--- /dev/null
+++ b/include/sbi/sbi_kasan.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (c) 2018-2020 Maxime Villard, m00nbsd.net
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
+#ifndef __SBI_KASAN_H__
+#define __SBI_KASAN_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_heap_control;
+
+void * __kasan_memcpy(void *dst, const void *src, size_t size, unsigned long pc);
+void * __kasan_memset(void *buf, int c, size_t size, unsigned long pc);
+
+void *kasan_malloc_hook(struct sbi_heap_control *hpctrl, size_t size); 
+void kasan_free_hook(struct sbi_heap_control *hpctrl, void *ptr);
+
+extern char __global_ctors_start;
+extern char __global_ctors_end;
+
+void kasan_init(void);
+void kasan_ctors(void);
+
+#endif /* __SBI_KASAN_H__ */
\ No newline at end of file
diff --git a/include/sbi/sbi_kasan_test.h b/include/sbi/sbi_kasan_test.h
new file mode 100644
index 00000000..ab25c1e8
--- /dev/null
+++ b/include/sbi/sbi_kasan_test.h
@@ -0,0 +1,17 @@
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
+void heap_of_test(void);
+void stack_of_test(void);
+void glob_of_test(void);
+void memset_of_test(void);
+void memcpy_of_test(void);
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
index b8a7e6cb..fc9311aa 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -14,6 +14,7 @@
 
 /* clang-format off */
 
+typedef signed char 			int8_t;
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
index 5259064b..ce55e03d 100644
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
@@ -231,6 +235,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	rc = sbi_scratch_init(scratch);
 	if (rc)
 		sbi_hart_hang();
+	
+	#ifdef KASAN_ENABLED
+    kasan_init();
+	#endif
 
 	/* Note: This has to be second thing in coldboot init sequence */
 	rc = sbi_heap_init(scratch);
@@ -288,6 +296,16 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 
 	sbi_double_trap_init(scratch);
 
+	#ifdef KASAN_TESTS_ENABLED
+
+	stack_of_test();
+	heap_of_test();
+	glob_of_test();
+	memset_of_test();
+	memcpy_of_test();
+
+	#endif
+
 	rc = sbi_irqchip_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: irqchip init failed (error %d)\n",
diff --git a/lib/sbi/sbi_kasan.c b/lib/sbi/sbi_kasan.c
new file mode 100644
index 00000000..9f3c9370
--- /dev/null
+++ b/lib/sbi/sbi_kasan.c
@@ -0,0 +1,480 @@
+/*
+ * Copyright (c) 2018-2020 Maxime Villard, m00nbsd.net
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
+  (((addr) >> KASAN_SHADOW_SCALE_SHIFT) + KASAN_SHADOW_MAPPING_OFFSET)
+
+static bool kasan_enabled = false;
+
+#define ADDR_CROSSES_SCALE_BOUNDARY(addr, size) \
+    ((addr >> KASAN_SHADOW_SCALE_SHIFT) != ((addr + size - 1) >> KASAN_SHADOW_SCALE_SHIFT))
+
+__attribute__((no_sanitize("address")))
+static inline int8_t *kasan_md_addr_to_shad(const void *addr) {
+    return (int8_t *)(((unsigned long)(addr) >> KASAN_SHADOW_SCALE_SHIFT) + KASAN_SHADOW_MAPPING_OFFSET);
+}
+
+__attribute__((no_sanitize("address")))
+static inline bool kasan_md_unsupported(unsigned long addr) {
+    if (addr < MEMORY_START || addr > MEMORY_END) return true;
+    return false;
+}
+
+// 3. REPORTING
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
+    bool was_enabled = kasan_enabled;
+    kasan_enabled = false;
+
+    sbi_printf("\n");
+    sbi_printf("ASan: Unauthorized Access In %p: Addr %p [%lu byte%s, %s, %s]\n",
+        (void *)pc, (void *)addr, (unsigned long)size, (size > 1 ? "s" : ""),
+        (write ? "write" : "read"), kasan_code_name(code));
+        
+    kasan_enabled = was_enabled;
+}
+
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
+static inline void kasan_shadow_check(unsigned long addr, size_t size, bool write, unsigned long retaddr) {
+    uint8_t code = 0;
+    bool valid = true;
+
+    if (__predict_false(!kasan_enabled)) return;
+    if (__predict_false(size == 0)) return;
+    if (__predict_false(kasan_md_unsupported(addr))) return;
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
+
+
+__attribute__((no_sanitize("address")))
+void kasan_md_init(void) {
+    #ifdef KASAN_SHADOW_MEMORY_SIZE
+        size_t total_shadow_size = KASAN_SHADOW_MEMORY_SIZE;
+    #else
+        size_t total_shadow_size = (MEMORY_END - MEMORY_START + 1) >> KASAN_SHADOW_SCALE_SHIFT;
+    #endif
+
+    _real_sbi_memset((void*)KASAN_SHADOW_MEMORY_START, KASAN_SHADOW_RESERVED, total_shadow_size);
+    
+    unsigned long dram_shadow_start = ((((MEMORY_START)) >> KASAN_SHADOW_SCALE_SHIFT) + KASAN_SHADOW_MAPPING_OFFSET);
+    size_t dram_size = (MEMORY_END - MEMORY_START + 1) >> KASAN_SHADOW_SCALE_SHIFT;
+    _real_sbi_memset((void*)dram_shadow_start, 0, dram_size);
+
+    kasan_enabled = true;
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
+__attribute__((no_sanitize("address")))
+void * kasan_memcpy(void *dst, const void *src, size_t len) {
+    kasan_shadow_check((unsigned long)src, len, false, __RET_ADDR);
+    kasan_shadow_check((unsigned long)dst, len, true, __RET_ADDR);
+    return _real_sbi_memcpy(dst, src, len);
+}
+
+__attribute__((no_sanitize("address")))
+void * kasan_memset(void *buf, int c, size_t len) {
+    kasan_shadow_check((unsigned long)buf, len, true, __RET_ADDR);
+    return _real_sbi_memset(buf, c, len);
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
+// 8. GLOBALS
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
+    __builtin_memset(addr, 0x##byte, size);                 \
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
+
+__attribute__((no_sanitize("address"))) 
+void kasan_init(void) {
+    kasan_md_init();
+    kasan_ctors();
+}
+
+__attribute__((no_sanitize("address")))
+void * __kasan_memcpy(void *dst, const void *src, size_t size, unsigned long pc) {
+    (void)pc;
+    return kasan_memcpy(dst, src, size);
+}
+
+__attribute__((no_sanitize("address")))
+void * __kasan_memset(void *buf, int c, size_t size, unsigned long pc) {
+    (void)pc;
+    return kasan_memset(buf, c, size);
+}
diff --git a/lib/sbi/sbi_kasan_test.c b/lib/sbi/sbi_kasan_test.c
new file mode 100644
index 00000000..b0ee3405
--- /dev/null
+++ b/lib/sbi/sbi_kasan_test.c
@@ -0,0 +1,61 @@
+#ifdef KASAN_TESTS_ENABLED
+#include <sbi/sbi_kasan_test.h>
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Warray-bounds"
+
+int global_int_arr[17];
+
+void glob_of_test(void) {
+    int overflow_idx = 18;
+    sbi_printf("\n*** KASAn global overflow test ***\n");
+    sbi_printf("Global array: %lu elements (int), base address: %p\n",
+               sizeof(global_int_arr) / sizeof(int), (void*)&global_int_arr);
+    sbi_printf("Writing integer to index %d (overflow)\n", overflow_idx);
+    global_int_arr[overflow_idx] = 0;
+}
+
+void heap_of_test(void) {
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
+void stack_of_test(void) {
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
+void memset_of_test(void) {
+    int write_sz = 18;
+    sbi_printf("\n*** KASAn memset overflow test ***\n");
+    sbi_printf("Target buffer: %lu bytes at %p\n",
+               sizeof(global_byte_buf), (void*)&global_byte_buf);
+    sbi_printf("Memset size: %d bytes with pattern 0xaa (overflow by 1)\n", write_sz);
+    sbi_memset(global_byte_buf, 0xaa, write_sz);
+}
+
+void memcpy_of_test(void) {
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
index f4f13942..5d4e5ac3 100644
--- a/lib/sbi/sbi_string.c
+++ b/lib/sbi/sbi_string.c
@@ -14,6 +14,7 @@
 
 #include <sbi/sbi_string.h>
 
+#define __RET_ADDR ((unsigned long) __builtin_return_address(0))
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
+    return __kasan_memset(s, c, count, __RET_ADDR);
+    //addedd from SBI
+    #else
+    return _real_sbi_memset(s, c, count);
+    #endif
+}
+
+__attribute__((no_sanitize("address")))
+void *sbi_memcpy(void *dest, const void *src, unsigned long count) {
+    #ifdef KASAN_ENABLED
+    return __kasan_memcpy(dest, src, count, __RET_ADDR);
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
+    return __kasan_memset(s, c, count, __RET_ADDR);
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
+    return __kasan_memcpy(dest, src, count, __RET_ADDR);
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
