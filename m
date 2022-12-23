From: Wei Liang Lim <weiliang.lim@starfivetech.com>
Date: Fri, 23 Dec 2022 15:07:40 +0800
Subject: [PATCH v6 3/4] platform: generic: Allow platform_override to perform firmware init
In-Reply-To: <20221223070741.236271-1-weiliang.lim@starfivetech.com>
References: <20221223070741.236271-1-weiliang.lim@starfivetech.com>
Message-ID: <20221223070741.236271-4-weiliang.lim@starfivetech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a generic platform override callback to allow platform specific firmware init.

Signed-off-by: Wei Liang Lim <weiliang.lim@starfivetech.com>
Reviewed-by: Chee Hong Ang <cheehong.ang@starfivetech.com>
Reviewed-by: Jun Liang Tan <junliang.tan@starfivetech.com>
---
 platform/generic/include/platform_override.h | 1 +
 platform/generic/platform.c                  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 21354e9..a59b06a 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -26,6 +26,7 @@ struct platform_override {
 	int (*fdt_fixup)(void *fdt, const struct fdt_match *match);
 	int (*extensions_init)(const struct fdt_match *match,
 			       struct sbi_hart_features *hfeatures);
+	void (*fw_init)(void *fdt, const struct fdt_match *match);
 	int (*vendor_ext_check)(long extid, const struct fdt_match *match);
 	int (*vendor_ext_provider)(long extid, long funcid,
 				   const struct sbi_trap_regs *regs,
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 5fb0dc6..a34d3b0 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -85,6 +85,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 	fw_platform_lookup_special(fdt, root_offset);
 
+	if (generic_plat && generic_plat->fw_init)
+		generic_plat->fw_init(fdt, generic_plat_match);
+
 	model = fdt_getprop(fdt, root_offset, "model", &len);
 	if (model)
 		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
-- 
2.25.1


