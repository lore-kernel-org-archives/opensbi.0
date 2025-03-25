From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:27 -0700
Subject: [PATCH 04/10] platform: generic: Add an init hook matching fdt_driver
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation for reusing the fdt_driver code to match platform
overrides, add a new .init hook matching the type signature from
fdt_driver. This hook replaces the existing .fw_init hook, since
it is called at roughly the same place in the init process.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/include/platform_override.h |  3 ++-
 platform/generic/platform.c                  | 11 +++++++----
 platform/generic/starfive/jh7110.c           |  7 +++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 946fb8f7..0499b7e6 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -17,6 +17,8 @@
 
 struct platform_override {
 	const struct fdt_match *match_table;
+	int (*init)(const void *fdt, int nodeoff,
+		    const struct fdt_match *match);
 	u64 (*features)(const struct fdt_match *match);
 	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
 	u32 (*tlb_num_entries)(const struct fdt_match *match);
@@ -29,7 +31,6 @@ struct platform_override {
 	int (*extensions_init)(const struct fdt_match *match,
 			       struct sbi_hart_features *hfeatures);
 	int (*pmu_init)(const struct fdt_match *match);
-	void (*fw_init)(const void *fdt, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long funcid,
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index b2f29e8b..f34521d6 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -40,7 +40,7 @@ static void fw_platform_lookup_special(const void *fdt, int root_offset)
 {
 	const struct platform_override *plat;
 	const struct fdt_match *match;
-	int pos;
+	int pos, rc;
 
 	for (pos = 0; platform_override_modules[pos]; pos++) {
 		plat = platform_override_modules[pos];
@@ -51,6 +51,12 @@ static void fw_platform_lookup_special(const void *fdt, int root_offset)
 		if (!match)
 			continue;
 
+		if (plat->init) {
+			rc = plat->init(fdt, root_offset, match);
+			if (rc)
+				continue;
+		}
+
 		generic_plat = plat;
 		generic_plat_match = match;
 		break;
@@ -178,9 +184,6 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 	fw_platform_lookup_special(fdt, root_offset);
 
-	if (generic_plat && generic_plat->fw_init)
-		generic_plat->fw_init(fdt, generic_plat_match);
-
 	model = fdt_getprop(fdt, root_offset, "model", &len);
 	if (model)
 		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index cd8ce27d..cc9c82f7 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -301,7 +301,8 @@ static bool starfive_jh7110_cold_boot_allowed(u32 hartid,
 	return true;
 }
 
-static void starfive_jh7110_fw_init(const void *fdt, const struct fdt_match *match)
+static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
+					 const struct fdt_match *match)
 {
 	const fdt32_t *val;
 	int len, coff;
@@ -312,6 +313,8 @@ static void starfive_jh7110_fw_init(const void *fdt, const struct fdt_match *mat
 		if (val && len >= sizeof(fdt32_t))
 			selected_hartid = (u32) fdt32_to_cpu(*val);
 	}
+
+	return 0;
 }
 
 static const struct fdt_match starfive_jh7110_match[] = {
@@ -321,7 +324,7 @@ static const struct fdt_match starfive_jh7110_match[] = {
 
 const struct platform_override starfive_jh7110 = {
 	.match_table = starfive_jh7110_match,
+	.init = starfive_jh7110_platform_init,
 	.cold_boot_allowed = starfive_jh7110_cold_boot_allowed,
-	.fw_init = starfive_jh7110_fw_init,
 	.final_init = starfive_jh7110_final_init,
 };
-- 
2.47.2


