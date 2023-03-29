From: Sunil V L <sunilvl@ventanamicro.com>
Date: Wed, 29 Mar 2023 14:27:28 +0530
Subject: [RFC PATCH v5 4/4] NOT_FOR_MERGE: Add test code to emulate CPPC extension
In-Reply-To: <20230329085728.2074106-1-sunilvl@ventanamicro.com>
References: <20230329085728.2074106-1-sunilvl@ventanamicro.com>
Message-ID: <20230329085728.2074106-5-sunilvl@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a test code to emulate the CPPC extension and it is
not for merge.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/sbi/sbi_cppc.h       |   2 +
 platform/generic/objects.mk  |   1 +
 platform/generic/platform.c  |   6 ++
 platform/generic/test_cppc.c | 160 +++++++++++++++++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 platform/generic/test_cppc.c

diff --git a/include/sbi/sbi_cppc.h b/include/sbi/sbi_cppc.h
index edf73f5..f62d702 100644
--- a/include/sbi/sbi_cppc.h
+++ b/include/sbi/sbi_cppc.h
@@ -32,4 +32,6 @@ int sbi_cppc_write(unsigned long reg, uint64_t val);
 const struct sbi_cppc_device *sbi_cppc_get_device(void);
 void sbi_cppc_set_device(const struct sbi_cppc_device *dev);
 
+int test_cppc_init(void);
+
 #endif
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index 136853e..d9eb959 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -20,6 +20,7 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
 # Objects to build
 platform-objs-y += platform.o
 platform-objs-y += platform_override_modules.o
+platform-objs-$(CONFIG_SBI_ECALL_CPPC) += test_cppc.o
 
 # Blobs to build
 FW_TEXT_START=0x80000000
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index eeefef4..ef85b70 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
+#include <sbi/sbi_cppc.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
 #include <sbi_utils/fdt/fdt_helper.h>
@@ -166,6 +167,11 @@ static int generic_final_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
+#ifdef CONFIG_SBI_ECALL_CPPC
+	if (!generic_plat)
+		test_cppc_init();
+#endif
+
 	fdt = fdt_get_address();
 
 	fdt_cpu_fixup(fdt);
diff --git a/platform/generic/test_cppc.c b/platform/generic/test_cppc.c
new file mode 100644
index 0000000..b96d904
--- /dev/null
+++ b/platform/generic/test_cppc.c
@@ -0,0 +1,160 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ */
+
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_cppc.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_timer.h>
+
+struct perf_channel {
+	unsigned int	desired_perf;
+	unsigned int	perf_limited;
+	unsigned int	transition_latency;
+};
+
+static unsigned long cppc_offset;
+
+static int sbi_cppc_test_probe(unsigned long reg)
+{
+	switch (reg) {
+	case SBI_CPPC_REFERENCE_CTR:
+	case SBI_CPPC_DELIVERED_CTR:
+		return 64;
+	case SBI_CPPC_DESIRED_PERF:
+	case SBI_CPPC_PERF_LIMITED:
+	case SBI_CPPC_TRANSITION_LATENCY:
+		return 32;
+	default:
+		/* Unimplemented */
+		return 0;
+	}
+}
+
+static int sbi_cppc_test_read(unsigned long reg, uint64_t *val)
+{
+	struct sbi_scratch *scratch;
+	struct perf_channel *cppc;
+	unsigned long hartid;
+	int ret = SBI_SUCCESS;
+
+	hartid = current_hartid();
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	cppc = sbi_scratch_offset_ptr(scratch, cppc_offset);
+
+	switch (reg) {
+	case SBI_CPPC_DESIRED_PERF:
+		*val = cppc->desired_perf;
+		break;
+	case SBI_CPPC_REFERENCE_CTR:
+		*val = sbi_timer_value();
+		break;
+	case SBI_CPPC_DELIVERED_CTR:
+		/*
+		 * Can't use CYCLE CSR properly in qemu, so just return
+		 * TIME itself so that delta(delivered) / delta(ref) = 1
+		 */
+		*val = sbi_timer_value();
+		break;
+	case SBI_CPPC_PERF_LIMITED:
+		*val = cppc->perf_limited;
+		break;
+	case SBI_CPPC_TRANSITION_LATENCY:
+		*val = cppc->transition_latency;
+		break;
+	default:
+		/*
+		 * Common read should have checked for unimplemented,
+		 * reserved or write-only registers.
+		 */
+		ret = SBI_ERR_FAILED;
+	}
+
+	return ret;
+}
+
+static int sbi_cppc_test_write(unsigned long reg, uint64_t val)
+{
+	struct sbi_scratch *scratch;
+	struct perf_channel *cppc;
+	unsigned long hartid;
+	int ret = SBI_SUCCESS;
+
+	hartid = current_hartid();
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	cppc = sbi_scratch_offset_ptr(scratch, cppc_offset);
+
+	switch (reg) {
+	case SBI_CPPC_DESIRED_PERF:
+		cppc->desired_perf = val;
+		break;
+	case SBI_CPPC_PERF_LIMITED:
+		cppc->perf_limited = val;
+		break;
+	default:
+		/*
+		 * Common read should have checked for unimplemented,
+		 * reserved or write-only registers.
+		 */
+		ret = SBI_ERR_FAILED;
+	}
+
+	return ret;
+}
+
+static struct sbi_cppc_device sbi_system_cppc_test = {
+	.name		= "cppc-test",
+	.cppc_read	= sbi_cppc_test_read,
+	.cppc_write	= sbi_cppc_test_write,
+	.cppc_probe	= sbi_cppc_test_probe,
+};
+
+static void sbi_cppc_test_enable(void)
+{
+	sbi_cppc_set_device(&sbi_system_cppc_test);
+}
+
+/*
+ * Allocate scratch space as the channel memory to emulate the SBI CPPC
+ * extension.
+ */
+int test_cppc_init()
+{
+	u32 i;
+	struct sbi_scratch *rscratch;
+	struct perf_channel *cppc;
+
+	cppc_offset = sbi_scratch_alloc_offset(sizeof(*cppc));
+	if (!cppc_offset)
+		return SBI_ENOMEM;
+
+	/* Initialize hart state data for every hart */
+	for (i = 0; i <= sbi_scratch_last_hartid(); i++) {
+		rscratch = sbi_hartid_to_scratch(i);
+		if (!rscratch)
+			continue;
+
+		cppc = sbi_scratch_offset_ptr(rscratch,
+					      cppc_offset);
+		if (cppc) {
+			sbi_memset(cppc, 0, sizeof(*cppc));
+
+			/* Initialize sample values */
+			cppc->desired_perf = 5;
+			cppc->perf_limited = 0;
+			cppc->transition_latency = 20000;
+		}
+	}
+
+	sbi_cppc_test_enable();
+
+	return 0;
+}
-- 
2.34.1


