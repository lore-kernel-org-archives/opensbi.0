From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Jun 2022 17:28:56 +0530
Subject: [PATCH] lib: utils: Remove CSRs that set/clear an IMSIC interrupt file bits
Message-ID: <20220616115856.1073885-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Based on architecture review committee feedback, the [m|s|vs]seteienum,
[m|s|vs]clreienum, [m|s|vs]seteipnum, and [m|s|vs]clreipnum CSRs are
removed in the latest AIA draft v0.3.0 specification.
(Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)

These CSRs were mostly for software convenience and software can always
use [m|s|vs]iselect and [m|s|vs]ireg CSRs to update the IMSIC interrupt
file bits.

We update the IMSIC programming as-per above to match the latest AIA
draft specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/riscv_encoding.h | 24 +++--------------
 lib/utils/irqchip/imsic.c    | 51 +++++++++++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 27 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index a164768..68b4a7f 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -336,14 +336,8 @@
 #define CSR_SIREG			0x151
 
 /* Supervisor-Level Interrupts (AIA) */
-#define CSR_STOPI			0xdb0
-
-/* Supervisor-Level IMSIC Interface (AIA) */
-#define CSR_SSETEIPNUM			0x158
-#define CSR_SCLREIPNUM			0x159
-#define CSR_SSETEIENUM			0x15a
-#define CSR_SCLREIENUM			0x15b
 #define CSR_STOPEI			0x15c
+#define CSR_STOPI			0xdb0
 
 /* Supervisor-Level High-Half CSRs (AIA) */
 #define CSR_SIEH			0x114
@@ -405,14 +399,8 @@
 #define CSR_VSIREG			0x251
 
 /* VS-Level Interrupts (H-extension with AIA) */
-#define CSR_VSTOPI			0xeb0
-
-/* VS-Level IMSIC Interface (H-extension with AIA) */
-#define CSR_VSSETEIPNUM		0x258
-#define CSR_VSCLREIPNUM		0x259
-#define CSR_VSSETEIENUM		0x25a
-#define CSR_VSCLREIENUM		0x25b
 #define CSR_VSTOPEI			0x25c
+#define CSR_VSTOPI			0xeb0
 
 /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
 #define CSR_HIDELEGH			0x613
@@ -693,14 +681,8 @@
 #define CSR_MIREG			0x351
 
 /* Machine-Level Interrupts (AIA) */
-#define CSR_MTOPI			0xfb0
-
-/* Machine-Level IMSIC Interface (AIA) */
-#define CSR_MSETEIPNUM			0x358
-#define CSR_MCLREIPNUM			0x359
-#define CSR_MSETEIENUM			0x35a
-#define CSR_MCLREIENUM			0x35b
 #define CSR_MTOPEI			0x35c
+#define CSR_MTOPI			0xfb0
 
 /* Virtual Interrupts for Supervisor Level (AIA) */
 #define CSR_MVIEN			0x308
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index b29a1e9..98f2cb6 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -38,10 +38,14 @@
 
 #define IMSIC_EIP63			0xbf
 
+#define IMSIC_EIPx_BITS			32
+
 #define IMSIC_EIE0			0xc0
 
 #define IMSIC_EIE63			0xff
 
+#define IMSIC_EIEx_BITS			32
+
 #define IMSIC_DISABLE_EIDELIVERY	0
 #define IMSIC_ENABLE_EIDELIVERY		1
 #define IMSIC_DISABLE_EITHRESHOLD	1
@@ -63,6 +67,18 @@ do { \
 	__v; \
 })
 
+#define imsic_csr_set(__c, __v)		\
+do { \
+	csr_write(CSR_MISELECT, __c); \
+	csr_set(CSR_MIREG, __v); \
+} while (0)
+
+#define imsic_csr_clear(__c, __v)	\
+do { \
+	csr_write(CSR_MISELECT, __c); \
+	csr_clear(CSR_MIREG, __v); \
+} while (0)
+
 static struct imsic_data *imsic_hartid2data[SBI_HARTMASK_MAX_BITS];
 static int imsic_hartid2file[SBI_HARTMASK_MAX_BITS];
 
@@ -140,6 +156,31 @@ static struct sbi_ipi_device imsic_ipi_device = {
 	.ipi_send	= imsic_ipi_send
 };
 
+static void imsic_local_eix_update(unsigned long base_id,
+				   unsigned long num_id, bool pend, bool val)
+{
+	unsigned long i, isel, ireg;
+	unsigned long id = base_id, last_id = base_id + num_id;
+
+	while (id < last_id) {
+		isel = id / __riscv_xlen;
+		isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+		isel += (pend) ? IMSIC_EIP0 : IMSIC_EIE0;
+
+		ireg = 0;
+		for (i = id & (__riscv_xlen - 1);
+		     (id < last_id) && (i < __riscv_xlen); i++) {
+			ireg |= BIT(i);
+			id++;
+		}
+
+		if (val)
+			imsic_csr_set(isel, ireg);
+		else
+			imsic_csr_clear(isel, ireg);
+	}
+}
+
 void imsic_local_irqchip_init(void)
 {
 	/*
@@ -158,12 +199,11 @@ void imsic_local_irqchip_init(void)
 	imsic_csr_write(IMSIC_EIDELIVERY, IMSIC_ENABLE_EIDELIVERY);
 
 	/* Enable IPI */
-	csr_write(CSR_MSETEIENUM, IMSIC_IPI_ID);
+	imsic_local_eix_update(IMSIC_IPI_ID, 1, false, true);
 }
 
 int imsic_warm_irqchip_init(void)
 {
-	unsigned long i;
 	struct imsic_data *imsic = imsic_hartid2data[current_hartid()];
 
 	/* Sanity checks */
@@ -171,11 +211,10 @@ int imsic_warm_irqchip_init(void)
 		return SBI_EINVAL;
 
 	/* Disable all interrupts */
-	for (i = 1; i <= imsic->num_ids; i++)
-		csr_write(CSR_MCLREIENUM, i);
+	imsic_local_eix_update(1, imsic->num_ids, false, false);
 
-	/* Clear IPI */
-	csr_write(CSR_MCLREIPNUM, IMSIC_IPI_ID);
+	/* Clear IPI pending */
+	imsic_local_eix_update(IMSIC_IPI_ID, 1, true, false);
 
 	/* Local IMSIC initialization */
 	imsic_local_irqchip_init();
-- 
2.34.1


