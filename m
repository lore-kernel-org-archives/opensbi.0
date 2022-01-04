From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Jan 2022 15:43:22 +0530
Subject: [PATCH 12/13] lib: utils/irqchip: Add FDT based driver for APLIC
In-Reply-To: <20220104101323.127564-1-apatel@ventanamicro.com>
References: <20220104101323.127564-1-apatel@ventanamicro.com>
Message-ID: <20220104101323.127564-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add simple FDT irqchip driver for APLIC so that generic platform (and
other FDT based platforms) can utilize common APLIC initialization library.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi_utils/fdt/fdt_helper.h    |   4 +
 lib/utils/fdt/fdt_helper.c            | 159 ++++++++++++++++++++++++++
 lib/utils/irqchip/fdt_irqchip.c       |   2 +
 lib/utils/irqchip/fdt_irqchip_aplic.c |  56 +++++++++
 lib/utils/irqchip/objects.mk          |   1 +
 5 files changed, 222 insertions(+)
 create mode 100644 lib/utils/irqchip/fdt_irqchip_aplic.c

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 4c8d29e..1232b26 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -68,6 +68,10 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
 int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
 		       const char *compatible);
 
+struct aplic_data;
+
+int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic);
+
 struct imsic_data;
 
 bool fdt_check_imsic_mlevel(void *fdt);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index e2782b6..2f5ebc8 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/irqchip/aplic.h>
 #include <sbi_utils/irqchip/imsic.h>
 #include <sbi_utils/irqchip/plic.h>
 
@@ -466,6 +467,164 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
 	return fdt_parse_uart8250_node(fdt, nodeoffset, uart);
 }
 
