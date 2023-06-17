From: guoren@kernel.org <guoren@kernel.org>
Date: Sat, 17 Jun 2023 01:26:34 -0400
Subject: [PATCH] lib: reset: Add early_init api for fdt_reset_drv
Message-ID: <20230617052634.2983006-1-guoren@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Guo Ren <guoren@linux.alibaba.com>

The fdt_reset_thead driver needs to modify the __reset_thead_csr_stub
text region for the secondary harts booting. After that, the
sbi_hart_pmp_configure may lock down the text region with M_READABLE &
M_EXECUTABLE attributes in the future. Currently, the M_READABLE &
M_EXECUtABLE have no effect on m-mode, the L-bit in pmpcfg csr is
useless for the current opensbi scenario. See:

Priv-isa-spec 3.7.1.2. Locking and Privilege Mode
When the L bit is clear, any M-mode access matching the PMP entry will
succeed; the R/W/X permissions apply only to S and U modes.

That's why current fdt_reset_thead could still work well after commit:
230278dcf127 ("lib: sbi: Add separate entries for firmware RX and RW
regions"). So this patch fixes up a fake bug for the M-mode permission
setting of the future.

Fixes: 230278dcf127 ("lib: sbi: Add separate entries for firmware RX and RW regions")
Link: http://lists.infradead.org/pipermail/opensbi/2023-June/005176.html
Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 include/sbi_utils/reset/fdt_reset.h |  9 +++++----
 lib/utils/reset/fdt_reset.c         | 20 +++++++++++++-------
 lib/utils/reset/fdt_reset_thead.c   |  2 +-
 platform/generic/platform.c         |  5 ++++-
 platform/generic/sifive/fu740.c     |  2 +-
 platform/generic/starfive/jh7110.c  |  2 +-
 6 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index ea8063b8a90e..2b1849534e2b 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -15,6 +15,7 @@
 struct fdt_reset {
 	const struct fdt_match *match_table;
 	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*early_init)(void *fdt, int nodeoff, const struct fdt_match *match);
 };
 
 #ifdef CONFIG_FDT_RESET
@@ -22,22 +23,22 @@ struct fdt_reset {
 /**
  * fdt_reset_driver_init() - initialize reset driver based on the device-tree
  */
-int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv);
+int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv, bool early);
 
 /**
  * fdt_reset_init() - initialize reset drivers based on the device-tree
  *
  * This function shall be invoked in final init.
  */
-void fdt_reset_init(void);
+void fdt_reset_init(bool early);
 
 #else
 
-static inline int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
+static inline int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv, bool early)
 {
 	return 0;
 }
-static inline void fdt_reset_init(void) { }
+static inline void fdt_reset_init(bool early) { }
 
 #endif
 
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 4334586d39f7..a99d8ecc5907 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -17,31 +17,37 @@
 extern struct fdt_reset *fdt_reset_drivers[];
 extern unsigned long fdt_reset_drivers_size;
 
-int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv)
+int fdt_reset_driver_init(void *fdt, struct fdt_reset *drv, bool early)
 {
 	int noff, rc = SBI_ENODEV;
 	const struct fdt_match *match;
+	int (*init)(void *fdt, int nodeoff, const struct fdt_match *match);
 
 	noff = fdt_find_match(fdt, -1, drv->match_table, &match);
 	if (noff < 0)
 		return SBI_ENODEV;
 
-	if (drv->init) {
-		rc = drv->init(fdt, noff, match);
+	if (early)
+		init = drv->early_init;
+	else
+		init = drv->init;
+
+	if (init) {
+		rc = init(fdt, noff, match);
 		if (rc && rc != SBI_ENODEV) {
-			sbi_printf("%s: %s init failed, %d\n",
-				   __func__, match->compatible, rc);
+			sbi_printf("%s: %s %s-init failed, %d\n",
+				   __func__, match->compatible, early?"early":"final", rc);
 		}
 	}
 
 	return rc;
 }
 
-void fdt_reset_init(void)
+void fdt_reset_init(bool early)
 {
 	int pos;
 	void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_reset_drivers_size; pos++)
-		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
+		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos], early);
 }
diff --git a/lib/utils/reset/fdt_reset_thead.c b/lib/utils/reset/fdt_reset_thead.c
index e1d6885debae..4cae037b1db7 100644
--- a/lib/utils/reset/fdt_reset_thead.c
+++ b/lib/utils/reset/fdt_reset_thead.c
@@ -130,5 +130,5 @@ static const struct fdt_match thead_reset_match[] = {
 
 struct fdt_reset fdt_reset_thead = {
 	.match_table = thead_reset_match,
-	.init = thead_reset_init
+	.early_init = thead_reset_init
 };
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index eeefef4c9533..65134e2c3895 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -146,6 +146,9 @@ static int generic_early_init(bool cold_boot)
 	if (!generic_plat || !generic_plat->early_init)
 		return 0;
 
+	if (cold_boot)
+		fdt_reset_init(true);
+
 	return generic_plat->early_init(cold_boot, generic_plat_match);
 }
 
@@ -155,7 +158,7 @@ static int generic_final_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot)
-		fdt_reset_init();
+		fdt_reset_init(false);
 
 	if (generic_plat && generic_plat->final_init) {
 		rc = generic_plat->final_init(cold_boot, generic_plat_match);
diff --git a/platform/generic/sifive/fu740.c b/platform/generic/sifive/fu740.c
index fe71ce6a9ea5..5d3f1388beef 100644
--- a/platform/generic/sifive/fu740.c
+++ b/platform/generic/sifive/fu740.c
@@ -233,7 +233,7 @@ static int sifive_fu740_final_init(bool cold_boot,
 	void *fdt = fdt_get_address();
 
 	if (cold_boot) {
-		rc = fdt_reset_driver_init(fdt, &fdt_reset_da9063);
+		rc = fdt_reset_driver_init(fdt, &fdt_reset_da9063, false);
 		if (rc)
 			sbi_printf("%s: failed to find da9063 for reset\n",
 				   __func__);
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index dcd6306be5fc..f21fe85c6560 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -277,7 +277,7 @@ static int starfive_jh7110_final_init(bool cold_boot,
 	void *fdt = fdt_get_address();
 
 	if (cold_boot) {
-		fdt_reset_driver_init(fdt, &fdt_reset_pmic);
+		fdt_reset_driver_init(fdt, &fdt_reset_pmic, false);
 		return starfive_jh7110_inst_init(fdt);
 	}
 
-- 
2.36.1


