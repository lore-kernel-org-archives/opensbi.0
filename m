From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:22 +0530
Subject: [PATCH 09/17] lib: utils/ipi: Use heap in ACLINT MSWI driver
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's use heap allocation in ACLINT MSWI driver instead of using
a fixed size global array.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/ipi/fdt_ipi_mswi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index 4dc91f2..e3a6378 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -8,15 +8,11 @@
  */
 
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/ipi/fdt_ipi.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
 
-#define MSWI_MAX_NR			16
-
-static unsigned long mswi_count = 0;
-static struct aclint_mswi_data mswi[MSWI_MAX_NR];
-
 static int ipi_mswi_cold_init(void *fdt, int nodeoff,
 			      const struct fdt_match *match)
 {
@@ -24,15 +20,17 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
 	unsigned long offset;
 	struct aclint_mswi_data *ms;
 
-	if (MSWI_MAX_NR <= mswi_count)
-		return SBI_ENOSPC;
-	ms = &mswi[mswi_count];
+	ms = sbi_zalloc(sizeof(*ms));
+	if (!ms)
+		return SBI_ENOMEM;
 
 	rc = fdt_parse_aclint_node(fdt, nodeoff, false,
 				   &ms->addr, &ms->size, NULL, NULL,
 				   &ms->first_hartid, &ms->hart_count);
-	if (rc)
+	if (rc) {
+		sbi_free(ms);
 		return rc;
+	}
 
 	if (match->data) {
 		/* Adjust MSWI address and size for CLINT device */
@@ -44,10 +42,11 @@ static int ipi_mswi_cold_init(void *fdt, int nodeoff,
 	}
 
 	rc = aclint_mswi_cold_init(ms);
-	if (rc)
+	if (rc) {
+		sbi_free(ms);
 		return rc;
+	}
 
-	mswi_count++;
 	return 0;
 }
 
-- 
2.34.1


