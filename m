From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Fri, 20 Dec 2024 16:02:05 +0000
Subject: [RFC 6/7] opensbi: fixup endian access for fw_info
In-Reply-To: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
References: <20241220160206.1989527-1-ben.dooks@codethink.co.uk>
Message-ID: <20241220160206.1989527-7-ben.dooks@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

QEMU passes this as le32/le64, so add a new accessor for LE and
use that to get the fields from the fw_dynamic_info.

Reviewed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Reviewed-by: Roan Richmod <roan.richmond@codethink.co.uk>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 firmware/fw_dynamic.S    | 17 +++++++++--------
 include/sbi/fw_dynamic.h |  8 ++++++++
 include/sbi/riscv_asm.h  | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/firmware/fw_dynamic.S b/firmware/fw_dynamic.S
index 5ee2883..0f8958d 100644
--- a/firmware/fw_dynamic.S
+++ b/firmware/fw_dynamic.S
@@ -22,17 +22,17 @@
 	 */
 fw_boot_hart:
 	/* Sanity checks */
-	li	a1, FW_DYNAMIC_INFO_MAGIC_VALUE
 	REG_L	a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
+	li	a1, FW_DYNAMIC_INFO_MAGIC_VALUE
 	bne	a0, a1, _start_hang
+	REG_L_LE a1, a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
 	li	a1, FW_DYNAMIC_INFO_VERSION_MAX
-	REG_L	a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
 	bgt	a0, a1, _start_hang
 
 	/* Read boot HART id */
 	li	a1, FW_DYNAMIC_INFO_VERSION_2
 	blt	a0, a1, 2f
-	REG_L	a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
+	REG_L_LE a1, a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
 	ret
 2:	li	a0, -1
 	ret
@@ -53,23 +53,24 @@ fw_save_info:
 
 	/* Save version == 0x1 fields */
 	lla	a4, _dynamic_next_addr
-	REG_L	a3, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET(a2)
+	REG_L_LE a1, a3, FW_DYNAMIC_INFO_NEXT_ADDR_OFFSET(a2)
 	REG_S	a3, (a4)
 	lla	a4, _dynamic_next_mode
-	REG_L	a3, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET(a2)
+	REG_L_LE a1, a3, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET(a2)
 	REG_S	a3, (a4)
 	lla	a4, _dynamic_options
-	REG_L	a3, FW_DYNAMIC_INFO_OPTIONS_OFFSET(a2)
+	REG_L_LE a1, a3, FW_DYNAMIC_INFO_OPTIONS_OFFSET(a2)
 	REG_S	a3, (a4)
 
 	/* Save version == 0x2 fields */
 	li	a4, FW_DYNAMIC_INFO_VERSION_2
-	REG_L	a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
+	REG_L_LE a1, a3, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
 	blt	a3, a4, 2f
 	lla	a4, _dynamic_boot_hart
-	REG_L	a3, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
+	REG_L_LE a1, a3, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
 	REG_S	a3, (a4)
 2:
+	REG_L	a1, (a4)
 	ret
 
 	.section .entry, "ax", %progbits
diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index 45c4d5f..94e30e1 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -28,7 +28,15 @@
 #define FW_DYNAMIC_INFO_BOOT_HART_OFFSET	(5 * __SIZEOF_LONG__)
 
 /** Expected value of info magic ('OSBI' ascii string in hex) */
+#ifdef CONFIG_OPENSBI_BE
+#if __riscv_xlen == 64
+#define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4f53424900000000
+#else
+#define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4f534249
+#endif
+#else
 #define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4942534f
+#endif
 
 /** Maximum supported info version */
 #define FW_DYNAMIC_INFO_VERSION_2		0x2
diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 4605db2..434b586 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -37,6 +37,41 @@
 #define SZREG		__REG_SEL(8, 4)
 #define LGREG		__REG_SEL(3, 2)
 
+#ifdef  __ASSEMBLER__
+#ifdef CONFIG_OPENSBI_BE
+.macro REG_L_HELPER rtmp, rto, shift, offset
+	lbu	\rtmp, \offset
+	slli	\rtmp, \rtmp, \shift
+	or	\rto, \rto, \rtmp
+.endm
+#if __riscv_xlen == 64
+.macro  REG_L_LE  rtmp, rto, offset
+	lbu	\rto, 0 + \offset
+	REG_L_HELPER \rtmp, \rto, 8, 1 + \offset
+	REG_L_HELPER \rtmp, \rto, 16, 2 + \offset
+	REG_L_HELPER \rtmp, \rto, 24, 3 + \offset
+	REG_L_HELPER \rtmp, \rto, 32, 4 + \offset
+	REG_L_HELPER \rtmp, \rto, 40, 5 + \offset
+	REG_L_HELPER \rtmp, \rto, 48, 6 + \offset
+	REG_L_HELPER \rtmp, \rto, 56, 7 + \offset
+.endm
+#elif __riscv_xlen == 32
+.macro  REG_L_LE  rtmp, rto, offset
+	lbu	\rto, 0 + \offset
+	REG_L_HELPER \rtmp, \rto, 8, 1 + \offset
+	REG_L_HELPER \rtmp, \rto, 16, 2 + \offset
+	REG_L_HELPER \rtmp, \rto, 24, 3 + \offset
+.endm
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+#else
+.macro  REG_L_LE  rtmp, rto, offset
+  REG_L \rto, \offset
+.endm
+#endif
+#endif
+
 #if __SIZEOF_POINTER__ == 8
 #ifdef __ASSEMBLER__
 #define RISCV_PTR		.dword
-- 
2.37.2.352.g3c44437643


