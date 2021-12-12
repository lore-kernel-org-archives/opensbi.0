From: Xiang W <wxjstz@126.com>
Date: Sun, 12 Dec 2021 20:39:33 +0800
Subject: [PATCH] Makefile: Improve the method to disable -m(no-)save-restore
 option
Message-ID: <20211212123933.188930-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

patch 69d7e53 disables the -m(no-)save-restore option for
clang, but clang11 supports this option. This patch uses the
output information of the compiler to check whether the
compiler supports this option.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index d89a0c5..062883e 100644
--- a/Makefile
+++ b/Makefile
@@ -150,6 +150,9 @@ endif
 # Check whether the linker supports creating PIEs
 OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
+# Check whether the compiler supports -m(no-)save-restore
+CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
+
 # Build Info:
 # OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
 # OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
@@ -276,8 +279,8 @@ GENFLAGS	+=	$(firmware-genflags-y)
 
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
-# CLANG-10 (or lower) does not support -m(no-)save-restore option
-ifneq ($(CC_IS_CLANG),y)
+# enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
+ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 CFLAGS		+=	-mno-save-restore
 endif
 CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
@@ -294,8 +297,8 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
 
 ASFLAGS		=	-g -Wall -nostdlib
 ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
-# CLANG-10 (or lower) does not support -m(no-)save-restore option
-ifneq ($(CC_IS_CLANG),y)
+# enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
+ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 ASFLAGS		+=	-mno-save-restore
 endif
 ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
-- 
2.30.2


