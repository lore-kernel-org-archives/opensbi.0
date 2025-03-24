From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:06 -0700
Subject: [PATCH v2 2/5] lib: utils/fdt: Cache CPU information from the DT
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
Message-ID: <20250324154858.4147529-3-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looking up and parsing the CPU nodes in the DT is extremely expensive.
Functions like fdt_node_offset_by_phandle() and fdt_parent_offset() must
walk the entire FDT structure because they are a backward lookup. Since
the offsets and phandles of the CPU and interrupt controller DT nodes
are used in several places in OpenSBI, we can significantly speed up
cold boot by caching the information in the scratch area. On the HiFive
Premier P550 board, adding and using the cache reduced boot time by 33%.

Any platform that uses the cached information (for example in FDT driver
initialization routins) must first call fdt_cpu_init().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rename for_each_hartindex() to sbi_for_each_hartindex()

 include/sbi_utils/fdt/fdt_cpu.h    |  57 +++++++++++++++
 lib/utils/fdt/fdt_cpu.c            | 110 +++++++++++++++++++++++++++++
 lib/utils/fdt/objects.mk           |   1 +
 platform/fpga/openpiton/platform.c |   5 ++
 platform/generic/platform.c        |   5 ++
 platform/kendryte/k210/platform.c  |  10 +++
 6 files changed, 188 insertions(+)
 create mode 100644 include/sbi_utils/fdt/fdt_cpu.h
 create mode 100644 lib/utils/fdt/fdt_cpu.c

