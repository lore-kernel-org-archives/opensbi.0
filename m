From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 22 Mar 2021 16:09:04 +0530
Subject: [PATCH] include: headers: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <20210322103904.1113381-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Marouene Boubakri <marouene.boubakri@nxp.com>

GCC has already a predefined macro __ASSEMBLER__ therefore, it can be
used without the need to define a new flag with -D__ASSEMBLY__.
This is useful when adding the library to projects having a build
system such one can build without the need to make changes.
THe build system does not use the Makefile in the sources tree.

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 Makefile                   |  2 +-
 include/sbi/fw_dynamic.h   |  2 +-
 include/sbi/riscv_asm.h    | 10 +++++-----
 include/sbi/sbi_const.h    |  2 +-
 include/sbi/sbi_platform.h |  2 +-
 include/sbi/sbi_scratch.h  |  2 +-
 include/sbi/sbi_trap.h     |  2 +-
 lib/utils/libfdt/fdt.h     |  2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 038cc99..eeffe6b 100644
--- a/Makefile
+++ b/Makefile
@@ -217,7 +217,7 @@ CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
 CPPFLAGS	+=	$(firmware-cppflags-y)
 
-ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
+ASFLAGS		=	-g -Wall -nostdlib
 ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 ASFLAGS		+=	-mno-save-restore -mstrict-align
 ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index 3c08831..25c0eb8 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -40,7 +40,7 @@
 
 /* clang-format on */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <sbi/sbi_types.h>
 
diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 10f31a7..9fa0fe5 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -14,7 +14,7 @@
 
 /* clang-format off */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)	x
 #else
 #define __ASM_STR(x)	#x
@@ -38,7 +38,7 @@
 #define LGREG		__REG_SEL(3, 2)
 
 #if __SIZEOF_POINTER__ == 8
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.dword
 #define RISCV_SZPTR		8
 #define RISCV_LGPTR		3
@@ -48,7 +48,7 @@
 #define RISCV_LGPTR		"3"
 #endif
 #elif __SIZEOF_POINTER__ == 4
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define RISCV_PTR		.word
 #define RISCV_SZPTR		4
 #define RISCV_LGPTR		2
@@ -79,7 +79,7 @@
 
 /* clang-format on */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define csr_swap(csr, val)                                              \
 	({                                                              \
@@ -182,6 +182,6 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/include/sbi/sbi_const.h b/include/sbi/sbi_const.h
index 3786654..fc75f18 100644
--- a/include/sbi/sbi_const.h
+++ b/include/sbi/sbi_const.h
@@ -22,7 +22,7 @@
 
 /* clang-format off */
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
 #else
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index dadbc1e..837a75d 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -38,7 +38,7 @@
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index e35122b..e83b234 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -43,7 +43,7 @@
 
 /* clang-format on */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <sbi/sbi_types.h>
 
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 5fb94f9..070d000 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -110,7 +110,7 @@
 /** Size (in bytes) of sbi_trap_info */
 #define SBI_TRAP_INFO_SIZE SBI_TRAP_INFO_OFFSET(last)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <sbi/sbi_types.h>
 
diff --git a/lib/utils/libfdt/fdt.h b/lib/utils/libfdt/fdt.h
index f2e6880..57fe566 100644
--- a/lib/utils/libfdt/fdt.h
+++ b/lib/utils/libfdt/fdt.h
@@ -7,7 +7,7 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct fdt_header {
 	fdt32_t magic;			 /* magic word FDT_MAGIC */
-- 
2.25.1


