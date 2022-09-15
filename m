From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 15 Sep 2022 09:51:19 +0800
Subject: [PATCH 10/12] lib: utils/ipi: Add PLICSW mmio region to root domain
In-Reply-To: <20220915015121.27596-1-peterlin@andestech.com>
References: <20220915015121.27596-1-peterlin@andestech.com>
Message-ID: <20220915015121.27596-11-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add PLICSW as mmio memregion in root domain at boot-time.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/utils/ipi/fdt_ipi_plicsw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
index 9d5c301..2ca2cd0 100644
--- a/lib/utils/ipi/fdt_ipi_plicsw.c
+++ b/lib/utils/ipi/fdt_ipi_plicsw.c
@@ -10,6 +10,7 @@
  *   Yu Chien Peter Lin <peterlin@andestech.com>
  */
 
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -34,6 +35,34 @@ static int plicsw_warm_ipi_init(void)
 	return 0;
 }
 
+static int andes_plicsw_add_regions(unsigned long addr, unsigned long size)
+{
+#define PLICSW_ADD_REGION_ALIGN 0x1000
+	int rc;
+	unsigned long pos, end, region_size;
+	struct sbi_domain_memregion reg;
+
+	pos = addr;
+	end = addr + size;
+	while (pos < end) {
+		if (pos & (PLICSW_ADD_REGION_ALIGN - 1))
+			region_size = 1UL << sbi_ffs(pos);
+		else
+			region_size = ((end - pos) < PLICSW_ADD_REGION_ALIGN)
+					      ? (end - pos)
+					      : PLICSW_ADD_REGION_ALIGN;
+
+		sbi_domain_memregion_init(pos, region_size,
+					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+		rc = sbi_domain_root_add_memregion(&reg);
+		if (rc)
+			return rc;
+		pos += region_size;
+	}
+
+	return 0;
+}
+
 static int plicsw_cold_ipi_init(void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
@@ -61,6 +90,11 @@ static int plicsw_cold_ipi_init(void *fdt, int nodeoff,
 		enable_mask <<= 1;
 	}
 
+	/* Add PLICSW region to the root domain */
+	rc = andes_plicsw_add_regions(plicsw.addr, plicsw.size);
+	if (rc)
+		return rc;
+
 	sbi_ipi_set_device(&plicsw_ipi);
 
 	return 0;
-- 
2.34.1


