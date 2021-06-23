From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 23 Jun 2021 11:32:25 +0530
Subject: [PATCH v2 5/6] lib: utils/timer: Add FDT based ACLINT MTIMER driver
In-Reply-To: <20210623060226.442030-1-anup.patel@wdc.com>
References: <20210623060226.442030-1-anup.patel@wdc.com>
Message-ID: <20210623060226.442030-6-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add a new FDT based ACLINT MTIMER driver which works for
both CLINT device and standalone ACLINT MTIMER device.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 lib/utils/timer/fdt_timer.c        |  4 +-
 lib/utils/timer/fdt_timer_clint.c  | 57 -----------------------
 lib/utils/timer/fdt_timer_mtimer.c | 74 ++++++++++++++++++++++++++++++
 lib/utils/timer/objects.mk         |  2 +-
 4 files changed, 77 insertions(+), 60 deletions(-)
 delete mode 100644 lib/utils/timer/fdt_timer_clint.c
 create mode 100644 lib/utils/timer/fdt_timer_mtimer.c

diff --git a/lib/utils/timer/fdt_timer.c b/lib/utils/timer/fdt_timer.c
index 1fad42c..148c05e 100644
--- a/lib/utils/timer/fdt_timer.c
+++ b/lib/utils/timer/fdt_timer.c
@@ -12,10 +12,10 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/timer/fdt_timer.h>
 
-extern struct fdt_timer fdt_timer_clint;
+extern struct fdt_timer fdt_timer_mtimer;
 
 static struct fdt_timer *timer_drivers[] = {
-	&fdt_timer_clint
+	&fdt_timer_mtimer
 };
 
 static struct fdt_timer dummy = {
diff --git a/lib/utils/timer/fdt_timer_clint.c b/lib/utils/timer/fdt_timer_clint.c
deleted file mode 100644
index 63d6586..0000000
--- a/lib/utils/timer/fdt_timer_clint.c
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Anup Patel <anup.patel@wdc.com>
- */
-
-#include <libfdt.h>
-#include <sbi/sbi_error.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/timer/fdt_timer.h>
-#include <sbi_utils/sys/clint.h>
-
-#define CLINT_TIMER_MAX_NR			16
-
-static unsigned long clint_timer_count = 0;
-static struct clint_data clint_timer[CLINT_TIMER_MAX_NR];
-
-static int timer_clint_cold_init(void *fdt, int nodeoff,
-				  const struct fdt_match *match)
-{
-	int rc;
-	unsigned long ctsize;
-	struct clint_data *ct, *ctmaster = NULL;
-
-	if (CLINT_TIMER_MAX_NR <= clint_timer_count)
-		return SBI_ENOSPC;
-	ct = &clint_timer[clint_timer_count++];
-	if (1 < clint_timer_count)
-		ctmaster = &clint_timer[0];
-
-	rc = fdt_parse_aclint_node(fdt, nodeoff, true, &ct->addr, &ctsize,
-				   &ct->first_hartid, &ct->hart_count);
-	if (rc)
-		return rc;
-
-	ct->has_64bit_mmio = true;
-	if (fdt_getprop(fdt, nodeoff, "clint,has-no-64bit-mmio", &rc))
-		ct->has_64bit_mmio = false;
-
-	return clint_cold_timer_init(ct, ctmaster);
-}
-
-static const struct fdt_match timer_clint_match[] = {
-	{ .compatible = "riscv,clint0" },
-	{ .compatible = "sifive,clint0" },
-	{ },
-};
-
-struct fdt_timer fdt_timer_clint = {
-	.match_table = timer_clint_match,
-	.cold_init = timer_clint_cold_init,
-	.warm_init = clint_warm_timer_init,
-	.exit = NULL,
-};
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
new file mode 100644
index 0000000..4907428
--- /dev/null
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -0,0 +1,74 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/timer/fdt_timer.h>
+#include <sbi_utils/timer/aclint_mtimer.h>
+
+#define MTIMER_MAX_NR			16
+
+static unsigned long mtimer_count = 0;
+static struct aclint_mtimer_data mtimer[MTIMER_MAX_NR];
+
+static int timer_mtimer_cold_init(void *fdt, int nodeoff,
+				  const struct fdt_match *match)
+{
+	int rc;
+	unsigned long offset;
+	struct aclint_mtimer_data *mt, *mtmaster = NULL;
+
+	if (MTIMER_MAX_NR <= mtimer_count)
+		return SBI_ENOSPC;
+	mt = &mtimer[mtimer_count];
+	if (0 < mtimer_count)
+		mtmaster = &mtimer[0];
+
+	rc = fdt_parse_aclint_node(fdt, nodeoff, true, &mt->addr, &mt->size,
+				   &mt->first_hartid, &mt->hart_count);
+	if (rc)
+		return rc;
+	mt->has_64bit_mmio = true;
+
+	if (match->data) {
+		/* Adjust MTIMER address and size for CLINT device */
+		offset = *((unsigned long *)match->data);
+		mt->addr += offset;
+		if ((mt->size - offset) < ACLINT_MTIMER_SIZE)
+			return SBI_EINVAL;
+		mt->size -= offset;
+		/* Parse additional CLINT properties */
+		if (fdt_getprop(fdt, nodeoff, "clint,has-no-64bit-mmio", &rc))
+			mt->has_64bit_mmio = false;
+	}
+
+	rc = aclint_mtimer_cold_init(mt, mtmaster);
+	if (rc)
+		return rc;
+
+	mtimer_count++;
+	return 0;
+}
+
+static unsigned long clint_offset = CLINT_MTIMER_OFFSET;
+
+static const struct fdt_match timer_mtimer_match[] = {
+	{ .compatible = "riscv,clint0", .data = &clint_offset },
+	{ .compatible = "sifive,clint0", .data = &clint_offset },
+	{ .compatible = "riscv,aclint-mtimer" },
+	{ },
+};
+
+struct fdt_timer fdt_timer_mtimer = {
+	.match_table = timer_mtimer_match,
+	.cold_init = timer_mtimer_cold_init,
+	.warm_init = aclint_mtimer_warm_init,
+	.exit = NULL,
+};
diff --git a/lib/utils/timer/objects.mk b/lib/utils/timer/objects.mk
index 1d8b1e5..12cffcf 100644
--- a/lib/utils/timer/objects.mk
+++ b/lib/utils/timer/objects.mk
@@ -9,4 +9,4 @@
 
 libsbiutils-objs-y += timer/aclint_mtimer.o
 libsbiutils-objs-y += timer/fdt_timer.o
-libsbiutils-objs-y += timer/fdt_timer_clint.o
+libsbiutils-objs-y += timer/fdt_timer_mtimer.o
-- 
2.25.1


