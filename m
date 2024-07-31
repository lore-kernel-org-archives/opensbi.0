From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:48 -0700
Subject: [PATCH 07/16] lib: utils/irqchip: Constify FDT pointers in parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-8-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Indicate that none of these functions modify the devicetree by
constifying the parameter type.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/irqchip/fdt_irqchip.h | 2 +-
 lib/utils/irqchip/fdt_irqchip.c         | 2 +-
 lib/utils/irqchip/fdt_irqchip_aplic.c   | 4 ++--
 lib/utils/irqchip/fdt_irqchip_imsic.c   | 6 +++---
 lib/utils/irqchip/fdt_irqchip_plic.c    | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sbi_utils/irqchip/fdt_irqchip.h b/include/sbi_utils/irqchip/fdt_irqchip.h
index 63e9fd9e..bc02c0c8 100644
--- a/include/sbi_utils/irqchip/fdt_irqchip.h
+++ b/include/sbi_utils/irqchip/fdt_irqchip.h
@@ -16,7 +16,7 @@
 
 struct fdt_irqchip {
 	const struct fdt_match *match_table;
-	int (*cold_init)(void *fdt, int nodeoff, const struct fdt_match *match);
+	int (*cold_init)(const void *fdt, int nodeoff, const struct fdt_match *match);
 	int (*warm_init)(void);
 	void (*exit)(void);
 };
diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index c38b1d85..b4f054ae 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -53,7 +53,7 @@ static int fdt_irqchip_cold_init(void)
 	int pos, noff, rc;
 	struct fdt_irqchip *drv;
 	const struct fdt_match *match;
-	void *fdt = fdt_get_address();
+	const void *fdt = fdt_get_address();
 
 	for (pos = 0; pos < fdt_irqchip_drivers_size; pos++) {
 		drv = fdt_irqchip_drivers[pos];
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 583a3e30..6eb6e085 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -22,8 +22,8 @@ static int irqchip_aplic_warm_init(void)
 	return 0;
 }
 
-static int irqchip_aplic_cold_init(void *fdt, int nodeoff,
-				  const struct fdt_match *match)
+static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
+				   const struct fdt_match *match)
 {
 	int rc;
 	struct aplic_data *pd;
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 4eb18545..ca62b427 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -16,7 +16,7 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
 
-static int irqchip_imsic_update_hartid_table(void *fdt, int nodeoff,
+static int irqchip_imsic_update_hartid_table(const void *fdt, int nodeoff,
 					     struct imsic_data *id)
 {
 	const fdt32_t *val;
@@ -58,8 +58,8 @@ static int irqchip_imsic_update_hartid_table(void *fdt, int nodeoff,
 	return 0;
 }
 
-static int irqchip_imsic_cold_init(void *fdt, int nodeoff,
-				    const struct fdt_match *match)
+static int irqchip_imsic_cold_init(const void *fdt, int nodeoff,
+				   const struct fdt_match *match)
 {
 	int rc;
 	struct imsic_data *id;
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 829c5ee2..a8aa4fcd 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -85,7 +85,7 @@ static int irqchip_plic_warm_init(void)
 				      plic_get_hart_scontext(scratch));
 }
 
-static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
+static int irqchip_plic_update_hartid_table(const void *fdt, int nodeoff,
 					    struct plic_data *pd)
 {
 	const fdt32_t *val;
@@ -132,7 +132,7 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
 	return 0;
 }
 
-static int irqchip_plic_cold_init(void *fdt, int nodeoff,
+static int irqchip_plic_cold_init(const void *fdt, int nodeoff,
 				  const struct fdt_match *match)
 {
 	int rc;
-- 
2.45.1


