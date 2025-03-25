From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:29 -0700
Subject: [PATCH 06/10] platform: generic: Modify platform ops instead of using hooks
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-7-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch all existing platform overrides to use the helper pattern instead
of the platform hooks. After this commit, only the .match_table and
.init members of struct platform_override are used.

There are two minor behavioral differences:
 - For Allwinner D1, fdt_add_cpu_idle_states() is now called before the
   body of generic_final_init(). This should have no functional impact.
 - For StarFive JH7110, if the /chosen/starfive,boot-hart-id property is
   missing, the code now falls back to using generic_coldboot_harts,
   instead of accepting any hart.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/allwinner/sun20i-d1.c     | 51 ++++++++++++++--------
 platform/generic/andes/ae350.c             | 23 +++++++---
 platform/generic/andes/andes_pmu.c         | 13 ++++--
 platform/generic/andes/andes_sbi.c         |  3 +-
 platform/generic/include/andes/andes_pmu.h |  7 +--
 platform/generic/include/andes/andes_sbi.h |  4 +-
 platform/generic/renesas/rzfive/rzfive.c   | 34 ++++++++++-----
 platform/generic/sifive/fu540.c            | 11 ++++-
 platform/generic/sifive/fu740.c            | 18 +++++---
 platform/generic/sophgo/sg2042.c           | 29 +++++++++---
 platform/generic/starfive/jh7110.c         | 17 ++++----
 platform/generic/thead/thead-generic.c     | 30 ++++++++-----
 12 files changed, 160 insertions(+), 80 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index c31ebdb2..7e8bda89 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -165,17 +166,6 @@ static const struct sbi_hsm_device sun20i_d1_ppu = {
 	.hart_resume	= sun20i_d1_hart_resume,
 };
 
