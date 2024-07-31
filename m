From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:54 -0700
Subject: [PATCH 13/16] platform: generic: Pass FDT to early/final_init overrides
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-14-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several of these override functions access the FDT blob. Explicitly
indicate which callbacks are allowed to modify the FDT blob by passing
the parameter as a possibly-const pointer. This also reduces code size
by deduplicating the call to fdt_get_address().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/allwinner/sun20i-d1.c       |  3 ++-
 platform/generic/andes/ae350.c               | 10 ++++------
 platform/generic/andes/andes_pma.c           |  6 ++----
 platform/generic/include/andes/andes_pma.h   |  3 ++-
 platform/generic/include/platform_override.h |  4 ++--
 platform/generic/platform.c                  |  9 ++++-----
 platform/generic/renesas/rzfive/rzfive.c     |  8 +++++---
 platform/generic/sifive/fu740.c              |  3 +--
 platform/generic/sophgo/sg2042.c             |  2 +-
 platform/generic/starfive/jh7110.c           |  4 +---
 platform/generic/thead/thead-generic.c       |  2 +-
 11 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index ab2eee55..9b1d5559 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -187,7 +187,8 @@ static const struct sbi_hsm_device sun20i_d1_ppu = {
 	.hart_resume	= sun20i_d1_hart_resume,
 };
 
