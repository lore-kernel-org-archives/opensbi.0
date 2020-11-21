From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 21 Nov 2020 15:17:56 +0530
Subject: [PATCH 11/11] platform: generic: Populate domains from FDT
In-Reply-To: <20201121094756.4154728-1-anup.patel@wdc.com>
References: <20201121094756.4154728-1-anup.patel@wdc.com>
Message-ID: <20201121094756.4154728-12-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The generic platform should populate domains from FDT using the
domain FDT helper routines.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 platform/generic/platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index d902e71..63c405a 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
@@ -148,6 +149,7 @@ static int generic_final_init(bool cold_boot)
 
 	fdt_cpu_fixup(fdt);
 	fdt_fixups(fdt);
+	fdt_domain_fixup(fdt);
 
 	if (generic_plat && generic_plat->fdt_fixup) {
 		rc = generic_plat->fdt_fixup(fdt, generic_plat_match);
@@ -170,6 +172,11 @@ static void generic_final_exit(void)
 		generic_plat->final_exit(generic_plat_match);
 }
 
+static int generic_domains_init(void)
+{
+	return fdt_domains_populate(sbi_scratch_thishart_arg1_ptr());
+}
+
 static u64 generic_tlbr_flush_limit(void)
 {
 	if (generic_plat && generic_plat->tlbr_flush_limit)
@@ -190,6 +197,8 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= generic_final_init,
 	.early_exit		= generic_early_exit,
 	.final_exit		= generic_final_exit,
+	.domains_init		= generic_domains_init,
+	.domain_get		= fdt_domain_get,
 	.console_putc		= fdt_serial_putc,
 	.console_getc		= fdt_serial_getc,
 	.console_init		= fdt_serial_init,
-- 
2.25.1


