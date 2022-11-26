From: Tsukasa OI <research_trasio@irq.a4lg.com>
Date: Sat, 26 Nov 2022 08:52:22 +0000
Subject: [PATCH 3/3] Makefile: Optionally specify latest privileged specification
In-Reply-To: <cover.1669452733.git.research_trasio@irq.a4lg.com>
References: <cover.1669452733.git.research_trasio@irq.a4lg.com>
Message-ID: <45c05cbaf0655b762afd780a96a736a09f33ab4f.1669452733.git.research_trasio@irq.a4lg.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Although that OpenSBI can be compiled with compiler with the privileged
architecture version 1.11, it partially uses CSRs from the latest
privileged specification, version 1.12.

To enable fully-featured disassembling (through ELF attributes), this commit
queries whether the assembler supports -mpriv-spec=1.12 and adds
"-Wa,-mpriv-spec=1.12" to CFLAGS and ASFLAGS when supported.
---
 Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index e77648ff33c3..47e20ffa0661 100644
--- a/Makefile
+++ b/Makefile
@@ -164,6 +164,9 @@ else
 USE_LD_FLAG	=	-fuse-ld=bfd
 endif
 
+# Setup privileged architecture
+OPENSBI_PRIV_SPEC = 1.12
+
 # Check whether the linker supports creating PIEs
 OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
@@ -173,6 +176,9 @@ CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
 CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
 
+# Check whether the assembler and the compiler support the privileged architecture option (used by OpenSBI)
+CC_SUPPORT_PRIV_SPEC_LATEST := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -Wa,-mpriv-spec=$(OPENSBI_PRIV_SPEC) -x c -c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
+
 # Check whether the assembler support the H extension with .option arch,+h
 AS_SUPPORT_H_EXT_BY_OPTION_ARCH := $(shell echo ".option arch,+h" | $(AS) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -x assembler-with-cpp -c - -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
@@ -352,6 +358,9 @@ CFLAGS		+=	-mno-save-restore
 endif
 CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ifeq ($(CC_SUPPORT_PRIV_SPEC_LATEST),y)
+CFLAGS		+=	-Wa,-mpriv-spec=$(OPENSBI_PRIV_SPEC)
+endif
 CFLAGS		+=	$(RELAX_FLAG)
 CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
@@ -370,6 +379,9 @@ ASFLAGS		+=	-mno-save-restore
 endif
 ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ifeq ($(CC_SUPPORT_PRIV_SPEC_LATEST),y)
+ASFLAGS		+=	-Wa,-mpriv-spec=$(OPENSBI_PRIV_SPEC)
+endif
 ASFLAGS		+=	$(RELAX_FLAG)
 ifneq ($(CC_IS_CLANG),y)
 ifneq ($(RELAX_FLAG),)
-- 
2.38.1


