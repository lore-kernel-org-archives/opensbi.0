From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon,  4 Nov 2024 20:10:07 -0800
Subject: [PATCH 6/9] lib: sbi_irqchip: Register devices during cold init
In-Reply-To: <20241105041015.2949808-1-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com>
Message-ID: <20241105041015.2949808-7-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Have the SBI irqchip core keep track of registered irqchip devices. This
is useful for any callbacks the irqchip driver may have, such as for
warm initialization, the external interrupt handler function, and any
future support for handling external interrupts (beyond IPIs) in M-mode.

This improves on the tracking done in fdt_irqchip.c, as it tracks device
instances, not just drivers, so callbacks can target a specific device.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_irqchip.h | 10 ++++++++++
 lib/sbi/sbi_irqchip.c     |  8 ++++++++
 lib/utils/irqchip/aplic.c |  7 +++++++
 lib/utils/irqchip/imsic.c |  6 ++++++
 lib/utils/irqchip/plic.c  |  7 +++++++
 5 files changed, 38 insertions(+)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 0ed02eb4..c88b760a 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -10,10 +10,17 @@
 #ifndef __SBI_IRQCHIP_H__
 #define __SBI_IRQCHIP_H__
 
+#include <sbi/sbi_list.h>
 #include <sbi/sbi_types.h>
 
 struct sbi_scratch;
 
+/** irqchip hardware device */
+struct sbi_irqchip_device {
+	/** Node in the list of irqchip devices */
+	struct sbi_dlist node;
+};
+
 /**
  * Set external interrupt handling function
  *
@@ -34,6 +41,9 @@ void sbi_irqchip_set_irqfn(int (*fn)(void));
  */
 int sbi_irqchip_process(void);
 
+/** Register an irqchip device to receive callbacks */
+void sbi_irqchip_add_device(struct sbi_irqchip_device *dev);
+
 /** Initialize interrupt controllers */
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
 
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 0ae604aa..2ab9d1ff 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -8,8 +8,11 @@
  */
 
 #include <sbi/sbi_irqchip.h>
+#include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
 
+static SBI_LIST_HEAD(irqchip_list);
+
 static int default_irqfn(void)
 {
 	return SBI_ENODEV;
@@ -28,6 +31,11 @@ int sbi_irqchip_process(void)
 	return ext_irqfn();
 }
 
+void sbi_irqchip_add_device(struct sbi_irqchip_device *dev)
+{
+	sbi_list_add_tail(&dev->node, &irqchip_list);
+}
+
 int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 28f2f26d..27371849 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
 
 #define APLIC_MAX_IDC			(1UL << 14)
@@ -165,6 +166,9 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 	return 0;
 }
 
+static struct sbi_irqchip_device aplic_device = {
+};
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
@@ -275,5 +279,8 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 			return rc;
 	}
 
+	/* Register irqchip device */
+	sbi_irqchip_add_device(&aplic_device);
+
 	return 0;
 }
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index ae8b31e0..a3b2cf09 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -345,6 +345,9 @@ int imsic_data_check(struct imsic_data *imsic)
 	return 0;
 }
 
+static struct sbi_irqchip_device imsic_device = {
+};
+
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
 {
 	int i, rc;
@@ -387,6 +390,9 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 			return rc;
 	}
 
+	/* Register irqchip device */
+	sbi_irqchip_add_device(&imsic_device);
+
 	/* Register IPI device */
 	sbi_ipi_set_device(&imsic_ipi_device);
 
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index ca506c4c..f9eb7411 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -15,6 +15,7 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_string.h>
 #include <sbi_utils/irqchip/plic.h>
 
@@ -220,6 +221,9 @@ int plic_warm_irqchip_init(void)
 	return 0;
 }
 
+static struct sbi_irqchip_device plic_device = {
+};
+
 int plic_cold_irqchip_init(struct plic_data *plic)
 {
 	int i, ret;
@@ -278,5 +282,8 @@ int plic_cold_irqchip_init(struct plic_data *plic)
 		plic_set_hart_data_ptr(sbi_hartindex_to_scratch(i), plic);
 	}
 
+	/* Register irqchip device */
+	sbi_irqchip_add_device(&plic_device);
+
 	return 0;
 }
-- 
2.45.1


