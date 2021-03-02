From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue,  2 Mar 2021 23:25:50 +0800
Subject: [PATCH 1/3] firmware: Support position independent execution
In-Reply-To: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
References: <1614698752-16085-1-git-send-email-vincent.chen@sifive.com>
Message-ID: <1614698752-16085-2-git-send-email-vincent.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable OpenSBI to support position independent execution. Because the
position independent code will cause an additional GOT reference when
accessing the global variables, it will reduce performance a bit. Therefore,
the position independent execution is disabled by default. Users can
through specifying "FW_PIC=y" on the make command to enable this feature.

In theory, after enabling position-independent execution, the OpenSBI
can run at arbitrary address with appropriate alignment. Therefore, the
original relocation mechanism will be skipped. In other words, OpenSBI will
directly run at the load address without any code movement.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 Makefile                | 10 +++++++
 firmware/fw_base.S      | 70 +++++++++++++++++++++++++++++++++++++++++++++----
 firmware/fw_base.ldS    | 13 +++++++++
 firmware/fw_jump.S      | 10 +++++++
 firmware/fw_payload.S   |  6 +++++
 include/sbi/riscv_elf.h |  9 +++++++
 6 files changed, 113 insertions(+), 5 deletions(-)
 create mode 100644 include/sbi/riscv_elf.h

diff --git a/Makefile b/Makefile
index d6f097d..0bebdf3 100644
--- a/Makefile
+++ b/Makefile
@@ -202,6 +202,9 @@ endif
 GENFLAGS	+=	$(libsbiutils-genflags-y)
 GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
+ifeq ($(FW_PIC),y)
+GENFLAGS	+=	-DFW_PIC
+endif
 
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
@@ -211,7 +214,11 @@ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
 CFLAGS		+=	$(GENFLAGS)
 CFLAGS		+=	$(platform-cflags-y)
 CFLAGS		+=	$(firmware-cflags-y)
+ifeq ($(FW_PIC),y)
+CFLAGS		+=	-fPIE -pie
+else
 CFLAGS		+=	-fno-pie -no-pie
+endif
 
 CPPFLAGS	+=	$(GENFLAGS)
 CPPFLAGS	+=	$(platform-cppflags-y)
@@ -231,6 +238,9 @@ ARFLAGS		=	rcs
 ELFFLAGS	+=	-Wl,--build-id=none -N -static-libgcc -lgcc
 ELFFLAGS	+=	$(platform-ldflags-y)
 ELFFLAGS	+=	$(firmware-ldflags-y)
+ifeq ($(FW_PIC),y)
+ELFFLAGS	+=	-Wl,--no-dynamic-linker
+endif
 
 MERGEFLAGS	+=	-r
 MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index ab33e11..8f8e5dc 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -9,6 +9,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/riscv_elf.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap.h>
@@ -41,6 +42,9 @@
 999:
 .endm
 
+#ifdef FW_PIC
+	.option pic
+#endif
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _start
@@ -48,7 +52,7 @@
 _start:
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
-	call	fw_boot_hart
+	lla	t0, _start_hang
 	add	a6, a0, zero
 	MOV_3R	a0, s0, a1, s1, a2, s2
 	li	a7, -1
@@ -57,16 +61,67 @@ _start:
 	bne	a0, a6, _wait_relocate_copy_done
 _try_lottery:
 	/* Jump to relocation wait loop if we don't get relocation lottery */
-	la	a6, _relocate_lottery
+	lla	a6, _relocate_lottery
 	li	a7, 1
 	amoadd.w a6, a7, (a6)
 	bnez	a6, _wait_relocate_copy_done
 
 	/* Save load address */
-	la	t0, _load_start
-	la	t1, _start
+	lla	t0, _load_start
+	lla	t1, _start
 	REG_S	t1, 0(t0)
 
+#ifdef FW_PIC
+	/* relocate the global table content */
+	lla	t0, _link_start
+	REG_L	t0, 0(t0)
+	sub	t2, t1, t0
+	lla	t3, _runtime_offset
+	REG_S	t2, (t3)
+	lla	t0, __rel_dyn_start
+	lla	t1, __rel_dyn_end
+	beq	t0, t1, _relocate_done
+	j	5f
+2:
+	REG_L	t5, -(REGBYTES*2)(t0)	/* t5 <-- relocation info:type */
+	li	t3, R_RISCV_RELATIVE	/* reloc type R_RISCV_RELATIVE */
+	bne	t5, t3, 3f
+	REG_L	t3, -(REGBYTES*3)(t0)
+	REG_L	t5, -(REGBYTES)(t0)	/* t5 <-- addend */
+	add	t5, t5, t2
+	add	t3, t3, t2
+	REG_S	t5, 0(t3)		/* store runtime address to the GOT entry */
+	j	5f
+
+3:
+	lla	t4, __dyn_sym_start
+
+4:
+	REG_L	t5, -(REGBYTES*2)(t0)	/* t5 <-- relocation info:type */
+	srli	t6, t5, SYM_INDEX	/* t6 <--- sym table index */
+	andi	t5, t5, 0xFF		/* t5 <--- relocation type */
+	li	t3, RELOC_TYPE
+	bne	t5, t3, 5f
+
+	/* address R_RISCV_64 or R_RISCV_32 cases*/
+	REG_L	t3, -(REGBYTES*3)(t0)
+	li	t5, SYM_SIZE
+	mul	t6, t6, t5
+	add	s5, t4, t6
+	REG_L	t6, -(REGBYTES)(t0)	/* t0 <-- addend */
+	REG_L	t5, REGBYTES(s5)
+	add	t5, t5, t6
+	add	t5, t5, t2		/* t5 <-- location to fix up in RAM */
+	add	t3, t3, t2		/* t3 <-- location to fix up in RAM */
+	REG_S	t5, 0(t3)		/* store runtime address to the variable */
+
+5:
+	addi	t0, t0, (REGBYTES*3)
+	ble	t0, t1, 2b
+	j	_relocate_done
+_wait_relocate_copy_done:
+	j	_wait_for_boot_hart
+#else
 	/* Relocate if load address != link address */
 _relocate:
 	la	t0, _link_start
