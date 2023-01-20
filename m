From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 20 Jan 2023 11:05:10 +0800
Subject: [PATCH v4 4/6] lib: utils: atcsmu: Add Andes System Management Unit support
In-Reply-To: <20230120030512.8778-1-peterlin@andestech.com>
References: <20230120030512.8778-1-peterlin@andestech.com>
Message-ID: <20230120030512.8778-5-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds atcsmu support for Andes AE350 platforms. The SMU
provides system management capabilities, including clock, reset
and power control based on power domain partitions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi_utils/sys/atcsmu.h | 59 ++++++++++++++++++++++
 lib/utils/sys/Kconfig          |  4 ++
 lib/utils/sys/atcsmu.c         | 92 ++++++++++++++++++++++++++++++++++
 lib/utils/sys/objects.mk       |  1 +
 platform/generic/Kconfig       |  1 +
 5 files changed, 157 insertions(+)
 create mode 100644 include/sbi_utils/sys/atcsmu.h
 create mode 100644 lib/utils/sys/atcsmu.c

diff --git a/include/sbi_utils/sys/atcsmu.h b/include/sbi_utils/sys/atcsmu.h
new file mode 100644
index 00000000..07be22ee
--- /dev/null
+++ b/include/sbi_utils/sys/atcsmu.h
@@ -0,0 +1,59 @@
+/*
+ * SPDX-License-Identifier: BSD-3-Clause
+ *
+ * Copyright (c) 2023 Andes Technology Corporation
+ */
+
+#ifndef _SYS_ATCSMU_H
+#define _SYS_ATCSMU_H
+
+#include <sbi/sbi_types.h>
+
+/* clang-format off */
+
+#define PCS0_WE_OFFSET		0x90
+#define PCSm_WE_OFFSET(i)	((i + 3) * 0x20 + PCS0_WE_OFFSET)
+
+#define PCS0_CTL_OFFSET		0x94
+#define PCSm_CTL_OFFSET(i)	((i + 3) * 0x20 + PCS0_CTL_OFFSET)
+#define PCS_CTL_CMD_SHIFT	0
+#define PCS_CTL_PARAM_SHIFT	3
+#define SLEEP_CMD		0x3
+#define WAKEUP_CMD		(0x0 | (1 << PCS_CTL_PARAM_SHIFT))
+#define LIGHTSLEEP_MODE		0
+#define DEEPSLEEP_MODE		1
+#define LIGHT_SLEEP_CMD		(SLEEP_CMD | (LIGHTSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
+#define DEEP_SLEEP_CMD		(SLEEP_CMD | (DEEPSLEEP_MODE << PCS_CTL_PARAM_SHIFT))
+
+#define PCS0_CFG_OFFSET			0x80
+#define PCSm_CFG_OFFSET(i)		((i + 3) * 0x20 + PCS0_CFG_OFFSET)
+#define PCS_CFG_LIGHT_SLEEP_SHIFT	2
+#define PCS_CFG_LIGHT_SLEEP		(1 << PCS_CFG_LIGHT_SLEEP_SHIFT)
+#define PCS_CFG_DEEP_SLEEP_SHIFT	3
+#define PCS_CFG_DEEP_SLEEP		(1 << PCS_CFG_DEEP_SLEEP_SHIFT)
+
+#define RESET_VEC_LO_OFFSET	0x50
+#define RESET_VEC_HI_OFFSET	0x60
+#define RESET_VEC_8CORE_OFFSET	0x1a0
+#define HARTn_RESET_VEC_LO(n)	(RESET_VEC_LO_OFFSET + \
+			        ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
+			        ((n) * 0x4))
+#define HARTn_RESET_VEC_HI(n)	(RESET_VEC_HI_OFFSET + \
+			        ((n) < 4 ? 0 : RESET_VEC_8CORE_OFFSET) + \
+			        ((n) * 0x4))
+
+#define PCS_MAX_NR  8
+#define FLASH_BASE  0x80000000ULL
+
+/* clang-format on */
+
+struct smu_data {
+	unsigned long addr;
+};
+
+int smu_set_wakeup_events(struct smu_data *smu, u32 events, u32 hartid);
+bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode, u32 hartid);
+int smu_set_command(struct smu_data *smu, u32 pcs_ctl, u32 hartid);
+int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr, u32 hartid);
+
+#endif /* _SYS_ATCSMU_H */
diff --git a/lib/utils/sys/Kconfig b/lib/utils/sys/Kconfig
index ee85b1a3..76190f8c 100644
--- a/lib/utils/sys/Kconfig
+++ b/lib/utils/sys/Kconfig
@@ -2,6 +2,10 @@
 
 menu "System Device Support"
 
