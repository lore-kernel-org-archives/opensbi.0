From: Daniel Schaefer <daniel.schaefer@hpe.com>
Date: Mon, 17 May 2021 19:33:18 +0800
Subject: [PATCH v1 2/3] lib: fdt: Don't use sbi_string functions
In-Reply-To: <20210517113319.25855-1-daniel.schaefer@hpe.com>
References: <20210517113319.25855-1-daniel.schaefer@hpe.com>
Message-ID: <20210517113319.25855-3-daniel.schaefer@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When SBI is built by external firmware, we need to use their functions,
defined in libfdt_env.h.
Just like 2cfd2fc9048806353298a1b967abf985901e36e8

Cc: Abner Chang <abner.chang@hpe.com>
Cc: Anup Patel <Anup.Patel@wdc.com>
Signed-off-by: Daniel Schaefer <daniel.schaefer@hpe.com>
---
 lib/utils/fdt/fdt_domain.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 95c195d65238..c1f6a8c8a10b 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -9,6 +9,7 @@
  */
 
 #include <libfdt.h>
+#include <libfdt_env.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
@@ -95,7 +96,7 @@ static int __fixup_find_domain_offset(void *fdt, int doff, void *p)
 {
 	struct __fixup_find_domain_offset_info *fdo = p;
 
-	if (!sbi_strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
+	if (!strcmp(fdo->name, fdt_get_name(fdt, doff, NULL)))
 		*fdo->doffset = doff;
 
 	return 0;
@@ -287,7 +288,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	regions = &fdt_regions[fdt_domains_count][0];
 
 	/* Read DT node name */
-	sbi_strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
+	strncpy(dom->name, fdt_get_name(fdt, domain_offset, NULL),
 		    sizeof(dom->name));
 	dom->name[sizeof(dom->name) - 1] = '\0';
 
@@ -313,7 +314,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 
 	/* Setup memregions from DT */
 	val32 = 0;
-	sbi_memset(regions, 0,
+	memset(regions, 0,
 		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT + 1));
 	dom->regions = regions;
 	err = fdt_iterate_each_memregion(fdt, domain_offset, &val32,
-- 
2.30.1


