From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:20:02 +0200
Subject: [PATCH v2 3/5] platform: generic: add extensions_init handler and platform-override
In-Reply-To: <20220817112004.745776-1-heiko@sntech.de>
References: <20220817112004.745776-1-heiko@sntech.de>
Message-ID: <20220817112004.745776-4-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Init of non-standard extensions is a platform-specific thing,
so allow generic platforms to do this via a platform-override.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 platform/generic/include/platform_override.h | 2 ++
 platform/generic/platform.c                  | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index e55da25..e59a62c 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -22,6 +22,8 @@ struct platform_override {
 	void (*early_exit)(const struct fdt_match *match);
 	void (*final_exit)(const struct fdt_match *match);
 	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
+	int (*extensions_init)(unsigned long *extensions,
+			       const struct fdt_match *match);
 	int (*vendor_ext_check)(long extid, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long extid, long funcid,
 				   const struct sbi_trap_regs *regs,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index bf93af6..4b3dd91 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -203,6 +203,14 @@ static void generic_final_exit(void)
 		generic_plat->final_exit(generic_plat_match);
 }
 
+static int generic_extensions_init(unsigned long *extensions)
+{
+	if (generic_plat && generic_plat->extensions_init)
+		return generic_plat->extensions_init(extensions, generic_plat_match);
+
+	return 0;
+}
+
 static int generic_domains_init(void)
 {
 	return fdt_domains_populate(fdt_get_address());
@@ -248,6 +256,7 @@ const struct sbi_platform_operations platform_ops = {
 	.final_init		= generic_final_init,
 	.early_exit		= generic_early_exit,
 	.final_exit		= generic_final_exit,
+	.extensions_init	= generic_extensions_init,
 	.domains_init		= generic_domains_init,
 	.console_init		= fdt_serial_init,
 	.irqchip_init		= fdt_irqchip_init,
-- 
2.35.1


