From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:08 -0800
Subject: [PATCH 7/9] lib: sbi_irqchip: Call driver warm_init from SBI core
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-8-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, each platform keeps track of which irqchip driver is in use
and calls its warm init function. Since the generic platform may use
multiple irqchip drivers, it has logic to track an array of drivers.

The code is simplified and made common across platforms by treating warm
init and exit as properties of the driver, not the platform. Then the
platform's only role is to select and prepare a driver during cold boot.

For now, only add a .warm_init hook, since none of the existing drivers
need an .exit hook. It could be added in the future if needed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_irqchip.h             | 3 +++
 include/sbi_utils/irqchip/imsic.h     | 2 --
 include/sbi_utils/irqchip/plic.h      | 2 --
 lib/sbi/sbi_irqchip.c                 | 9 +++++++++
 lib/utils/irqchip/fdt_irqchip_aplic.c | 8 +-------
 lib/utils/irqchip/fdt_irqchip_imsic.c | 2 +-
 lib/utils/irqchip/fdt_irqchip_plic.c  | 2 +-
 lib/utils/irqchip/imsic.c             | 3 ++-
 lib/utils/irqchip/plic.c              | 3 ++-
 platform/fpga/ariane/platform.c       | 2 +-
 platform/fpga/openpiton/platform.c    | 2 +-
 platform/kendryte/k210/platform.c     | 2 +-
 platform/nuclei/ux600/platform.c      | 2 +-
 platform/template/platform.c          | 2 +-
 14 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index c88b760a..9d26067f 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -19,6 +19,9 @@ struct sbi_scratch;
 struct sbi_irqchip_device {
 	/** Node in the list of irqchip devices */
 	struct sbi_dlist node;
+
+	/** Initialize per-hart state for the current hart */
+	int (*warm_init)(struct sbi_irqchip_device *dev);
 };
 
 /**
diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index bc9292d3..353cefec 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -43,8 +43,6 @@ int imsic_get_target_file(u32 hartindex);
 
 void imsic_local_irqchip_init(void);
 
-int imsic_warm_irqchip_init(void);
-
 int imsic_data_check(struct imsic_data *imsic);
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic);
diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 5c638e14..a173871e 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -42,8 +42,6 @@ void plic_suspend(void);
 
 void plic_resume(void);
 
-int plic_warm_irqchip_init(void);
-
 int plic_cold_irqchip_init(struct plic_data *plic);
 
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 2ab9d1ff..1aa18b8b 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -40,11 +40,20 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct sbi_irqchip_device *dev;
 
 	rc = sbi_platform_irqchip_init(plat, cold_boot);
 	if (rc)
 		return rc;
 
+	sbi_list_for_each_entry(dev, &irqchip_list, node) {
+		if (!dev->warm_init)
+			continue;
+		rc = dev->warm_init(dev);
+		if (rc)
+			return rc;
+	}
+
 	if (ext_irqfn != default_irqfn)
 		csr_set(CSR_MIE, MIP_MEIP);
 
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 6eb6e085..ed6ccf12 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -16,12 +16,6 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
 
-static int irqchip_aplic_warm_init(void)
-{
-	/* Nothing to do here. */
-	return 0;
-}
-
 static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 				   const struct fdt_match *match)
 {
@@ -55,6 +49,6 @@ static const struct fdt_match irqchip_aplic_match[] = {
 struct fdt_irqchip fdt_irqchip_aplic = {
 	.match_table = irqchip_aplic_match,
 	.cold_init = irqchip_aplic_cold_init,
-	.warm_init = irqchip_aplic_warm_init,
+	.warm_init = NULL,
 	.exit = NULL,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index ca62b427..63be6007 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -95,5 +95,5 @@ static const struct fdt_match irqchip_imsic_match[] = {
 struct fdt_irqchip fdt_irqchip_imsic = {
 	.match_table = irqchip_imsic_match,
 	.cold_init = irqchip_imsic_cold_init,
-	.warm_init = imsic_warm_irqchip_init,
+	.warm_init = NULL,
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index ebde7eec..9066d745 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -108,6 +108,6 @@ static const struct fdt_match irqchip_plic_match[] = {
 struct fdt_irqchip fdt_irqchip_plic = {
 	.match_table = irqchip_plic_match,
 	.cold_init = irqchip_plic_cold_init,
-	.warm_init = plic_warm_irqchip_init,
+	.warm_init = NULL,
 	.exit = NULL,
 };
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index a3b2cf09..b5198b43 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -255,7 +255,7 @@ void imsic_local_irqchip_init(void)
 	imsic_local_eix_update(IMSIC_IPI_ID, 1, false, true);
 }
 
-int imsic_warm_irqchip_init(void)
+static int imsic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 {
 	struct imsic_data *imsic = imsic_get_data(current_hartindex());
 
@@ -346,6 +346,7 @@ int imsic_data_check(struct imsic_data *imsic)
 }
 
 static struct sbi_irqchip_device imsic_device = {
+	.warm_init	= imsic_warm_irqchip_init,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index f9eb7411..7761ae98 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -190,7 +190,7 @@ void plic_resume(void)
 	plic_delegate(plic);
 }
 
-int plic_warm_irqchip_init(void)
+static int plic_warm_irqchip_init(struct sbi_irqchip_device *dev)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	const struct plic_data *plic = plic_get_hart_data_ptr(scratch);
@@ -222,6 +222,7 @@ int plic_warm_irqchip_init(void)
 }
 
 static struct sbi_irqchip_device plic_device = {
+	.warm_init	= plic_warm_irqchip_init,
 };
 
 int plic_cold_irqchip_init(struct plic_data *plic)
diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
index c4ac0ae6..ab3206cf 100644
--- a/platform/fpga/ariane/platform.c
+++ b/platform/fpga/ariane/platform.c
@@ -110,7 +110,7 @@ static int ariane_irqchip_init(bool cold_boot)
 			return ret;
 	}
 
-	return plic_warm_irqchip_init();
+	return 0;
 }
 
 /*
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 73429f88..13585297 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -143,7 +143,7 @@ static int openpiton_irqchip_init(bool cold_boot)
 			return ret;
 	}
 
-	return plic_warm_irqchip_init();
+	return 0;
 }
 
 /*
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index e1808d17..ebfab715 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -146,7 +146,7 @@ static int k210_irqchip_init(bool cold_boot)
 			return rc;
 	}
 
-	return plic_warm_irqchip_init();
+	return 0;
 }
 
 static int k210_ipi_init(bool cold_boot)
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 12657bc0..0a823e0e 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -200,7 +200,7 @@ static int ux600_irqchip_init(bool cold_boot)
 			return rc;
 	}
 
-	return plic_warm_irqchip_init();
+	return 0;
 }
 
 static int ux600_ipi_init(bool cold_boot)
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 298301a4..a13798d9 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -100,7 +100,7 @@ static int platform_irqchip_init(bool cold_boot)
 			return ret;
 	}
 
-	return plic_warm_irqchip_init();
+	return 0;
 }
 
 /*
-- 
2.45.1


