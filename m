From: Sunil V L <sunilvl@ventanamicro.com>
Date: Thu, 23 Mar 2023 14:33:18 +0530
Subject: [RFC PATCH v2 2/4] lib: sbi: Implement SBI CPPC extension
In-Reply-To: <20230323090320.2489167-1-sunilvl@ventanamicro.com>
References: <20230323090320.2489167-1-sunilvl@ventanamicro.com>
Message-ID: <20230323090320.2489167-3-sunilvl@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement SBI CPPC extension. This extension is only available when
OpenSBI platform provides a CPPC device to generic library.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_cppc.h   |  35 +++++++++++
 lib/sbi/Kconfig          |   4 ++
 lib/sbi/objects.mk       |   4 ++
 lib/sbi/sbi_cppc.c       | 124 +++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_cppc.c |  63 ++++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 include/sbi/sbi_cppc.h
 create mode 100644 lib/sbi/sbi_cppc.c
 create mode 100644 lib/sbi/sbi_ecall_cppc.c

diff --git a/include/sbi/sbi_cppc.h b/include/sbi/sbi_cppc.h
new file mode 100644
index 0000000..edf73f5
--- /dev/null
+++ b/include/sbi/sbi_cppc.h
@@ -0,0 +1,35 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ */
+
+#ifndef __SBI_CPPC_H__
+#define __SBI_CPPC_H__
+
+#include <sbi/sbi_types.h>
+
+/** CPPC device */
+struct sbi_cppc_device {
+	/** Name of the CPPC device */
+	char name[32];
+
+	/** probe - returns register width if implemented, 0 otherwise */
+	int (*cppc_probe)(unsigned long reg);
+
+	/** read the cppc register*/
+	int (*cppc_read)(unsigned long reg, uint64_t *val);
+
+	/** write to the cppc register*/
+	int (*cppc_write)(unsigned long reg, uint64_t val);
+};
+
+int sbi_cppc_probe(unsigned long reg);
+int sbi_cppc_read(unsigned long reg, uint64_t *val);
+int sbi_cppc_write(unsigned long reg, uint64_t val);
+
+const struct sbi_cppc_device *sbi_cppc_get_device(void);
+void sbi_cppc_set_device(const struct sbi_cppc_device *dev);
+
+#endif
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 7eb3273..477775e 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -34,6 +34,10 @@ config SBI_ECALL_DBCN
 	bool "Debug Console extension"
 	default y
 
+config SBI_ECALL_CPPC
+	bool "CPPC extension"
+	default y
+
 config SBI_ECALL_LEGACY
 	bool "SBI v0.1 legacy extensions"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 770238b..7d691c6 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -43,6 +43,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBCN) += ecall_dbcn
 libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_dbcn.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_CPPC) += ecall_cppc
+libsbi-objs-$(CONFIG_SBI_ECALL_CPPC) += sbi_ecall_cppc.o
+
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
 libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
 
@@ -74,3 +77,4 @@ libsbi-objs-y += sbi_tlb.o
 libsbi-objs-y += sbi_trap.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
