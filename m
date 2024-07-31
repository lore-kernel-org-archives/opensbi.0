From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:53 -0700
Subject: [PATCH 12/16] platform: generic: Constify FDT pointers in fw_platform_init()
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-13-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/include/platform_override.h | 2 +-
 platform/generic/platform.c                  | 6 +++---
 platform/generic/starfive/jh7110.c           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index b0585c21..bd6fdacc 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -29,7 +29,7 @@ struct platform_override {
 	int (*extensions_init)(const struct fdt_match *match,
 			       struct sbi_hart_features *hfeatures);
 	int (*pmu_init)(const struct fdt_match *match);
-	void (*fw_init)(void *fdt, const struct fdt_match *match);
+	void (*fw_init)(const void *fdt, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long funcid,
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 3470474a..4d26ae7c 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -36,7 +36,7 @@ extern unsigned long platform_override_modules_size;
 static const struct platform_override *generic_plat = NULL;
 static const struct fdt_match *generic_plat_match = NULL;
 
-static void fw_platform_lookup_special(void *fdt, int root_offset)
+static void fw_platform_lookup_special(const void *fdt, int root_offset)
 {
 	const struct platform_override *plat;
 	const struct fdt_match *match;
@@ -81,7 +81,7 @@ static DECLARE_BITMAP(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
  * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config" 
  * DT node. If there is no "cold-boot-harts" in DT, all harts will be allowed.
  */
-static void fw_platform_coldboot_harts_init(void *fdt)
+static void fw_platform_coldboot_harts_init(const void *fdt)
 {
 	int chosen_offset, config_offset, cpu_offset, len, err;
 	u32 val32;
@@ -146,7 +146,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 				unsigned long arg4)
 {
 	const char *model;
-	void *fdt = (void *)arg1;
+	const void *fdt = (void *)arg1;
 	u32 hartid, hart_count = 0;
 	int rc, root_offset, cpus_offset, cpu_offset, len;
 
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 560fe1d7..48451895 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -298,7 +298,7 @@ static bool starfive_jh7110_cold_boot_allowed(u32 hartid,
 	return true;
 }
 
-static void starfive_jh7110_fw_init(void *fdt, const struct fdt_match *match)
+static void starfive_jh7110_fw_init(const void *fdt, const struct fdt_match *match)
 {
 	const fdt32_t *val;
 	int len, coff;
-- 
2.45.1


