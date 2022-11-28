From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 28 Nov 2022 16:30:43 +0800
Subject: [PATCH 1/4] platform: generic/andes: Enable generic platform support for AE350
In-Reply-To: <20221128083046.6799-1-peterlin@andestech.com>
References: <20221128083046.6799-1-peterlin@andestech.com>
Message-ID: <20221128083046.6799-2-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We move andes directory to platform/generic since the necessary fdt
drivers are available, the users can enable the console, timer, ipi,
irqchip and reset devices by adding device tree nodes stated in the
docs/platform/andes-ae350.md.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Although generic/platform.c has been able to boot the system
on AE350, we will add HSM device for it soon so let's keep
ae350.c as a placeholder.
---
 platform/andes/ae350/Kconfig           |  34 -----
 platform/andes/ae350/cache.c           |  89 -------------
 platform/andes/ae350/cache.h           |  17 ---
 platform/andes/ae350/configs/defconfig |   0
 platform/andes/ae350/objects.mk        |  40 ------
 platform/andes/ae350/platform.c        | 169 -------------------------
 platform/andes/ae350/platform.h        | 109 ----------------
 platform/generic/Kconfig               |   4 +
 platform/generic/andes/ae350.c         |  21 +++
 platform/generic/andes/objects.mk      |   6 +
 platform/generic/configs/defconfig     |   4 +
 11 files changed, 35 insertions(+), 458 deletions(-)
 delete mode 100644 platform/andes/ae350/Kconfig
 delete mode 100644 platform/andes/ae350/cache.c
 delete mode 100644 platform/andes/ae350/cache.h
 delete mode 100644 platform/andes/ae350/configs/defconfig
 delete mode 100644 platform/andes/ae350/objects.mk
 delete mode 100644 platform/andes/ae350/platform.c
 delete mode 100644 platform/andes/ae350/platform.h
 create mode 100644 platform/generic/andes/ae350.c
 create mode 100644 platform/generic/andes/objects.mk