-static int sun20i_d1_final_init(bool cold_boot, const struct fdt_match *match)
+static int sun20i_d1_final_init(bool cold_boot, void *fdt,
+				const struct fdt_match *match)
 {
 	if (cold_boot) {
 		sun20i_d1_riscv_cfg_init();
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 63c10bc4..efe36927 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -87,12 +87,9 @@ static const struct sbi_hsm_device andes_smu = {
 	.hart_stop    = ae350_hart_stop,
 };
 
-static void ae350_hsm_device_init(void)
+static void ae350_hsm_device_init(const void *fdt)
 {
 	int rc;
-	void *fdt;
-
-	fdt = fdt_get_address();
 
 	rc = fdt_parse_compat_addr(fdt, (uint64_t *)&smu.addr,
 				   "andestech,atcsmu");
@@ -102,10 +99,11 @@ static void ae350_hsm_device_init(void)
 	}
 }
 
-static int ae350_final_init(bool cold_boot, const struct fdt_match *match)
+static int ae350_final_init(bool cold_boot, void *fdt,
+			    const struct fdt_match *match)
 {
 	if (cold_boot)
-		ae350_hsm_device_init();
+		ae350_hsm_device_init(fdt);
 
 	return 0;
 }
diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 9c37720b..035f9ec9 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -238,14 +238,14 @@ static int andes_fdt_reserved_memory_fixup(void *fdt,
 	return andes_fdt_pma_resv(fdt, pma, entry, parent);
 }
 
-int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
+int andes_pma_setup_regions(void *fdt,
+			    const struct andes_pma_region *pma_regions,
 			    unsigned int pma_regions_count)
 {
 	unsigned long mmsc = csr_read(CSR_MMSC_CFG);
 	unsigned int dt_populate_cnt;
 	unsigned int i, j;
 	unsigned long pa;
-	void *fdt;
 	int ret;
 
 	if (!pma_regions || !pma_regions_count)
@@ -270,8 +270,6 @@ int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
 	if (!dt_populate_cnt)
 		return 0;
 
-	fdt = fdt_get_address();
-
 	ret = fdt_open_into(fdt, fdt,
 			    fdt_totalsize(fdt) + (64 * dt_populate_cnt));
 	if (ret < 0)
diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
index 5ea12475..1bcda788 100644
--- a/platform/generic/include/andes/andes_pma.h
+++ b/platform/generic/include/andes/andes_pma.h
@@ -44,7 +44,8 @@ struct andes_pma_region {
 	bool dma_default;
 };
 
-int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
+int andes_pma_setup_regions(void *fdt,
+			    const struct andes_pma_region *pma_regions,
 			    unsigned int pma_regions_count);
 
 #endif /* _ANDES_PMA_H_ */
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index bd6fdacc..946fb8f7 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -21,8 +21,8 @@ struct platform_override {
 	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
 	u32 (*tlb_num_entries)(const struct fdt_match *match);
 	bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
-	int (*early_init)(bool cold_boot, const struct fdt_match *match);
-	int (*final_init)(bool cold_boot, const struct fdt_match *match);
+	int (*early_init)(bool cold_boot, const void *fdt, const struct fdt_match *match);
+	int (*final_init)(bool cold_boot, void *fdt, const struct fdt_match *match);
 	void (*early_exit)(const struct fdt_match *match);
 	void (*final_exit)(const struct fdt_match *match);
 	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 4d26ae7c..6f9fb4db 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -221,6 +221,7 @@ static int generic_nascent_init(void)
 
 static int generic_early_init(bool cold_boot)
 {
+	const void *fdt = fdt_get_address();
 	int rc;
 
 	if (cold_boot) {
@@ -237,16 +238,16 @@ static int generic_early_init(bool cold_boot)
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
 
-	return generic_plat->early_init(cold_boot, generic_plat_match);
+	return generic_plat->early_init(cold_boot, fdt, generic_plat_match);
 }
 
 static int generic_final_init(bool cold_boot)
 {
-	void *fdt;
+	void *fdt = fdt_get_address();
 	int rc;
 
 	if (generic_plat && generic_plat->final_init) {
-		rc = generic_plat->final_init(cold_boot, generic_plat_match);
+		rc = generic_plat->final_init(cold_boot, fdt, generic_plat_match);
 		if (rc)
 			return rc;
 	}
@@ -254,8 +255,6 @@ static int generic_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
-	fdt = fdt_get_address();
-
 	fdt_cpu_fixup(fdt);
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 515bcd76..59084c41 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -24,13 +24,15 @@ static const struct andes_pma_region renesas_rzfive_pma_regions[] = {
 	},
 };
 
-static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *match)
+static int renesas_rzfive_final_init(bool cold_boot, void *fdt,
+				     const struct fdt_match *match)
 {
-	return andes_pma_setup_regions(renesas_rzfive_pma_regions,
+	return andes_pma_setup_regions(fdt, renesas_rzfive_pma_regions,
 				       array_size(renesas_rzfive_pma_regions));
 }
 
-static int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
+static int renesas_rzfive_early_init(bool cold_boot, const void *fdt,
+				     const struct fdt_match *match)
 {
 	/*
 	 * Renesas RZ/Five RISC-V SoC has Instruction local memory and
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index ce83a050..46dc02ae 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -226,11 +226,10 @@ static u64 sifive_fu740_tlbr_flush_limit(const struct fdt_match *match)
 	return 0;
 }
 
-static int sifive_fu740_final_init(bool cold_boot,
+static int sifive_fu740_final_init(bool cold_boot, void *fdt,
 				   const struct fdt_match *match)
 {
 	int rc;
-	void *fdt = fdt_get_address();
 
 	if (cold_boot) {
 		rc = fdt_reset_driver_init(fdt, &fdt_reset_da9063);
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index ae2d702e..eca9afb7 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -21,7 +21,7 @@
 #define SOPHGO_SG2042_TIMER_SIZE	0x10000UL
 #define SOPHGO_SG2042_TIMER_NUM		16
 
-static int sophgo_sg2042_early_init(bool cold_boot,
+static int sophgo_sg2042_early_init(bool cold_boot, const void *fdt,
 				    const struct fdt_match *match)
 {
 	thead_register_tlb_flush_trap_handler();
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 48451895..264fe99c 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -277,11 +277,9 @@ err:
 	return rc;
 }
 
-static int starfive_jh7110_final_init(bool cold_boot,
+static int starfive_jh7110_final_init(bool cold_boot, void *fdt,
 				      const struct fdt_match *match)
 {
-	void *fdt = fdt_get_address();
-
 	if (cold_boot) {
 		fdt_reset_driver_init(fdt, &fdt_reset_pmic);
 	}
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index c82e0c1b..be64831c 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -19,7 +19,7 @@ struct thead_generic_quirks {
 	u64	errata;
 };
 
-static int thead_generic_early_init(bool cold_boot,
+static int thead_generic_early_init(bool cold_boot, const void *fdt,
 				    const struct fdt_match *match)
 {
 	struct thead_generic_quirks *quirks = (void *)match->data;
-- 
2.45.1