diff --git a/include/sbi_utils/fdt/fdt_cpu.h b/include/sbi_utils/fdt/fdt_cpu.h
new file mode 100644
index 00000000..8c05cd3b
--- /dev/null
+++ b/include/sbi_utils/fdt/fdt_cpu.h
@@ -0,0 +1,57 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * fdt_cpu.h - Efficient access to CPU information from the devicetree.
+ *
+ * Copyright (c) 2025 SiFive
+ */
+
+#ifndef __FDT_CPU_H__
+#define __FDT_CPU_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * Look up the DT node offset for a given hart
+ *
+ * @param hartindex a valid hart index
+ *
+ * @return the node offset in the FDT, or a negative error code on failure
+ */
+int fdt_cpu_hartindex_to_offset(u32 hartindex);
+
+/**
+ * Look up the hart index for a given CPU DT node phandle
+ *
+ * @param phandle the phandle of the CPU node
+ *
+ * @return the hart index, or an invalid hart index on failure
+ */
+u32 fdt_cpu_phandle_to_hartindex(u32 phandle);
+
+/**
+ * Look up the hart index for a given CPU interrupt controller DT node phandle
+ *
+ * @param phandle the phandle of the CPU interrupt controller node
+ *
+ * @return the hart index, or an invalid hart index on failure
+ */
+u32 fdt_cpu_intc_phandle_to_hartindex(u32 phandle);
+
+/**
+ * Get the CPU timebase frequency
+ *
+ * @return the timebase frequency in Hertz if known, or else 0
+ */
+u32 fdt_cpu_get_timebase_frequency(void);
+
+/**
+ * Initialize the cache of CPU node information
+ *
+ * @param fdt devicetree blob
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cpu_init(const void *fdt);
+
+#endif /* __FDT_CPU_H__ */
diff --git a/lib/utils/fdt/fdt_cpu.c b/lib/utils/fdt/fdt_cpu.c
new file mode 100644
index 00000000..9a8add76
--- /dev/null
+++ b/lib/utils/fdt/fdt_cpu.c
@@ -0,0 +1,110 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct fdt_cpu_info {
+	int cpu_offset;
+	u32 cpu_phandle;
+	u32 intc_phandle;
+};
+
+static unsigned long fdt_cpu_info_offset;
+static u32 fdt_cpu_timebase_frequency;
+
+int fdt_cpu_hartindex_to_offset(u32 hartindex)
+{
+	struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+		sbi_hartindex_to_scratch(hartindex), fdt_cpu_info_offset);
+
+	return info->cpu_offset;
+}
+
+u32 fdt_cpu_phandle_to_hartindex(u32 phandle)
+{
+	sbi_for_each_hartindex(i) {
+		struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+			sbi_hartindex_to_scratch(i), fdt_cpu_info_offset);
+
+		if (info->cpu_phandle == phandle)
+			return i;
+	}
+
+	return -1U;
+}
+
+u32 fdt_cpu_intc_phandle_to_hartindex(u32 phandle)
+{
+	sbi_for_each_hartindex(i) {
+		struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+			sbi_hartindex_to_scratch(i), fdt_cpu_info_offset);
+
+		if (info->intc_phandle == phandle)
+			return i;
+	}
+
+	return -1U;
+}
+
+u32 fdt_cpu_get_timebase_frequency(void)
+{
+	return fdt_cpu_timebase_frequency;
+}
+
+int fdt_cpu_init(const void *fdt)
+{
+	int cpu_offset, cpus_offset, err, intc_offset, len;
+	struct sbi_scratch *scratch;
+	struct fdt_cpu_info *info;
+	const fdt32_t *val;
+	u32 hartid;
+
+	fdt_cpu_info_offset = sbi_scratch_alloc_type_offset(struct fdt_cpu_info);
+	if (!fdt_cpu_info_offset)
+		return SBI_ENOMEM;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return SBI_ENOENT;
+
+	val = fdt_getprop(fdt, cpus_offset, "timebase-frequency", &len);
+	if (val && len == sizeof(*val))
+		fdt_cpu_timebase_frequency = fdt32_to_cpu(*val);
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (err)
+			continue;
+
+		/*
+		 * There is no need to apply any filters (e.g. disabled nodes)
+		 * because those harts will not have an associated hart index.
+		 */
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		info = sbi_scratch_offset_ptr(scratch, fdt_cpu_info_offset);
+		info->cpu_offset = cpu_offset;
+		info->cpu_phandle = fdt_get_phandle(fdt, cpu_offset);
+
+		fdt_for_each_subnode(intc_offset, fdt, cpu_offset) {
+			err = fdt_node_check_compatible(fdt, intc_offset, "riscv,cpu-intc");
+			if (err)
+				continue;
+
+			info->intc_phandle = fdt_get_phandle(fdt, intc_offset);
+			break;
+		}
+	}
+
+	return 0;
+
+}
diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk
index 31cf1c5a..f540f53b 100644
--- a/lib/utils/fdt/objects.mk
+++ b/lib/utils/fdt/objects.mk
@@ -9,5 +9,6 @@ libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_early_drivers.carray.o
 libsbiutils-objs-$(CONFIG_FDT_DOMAIN) += fdt/fdt_domain.o
 libsbiutils-objs-$(CONFIG_FDT_PMU) += fdt/fdt_pmu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_helper.o
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_cpu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_driver.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_fixup.o
diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
index 9f4378a4..2789c5c8 100644
--- a/platform/fpga/openpiton/platform.c
+++ b/platform/fpga/openpiton/platform.c
@@ -9,6 +9,7 @@
 #include <sbi/sbi_const.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
@@ -87,6 +88,10 @@ static int openpiton_early_init(bool cold_boot)
 		return 0;
 	fdt = fdt_get_address();
 
+	rc = fdt_cpu_init(fdt);
+	if (rc)
+		return rc;
+
 	rc = fdt_parse_uart8250(fdt, &uart_data, "ns16550");
 	if (!rc)
 		uart = uart_data;
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index b2f29e8b..44fd0ed1 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -247,6 +248,10 @@ static int generic_early_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
+		rc = fdt_cpu_init(fdt);
+		if (rc)
+			return rc;
+
 		if (semihosting_enabled())
 			rc = semihosting_init();
 		else
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index aff133c6..d14cf6a8 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_const.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_system.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/ipi/aclint_mswi.h>
@@ -112,9 +113,18 @@ static struct sbi_system_reset_device k210_reset = {
 
 static int k210_early_init(bool cold_boot)
 {
+	const void *fdt;
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
+	fdt = fdt_get_address();
+
+	rc = fdt_cpu_init(fdt);
+	if (rc)
+		return rc;
+
 	sbi_system_reset_add_device(&k210_reset);
 
 	return sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
-- 
2.47.2