+int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
+{
+	bool child_found;
+	const fdt32_t *val;
+	const fdt32_t *del;
+	struct imsic_data imsic;
+	int i, j, d, dcnt, len, noff, rc;
+	uint64_t reg_addr, reg_size;
+	struct aplic_delegate_data *deleg;
+
+	if (nodeoff < 0 || !aplic || !fdt)
+		return SBI_ENODEV;
+	memset(aplic, 0, sizeof(*aplic));
+
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
+	if (rc < 0 || !reg_addr || !reg_size)
+		return SBI_ENODEV;
+	aplic->addr = reg_addr;
+	aplic->size = reg_size;
+
+	val = fdt_getprop(fdt, nodeoff, "riscv,num-sources", &len);
+	if (len > 0)
+		aplic->num_source = fdt32_to_cpu(*val);
+
+	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &len);
+	if (val && len > sizeof(fdt32_t)) {
+		len = len / sizeof(fdt32_t);
+		for (i = 0; i < len; i += 2) {
+			if (fdt32_to_cpu(val[i + 1]) == IRQ_M_EXT) {
+				aplic->targets_mmode = true;
+				break;
+			}
+		}
+		aplic->num_idc = len / 2;
+		goto aplic_msi_parent_done;
+	}
+
+	val = fdt_getprop(fdt, nodeoff, "msi-parent", &len);
+	if (val && len >= sizeof(fdt32_t)) {
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (noff < 0)
+			return noff;
+
+		rc = fdt_parse_imsic_node(fdt, noff, &imsic);
+		if (rc)
+			return rc;
+
+		rc = imsic_data_check(&imsic);
+		if (rc)
+			return rc;
+
+		aplic->targets_mmode = imsic.targets_mmode;
+
+		if (imsic.targets_mmode) {
+			aplic->has_msicfg_mmode = true;
+			aplic->msicfg_mmode.lhxs = imsic.guest_index_bits;
+			aplic->msicfg_mmode.lhxw = imsic.hart_index_bits;
+			aplic->msicfg_mmode.hhxw = imsic.group_index_bits;
+			aplic->msicfg_mmode.hhxs = imsic.group_index_shift;
+			if (aplic->msicfg_mmode.hhxs <
+					(2 * IMSIC_MMIO_PAGE_SHIFT))
+				return SBI_EINVAL;
+			aplic->msicfg_mmode.hhxs -= 24;
+			aplic->msicfg_mmode.base_addr = imsic.regs[0].addr;
+		} else {
+			goto aplic_msi_parent_done;
+		}
+
+		val = fdt_getprop(fdt, nodeoff, "riscv,children", &len);
+		if (!val || len < sizeof(fdt32_t))
+			goto aplic_msi_parent_done;
+
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (noff < 0)
+			return noff;
+
+		val = fdt_getprop(fdt, noff, "msi-parent", &len);
+		if (!val || len < sizeof(fdt32_t))
+			goto aplic_msi_parent_done;
+
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (noff < 0)
+			return noff;
+
+		rc = fdt_parse_imsic_node(fdt, noff, &imsic);
+		if (rc)
+			return rc;
+
+		rc = imsic_data_check(&imsic);
+		if (rc)
+			return rc;
+
+		if (!imsic.targets_mmode) {
+			aplic->has_msicfg_smode = true;
+			aplic->msicfg_smode.lhxs = imsic.guest_index_bits;
+			aplic->msicfg_smode.lhxw = imsic.hart_index_bits;
+			aplic->msicfg_smode.hhxw = imsic.group_index_bits;
+			aplic->msicfg_smode.hhxs = imsic.group_index_shift;
+			if (aplic->msicfg_smode.hhxs <
+					(2 * IMSIC_MMIO_PAGE_SHIFT))
+				return SBI_EINVAL;
+			aplic->msicfg_smode.hhxs -= 24;
+			aplic->msicfg_smode.base_addr = imsic.regs[0].addr;
+		}
+	}
+aplic_msi_parent_done:
+
+	for (d = 0; d < APLIC_MAX_DELEGATE; d++) {
+		deleg = &aplic->delegate[d];
+		deleg->first_irq = 0;
+		deleg->last_irq = 0;
+		deleg->child_index = 0;
+	}
+
+	del = fdt_getprop(fdt, nodeoff, "riscv,delegate", &len);
+	if (!del || len < (3 * sizeof(fdt32_t)))
+		goto skip_delegate_parse;
+	d = 0;
+	dcnt = len / sizeof(fdt32_t);
+	for (i = 0; i < dcnt; i += 3) {
+		if (d >= APLIC_MAX_DELEGATE)
+			break;
+		deleg = &aplic->delegate[d];
+
+		deleg->first_irq = fdt32_to_cpu(del[i + 1]);
+		deleg->last_irq = fdt32_to_cpu(del[i + 2]);
+		deleg->child_index = 0;
+
+		child_found = false;
+		val = fdt_getprop(fdt, nodeoff, "riscv,children", &len);
+		if (!val || len < sizeof(fdt32_t)) {
+			deleg->first_irq = 0;
+			deleg->last_irq = 0;
+			deleg->child_index = 0;
+			continue;
+		}
+		len = len / sizeof(fdt32_t);
+		for (j = 0; j < len; j++) {
+			if (del[i] != val[j])
+				continue;
+			deleg->child_index = j;
+			child_found = true;
+			break;
+		}
+
+		if (child_found) {
+			d++;
+		} else {
+			deleg->first_irq = 0;
+			deleg->last_irq = 0;
+			deleg->child_index = 0;
+		}
+	}
+skip_delegate_parse:
+
+	return 0;
+}
+
 bool fdt_check_imsic_mlevel(void *fdt)
 {
 	const fdt32_t *val;
diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
index cf64a2e..6007755 100644
--- a/lib/utils/irqchip/fdt_irqchip.c
+++ b/lib/utils/irqchip/fdt_irqchip.c
@@ -12,10 +12,12 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 
+extern struct fdt_irqchip fdt_irqchip_aplic;
 extern struct fdt_irqchip fdt_irqchip_imsic;
 extern struct fdt_irqchip fdt_irqchip_plic;
 
 static struct fdt_irqchip *irqchip_drivers[] = {
+	&fdt_irqchip_aplic,
 	&fdt_irqchip_imsic,
 	&fdt_irqchip_plic
 };
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
new file mode 100644
index 0000000..965f023
--- /dev/null
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -0,0 +1,56 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2022 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/irqchip/fdt_irqchip.h>
+#include <sbi_utils/irqchip/aplic.h>
+
+#define APLIC_MAX_NR			16
+
+static unsigned long aplic_count = 0;
+static struct aplic_data aplic[APLIC_MAX_NR];
+
+static int irqchip_aplic_warm_init(void)
+{
+	/* Nothing to do here. */
+	return 0;
+}
+
+static int irqchip_aplic_cold_init(void *fdt, int nodeoff,
+				  const struct fdt_match *match)
+{
+	int rc;
+	struct aplic_data *pd;
+
+	if (APLIC_MAX_NR <= aplic_count)
+		return SBI_ENOSPC;
+	pd = &aplic[aplic_count++];
+
+	rc = fdt_parse_aplic_node(fdt, nodeoff, pd);
+	if (rc)
+		return rc;
+
+	return aplic_cold_irqchip_init(pd);
+}
+
+static const struct fdt_match irqchip_aplic_match[] = {
+	{ .compatible = "riscv,aplic" },
+	{ },
+};
+
+struct fdt_irqchip fdt_irqchip_aplic = {
+	.match_table = irqchip_aplic_match,
+	.cold_init = irqchip_aplic_cold_init,
+	.warm_init = irqchip_aplic_warm_init,
+	.exit = NULL,
+};
diff --git a/lib/utils/irqchip/objects.mk b/lib/utils/irqchip/objects.mk
index b2b3f79..fad4344 100644
--- a/lib/utils/irqchip/objects.mk
+++ b/lib/utils/irqchip/objects.mk
@@ -8,6 +8,7 @@
 #
 
 libsbiutils-objs-y += irqchip/fdt_irqchip.o
+libsbiutils-objs-y += irqchip/fdt_irqchip_aplic.o
 libsbiutils-objs-y += irqchip/fdt_irqchip_imsic.o
 libsbiutils-objs-y += irqchip/fdt_irqchip_plic.o
 libsbiutils-objs-y += irqchip/aplic.o
-- 
2.25.1


