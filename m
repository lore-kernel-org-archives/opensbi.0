From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  3 May 2022 09:07:54 +0530
Subject: [PATCH 06/11] lib: utils/irqchip: Generate FDT irqchip driver list at
 compile-time
In-Reply-To: <20220503033759.544156-1-apatel@ventanamicro.com>
References: <20220503033759.544156-1-apatel@ventanamicro.com>
Message-ID: <20220503033759.544156-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having FDT irqchip driver list hard-coded in the C source,
we generate it using carray.sh at compile-time.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/irqchip/fdt_irqchip.c              | 16 +++++-----------
 lib/utils/irqchip/fdt_irqchip_drivers.carray |  3 +++
 lib/utils/irqchip/objects.mk                 |  8 ++++++++
 3 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 lib/utils/irqchip/fdt_irqchip_drivers.carray

diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index 6007755..1b6b674 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -12,15 +12,9 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 
-extern struct fdt_irqchip fdt_irqchip_aplic;
-extern struct fdt_irqchip fdt_irqchip_imsic;
-extern struct fdt_irqchip fdt_irqchip_plic;
-
-static struct fdt_irqchip *irqchip_drivers[] = {
-	&fdt_irqchip_aplic,
-	&fdt_irqchip_imsic,
-	&fdt_irqchip_plic
-};
+/* List of FDT irqchip drivers generated at compile time */
+extern struct fdt_irqchip *fdt_irqchip_drivers[];
+extern unsigned long fdt_irqchip_drivers_size;
 
 #define FDT_IRQCHIP_MAX_DRIVERS	8
 
@@ -61,8 +55,8 @@ static int fdt_irqchip_cold_init(void)
 	const struct fdt_match *match;
 	void *fdt = fdt_get_address();
 
-	for (pos = 0; pos < array_size(irqchip_drivers); pos++) {
-		drv = irqchip_drivers[pos];
+	for (pos = 0; pos < fdt_irqchip_drivers_size; pos++) {
+		drv = fdt_irqchip_drivers[pos];
 
 		noff = -1;
 		drv_added = false;
diff --git a/lib/utils/irqchip/fdt_irqchip_drivers.carray b/lib/utils/irqchip/fdt_irqchip_drivers.carray
new file mode 100644
index 0000000..b373be5
--- /dev/null
+++ b/lib/utils/irqchip/fdt_irqchip_drivers.carray
@@ -0,0 +1,3 @@
+HEADER: sbi_utils/irqchip/fdt_irqchip.h
+TYPE: struct fdt_irqchip
+NAME: fdt_irqchip_drivers
diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
index fad4344..7775bc4 100644
--- a/lib/utils/irqchip/objects.mk
+++ b/lib/utils/irqchip/objects.mk
@@ -8,9 +8,17 @@
 #
 
 libsbiutils-objs-y += irqchip/fdt_irqchip.o
+libsbiutils-objs-y += irqchip/fdt_irqchip_drivers.o
+
+carray-fdt_irqchip_drivers-y += fdt_irqchip_aplic
 libsbiutils-objs-y += irqchip/fdt_irqchip_aplic.o
+
+carray-fdt_irqchip_drivers-y += fdt_irqchip_imsic
 libsbiutils-objs-y += irqchip/fdt_irqchip_imsic.o
+
+carray-fdt_irqchip_drivers-y += fdt_irqchip_plic
 libsbiutils-objs-y += irqchip/fdt_irqchip_plic.o
+
 libsbiutils-objs-y += irqchip/aplic.o
 libsbiutils-objs-y += irqchip/imsic.o
 libsbiutils-objs-y += irqchip/plic.o
-- 
2.34.1