-static int sun20i_d1_final_init(bool cold_boot, void *fdt,
-				const struct fdt_match *match)
-{
-	if (cold_boot) {
-		sun20i_d1_riscv_cfg_init();
-		sbi_hsm_set_device(&sun20i_d1_ppu);
-	}
-
-	return 0;
-}
-
 static const struct sbi_cpu_idle_state sun20i_d1_cpu_idle_states[] = {
 	{
 		.name			= "cpu-nonretentive",
@@ -189,14 +179,32 @@ static const struct sbi_cpu_idle_state sun20i_d1_cpu_idle_states[] = {
 	{ }
 };
 
-static int sun20i_d1_fdt_fixup(void *fdt, const struct fdt_match *match)
+static int sun20i_d1_final_init(bool cold_boot)
 {
-	return fdt_add_cpu_idle_states(fdt, sun20i_d1_cpu_idle_states);
+	int rc;
+
+	if (cold_boot) {
+		void *fdt = fdt_get_address_rw();
+
+		sun20i_d1_riscv_cfg_init();
+		sbi_hsm_set_device(&sun20i_d1_ppu);
+
+		rc = fdt_add_cpu_idle_states(fdt, sun20i_d1_cpu_idle_states);
+		if (rc)
+			return rc;
+	}
+
+	return generic_final_init(cold_boot);
 }
 
-static int sun20i_d1_extensions_init(const struct fdt_match *match,
-				     struct sbi_hart_features *hfeatures)
+static int sun20i_d1_extensions_init(struct sbi_hart_features *hfeatures)
 {
+	int rc;
+
+	rc = generic_extensions_init(hfeatures);
+	if (rc)
+		return rc;
+
 	thead_c9xx_register_pmu_device();
 
 	/* auto-detection doesn't work on t-head c9xx cores */
@@ -207,6 +215,15 @@ static int sun20i_d1_extensions_init(const struct fdt_match *match,
 	return 0;
 }
 
+static int sun20i_d1_platform_init(const void *fdt, int nodeoff,
+				   const struct fdt_match *match)
+{
+	generic_platform_ops.final_init = sun20i_d1_final_init;
+	generic_platform_ops.extensions_init = sun20i_d1_extensions_init;
+
+	return 0;
+}
+
 static const struct fdt_match sun20i_d1_match[] = {
 	{ .compatible = "allwinner,sun20i-d1" },
 	{ },
@@ -214,7 +231,5 @@ static const struct fdt_match sun20i_d1_match[] = {
 
 const struct platform_override sun20i_d1 = {
 	.match_table	= sun20i_d1_match,
-	.final_init	= sun20i_d1_final_init,
-	.fdt_fixup	= sun20i_d1_fdt_fixup,
-	.extensions_init = sun20i_d1_extensions_init,
+	.init		= sun20i_d1_platform_init,
 };
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 0da3ae51..31b99798 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -102,11 +102,23 @@ static void ae350_hsm_device_init(const void *fdt)
 	}
 }
 
-static int ae350_final_init(bool cold_boot, void *fdt,
-			    const struct fdt_match *match)
+static int ae350_final_init(bool cold_boot)
 {
-	if (cold_boot)
+	if (cold_boot) {
+		const void *fdt = fdt_get_address();
+
 		ae350_hsm_device_init(fdt);
+	}
+
+	return generic_final_init(cold_boot);
+}
+
+static int ae350_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.final_init = ae350_final_init;
+	generic_platform_ops.extensions_init = andes_pmu_extensions_init;
+	generic_platform_ops.pmu_init = andes_pmu_init;
+	generic_platform_ops.vendor_ext_provider = andes_sbi_vendor_ext_provider;
 
 	return 0;
 }
@@ -118,8 +130,5 @@ static const struct fdt_match andes_ae350_match[] = {
 
 const struct platform_override andes_ae350 = {
 	.match_table = andes_ae350_match,
-	.final_init  = ae350_final_init,
-	.extensions_init = andes_pmu_extensions_init,
-	.pmu_init = andes_pmu_init,
-	.vendor_ext_provider = andes_sbi_vendor_ext_provider,
+	.init = ae350_platform_init,
 };
diff --git a/platform/generic/andes/andes_pmu.c b/platform/generic/andes/andes_pmu.c
index a075e0e5..9eee4edc 100644
--- a/platform/generic/andes/andes_pmu.c
+++ b/platform/generic/andes/andes_pmu.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_pmu.h>
 #include <libfdt.h>
+#include <platform_override.h>
 
 static void andes_hw_counter_enable_irq(uint32_t ctr_idx)
 {
@@ -57,10 +58,14 @@ static struct sbi_pmu_device andes_pmu = {
 	.hw_counter_filter_mode = andes_hw_counter_filter_mode
 };
 
-int andes_pmu_extensions_init(const struct fdt_match *match,
-			      struct sbi_hart_features *hfeatures)
+int andes_pmu_extensions_init(struct sbi_hart_features *hfeatures)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	int rc;
+
+	rc = generic_extensions_init(hfeatures);
+	if (rc)
+		return rc;
 
 	if (!has_andes_pmu())
 		return 0;
@@ -82,12 +87,12 @@ int andes_pmu_extensions_init(const struct fdt_match *match,
 	return 0;
 }
 
-int andes_pmu_init(const struct fdt_match *match)
+int andes_pmu_init(void)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_XANDESPMU))
 		sbi_pmu_set_device(&andes_pmu);
 
-	return 0;
+	return generic_pmu_init();
 }
diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
index c3ea7f87..f68ac908 100644
--- a/platform/generic/andes/andes_sbi.c
+++ b/platform/generic/andes/andes_sbi.c
@@ -38,8 +38,7 @@ static bool andes_apply_iocp_sw_workaround(void)
 
 int andes_sbi_vendor_ext_provider(long funcid,
 				  struct sbi_trap_regs *regs,
-				  struct sbi_ecall_return *out,
-				  const struct fdt_match *match)
+				  struct sbi_ecall_return *out)
 {
 	int ret = 0;
 
diff --git a/platform/generic/include/andes/andes_pmu.h b/platform/generic/include/andes/andes_pmu.h
index c600d35f..ad4564a6 100644
--- a/platform/generic/include/andes/andes_pmu.h
+++ b/platform/generic/include/andes/andes_pmu.h
@@ -8,11 +8,8 @@
 #define _RISCV_ANDES_PMU_H
 
 #include <sbi/sbi_hart.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/fdt/fdt_pmu.h>
 
-int andes_pmu_init(const struct fdt_match *match);
-int andes_pmu_extensions_init(const struct fdt_match *match,
-			      struct sbi_hart_features *hfeatures);
+int andes_pmu_init(void);
+int andes_pmu_extensions_init(struct sbi_hart_features *hfeatures);
 
 #endif /* _RISCV_ANDES_PMU_H */
diff --git a/platform/generic/include/andes/andes_sbi.h b/platform/generic/include/andes/andes_sbi.h
index 1288af81..81ef9d5e 100644
--- a/platform/generic/include/andes/andes_sbi.h
+++ b/platform/generic/include/andes/andes_sbi.h
@@ -5,11 +5,9 @@
 
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_trap.h>
-#include <sbi_utils/fdt/fdt_helper.h>
 
 int andes_sbi_vendor_ext_provider(long funcid,
 				  struct sbi_trap_regs *regs,
-				  struct sbi_ecall_return *out,
-				  const struct fdt_match *match);
+				  struct sbi_ecall_return *out);
 
 #endif /* _RISCV_ANDES_SBI_H */
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index db523088..0962c363 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -24,24 +24,30 @@ static const struct andes_pma_region renesas_rzfive_pma_regions[] = {
 	},
 };
 
