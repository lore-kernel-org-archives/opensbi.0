From: Xiang W <wxjstz@126.com>
Date: Thu,  8 Dec 2022 01:12:49 +0800
Subject: [PATCH] lib: utils/fdt: Add full valid detection for __fdt_parse_region
Message-ID: <20221207171249.1097169-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The original code only detects region->order, and a certain relationship
needs to be satisfied between region->order and region->base. This patch
detects whether the region in fdt is valid through is_region_valid

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index bd0eec3..30a40dc 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -257,8 +257,6 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	if (!val && len >= 4)
 		return SBI_EINVAL;
 	val32 = fdt32_to_cpu(*val);
-	if (val32 < 3 || __riscv_xlen < val32)
-		return SBI_EINVAL;
 	region->order = val32;
 
 	/* Read "mmio" DT property */
@@ -266,6 +264,9 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	if (fdt_get_property(fdt, region_offset, "mmio", NULL))
 		region->flags |= SBI_DOMAIN_MEMREGION_MMIO;
 
+	if(!is_region_valid(region))
+		return SBI_EINVAL;
+
 	(*region_count)++;
 
 	return 0;
-- 
2.30.2


