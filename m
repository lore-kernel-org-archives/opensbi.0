From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon,  8 Apr 2024 09:37:32 +0200
Subject: [PATCH 1/1] lib: utils: check correct value in fdt_node_offset_by_compatible
Message-ID: <20240408073733.49356-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After calling fdt_node_offset_by_compatible() we must check its return
value and not an unrelated value.

Addresses-Coverity-ID: 1584993 Logically dead code
Fixes: 67ce5a763cfb ("platform: generic: Add support for specify coldboot harts in DT")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/fdt/fdt_fixup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 194e55b..974b1b8 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -394,7 +394,7 @@ void fdt_config_fixup(void *fdt)
 		return;
 
 	config_offset = fdt_node_offset_by_compatible(fdt, chosen_offset, "opensbi,config");
-	if (chosen_offset < 0)
+	if (config_offset < 0)
 		return;
 
 	fdt_nop_node(fdt, config_offset);
-- 
2.43.0


