From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 10 Apr 2021 12:48:05 +0530
Subject: [PATCH 4/7] lib: utils/sys: Add CLINT memregion in the root domain
In-Reply-To: <20210410071808.759856-1-anup.patel@wdc.com>
References: <20210410071808.759856-1-anup.patel@wdc.com>
Message-ID: <20210410071808.759856-5-anup.patel@wdc.com>
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
 lib/utils/sys/clint.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/utils/sys/clint.c b/lib/utils/sys/clint.c
index 7a392aa..fe98cc4 100644
--- a/lib/utils/sys/clint.c
+++ b/lib/utils/sys/clint.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_atomic.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi_utils/sys/clint.h>
@@ -17,9 +18,19 @@
 #define CLINT_IPI_OFF		0
 #define CLINT_TIME_CMP_OFF	0x4000
 #define CLINT_TIME_VAL_OFF	0xbff8
+#define CLINT_SIZE		0xc000
 
 static struct clint_data *clint_ipi_hartid2data[SBI_HARTMASK_MAX_BITS];
 
+static int clint_add_root_memregion(struct clint_data *clint)
+{
+	struct sbi_domain_memregion reg;
+
+	sbi_domain_memregion_init(clint->addr, CLINT_SIZE,
+				  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+	return sbi_domain_root_add_memregion(&reg, true);
+}
+
 void clint_ipi_send(u32 target_hart)
 {
 	struct clint_data *clint;
@@ -70,7 +81,8 @@ int clint_cold_ipi_init(struct clint_data *clint)
 	for (i = 0; i < clint->hart_count; i++)
 		clint_ipi_hartid2data[clint->first_hartid + i] = clint;
 
-	return 0;
+	/* Add CLINT region to the root domain */
+	return clint_add_root_memregion(clint);
 }
 
 static struct clint_data *clint_timer_hartid2data[SBI_HARTMASK_MAX_BITS];
@@ -199,5 +211,6 @@ int clint_cold_timer_init(struct clint_data *clint,
 	for (i = 0; i < clint->hart_count; i++)
 		clint_timer_hartid2data[clint->first_hartid + i] = clint;
 
-	return 0;
+	/* Add CLINT region to the root domain */
+	return clint_add_root_memregion(clint);
 }
-- 
2.25.1


