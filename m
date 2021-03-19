From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:13:03 -0700
Subject: [RFC 12/14] lib: sbi: Implement SBI PMU extension
In-Reply-To: <20210319221305.2138412-1-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
Message-ID: <20210319221305.2138412-13-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V SBI specfication 0.3 defines a PMU extension that allows supervisor
mode to start/stop/configure pmu related events. This patch implements
all of the functionality defined in the specification.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_ecall.h |  1 +
 lib/sbi/objects.mk      |  1 +
 lib/sbi/sbi_ecall.c     | 10 ++++++
 lib/sbi/sbi_ecall_pmu.c | 73 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_pmu.c

diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
index 63ef866ba2d4..9500d0430429 100644
--- a/include/sbi/sbi_ecall.h
+++ b/include/sbi/sbi_ecall.h
@@ -39,6 +39,7 @@ extern struct sbi_ecall_extension ecall_ipi;
 extern struct sbi_ecall_extension ecall_vendor;
 extern struct sbi_ecall_extension ecall_hsm;
 extern struct sbi_ecall_extension ecall_srst;
+extern struct sbi_ecall_extension ecall_pmu;
 
 u16 sbi_ecall_version_major(void);
 
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index d9068b707854..7096f245ae0c 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -20,6 +20,7 @@ libsbi-objs-y += sbi_ecall.o
 libsbi-objs-y += sbi_ecall_base.o
 libsbi-objs-y += sbi_ecall_hsm.o
 libsbi-objs-y += sbi_ecall_legacy.o
+libsbi-objs-y += sbi_ecall_pmu.o
 libsbi-objs-y += sbi_ecall_replace.o
 libsbi-objs-y += sbi_ecall_vendor.o
 libsbi-objs-y += sbi_emulate_csr.o
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index e92a53930460..bd51c7f796b8 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -11,6 +11,8 @@
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap.h>
 
 u16 sbi_ecall_version_major(void)
@@ -144,6 +146,7 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 int sbi_ecall_init(void)
 {
 	int ret;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* The order of below registrations is performance optimized */
 	ret = sbi_ecall_register_extension(&ecall_time);
@@ -164,6 +167,13 @@ int sbi_ecall_init(void)
 	ret = sbi_ecall_register_extension(&ecall_srst);
 	if (ret)
 		return ret;
+
+	/* SBI PMU extension is useless without mcount inhibit features */
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT)) {
+		ret = sbi_ecall_register_extension(&ecall_pmu);
+		if (ret)
+			return ret;
+	}
 	ret = sbi_ecall_register_extension(&ecall_legacy);
 	if (ret)
 		return ret;
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
new file mode 100644
index 000000000000..6a473f733e64
--- /dev/null
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -0,0 +1,73 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Atish Patra <atish.patra@wdc.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_version.h>
+#include <sbi/sbi_pmu.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/riscv_asm.h>
+
+static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
+				 const struct sbi_trap_regs *regs,
+				 unsigned long *out_val,
+				 struct sbi_trap_info *out_trap)
+{
+	int ret = 0;
+	uint64_t ival;
+
+	switch (funcid) {
+	case SBI_EXT_PMU_NUM_COUNTERS:
+		ret = sbi_pmu_num_ctr();
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+		break;
+	case SBI_EXT_PMU_COUNTER_GET_INFO:
+		ret = sbi_pmu_get_ctr_info(regs->a0, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
+		ret = sbi_pmu_get_ctr_match(regs->a0, regs->a1, regs->a2,
+					    regs->a3, regs->a4);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+
+		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ:
+		ret = sbi_pmu_read_ctr(regs->a0, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_START:
+
+#if __riscv_xlen == 32
+		ival = ((uint64_t)regs->a1 << 32) | regs->a2;
+#else
+		ival = regs->a1;
+#endif
+		ret = sbi_pmu_start_ctr(regs->a0, ival);
+		break;
+	case SBI_EXT_PMU_COUNTER_STOP:
+		ret = sbi_pmu_stop_ctr(regs->a0, regs->a1);
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+	};
+
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_pmu = {
+	.extid_start = SBI_EXT_PMU,
+	.extid_end = SBI_EXT_PMU,
+	.handle = sbi_ecall_pmu_handler,
+};
-- 
2.25.1