+libsbi-objs-y += sbi_cppc.o
diff --git a/lib/sbi/sbi_cppc.c b/lib/sbi/sbi_cppc.c
new file mode 100644
index 0000000..b177c9b
--- /dev/null
+++ b/lib/sbi/sbi_cppc.c
@@ -0,0 +1,124 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_cppc.h>
+
+static const struct sbi_cppc_device *cppc_dev = NULL;
+
+const struct sbi_cppc_device *sbi_cppc_get_device(void)
+{
+	return cppc_dev;
+}
+
+void sbi_cppc_set_device(const struct sbi_cppc_device *dev)
+{
+	if (!dev || cppc_dev)
+		return;
+
+	cppc_dev = dev;
+}
+
+static bool sbi_cppc_is_reserved(unsigned long reg)
+{
+	if ((reg > SBI_CPPC_ACPI_LAST && reg < SBI_CPPC_TRANSITION_LATENCY) ||
+	    reg > SBI_CPPC_NON_ACPI_LAST)
+		return true;
+
+	return false;
+}
+
+static bool sbi_cppc_readable(unsigned long reg)
+{
+	/* there are no write-only cppc registers currently */
+	return true;
+}
+
+static bool sbi_cppc_writable(unsigned long reg)
+{
+	switch (reg) {
+	case SBI_CPPC_HIGHEST_PERF:
+	case SBI_CPPC_NOMINAL_PERF:
+	case SBI_CPPC_LOW_NON_LINEAR_PERF:
+	case SBI_CPPC_LOWEST_PERF:
+	case SBI_CPPC_GUARANTEED_PERF:
+	case SBI_CPPC_CTR_WRAP_TIME:
+	case SBI_CPPC_REFERENCE_CTR:
+	case SBI_CPPC_DELIVERED_CTR:
+	case SBI_CPPC_REFERENCE_PERF:
+	case SBI_CPPC_LOWEST_FREQ:
+	case SBI_CPPC_NOMINAL_FREQ:
+	case SBI_CPPC_TRANSITION_LATENCY:
+		return false;
+	}
+
+	return true;
+}
+
+int sbi_cppc_probe(unsigned long reg)
+{
+	int ret;
+
+	if (!cppc_dev || !cppc_dev->cppc_probe)
+		return SBI_EFAIL;
+
+	/* Check whether register is reserved */
+	if (sbi_cppc_is_reserved(reg))
+		return SBI_ERR_INVALID_PARAM;
+
+	ret = cppc_dev->cppc_probe(reg);
+	if (ret >= 0)
+		return ret;
+	else
+		return SBI_ERR_FAILED;
+}
+
+int sbi_cppc_read(unsigned long reg, uint64_t *val)
+{
+	if (!cppc_dev || !cppc_dev->cppc_read || !cppc_dev->cppc_probe)
+		return SBI_EFAIL;
+
+	/* Check whether register is reserved */
+	if (sbi_cppc_is_reserved(reg))
+		return SBI_ERR_INVALID_PARAM;
+
+	/* Check whether register is implemented */
+	if (!cppc_dev->cppc_probe(reg))
+		return SBI_ERR_NOT_SUPPORTED;
+
+	/* Check whether the register is write-only */
+	if (!sbi_cppc_readable(reg))
+		return SBI_ERR_DENIED;
+
+	if (!cppc_dev->cppc_read(reg, val))
+		return SBI_SUCCESS;
+	else
+		return SBI_ERR_FAILED;
+}
+
+int sbi_cppc_write(unsigned long reg, uint64_t val)
+{
+	if (!cppc_dev || !cppc_dev->cppc_write || !cppc_dev->cppc_probe)
+		return SBI_EFAIL;
+
+	/* Check whether register is reserved */
+	if (sbi_cppc_is_reserved(reg))
+		return SBI_ERR_INVALID_PARAM;
+
+	/* Check whether register is implemented */
+	if (!cppc_dev->cppc_probe(reg))
+		return SBI_ERR_NOT_SUPPORTED;
+
+	/* Check whether the register is read-only */
+	if (!sbi_cppc_writable(reg))
+		return SBI_ERR_DENIED;
+
+	if (!cppc_dev->cppc_write(reg, val))
+		return SBI_SUCCESS;
+	else
+		return SBI_ERR_FAILED;
+}
diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
new file mode 100644
index 0000000..91585f3
--- /dev/null
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -0,0 +1,63 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_cppc.h>
+
+static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
+				  const struct sbi_trap_regs *regs,
+				  unsigned long *out_val,
+				  struct sbi_trap_info *out_trap)
+{
+	int ret = 0;
+	uint64_t temp;
+
+	switch (funcid) {
+	case SBI_EXT_CPPC_READ:
+		ret = sbi_cppc_read(regs->a0, &temp);
+		*out_val = temp;
+		break;
+	case SBI_EXT_CPPC_READ_HI:
+#if __riscv_xlen == 32
+		ret = sbi_cppc_read(regs->a0, &temp);
+		*out_val = temp >> 32;
+#else
+		*out_val = 0;
+#endif
+		break;
+	case SBI_EXT_CPPC_WRITE:
+		ret = sbi_cppc_write(regs->a0, regs->a1);
+		break;
+	case SBI_EXT_CPPC_PROBE:
+		ret = sbi_cppc_probe(regs->a0);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+	}
+
+	return ret;
+}
+
+static int sbi_ecall_cppc_probe(unsigned long extid, unsigned long *out_val)
+{
+	*out_val = sbi_cppc_get_device() ? 1 : 0;
+	return 0;
+}
+
+struct sbi_ecall_extension ecall_cppc = {
+	.extid_start	= SBI_EXT_CPPC,
+	.extid_end	= SBI_EXT_CPPC,
+	.handle		= sbi_ecall_cppc_handler,
+	.probe		= sbi_ecall_cppc_probe,
+};
-- 
2.34.1


