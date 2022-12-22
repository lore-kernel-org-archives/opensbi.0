From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Thu, 22 Dec 2022 16:44:42 +0800
Subject: [PATCH v5 2/4] platform: generic: Allow platform_override to select cold boot HART
In-Reply-To: <20221222084444.224301-1-weiliang.lim@starfivetech.com>
References: <20221222084444.224301-1-weiliang.lim@starfivetech.com>
Message-ID: <20221222084444.224301-3-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

We add a generic platform override callback to allow platform specific
selection of cold boot HART.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 platform/generic/include/platform_override.h | 1 +
 platform/generic/platform.c                  | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 7f1558d..21354e9 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -18,6 +18,7 @@ struct platform_override {
 	const struct fdt_match *match_table;
 	u64 (*features)(const struct fdt_match *match);
 	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
+	bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
 	int (*early_init)(bool cold_boot, const struct fdt_match *match);
 	int (*final_init)(bool cold_boot, const struct fdt_match *match);
 	void (*early_exit)(const struct fdt_match *match);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index bfe15f0..16aa4f3 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -122,6 +122,14 @@ fail:
 		wfi();
 }
 
+static bool generic_cold_boot_allowed(u32 hartid)
+{
+	if (generic_plat && generic_plat->cold_boot_allowed)
+		return generic_plat->cold_boot_allowed(
+						hartid, generic_plat_match);
+	return TRUE;
+}
+
 static int generic_nascent_init(void)
 {
 	if (platform_has_mlevel_imsic)
@@ -261,6 +269,7 @@ static int generic_console_init(void)
 }
 
 const struct sbi_platform_operations platform_ops = {
+	.cold_boot_allowed	= generic_cold_boot_allowed,
 	.nascent_init		= generic_nascent_init,
 	.early_init		= generic_early_init,
 	.final_init		= generic_final_init,
-- 
2.25.1


