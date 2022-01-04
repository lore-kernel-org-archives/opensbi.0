From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Jan 2022 15:39:40 +0530
Subject: [PATCH 01/13] include: sbi: Add AIA related CSR defines
In-Reply-To: <20220104100952.127448-1-apatel@ventanamicro.com>
References: <20220104100952.127448-1-apatel@ventanamicro.com>
Message-ID: <20220104100952.127448-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RISC-V AIA specification improves handling of per-HART local
interrupts in a backward compatible manner. This patch adds defines
for the new RISC-V AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 8a29f8e..03f85cb 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -173,6 +173,10 @@
 #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
 #endif
 
+#define TOPI_IID_SHIFT			16
+#define TOPI_IID_MASK			0xfff
+#define TOPI_IPRIO_MASK		0xff
+
 #if __riscv_xlen == 64
 #define MHPMEVENT_OF			(_UL(1) << 63)
 #define MHPMEVENT_MINH			(_UL(1) << 62)
@@ -303,6 +307,24 @@
 /* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT			0x150
+#define CSR_SIREG			0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI			0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM			0x158
+#define CSR_SCLREIPNUM			0x159
+#define CSR_SSETEIENUM			0x15a
+#define CSR_SCLREIENUM			0x15b
+#define CSR_STOPEI			0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH			0x114
+#define CSR_SIPH			0x154
+
 /* ===== Hypervisor-level CSRs ===== */
 
 /* Hypervisor Trap Setup (H-extension) */
@@ -338,6 +360,35 @@
 #define CSR_VSIP			0x244
 #define CSR_VSATP			0x280
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN			0x608
+#define CSR_HVICTL			0x609
+#define CSR_HVIPRIO1			0x646
+#define CSR_HVIPRIO2			0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT			0x250
+#define CSR_VSIREG			0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI			0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM		0x258
+#define CSR_VSCLREIPNUM		0x259
+#define CSR_VSSETEIENUM		0x25a
+#define CSR_VSCLREIENUM		0x25b
+#define CSR_VSTOPEI			0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH			0x613
+#define CSR_HVIENH			0x618
+#define CSR_HVIPH			0x655
+#define CSR_HVIPRIO1H			0x656
+#define CSR_HVIPRIO2H			0x657
+#define CSR_VSIEH			0x214
+#define CSR_VSIPH			0x254
+
 /* ===== Machine-level CSRs ===== */
 
 /* Machine Information Registers */
@@ -589,6 +640,31 @@
 #define CSR_DSCRATCH0			0x7b2
 #define CSR_DSCRATCH1			0x7b3
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT			0x350
+#define CSR_MIREG			0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI			0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM			0x358
+#define CSR_MCLREIPNUM			0x359
+#define CSR_MSETEIENUM			0x35a
+#define CSR_MCLREIENUM			0x35b
+#define CSR_MTOPEI			0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN			0x308
+#define CSR_MVIP			0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH			0x313
+#define CSR_MIEH			0x314
+#define CSR_MVIENH			0x318
+#define CSR_MVIPH			0x319
+#define CSR_MIPH			0x354
+
 /* ===== Trap/Exception Causes ===== */
 
 #define CAUSE_MISALIGNED_FETCH		0x0
-- 
2.25.1


