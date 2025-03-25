From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:30 -0700
Subject: [PATCH 07/10] platform: generic: Remove platform override hooks
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-8-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that all of the overrides are modifying generic_platform_ops
directly, remove the unused hooks and forwarding functions. The
remaining members of struct platform_override match struct fdt_driver,
so use that type instead. This allows a future commit to reuse the
fdt_driver-based init function.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/allwinner/sun20i-d1.c        |  2 +-
 platform/generic/andes/ae350.c                |  2 +-
 platform/generic/include/platform_override.h  | 25 +-----
 platform/generic/platform.c                   | 89 ++-----------------
 .../generic/platform_override_modules.carray  |  2 +-
 platform/generic/renesas/rzfive/rzfive.c      |  2 +-
 platform/generic/sifive/fu540.c               |  2 +-
 platform/generic/sifive/fu740.c               |  2 +-
 platform/generic/sophgo/sg2042.c              |  2 +-
 platform/generic/starfive/jh7110.c            |  2 +-
 platform/generic/thead/thead-generic.c        |  2 +-
 11 files changed, 16 insertions(+), 116 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 7e8bda89..666473c1 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -229,7 +229,7 @@ static const struct fdt_match sun20i_d1_match[] = {
 	{ },
 };
 
-const struct platform_override sun20i_d1 = {
+const struct fdt_driver sun20i_d1 = {
 	.match_table	= sun20i_d1_match,
 	.init		= sun20i_d1_platform_init,
 };
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 31b99798..f06e207d 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -128,7 +128,7 @@ static const struct fdt_match andes_ae350_match[] = {
 	{ },
 };
 
-const struct platform_override andes_ae350 = {
+const struct fdt_driver andes_ae350 = {
 	.match_table = andes_ae350_match,
 	.init = ae350_platform_init,
 };
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 6b4ac82e..3e6e5044 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -10,33 +10,10 @@
 #ifndef __PLATFORM_OVERRIDE_H__
 #define __PLATFORM_OVERRIDE_H__
 
-#include <sbi/sbi_ecall.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_types.h>
-#include <sbi/sbi_trap.h>
-
-struct platform_override {
-	const struct fdt_match *match_table;
-	int (*init)(const void *fdt, int nodeoff,
-		    const struct fdt_match *match);
-	u64 (*features)(const struct fdt_match *match);
-	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
-	u32 (*tlb_num_entries)(const struct fdt_match *match);
-	bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
-	int (*early_init)(bool cold_boot, const void *fdt, const struct fdt_match *match);
-	int (*final_init)(bool cold_boot, void *fdt, const struct fdt_match *match);
-	void (*early_exit)(const struct fdt_match *match);
-	void (*final_exit)(const struct fdt_match *match);
-	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
-	int (*extensions_init)(const struct fdt_match *match,
-			       struct sbi_hart_features *hfeatures);
-	int (*pmu_init)(const struct fdt_match *match);
-	int (*vendor_ext_provider)(long funcid,
-				   struct sbi_trap_regs *regs,
-				   struct sbi_ecall_return *out,
-				   const struct fdt_match *match);
-};
+#include <sbi_utils/fdt/fdt_driver.h>
 
 bool generic_cold_boot_allowed(u32 hartid);
 int generic_nascent_init(void);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 2427adac..19566e69 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -31,14 +31,11 @@
 #include <sbi_utils/timer/fdt_timer.h>
 
 /* List of platform override modules generated at compile time */
-extern const struct platform_override *const platform_override_modules[];
-
-static const struct platform_override *generic_plat = NULL;
-static const struct fdt_match *generic_plat_match = NULL;
+extern const struct fdt_driver *const platform_override_modules[];
 
 static void fw_platform_lookup_special(const void *fdt, int root_offset)
 {
-	const struct platform_override *plat;
+	const struct fdt_driver *plat;
 	const struct fdt_match *match;
 	int pos, rc;
 
@@ -57,8 +54,6 @@ static void fw_platform_lookup_special(const void *fdt, int root_offset)
 				continue;
 		}
 
-		generic_plat = plat;
-		generic_plat_match = match;
 		break;
 	}
 }
