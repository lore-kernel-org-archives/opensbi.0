From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 28 Nov 2022 10:14:16 +0100
Subject: [PATCH v2 2/6] lib: simplify fdt_parse_plicsw_node()
In-Reply-To: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
References: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
Message-ID: <20221128091420.30391-3-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should not check !plicsw_base || !size twice.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
v2:
	Reviewed-by added
---
 lib/utils/fdt/fdt_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index dbd7484..87b9fb2 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -868,7 +868,7 @@ int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
 
 	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
 				    &reg_addr, &reg_size);
-	if (rc < 0 || !plicsw_base || !size)
+	if (rc < 0)
 		return SBI_ENODEV;
 	*plicsw_base = reg_addr;
 	*size = reg_size;
-- 
2.37.2


