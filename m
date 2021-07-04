From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun,  4 Jul 2021 23:01:13 +0800
Subject: [PATCH] platform: generic: Terminate platform.name with null
Message-ID: <20210704150113.21531-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

fw_platform_init() fills platform.name without considering the
ending null character. Fix it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 platform/generic/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index da0c1af..79d5230 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -85,7 +85,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 	model = fdt_getprop(fdt, root_offset, "model", &len);
 	if (model)
-		sbi_strncpy(platform.name, model, sizeof(platform.name));
+		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
 
 	if (generic_plat && generic_plat->features)
 		platform.features = generic_plat->features(generic_plat_match);
-- 
2.25.1


