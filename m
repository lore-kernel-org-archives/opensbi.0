From: Cheng Yang <yangcheng.work@foxmail.com>
Date: Wed, 10 Apr 2024 14:03:23 +0800
Subject: [PATCH v3] lib:sbi:platform:generic: Improved mlevel imsic check and init.
Message-ID: <tencent_440B91346E44C8DA896C47A4D948B05B2B08@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The current mlevel imsic check is only for the platform, which
may cause hart without imsic in the platform to trigger an
illegal instruction exception when initializing imsic. For
example, the platform contains a management hart that only
supports wired interrupts.

This patch will check whether each hart has imsic according
to fdt and record it in a bitmap, and only allow harts with
imsic to initialize imsic to avoid triggering illegal instruction
exceptions.

Signed-off-by: Cheng Yang <yangcheng.work@foxmail.com>
---
Changes V2 -> V3:
  - Trailing whitespace.
  - Replace platform.hart_index2id to generic_hart_index2id.
Changes V1 -> V2:
  - Add the processing of plat->hart_index2id be NULL in fdt_check_imsic_mlevel.

 include/sbi/sbi_platform.h         |  8 ++++--
 include/sbi_utils/fdt/fdt_helper.h |  4 ++-
 lib/sbi/sbi_init.c                 |  2 +-
 lib/utils/fdt/fdt_helper.c         | 45 ++++++++++++++++++++++++------
 platform/generic/platform.c        | 26 ++++++++++++-----
 5 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 581935a..f62d23d 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -75,7 +75,7 @@ struct sbi_platform_operations {
 	bool (*cold_boot_allowed)(u32 hartid);

 	/* Platform nascent initialization */
-	int (*nascent_init)(void);
+	int (*nascent_init)(u32 hartid);

 	/** Platform early initialization */
 	int (*early_init)(bool cold_boot);
@@ -395,10 +395,12 @@ static inline bool sbi_platform_cold_boot_allowed(
  *
  * @return 0 on success and negative error code on failure
  */
-static inline int sbi_platform_nascent_init(const struct sbi_platform *plat)
+static inline int sbi_platform_nascent_init(
+					const struct sbi_platform *plat,
+					u32 hartid)
 {
 	if (plat && sbi_platform_ops(plat)->nascent_init)
-		return sbi_platform_ops(plat)->nascent_init();
+		return sbi_platform_ops(plat)->nascent_init(hartid);
 	return 0;
 }

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index ab4a80f..1b7fdeb 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -12,6 +12,7 @@

 #include <sbi/sbi_types.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_platform.h>

 struct fdt_match {
 	const char *compatible;
@@ -89,7 +90,8 @@ int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic);

 struct imsic_data;

-bool fdt_check_imsic_mlevel(void *fdt);
+int fdt_check_imsic_mlevel(void *fdt, struct sbi_platform *plat,
+						   unsigned long *imsic_bitmap);

 int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic);

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 389172a..96f71a4 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -545,7 +545,7 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 	 * that platform can initialize platform specific per-HART CSRs
 	 * or per-HART devices.
 	 */
-	if (sbi_platform_nascent_init(plat))
+	if (sbi_platform_nascent_init(plat, hartid))
 		sbi_hart_hang();

 	if (coldboot)
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index a0e93b9..ae5d9cc 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -764,27 +764,54 @@ skip_delegate_parse:
 	return 0;
 }

-bool fdt_check_imsic_mlevel(void *fdt)
+int fdt_check_imsic_mlevel(void *fdt, struct sbi_platform *plat, unsigned long *imsic_bitmap)
 {
 	const fdt32_t *val;
-	int i, len, noff = 0;
+	int i, h, len, err, cpu_offset, cpu_intc_offset, noff = 0;
+	u32 phandle, hwirq, hartid;
+
+	bitmap_zero(imsic_bitmap, SBI_HARTMASK_MAX_BITS);

 	if (!fdt)
-		return false;
+		return SBI_ENODEV;

 	while ((noff = fdt_node_offset_by_compatible(fdt, noff,
 						     "riscv,imsics")) >= 0) {
 		val = fdt_getprop(fdt, noff, "interrupts-extended", &len);
-		if (val && len > sizeof(fdt32_t)) {
-			len = len / sizeof(fdt32_t);
-			for (i = 0; i < len; i += 2) {
-				if (fdt32_to_cpu(val[i + 1]) == IRQ_M_EXT)
-					return true;
+		if (!val || len < sizeof(fdt32_t))
+			continue;
+
+		len = len / sizeof(fdt32_t);
+		for (i = 0; i < len; i += 2) {
+			phandle = fdt32_to_cpu(val[i]);
+			hwirq = fdt32_to_cpu(val[i + 1]);
+
+			if (hwirq != IRQ_M_EXT)
+				continue;
+
+			cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
+			if (cpu_intc_offset < 0)
+				continue;
+
+			cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
+			if (cpu_offset < 0)
+				continue;
+
+			err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+			if (err)
+				return SBI_EINVAL;
+
+			for (int i = 0; i < plat->hart_count; i++) {
+				h = plat->hart_index2id ? plat->hart_index2id[i] : i;
+				if (hartid == h) {
+					bitmap_set(imsic_bitmap, i, 1);
+					break;
+				}
 			}
 		}
 	}

-	return false;
+	return SBI_OK;
 }

 int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1f46b76..00f8f86 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -70,15 +70,15 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
 }

 extern struct sbi_platform platform;
-static bool platform_has_mlevel_imsic = false;
 static u32 generic_hart_index2id[SBI_HARTMASK_MAX_BITS] = { 0 };

 static DECLARE_BITMAP(generic_coldboot_harts, SBI_HARTMASK_MAX_BITS);
+static DECLARE_BITMAP(generic_hart_has_mlevel_imsic, SBI_HARTMASK_MAX_BITS);

 /*
- * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
+ * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
  * function to initialize the cold boot harts allowed by the generic platform
- * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
+ * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
  * DT node. If there is no "cold-boot-harts" in DT, all harts will be allowed.
  */
 static void fw_platform_coldboot_harts_init(void *fdt)
@@ -186,7 +186,11 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,

 	platform.hart_count = hart_count;
 	platform.heap_size = fw_platform_calculate_heap_size(hart_count);
-	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
+
+	rc = fdt_check_imsic_mlevel(fdt, &platform,
+								generic_hart_has_mlevel_imsic);
+	if (rc)
+		goto fail;

 	fw_platform_coldboot_harts_init(fdt);

@@ -212,10 +216,18 @@ static bool generic_cold_boot_allowed(u32 hartid)
 	return false;
 }

-static int generic_nascent_init(void)
+static int generic_nascent_init(u32 hartid)
 {
-	if (platform_has_mlevel_imsic)
-		imsic_local_irqchip_init();
+	for (int i = 0; i < platform.hart_count; i++) {
+		if (hartid != generic_hart_index2id[i])
+			continue;
+
+		if (bitmap_test(generic_hart_has_mlevel_imsic, i)) {
+			imsic_local_irqchip_init();
+			break;
+		}
+	}
+
 	return 0;
 }

--
2.34.1