+config SYS_ATCSMU
+	bool "Andes System Management Unit (SMU) support"
+	default n
+
 config SYS_HTIF
 	bool "Host transfere interface (HTIF) support"
 	default n
diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
new file mode 100644
index 00000000..8ddd88d5
--- /dev/null
+++ b/lib/utils/sys/atcsmu.c
@@ -0,0 +1,92 @@
+/*
+ * SPDX-License-Identifier: BSD-3-Clause
+ *
+ * Copyright (c) 2023 Andes Technology Corporation
+ *
+ * Authors:
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <sbi_utils/sys/atcsmu.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_bitops.h>
+
+inline int smu_set_wakeup_events(struct smu_data *smu, u32 events, u32 hartid)
+{
+	if (smu) {
+		writel(events, (void *)(smu->addr + PCSm_WE_OFFSET(hartid)));
+		return 0;
+	} else
+		return SBI_EINVAL;
+}
+
+inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
+				   u32 hartid)
+{
+	u32 pcs_cfg;
+
+	if (!smu) {
+		sbi_printf("%s(): Failed to access smu_data\n", __func__);
+		return false;
+	}
+
+	pcs_cfg = readl((void *)(smu->addr + PCSm_CFG_OFFSET(hartid)));
+
+	switch (sleep_mode) {
+	case LIGHTSLEEP_MODE:
+		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_LIGHT_SLEEP) == 0) {
+			sbi_printf(
+				"SMU: hart%d (PCS%d) does not support light sleep mode\n",
+				hartid, hartid + 3);
+			return false;
+		}
+		break;
+	case DEEPSLEEP_MODE:
+		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_DEEP_SLEEP) == 0) {
+			sbi_printf(
+				"SMU: hart%d (PCS%d) does not support deep sleep mode\n",
+				hartid, hartid + 3);
+			return false;
+		}
+		break;
+	}
+
+	return true;
+}
+
+inline int smu_set_command(struct smu_data *smu, u32 pcs_ctl, u32 hartid)
+{
+	if (smu) {
+		writel(pcs_ctl, (void *)(smu->addr + PCSm_CTL_OFFSET(hartid)));
+		return 0;
+	} else
+		return SBI_EINVAL;
+}
+
+inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
+				u32 hartid)
+{
+	u32 vec_lo, vec_hi;
+	u64 reset_vector;
+
+	if (!smu)
+		return SBI_EINVAL;
+
+	writel(wakeup_addr, (void *)(smu->addr + HARTn_RESET_VEC_LO(hartid)));
+	writel((u64)wakeup_addr >> 32,
+	       (void *)(smu->addr + HARTn_RESET_VEC_HI(hartid)));
+
+	vec_lo = readl((void *)(smu->addr + HARTn_RESET_VEC_LO(hartid)));
+	vec_hi = readl((void *)(smu->addr + HARTn_RESET_VEC_HI(hartid)));
+	reset_vector = ((u64)vec_hi << 32) | vec_lo;
+
+	if (reset_vector != (u64)wakeup_addr) {
+		sbi_printf(
+			"hard%d (PCS%d): Failed to program the reset vector.\n",
+			hartid, hartid + 3);
+		return SBI_EFAIL;
+	} else
+		return 0;
+}
diff --git a/lib/utils/sys/objects.mk b/lib/utils/sys/objects.mk
index 9f67aee2..03d6740b 100644
--- a/lib/utils/sys/objects.mk
+++ b/lib/utils/sys/objects.mk
@@ -9,3 +9,4 @@
 
 libsbiutils-objs-$(CONFIG_SYS_HTIF) += sys/htif.o
 libsbiutils-objs-$(CONFIG_SYS_SIFIVE_TEST) += sys/sifive_test.o
+libsbiutils-objs-$(CONFIG_SYS_ATCSMU) += sys/atcsmu.o
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 47c10e53..c7f198ae 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -30,6 +30,7 @@ config PLATFORM_ALLWINNER_D1
 
 config PLATFORM_ANDES_AE350
 	bool "Andes AE350 support"
+	select SYS_ATCSMU
 	default n
 
 config PLATFORM_RENESAS_RZFIVE
-- 
2.34.1


