From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:55 -0700
Subject: [PATCH 14/16] lib: utils/reset: Pass the FDT to fdt_reset_init()
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-15-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that this function does not modify the FDT blob, and
deduplicate the call to fdt_get_address().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/reset/fdt_reset.h | 4 ++--
 lib/utils/reset/fdt_reset.c         | 3 +--
 platform/generic/platform.c         | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sbi_utils/reset/fdt_reset.h b/include/sbi_utils/reset/fdt_reset.h
index 80179873..f126fd33 100644
--- a/include/sbi_utils/reset/fdt_reset.h
+++ b/include/sbi_utils/reset/fdt_reset.h
@@ -29,7 +29,7 @@ int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv);
  *
  * This function shall be invoked in final init.
  */
-void fdt_reset_init(void);
+void fdt_reset_init(const void *fdt);
 
 #else
 
@@ -37,7 +37,7 @@ static inline int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
 {
 	return 0;
 }
-static inline void fdt_reset_init(void) { }
+static inline void fdt_reset_init(const void *fdt) { }
 
 #endif
 
diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index 960c08d0..05deb75e 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -42,10 +42,9 @@ int fdt_reset_driver_init(const void *fdt, struct fdt_reset *drv)
 	return cnt > 0 ? 0 : SBI_ENODEV;
 }
 
-void fdt_reset_init(void)
+void fdt_reset_init(const void *fdt)
 {
 	int pos;
-	const void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_reset_drivers_size; pos++)
 		fdt_reset_driver_init(fdt, fdt_reset_drivers[pos]);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 6f9fb4db..2850d55d 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -225,7 +225,7 @@ static int generic_early_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		fdt_reset_init();
+		fdt_reset_init(fdt);
 
 		if (semihosting_enabled())
 			rc = semihosting_init();
-- 
2.45.1


