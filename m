From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Sat, 26 Nov 2022 08:52:20 +0000
Subject: [PATCH 1/3] lib: sbi: Optionally use ".insn" instead of ".word"
In-Reply-To: <cover.1669452733.git.research_trasio@irq.a4lg.com>
References: <cover.1669452733.git.research_trasio@irq.a4lg.com>
Message-ID: <d0ab3f9e2b778ce834a81ec56c3cfd9d0fe255d2.1669452733.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tsukasa OI <research_trasio@irq.a4lg.com>

".word" is used to emit a data word (32-bits) and recent GNU assembler
adds mapping symbol "$d" before ".word" to make sure that this is a data
word.  However, in lib/sbi/sbi_hfence.S, we use this to emit hfence.*
instructions (for assemblers that do not support hfence.*).  The mapping
symbol "$d" prevents these instructions being disassembled as code.

Instead, ".insn" is available to emit raw instructions but not all
assemblers with ".insn" support raw values.

This commit tests support of ".insn" with raw value in the Makefile
(AS_SUPPORT_INSN_RAW_DIRECTIVE) and optionally replaces ".word" with ".insn"
when ".insn" with raw value is supported.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 Makefile             |  8 ++++++++
 lib/sbi/sbi_hfence.S | 16 ++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 8db6eabe9fda..e942dfdc00bc 100644
--- a/Makefile
+++ b/Makefile
@@ -173,6 +173,9 @@ CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
 CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
 
+# Check whether the ".insn" directive on the assembler (with raw value) is supported
+AS_SUPPORT_INSN_RAW_DIRECTIVE := $(shell echo ".insn 0x1000000f" | $(AS) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -x assembler-with-cpp -c - -o /dev/null >/dev/null 2>&1 && echo y || echo n)
+
 # Build Info:
 # OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
 # OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
@@ -323,6 +326,11 @@ ifeq ($(BUILD_INFO),y)
 GENFLAGS	+=	-DOPENSBI_BUILD_TIME_STAMP="\"$(OPENSBI_BUILD_TIME_STAMP)\""
 GENFLAGS	+=	-DOPENSBI_BUILD_COMPILER_VERSION="\"$(OPENSBI_BUILD_COMPILER_VERSION)\""
 endif
+ifeq ($(AS_SUPPORT_INSN_RAW_DIRECTIVE),y)
+GENFLAGS    +=  -DRAW_INSN=".insn"
+else
+GENFLAGS    +=  -DRAW_INSN=".word"
+endif
 ifdef PLATFORM
 GENFLAGS	+=	-include $(KCONFIG_AUTOHEADER)
 endif
diff --git a/lib/sbi/sbi_hfence.S b/lib/sbi/sbi_hfence.S
index e11e6505383d..40882e036932 100644
--- a/lib/sbi/sbi_hfence.S
+++ b/lib/sbi/sbi_hfence.S
@@ -32,7 +32,7 @@ __sbi_hfence_gvma_vmid_gpa:
 	 * HFENCE.GVMA a0, a1
 	 * 0110001 01011 01010 000 00000 1110011
 	 */
-	.word 0x62b50073
+	RAW_INSN 0x62b50073
 	ret
 
 	.align 3
@@ -44,7 +44,7 @@ __sbi_hfence_gvma_vmid:
 	 * HFENCE.GVMA zero, a0
 	 * 0110001 01010 00000 000 00000 1110011
 	 */
-	.word 0x62a00073
+	RAW_INSN 0x62a00073
 	ret
 
 	.align 3
@@ -56,7 +56,7 @@ __sbi_hfence_gvma_gpa:
 	 * HFENCE.GVMA a0
 	 * 0110001 00000 01010 000 00000 1110011
 	 */
-	.word 0x62050073
+	RAW_INSN 0x62050073
 	ret
 
 	.align 3
@@ -68,7 +68,7 @@ __sbi_hfence_gvma_all:
 	 * HFENCE.GVMA
 	 * 0110001 00000 00000 000 00000 1110011
 	 */
-	.word 0x62000073
+	RAW_INSN 0x62000073
 	ret
 
 	/*
@@ -95,7 +95,7 @@ __sbi_hfence_vvma_asid_va:
 	 * HFENCE.VVMA a0, a1
 	 * 0010001 01011 01010 000 00000 1110011
 	 */
-	.word 0x22b50073
+	RAW_INSN 0x22b50073
 	ret
 
 	.align 3
@@ -107,7 +107,7 @@ __sbi_hfence_vvma_asid:
 	 * HFENCE.VVMA zero, a0
 	 * 0010001 01010 00000 000 00000 1110011
 	 */
-	.word 0x22a00073
+	RAW_INSN 0x22a00073
 	ret
 
 	.align 3
@@ -119,7 +119,7 @@ __sbi_hfence_vvma_va:
 	 * HFENCE.VVMA zero, a0
 	 * 0010001 00000 01010 000 00000 1110011
 	 */
-	.word 0x22050073
+	RAW_INSN 0x22050073
 	ret
 
 	.align 3
@@ -131,5 +131,5 @@ __sbi_hfence_vvma_all:
 	 * HFENCE.VVMA
 	 * 0010001 00000 00000 000 00000 1110011
 	 */
-	.word 0x22000073
+	RAW_INSN 0x22000073
 	ret
-- 
2.38.1