-static int renesas_rzfive_final_init(bool cold_boot, void *fdt,
-				     const struct fdt_match *match)
+static int renesas_rzfive_final_init(bool cold_boot)
 {
 	int rc;
 
 	if (cold_boot) {
+		void *fdt = fdt_get_address_rw();
+
 		rc = andes_pma_setup_regions(fdt, renesas_rzfive_pma_regions,
 					     array_size(renesas_rzfive_pma_regions));
 		if (rc)
 			return rc;
 	}
 
-	return 0;
+	return generic_final_init(cold_boot);
 }
 
-static int renesas_rzfive_early_init(bool cold_boot, const void *fdt,
-				     const struct fdt_match *match)
+static int renesas_rzfive_early_init(bool cold_boot)
 {
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
 	/*
 	 * Renesas RZ/Five RISC-V SoC has Instruction local memory and
 	 * Data local memory (ILM & DLM) mapped between region 0x30000
@@ -58,6 +64,18 @@ static int renesas_rzfive_early_init(bool cold_boot, const void *fdt,
 					    SBI_DOMAIN_MEMREGION_M_RWX);
 }
 
+static int renesas_rzfive_platform_init(const void *fdt, int nodeoff,
+					const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = renesas_rzfive_early_init;
+	generic_platform_ops.final_init = renesas_rzfive_final_init;
+	generic_platform_ops.extensions_init = andes_pmu_extensions_init;
+	generic_platform_ops.pmu_init = andes_pmu_init;
+	generic_platform_ops.vendor_ext_provider = andes_sbi_vendor_ext_provider;
+
+	return 0;
+}
+
 static const struct fdt_match renesas_rzfive_match[] = {
 	{ .compatible = "renesas,r9a07g043f01" },
 	{ /* sentinel */ }
@@ -65,9 +83,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
 
 const struct platform_override renesas_rzfive = {
 	.match_table = renesas_rzfive_match,
-	.early_init = renesas_rzfive_early_init,
-	.final_init = renesas_rzfive_final_init,
-	.vendor_ext_provider = andes_sbi_vendor_ext_provider,
-	.extensions_init = andes_pmu_extensions_init,
-	.pmu_init = andes_pmu_init,
+	.init = renesas_rzfive_platform_init,
 };
