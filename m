From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 31 Mar 2023 15:06:58 +0200
Subject: [PATCH 1/1] lib: utils: fdt_fixup: avoid buffer overrun
Message-ID: <20230331130658.58865-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In fdt_reserved_memory_fixup() uses filtered_order[PMP_COUNT]. The index
must not reach PMP_COUNT.

Fixes: 199189bd1c17 ("lib: utils: Mark only the largest region as reserved in FDT")
Addresses-Coverity-ID: 1536994 ("Out-of-bounds write")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/fdt/fdt_fixup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index c10179b..ae6be00 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -355,7 +355,7 @@ int fdt_reserved_memory_fixup(void *fdt)
 		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			continue;
 
-		if (i > PMP_COUNT) {
+		if (i >= PMP_COUNT) {
 			sbi_printf("%s: Too many memory regions to fixup.\n",
 				   __func__);
 			return SBI_ENOSPC;
-- 
2.39.2


