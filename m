From: Xiang W <wxjstz@126.com>
Date: Mon, 15 Jan 2024 23:19:20 +0800
Subject: [PATCH v2 4/4] firmware: fw_base.S: Simplify relocate
In-Reply-To: <20240115151930.392299-1-wxjstz@126.com>
References: <20240115151930.392299-1-wxjstz@126.com>
Message-ID: <20240115151930.392299-5-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Regardless of whether the FW_PIC macro is defined or not, the
starting address of load/link and the runtime offset are required.
Regardless of whether it is boot hart or not, the runtime offset
are required. so the code to obtain these values is moved forward.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 3d88704..18dd0c5 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -52,6 +52,12 @@ _start:
 	call	fw_boot_hart
 	add	a6, a0, zero
 	MOV_3R	a0, s0, a1, s1, a2, s2
+
+	lla	t2, _fw_start /* load start */
+	lla	t0, _link_start
+	REG_L	t0, 0(t0)     /* link start */
+	sub	t6, t2, t0    /* runtime offset */
+
 	li	a7, -1
 	beq	a6, a7, _try_lottery
 	/* Jump to relocation wait loop if we are not boot hart */
@@ -63,17 +69,7 @@ _try_lottery:
 	amoadd.w a6, a7, (a6)
 	bnez	a6, _wait_relocate_copy_done
 
-	/* Save load address */
-	lla	t0, _load_start
-	lla	t1, _fw_start
-	REG_S	t1, 0(t0)
-
 #ifdef FW_PIC
-	/* relocate the global table content */
-	lla	t0, _link_start
-	REG_L	t0, 0(t0)
-	/* t1 shall has the address of _fw_start */
-	sub	t2, t1, t0
 	lla	t0, __rel_dyn_start
 	lla	t1, __rel_dyn_end
 	beq	t0, t1, _relocate_done
@@ -83,8 +79,8 @@ _try_lottery:
 	bne	t5, t3, 3f
 	REG_L	t3, 0(t0)
 	REG_L	t5, (REGBYTES * 2)(t0)	/* t5 <-- addend */
-	add	t5, t5, t2
-	add	t3, t3, t2
+	add	t5, t5, t6
+	add	t3, t3, t6
 	REG_S	t5, 0(t3)		/* store runtime address to the GOT entry */
 
 3:
@@ -96,11 +92,7 @@ _wait_relocate_copy_done:
 #else
 	/* Relocate if load address != link address */
 _relocate:
-	lla	t0, _link_start
-	REG_L	t0, 0(t0)	  /* link start */
-	lla	t2, _fw_start	  /* load start */
 	beq	t0, t2, _relocate_done
-	sub	t6, t2, t0	  /* runtime offset */
 	lla	t3, _fw_reloc_end /* load end */
 	lla	t4, _relocate_done
 	sub	t1, t3, t6	  /* link end */
@@ -143,14 +135,10 @@ _relocate_copy_to_upper_loop:
 	blt	t0, t1, _relocate_copy_to_upper_loop
 	jr	t4
 _wait_relocate_copy_done:
-	lla	t0, _fw_start
-	lla	t1, _link_start
-	REG_L	t1, 0(t1)
-	beq	t0, t1, _wait_for_boot_hart
+	beq	t0, t2, _wait_for_boot_hart
 	lla	t2, _boot_status
 	lla	t3, _wait_for_boot_hart
-	sub	t3, t3, t0
-	add	t3, t3, t1
+	sub	t3, t3, t6
 1:
 	/* waitting for relocate copy done (_boot_status == 1) */
 	li	t4, BOOT_STATUS_RELOCATE_DONE
@@ -170,12 +158,7 @@ _relocate_done:
 	 */
 	lla	t0, _boot_status
 #ifndef FW_PIC
-	lla	t1, _link_start
-	REG_L	t1, 0(t1)
-	lla	t2, _load_start
-	REG_L	t2, 0(t2)
-	sub	t0, t0, t1
-	add	t0, t0, t2
+	add	t0, t0, t6
 #endif
 	li	t1, BOOT_STATUS_RELOCATE_DONE
 	REG_S	t1, 0(t0)
@@ -499,8 +482,6 @@ _relocate_lottery:
 	RISCV_PTR	0
 _boot_status:
 	RISCV_PTR	0
-_load_start:
-	RISCV_PTR	_fw_start
 _link_start:
 	RISCV_PTR	FW_TEXT_START
 
-- 
2.43.0


