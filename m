From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:28 -0700
Subject: [PATCH 05/10] platform: generic: Allow replacing platform operations
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-6-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently the generic platform follows the middleware pattern: it
implements the sbi_platform hooks, while providing its own set of hooks
for further customization. This has a few disadvantages: each location
where customization is needed requires a separate platform_override
hook, including places where the generic function does nothing except
forward to a platform_override hook, and the extra layer of function
pointers adds runtime overhead.

Let's restructure the generic platform to follow the helper pattern.
Allow platform overrides to treat the generic platform as a template,
adding or replacing the sbi_platform_operations as needed. Export the
generic implementations, so they can be called as helpers from inside
the override functions. With this pattern, the platform_override
function pointers are replaced by direct calls, and the forwarding
functions can be removed.

The forwarding functions are not exported, since there is no reason for
an override to call them. generic_vendor_ext_check() must be rewritten,
since now there is a new way to override vendor_ext_provider.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/include/platform_override.h | 15 +++++++
 platform/generic/platform.c                  | 43 +++++++++++---------
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 0499b7e6..6b4ac82e 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_trap.h>
 
@@ -37,4 +38,18 @@ struct platform_override {
 				   const struct fdt_match *match);
 };
 
+bool generic_cold_boot_allowed(u32 hartid);
+int generic_nascent_init(void);
+int generic_early_init(bool cold_boot);
+int generic_final_init(bool cold_boot);
+int generic_extensions_init(struct sbi_hart_features *hfeatures);
+int generic_domains_init(void);
+int generic_pmu_init(void);
+uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx, uint64_t data);
+u64 generic_tlbr_flush_limit(void);
+u32 generic_tlb_num_entries(void);
+int generic_mpxy_init(void);
+
+extern struct sbi_platform_operations generic_platform_ops;
+
 #endif
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index f34521d6..2427adac 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -223,7 +223,7 @@ fail:
 		wfi();
 }
 
-static bool generic_cold_boot_allowed(u32 hartid)
+bool generic_cold_boot_allowed(u32 hartid)
 {
 	if (generic_plat && generic_plat->cold_boot_allowed)
 		return generic_plat->cold_boot_allowed(
@@ -237,14 +237,14 @@ static bool generic_cold_boot_allowed(u32 hartid)
 	return false;
 }
 
-static int generic_nascent_init(void)
+int generic_nascent_init(void)
 {
 	if (platform_has_mlevel_imsic)
 		imsic_local_irqchip_init();
 	return 0;
 }
 
-static int generic_early_init(bool cold_boot)
+int generic_early_init(bool cold_boot)
 {
 	const void *fdt = fdt_get_address();
 	int rc;
@@ -266,7 +266,7 @@ static int generic_early_init(bool cold_boot)
 	return generic_plat->early_init(cold_boot, fdt, generic_plat_match);
 }
 
-static int generic_final_init(bool cold_boot)
+int generic_final_init(bool cold_boot)
 {
 	void *fdt = fdt_get_address_rw();
 	int rc;
@@ -293,12 +293,6 @@ static int generic_final_init(bool cold_boot)
 	return 0;
 }
 
-static bool generic_vendor_ext_check(void)
-{
-	return (generic_plat && generic_plat->vendor_ext_provider) ?
-		true : false;
-}
-
 static int generic_vendor_ext_provider(long funcid,
 				       struct sbi_trap_regs *regs,
 				       struct sbi_ecall_return *out)
@@ -307,6 +301,16 @@ static int generic_vendor_ext_provider(long funcid,
 						 generic_plat_match);
 }
 
+static bool generic_vendor_ext_check(void)
+{
+	if (generic_plat && generic_plat->vendor_ext_provider)
+		return true;
+	if (generic_platform_ops.vendor_ext_provider != generic_vendor_ext_provider)
+		return true;
+
+	return false;
+}
+
 static void generic_early_exit(void)
 {
 	if (generic_plat && generic_plat->early_exit)
@@ -319,7 +323,7 @@ static void generic_final_exit(void)
 		generic_plat->final_exit(generic_plat_match);
 }
 
-static int generic_extensions_init(struct sbi_hart_features *hfeatures)
+int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
 	int rc;
 
@@ -337,7 +341,7 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
 	return 0;
 }
 
-static int generic_domains_init(void)
+int generic_domains_init(void)
 {
 	const void *fdt = fdt_get_address();
 	int offset, ret;
@@ -359,21 +363,21 @@ static int generic_domains_init(void)
 	return 0;
 }
 
-static u64 generic_tlbr_flush_limit(void)
+u64 generic_tlbr_flush_limit(void)
 {
 	if (generic_plat && generic_plat->tlbr_flush_limit)
 		return generic_plat->tlbr_flush_limit(generic_plat_match);
 	return SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT;
 }
 
-static u32 generic_tlb_num_entries(void)
+u32 generic_tlb_num_entries(void)
 {
 	if (generic_plat && generic_plat->tlb_num_entries)
 		return generic_plat->tlb_num_entries(generic_plat_match);
 	return sbi_hart_count();
 }
 
-static int generic_pmu_init(void)
+int generic_pmu_init(void)
 {
 	int rc;
 
@@ -390,8 +394,7 @@ static int generic_pmu_init(void)
 	return 0;
 }
 
-static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
-					       uint64_t data)
+uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx, uint64_t data)
 {
 	uint64_t evt_val = 0;
 
@@ -413,7 +416,7 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
 	return evt_val;
 }
 
-static int generic_mpxy_init(void)
+int generic_mpxy_init(void)
 {
 	const void *fdt = fdt_get_address();
 
@@ -421,7 +424,7 @@ static int generic_mpxy_init(void)
 	return 0;
 }
 
-const struct sbi_platform_operations platform_ops = {
+struct sbi_platform_operations generic_platform_ops = {
 	.cold_boot_allowed	= generic_cold_boot_allowed,
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
@@ -453,5 +456,5 @@ struct sbi_platform platform = {
 	.hart_index2id		= generic_hart_index2id,
 	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
 	.heap_size		= SBI_PLATFORM_DEFAULT_HEAP_SIZE(0),
-	.platform_ops_addr	= (unsigned long)&platform_ops
+	.platform_ops_addr	= (unsigned long)&generic_platform_ops
 };
-- 
2.47.2


