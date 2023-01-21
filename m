From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Sat, 21 Jan 2023 12:15:59 +0530
Subject: [PATCH] lib: utils: Fix reserved memory node for firmware memory
Message-ID: <20230121064559.3164930-1-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The commit 9e0ba090 introduced more fine grained permissions for memory
regions and did not update the fdt_reserved_memory_fixup() function. As
a result, the fdt_reserved_memory_fixup continued to use the older coarse
permissions which causes the reserved memory node to be not inserted
into the DT.

To fix the above issue, we correct the flags used for memory region
permission checks in the fdt_reserved_memory_fixup() function.

Fixes: 9e0ba090 ("include: sbi: Fine grain the permissions for M and SU modes")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/utils/fdt/fdt_fixup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 41f6cbb..42692cc 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -259,11 +259,11 @@ int fdt_reserved_memory_fixup(void *fdt)
 		/* Ignore MMIO or READABLE or WRITABLE or EXECUTABLE regions */
 		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			continue;
 
 		addr = reg->base;
-- 
2.34.1


