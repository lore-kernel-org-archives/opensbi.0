From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 12 Apr 2021 17:46:14 +0530
Subject: [PATCH v2 4/7] lib: utils/sys: Add CLINT memregion in the root domain
In-Reply-To: <20210412121617.933493-1-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
Message-ID: <20210412121617.933493-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CLINT memory should not be accessed by the supervisor-mode
software so let's protect it by adding CLINT memregion to the
root domain.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 lib/utils/sys/clint.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
index 7a392aa..80e04fb 100644
--- a/lib/utils/sys/clint.c
+++ b/lib/utils/sys/clint.c
@@ -10,13 +10,19 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi_utils/sys/clint.h>
 
 #define CLINT_IPI_OFF		0
+#define CLINT_IPI_SIZE		0x4000
+
 #define CLINT_TIME_CMP_OFF	0x4000
+#define CLINT_TIME_CMP_SIZE	0x4000
+
 #define CLINT_TIME_VAL_OFF	0xbff8
+#define CLINT_TIME_VAL_SIZE	0x4000
 
 static struct clint_data *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
 
@@ -59,6 +65,7 @@ int clint_warm_ipi_init(void)
 int clint_cold_ipi_init(struct clint_data *clint)
 {
 	u32 i;
+	struct sbi_domain_memregion reg;
 
 	if (!clint)
 		return SBI_EINVAL;
@@ -70,7 +77,11 @@ int clint_cold_ipi_init(struct clint_data *clint)
 	for (i = 0; i < clint->hart_count; i++)
 		clint_ipi_hartid2data[clint->first_hartid + i] = clint;
 
-	return 0;
+	/* Add CLINT ipi region to the root domain */
+	sbi_domain_memregion_init(clint->addr + CLINT_IPI_OFF,
+				  CLINT_IPI_SIZE,
+				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+	return sbi_domain_root_add_memregion(&reg);
 }
 
 static struct clint_data *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
@@ -174,6 +185,8 @@ int clint_cold_timer_init(struct clint_data *clint,
 			  struct clint_data *reference)
 {
 	u32 i;
+	int rc;
+	struct sbi_domain_memregion reg;
 
 	if (!clint)
 		return SBI_EINVAL;
@@ -199,5 +212,17 @@ int clint_cold_timer_init(struct clint_data *clint,
 	for (i = 0; i < clint->hart_count; i++)
 		clint_timer_hartid2data[clint->first_hartid + i] = clint;
 
-	return 0;
+	/* Add CLINT mtime region to the root domain */
+	sbi_domain_memregion_init(clint->addr + CLINT_TIME_VAL_OFF,
+				  CLINT_TIME_VAL_SIZE,
+				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+	rc = sbi_domain_root_add_memregion(&reg);
+	if (rc)
+		return rc;
+
+	/* Add CLINT timecmp region to the root domain */
+	sbi_domain_memregion_init(clint->addr + CLINT_TIME_CMP_OFF,
+				  CLINT_TIME_CMP_SIZE,
+				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+	return sbi_domain_root_add_memregion(&reg);
 }
-- 
2.25.1


