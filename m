From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed,  6 Apr 2022 22:27:39 +0530
Subject: [PATCH v3 1/3] lib: sbi: Add Smstateen extension defines
In-Reply-To: <20220406165741.663-1-mchitale@ventanamicro.com>
References: <20220406165741.663-1-mchitale@ventanamicro.com>
Message-ID: <20220406165741.663-2-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Smstateen extension provides a mechanism to plug potential
covert channels which are opened by extensions that add to
processor state that may not get context-switched.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index c02aa8f..04d5621 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -345,6 +345,12 @@
 #define CSR_SIEH			0x114
 #define CSR_SIPH			0x154
 
+/* Supervisor stateen CSRs */
+#define CSR_SSTATEEN0			0x10C
+#define CSR_SSTATEEN1			0x10D
+#define CSR_SSTATEEN2			0x10E
+#define CSR_SSTATEEN3			0x10F
+
 /* ===== Hypervisor-level CSRs ===== */
 
 /* Hypervisor Trap Setup (H-extension) */
@@ -413,6 +419,16 @@
 #define CSR_VSIEH			0x214
 #define CSR_VSIPH			0x254
 
+/* Hypervisor stateen CSRs */
+#define CSR_HSTATEEN0			0x60C
+#define CSR_HSTATEEN0H			0x61C
+#define CSR_HSTATEEN1			0x60D
+#define CSR_HSTATEEN1H			0x61D
+#define CSR_HSTATEEN2			0x60E
+#define CSR_HSTATEEN2H			0x61E
+#define CSR_HSTATEEN3			0x60F
+#define CSR_HSTATEEN3H			0x61F
+
 /* ===== Machine-level CSRs ===== */
 
 /* Machine Information Registers */
@@ -686,6 +702,17 @@
 #define CSR_MVIEN			0x308
 #define CSR_MVIP			0x309
 
+/* Smstateen extension registers */
+/* Machine stateen CSRs */
+#define CSR_MSTATEEN0			0x30C
+#define CSR_MSTATEEN0H			0x31C
+#define CSR_MSTATEEN1			0x30D
+#define CSR_MSTATEEN1H			0x31D
+#define CSR_MSTATEEN2			0x30E
+#define CSR_MSTATEEN2H			0x31E
+#define CSR_MSTATEEN3			0x30F
+#define CSR_MSTATEEN3H			0x31F
+
 /* Machine-Level High-Half CSRs (AIA) */
 #define CSR_MIDELEGH			0x313
 #define CSR_MIEH			0x314
@@ -715,6 +742,23 @@
 #define CAUSE_VIRTUAL_INST_FAULT	0x16
 #define CAUSE_STORE_GUEST_PAGE_FAULT	0x17
 
+/* Common defines for all smstateen */
+#define SMSTATEEN_MAX_COUNT		4
+#define SMSTATEEN0_CS_SHIFT		0
+#define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
+#define SMSTATEEN0_FCSR_SHIFT		1
+#define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
+#define SMSTATEEN0_IMSIC_SHIFT		58
+#define SMSTATEEN0_IMSIC		(_ULL(1) << SMSTATEEN0_IMSIC_SHIFT)
+#define SMSTATEEN0_AIA_SHIFT		59
+#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
+#define SMSTATEEN0_SVSLCT_SHIFT		60
+#define SMSTATEEN0_SVSLCT		(_ULL(1) << SMSTATEEN0_SVSLCT_SHIFT)
+#define SMSTATEEN0_HSENVCFG_SHIFT	62
+#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
+#define SMSTATEEN_STATEN_SHIFT		63
+#define SMSTATEEN_STATEN		(_ULL(1) << SMSTATEEN_STATEN_SHIFT)
+
 /* ===== Instruction Encodings ===== */
 
 #define INSN_MATCH_LB			0x3
-- 
2.17.1


