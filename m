From: Xiang W <wxjstz@126.com>
Date: Sat,  2 Mar 2024 15:42:20 +0800
Subject: [PATCH v5 1/8] firmware: remove copy-base relocation
In-Reply-To: <20240302074235.12643-1-wxjstz@126.com>
References: <20240302074235.12643-1-wxjstz@126.com>
Message-ID: <20240302074235.12643-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove copy-base relocations that are no longer needed.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 Makefile            |   8 +++-
 README.md           |   5 --
 docs/firmware/fw.md |   6 ---
 firmware/fw_base.S  | 110 ++------------------------------------------
 firmware/objects.mk |  11 -----
 5 files changed, 10 insertions(+), 130 deletions(-)

diff --git a/Makefile b/Makefile
index 680c19a..d8cffa6 100644
--- a/Makefile
+++ b/Makefile
@@ -179,6 +179,10 @@ CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
 CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
 
+ifneq ($(OPENSBI_LD_PIE),y)
+$(error Your linker does not support creating PIEs, opensbi requires this.)
+endif
+
 # Build Info:
 # OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
 # OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
@@ -356,7 +360,7 @@ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS		+=	$(RELAX_FLAG)
 CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
-CFLAGS		+=	-fno-pie -no-pie
+CFLAGS		+=	-fPIE -pie
 CFLAGS		+=	$(firmware-cflags-y)
 
 CPPFLAGS	+=	$(GENFLAGS)
@@ -365,6 +369,7 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
 
 ASFLAGS		=	-g -Wall -nostdlib
 ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ASFLAGS		+=	-fpic
 # Optionally supported flags
 ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 ASFLAGS		+=	-mno-save-restore
@@ -391,6 +396,7 @@ ifeq ($(OPENSBI_LD_EXCLUDE_LIBS),y)
 ELFFLAGS	+=	-Wl,--exclude-libs,ALL
 endif
 ELFFLAGS	+=	-Wl,--build-id=none
+ELFFLAGS	+=	-Wl,--no-dynamic-linker -Wl,-pie
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
 
diff --git a/README.md b/README.md
index 73de8ea..7a24801 100644
--- a/README.md
+++ b/README.md
@@ -274,11 +274,6 @@ make CC=riscv64-linux-gnu-gcc LLVM=1
 These variables must be passed for all the make invocations described in this
 document.
 
-NOTE: Using Clang with a `riscv*-linux-gnu` GNU binutils linker has been seen
-to produce broken binaries with missing relocations; it is therefore currently
-recommended that this combination be avoided or *FW_PIC=n* be used to disable
-building OpenSBI as a position-independent binary.
-
 Building with timestamp and compiler info
 -----------------------------------------
 
diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index 38351c8..2f4deb5 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -69,12 +69,6 @@ parameters:
   argument by the prior booting stage.
 * **FW_FDT_PADDING** - Optional zero bytes padding to the embedded flattened
   device tree binary file specified by **FW_FDT_PATH** option.
-* **FW_PIC** - "FW_PIC=y" generates position independent executable firmware
-  images. OpenSBI can run at arbitrary address with appropriate alignment.
-  Therefore, the original relocation mechanism ("FW_PIC=n") will be skipped.
-  In other words, OpenSBI will directly run at the load address without any
-  code movement. This option requires a toolchain with PIE support, and it
-  is on by default.
 
 Additionally, each firmware type as a set of type specific configuration
 parameters. Detailed information for each firmware type can be found in the
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 09894e6..cd94f15 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -14,8 +14,7 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap.h>
 
-#define BOOT_STATUS_RELOCATE_DONE	1
-#define BOOT_STATUS_BOOT_HART_DONE	2
+#define BOOT_STATUS_BOOT_HART_DONE	1
 
 .macro	MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
 	add	\__d0, \__s0, zero
@@ -31,16 +30,6 @@
 	add	\__d4, \__s4, zero
 .endm
 
-/*
- * If __start_reg <= __check_reg and __check_reg < __end_reg then
- *   jump to __pass
- */
-.macro BRANGE __start_reg, __end_reg, __check_reg, __jump_lable
-	blt	\__check_reg, \__start_reg, 999f
-	bge	\__check_reg, \__end_reg, 999f
-	j	\__jump_lable
-999:
-.endm
 
 	.section .entry, "ax", %progbits
 	.align 3
@@ -55,20 +44,19 @@ _start:
 	li	a7, -1
 	beq	a6, a7, _try_lottery
 	/* Jump to relocation wait loop if we are not boot hart */
-	bne	a0, a6, _wait_relocate_copy_done
+	bne	a0, a6, _wait_for_boot_hart
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
 	lla	a6, _relocate_lottery
 	li	a7, 1
 	amoadd.w a6, a7, (a6)
-	bnez	a6, _wait_relocate_copy_done
+	bnez	a6, _wait_for_boot_hart
 
 	/* Save load address */
 	lla	t0, _load_start
 	lla	t1, _fw_start
 	REG_S	t1, 0(t0)
 
