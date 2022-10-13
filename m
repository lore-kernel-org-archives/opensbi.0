From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 13 Oct 2022 10:29:50 +0800
Subject: [PATCH v3 12/13] platform: andes/ae350: Add AE350 domain support
In-Reply-To: <20221013022951.5206-1-peterlin@andestech.com>
References: <20221013022951.5206-1-peterlin@andestech.com>
Message-ID: <20221013022951.5206-13-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add domains_init platform hook for Andes AE350, users can add domain
description in device tree and select FDT domain support in Kconfig
to achieve system-level partitioning.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v2 -> v3
  - No change since v2
---
 platform/andes/ae350/platform.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
index 30e4606..d36d11e 100644
--- a/platform/andes/ae350/platform.c
+++ b/platform/andes/ae350/platform.c
@@ -19,13 +19,14 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
-#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/reset/fdt_reset.h>
 #include <sbi_utils/serial/fdt_serial.h>
 #include <sbi_utils/timer/fdt_timer.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
 #include "platform.h"
 #include "cache.h"
 
@@ -84,6 +85,7 @@ static int ae350_final_init(bool cold_boot)
 
 	fdt = fdt_get_address();
 	fdt_fixups(fdt);
+	fdt_domain_fixup(fdt);
 
 	return 0;
 }
@@ -132,10 +134,17 @@ static int ae350_vendor_ext_provider(long extid, long funcid,
 	return ret;
 }
 
+static int ae350_domains_init(void)
+{
+	return fdt_domains_populate(fdt_get_address());
+}
+
 /* Platform descriptor. */
 const struct sbi_platform_operations platform_ops = {
 	.final_init = ae350_final_init,
 
+	.domains_init = ae350_domains_init,
+
 	.console_init = fdt_serial_init,
 
 	.irqchip_init = fdt_irqchip_init,
-- 
2.34.1


