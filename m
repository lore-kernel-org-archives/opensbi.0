From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 14 Oct 2022 08:32:49 +0800
Subject: [PATCH v4 11/14] platform: andes/ae350: Add fw_platform_init for platform initialization
In-Reply-To: <20221014003252.17765-1-peterlin@andestech.com>
References: <20221014003252.17765-1-peterlin@andestech.com>
Message-ID: <20221014003252.17765-12-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds fw_platform_init() to initialize ae350 platform.name
and platform.hart_count by parsing device tree.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 platform/andes/ae350/platform.c | 51 +++++++++++++++++++++++++++++++--
 platform/andes/ae350/platform.h |  2 --
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 98acaaa..cf5417c 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -6,14 +6,18 @@
  * Authors:
  *   Zong Li <zong@andestech.com>
  *   Nylon Chen <nylon7@andestech.com>
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
  */
 
+#include <libfdt.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_const.h>
+#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -25,6 +29,49 @@
 #include "plicsw.h"
 #include "cache.h"
 
+struct sbi_platform platform;
+unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
+				unsigned long arg2, unsigned long arg3,
+				unsigned long arg4)
+{
+	const char *model;
+	void *fdt = (void *)arg1;
+	u32 hartid, hart_count = 0;
+	int rc, root_offset, cpus_offset, cpu_offset, len;
+
+	root_offset = fdt_path_offset(fdt, "/");
+	if (root_offset < 0)
+		goto fail;
+
+	model = fdt_getprop(fdt, root_offset, "model", &len);
+	if (model)
+		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		goto fail;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (rc)
+			continue;
+
+		if (SBI_HARTMASK_MAX_BITS <= hartid)
+			continue;
+
+		hart_count++;
+	}
+
+	platform.hart_count = hart_count;
+
+	/* Return original FDT pointer */
+	return arg1;
+
+fail:
+	while (1)
+		wfi();
+}
+
 /* Platform final initialization. */
 static int ae350_final_init(bool cold_boot)
 {
@@ -123,14 +170,14 @@ const struct sbi_platform_operations platform_ops = {
 	.vendor_ext_provider = ae350_vendor_ext_provider
 };
 
-const struct sbi_platform platform = {
+struct sbi_platform platform = {
 	.opensbi_version = OPENSBI_VERSION,
 	.platform_version =
 		SBI_PLATFORM_VERSION(CONFIG_PLATFORM_ANDES_AE350_MAJOR_VER,
 				     CONFIG_PLATFORM_ANDES_AE350_MINOR_VER),
 	.name = CONFIG_PLATFORM_ANDES_AE350_NAME,
 	.features = SBI_PLATFORM_DEFAULT_FEATURES,
-	.hart_count = AE350_HART_COUNT,
+	.hart_count = SBI_HARTMASK_MAX_BITS,
 	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
 	.platform_ops_addr = (unsigned long)&platform_ops
 };
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
index 3264b6f..3003bb4 100644
--- a/platform/andes/ae350/platform.h
+++ b/platform/andes/ae350/platform.h
@@ -11,8 +11,6 @@
 #ifndef _AE350_PLATFORM_H_
 #define _AE350_PLATFORM_H_
 
-#define AE350_HART_COUNT		4
-
 #define AE350_PLICSW_ADDR		0xe6400000
 
 #define AE350_L2C_ADDR			0xe0500000
-- 
2.34.1


