From: Heiko Stuebner <heiko@sntech.de>
Date: Tue,  4 Oct 2022 18:42:26 +0200
Subject: [PATCH v5 4/5] platform: generic: add extensions_init handler and platform-override
In-Reply-To: <20221004164227.1381825-1-heiko@sntech.de>
References: <20221004164227.1381825-1-heiko@sntech.de>
Message-ID: <20221004164227.1381825-5-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Init of non-standard extensions is a platform-specific thing,
so allow generic platforms to do this via a platform-override.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 platform/generic/include/platform_override.h |  3 +++
 platform/generic/platform.c                  | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index e55da25..7f1558d 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -10,6 +10,7 @@
 #ifndef __PLATFORM_OVERRIDE_H__
 #define __PLATFORM_OVERRIDE_H__
 
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_trap.h>
 
@@ -22,6 +23,8 @@ struct platform_override {
 	void (*early_exit)(const struct fdt_match *match);
 	void (*final_exit)(const struct fdt_match *match);
 	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
+	int (*extensions_init)(const struct fdt_match *match,
+			       struct sbi_hart_features *hfeatures);
 	int (*vendor_ext_check)(long extid, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long extid, long funcid,
 				   const struct sbi_trap_regs *regs,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index bf51aba..595b0fd 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -204,6 +204,15 @@ static void generic_final_exit(void)
 		generic_plat->final_exit(generic_plat_match);
 }
 
+static int generic_extensions_init(struct sbi_hart_features *hfeatures)
+{
+	if (generic_plat && generic_plat->extensions_init)
+		return generic_plat->extensions_init(generic_plat_match,
+						     hfeatures);
+
+	return 0;
+}
+
 static int generic_domains_init(void)
 {
 	return fdt_domains_populate(fdt_get_address());
@@ -257,6 +266,7 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= generic_final_init,
 	.early_exit		= generic_early_exit,
 	.final_exit		= generic_final_exit,
+	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
 	.console_init		= generic_console_init,
 	.irqchip_init		= fdt_irqchip_init,
-- 
2.35.1


