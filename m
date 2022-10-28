From: Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 01:40:40 +0100
Subject: [PATCH RFC 5/7] platform: Add Renesas RZ/Five initial support
In-Reply-To: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221028004042.135549-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This commit provides basic support for the Renesas RZ/Five SoC.

The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single).

Useful links:
-------------
[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
[1] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 platform/renesas/rzfive/Kconfig           |  32 +++++
 platform/renesas/rzfive/configs/defconfig |   0
 platform/renesas/rzfive/objects.mk        |  18 +++
 platform/renesas/rzfive/platform.c        | 161 ++++++++++++++++++++++
 platform/renesas/rzfive/platform.h        |  24 ++++
 5 files changed, 235 insertions(+)
 create mode 100644 platform/renesas/rzfive/Kconfig
 create mode 100644 platform/renesas/rzfive/configs/defconfig
 create mode 100644 platform/renesas/rzfive/objects.mk
 create mode 100644 platform/renesas/rzfive/platform.c
 create mode 100644 platform/renesas/rzfive/platform.h

diff --git a/platform/renesas/rzfive/Kconfig b/platform/renesas/rzfive/Kconfig
new file mode 100644
index 0000000..c5e8a19
--- /dev/null
+++ b/platform/renesas/rzfive/Kconfig
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config PLATFORM_RENESAS_RZFIVE
+	bool
+	select FDT
+	select FDT_SERIAL
+	select FDT_SERIAL_RENESAS_SCIF
+	select FDT_TIMER
+	select FDT_TIMER_PLMT
+	select FDT_IRQCHIP
+	select FDT_IRQCHIP_PLIC
+	select FDT_IPI
+	select FDT_IPI_PLICSW
+	default y
+
+if PLATFORM_RENESAS_RZFIVE
+
+config PLATFORM_RENESAS_RZFIVE_NAME
+	string "Platform default name"
+	default "Renesas RZ/Five"
+
+config PLATFORM_RENESAS_RZFIVE_MAJOR_VER
+	int "Platform major version"
+	range 0 65535
+	default 0
+
+config PLATFORM_RENESAS_RZFIVE_MINOR_VER
+	int "Platform minor version"
+	range 0 65535
+	default 1
+
+endif
diff --git a/platform/renesas/rzfive/configs/defconfig b/platform/renesas/rzfive/configs/defconfig
new file mode 100644
index 0000000..e69de29
diff --git a/platform/renesas/rzfive/objects.mk b/platform/renesas/rzfive/objects.mk
new file mode 100644
index 0000000..302b3d6
--- /dev/null
+++ b/platform/renesas/rzfive/objects.mk
@@ -0,0 +1,18 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2022 Renesas Electronics Corp.
+#
+
+# Compiler flags
+platform-cppflags-y =
+platform-cflags-y =
+platform-asflags-y =
+platform-ldflags-y =
+
+# Objects to build
+platform-objs-y += ../../andes/ae350/cache.o platform.o
+
+# Blobs to build
+FW_TEXT_START=0x00000000
+FW_DYNAMIC=y
diff --git a/platform/renesas/rzfive/platform.c b/platform/renesas/rzfive/platform.c
new file mode 100644
index 0000000..cfc557c
--- /dev/null
+++ b/platform/renesas/rzfive/platform.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Based on platform/andes/ae350/platform.c
+ * Copyright (c) 2019 Andes Technology Corporation
+ */
+
+#include <libfdt.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_const.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_trap.h>
+#include <sbi_utils/fdt/fdt_domain.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/ipi/fdt_ipi.h>
+#include <sbi_utils/irqchip/fdt_irqchip.h>
+#include <sbi_utils/serial/fdt_serial.h>
+#include <sbi_utils/timer/fdt_timer.h>
+
+#include "../../andes/ae350/cache.h"
+
+#include "platform.h"
+
+struct sbi_platform platform;
+unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
+			       unsigned long arg2, unsigned long arg3,
+			       unsigned long arg4)
+{
+	const char *model;
+	void *fdt = (void *)arg1;
+	u32 hartid, hart_count = 0;
+	int rc, root_offset, cpus_offset, cpu_offset, len;
+
+	root_offset = fdt_path_offset(fdt, "/");
+	if (root_offset < 0)
+		goto fail;
+
+	model = fdt_getprop(fdt, root_offset, "model", &len);
+	if (model)
+		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		goto fail;
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (rc)
+			continue;
+
+		if (SBI_HARTMASK_MAX_BITS <= hartid)
+			continue;
+
+		hart_count++;
+	}
+
+	platform.hart_count = hart_count;
+
+	/* Return original FDT pointer */
+	return arg1;
+
+fail:
+	while (1)
+		wfi();
+}
+
+/* Platform final initialization. */
+static int rzfive_final_init(bool cold_boot)
+{
+	void *fdt;
+
+	if (!cold_boot)
+		return 0;
+
+	fdt = fdt_get_address();
+	fdt_fixups(fdt);
+	fdt_domain_fixup(fdt);
+
+	return 0;
+}
+
+/* Vendor-Specific SBI handler */
+static int rzfive_vendor_ext_provider(long extid, long funcid,
+				      const struct sbi_trap_regs *regs,
+				      unsigned long *out_value,
+				      struct sbi_trap_info *out_trap)
+{
+	int ret = 0;
+
+	switch (funcid) {
+	case SBI_EXT_RENESAS_RZFIVE_GET_MCACHE_CTL_STATUS:
+		*out_value = csr_read(CSR_MCACHECTL);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_GET_MMISC_CTL_STATUS:
+		*out_value = csr_read(CSR_MMISCCTL);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_SET_MCACHE_CTL:
+		ret = mcall_set_mcache_ctl(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_SET_MMISC_CTL:
+		ret = mcall_set_mmisc_ctl(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_ICACHE_OP:
+		ret = mcall_icache_op(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_DCACHE_OP:
+		ret = mcall_dcache_op(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_L1CACHE_I_PREFETCH:
+		ret = mcall_l1_cache_i_prefetch_op(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_L1CACHE_D_PREFETCH:
+		ret = mcall_l1_cache_d_prefetch_op(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_NON_BLOCKING_LOAD_STORE:
+		ret = mcall_non_blocking_load_store(regs->a0);
+		break;
+	case SBI_EXT_RENESAS_RZFIVE_WRITE_AROUND:
+		ret = mcall_write_around(regs->a0);
+		break;
+	default:
+		sbi_printf("Unsupported vendor sbi call : %ld\n", funcid);
+		asm volatile("ebreak");
+	}
+
+	return ret;
+}
+
+static int rzfive_domains_init(void)
+{
+	return fdt_domains_populate(fdt_get_address());
+}
+
+/* Platform descriptor. */
+static const struct sbi_platform_operations platform_ops = {
+	.final_init		= rzfive_final_init,
+	.domains_init		= rzfive_domains_init,
+	.console_init		= fdt_serial_init,
+	.irqchip_init		= fdt_irqchip_init,
+	.ipi_init		= fdt_ipi_init,
+	.timer_init		= fdt_timer_init,
+	.vendor_ext_provider	= rzfive_vendor_ext_provider
+};
+
+struct sbi_platform platform = {
+	.opensbi_version = OPENSBI_VERSION,
+	.platform_version =
+		SBI_PLATFORM_VERSION(CONFIG_PLATFORM_RENESAS_RZFIVE_MAJOR_VER,
+				     CONFIG_PLATFORM_RENESAS_RZFIVE_MINOR_VER),
+	.name = CONFIG_PLATFORM_RENESAS_RZFIVE_NAME,
+	.features = SBI_PLATFORM_DEFAULT_FEATURES,
+	.hart_count = SBI_HARTMASK_MAX_BITS,
+	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
+	.platform_ops_addr = (unsigned long)&platform_ops
+};
diff --git a/platform/renesas/rzfive/platform.h b/platform/renesas/rzfive/platform.h
new file mode 100644
index 0000000..e46ca91
--- /dev/null
+++ b/platform/renesas/rzfive/platform.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#ifndef _RZFIVE_PLATFORM_H_
+#define _RZFIVE_PLATFORM_H_
+
+#include "../../andes/ae350/common-platform.h"
+
+enum sbi_ext_andes_fid {
+	SBI_EXT_RENESAS_RZFIVE_GET_MCACHE_CTL_STATUS = 0,
+	SBI_EXT_RENESAS_RZFIVE_GET_MMISC_CTL_STATUS,
+	SBI_EXT_RENESAS_RZFIVE_SET_MCACHE_CTL,
+	SBI_EXT_RENESAS_RZFIVE_SET_MMISC_CTL,
+	SBI_EXT_RENESAS_RZFIVE_ICACHE_OP,
+	SBI_EXT_RENESAS_RZFIVE_DCACHE_OP,
+	SBI_EXT_RENESAS_RZFIVE_L1CACHE_I_PREFETCH,
+	SBI_EXT_RENESAS_RZFIVE_L1CACHE_D_PREFETCH,
+	SBI_EXT_RENESAS_RZFIVE_NON_BLOCKING_LOAD_STORE,
+	SBI_EXT_RENESAS_RZFIVE_WRITE_AROUND,
+};
+
+#endif /* _RZFIVE_PLATFORM_H_ */
-- 
2.17.1