diff --git a/platform/andes/ae350/Kconfig b/platform/andes/ae350/Kconfig
deleted file mode 100644
index 38e4001..0000000
--- a/platform/andes/ae350/Kconfig
+++ /dev/null
@@ -1,34 +0,0 @@
-# SPDX-License-Identifier: BSD-2-Clause
-
-config PLATFORM_ANDES_AE350
-	bool
-	select FDT
-	select FDT_SERIAL
-	select FDT_SERIAL_UART8250
-	select FDT_TIMER
-	select FDT_TIMER_PLMT
-	select FDT_RESET
-	select FDT_RESET_ATCWDT200
-	select FDT_IRQCHIP
-	select FDT_IRQCHIP_PLIC
-	select FDT_IPI
-	select FDT_IPI_PLICSW
-	default y
-
-if PLATFORM_ANDES_AE350
-
-config PLATFORM_ANDES_AE350_NAME
-	string "Platform default name"
-	default "Andes AE350"
-
-config PLATFORM_ANDES_AE350_MAJOR_VER
-	int "Platform major version"
-	range 0 65535
-	default 0
-
-config PLATFORM_ANDES_AE350_MINOR_VER
-	int "Platform minor version"
-	range 0 65535
-	default 1
-
-endif
diff --git a/platform/andes/ae350/cache.c b/platform/andes/ae350/cache.c
deleted file mode 100644
index af724c5..0000000
--- a/platform/andes/ae350/cache.c
+++ /dev/null
@@ -1,89 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Andes Technology Corporation
- *
- * Authors:
- *   Nylon Chen <nylon7@andestech.com>
- */
-
-#include <sbi/riscv_asm.h>
-#include <sbi/riscv_io.h>
-#include <sbi/sbi_types.h>
-#include "platform.h"
-
-uintptr_t mcall_set_mcache_ctl(unsigned long input)
-{
-	csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_MASK);
-	csr_write(CSR_MCACHECTL, input);
-	return 0;
-}
-
-uintptr_t mcall_set_mmisc_ctl(unsigned long input)
-{
-	csr_clear(CSR_MMISCCTL, V5_MMISC_CTL_MASK);
-	csr_write(CSR_MMISCCTL, input);
-	return 0;
-}
-
-uintptr_t mcall_icache_op(unsigned int enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MCACHE_CTL_IC_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_IC_EN);
-		asm volatile("fence.i\n\t");
-	}
-	return 0;
-}
-
-uintptr_t mcall_dcache_op(unsigned int enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MCACHE_CTL_DC_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_DC_EN);
-		csr_write(CSR_MCCTLCOMMAND, V5_UCCTL_L1D_WBINVAL_ALL);
-	}
-	return 0;
-}
-
-uintptr_t mcall_l1_cache_i_prefetch_op(unsigned long enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MCACHE_CTL_L1I_PREFETCH_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_L1I_PREFETCH_EN);
-	}
-	return 0;
-}
-
-uintptr_t mcall_l1_cache_d_prefetch_op(unsigned long enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MCACHE_CTL_L1D_PREFETCH_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_L1D_PREFETCH_EN);
-	}
-	return 0;
-}
-
-uintptr_t mcall_non_blocking_load_store(unsigned long enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MMISC_CTL_NON_BLOCKING_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MMISC_CTL_NON_BLOCKING_EN);
-	}
-	return 0;
-}
-
-uintptr_t mcall_write_around(unsigned long enable)
-{
-	if (enable) {
-		csr_set(CSR_MCACHECTL, V5_MCACHE_CTL_DC_WAROUND_1_EN);
-	} else {
-		csr_clear(CSR_MCACHECTL, V5_MCACHE_CTL_DC_WAROUND_1_EN);
-	}
-	return 0;
-}
diff --git a/platform/andes/ae350/cache.h b/platform/andes/ae350/cache.h
deleted file mode 100644
index e1c1826..0000000
--- a/platform/andes/ae350/cache.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2020 Andes Technology Corporation
- *
- * Authors:
- *   Nylon Chen <nylon7@andestech.com>
- */
-
-uintptr_t mcall_set_mcache_ctl(unsigned long input);
-uintptr_t mcall_set_mmisc_ctl(unsigned long input);
-uintptr_t mcall_icache_op(unsigned int enable);
-uintptr_t mcall_dcache_op(unsigned int enable);
-uintptr_t mcall_l1_cache_i_prefetch_op(unsigned long enable);
-uintptr_t mcall_l1_cache_d_prefetch_op(unsigned long enable);
-uintptr_t mcall_non_blocking_load_store(unsigned long enable);
-uintptr_t mcall_write_around(unsigned long enable);
diff --git a/platform/andes/ae350/configs/defconfig b/platform/andes/ae350/configs/defconfig
deleted file mode 100644
index e69de29..0000000
diff --git a/platform/andes/ae350/objects.mk b/platform/andes/ae350/objects.mk
deleted file mode 100644
index a4a2332..0000000
--- a/platform/andes/ae350/objects.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2019 Andes Technology Corporation
-#
-# Authors:
-#   Zong Li <zong@andestech.com>
-#   Nylon Chen <nylon7@andestech.com>
-#
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Objects to build
-platform-objs-y += cache.o platform.o
-
-# Blobs to build
-FW_TEXT_START=0x00000000
-
-FW_DYNAMIC=y
-
-FW_JUMP=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  FW_JUMP_ADDR=0x400000
-else
-  FW_JUMP_ADDR=0x200000
-endif
-FW_JUMP_FDT_ADDR=0x2000000
-
-FW_PAYLOAD=y
-ifeq ($(PLATFORM_RISCV_XLEN), 32)
-  FW_PAYLOAD_OFFSET=0x400000
-else
-  FW_PAYLOAD_OFFSET=0x200000
-endif
-
-FW_PAYLOAD_FDT_ADDR=0x2000000
diff --git a/platform/andes/ae350/platform.c b/platform/andes/ae350/platform.c
deleted file mode 100644
index d36d11e..0000000
--- a/platform/andes/ae350/platform.c
+++ /dev/null
@@ -1,169 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Andes Technology Corporation
- *
- * Authors:
- *   Zong Li <zong@andestech.com>
- *   Nylon Chen <nylon7@andestech.com>
- *   Yu Chien Peter Lin <peterlin@andestech.com>
- */
-
-#include <libfdt.h>
-#include <sbi/riscv_asm.h>
-#include <sbi/riscv_encoding.h>
-#include <sbi/sbi_console.h>
-#include <sbi/sbi_const.h>
-#include <sbi/sbi_hartmask.h>
-#include <sbi/sbi_ipi.h>
-#include <sbi/sbi_platform.h>
-#include <sbi/sbi_string.h>
-#include <sbi/sbi_trap.h>
-#include <sbi_utils/fdt/fdt_domain.h>
-#include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/ipi/fdt_ipi.h>
-#include <sbi_utils/irqchip/fdt_irqchip.h>
-#include <sbi_utils/reset/fdt_reset.h>
-#include <sbi_utils/serial/fdt_serial.h>
-#include <sbi_utils/timer/fdt_timer.h>
-#include "platform.h"
-#include "cache.h"
-
-struct sbi_platform platform;
-unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
-				unsigned long arg2, unsigned long arg3,
-				unsigned long arg4)
-{
-	const char *model;
-	void *fdt = (void *)arg1;
-	u32 hartid, hart_count = 0;
-	int rc, root_offset, cpus_offset, cpu_offset, len;
-
-	root_offset = fdt_path_offset(fdt, "/");
-	if (root_offset < 0)
-		goto fail;
-
-	model = fdt_getprop(fdt, root_offset, "model", &len);
-	if (model)
-		sbi_strncpy(platform.name, model, sizeof(platform.name) - 1);
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		goto fail;
-
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
-			continue;
-
-		hart_count++;
-	}
-
-	platform.hart_count = hart_count;
-
-	/* Return original FDT pointer */
-	return arg1;
-
-fail:
-	while (1)
-		wfi();
-}
-
-/* Platform final initialization. */
-static int ae350_final_init(bool cold_boot)
-{
-	void *fdt;
-
-	if (!cold_boot)
-		return 0;
-
-	fdt_reset_init();
-
-	fdt = fdt_get_address();
-	fdt_fixups(fdt);
-	fdt_domain_fixup(fdt);
-
-	return 0;
-}
-
-/* Vendor-Specific SBI handler */
-static int ae350_vendor_ext_provider(long extid, long funcid,
-	const struct sbi_trap_regs *regs, unsigned long *out_value,
-	struct sbi_trap_info *out_trap)
-{
-	int ret = 0;
-	switch (funcid) {
-	case SBI_EXT_ANDES_GET_MCACHE_CTL_STATUS:
-		*out_value = csr_read(CSR_MCACHECTL);
-		break;
-	case SBI_EXT_ANDES_GET_MMISC_CTL_STATUS:
-		*out_value = csr_read(CSR_MMISCCTL);
-		break;
-	case SBI_EXT_ANDES_SET_MCACHE_CTL:
-		ret = mcall_set_mcache_ctl(regs->a0);
-		break;
-	case SBI_EXT_ANDES_SET_MMISC_CTL:
-		ret = mcall_set_mmisc_ctl(regs->a0);
-		break;
-	case SBI_EXT_ANDES_ICACHE_OP:
-		ret = mcall_icache_op(regs->a0);
-		break;
-	case SBI_EXT_ANDES_DCACHE_OP:
-		ret = mcall_dcache_op(regs->a0);
-		break;
-	case SBI_EXT_ANDES_L1CACHE_I_PREFETCH:
-		ret = mcall_l1_cache_i_prefetch_op(regs->a0);
-		break;
-	case SBI_EXT_ANDES_L1CACHE_D_PREFETCH:
-		ret = mcall_l1_cache_d_prefetch_op(regs->a0);
-		break;
-	case SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE:
-		ret = mcall_non_blocking_load_store(regs->a0);
-		break;
-	case SBI_EXT_ANDES_WRITE_AROUND:
-		ret = mcall_write_around(regs->a0);
-		break;
-	default:
-		sbi_printf("Unsupported vendor sbi call : %ld\n", funcid);
-		asm volatile("ebreak");
-	}
-	return ret;
-}
-
-static int ae350_domains_init(void)
-{
-	return fdt_domains_populate(fdt_get_address());
-}
-
-/* Platform descriptor. */
-const struct sbi_platform_operations platform_ops = {
-	.final_init = ae350_final_init,
-
-	.domains_init = ae350_domains_init,
-
-	.console_init = fdt_serial_init,
-
-	.irqchip_init = fdt_irqchip_init,
-
-	.ipi_init     = fdt_ipi_init,
-
-	.timer_init	   = fdt_timer_init,
-
-	.vendor_ext_provider = ae350_vendor_ext_provider
-};
-
-struct sbi_platform platform = {
-	.opensbi_version = OPENSBI_VERSION,
-	.platform_version =
-		SBI_PLATFORM_VERSION(CONFIG_PLATFORM_ANDES_AE350_MAJOR_VER,
-				     CONFIG_PLATFORM_ANDES_AE350_MINOR_VER),
-	.name = CONFIG_PLATFORM_ANDES_AE350_NAME,
-	.features = SBI_PLATFORM_DEFAULT_FEATURES,
-	.hart_count = SBI_HARTMASK_MAX_BITS,
-	.hart_stack_size = SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
-	.platform_ops_addr = (unsigned long)&platform_ops
-};
diff --git a/platform/andes/ae350/platform.h b/platform/andes/ae350/platform.h
deleted file mode 100644
index 903bef0..0000000
--- a/platform/andes/ae350/platform.h
+++ /dev/null
@@ -1,109 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Andes Technology Corporation
- *
- * Authors:
- *   Zong Li <zong@andestech.com>
- *   Nylon Chen <nylon7@andestech.com>
- */
-
-#ifndef _AE350_PLATFORM_H_
-#define _AE350_PLATFORM_H_
-
-#define AE350_L2C_ADDR			0xe0500000
-
-/*Memory and Miscellaneous Registers*/
-#define CSR_MILMB		0x7c0
-#define CSR_MDLMB		0x7c1
-#define CSR_MECC_CDOE		0x7c2
-#define CSR_MNVEC		0x7c3
-#define CSR_MPFTCTL		0x7c5
-#define CSR_MCACHECTL		0x7ca
-#define CSR_MCCTLBEGINADDR	0x7cb
-#define CSR_MCCTLCOMMAND	0x7cc
-#define CSR_MCCTLDATA		0x7cc
-#define CSR_SCCTLDATA		0x9cd
-#define CSR_UCCTLBEGINADDR	0x80c
-#define CSR_MMISCCTL		0x7d0
-
-enum sbi_ext_andes_fid {
-	SBI_EXT_ANDES_GET_MCACHE_CTL_STATUS = 0,
-	SBI_EXT_ANDES_GET_MMISC_CTL_STATUS,
-	SBI_EXT_ANDES_SET_MCACHE_CTL,
-	SBI_EXT_ANDES_SET_MMISC_CTL,
-	SBI_EXT_ANDES_ICACHE_OP,
-	SBI_EXT_ANDES_DCACHE_OP,
-	SBI_EXT_ANDES_L1CACHE_I_PREFETCH,
-	SBI_EXT_ANDES_L1CACHE_D_PREFETCH,
-	SBI_EXT_ANDES_NON_BLOCKING_LOAD_STORE,
-	SBI_EXT_ANDES_WRITE_AROUND,
-};
-
-/* nds v5 mmisc_ctl register*/
-#define V5_MMISC_CTL_VEC_PLIC_OFFSET            1
-#define V5_MMISC_CTL_RVCOMPM_OFFSET             2
-#define V5_MMISC_CTL_BRPE_OFFSET                3
-#define V5_MMISC_CTL_MSA_OR_UNA_OFFSET          6
-#define V5_MMISC_CTL_NON_BLOCKING_OFFSET        8
-#define V5_MCACHE_CTL_L1I_PREFETCH_OFFSET       9
-#define V5_MCACHE_CTL_L1D_PREFETCH_OFFSET       10
-#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_1       13
-#define V5_MCACHE_CTL_DC_WAROUND_OFFSET_2       14
-
-#define V5_MMISC_CTL_VEC_PLIC_EN        (1UL << V5_MMISC_CTL_VEC_PLIC_OFFSET)
-#define V5_MMISC_CTL_RVCOMPM_EN         (1UL << V5_MMISC_CTL_RVCOMPM_OFFSET)
-#define V5_MMISC_CTL_BRPE_EN            (1UL << V5_MMISC_CTL_BRPE_OFFSET)
-#define V5_MMISC_CTL_MSA_OR_UNA_EN      (1UL << V5_MMISC_CTL_MSA_OR_UNA_OFFSET)
-#define V5_MMISC_CTL_NON_BLOCKING_EN    (1UL << V5_MMISC_CTL_NON_BLOCKING_OFFSET)
-#define V5_MCACHE_CTL_L1I_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1I_PREFETCH_OFFSET)
-#define V5_MCACHE_CTL_L1D_PREFETCH_EN   (1UL << V5_MCACHE_CTL_L1D_PREFETCH_OFFSET)
-#define V5_MCACHE_CTL_DC_WAROUND_1_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_1)
-#define V5_MCACHE_CTL_DC_WAROUND_2_EN   (1UL << V5_MCACHE_CTL_DC_WAROUND_OFFSET_2)
-
-#define V5_MMISC_CTL_MASK  (V5_MMISC_CTL_VEC_PLIC_EN | V5_MMISC_CTL_RVCOMPM_EN \
-	| V5_MMISC_CTL_BRPE_EN | V5_MMISC_CTL_MSA_OR_UNA_EN | V5_MMISC_CTL_NON_BLOCKING_EN)
-
-/* nds mcache_ctl register*/
-#define V5_MCACHE_CTL_IC_EN_OFFSET      0
-#define V5_MCACHE_CTL_DC_EN_OFFSET      1
-#define V5_MCACHE_CTL_IC_ECCEN_OFFSET   2
-#define V5_MCACHE_CTL_DC_ECCEN_OFFSET   4
-#define V5_MCACHE_CTL_IC_RWECC_OFFSET   6
-#define V5_MCACHE_CTL_DC_RWECC_OFFSET   7
-#define V5_MCACHE_CTL_CCTL_SUEN_OFFSET  8
-
-/*nds cctl command*/
-#define V5_UCCTL_L1D_WBINVAL_ALL 6
-#define V5_UCCTL_L1D_WB_ALL 7
-
-#define V5_MCACHE_CTL_IC_EN     (1UL << V5_MCACHE_CTL_IC_EN_OFFSET)
-#define V5_MCACHE_CTL_DC_EN     (1UL << V5_MCACHE_CTL_DC_EN_OFFSET)
-#define V5_MCACHE_CTL_IC_RWECC  (1UL << V5_MCACHE_CTL_IC_RWECC_OFFSET)
-#define V5_MCACHE_CTL_DC_RWECC  (1UL << V5_MCACHE_CTL_DC_RWECC_OFFSET)
-#define V5_MCACHE_CTL_CCTL_SUEN (1UL << V5_MCACHE_CTL_CCTL_SUEN_OFFSET)
-
-#define V5_MCACHE_CTL_MASK (V5_MCACHE_CTL_IC_EN | V5_MCACHE_CTL_DC_EN \
-	| V5_MCACHE_CTL_IC_RWECC | V5_MCACHE_CTL_DC_RWECC \
-	| V5_MCACHE_CTL_CCTL_SUEN | V5_MCACHE_CTL_L1I_PREFETCH_EN \
-	| V5_MCACHE_CTL_L1D_PREFETCH_EN | V5_MCACHE_CTL_DC_WAROUND_1_EN \
-	| V5_MCACHE_CTL_DC_WAROUND_2_EN)
-
-#define V5_L2C_CTL_OFFSET           0x8
-#define V5_L2C_CTL_ENABLE_OFFSET    0
-#define V5_L2C_CTL_IPFDPT_OFFSET    3
-#define V5_L2C_CTL_DPFDPT_OFFSET    5
-#define V5_L2C_CTL_TRAMOCTL_OFFSET  8
-#define V5_L2C_CTL_TRAMICTL_OFFSET  10
-#define V5_L2C_CTL_DRAMOCTL_OFFSET  11
-#define V5_L2C_CTL_DRAMICTL_OFFSET  13
-
-#define V5_L2C_CTL_ENABLE_MASK      (1UL << V5_L2C_CTL_ENABLE_OFFSET)
-#define V5_L2C_CTL_IPFDPT_MASK      (3UL << V5_L2C_CTL_IPFDPT_OFFSET)
-#define V5_L2C_CTL_DPFDPT_MASK      (3UL << V5_L2C_CTL_DPFDPT_OFFSET)
-#define V5_L2C_CTL_TRAMOCTL_MASK    (3UL << V5_L2C_CTL_TRAMOCTL_OFFSET)
-#define V5_L2C_CTL_TRAMICTL_MASK    (1UL << V5_L2C_CTL_TRAMICTL_OFFSET)
-#define V5_L2C_CTL_DRAMOCTL_MASK    (3UL << V5_L2C_CTL_DRAMOCTL_OFFSET)
-#define V5_L2C_CTL_DRAMICTL_MASK    (1UL << V5_L2C_CTL_DRAMICTL_OFFSET)
-
-#endif /* _AE350_PLATFORM_H_ */
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 63d1be4..4b5d2cd 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -28,6 +28,10 @@ config PLATFORM_ALLWINNER_D1
 	depends on FDT_IRQCHIP_PLIC
 	default n
 
