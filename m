From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Wed, 27 Mar 2024 11:11:32 +0100
Subject: [PATCH 4/9] platform: generic: thead: Add CSR read handler for T-Head C9xx
In-Reply-To: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
References: <20240327101137.3644359-1-christoph.muellner@vrull.eu>
Message-ID: <20240327101137.3644359-5-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

T-Head C9xx harts provide a TH_MXSTATUS CSR, that allows viewing the state
of vendor extensions. Let's provide a mechanism to handle read requests
to this CSR, where the actual value of the CSR is provided.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 platform/generic/include/thead/c9xx_csr.h | 16 ++++++++++++
 platform/generic/thead/Kconfig            |  4 +++
 platform/generic/thead/objects.mk         |  2 ++
 platform/generic/thead/thead_c9xx_csr.c   | 30 +++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 platform/generic/include/thead/c9xx_csr.h
 create mode 100644 platform/generic/thead/thead_c9xx_csr.c

diff --git a/platform/generic/include/thead/c9xx_csr.h b/platform/generic/include/thead/c9xx_csr.h
new file mode 100644
index 0000000..8740afa
--- /dev/null
+++ b/platform/generic/include/thead/c9xx_csr.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Christoph M?llner <christoph.muellner@vrull.eu>
+ */
+
+#ifndef __RISCV_THEAD_C9XX_CSR_H____
+#define __RISCV_THEAD_C9XX_CSR_H____
+
+struct sbi_trap_regs;
+
+int thead_c9xx_read_csr(int csr_num, struct sbi_trap_regs *regs,
+			ulong *csr_val);
+
+#endif // __RISCV_THEAD_C9XX_CSR_H____
diff --git a/platform/generic/thead/Kconfig b/platform/generic/thead/Kconfig
index c50d38e..b20885c 100644
--- a/platform/generic/thead/Kconfig
+++ b/platform/generic/thead/Kconfig
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: BSD-2-Clause
 
+config THEAD_C9XX_CSR
+	bool "T-HEAD c9xx M-mode vendor CSR support"
+	default n
+
 config THEAD_C9XX_PMU
 	bool "T-HEAD c9xx M-mode PMU support"
 	default n
diff --git a/platform/generic/thead/objects.mk b/platform/generic/thead/objects.mk
index 84f9faf..5606d36 100644
--- a/platform/generic/thead/objects.mk
+++ b/platform/generic/thead/objects.mk
@@ -5,6 +5,8 @@
 # Copyright (C) 2023 Alibaba Group Holding Limited.
 #
 
+platform-objs-$(CONFIG_THEAD_C9XX_CSR) += thead/thead_c9xx_csr.o
+
 platform-objs-$(CONFIG_THEAD_C9XX_PMU) += thead/thead_c9xx_pmu.o
 
 platform-objs-$(CONFIG_THEAD_C9XX_ERRATA) += thead/thead_c9xx_tlb_trap_handler.o
diff --git a/platform/generic/thead/thead_c9xx_csr.c b/platform/generic/thead/thead_c9xx_csr.c
new file mode 100644
index 0000000..155b3f3
--- /dev/null
+++ b/platform/generic/thead/thead_c9xx_csr.c
@@ -0,0 +1,30 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Christoph M?llner <christoph.muellner@vrull.eu>
+ */
+
+#include <thead/c9xx_encoding.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_error.h>
+
+int thead_c9xx_read_csr(int csr_num, struct sbi_trap_regs *regs,
+			ulong *csr_val)
+{
+	int ret = 0;
+
+	switch (csr_num) {
+		case THEAD_C9XX_CSR_MXSTATUS:
+		*csr_val = csr_read(THEAD_C9XX_CSR_MXSTATUS);
+		break;
+
+	default:
+		ret = SBI_ENOTSUPP;
+		break;
+	}
+
+	return ret;
+}
-- 
2.44.0


