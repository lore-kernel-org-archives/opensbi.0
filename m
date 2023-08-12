From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 12 Aug 2023 13:06:48 +0800
Subject: [PATCH 2/2] platform: generic: allwinner: fix OV process for T-HEAD c9xx pmu
In-Reply-To: <20230812050648.345351-1-inochiama@outlook.com>
References: <IA1PR20MB4953955F17C7517BE21B0E7CBB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230812050648.345351-1-inochiama@outlook.com>
Message-ID: <IA1PR20MB4953B0129CC1E042708AC6B0BB11A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "haijiao.liu@sophgo.com" <haijiao.liu@sophgo.com>

T-HEAD c9xx pmu only needs to clear OV bits of MCOUNTEROF when MOIP bit
of MIP is set, so correct the MIP value check to avoid race conditions
during processing interrupt.

In addition, the S-mode scounterof only have OV bit set when the related
bits of MCOUNTERWEN is set, so also configure MCOUNTERWEN to allow kernel
to access valid SCOUNTEROF.

Signed-off-by: haijiao.liu at sophgo.com <haijiao.liu@sophgo.com>
---
 platform/generic/allwinner/sun20i-d1.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 0f0a9f3..d0f556e 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -239,9 +239,17 @@ static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
 	 * Otherwise, there will be race conditions where we may clear the bit
 	 * the software is yet to handle the interrupt.
 	 */
-	if (!(mip_val & THEAD_C9XX_MIP_MOIP))
+	if (mip_val & THEAD_C9XX_MIP_MOIP)
 		csr_clear(THEAD_C9XX_CSR_MCOUNTEROF, BIT(ctr_idx));
 
+	/**
+	 * This register is described in C920 document as the control register
+	 * for enabling writes to the superuser state counter. However, if the
+	 * corresponding bit is not set to 1, scounterof will always read as 0
+	 * when the counter register overflows.
+	 */
+	csr_set(THEAD_C9XX_CSR_MCOUNTERWEN, BIT(ctr_idx));
+
 	/**
 	 * SSCOFPMF uses the OF bit for enabling/disabling the interrupt,
 	 * while the C9XX has designated enable bits.
@@ -252,6 +260,7 @@ static void thead_c9xx_pmu_ctr_enable_irq(uint32_t ctr_idx)
 
 static void thead_c9xx_pmu_ctr_disable_irq(uint32_t ctr_idx)
 {
+	csr_clear(THEAD_C9XX_CSR_MCOUNTERWEN, BIT(ctr_idx));
 	csr_clear(THEAD_C9XX_CSR_MCOUNTERINTEN, BIT(ctr_idx));
 }
 
-- 
2.34.1


