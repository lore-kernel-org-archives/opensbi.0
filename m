From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:41 -0700
Subject: [PATCH v2 12/15] lib: sbi: Implement SBI PMU extension
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-13-atish.patra@wdc.com>
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
 lib/sbi/sbi_ecall.c     |  9 +++++
 lib/sbi/sbi_ecall_pmu.c | 78 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
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
index e92a53930460..a87bb7ad1c8d 100644
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
@@ -164,6 +167,12 @@ int sbi_ecall_init(void)
 	ret = sbi_ecall_register_extension(&ecall_srst);
 	if (ret)
 		return ret;
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
index 000000000000..938bf31b907e
--- /dev/null
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -0,0 +1,78 @@
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
+	uint64_t temp;
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
+		ret = sbi_pmu_ctr_get_info(regs->a0, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
+#if __riscv_xlen == 32
+		temp = ((uint64_t)regs->a5 << 32) | regs->a4;
+#else
+		temp = regs->a4;
+#endif
+		ret = sbi_pmu_ctr_cfg_match(regs->a0, regs->a1, regs->a2,
+					    regs->a3, temp);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+
+		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ:
+		ret = sbi_pmu_ctr_read(regs->a0, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_START:
+
+#if __riscv_xlen == 32
+		temp = ((uint64_t)regs->a4 << 32) | regs->a3;
+#else
+		temp = regs->a3;
+#endif
+		ret = sbi_pmu_ctr_start(regs->a0, regs->a1, regs->a2, temp);
+		break;
+	case SBI_EXT_PMU_COUNTER_STOP:
+		ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
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


