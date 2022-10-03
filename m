From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 3 Oct 2022 19:52:23 +0800
Subject: [PATCH v2 05/12] lib: utils/timer: Add PLMT mmio region to root domain
In-Reply-To: <20221003115230.10127-1-peterlin@andestech.com>
References: <20221003115230.10127-1-peterlin@andestech.com>
Message-ID: <20221003115230.10127-6-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add PLMT as mmio memregion in root domain at boot-time.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 lib/utils/timer/fdt_timer_plmt.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/lib/utils/timer/fdt_timer_plmt.c b/lib/utils/timer/fdt_timer_plmt.c
index 74d85b6..6c14f6a 100644
--- a/lib/utils/timer/fdt_timer_plmt.c
+++ b/lib/utils/timer/fdt_timer_plmt.c
@@ -9,6 +9,7 @@
 
 #include <libfdt.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 #include <sbi_utils/timer/andes_plmt.h>
@@ -33,6 +34,36 @@ static int plmt_warm_timer_init(void)
 	return 0;
 }
 
+static int andes_plmt_add_regions(unsigned long addr, unsigned long size)
+{
+#define PLMT_ADD_REGION_ALIGN 0x1000
+	int rc;
+	unsigned long pos, end, region_size;
+	struct sbi_domain_memregion reg;
+
+	pos = addr;
+	end = addr + size;
+	while (pos < end) {
+		if (pos & (PLMT_ADD_REGION_ALIGN - 1))
+			region_size = 1UL << sbi_ffs(pos);
+		else
+			region_size = ((end - pos) < PLMT_ADD_REGION_ALIGN)
+					      ? (end - pos)
+					      : PLMT_ADD_REGION_ALIGN;
+
+		sbi_domain_memregion_init(pos, region_size,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+						  SBI_DOMAIN_MEMREGION_READABLE,
+					  &reg);
+		rc = sbi_domain_root_add_memregion(&reg);
+		if (rc)
+			return rc;
+		pos += region_size;
+	}
+
+	return 0;
+}
+
 static int plmt_cold_timer_init(void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
@@ -53,6 +84,11 @@ static int plmt_cold_timer_init(void *fdt, int nodeoff,
 
 	plmt_timer.timer_freq = freq;
 
+	/* Add PLMT region to the root domain */
+	rc = andes_plmt_add_regions(plmt_base, plmt.size);
+	if (rc)
+		return rc;
+
 	sbi_timer_set_device(&plmt_timer);
 
 	return 0;
-- 
2.34.1


