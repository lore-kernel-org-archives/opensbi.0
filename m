From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 07:25:08 +0800
Subject: [PATCH] lib: utils/fdt: Allow zero length mtime when parsing ACLINT
Message-ID: <IA1PR20MB4953C5601F0B167904D68D5FBBCCA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the fdt_parse_aclint_node() does not allow the first reg to
be zero length. This may cause the parser to fail when the ACLINT does
not support mtime.

To be robust, delay the check of first reg in fdt_parse_aclint_node()
so the parser can handle ACLINT without mtime support.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 lib/utils/fdt/fdt_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index c97f09d..6b4ef38 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -897,8 +897,10 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 
 	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
 				    &reg_addr, &reg_size);
-	if (rc < 0 || !reg_size)
+	if (rc < 0)
 		return SBI_ENODEV;
+	if (!reg_size)
+		reg_addr = reg_size = 0;
 	*out_addr1 = reg_addr;
 	*out_size1 = reg_size;
 
@@ -906,6 +908,8 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_size)
 		reg_addr = reg_size = 0;
+	if (!reg_addr && *out_size1 == 0)
+		return SBI_ENODEV;
 	if (out_addr2)
 		*out_addr2 = reg_addr;
 	if (out_size2)
-- 
2.42.0


