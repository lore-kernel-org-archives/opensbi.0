From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 27 Sep 2023 16:19:12 +0200
Subject: [PATCH 1/1] lib: utils/fdt: simplify dt_parse_isa_extensions
Message-ID: <20230927141912.51591-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

hart_exts == NULL can only occur if offset and node address lead to an
overflow resulting in exactly NULL. As we don't catch other values of
overflow it does not make sense to treat this one as special.

Addresses-Coverity-ID: 1568355 Logically dead code
Addresses-Coverity-ID: 1568358 Logically dead code
Fixes: 6259b2ec2d09 ("lib: utils/fdt: Fix fdt_parse_isa_extensions() implementation")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/fdt/fdt_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index c97f09d..13e79b9 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -417,8 +417,6 @@ static int fdt_parse_isa_all_harts(void *fdt)
 
 		hart_exts = sbi_scratch_offset_ptr(scratch,
 						   fdt_isa_bitmap_offset);
-		if (!hart_exts)
-			return SBI_ENOENT;
 
 		err = fdt_parse_isa_one_hart((const char *)val, hart_exts);
 		if (err)
@@ -452,8 +450,6 @@ int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
 		return SBI_ENOENT;
 
 	hart_exts = sbi_scratch_offset_ptr(scratch, fdt_isa_bitmap_offset);
-	if (!hart_exts)
-		return SBI_ENOENT;
 
 	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
 		extensions[i] |= hart_exts[i];
-- 
2.40.1


