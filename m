From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:47 +0530
Subject: [PATCH v1 7/7] lib: utils/regmap: Mark syscon region as shared read-write
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-8-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

The syscon region used by OpenSBI should be marked as a shared
read-write region between M-mode and SU-mode.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/utils/regmap/fdt_regmap_syscon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index 29263dd..d87b6e0 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -8,6 +8,7 @@
  */
 
 #include <libfdt.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_byteorder.h>
 #include <sbi/sbi_error.h>
@@ -240,6 +241,12 @@ static int regmap_syscon_init(void *fdt, int nodeoff, u32 phandle,
 		goto fail_free_syscon;
 	}
 
+	rc = sbi_domain_root_add_memrange(addr, size, PAGE_SIZE,
+				(SBI_DOMAIN_MEMREGION_MMIO |
+				 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+	if (rc)
+		goto fail_free_syscon;
+
 	rc = regmap_add(&srm->rmap);
 	if (rc)
 		goto fail_free_syscon;
-- 
2.34.1