-#ifdef FW_PIC
 	/* relocate the global table content */
 	lla	t0, _link_start
 	REG_L	t0, 0(t0)
@@ -90,100 +78,8 @@ _try_lottery:
 3:
 	addi	t0, t0, (REGBYTES * 3)
 	blt	t0, t1, 2b
-	j	_relocate_done
-_wait_relocate_copy_done:
-	j	_wait_for_boot_hart
-#else
-	/* Relocate if load address != link address */
-_relocate:
-	lla	t0, _link_start
-	REG_L	t0, 0(t0)
-	lla	t1, _link_end
-	REG_L	t1, 0(t1)
-	lla	t2, _load_start
-	REG_L	t2, 0(t2)
-	beq	t0, t2, _relocate_done
-	sub	t3, t1, t0
-	add	t3, t3, t2
-	lla	t4, _relocate_done
-	sub	t4, t4, t2
-	add	t4, t4, t0
-	blt	t2, t0, _relocate_copy_to_upper
-_relocate_copy_to_lower:
-	ble	t1, t2, _relocate_copy_to_lower_loop
-	lla	t3, _relocate_lottery
-	BRANGE	t2, t1, t3, _start_hang
-	lla	t3, _boot_status
-	BRANGE	t2, t1, t3, _start_hang
-	lla	t3, _relocate
-	lla	t5, _relocate_done
-	BRANGE	t2, t1, t3, _start_hang
-	BRANGE	t2, t1, t5, _start_hang
-	BRANGE  t3, t5, t2, _start_hang
-_relocate_copy_to_lower_loop:
-	REG_L	t3, 0(t2)
-	REG_S	t3, 0(t0)
-	add	t0, t0, __SIZEOF_POINTER__
-	add	t2, t2, __SIZEOF_POINTER__
-	blt	t0, t1, _relocate_copy_to_lower_loop
-	jr	t4
-_relocate_copy_to_upper:
-	ble	t3, t0, _relocate_copy_to_upper_loop
-	lla	t2, _relocate_lottery
-	BRANGE	t0, t3, t2, _start_hang
-	lla	t2, _boot_status
-	BRANGE	t0, t3, t2, _start_hang
-	lla	t2, _relocate
-	lla	t5, _relocate_done
-	BRANGE	t0, t3, t2, _start_hang
-	BRANGE	t0, t3, t5, _start_hang
-	BRANGE	t2, t5, t0, _start_hang
-_relocate_copy_to_upper_loop:
-	add	t3, t3, -__SIZEOF_POINTER__
-	add	t1, t1, -__SIZEOF_POINTER__
-	REG_L	t2, 0(t3)
-	REG_S	t2, 0(t1)
-	blt	t0, t1, _relocate_copy_to_upper_loop
-	jr	t4
-_wait_relocate_copy_done:
-	lla	t0, _fw_start
-	lla	t1, _link_start
-	REG_L	t1, 0(t1)
-	beq	t0, t1, _wait_for_boot_hart
-	lla	t2, _boot_status
-	lla	t3, _wait_for_boot_hart
-	sub	t3, t3, t0
-	add	t3, t3, t1
-1:
-	/* waitting for relocate copy done (_boot_status == 1) */
-	li	t4, BOOT_STATUS_RELOCATE_DONE
-	REG_L	t5, 0(t2)
-	/* Reduce the bus traffic so that boot hart may proceed faster */
-	nop
-	nop
-	nop
-	bgt     t4, t5, 1b
-	jr	t3
-#endif
 _relocate_done:
 
-	/*
-	 * Mark relocate copy done
-	 * Use _boot_status copy relative to the load address
-	 */
-	lla	t0, _boot_status
-#ifndef FW_PIC
-	lla	t1, _link_start
-	REG_L	t1, 0(t1)
-	lla	t2, _load_start
-	REG_L	t2, 0(t2)
-	sub	t0, t0, t1
-	add	t0, t0, t2
-#endif
-	li	t1, BOOT_STATUS_RELOCATE_DONE
-	REG_S	t1, 0(t0)
-	fence	rw, rw
-
 	/* At this point we are running from link address */
 
 	/* Reset all registers except ra, a0, a1 and a2 for boot HART */
diff --git a/firmware/objects.mk b/firmware/objects.mk
index 3ae0a28..e6b364b 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -13,17 +13,6 @@ firmware-cflags-y +=
 firmware-asflags-y +=
 firmware-ldflags-y +=
 
-ifndef FW_PIC
-FW_PIC := $(OPENSBI_LD_PIE)
-endif
-
-ifeq ($(FW_PIC),y)
-firmware-genflags-y +=	-DFW_PIC
-firmware-asflags-y  +=	-fpic
-firmware-cflags-y   +=	-fPIE -pie
-firmware-ldflags-y  +=	-Wl,--no-dynamic-linker -Wl,-pie
-endif
-
 ifdef FW_TEXT_START
 firmware-genflags-y += -DFW_TEXT_START=$(FW_TEXT_START)
 endif
-- 
2.43.0