diff --git a/platform/generic/sifive/fu540.c b/platform/generic/sifive/fu540.c
index b980f443..f50ed465 100644
--- a/platform/generic/sifive/fu540.c
+++ b/platform/generic/sifive/fu540.c
@@ -11,7 +11,7 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 
-static u64 sifive_fu540_tlbr_flush_limit(const struct fdt_match *match)
+static u64 sifive_fu540_tlbr_flush_limit(void)
 {
 	/*
 	 * The sfence.vma by virtual address does not work on
@@ -20,6 +20,13 @@ static u64 sifive_fu540_tlbr_flush_limit(const struct fdt_match *match)
 	return 0;
 }
 
+static int sifive_fu540_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.get_tlbr_flush_limit = sifive_fu540_tlbr_flush_limit;
+
+	return 0;
+}
+
 static const struct fdt_match sifive_fu540_match[] = {
 	{ .compatible = "sifive,fu540" },
 	{ .compatible = "sifive,fu540g" },
@@ -30,5 +37,5 @@ static const struct fdt_match sifive_fu540_match[] = {
 
 const struct platform_override sifive_fu540 = {
 	.match_table = sifive_fu540_match,
-	.tlbr_flush_limit = sifive_fu540_tlbr_flush_limit,
+	.init = sifive_fu540_platform_init,
 };
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index 7a6c0319..85d19b29 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -219,7 +219,7 @@ static const struct fdt_driver *const sifive_fu740_reset_drivers[] = {
 	NULL
 };
 
-static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match *match)
+static u64 sifive_fu740_tlbr_flush_limit(void)
 {
 	/*
 	 * Needed to address CIP-1200 errata on SiFive FU740
@@ -231,18 +231,27 @@ static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match *match)
 	return 0;
 }
 
-static int sifive_fu740_final_init(bool cold_boot, void *fdt,
-				   const struct fdt_match *match)
+static int sifive_fu740_final_init(bool cold_boot)
 {
 	int rc;
 
 	if (cold_boot) {
+		const void *fdt = fdt_get_address();
+
 		rc = fdt_driver_init_one(fdt, sifive_fu740_reset_drivers);
 		if (rc)
 			sbi_printf("%s: failed to find da9063 for reset\n",
 				   __func__);
 	}
 
+	return generic_final_init(cold_boot);
+}
+
+static int sifive_fu740_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.final_init = sifive_fu740_final_init;
+	generic_platform_ops.get_tlbr_flush_limit = sifive_fu740_tlbr_flush_limit;
+
 	return 0;
 }
 
@@ -255,6 +264,5 @@ static const struct fdt_match sifive_fu740_match[] = {
 
 const struct platform_override sifive_fu740 = {
 	.match_table = sifive_fu740_match,
-	.tlbr_flush_limit = sifive_fu740_tlbr_flush_limit,
-	.final_init = sifive_fu740_final_init,
+	.init = sifive_fu740_platform_init,
 };
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index eca9afb7..0f7dbb7e 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -21,9 +21,14 @@
 #define SOPHGO_SG2042_TIMER_SIZE	0x10000UL
 #define SOPHGO_SG2042_TIMER_NUM		16
 
-static int sophgo_sg2042_early_init(bool cold_boot, const void *fdt,
-				    const struct fdt_match *match)
+static int sophgo_sg2042_early_init(bool cold_boot)
 {
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
 	thead_register_tlb_flush_trap_handler();
 
 	/*
@@ -44,13 +49,26 @@ static int sophgo_sg2042_early_init(bool cold_boot, const void *fdt,
 	return 0;
 }
 
-static int sophgo_sg2042_extensions_init(const struct fdt_match *match,
-					 struct sbi_hart_features *hfeatures)
+static int sophgo_sg2042_extensions_init(struct sbi_hart_features *hfeatures)
 {
+	int rc;
+
+	rc = generic_extensions_init(hfeatures);
+	if (rc)
+		return rc;
+
 	thead_c9xx_register_pmu_device();
 	return 0;
 }
 
+static int sophgo_sg2042_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = sophgo_sg2042_early_init;
+	generic_platform_ops.extensions_init = sophgo_sg2042_extensions_init;
+
+	return 0;
+}
+
 static const struct fdt_match sophgo_sg2042_match[] = {
 	{ .compatible = "sophgo,sg2042" },
 	{ },
@@ -58,6 +76,5 @@ static const struct fdt_match sophgo_sg2042_match[] = {
 
 const struct platform_override sophgo_sg2042 = {
 	.match_table		= sophgo_sg2042_match,
-	.early_init		= sophgo_sg2042_early_init,
-	.extensions_init	= sophgo_sg2042_extensions_init,
+	.init			= sophgo_sg2042_platform_init,
 };
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index cc9c82f7..5a4583e0 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -282,23 +282,23 @@ err:
 	return rc;
 }
 
-static int starfive_jh7110_final_init(bool cold_boot, void *fdt,
-				      const struct fdt_match *match)
+static int starfive_jh7110_final_init(bool cold_boot)
 {
 	if (cold_boot) {
+		const void *fdt = fdt_get_address();
+
 		fdt_driver_init_one(fdt, starfive_jh7110_reset_drivers);
 	}
 
-	return 0;
+	return generic_final_init(cold_boot);
 }
 
-static bool starfive_jh7110_cold_boot_allowed(u32 hartid,
-				   const struct fdt_match *match)
+static bool starfive_jh7110_cold_boot_allowed(u32 hartid)
 {
 	if (selected_hartid != -1)
 		return (selected_hartid == hartid);
 
-	return true;
+	return generic_cold_boot_allowed(hartid);
 }
 
 static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
@@ -314,6 +314,9 @@ static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
 			selected_hartid = (u32) fdt32_to_cpu(*val);
 	}
 
+	generic_platform_ops.cold_boot_allowed = starfive_jh7110_cold_boot_allowed;
+	generic_platform_ops.final_init = starfive_jh7110_final_init;
+
 	return 0;
 }
 
@@ -325,6 +328,4 @@ static const struct fdt_match starfive_jh7110_match[] = {
 const struct platform_override starfive_jh7110 = {
 	.match_table = starfive_jh7110_match,
 	.init = starfive_jh7110_platform_init,
-	.cold_boot_allowed = starfive_jh7110_cold_boot_allowed,
-	.final_init = starfive_jh7110_final_init,
 };
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index 25919df1..e36b6913 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -19,24 +19,35 @@ struct thead_generic_quirks {
 	u64	errata;
 };
 
-static int thead_generic_early_init(bool cold_boot, const void *fdt,
-				    const struct fdt_match *match)
+static int thead_tlb_flush_early_init(bool cold_boot)
 {
-	const struct thead_generic_quirks *quirks = match->data;
+	thead_register_tlb_flush_trap_handler();
 
-	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
-		thead_register_tlb_flush_trap_handler();
+	return generic_early_init(cold_boot);
+}
+
+static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
+{
+	int rc;
+
+	rc = generic_extensions_init(hfeatures);
+	if (rc)
+		return rc;
+
+	thead_c9xx_register_pmu_device();
 
 	return 0;
 }
 
-static int thead_generic_extensions_init(const struct fdt_match *match,
-					 struct sbi_hart_features *hfeatures)
+static int thead_generic_platform_init(const void *fdt, int nodeoff,
+				       const struct fdt_match *match)
 {
 	const struct thead_generic_quirks *quirks = match->data;
 
+	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
+		generic_platform_ops.early_init = thead_tlb_flush_early_init;
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
-		thead_c9xx_register_pmu_device();
+		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
 
 	return 0;
 }
@@ -62,6 +73,5 @@ static const struct fdt_match thead_generic_match[] = {
 
 const struct platform_override thead_generic = {
 	.match_table		= thead_generic_match,
-	.early_init		= thead_generic_early_init,
-	.extensions_init	= thead_generic_extensions_init,
+	.init			= thead_generic_platform_init,
 };
-- 
2.47.2


