From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Thu, 23 Sep 2021 10:29:57 +0800
Subject: [PATCH 2/2] platform/ae350: Initialize Coherent Manager as early as
 possible
Message-ID: <20210923022957.17840-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Coherent Manager will guarantee cache coherency as well as
the correctness of atomic extension instruction on Andes 45 series on ae350.

This feature needs to be enabled before the first
A extension instruction, thus initialize it as early as possible.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 platform/andes/ae350/platform.c | 32 ++++++++++++++++++
 platform/andes/ae350/platform.h | 60 ++++++++++++++++++---------------
 2 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index ae4ef71..f7d18d7 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -28,6 +28,38 @@ static struct plic_data plic = {
 	.num_src = AE350_PLIC_NUM_SOURCES,
 };
 
+static bool is_andestar45_series(void)
+{
+	uintptr_t marchid = csr_read(CSR_MARCHID);
+
+	return ((marchid & 0xF0) >> 4 == 4 &&
+			(marchid & 0xF) == 5) ? true : false;
+}
+
+/* per harts early initialization */
+void harts_early_init(void)
+{
+	uintptr_t mcache_ctl_val = csr_read(CSR_MCACHECTL);
+
+	if (is_andestar45_series()) {
+		if (!(mcache_ctl_val & V5_MCACHE_CTL_DC_COHEN_EN))
+			mcache_ctl_val |= V5_MCACHE_CTL_DC_COHEN_EN;
+
+		csr_write(CSR_MCACHECTL, mcache_ctl_val);
+
+		/*
+		 * Check DC_COHEN_EN, if cannot write to mcache_ctl,
+		 * we assume this bitmap not support L2 CM
+		 */
+		mcache_ctl_val = csr_read(CSR_MCACHECTL);
+		if ((mcache_ctl_val & V5_MCACHE_CTL_DC_COHEN_EN)) {
+			/* Wait for DC_COHSTA bit be set */
+			while (!(mcache_ctl_val & V5_MCACHE_CTL_DC_COHSTA_EN))
+				mcache_ctl_val = csr_read(CSR_MCACHECTL);
+		}
+	}
+}
+
 /* Platform final initialization. */
 static int ae350_final_init(bool cold_boot)
 {
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index f34ca0f..10ffaf0 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -30,11 +30,11 @@
 #define AE350_UART_REG_WIDTH		0
 
 /*Memory and Miscellaneous Registers*/
-#define CSR_MILMB		0x7c0
-#define CSR_MDLMB		0x7c1
+#define CSR_MILMB			0x7c0
+#define CSR_MDLMB			0x7c1
 #define CSR_MECC_CDOE		0x7c2
-#define CSR_MNVEC		0x7c3
-#define CSR_MPFTCTL		0x7c5
+#define CSR_MNVEC			0x7c3
+#define CSR_MPFTCTL			0x7c5
 #define CSR_MCACHECTL		0x7ca
 #define CSR_MCCTLBEGINADDR	0x7cb
 #define CSR_MCCTLCOMMAND	0x7cc
@@ -62,42 +62,42 @@ enum sbi_ext_andes_fid {
 #define V5_MMISC_CTL_BRPE_OFFSET                3
 #define V5_MMISC_CTL_MSA_OR_UNA_OFFSET          6
 #define V5_MMISC_CTL_NON_BLOCKING_OFFSET        8
-#define V5_MCACHE_CTL_L1I_PREFETCH_OFFSET       9
-#define V5_MCACHE_CTL_L1D_PREFETCH_OFFSET       10
-#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_1       13
-#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_2       14
 
 #define V5_MMISC_CTL_VEC_PLIC_EN        (1UL << V5_MMISC_CTL_VEC_PLIC_OFFSET)
 #define V5_MMISC_CTL_RVCOMPM_EN         (1UL << V5_MMISC_CTL_RVCOMPM_OFFSET)
 #define V5_MMISC_CTL_BRPE_EN            (1UL << V5_MMISC_CTL_BRPE_OFFSET)
 #define V5_MMISC_CTL_MSA_OR_UNA_EN      (1UL << V5_MMISC_CTL_MSA_OR_UNA_OFFSET)
 #define V5_MMISC_CTL_NON_BLOCKING_EN    (1UL << V5_MMISC_CTL_NON_BLOCKING_OFFSET)
-#define V5_MCACHE_CTL_L1I_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1I_PREFETCH_OFFSET)
-#define V5_MCACHE_CTL_L1D_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1D_PREFETCH_OFFSET)
-#define V5_MCACHE_CTL_DC_WAROUND_1_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_1)
-#define V5_MCACHE_CTL_DC_WAROUND_2_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_2)
 
 #define V5_MMISC_CTL_MASK  (V5_MMISC_CTL_VEC_PLIC_EN | V5_MMISC_CTL_RVCOMPM_EN \
 	| V5_MMISC_CTL_BRPE_EN | V5_MMISC_CTL_MSA_OR_UNA_EN | V5_MMISC_CTL_NON_BLOCKING_EN)
 
 /* nds mcache_ctl register*/
-#define V5_MCACHE_CTL_IC_EN_OFFSET      0
-#define V5_MCACHE_CTL_DC_EN_OFFSET      1
-#define V5_MCACHE_CTL_IC_ECCEN_OFFSET   2
-#define V5_MCACHE_CTL_DC_ECCEN_OFFSET   4
-#define V5_MCACHE_CTL_IC_RWECC_OFFSET   6
-#define V5_MCACHE_CTL_DC_RWECC_OFFSET   7
-#define V5_MCACHE_CTL_CCTL_SUEN_OFFSET  8
-
-/*nds cctl command*/
-#define V5_UCCTL_L1D_WBINVAL_ALL 6
-#define V5_UCCTL_L1D_WB_ALL 7
+#define V5_MCACHE_CTL_IC_EN_OFFSET				0
+#define V5_MCACHE_CTL_DC_EN_OFFSET				1
+#define V5_MCACHE_CTL_IC_ECCEN_OFFSET			2
+#define V5_MCACHE_CTL_DC_ECCEN_OFFSET			4
+#define V5_MCACHE_CTL_IC_RWECC_OFFSET			6
+#define V5_MCACHE_CTL_DC_RWECC_OFFSET			7
+#define V5_MCACHE_CTL_CCTL_SUEN_OFFSET			8
+#define V5_MCACHE_CTL_L1I_PREFETCH_OFFSET       9
+#define V5_MCACHE_CTL_L1D_PREFETCH_OFFSET       10
+#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_1       13
+#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_2       14
+#define V5_MCACHE_CTL_DC_COHEN_OFFSET			19
+#define V5_MCACHE_CTL_DC_COHSTA_OFFSET			20
 
-#define V5_MCACHE_CTL_IC_EN     (1UL << V5_MCACHE_CTL_IC_EN_OFFSET)
-#define V5_MCACHE_CTL_DC_EN     (1UL << V5_MCACHE_CTL_DC_EN_OFFSET)
-#define V5_MCACHE_CTL_IC_RWECC  (1UL << V5_MCACHE_CTL_IC_RWECC_OFFSET)
-#define V5_MCACHE_CTL_DC_RWECC  (1UL << V5_MCACHE_CTL_DC_RWECC_OFFSET)
-#define V5_MCACHE_CTL_CCTL_SUEN (1UL << V5_MCACHE_CTL_CCTL_SUEN_OFFSET)
+#define V5_MCACHE_CTL_L1I_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1I_PREFETCH_OFFSET)
+#define V5_MCACHE_CTL_L1D_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1D_PREFETCH_OFFSET)
+#define V5_MCACHE_CTL_DC_WAROUND_1_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_1)
+#define V5_MCACHE_CTL_DC_WAROUND_2_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_2)
+#define V5_MCACHE_CTL_DC_COHEN_EN		(1UL << V5_MCACHE_CTL_DC_COHEN_OFFSET)
+#define V5_MCACHE_CTL_DC_COHSTA_EN		(1UL << V5_MCACHE_CTL_DC_COHSTA_OFFSET)
+#define V5_MCACHE_CTL_IC_EN				(1UL << V5_MCACHE_CTL_IC_EN_OFFSET)
+#define V5_MCACHE_CTL_DC_EN				(1UL << V5_MCACHE_CTL_DC_EN_OFFSET)
+#define V5_MCACHE_CTL_IC_RWECC			(1UL << V5_MCACHE_CTL_IC_RWECC_OFFSET)
+#define V5_MCACHE_CTL_DC_RWECC			(1UL << V5_MCACHE_CTL_DC_RWECC_OFFSET)
+#define V5_MCACHE_CTL_CCTL_SUEN			(1UL << V5_MCACHE_CTL_CCTL_SUEN_OFFSET)
 
 #define V5_MCACHE_CTL_MASK (V5_MCACHE_CTL_IC_EN | V5_MCACHE_CTL_DC_EN \
 	| V5_MCACHE_CTL_IC_RWECC | V5_MCACHE_CTL_DC_RWECC \
@@ -105,6 +105,10 @@ enum sbi_ext_andes_fid {
 	| V5_MCACHE_CTL_L1D_PREFETCH_EN | V5_MCACHE_CTL_DC_WAROUND_1_EN \
 	| V5_MCACHE_CTL_DC_WAROUND_2_EN)
 
+/*nds cctl command*/
+#define V5_UCCTL_L1D_WBINVAL_ALL 6
+#define V5_UCCTL_L1D_WB_ALL 7
+
 #define V5_L2C_CTL_OFFSET           0x8
 #define V5_L2C_CTL_ENABLE_OFFSET    0
 #define V5_L2C_CTL_IPFDPT_OFFSET    3
-- 
2.17.0


