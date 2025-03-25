From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:31 -0700
Subject: [PATCH 08/10] platform: generic: Initialize overrides with fdt_driver
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-9-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In addition to deduplicating the code, this also improves the match
selection logic to respect the priority order of the compatible strings,
as implemented in commit 0ffe265fd969 ("lib: utils/fdt: Respect
compatible string fallback priority").

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/platform.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 19566e69..04448d71 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -33,31 +33,6 @@
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
 
-static void fw_platform_lookup_special(const void *fdt, int root_offset)
-{
-	const struct fdt_driver *plat;
-	const struct fdt_match *match;
-	int pos, rc;
-
-	for (pos = 0; platform_override_modules[pos]; pos++) {
-		plat = platform_override_modules[pos];
-		if (!plat->match_table)
-			continue;
-
-		match = fdt_match_node(fdt, root_offset, plat->match_table);
-		if (!match)
-			continue;
-
-		if (plat->init) {
-			rc = plat->init(fdt, root_offset, match);
-			if (rc)
-				continue;
-		}
-
-		break;
-	}
-}
-
 static u32 fw_platform_calculate_heap_size(u32 hart_count)
 {
 	u32 heap_size;
@@ -177,7 +152,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	if (root_offset < 0)
 		goto fail;
 
-	fw_platform_lookup_special(fdt, root_offset);
+	fdt_driver_init_by_offset(fdt, root_offset, platform_override_modules);
 
 	model = fdt_getprop(fdt, root_offset, "model", &len);
 	if (model)
-- 
2.47.2