+config PLATFORM_ANDES_AE350
+	bool "Andes AE350 support"
+	default n
+
 config PLATFORM_SIFIVE_FU540
 	bool "SiFive FU540 support"
 	default n
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
new file mode 100644
index 0000000..cf7f6f2
--- /dev/null
+++ b/platform/generic/andes/ae350.c
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Andes Technology Corporation
+ *
+ * Authors:
+ *   Yu Chien Peter Lin <peterlin@andestech.com>
+ */
+
+#include <platform_override.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/fdt/fdt_fixup.h>
+
+static const struct fdt_match andes_ae350_match[] = {
+	{ .compatible = "andestech,ae350" },
+	{ },
+};
+
+const struct platform_override andes_ae350 = {
+	.match_table = andes_ae350_match,
+};
diff --git a/platform/generic/andes/objects.mk b/platform/generic/andes/objects.mk
new file mode 100644
index 0000000..dd6408d
--- /dev/null
+++ b/platform/generic/andes/objects.mk
@@ -0,0 +1,6 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_ANDES_AE350) += andes_ae350
+platform-objs-$(CONFIG_PLATFORM_ANDES_AE350) += andes/ae350.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index c95b7fa..2eaeeb7 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,4 +1,5 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
+CONFIG_PLATFORM_ANDES_AE350=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_FDT_GPIO=y
@@ -7,11 +8,13 @@ CONFIG_FDT_I2C=y
 CONFIG_FDT_I2C_SIFIVE=y
 CONFIG_FDT_IPI=y
 CONFIG_FDT_IPI_MSWI=y
+CONFIG_FDT_IPI_PLICSW=y
 CONFIG_FDT_IRQCHIP=y
 CONFIG_FDT_IRQCHIP_APLIC=y
 CONFIG_FDT_IRQCHIP_IMSIC=y
 CONFIG_FDT_IRQCHIP_PLIC=y
 CONFIG_FDT_RESET=y
+CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_SIFIVE_TEST=y
@@ -28,4 +31,5 @@ CONFIG_FDT_SERIAL_UART8250=y
 CONFIG_FDT_SERIAL_XILINX_UARTLITE=y
 CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
+CONFIG_FDT_TIMER_PLMT=y
 CONFIG_SERIAL_SEMIHOSTING=y
-- 
2.34.1


