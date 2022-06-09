From: dramforever <dramforever@live.com>
Date: Thu,  9 Jun 2022 15:07:29 +0800
Subject: [PATCH 1/3] include: sbi: Add mtinst/htinst psuedoinstructions
In-Reply-To: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <TYYP286MB14399472C06DD67BB8C55351C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add psuedoinstruction encodings written to mtinst/htinst for faults
caused by implicit memory access for VS-stage address translation

Signed-off-by: dramforever <dramforever@live.com>
---
 include/sbi/riscv_encoding.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index a164768..2292858 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -841,6 +841,26 @@
 #define INSN_MASK_FENCE_TSO		0xffffffff
 #define INSN_MATCH_FENCE_TSO		0x8330000f
 
+#if __riscv_xlen == 64
+
+/* 64-bit read for VS-stage address translation (RV64) */
+#define INSN_PSEUDO_VS_LOAD		0x00003000
+
+/* 64-bit write for VS-stage address translation (RV64) */
+#define INSN_PSEUDO_VS_STORE	0x00003020
+
+#elif __riscv_xlen == 32
+
+/* 32-bit read for VS-stage address translation (RV32) */
+#define INSN_PSEUDO_VS_LOAD		0x00002000
+
+/* 32-bit write for VS-stage address translation (RV32) */
+#define INSN_PSEUDO_VS_STORE	0x00002020
+
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
 #define INSN_16BIT_MASK			0x3
 #define INSN_32BIT_MASK			0x1c
 
-- 
2.36.0