@@ -188,9 +183,6 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	if (model)
 		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
 
-	if (generic_plat && generic_plat->features)
-		platform.features = generic_plat->features(generic_plat_match);
-
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
 	if (cpus_offset < 0)
 		goto fail;
@@ -225,10 +217,6 @@ fail:
 
 bool generic_cold_boot_allowed(u32 hartid)
 {
-	if (generic_plat && generic_plat->cold_boot_allowed)
-		return generic_plat->cold_boot_allowed(
-						hartid, generic_plat_match);
-
 	for (int i = 0; i < platform.hart_count; i++) {
 		if (hartid == generic_hart_index2id[i])
 			return bitmap_test(generic_coldboot_harts, i);
@@ -260,22 +248,12 @@ int generic_early_init(bool cold_boot)
 		fdt_driver_init_all(fdt, fdt_early_drivers);
 	}
 
-	if (!generic_plat || !generic_plat->early_init)
-		return 0;
-
-	return generic_plat->early_init(cold_boot, fdt, generic_plat_match);
+	return 0;
 }
 
 int generic_final_init(bool cold_boot)
 {
 	void *fdt = fdt_get_address_rw();
-	int rc;
-
-	if (generic_plat && generic_plat->final_init) {
-		rc = generic_plat->final_init(cold_boot, fdt, generic_plat_match);
-		if (rc)
-			return rc;
-	}
 
 	if (!cold_boot)
 		return 0;
@@ -284,61 +262,19 @@ int generic_final_init(bool cold_boot)
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
 
-	if (generic_plat && generic_plat->fdt_fixup) {
-		rc = generic_plat->fdt_fixup(fdt, generic_plat_match);
-		if (rc)
-			return rc;
-	}
-
 	return 0;
 }
 
-static int generic_vendor_ext_provider(long funcid,
-				       struct sbi_trap_regs *regs,
-				       struct sbi_ecall_return *out)
-{
-	return generic_plat->vendor_ext_provider(funcid, regs, out,
-						 generic_plat_match);
-}
-
 static bool generic_vendor_ext_check(void)
 {
-	if (generic_plat && generic_plat->vendor_ext_provider)
-		return true;
-	if (generic_platform_ops.vendor_ext_provider != generic_vendor_ext_provider)
-		return true;
-
-	return false;
-}
-
-static void generic_early_exit(void)
-{
-	if (generic_plat && generic_plat->early_exit)
-		generic_plat->early_exit(generic_plat_match);
-}
-
-static void generic_final_exit(void)
-{
-	if (generic_plat && generic_plat->final_exit)
-		generic_plat->final_exit(generic_plat_match);
+	return !!generic_platform_ops.vendor_ext_provider;
 }
 
 int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
-	int rc;
-
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	rc = fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
-				      hfeatures->extensions);
-
-	if (rc)
-		return rc;
-
-	if (generic_plat && generic_plat->extensions_init)
-		return generic_plat->extensions_init(generic_plat_match,
-						     hfeatures);
-
-	return 0;
+	return fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
+					hfeatures->extensions);
 }
 
 int generic_domains_init(void)