@@ -137,6 +192,7 @@ _wait_relocate_copy_done:
 	nop
 	bgt     t4, t5, 1b
 	jr	t3
+#endif
 _relocate_done:
 
 	/*
@@ -144,12 +200,14 @@ _relocate_done:
 	 * Use _boot_status copy relative to the load address
 	 */
 	la	t0, _boot_status
+#ifndef FW_PIC
 	la	t1, _link_start
 	REG_L	t1, 0(t1)
 	la	t2, _load_start
 	REG_L	t2, 0(t2)
 	sub	t0, t0, t1
 	add	t0, t0, t2
+#endif
 	li	t1, BOOT_STATUS_RELOCATE_DONE
 	REG_S	t1, 0(t0)
 	fence	rw, rw
@@ -446,6 +504,8 @@ _skip_trap_exit_rv32_hyp:
 	j	_start_hang
 
 	.align 3
+_runtime_offset:
+	RISCV_PTR	0
 _relocate_lottery:
 	RISCV_PTR	0
 _boot_status:
@@ -453,7 +513,7 @@ _boot_status:
 _load_start:
 	RISCV_PTR	_fw_start
 _link_start:
-	RISCV_PTR	_fw_start
+	RISCV_PTR	FW_TEXT_START
 _link_end:
 	RISCV_PTR	_fw_reloc_end
 
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 0ac75f2..3904959 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -61,6 +61,19 @@
 		PROVIDE(_data_end = .);
 	}
 
+	.dynsym : {
+	        PROVIDE(__dyn_sym_start = .);
+	        *(.dynsym)
+	        PROVIDE(__dyn_sym_end = .);
+	}
+
+	.rela.dyn : {
+	        PROVIDE(__rel_dyn_start = .);
+	        *(.rela*)
+		. = ALIGN(8);
+	        PROVIDE(__rel_dyn_end = .);
+	}
+
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
 	.bss :
diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
index 8553f8c..3cce3f7 100644
--- a/firmware/fw_jump.S
+++ b/firmware/fw_jump.S
@@ -46,6 +46,11 @@ fw_save_info:
 fw_next_arg1:
 #ifdef FW_JUMP_FDT_ADDR
 	li	a0, FW_JUMP_FDT_ADDR
+#ifdef FW_PIC
+	la	a1, _runtime_offset
+	REG_L	a1, (a1)
+	add	a0, a0, a1
+#endif
 #else
 	add	a0, a1, zero
 #endif
@@ -61,6 +66,11 @@ fw_next_arg1:
 fw_next_addr:
 	la	a0, _jump_addr
 	REG_L	a0, (a0)
+#ifdef FW_PIC
+	la	a1, _runtime_offset
+	REG_L	a1, (a1)
+	add	a0, a0, a1
+#endif
 	ret
 
 	.section .entry, "ax", %progbits
diff --git a/firmware/fw_payload.S b/firmware/fw_payload.S
index 1ef121e..18b51d0 100644
--- a/firmware/fw_payload.S
+++ b/firmware/fw_payload.S
@@ -46,6 +46,12 @@ fw_save_info:
 fw_next_arg1:
 #ifdef FW_PAYLOAD_FDT_ADDR
 	li	a0, FW_PAYLOAD_FDT_ADDR
+#ifdef FW_PIC
+	la      a1, _runtime_offset
+	REG_L   a1, (a1)
+	add     a0, a0, a1
+#endif
+
 #else
 	add	a0, a1, zero
 #endif
diff --git a/include/sbi/riscv_elf.h b/include/sbi/riscv_elf.h
new file mode 100644
index 0000000..cf211ac
--- /dev/null
+++ b/include/sbi/riscv_elf.h
@@ -0,0 +1,9 @@
+#include <sbi/riscv_asm.h>
+
+#define R_RISCV_32		1
+#define R_RISCV_64		2
+#define R_RISCV_RELATIVE	3
+
+#define RELOC_TYPE		__REG_SEL(R_RISCV_64, R_RISCV_32)
+#define SYM_INDEX		__REG_SEL(0x20,	0x8)
+#define SYM_SIZE		__REG_SEL(0x18,0x10)
-- 
2.7.4


