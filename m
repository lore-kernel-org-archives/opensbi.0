From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 23 Jun 2021 11:32:22 +0530
Subject: [PATCH v2 2/6] lib: utils/ipi: Add ACLINT MSWI library
In-Reply-To: <20210623060226.442030-1-anup.patel@wdc.com>
References: <20210623060226.442030-1-anup.patel@wdc.com>
Message-ID: <20210623060226.442030-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add common ACLINT MSWI library similar to the CLINT library
so that OpenSBI platforms can use it.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/ipi/aclint_mswi.h |  33 +++++++++
 lib/utils/ipi/aclint_mswi.c         | 100 ++++++++++++++++++++++++++++
 lib/utils/ipi/objects.mk            |   1 +
 3 files changed, 134 insertions(+)
 create mode 100644 include/sbi_utils/ipi/aclint_mswi.h
 create mode 100644 lib/utils/ipi/aclint_mswi.c

diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
new file mode 100644
index 0000000..e373a8c
--- /dev/null
+++ b/include/sbi_utils/ipi/aclint_mswi.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __IPI_ACLINT_MSWI_H__
+#define __IPI_ACLINT_MSWI_H__
+
+#include <sbi/sbi_types.h>
+
+#define ACLINT_MSWI_ALIGN		0x1000
+#define ACLINT_MSWI_SIZE		0x4000
+#define ACLINT_MSWI_MAX_HARTS		4095
+
+#define CLINT_MSWI_OFFSET		0x0000
+
+struct aclint_mswi_data {
+	/* Public details */
+	unsigned long addr;
+	unsigned long size;
+	u32 first_hartid;
+	u32 hart_count;
+};
+
+int aclint_mswi_warm_init(void);
+
+int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
+
+#endif
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
new file mode 100644
index 0000000..a3de2f5
--- /dev/null
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -0,0 +1,100 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_atomic.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/ipi/aclint_mswi.h>
+
+static struct aclint_mswi_data *mswi_hartid2data[SBI_HARTMASK_MAX_BITS];
+
+static void mswi_ipi_send(u32 target_hart)
+{
+	u32 *msip;
+	struct aclint_mswi_data *mswi;
+
+	if (SBI_HARTMASK_MAX_BITS <= target_hart)
+		return;
+	mswi = mswi_hartid2data[target_hart];
+	if (!mswi)
+		return;
+
+	/* Set ACLINT IPI */
+	msip = (void *)mswi->addr;
+	writel(1, &msip[target_hart - mswi->first_hartid]);
+}
+
+static void mswi_ipi_clear(u32 target_hart)
+{
+	u32 *msip;
+	struct aclint_mswi_data *mswi;
+
+	if (SBI_HARTMASK_MAX_BITS <= target_hart)
+		return;
+	mswi = mswi_hartid2data[target_hart];
+	if (!mswi)
+		return;
+
+	/* Clear ACLINT IPI */
+	msip = (void *)mswi->addr;
+	writel(0, &msip[target_hart - mswi->first_hartid]);
+}
+
+static struct sbi_ipi_device aclint_mswi = {
+	.name = "aclint-mswi",
+	.ipi_send = mswi_ipi_send,
+	.ipi_clear = mswi_ipi_clear
+};
+
+int aclint_mswi_warm_init(void)
+{
+	/* Clear IPI for current HART */
+	mswi_ipi_clear(current_hartid());
+
+	return 0;
+}
+
+int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
+{
+	u32 i;
+	int rc;
+	unsigned long pos, region_size;
+	struct sbi_domain_memregion reg;
+
+	/* Sanity checks */
+	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
+	    (mswi->size < ACLINT_MSWI_SIZE) ||
+	    (mswi->first_hartid >= SBI_HARTMASK_MAX_BITS) ||
+	    (mswi->hart_count > ACLINT_MSWI_MAX_HARTS))
+		return SBI_EINVAL;
+
+	/* Update MSWI hartid table */
+	for (i = 0; i < mswi->hart_count; i++)
+		mswi_hartid2data[mswi->first_hartid + i] = mswi;
+
+	/* Add MSWI regions to the root domain */
+	for (pos = 0; pos < mswi->size; pos += ACLINT_MSWI_ALIGN) {
+		region_size = ((mswi->size - pos) < ACLINT_MSWI_ALIGN) ?
+			      (mswi->size - pos) : ACLINT_MSWI_ALIGN;
+		sbi_domain_memregion_init(mswi->addr + pos, region_size,
+					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+		rc = sbi_domain_root_add_memregion(&reg);
+		if (rc)
+			return rc;
+	}
+
+	sbi_ipi_set_device(&aclint_mswi);
+
+	return 0;
+}
diff --git a/lib/utils/ipi/objects.mk b/lib/utils/ipi/objects.mk
index 0071957..7e37816 100644
--- a/lib/utils/ipi/objects.mk
+++ b/lib/utils/ipi/objects.mk
@@ -7,5 +7,6 @@
 #   Anup Patel <anup.patel@wdc.com>
 #
 
+libsbiutils-objs-y += ipi/aclint_mswi.o
 libsbiutils-objs-y += ipi/fdt_ipi.o
 libsbiutils-objs-y += ipi/fdt_ipi_clint.o
-- 
2.25.1


