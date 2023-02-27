From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:31:06 +0100
Subject: [PATCH v2 11/11] platform: generic: Add system suspend test
In-Reply-To: <20230227103106.137995-1-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com>
Message-ID: <20230227103106.137995-12-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the system-suspend-test property is present in the domain config
node as shown below, implement system suspend with a simple 5 second
delay followed by a WFI. This allows testing system suspend when the
low-level firmware doesn't support it.

  / {
    chosen {
      opensbi-domains {
          compatible = "opensbi,domain,config";
          system-suspend-test;
      };

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 docs/domain_support.md      |  4 ++++
 include/sbi/sbi_system.h    |  1 +
 lib/sbi/sbi_system.c        | 31 +++++++++++++++++++++++++++++++
 platform/generic/platform.c | 20 +++++++++++++++++++-
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 265d8d85786e..c13014a5f7cf 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -126,6 +126,9 @@ The DT properties of a domain configuration DT node are as follows:
 * **compatible** (Mandatory) - The compatible string of the domain
   configuration. This DT property should have value *"opensbi,domain,config"*
 
+* **system-suspend-test** (Optional) - When present, enable a system
+  suspend test implementation which simply waits five seconds and issues a WFI.
+
 ### Domain Memory Region Node
 
 The domain memory region DT node describes details of a memory region and
@@ -234,6 +237,7 @@ be done:
     chosen {
         opensbi-domains {
             compatible = "opensbi,domain,config";
+            system-suspend-test;
 
             tmem: tmem {
                 compatible = "opensbi,domain,memregion";
diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
index d70ef8bb8874..b4e86aef8949 100644
--- a/include/sbi/sbi_system.h
+++ b/include/sbi/sbi_system.h
@@ -66,6 +66,7 @@ struct sbi_system_suspend_device {
 
 const struct sbi_system_suspend_device *sbi_system_suspend_get_device(void);
 void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev);
+void sbi_system_suspend_test_enable(void);
 bool sbi_system_suspend_supported(u32 sleep_type);
 int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque);
 
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 7fa5ea82b7a6..6eaf6c9508e0 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_init.h>
+#include <sbi/sbi_timer.h>
 
 static SBI_LIST_HEAD(reset_devices_list);
 
@@ -108,6 +109,36 @@ void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev)
 	suspend_dev = dev;
 }
 
+static int sbi_system_suspend_test_check(u32 sleep_type)
+{
+	return sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND;
+}
+
+static int sbi_system_suspend_test_suspend(u32 sleep_type,
+					   unsigned long warmboot_addr)
+{
+	if (sleep_type != SBI_SUSP_SLEEP_TYPE_SUSPEND)
+		return SBI_EINVAL;
+
+	sbi_timer_mdelay(5000);
+
+	/* Wait for interrupt */
+	wfi();
+
+	return SBI_OK;
+}
+
+static struct sbi_system_suspend_device sbi_system_suspend_test = {
+	.name = "system-suspend-test",
+	.system_suspend_check = sbi_system_suspend_test_check,
+	.system_suspend = sbi_system_suspend_test_suspend,
+};
+
+void sbi_system_suspend_test_enable(void)
+{
+	sbi_system_suspend_set_device(&sbi_system_suspend_test);
+}
+
 bool sbi_system_suspend_supported(u32 sleep_type)
 {
 	return suspend_dev && suspend_dev->system_suspend_check &&
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 0b90fd7c1446..eeefef4c9533 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_string.h>
+#include <sbi/sbi_system.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -219,7 +220,24 @@ static int generic_extensions_init(struct sbi_hart_features *hfeatures)
 
 static int generic_domains_init(void)
 {
-	return fdt_domains_populate(fdt_get_address());
+	void *fdt = fdt_get_address();
+	int offset, ret;
+
+	ret = fdt_domains_populate(fdt);
+	if (ret < 0)
+		return ret;
+
+	offset = fdt_path_offset(fdt, "/chosen");
+
+	if (offset >= 0) {
+		offset = fdt_node_offset_by_compatible(fdt, offset,
+						       "opensbi,domain,config");
+		if (offset >= 0 &&
+		    fdt_get_property(fdt, offset, "system-suspend-test", NULL))
+			sbi_system_suspend_test_enable();
+	}
+
+	return 0;
 }
 
 static u64 generic_tlbr_flush_limit(void)
-- 
2.39.1


