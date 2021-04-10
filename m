From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 10 Apr 2021 12:48:07 +0530
Subject: [PATCH 6/7] lib: utils: Copy over restricted root domain memregions
 to FDT domains
In-Reply-To: <20210410071808.759856-1-anup.patel@wdc.com>
References: <20210410071808.759856-1-anup.patel@wdc.com>
Message-ID: <20210410071808.759856-7-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should copy over all restricted memregions from the root domain
to the domains populated from FDT. These restricted root memregions
are typically firmware memregion and M-mode only mmio memregions.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/fdt/fdt_domain.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 09615e5..95c195d 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -222,7 +222,7 @@ static u32 fdt_domains_count;
 static struct sbi_domain fdt_domains[FDT_DOMAIN_MAX_COUNT];
 static struct sbi_hartmask fdt_masks[FDT_DOMAIN_MAX_COUNT];
 static struct sbi_domain_memregion
-	fdt_regions[FDT_DOMAIN_MAX_COUNT][FDT_DOMAIN_REGION_MAX_COUNT + 2];
+	fdt_regions[FDT_DOMAIN_MAX_COUNT][FDT_DOMAIN_REGION_MAX_COUNT + 1];
 
 static int __fdt_parse_region(void *fdt, int domain_offset,
 			      int region_offset, u32 region_access,
@@ -276,7 +276,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	struct sbi_hartmask *mask;
 	struct sbi_hartmask assign_mask;
 	int *cold_domain_offset = opaque;
-	struct sbi_domain_memregion *regions;
+	struct sbi_domain_memregion *reg, *regions;
 	int i, err, len, cpus_offset, cpu_offset, doffset;
 
 	/* Sanity check on maximum domains we can handle */
@@ -314,13 +314,31 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	/* Setup memregions from DT */
 	val32 = 0;
 	sbi_memset(regions, 0,
-		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT + 2));
+		   sizeof(*regions) * (FDT_DOMAIN_REGION_MAX_COUNT + 1));
 	dom->regions = regions;
 	err = fdt_iterate_each_memregion(fdt, domain_offset, &val32,
 					 __fdt_parse_region);
 	if (err)
 		return err;
-	sbi_domain_memregion_initfw(&regions[val32]);
+
+	/*
+	 * Copy over root domain memregions which don't allow
+	 * read, write and execute from lower privilege modes.
+	 *
+	 * These root domain memregions without read, write,
+	 * and execute permissions include:
+	 * 1) firmware region protecting the firmware memory
+	 * 2) mmio regions protecting M-mode only mmio devices
+	 */
+	sbi_domain_for_each_memregion(&root, reg) {
+		if ((reg->flags & SBI_DOMAIN_MEMREGION_READABLE) ||
+		    (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE) ||
+		    (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE))
+			continue;
+		if (FDT_DOMAIN_REGION_MAX_COUNT <= val32)
+			return SBI_EINVAL;
+		sbi_memcpy(&regions[val32++], reg, sizeof(*reg));
+	}
 
 	/* Read "boot-hart" DT property */
 	val32 = -1U;
-- 
2.25.1