@@ -365,15 +301,11 @@ int generic_domains_init(void)
 
 u64 generic_tlbr_flush_limit(void)
 {
-	if (generic_plat && generic_plat->tlbr_flush_limit)
-		return generic_plat->tlbr_flush_limit(generic_plat_match);
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
 u32 generic_tlb_num_entries(void)
 {
-	if (generic_plat && generic_plat->tlb_num_entries)
-		return generic_plat->tlb_num_entries(generic_plat_match);
 	return sbi_hart_count();
 }
 
@@ -381,12 +313,6 @@ int generic_pmu_init(void)
 {
 	int rc;
 
-	if (generic_plat && generic_plat->pmu_init) {
-		rc = generic_plat->pmu_init(generic_plat_match);
-		if (rc)
-			return rc;
-	}
-
 	rc = fdt_pmu_setup(fdt_get_address());
 	if (rc && rc != SBI_ENOENT)
 		return rc;
@@ -429,8 +355,6 @@ struct sbi_platform_operations generic_platform_ops = {
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
 	.final_init		= generic_final_init,
-	.early_exit		= generic_early_exit,
-	.final_exit		= generic_final_exit,
 	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
 	.irqchip_init		= fdt_irqchip_init,
@@ -442,7 +366,6 @@ struct sbi_platform_operations generic_platform_ops = {
 	.timer_init		= fdt_timer_init,
 	.mpxy_init		= generic_mpxy_init,
 	.vendor_ext_check	= generic_vendor_ext_check,
-	.vendor_ext_provider	= generic_vendor_ext_provider,
 };
 
 struct sbi_platform platform = {
diff --git a/platform/generic/platform_override_modules.carray b/platform/generic/platform_override_modules.carray
index ab9d47f7..7fab4797 100644
--- a/platform/generic/platform_override_modules.carray
+++ b/platform/generic/platform_override_modules.carray
@@ -1,3 +1,3 @@
 HEADER: platform_override.h
-TYPE: const struct platform_override
+TYPE: const struct fdt_driver
 NAME: platform_override_modules
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 0962c363..44db3671 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -81,7 +81,7 @@ static const struct fdt_match renesas_rzfive_match[] = {
 	{ /* sentinel */ }
 };
 
-const struct platform_override renesas_rzfive = {
+const struct fdt_driver renesas_rzfive = {
 	.match_table = renesas_rzfive_match,
 	.init = renesas_rzfive_platform_init,
 };
diff --git a/platform/generic/sifive/fu540.c b/platform/generic/sifive/fu540.c
index f50ed465..83e57145 100644
--- a/platform/generic/sifive/fu540.c
+++ b/platform/generic/sifive/fu540.c
@@ -35,7 +35,7 @@ static const struct fdt_match sifive_fu540_match[] = {
 	{ },
 };
 
-const struct platform_override sifive_fu540 = {
+const struct fdt_driver sifive_fu540 = {
 	.match_table = sifive_fu540_match,
 	.init = sifive_fu540_platform_init,
 };
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index 85d19b29..a886c787 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -262,7 +262,7 @@ static const struct fdt_match sifive_fu740_match[] = {
 	{ },
 };
 
-const struct platform_override sifive_fu740 = {
+const struct fdt_driver sifive_fu740 = {
 	.match_table = sifive_fu740_match,
 	.init = sifive_fu740_platform_init,
 };
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index 0f7dbb7e..c2447c3c 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -74,7 +74,7 @@ static const struct fdt_match sophgo_sg2042_match[] = {
 	{ },
 };
 
-const struct platform_override sophgo_sg2042 = {
+const struct fdt_driver sophgo_sg2042 = {
 	.match_table		= sophgo_sg2042_match,
 	.init			= sophgo_sg2042_platform_init,
 };
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 5a4583e0..4163e416 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -325,7 +325,7 @@ static const struct fdt_match starfive_jh7110_match[] = {
 	{ },
 };
 
-const struct platform_override starfive_jh7110 = {
+const struct fdt_driver starfive_jh7110 = {
 	.match_table = starfive_jh7110_match,
 	.init = starfive_jh7110_platform_init,
 };
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index e36b6913..ddb4f0bf 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -71,7 +71,7 @@ static const struct fdt_match thead_generic_match[] = {
 	{ },
 };
 
-const struct platform_override thead_generic = {
+const struct fdt_driver thead_generic = {
 	.match_table		= thead_generic_match,
 	.init			= thead_generic_platform_init,
 };
-- 
2.47.2


