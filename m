From: Anup Patel <anup.patel@wdc.com>
Date: Thu, 29 Oct 2020 14:28:40 +0530
Subject: [PATCH] Makefile: Add option to use toolchain default ABI and ISA
 string
Message-ID: <20201029085840.2862264-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When PLATFORM_RISCV_ABI and PLATFORM_RISCV_ISA are not specified,
we force "-mabi=lp64 -march=rv64gc" for RV64 and force "-mabi=ilp32
-march=rv32gc" for RV32. This can prevent users from using the
toolchain default "-mabi" and "-march" options.

To allow using toolchain defaults, we add compile-time option
PLATFORM_RISCV_TOOLCHAIN_DEFAULT which when enabled forces the
top-level makefile to use toolchain default ABI and ISA string.

To enable the option, pass "PLATFORM_RISCV_TOOLCHAIN_DEFAULT=1"
to top-level make.

Reported-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 Makefile | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a231881..d6f097d 100644
--- a/Makefile
+++ b/Makefile
@@ -94,6 +94,8 @@ DTC		=	dtc
 
 # Guess the compillers xlen
 OPENSBI_CC_XLEN := $(shell TMP=`$(CC) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
+OPENSBI_CC_ABI := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-abi=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
+OPENSBI_CC_ISA := $(shell TMP=`$(CC) -v 2>&1 | sed -n 's/.*\(with\-arch=\([a-zA-Z0-9]*\)\).*/\2/p'`; echo $${TMP})
 
 # Setup platform XLEN
 ifndef PLATFORM_RISCV_XLEN
@@ -143,14 +145,22 @@ deps-y+=$(firmware-objs-path-y:.o=.dep)
 
 # Setup platform ABI, ISA and Code Model
 ifndef PLATFORM_RISCV_ABI
-  ifeq ($(PLATFORM_RISCV_XLEN), 32)
-    PLATFORM_RISCV_ABI = ilp$(PLATFORM_RISCV_XLEN)
+  ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
+    ifeq ($(PLATFORM_RISCV_XLEN), 32)
+      PLATFORM_RISCV_ABI = ilp$(PLATFORM_RISCV_XLEN)
+    else
+      PLATFORM_RISCV_ABI = lp$(PLATFORM_RISCV_XLEN)
+    endif
   else
-    PLATFORM_RISCV_ABI = lp$(PLATFORM_RISCV_XLEN)
+    PLATFORM_RISCV_ABI = $(OPENSBI_CC_ABI)
   endif
 endif
 ifndef PLATFORM_RISCV_ISA
-  PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
+  ifneq ($(PLATFORM_RISCV_TOOLCHAIN_DEFAULT), 1)
+    PLATFORM_RISCV_ISA = rv$(PLATFORM_RISCV_XLEN)imafdc
+  else
+    PLATFORM_RISCV_ISA = $(OPENSBI_CC_ISA)
+  endif
 endif
 ifndef PLATFORM_RISCV_CODE_MODEL
   PLATFORM_RISCV_CODE_MODEL = medany
-- 
2.25.1


