From: Bin Meng <bmeng@tinylab.org>
Date: Fri, 24 Feb 2023 12:28:26 +0800
Subject: [PATCH 2/3] lib: utils/fdt/fdt_domain: Simplify region access permission check
In-Reply-To: <20230224042827.1768931-1-bmeng@tinylab.org>
References: <20230224042827.1768931-1-bmeng@tinylab.org>
Message-ID: <20230224042827.1768931-2-bmeng@tinylab.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The region access permission check in __fdt_parse_region() can be
simplified as masking SBI_DOMAIN_MEMREGION_{M,SU}_ACCESS_MASK is
enough.

While we are here, update the confusing comments to match the codes.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 lib/utils/fdt/fdt_domain.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 2b51a8e..bc30010 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -244,13 +244,11 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	 * access permissions. M-mode regions can only be part of
 	 * root domain.
 	 *
-	 * SU permission bits can't be all zeroes and M-mode permission
-	 * bits must be all set.
+	 * SU permission bits can't be all zeroes when M-mode permission
+	 * bits have at least one bit set.
 	 */
-	if (!((region_access & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
-	     & SBI_DOMAIN_MEMREGION_SU_RWX)
-	    && ((region_access & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
-		& SBI_DOMAIN_MEMREGION_M_RWX))
+	if (!(region_access & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
+	    && (region_access & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
 		return SBI_EINVAL;
 
 	/* Find next region of the domain */
-- 
2.25.1


