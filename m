From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:33 -0700
Subject: [PATCH 10/10] lib: sbi_platform: Remove the vendor_ext_check hook
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-11-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the generic platform only sets .vendor_ext_provider if the
function is really implemented, there is no need for a separate hook to
check if a vendor extension is implemented.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_platform.h  | 7 +------
 platform/generic/platform.c | 6 ------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 3c99d439..6a8f47bd 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -129,8 +129,6 @@ struct sbi_platform_operations {
 	/** Initialize the platform Message Proxy(MPXY) driver */
 	int (*mpxy_init)(void);
 
-	/** Check if SBI vendor extension is implemented or not */
-	bool (*vendor_ext_check)(void);
 	/** platform specific SBI extension implementation provider */
 	int (*vendor_ext_provider)(long funcid,
 				   struct sbi_trap_regs *regs,
@@ -604,10 +602,7 @@ static inline int sbi_platform_mpxy_init(const struct sbi_platform *plat)
 static inline bool sbi_platform_vendor_ext_check(
 					const struct sbi_platform *plat)
 {
-	if (plat && sbi_platform_ops(plat)->vendor_ext_check)
-		return sbi_platform_ops(plat)->vendor_ext_check();
-
-	return false;
+	return plat && sbi_platform_ops(plat)->vendor_ext_provider;
 }
 
 /**
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 04448d71..f3072be8 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -240,11 +240,6 @@ int generic_final_init(bool cold_boot)
 	return 0;
 }
 
-static bool generic_vendor_ext_check(void)
-{
-	return !!generic_platform_ops.vendor_ext_provider;
-}
-
 int generic_extensions_init(struct sbi_hart_features *hfeatures)
 {
 	/* Parse the ISA string from FDT and enable the listed extensions */
@@ -340,7 +335,6 @@ struct sbi_platform_operations generic_platform_ops = {
 	.get_tlb_num_entries	= generic_tlb_num_entries,
 	.timer_init		= fdt_timer_init,
 	.mpxy_init		= generic_mpxy_init,
-	.vendor_ext_check	= generic_vendor_ext_check,
 };
 
 struct sbi_platform platform = {
-- 
2.47.2


