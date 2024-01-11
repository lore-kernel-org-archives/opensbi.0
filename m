From: Kalle Wachsmuth <kalle.wachsmuth@gmail.com>
Date: Thu, 11 Jan 2024 10:26:46 +0100
Subject: [PATCH] Makefile: don't pass -mstrict-align to clang
Message-ID: <20240111092646.97404-1-kalle.wachsmuth@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Support for that option will be added in LLVM 18:
https://github.com/llvm/llvm-project/commit/23ce5368409c760f3dd49d0f17f34772b0b869d8

Clang 17.0.6, however, will error when passed the
`-mstrict-align` flag.
(I'm using Homebrew Clang on macOS.)

Sticking to aligned accesses is the default
behavior anyway.

Signed-off-by: Kalle Wachsmuth <kalle.wachsmuth@gmail.com>
---
 Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index de4e73a..45332a0 100644
--- a/Makefile
+++ b/Makefile
@@ -337,7 +337,7 @@ CFLAGS		+=	-O0
 else
 CFLAGS		+=	-O2
 endif
-CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
+CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 # enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
 ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 CFLAGS		+=	-mno-save-restore
@@ -345,6 +345,9 @@ endif
 CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS		+=	$(RELAX_FLAG)
+ifneq ($(CC_IS_CLANG),y)
+CFLAGS		+=	-mstrict-align
+endif
 CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	-fno-pie -no-pie
@@ -355,7 +358,7 @@ CPPFLAGS	+=	$(platform-cppflags-y)
 CPPFLAGS	+=	$(firmware-cppflags-y)
 
 ASFLAGS		=	-g -Wall -nostdlib
-ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
+ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 # enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
 ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 ASFLAGS		+=	-mno-save-restore
@@ -364,6 +367,7 @@ ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
 ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 ASFLAGS		+=	$(RELAX_FLAG)
 ifneq ($(CC_IS_CLANG),y)
+CFLAGS		+=	-mstrict-align
 ifneq ($(RELAX_FLAG),)
 ASFLAGS		+=	-Wa,$(RELAX_FLAG)
 endif
-- 
2.39.3 (Apple Git-145)


