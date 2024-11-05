From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:09 -0800
Subject: [PATCH 8/9] platform: Drop irqchip warm init and exit hooks
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-9-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that driver lifecycle is managed from within the SBI irqchip core,
platforms need only to initialize the driver once during cold init.
Remove the remaining platform hooks that are no longer used.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_platform.h              | 25 +++--------
 include/sbi_utils/irqchip/fdt_irqchip.h | 10 +----
 lib/sbi/sbi_irqchip.c                   | 12 +++---
 lib/utils/irqchip/fdt_irqchip.c         | 57 +------------------------
 lib/utils/irqchip/fdt_irqchip_aplic.c   |  2 -
 lib/utils/irqchip/fdt_irqchip_imsic.c   |  1 -
 lib/utils/irqchip/fdt_irqchip_plic.c    |  2 -
 platform/fpga/ariane/platform.c         | 14 ++----
 platform/fpga/openpiton/platform.c      | 14 ++----
 platform/generic/platform.c             |  1 -
 platform/kendryte/k210/platform.c       | 12 +-----
 platform/nuclei/ux600/platform.c        | 12 +-----
 platform/template/platform.c            | 14 ++----
 13 files changed, 26 insertions(+), 150 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 7b3ac4bf..d6420055 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -111,10 +111,8 @@ struct sbi_platform_operations {
 	/** Get platform specific mhpmevent value */
 	uint64_t (*pmu_xlate_to_mhpmevent)(uint32_t event_idx, uint64_t data);
 
-	/** Initialize the platform interrupt controller for current HART */
-	int (*irqchip_init)(bool cold_boot);
-	/** Exit the platform interrupt controller for current HART */
-	void (*irqchip_exit)(void);
+	/** Initialize the platform interrupt controller during cold boot */
+	int (*irqchip_init)(void);
 
 	/** Initialize IPI for current HART */
 	int (*ipi_init)(bool cold_boot);
@@ -547,32 +545,19 @@ static inline uint64_t sbi_platform_pmu_xlate_to_mhpmevent(const struct sbi_plat
 }
 
 /**
- * Initialize the platform interrupt controller for current HART
+ * Initialize the platform interrupt controller during cold boot
  *
  * @param plat pointer to struct sbi_platform
- * @param cold_boot whether cold boot (true) or warm_boot (false)
  *
  * @return 0 on success and negative error code on failure
  */
-static inline int sbi_platform_irqchip_init(const struct sbi_platform *plat,
-					    bool cold_boot)
+static inline int sbi_platform_irqchip_init(const struct sbi_platform *plat)
 {
 	if (plat && sbi_platform_ops(plat)->irqchip_init)
-		return sbi_platform_ops(plat)->irqchip_init(cold_boot);
+		return sbi_platform_ops(plat)->irqchip_init();
 	return 0;
 }
 
-/**
- * Exit the platform interrupt controller for current HART
- *
- * @param plat pointer to struct sbi_platform
- */
-static inline void sbi_platform_irqchip_exit(const struct sbi_platform *plat)
-{
-	if (plat && sbi_platform_ops(plat)->irqchip_exit)
-		sbi_platform_ops(plat)->irqchip_exit();
-}
-
 /**
  * Initialize the platform IPI support for current HART
  *
diff --git a/include/sbi_utils/irqchip/fdt_irqchip.h b/include/sbi_utils/irqchip/fdt_irqchip.h
index bc02c0c8..0ad00489 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip.h
@@ -17,19 +17,13 @@
 struct fdt_irqchip {
 	const struct fdt_match *match_table;
 	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
-	int (*warm_init)(void);
-	void (*exit)(void);
 };
 
-void fdt_irqchip_exit(void);
-
-int fdt_irqchip_init(bool cold_boot);
+int fdt_irqchip_init(void);
 
 #else
 
-static inline void fdt_irqchip_exit(void) { }
-
-static inline int fdt_irqchip_init(bool cold_boot) { return 0; }
+static inline int fdt_irqchip_init(void) { return 0; }
 
 #endif
 
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 1aa18b8b..ab487d16 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -42,9 +42,11 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	struct sbi_irqchip_device *dev;
 
-	rc = sbi_platform_irqchip_init(plat, cold_boot);
-	if (rc)
-		return rc;
+	if (cold_boot) {
+		rc = sbi_platform_irqchip_init(plat);
+		if (rc)
+			return rc;
+	}
 
 	sbi_list_for_each_entry(dev, &irqchip_list, node) {
 		if (!dev->warm_init)
@@ -62,10 +64,6 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 
 void sbi_irqchip_exit(struct sbi_scratch *scratch)
 {
-	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
-
 	if (ext_irqfn != default_irqfn)
 		csr_clear(CSR_MIE, MIP_MEIP);
-
-	sbi_platform_irqchip_exit(plat);
 }
diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index b4f054ae..2819540a 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -16,40 +16,8 @@
 extern struct fdt_irqchip *fdt_irqchip_drivers[];
 extern unsigned long fdt_irqchip_drivers_size;
 
-#define FDT_IRQCHIP_MAX_DRIVERS	8
-
-static struct fdt_irqchip *current_drivers[FDT_IRQCHIP_MAX_DRIVERS] = {0};
-static int current_drivers_count;
-
-void fdt_irqchip_exit(void)
-{
-	int i;
-
-	for (i = 0; i < current_drivers_count; i++) {
-		if (!current_drivers[i] || !current_drivers[i]->exit)
-			continue;
-		current_drivers[i]->exit();
-	}
-}
-
-static int fdt_irqchip_warm_init(void)
-{
-	int i, rc;
-
-	for (i = 0; i < current_drivers_count; i++) {
-		if (!current_drivers[i] || !current_drivers[i]->warm_init)
-			continue;
-		rc = current_drivers[i]->warm_init();
-		if (rc)
-			return rc;
-	}
-
-	return 0;
-}
-
-static int fdt_irqchip_cold_init(void)
+int fdt_irqchip_init(void)
 {
-	bool drv_added;
 	int pos, noff, rc;
 	struct fdt_irqchip *drv;
 	const struct fdt_match *match;
@@ -59,7 +27,6 @@ static int fdt_irqchip_cold_init(void)
 		drv = fdt_irqchip_drivers[pos];
 
 		noff = -1;
-		drv_added = false;
 		while ((noff = fdt_find_match(fdt, noff,
 					drv->match_table, &match)) >= 0) {
 			if (!fdt_node_is_enabled(fdt,noff))
@@ -72,30 +39,8 @@ static int fdt_irqchip_cold_init(void)
 				if (rc)
 					return rc;
 			}
-
-			if (drv_added)
-				continue;
-
-			current_drivers[current_drivers_count++] = drv;
-			drv_added = true;
 		}
-
-		if (FDT_IRQCHIP_MAX_DRIVERS <= current_drivers_count)
-			break;
 	}
 
 	return 0;
 }
-
-int fdt_irqchip_init(bool cold_boot)
-{
-	int rc;
-
-	if (cold_boot) {
-		rc = fdt_irqchip_cold_init();
-		if (rc)
-			return rc;
-	}
-
-	return fdt_irqchip_warm_init();
-}
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index ed6ccf12..532d8c48 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -49,6 +49,4 @@ static const struct fdt_match irqchip_aplic_match[] = {
 struct fdt_irqchip fdt_irqchip_aplic = {
 	.match_table = irqchip_aplic_match,
 	.cold_init = irqchip_aplic_cold_init,
-	.warm_init = NULL,
-	.exit = NULL,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 63be6007..40d63eb0 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -95,5 +95,4 @@ static const struct fdt_match irqchip_imsic_match[] = {
 struct fdt_irqchip fdt_irqchip_imsic = {
 	.match_table = irqchip_imsic_match,
 	.cold_init = irqchip_imsic_cold_init,
-	.warm_init = NULL,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 9066d745..a7388dcc 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -108,6 +108,4 @@ static const struct fdt_match irqchip_plic_match[] = {
 struct fdt_irqchip fdt_irqchip_plic = {
 	.match_table = irqchip_plic_match,
 	.cold_init = irqchip_plic_cold_init,
-	.warm_init = NULL,
-	.exit = NULL,
 };
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index ab3206cf..b95c5055 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -98,19 +98,11 @@ static int ariane_final_init(bool cold_boot)
 }
 
 /*
- * Initialize the ariane interrupt controller for current HART.
+ * Initialize the ariane interrupt controller during cold boot.
  */
-static int ariane_irqchip_init(bool cold_boot)
+static int ariane_irqchip_init(void)
 {
-	int ret;
-
-	if (cold_boot) {
-		ret = plic_cold_irqchip_init(&plic);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return plic_cold_irqchip_init(&plic);
 }
 
 /*
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 13585297..e4e338bf 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -131,19 +131,11 @@ static int openpiton_final_init(bool cold_boot)
 }
 
 /*
- * Initialize the openpiton interrupt controller for current HART.
+ * Initialize the openpiton interrupt controller during cold boot.
  */
-static int openpiton_irqchip_init(bool cold_boot)
+static int openpiton_irqchip_init(void)
 {
-	int ret;
-
-	if (cold_boot) {
-		ret = plic_cold_irqchip_init(&plic);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return plic_cold_irqchip_init(&plic);
 }
 
 /*
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 49d877d0..24ce0ffb 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -397,7 +397,6 @@ const struct sbi_platform_operations platform_ops = {
 	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
 	.irqchip_init		= fdt_irqchip_init,
-	.irqchip_exit		= fdt_irqchip_exit,
 	.ipi_init		= fdt_ipi_init,
 	.ipi_exit		= fdt_ipi_exit,
 	.pmu_init		= generic_pmu_init,
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index ebfab715..74bf76a2 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -136,17 +136,9 @@ static int k210_final_init(bool cold_boot)
 	return 0;
 }
 
-static int k210_irqchip_init(bool cold_boot)
+static int k210_irqchip_init(void)
 {
-	int rc;
-
-	if (cold_boot) {
-		rc = plic_cold_irqchip_init(&plic);
-		if (rc)
-			return rc;
-	}
-
-	return 0;
+	return plic_cold_irqchip_init(&plic);
 }
 
 static int k210_ipi_init(bool cold_boot)
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 0a823e0e..79ad2c94 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -190,17 +190,9 @@ static int ux600_final_init(bool cold_boot)
 	return 0;
 }
 
-static int ux600_irqchip_init(bool cold_boot)
+static int ux600_irqchip_init(void)
 {
-	int rc;
-
-	if (cold_boot) {
-		rc = plic_cold_irqchip_init(&plic);
-		if (rc)
-			return rc;
-	}
-
-	return 0;
+	return plic_cold_irqchip_init(&plic);
 }
 
 static int ux600_ipi_init(bool cold_boot)
diff --git a/platform/template/platform.c b/platform/template/platform.c
index a13798d9..037d9c92 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -87,20 +87,12 @@ static int platform_final_init(bool cold_boot)
 }
 
 /*
- * Initialize the platform interrupt controller for current HART.
+ * Initialize the platform interrupt controller during cold boot.
  */
-static int platform_irqchip_init(bool cold_boot)
+static int platform_irqchip_init(void)
 {
-	int ret;
-
 	/* Example if the generic PLIC driver is used */
-	if (cold_boot) {
-		ret = plic_cold_irqchip_init(&plic);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return plic_cold_irqchip_init(&plic);
 }
 
 /*
-- 
2.45.1


