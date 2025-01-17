From: Chao-ying Fu <icebergfu@gmail.com>
Date: Fri, 17 Jan 2025 14:34:59 -0800
Subject: [PATCH] platform: generic: mips: add P8700
Message-ID: <20250117223459.17604-1-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MIPS P8700 needs extra scratch space to use in MIPS custom exception
handler. MIPS P8700 needs to set up PMA for cacheability, when the
corresponding PMP entry is changed. All harts are redirected to run
from a common entry to set up necessary CSRs for all clusters, cores,
and harts.
---
 firmware/fw_base.S                          |   5 +
 include/sbi/sbi_scratch.h                   |  12 +
 lib/sbi/riscv_asm.c                         |  36 +
 platform/generic/Kconfig                    |   4 +
 platform/generic/configs/defconfig          |   1 +
 platform/generic/include/mips/board.h       |  33 +
 platform/generic/include/mips/mips-cm.h     |  88 ++
 platform/generic/include/mips/p8700.h       | 122 +++
 platform/generic/include/mips/stw.h         | 191 ++++
 platform/generic/mips/cps-vec.S             | 202 ++++
 platform/generic/mips/mips,boston-p8700.dts | 353 +++++++
 platform/generic/mips/objects.mk            |   7 +
 platform/generic/mips/p8700.c               | 202 ++++
 platform/generic/mips/stw.S                 | 986 ++++++++++++++++++++
 14 files changed, 2242 insertions(+)
 create mode 100644 platform/generic/include/mips/board.h
 create mode 100644 platform/generic/include/mips/mips-cm.h
 create mode 100644 platform/generic/include/mips/p8700.h
 create mode 100644 platform/generic/include/mips/stw.h
 create mode 100644 platform/generic/mips/cps-vec.S
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts
 create mode 100644 platform/generic/mips/objects.mk
 create mode 100644 platform/generic/mips/p8700.c
 create mode 100644 platform/generic/mips/stw.S

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index d027e5e..5c804e3 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -45,6 +45,11 @@
 	.align 3
 	.globl _start
 	.globl _start_warm
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	lla	t0, mips_cps_core_entry
+	jr	t0
+#endif
+
 _start:
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 0d188d1..ff8b75e 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -44,8 +44,16 @@
 #define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
 #define SBI_SCRATCH_HARTINDEX_OFFSET		(14 * __SIZEOF_POINTER__)
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+#define MIPS_P8700_STW_SIZE			34
+/** Offset of stw_tmp in sbi_scratch */
+#define SBI_SCRATCH_STW_TMP_OFFSET		(15 * __SIZEOF_POINTER__)
+/** Offset of extra space in sbi_scratch */
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		((15 + MIPS_P8700_STW_SIZE) * __SIZEOF_POINTER__)
+#else
 /** Offset of extra space in sbi_scratch */
 #define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(15 * __SIZEOF_POINTER__)
+#endif
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -87,6 +95,10 @@ struct sbi_scratch {
 	unsigned long options;
 	/** Index of the hart */
 	unsigned long hartindex;
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	/** for stw */
+	unsigned long stw_tmp[MIPS_P8700_STW_SIZE];
+#endif
 };
 
 /**
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..ca7edbe 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+#include <mips/p8700.h>
+#endif
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -119,6 +122,9 @@ unsigned long csr_read_num(int csr_num)
 	unsigned long ret = 0;
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
+#endif
 	switchcase_csr_read_16(CSR_PMPCFG0, ret)
 	switchcase_csr_read_64(CSR_PMPADDR0, ret)
 	switchcase_csr_read(CSR_MCYCLE, ret)
@@ -199,6 +205,9 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_32(__csr_num + 32, __val)
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
+#endif
 	switchcase_csr_write_16(CSR_PMPCFG0, val)
 	switchcase_csr_write_64(CSR_PMPADDR0, val)
 	switchcase_csr_write(CSR_MCYCLE, val)
@@ -301,6 +310,29 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+extern unsigned long _fw_start;
+static void pma_set(unsigned int n, unsigned long addr)
+{
+	int pmacfg_csr, pmacfg_shift;
+	unsigned long cfgmask;
+	unsigned long pmacfg, cca;
+
+	pmacfg_csr = (CSR_MIPSPMACFG0 + (n >> 2)) & ~1;
+	pmacfg_shift = (n & 7) << 3;
+	cfgmask = ~(0xffUL << pmacfg_shift);
+
+	/* Read pmacfg to change cacheability */
+        pmacfg  = (csr_read_num(pmacfg_csr) & cfgmask);
+        if (addr >= (unsigned long)&_fw_start)
+                cca = CCA_CACHE_ENABLE | PMA_SPECULATION;
+        else
+                cca = CCA_CACHE_DISABLE;
+        pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+        csr_write_num(pmacfg_csr, pmacfg);
+}
+#endif
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
@@ -312,6 +344,10 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	pma_set(n, addr);
+#endif
+
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 688da3f..a24d6ab 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -68,6 +68,10 @@ config PLATFORM_THEAD
 	select THEAD_C9XX_PMU
 	default n
 
+config PLATFORM_MIPS_P8700
+	bool "MIPS P8700 support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index e23b38b..45fad6e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -6,6 +6,7 @@ CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
+CONFIG_PLATFORM_MIPS_P8700=n
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
diff --git a/platform/generic/include/mips/board.h b/platform/generic/include/mips/board.h
new file mode 100644
index 0000000..6fe7b8b
--- /dev/null
+++ b/platform/generic/include/mips/board.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __BOARD_H__
+#define __BOARD_H__
+
+/* Please review all defines to change for your board. */
+
+/* Use in stw.S, p8700.c, p8700.h, mips-cm.h */
+#define CM_BASE			0x16100000
+
+/* Use in mips-cm.h, p8700.c */
+#define CLUSTERS_IN_PLATFORM	1
+#if CLUSTERS_IN_PLATFORM > 1
+/* Define global CM bases for cluster 0, 1, 2, and more. */
+#define GLOBAL_CM_BASE0		0
+#define GLOBAL_CM_BASE1		0
+#define GLOBAL_CM_BASE2		0
+#endif
+
+/* Use in stw.S */
+#define TIMER_ADDR		(CM_BASE + 0x8050)
+
+/* Use in cps-vec.S */
+#define DRAM_ADDRESS		0x80000000
+#define DRAM_SIZE		0x80000000
+#define DRAM_PMP_ADDR		((DRAM_ADDRESS >> 2) | ((DRAM_SIZE - 1) >> 3))
+
+#endif
diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
new file mode 100644
index 0000000..19b4384
--- /dev/null
+++ b/platform/generic/include/mips/mips-cm.h
@@ -0,0 +1,88 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __MIPS_CM_H__
+#define __MIPS_CM_H__
+
+#include <mips/p8700.h>
+#include <sbi/sbi_console.h>
+
+/* Define 1 to print out CM read and write info */
+#define DEBUG_CM 0
+
+#if CLUSTERS_IN_PLATFORM > 1
+static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {GLOBAL_CM_BASE0, GLOBAL_CM_BASE1, GLOBAL_CM_BASE2};
+#else
+static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {CM_BASE};
+#endif
+
+#define CPS_ACCESSOR_R(unit, sz, base, off, name)			\
+static inline u##sz read_##unit##_##name(u32 hartid, bool local_p)	\
+{									\
+	u##sz value;							\
+	long cmd_reg;							\
+	int cl, co;							\
+	cl = cpu_cluster(hartid);					\
+	co = cpu_core(hartid);						\
+	cmd_reg = (local_p ? (base) : ((base) - CM_BASE + GLOBAL_CM_BASE[cl]))	\
+		  + (co << CM_BASE_CORE_SHIFT)				\
+		  + off;						\
+	if (DEBUG_CM)							\
+		sbi_printf("CM READ%d cmd_reg=%lx\n", sz, cmd_reg);	\
+	if (sz == 32)							\
+		asm volatile("lw %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
+	else if (sz == 64)						\
+		asm volatile("ld %0,0(%1)":"=r"(value):"r"(cmd_reg));	\
+	asm volatile("fence");						\
+	return value;							\
+}
+
+#define CPS_ACCESSOR_W(unit, sz, base, off, name)			\
+static inline void write_##unit##_##name(u32 hartid, u##sz value, bool local_p)	\
+{									\
+	long cmd_reg;							\
+	int cl, co;							\
+	cl = cpu_cluster(hartid);					\
+	co = cpu_core(hartid);						\
+	cmd_reg = (local_p ? (base) : ((base) - CM_BASE +  GLOBAL_CM_BASE[cl]))	\
+		  + (co << CM_BASE_CORE_SHIFT)				\
+		  + off;						\
+	if (DEBUG_CM)							\
+		sbi_printf("CM WRITE%d cmd_reg=%lx value=%lx\n", sz, 	\
+			    cmd_reg, (u64)value);			\
+	if (sz == 32)							\
+		asm volatile("sw %0,0(%1)"::"r"(value),"r"(cmd_reg));	\
+	else if (sz == 64)						\
+		asm volatile("sd %0,0(%1)"::"r"(value),"r"(cmd_reg));	\
+	asm volatile("fence");						\
+}
+
+#define CPS_ACCESSOR_RW(unit, sz, base, off, name)			\
+	CPS_ACCESSOR_R(unit, sz, base, off, name)			\
+	CPS_ACCESSOR_W(unit, sz, base, off, name)
+
+#define CPC_CX_ACCESSOR_RW(sz, off, name)				\
+	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, CPC_OFF_LOCAL + (off), co_##name)
+
+#define GCR_CX_ACCESSOR_RW(sz, off, name)				\
+	CPS_ACCESSOR_RW(gcr, sz, CM_BASE, GCR_OFF_LOCAL + (off), co_##name)
+
+GCR_CX_ACCESSOR_RW(64, cpu_hart(hartid) << CM_BASE_HART_SHIFT, reset_base)
+GCR_CX_ACCESSOR_RW(32, GCR_CORE_COH_EN, coherence)
+
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_RUN, vp_run)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_STOP, vp_stop)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_CMD, cmd)
+CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
+
+#define CPC_ACCESSOR_RW(sz, off, name)					\
+	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, off, name)
+
+CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
+CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
+
+#endif
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
new file mode 100644
index 0000000..6aa71d9
--- /dev/null
+++ b/platform/generic/include/mips/p8700.h
@@ -0,0 +1,122 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#ifndef __P8700_H__
+#define __P8700_H__
+
+#include <mips/board.h>
+
+/* PMA */
+#define CSR_MIPSPMACFG0	0x7e0
+#define CSR_MIPSPMACFG1	0x7e1
+#define CSR_MIPSPMACFG2	0x7e2
+#define CSR_MIPSPMACFG3	0x7e3
+#define CSR_MIPSPMACFG4	0x7e4
+#define CSR_MIPSPMACFG5	0x7e5
+#define CSR_MIPSPMACFG6	0x7e6
+#define CSR_MIPSPMACFG7	0x7e7
+#define CSR_MIPSPMACFG8	0x7e8
+#define CSR_MIPSPMACFG9	0x7e9
+#define CSR_MIPSPMACFG10	0x7ea
+#define CSR_MIPSPMACFG11	0x7eb
+#define CSR_MIPSPMACFG12	0x7ec
+#define CSR_MIPSPMACFG13	0x7ed
+#define CSR_MIPSPMACFG14	0x7ee
+#define CSR_MIPSPMACFG15	0x7ef
+
+/* MIPS CCA */
+#define CCA_CACHE_ENABLE	0
+#define CCA_CACHE_DISABLE	2
+#define PMA_SPECULATION		(1 << 3)
+
+/* MIPS CSR */
+#define CSR_MIPSTVEC		0x7c0
+#define CSR_MIPSCONFIG0		0x7d0
+#define CSR_MIPSCONFIG1		0x7d1
+#define CSR_MIPSCONFIG2		0x7d2
+#define CSR_MIPSCONFIG3		0x7d3
+#define CSR_MIPSCONFIG4		0x7d4
+#define CSR_MIPSCONFIG5		0x7d5
+#define CSR_MIPSCONFIG6		0x7d6
+#define CSR_MIPSCONFIG7		0x7d7
+#define CSR_MIPSCONFIG8		0x7d8
+#define CSR_MIPSCONFIG9		0x7d9
+#define CSR_MIPSCONFIG10	0x7da
+#define CSR_MIPSCONFIG11	0x7db
+
+#define MIPSCONFIG5_MTW		4
+
+#define GEN_MASK(h, l)	(((1ul << ((h) + 1 - (l))) - 1) << (l))
+#define EXT(val, mask)	(((val) & (mask)) >> (__builtin_ffs(mask) - 1))
+
+/*
+ * We allocate the number of bits to encode clusters, cores, and harts
+ * from the original mhartid to a new dense index.
+ */
+#define NUM_OF_BITS_FOR_CLUSTERS	4
+#define NUM_OF_BITS_FOR_CORES		12
+#define NUM_OF_BITS_FOR_HARTS		4
+
+/* mhartid field info */
+#define MHARTID_CORE_MASK	0xff
+#define MHARTID_CORE_SHIFT	4
+
+/* To get the field from new/hashed mhartid */
+#define NEW_CLUSTER_SHIFT	(NUM_OF_BITS_FOR_CORES + NUM_OF_BITS_FOR_HARTS)
+#define NEW_CLUSTER_MASK	((1 << NUM_OF_BITS_FOR_CLUSTERS) - 1)
+#define NEW_CORE_SHIFT		NUM_OF_BITS_FOR_HARTS
+#define NEW_CORE_MASK		((1 << NUM_OF_BITS_FOR_CORES) - 1)
+#define NEW_HART_MASK		((1 << NUM_OF_BITS_FOR_HARTS) - 1)
+#define cpu_cluster(i)		(((i) >> NEW_CLUSTER_SHIFT) & NEW_CLUSTER_MASK)
+#define cpu_core(i)		(((i) >> NEW_CORE_SHIFT) & NEW_CORE_MASK)
+#define cpu_hart(i)		((i) & NEW_HART_MASK)
+
+#define CPC_BASE		(CM_BASE + 0x8000)
+
+#define SIZE_FOR_CPC_MTIME	0x10000	/* The size must be 2^order */
+#define AIA_BASE		(CM_BASE + 0x40000)
+#define SIZE_FOR_AIA_M_MODE	0x20000	/* The size must be 2^order */
+#define P8700_ALIGN		0x10000
+
+#define CM_BASE_HART_SHIFT	3
+#define CM_BASE_CORE_SHIFT	8
+#define CM_BASE_CLUSTER_SHIFT	19
+
+/* GCR Block offsets */
+#define GCR_OFF_LOCAL		0x2000
+
+#define GCR_BASE_OFFSET		0x0008
+#define GCR_CORE_COH_EN		0x00f8
+#define GCR_CORE_COH_EN_EN	(0x1 << 0)
+
+#define L2_PFT_CONTROL_OFFSET	0x0300
+#define L2_PFT_CONTROL_B_OFFSET	0x0308
+
+/* CPC Block offsets */
+#define CPC_PWRUP_CTL		0x0030
+#define CPC_CM_STAT_CONF	0x1008
+
+#define CPC_OFF_LOCAL		0x2000
+
+#define CPC_Cx_VP_STOP		0x0020
+#define CPC_Cx_VP_RUN		0x0028
+#define CPC_Cx_CMD		0x0000
+
+#define CPC_Cx_CMD_PWRUP	0x3
+#define CPC_Cx_CMD_RESET	0x4
+
+#define CPC_Cx_STAT_CONF	0x0008
+#define CPC_Cx_STAT_CONF_SEQ_STATE	GEN_MASK(22, 19)
+#define CPC_Cx_STAT_CONF_SEQ_STATE_U5	6
+#define CPC_Cx_STAT_CONF_SEQ_STATE_U6	7
+
+#define INDEXED(op, reg, idx, offset, base)	\
+	li	idx, offset	;\
+	add	idx, idx, base	;\
+	op	reg, (idx)
+
+#endif
diff --git a/platform/generic/include/mips/stw.h b/platform/generic/include/mips/stw.h
new file mode 100644
index 0000000..bdcacc3
--- /dev/null
+++ b/platform/generic/include/mips/stw.h
@@ -0,0 +1,191 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+
+Some lines of this code have been copied from
+https://github.com/riscv/riscv-tests and are used in accordance with following
+license:
+
+Copyright (c) 2012-2015, The Regents of the University of California (Regents).
+All Rights Reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+3. Neither the name of the Regents nor the
+   names of its contributors may be used to endorse or promote products
+   derived from this software without specific prior written permission.
+
+IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
+SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING
+OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS
+BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
+HEREUNDER IS PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE
+MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
+
+*/
+
+#include <sbi/sbi_scratch.h>
+#undef MSTATUS_MPRV
+#undef SATP_MODE_OFF
+#undef SATP_MODE_SV32
+#undef SATP_MODE_SV39
+#undef SATP_MODE_SV48
+#undef SATP_MODE_SV57
+#undef SATP_MODE_SV64
+#undef MSTATUS_MPV
+
+#define CAUSE_ILLEGAL_INST 2
+#define CAUSE_LOAD_ACCESS 0x5
+#define CAUSE_STORE_ACCESS 0x7
+#define CAUSE_LOAD_PAGE_FAULT 0xd
+#define CAUSE_STORE_PAGE_FAULT 0xf
+#define CAUSE_GUEST_LOAD_PAGE_FAULT 21
+#define CAUSE_GUEST_STORE_PAGE_FAULT 23
+#define CAUSE_READ_TIME 26
+#define CAUSE_GUEST_TLB_MISS 28
+#define MSTATUS_MPRV 0x00020000
+#define vsatp 0x280
+#define mtval2 0x34b
+#define hgatp 0x680
+
+#define SATP_MODE_OFF  0
+#define SATP_MODE_SV32 1
+#define SATP_MODE_SV39 8
+#define SATP_MODE_SV48 9
+#define SATP_MODE_SV57 10
+#define SATP_MODE_SV64 11
+#define mstatus_GVA_LSB 38
+#define PTE_V     0x001 /* Valid */
+#define PTE_R     0x002 /* Read */
+#define PTE_W     0x004 /* Write */
+#define PTE_X     0x008 /* Execute */
+#define PTE_U     0x010 /* User */
+#define PTE_G     0x020 /* Global */
+#define PTE_A     0x040 /* Accessed */
+#define PTE_D     0x080 /* Dirty */
+#define PTE_N     0x8000000000000000 /* Napot */
+#define PTE_RSVD  0x7fc0000000000000 /* RSVD */
+#define mstatus_MPV_MSB 39
+#define mstatus_MPV_LSB 39
+#define MSTATUS_MPV ALIGN_FIELD(-1, mstatus_MPV)
+
+/* Return value aligned at [msb:lsb]. */
+#define ALIGN(value, msb, lsb) (((value) & ((1 << (1 + msb - lsb)) - 1)) << lsb)
+
+/* Return value aligned@named field, i.e. [<field>_MSB:<field>_LSB]. */
+#define ALIGN_FIELD(value, field) ALIGN(value, field##_MSB, field##_LSB)
+
+/* rd = rs[max:min] */
+#define extract(rd, rs, max, min)                    ; \
+        slli    rd, rs, __riscv_xlen - 1 - max       ; \
+        srli    rd, rd, __riscv_xlen - 1 - max + min
+
+/**
+ * GPR numbers of named gprs, for passing named gprs to instruction definitions.
+ */
+#define gpr_idx_x0 0
+#define gpr_idx_x1 1
+#define gpr_idx_sp 2
+#define gpr_idx_gp 3
+#define gpr_idx_tp 4
+#define gpr_idx_t0 5
+#define gpr_idx_t1 6
+#define gpr_idx_t2 7
+#define gpr_idx_s0 8
+#define gpr_idx_fp 8
+#define gpr_idx_s1 9
+#define gpr_idx_a0 10
+#define gpr_idx_a1 11
+#define gpr_idx_a2 12
+#define gpr_idx_a3 13
+#define gpr_idx_a4 14
+#define gpr_idx_a5 15
+#define gpr_idx_a6 16
+#define gpr_idx_a7 17
+#define gpr_idx_s2 18
+#define gpr_idx_s3 19
+#define gpr_idx_s4 20
+#define gpr_idx_s5 21
+#define gpr_idx_s6 22
+#define gpr_idx_s7 23
+#define gpr_idx_s8 24
+#define gpr_idx_s9 25
+#define gpr_idx_s10 26
+#define gpr_idx_s11 27
+#define gpr_idx_t3 28
+#define gpr_idx_t4 29
+#define gpr_idx_t5 30
+#define gpr_idx_t6 31
+
+#define GPR_IDX(rs) _GPR_IDX(rs)
+#define _GPR_IDX(rs) gpr_idx_##rs
+
+#if BIGENDIAN
+#define IWORD(x)              ; \
+        .byte (x) & 0xff      ; \
+        .byte (x)>>8 & 0xff   ; \
+        .byte (x)>>16 & 0xff  ; \
+        .byte (x)>>24 & 0xff
+#else
+  #define IWORD(x) .word x
+#endif
+
+#define MTLBWR(rs1, level) \
+        IWORD(0b11101100000000000000000001110011 | GPR_IDX(rs1)<<15 | level<<20)
+
+#define MTLBWR_HG(rs1, level) \
+        IWORD(0b11101100100000000000000001110011 | GPR_IDX(rs1)<<15 | level<<20)
+
+#define PAUSE_ZIHINTPAUSE() \
+        IWORD(0b00000001000000000000000000001111)
+
+#define PAUSE_MIPS() \
+        IWORD(0b00000000010100000001000000010011)
+
+#if ZIHINTPAUSE
+  #define PAUSE() PAUSE_ZIHINTPAUSE()
+#else
+  #define PAUSE() PAUSE_MIPS()
+#endif
+
+#define base (15 << 3) /* This should match SBI_SCRATCH_STW_TMP_OFFSET. */
+#if base != SBI_SCRATCH_STW_TMP_OFFSET
+  #error WRONG base for STW
+#endif
+#define O_tmp0 (base + (0 << 3))
+#define O_save_x1 (base + (1 << 3))
+#define O_satp_vsatp_scratch0 (base + (2 << 3))
+#define O_satp_vsatp_scratch1 (base + (3 << 3))
+#define O_satp_vsatp_scratch2 (base + (4 << 3))
+#define O_satp_vsatp_scratch3 (base + (5 << 3))
+#define O_satp_vsatp_scratch4 (base + (6 << 3))
+#define O_satp_vsatp_scratch5 (base + (7 << 3))
+#define O_satp_vsatp_scratch6 (base + (8 << 3))
+#define O_satp_vsatp_scratch7 (base + (9 << 3))
+#define O_satp_vsatp_scratch8 (base + (10 << 3))
+#define O_hgatp_scratch0 (base + (11 << 3))
+#define O_hgatp_scratch1 (base + (12 << 3))
+#define O_hgatp_scratch2 (base + (13 << 3))
+#define O_hgatp_scratch3 (base + (14 << 3))
+#define O_hgatp_scratch4 (base + (15 << 3))
+#define O_hgatp_scratch5 (base + (16 << 3))
+#define O_amo_scratch (base + (17 << 3)) /* Points to 17 dwords */
+
+#ifdef __riscv_compressed
+    #define JUMP_TABLE_SHIFT 2
+    #define JUMP_TABLE_OFFSET 4
+#else
+    #define JUMP_TABLE_SHIFT 3
+    #define JUMP_TABLE_OFFSET 8
+#endif
diff --git a/platform/generic/mips/cps-vec.S b/platform/generic/mips/cps-vec.S
new file mode 100644
index 0000000..5049532
--- /dev/null
+++ b/platform/generic/mips/cps-vec.S
@@ -0,0 +1,202 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <mips/p8700.h>
+
+	.text
+	.align	12
+	.globl	mips_cps_core_entry
+mips_cps_core_entry:
+	j	1f
+
+	.align	2
+nmi_vector:
+	j	1f
+
+	.align	2
+cacheerr_vector:
+	j	1f
+
+	.align	2
+debugexc_vector:
+	j	1f
+
+	.align	2
+1:
+	li	x1, 0
+	li	x2, 0
+	li	x3, 0
+	li	x4, 0
+	li	x5, 0
+	li	x6, 0
+	li	x7, 0
+	li	x8, 0
+	li	x9, 0
+	li	x10, 0
+	li	x11, 0
+	li	x12, 0
+	li	x13, 0
+	li	x14, 0
+	li	x15, 0
+	li	x16, 0
+	li	x17, 0
+	li	x18, 0
+	li	x19, 0
+	li	x20, 0
+	li	x21, 0
+	li	x22, 0
+	li	x23, 0
+	li	x24, 0
+	li	x25, 0
+	li	x26, 0
+	li	x27, 0
+	li	x28, 0
+	li	x29, 0
+	li	x30, 0
+	li	x31, 0
+
+	/* a0 has mhartid */
+	csrr	a0, CSR_MHARTID
+
+	/* Test mhartid lowest 4 bits */
+	andi	t0, a0, 0xf
+	bnez	t0, setup_pmp
+
+	/* Cluster cl Core co Hart 0 */
+	li	s0, CM_BASE
+
+cm_relocate_done:
+	li	t0, GCR_CORE_COH_EN_EN
+
+	/* Get core number to update CM_BASE */
+	srl	t1, a0, MHARTID_CORE_SHIFT
+	andi	t1, t1, MHARTID_CORE_MASK
+	sll	t1, t1, CM_BASE_CORE_SHIFT
+	add	s0, s0, t1
+	INDEXED(sd, t0, t1, GCR_OFF_LOCAL + GCR_CORE_COH_EN, s0)
+	fence
+
+setup_pmp:
+	li	t0, DRAM_PMP_ADDR
+	csrw	CSR_PMPADDR14, t0
+	li	t0, 0x1fffffffffffffff # All from 0x0
+	csrw	CSR_PMPADDR15, t0
+	li	t0, ((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<56)|((PMP_A_NAPOT|PMP_R|PMP_W|PMP_X)<<48)
+	csrw	CSR_PMPCFG2, t0
+	/* Set cacheable for pmp6, uncacheable for pmp7 */
+	li	t0, (CCA_CACHE_DISABLE << 56)|(CCA_CACHE_ENABLE << 48)
+	csrw	CSR_MIPSPMACFG2, t0
+	/* Reset pmpcfg0 */
+	csrw	CSR_PMPCFG0, zero
+	/* Reset pmacfg0 */
+	csrw	CSR_MIPSPMACFG0, zero
+	fence
+
+per_cluster:
+	li	t0, 0xffff
+	and	t0, t0, a0
+	bnez	t0, per_core
+
+	/* L2 Prefetch */
+	li	t0, 0xfffff110
+	sw	t0, L2_PFT_CONTROL_OFFSET(s0)
+	li	t0, 0x15ff
+	sw	t0, L2_PFT_CONTROL_B_OFFSET(s0)
+
+per_core:
+	andi	t0, a0, 0xf
+	bnez	t0, per_hart
+
+	/* Enable Load Pair */
+	/* Enable Store Pair */
+	/* Enable HTW */
+	li      t0, (1<<12)|(1<<13)|(1<<7)
+	csrc    CSR_MIPSCONFIG7, t0
+
+	/* Disable noRFO */
+	li	t0, (1<<25)
+	csrs	CSR_MIPSCONFIG7, t0
+
+	/* Disable misaligned load/store to have misaligned address exceptions */
+	li	t0, (1<<9)
+	csrs	CSR_MIPSCONFIG7, t0
+
+	/* Enable L1-D$ Prefetch */
+	li	t0, 0xff
+	csrw	CSR_MIPSCONFIG11, t0
+
+	li	t0, 4
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x104
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x204
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x304
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x404
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x504
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x604
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+	li	t0, 0x704
+	csrs	CSR_MIPSCONFIG8, t0
+	li	t0, 8
+	csrs	CSR_MIPSCONFIG9, t0
+	fence
+	fence.i
+
+per_hart:
+	/* Set up mipstvec */
+	lla	t0, mipstvec_handler_stw
+	ori	t0, t0, 1
+	csrw	CSR_MIPSTVEC, t0
+
+	/* Let hart 0 jump to _start */
+	beqz	a0, 1f
+	lla	t0, _start_warm
+	jr	t0
+1:
+	lla	t0, _start
+	jr	t0
+
diff --git a/platform/generic/mips/mips,boston-p8700.dts b/platform/generic/mips/mips,boston-p8700.dts
new file mode 100644
index 0000000..9e3ca2a
--- /dev/null
+++ b/platform/generic/mips/mips,boston-p8700.dts
@@ -0,0 +1,353 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+/dts-v1/;
+
+#define CM_BASE 0x16100000
+#define APLIC_M_BASE (CM_BASE + 0x40000)
+#define APLIC_S_BASE (CM_BASE + 0x60000)
+#define MSWI_BASE (CM_BASE + 0x50000)
+#define MTIMER_BASE (MSWI_BASE + 0x4000)
+#define CPC_TIMER (CM_BASE + 0x8050)
+
+#define BITFILE_FREQUENCY 25000000
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "MIPS P8700";
+	compatible = "mips,p8700";
+
+	chosen {
+		stdout-path = &uart0;
+		// For Qemu
+		//bootargs = "root=/dev/sda rw earlycon console=ttyS0,115200n8r";
+		// For a Boston board
+		bootargs = "root=/dev/mmcblk0p5 rw rootwait earlycon console=ttyS0,115200n8r";
+
+		opensbi-domains {
+			compatible = "opensbi,domain,config";
+
+			tmem: tmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x80000000>;
+				order = <31>;
+			};
+
+			allmem: allmem {
+				compatible = "opensbi,domain,memregion";
+				base = <0x0 0x0>;
+				order = <64>;
+			};
+
+			tdomain: trusted-domain {
+				compatible = "opensbi,domain,instance";
+				possible-harts = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5 &cpu6 &cpu7>;
+				regions = <&tmem 0x3f>, <&allmem 0x3f>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <BITFILE_FREQUENCY>;
+
+		cpu0: cpu at 0 {
+			phandle = <0x00000001>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000000>;
+
+			interrupt-controller {
+				phandle = <0x00000002>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu at 1 {
+			phandle = <0x00000005>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000001>;
+
+			interrupt-controller {
+				phandle = <0x00000006>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu2: cpu at 2 {
+			phandle = <0x00000007>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000010>;
+
+			interrupt-controller {
+				phandle = <0x00000008>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu3: cpu at 3 {
+			phandle = <0x00000009>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000011>;
+
+			interrupt-controller {
+				phandle = <0x0000000a>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu4: cpu at 4 {
+			phandle = <0x0000000b>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000020>;
+
+			interrupt-controller {
+				phandle = <0x0000000c>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu5: cpu at 5 {
+			phandle = <0x0000000d>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000021>;
+
+			interrupt-controller {
+				phandle = <0x0000000e>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu6: cpu at 6 {
+			phandle = <0x0000000f>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000030>;
+
+			interrupt-controller {
+				phandle = <0x00000010>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu7: cpu at 7 {
+			phandle = <0x00000011>;
+			device_type = "cpu";
+			compatible = "riscv";
+			opensbi-domain = <&tdomain>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdcsu";
+			status = "okay";
+			reg = <0x00000031>;
+
+			interrupt-controller {
+				phandle = <0x00000012>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	pci2: pci at 14000000 {
+		compatible = "xlnx,axi-pcie-host-1.00.a";
+		device_type = "pci";
+		reg = <0x14000000 0x2000000>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <4>;
+		interrupts = <0x00000007 0x00000004>;
+
+		ranges = <0x02000000 0 0x16000000
+			  0x16000000 0 0x100000>;
+
+		bus-range = <0x00 0xff>;
+
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pci2_intc 1>,
+				<0 0 0 2 &pci2_intc 2>,
+				<0 0 0 3 &pci2_intc 3>,
+				<0 0 0 4 &pci2_intc 4>;
+
+		pci2_intc: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		pci2_root at 0,0,0 {
+			compatible = "pci10ee,7021", "pci-bridge";
+			reg = <0x00000000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+
+			eg20t_bridge at 1,0,0 {
+				compatible = "pci8086,8800", "pci-bridge";
+				reg = <0x00010000 0 0 0 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				#interrupt-cells = <1>;
+
+				eg20t_mac at 2,0,1 {
+					compatible = "pci8086,8802", "intel,pch-gbe";
+					reg = <0x00020100 0 0 0 0>;
+					phy-reset-gpios = <&eg20t_gpio 6 1>;
+				};
+
+				eg20t_gpio: eg20t_gpio at 2,0,2 {
+					compatible = "pci8086,8803", "intel,eg20t-gpio";
+					reg = <0x00020200 0 0 0 0>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				eg20t_i2c at 2,12,2 {
+					compatible = "pci8086,8817";
+					reg = <0x00026200 0 0 0 0>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rtc at 68 {
+						compatible = "st,m41t81s";
+						reg = <0x68>;
+					};
+				};
+			};
+		};
+	};
+
+	uart0: uart at 17ffe000 {
+		compatible = "ns16550a";
+		reg = <0x17ffe000 0x1000>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+
+		interrupt-parent = <4>;
+		interrupts = <0x00000004 0x00000004>;
+
+		clock-frequency = <BITFILE_FREQUENCY>;
+
+		u-boot,dm-pre-reloc;
+	};
+
+	lcd: lcd at 17fff000 {
+		compatible = "img,boston-lcd";
+		reg = <0x17fff000 0x8>;
+	};
+
+	flash at 18000000 {
+		compatible = "cfi-flash";
+		reg = <0x18000000 0x8000000>;
+		bank-width = <2>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		aplic_s0 {
+			phandle = <0x00000004>;
+			#interrupt-cells = <0x00000002>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <2 9 6 9 8 9 10 9 12 9 14 9 16 9 18 9>;
+			reg = <APLIC_S_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		aplic_m0 {
+			phandle = <0x00000003>;
+			#interrupt-cells = <0x00000002>;
+			riscv,delegate = <0x00000004 0x00000001 0x00000035>;
+			riscv,children = <0x00000004>;
+			compatible = "riscv,aplic";
+			interrupt-controller;
+			interrupts-extended = <2 11 6 11 8 11 10 11 12 11 14 11 16 11 18 11>;
+			reg = <APLIC_M_BASE 0x00008000>;
+			riscv,num-sources = <0x00000035>;
+		};
+
+		mswi0 {
+			compatible = "riscv,aclint-mswi";
+			interrupts-extended = <2 3>, <6 3>, <8 3>, <10 3>, <12 3>, <14 3>, <16 3>, <18 3>;
+			reg = <MSWI_BASE 0x4000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		mtimer0 {
+			compatible = "riscv,aclint-mtimer";
+			reg = <CPC_TIMER 0x8>,
+			      <MTIMER_BASE 0x7ff8>;
+			interrupts-extended = <2 7>, <6 7>, <8 7>, <10 7>, <12 7>, <14 7>, <16 7>, <18 7>;
+		};
+	};
+};
diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
new file mode 100644
index 0000000..0254d35
--- /dev/null
+++ b/platform/generic/mips/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/stw.o mips/cps-vec.o
+platform-dtb-$(CONFIG_PLATFORM_MIPS_P8700) += mips/mips,boston-p8700.dtb
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
new file mode 100644
index 0000000..1bd627f
--- /dev/null
+++ b/platform/generic/mips/p8700.c
@@ -0,0 +1,202 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <mips/p8700.h>
+#include <mips/mips-cm.h>
+
+extern void mips_cps_core_entry(void);
+
+#if CLUSTERS_IN_PLATFORM > 1
+static void power_up_other_cluster(u32 hartid)
+{
+	unsigned int stat;
+	unsigned int timeout;
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Power up cluster cl core 0 hart 0 */
+	write_cpc_pwrup_ctl(hartid, 1, local_p);
+
+	/* Wait for the CM to start up */
+	timeout = 100;
+	while (true) {
+		stat = read_cpc_cm_stat_conf(hartid, local_p);
+		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
+			break;
+
+		/* Delay a little while before we start warning */
+		if (timeout) {
+			sbi_dprintf("Delay a little while before we start warning\n");
+			timeout--;
+		}
+		else {
+			sbi_printf("Waiting for cluster %u CM to power up... STAT_CONF=0x%x\n",
+				   cpu_cluster(hartid), stat);
+			break;
+		}
+	}
+}
+#endif
+
+static int mips_hart_start(u32 hartid, ulong saddr)
+{
+	unsigned int stat;
+	unsigned int timeout;
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Hart 0 is the boot hart, and we don't use the CPC cmd to start.  */
+	if (hartid == 0)
+		return SBI_ENOTSUPP;
+
+	if (cpu_hart(hartid) == 0) {
+		/* Change cluster cl core co hart 0 reset base */
+		write_gcr_co_reset_base(hartid,
+					(unsigned long)mips_cps_core_entry, local_p);
+
+		/* Ensure its coherency is disabled */
+		write_gcr_co_coherence(hartid, 0, local_p);
+
+		/* Start cluster cl core co hart 0 */
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+
+		/* Reset cluster cl core co hart 0 */
+		write_cpc_co_cmd(hartid, CPC_Cx_CMD_RESET, local_p);
+
+		timeout = 100;
+		while (true) {
+			stat = read_cpc_co_stat_conf(hartid, local_p);
+			stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
+			if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U6)
+				break;
+
+			/* Delay a little while before we start warning */
+			if (timeout) {
+				sbi_timer_mdelay(10);
+				timeout--;
+			}
+			else {
+				sbi_printf("Waiting for cluster %u core %u hart %u to start... STAT_CONF=0x%x\n",
+					   cpu_cluster(hartid),
+					   cpu_core(hartid), cpu_hart(hartid),
+					   stat);
+				break;
+			}
+		}
+	}
+	else {
+		write_gcr_co_reset_base(hartid,
+					(unsigned long)mips_cps_core_entry, local_p);
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+	}
+
+	return 0;
+}
+
+static int mips_hart_stop()
+{
+	u32 hartid = current_hartid();
+	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
+
+	/* Hart 0 is the boot hart, and we don't use the CPC cmd to stop.  */
+	if (hartid == 0)
+		return SBI_ENOTSUPP;
+
+	write_cpc_co_vp_stop(hartid, 1 << cpu_hart(hartid), local_p);
+
+	return 0;
+}
+
+static const struct sbi_hsm_device mips_hsm = {
+	.name		= "mips_hsm",
+	.hart_start	= mips_hart_start,
+	.hart_stop	= mips_hart_stop,
+};
+
+static int mips_p8700_final_init(bool cold_boot, void *fdt,
+			     const struct fdt_match *match)
+{
+	if (cold_boot)
+		sbi_hsm_set_device(&mips_hsm);
+
+	return 0;
+}
+
+static int mips_p8700_early_init(bool cold_boot, const void *fdt,
+			     const struct fdt_match *match)
+{
+	int rc;
+
+	if (cold_boot)
+	{
+#if CLUSTERS_IN_PLATFORM > 1
+		int i;
+		/* Power up other clusters in the platform. */
+		for (i = 1; i < CLUSTERS_IN_PLATFORM; i++) {
+			power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
+		}
+#endif
+
+		/* For the CPC mtime region, the minimum size is 0x10000. */
+		rc = sbi_domain_root_add_memrange(CM_BASE, SIZE_FOR_CPC_MTIME,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+		/* For the APLIC and ACLINT m-mode region */
+		rc = sbi_domain_root_add_memrange(AIA_BASE, SIZE_FOR_AIA_M_MODE,
+						  P8700_ALIGN,
+						  (SBI_DOMAIN_MEMREGION_MMIO |
+						   SBI_DOMAIN_MEMREGION_M_READABLE |
+						   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+		if (rc)
+			return rc;
+
+#if CLUSTERS_IN_PLATFORM > 1
+		for (i = 0; i < CLUSTERS_IN_PLATFORM; i++) {
+			/* For the CPC mtime region, the minimum size is 0x10000. */
+			rc = sbi_domain_root_add_memrange(GLOBAL_CM_BASE[i], SIZE_FOR_CPC_MTIME,
+							  P8700_ALIGN,
+							  (SBI_DOMAIN_MEMREGION_MMIO |
+							   SBI_DOMAIN_MEMREGION_M_READABLE |
+							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+			if (rc)
+				return rc;
+
+			/* For the APLIC and ACLINT m-mode region */
+			rc = sbi_domain_root_add_memrange(AIA_BASE - CM_BASE + GLOBAL_CM_BASE[i], SIZE_FOR_AIA_M_MODE,
+							  P8700_ALIGN,
+							  (SBI_DOMAIN_MEMREGION_MMIO |
+							   SBI_DOMAIN_MEMREGION_M_READABLE |
+							   SBI_DOMAIN_MEMREGION_M_WRITABLE));
+			if (rc)
+				return rc;
+		}
+#endif
+	}
+
+	return 0;
+}
+
+static const struct fdt_match mips_p8700_match[] = {
+	{ .compatible = "mips,p8700" },
+	{ },
+};
+
+const struct platform_override mips_p8700 = {
+	.match_table = mips_p8700_match,
+	.early_init = mips_p8700_early_init,
+	.final_init = mips_p8700_final_init,
+};
diff --git a/platform/generic/mips/stw.S b/platform/generic/mips/stw.S
new file mode 100644
index 0000000..098a1c5
--- /dev/null
+++ b/platform/generic/mips/stw.S
@@ -0,0 +1,986 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 MIPS
+ *
+ * This file implements MIPS custom exception handler for software table walker when hardware table
+ * walker is disabled or not available, rdtime emulation, and AMO instruction emulation.
+ */
+
+
+/* Define STW_TLB_4KB to force to use 4KB pages in every level for software table walker.
+   This is for debugging only. */
+//#define STW_TLB_4KB 1
+
+#include <mips/stw.h>
+#include <mips/board.h>
+#include <mips/p8700.h>
+
+#if defined(__riscv_zbb)
+#define ZBB_PRESENT 1
+#endif
+
+        .text
+        .align  8
+        .globl  mipstvec_handler_stw
+mipstvec_handler_stw:
+        j       mipstvec_handler_stw_not_vec  ; .align 2 /* 0 */
+        j       fail                          ; .align 2 /* 1 */
+        j       illegal_inst_handler          ; .align 2 /* 2 */
+        j       fail                          ; .align 2 /* 3 */
+        j       fail                          ; .align 2 /* 4 */
+        j       htw_load_access_fault_handler ; .align 2 /* 5 */
+        j       fail                          ; .align 2 /* 6 */
+        j       fail                          ; .align 2 /* 7 */
+        j       fail                          ; .align 2 /* 8 */
+        j       fail                          ; .align 2 /* 9 */
+        j       fail                          ; .align 2 /* 10 */
+        j       fail                          ; .align 2 /* 11 */
+        j       fail                          ; .align 2 /* 12 */
+        j       fail                          ; .align 2 /* 13 */
+        j       fail                          ; .align 2 /* 14 */
+        j       fail                          ; .align 2 /* 15 */
+        j       fail                          ; .align 2 /* 16 */
+        j       fail                          ; .align 2 /* 17 */
+        j       fail                          ; .align 2 /* 18 */
+        j       fail                          ; .align 2 /* 19 */
+        j       fail                          ; .align 2 /* 20 */
+        j       htw_page_fault_handler        ; .align 2 /* 21 */
+        j       fail                          ; .align 2 /* 22 */
+        j       fail                          ; .align 2 /* 23 */
+        j       satp_refill_handler           ; .align 2 /* 24 */
+        j       satp_refill_handler           ; .align 2 /* 25 */
+        j       read_time_handler             ; .align 2 /* 26 */
+        j       satp_refill_handler           ; .align 2 /* 27 */
+        j       hgatp_refill_handler          ; .align 2 /* 28 */
+        j       hgatp_refill_handler          ; .align 2 /* 29 */
+        j       read_time_handler             ; .align 2 /* 30 */
+        j       hgatp_refill_handler          ; .align 2 /* 31 */
+
+mipstvec_handler_stw_not_vec:
+        csrci   CSR_MIPSCONFIG5, MIPSCONFIG5_MTW
+        csrrw   sp, mscratch, sp   // Save sp to mscratch, load mscratch to sp
+        sd      x1, O_save_x1(sp)  // Save x1 to memory
+        csrr    x1, mcause         // Read mcause
+
+#define _mipstvec_handler_dispatch(i)        ; \
+        addi    x1, x1, -i                   ; \
+        bnez    x1, 10f                      ; \
+        ld      x1, O_save_x1(sp)            ; \
+        csrrw   sp, mscratch, sp             ; \
+        j       mipstvec_handler_stw + 4 * i ; \
+10:     addi    x1, x1, i
+
+#define _mipstvec_handler_dispatch_mtw(i)    ; \
+        addi    x1, x1, -i                   ; \
+        bnez    x1, 10f                      ; \
+        ld      x1, O_save_x1(sp)            ; \
+        csrrw   sp, mscratch, sp             ; \
+        csrsi   CSR_MIPSCONFIG5, MIPSCONFIG5_MTW ; \
+        j       mipstvec_handler_stw + 4 * i ; \
+10:     addi    x1, x1, i
+
+        _mipstvec_handler_dispatch(2)
+        _mipstvec_handler_dispatch(20)
+        _mipstvec_handler_dispatch(21)
+        _mipstvec_handler_dispatch(23)
+        _mipstvec_handler_dispatch(24)
+        _mipstvec_handler_dispatch(25)
+        _mipstvec_handler_dispatch(26)
+        _mipstvec_handler_dispatch(27)
+        _mipstvec_handler_dispatch_mtw(28)
+        _mipstvec_handler_dispatch_mtw(29)
+        _mipstvec_handler_dispatch_mtw(30)
+        _mipstvec_handler_dispatch_mtw(31)
+        j       fail
+
+satp_refill_handler:
+vsatp_refill_handler:
+        csrrw	sp, mscratch, sp    /* sp = mscratch; mscratch = saved sp */
+        sd      t0, O_satp_vsatp_scratch0(sp) /* save t0 */
+        csrrw	t0, mscratch, sp    /* t0 = saved sp; restore mscratch */
+        sd      t0, O_satp_vsatp_scratch8(sp) /* save sp */
+        sd      t1, O_satp_vsatp_scratch1(sp) /* save t1 */
+        sd      t2, O_satp_vsatp_scratch2(sp) /* save t2 */
+        sd      t3, O_satp_vsatp_scratch3(sp) /* save t3 */
+        sd      s4, O_satp_vsatp_scratch4(sp) /* save s4 */
+        sd      t5, O_satp_vsatp_scratch5(sp) /* save t5 */
+        sd      t6, O_satp_vsatp_scratch6(sp) /* save t6 */
+        sd      s7, O_satp_vsatp_scratch7(sp) /* save s7 */
+
+        /* Save mstatus, mepc (not actually needed for non-vmode refill) */
+        csrr    s4, mstatus
+        csrr    t5, mepc
+        csrrsi  t6, CSR_MIPSCONFIG5, MIPSCONFIG5_MTW  /* set MTW bit */
+
+        /* Only V can be set out of following bits for PTE to be non-leaf */
+        li      s7, PTE_V | PTE_R | PTE_W | PTE_X | PTE_U | PTE_A | PTE_D | PTE_N | PTE_RSVD
+
+_read_xsatp:
+        /* t1 = vsatp if vmode exception (mstatus.GVA=1) else satp */
+        sll     t3, s4, __riscv_xlen - 1 - mstatus_GVA_LSB
+        bgez    t3, 1f
+        csrr    t3, vsatp
+        j       2f
+1:      csrr    t3, satp
+2:
+
+_find_xsatp_mode:
+        slli	t0, t3, 20   // t0 = satp.PPN << 20 (clear out MODE, ASID)
+        srli	t0, t0, 8    // "a" = t0 = satp.PPN << 12 (i.e. * PAGESIZE)
+        li      t1, 0        // Is this PTE global? (Need to track during walk).
+        csrr    t2, mtval    // va
+
+        // Branch according to xsatp.MODE
+        srli    t3, t3, 60
+        addi    t3, t3, -SATP_MODE_SV39
+        beqz	t3, _xsatp_Sv39_level2  // Sv39
+        addi    t3, t3, SATP_MODE_SV39 - SATP_MODE_SV48
+        beqz    t3, _xsatp_Sv39_level3  // Sv48
+        j	fail
+
+_xsatp_Sv39_level3:
+        extract (t3, t2, 47, 39) // t3 = VPN[2]
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s7
+        xori    t3, t3, PTE_V
+        bnez	t3, _xsatp_level3_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_xsatp_Sv39_level2:
+        extract (t3, t2, 38, 30) // t3 = VPN[2]
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s7
+        xori    t3, t3, PTE_V
+        bnez	t3, _xsatp_level2_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_xsatp_Sv39_level1:
+        extract (t3, t2, 29, 21) // t3 = VPN[2]
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s7
+        xori    t3, t3, PTE_V
+        bnez	t3, _xsatp_level1_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_xsatp_Sv39_level0:
+        extract (t3, t2, 20, 13) // t3 = VPN[2] (even page)
+        slli    t3, t3, 4     // t3 = VPN[2] (even page) * 2 * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] (even page) 2 * PTESIZE
+        ld      t3, 0(t0)     // t3 = even PTE
+        ld      t0, 8(t0)     // t0 = odd PTE
+
+_xsatp_level0_leaf:
+        or      t3, t3, t1    // global if parent table is global
+        or      t0, t0, t1    // global if parent table is global
+        li      t1, 0x1000    // even/odd bit
+        or      t2, t2, t1    // Odd page mtval
+        csrw    mtval, t2
+        MTLBWR  (t0, 0)       // Write odd PTE to TLB
+        csrc    mtval, t1     // Even page mtval
+        MTLBWR  (t3, 0)       // Write even PTE to TLB
+
+_xsatp_mret:
+        csrw    mstatus, s4 /* Restore mstatus */
+        csrw    mepc, t5 /* Restore mepc */
+        csrw    CSR_MIPSCONFIG5, t6 /* Restore mipsconfig5 */
+
+        ld      t0, O_satp_vsatp_scratch0(sp) /* restore t0 */
+        ld      t1, O_satp_vsatp_scratch1(sp) /* restore t1 */
+        ld      t2, O_satp_vsatp_scratch2(sp) /* restore t2 */
+        ld      t3, O_satp_vsatp_scratch3(sp) /* restore t3 */
+        ld      s4, O_satp_vsatp_scratch4(sp) /* restore s4 */
+        ld      t5, O_satp_vsatp_scratch5(sp) /* restore t5 */
+        ld      t6, O_satp_vsatp_scratch6(sp) /* restore t6 */
+        ld      s7, O_satp_vsatp_scratch7(sp) /* restore sp */
+        ld      sp, O_satp_vsatp_scratch8(sp) /* restore sp */
+
+        mret
+
+_xsatp_level1_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 20, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        csrw    mtval, t2
+        MTLBWR  (t0, 0)
+#else
+        csrw    mtval, t2
+        MTLBWR  (t0, 1)
+#endif
+        j       _xsatp_mret
+
+_xsatp_level2_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 29, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        csrw    mtval, t2
+        MTLBWR  (t0, 0)
+#else
+        csrw    mtval, t2
+        MTLBWR  (t0, 2)
+#endif
+        j       _xsatp_mret
+
+_xsatp_level3_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 38, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        csrw    mtval, t2
+        MTLBWR  (t0, 0)
+#else
+        csrw    mtval, t2
+        MTLBWR  (t0, 3)
+#endif
+        j       _xsatp_mret
+
+hgatp_refill_handler:
+        csrrw	sp, mscratch, sp    /* sp = mscratch; mscratch = saved sp */
+        sd      t0, O_hgatp_scratch0(sp) /* save t0 */
+        csrrw	t0, mscratch, sp    /* t0 = saved sp; restore mscratch */
+        sd      t0, O_hgatp_scratch5(sp) /* save sp */
+        sd      t1, O_hgatp_scratch1(sp) /* save t1 */
+        sd      t2, O_hgatp_scratch2(sp) /* save t2 */
+        sd      t3, O_hgatp_scratch3(sp) /* save t3 */
+        sd      s4, O_hgatp_scratch4(sp) /* save s4 */
+
+        /* Only V can be set out of following bits for PTE to be non-leaf */
+        li      s4, PTE_V | PTE_R | PTE_W | PTE_X | PTE_U | PTE_A | PTE_D | PTE_N | PTE_RSVD
+
+        /* set MTW=1 */
+        csrsi   CSR_MIPSCONFIG5, MIPSCONFIG5_MTW
+
+_find_hgatp_mode:
+        csrr    t3, hgatp
+        slli	t0, t3, 20   // t0 = hgatp.PPN << 20 (clear out MODE, ASID)
+        srli	t0, t0, 8    // "a" = t0 = hgatp.PPN << 12 (i.e. * PAGESIZE)
+        li      t1, 0        // Is this PTE global? (Need to track during walk).
+        csrr    t2, mtval    // gpa
+
+        // Branch according to hgatp.MODE
+        srli    t3, t3, 60
+        addi    t3, t3, -SATP_MODE_SV39
+        bnez 	t3, 1f
+        extract (t3, t2, 38, 28) // t3 = VPN[2]
+        j       _hgatp_Sv39x4_level2_got_vpn2
+1:      addi    t3, t3, SATP_MODE_SV39 - SATP_MODE_SV48
+        beqz    t3, _hgatp_Sv39x4_level3
+        j	fail
+
+_hgatp_Sv39x4_level3:
+        extract (t3, t2, 47, 37) // t3 = VPN[2]
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s4
+        xori    t3, t3, PTE_V
+        bnez	t3, _hgatp_level3_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_hgatp_Sv39x4_level2:
+        extract (t3, t2, 36, 28) // t3 = VPN[2]
+_hgatp_Sv39x4_level2_got_vpn2:
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s4
+        xori    t3, t3, PTE_V
+        bnez	t3, _hgatp_level2_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_hgatp_Sv39x4_level1:
+        extract (t3, t2, 27, 19) // t3 = VPN[2]
+        slli    t3, t3, 3     // t3 = VPN[2] * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] * PTESIZE
+        ld      t0, 0(t0)     // t0 = PTE
+        and     t3, t0, s4
+        xori    t3, t3, PTE_V
+        bnez	t3, _hgatp_level1_leaf
+        andi    t3, t0, PTE_G
+        or      t1, t1, t3
+        extract	(t0, t0, 53, 10) // t0 = PTE[53:10]
+        slli    t0, t0, 12       // "a" = t0 = PTE[53:10] * PAGESIZE
+
+_hgatp_Sv39x4_level0:
+        extract (t3, t2, 18, 11) // t3 = VPN[2] (even page)
+        slli    t3, t3, 4     // t3 = VPN[2] (even page) * 2 * PTESIZE
+        add     t0, t0, t3    // t0 = a + VPN[2] (even page) 2 * PTESIZE
+        ld      t2, 0(t0)     // t2 = even PTE
+        ld      t3, 8(t0)     // t3 = odd PTE
+
+_hgatp_level0_leaf:
+        or      t2, t2, t1    // global if parent table is global
+        or      t3, t3, t1    // global if parent table is global
+        li      t0, 0x0400    // even/odd bit
+        csrc    mtval, t0
+        MTLBWR_HG (t2, 0)
+        csrs    mtval, t0
+        MTLBWR_HG (t3, 0)
+
+_hgatp_mret:
+        csrci   CSR_MIPSCONFIG5, MIPSCONFIG5_MTW /* Clear MTW bit */
+
+        ld      t0, O_hgatp_scratch0(sp) /* restore t0 */
+        ld      t1, O_hgatp_scratch1(sp) /* restore t1 */
+        ld      t2, O_hgatp_scratch2(sp) /* restore t2 */
+        ld      t3, O_hgatp_scratch3(sp) /* restore t3 */
+        ld      s4, O_hgatp_scratch4(sp) /* restore s4 */
+        ld      sp, O_hgatp_scratch5(sp) /* restore sp */
+
+        mret
+
+_hgatp_level1_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 20, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        MTLBWR_HG (t0, 0)
+#else
+        MTLBWR_HG (t0, 1)
+#endif
+        j       _hgatp_mret
+
+_hgatp_level2_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 29, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        MTLBWR_HG (t0, 0)
+#else
+        MTLBWR_HG (t0, 2)
+#endif
+        j       _hgatp_mret
+
+_hgatp_level3_leaf:
+        or      t0, t0, t1    // global if parent table is global
+#ifdef STW_TLB_4KB
+        extract (t3, t2, 38, 12)
+        sll     t3, t3, 10
+        or      t0, t0, t3
+        MTLBWR_HG (t0, 0)
+#else
+        MTLBWR_HG (t0, 3)
+#endif
+        j       _hgatp_mret
+
+htw_load_access_fault_handler:
+htw_hgatp_refill_handler:
+htw_page_fault_handler:
+        j       fail
+
+
+
+/********************
+ * rdtime emulation *
+ ********************/
+        .global read_time_handler
+read_time_handler:
+        csrrw	sp, mscratch, sp    /* sp = mscratch; mscratch = saved sp */
+        sd      x1, O_satp_vsatp_scratch0(sp) /* save sp */
+        sd      x3, O_satp_vsatp_scratch1(sp) /* save x3 */
+
+        /* Set x1 to address of function which will set rd to x3 */
+        csrr    x1, mtval
+        srli    x1, x1, 7 - JUMP_TABLE_SHIFT
+        andi    x1, x1, 0x1f << JUMP_TABLE_SHIFT
+        lla     x3, write_xr_rdtime
+        add     x1, x1, x3
+
+        /* Read the time memory mapped register */
+        lui     x3, %hi(TIMER_ADDR)
+        ld      x3, %lo(TIMER_ADDR)(x3)
+
+        /* Call function which sets rd = x3 */
+        jalr    x1
+
+        /* Increment mepc to skip instruction we just emulated */
+        csrr    x1, mepc
+        addi    x1, x1, 4
+        csrw    mepc, x1
+
+        /* Restore gprs from memory */
+        ld      x1, O_satp_vsatp_scratch0(sp) /* restore x1 */
+        ld      x3, O_satp_vsatp_scratch1(sp) /* restore x3 */
+        csrrw	sp, mscratch, sp
+
+        mret
+
+/***************************************
+ * Custom Illegal Instruction handling *
+ ***************************************/
+
+illegal_inst_handler:
+        csrrw	sp, mscratch, sp    /* sp = mscratch; mscratch = saved sp */
+        sd      x1, (O_amo_scratch + 0 * 8)(sp)
+        csrrw	x1, mscratch, sp    /* x1 = saved sp; restore mscratch */
+        sd      x1, (O_amo_scratch + 1 * 8)(sp) /* save sp */
+        sd      x3, (O_amo_scratch + 2 * 8)(sp)
+        sd      x4, (O_amo_scratch + 3 * 8)(sp)
+        sd      x5, (O_amo_scratch + 4 * 8)(sp)
+        sd      x6, (O_amo_scratch + 5 * 8)(sp)
+        sd      x7, (O_amo_scratch + 6 * 8)(sp)
+        sd      x8, (O_amo_scratch + 7 * 8)(sp)
+        sd      x9, (O_amo_scratch + 8 * 8)(sp)
+        sd      x10, (O_amo_scratch + 9 * 8)(sp)
+
+// Planned register use:
+//   x1 - ra, temporary, result
+//   x2 - sp
+//   x3 - rs1 value
+//   x4 - rs2 value
+//   x5 - temporary (mtval, mtval_match)
+//   x6 - saved mepc
+//   x7 - saved mtvec
+//   x8 - saved mstatus
+//   x9 - saved mtval
+//   x10 - temporary (fail count)
+
+        csrr    x9, mtval  // x9 = faulting opcode
+
+        /* x3 = rs1 value */
+        lla     x7, read_xr_amo  // x7 = base address of table of read_xr funcs
+        srli    x6, x9, 15 - JUMP_TABLE_SHIFT  // Align rs1 idx as table offset
+        andi    x6, x6, 0x1f << JUMP_TABLE_SHIFT  // Isolated aligned rs1
+        add     x4, x6, x7       // Apply offset to jump table
+        jalr    x4               // Call func to read rs1 into x4
+        move    x3, x4           // x3 = rs1 value
+
+        /* x4 = rs2 value */
+        srli    x6, x9, 20 - JUMP_TABLE_SHIFT  // Align rs2 idx as table offset
+        andi    x6, x6, 0x1f << JUMP_TABLE_SHIFT  // Isolate aligned rs2
+        add     x4, x6, x7       // Apply offset to jump table
+        jalr    x4               // Call func to read rs1 into x4
+
+        /* x6 = saved epc */
+        csrr    x6, mepc  // Save mepc
+
+        /* Use a local handler for mtvec exceptions */
+        lla     x1, _illegal_inst_mtvec_handler
+        csrrw   x7, mtvec, x1 // x7 = saved mtvec
+
+        /*
+         * Extract the AMO opcode match bits, write that value to t5. Each AMO
+         * instruction has a single unique value for these match bits. Since
+         * every AMO has the same value for the lower 12 bits, we xor the
+         * match value with the value of those lower 12 bits. This allows us
+         * to construct the compare value for each AMO instruction using a
+         * single LUI instruction.
+         */
+        li      x1, 0b11111000000000000111000001111111
+        and     x5, x9, x1
+        xori    x5, x5, 0b000000101111
+
+        li      x1, 0b00000000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amoadd_w
+
+        li      x1, 0b00000000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amoadd_d
+
+        li      x1, 0b01100000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amoand_w
+
+        li      x1, 0b01100000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amoand_d
+
+        li      x1, 0b10100000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amomax_w
+
+        li      x1, 0b10100000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amomax_d
+
+        li      x1, 0b11100000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amomaxu_w
+
+        li      x1, 0b11100000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amomaxu_d
+
+        li      x1, 0b10000000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amomin_w
+
+        li      x1, 0b10000000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amomin_d
+
+        li      x1, 0b11000000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amominu_w
+
+        li      x1, 0b11000000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amominu_d
+
+        li      x1, 0b01000000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amoor_w
+
+        li      x1, 0b01000000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amoor_d
+
+        li      x1, 0b00001000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amoswap_w
+
+        li      x1, 0b00001000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amoswap_d
+
+        li      x1, 0b00100000000000000010000000000000
+        beq     x5, x1, _illegal_inst_handler_amoxor_w
+
+        li      x1, 0b00100000000000000011000000000000
+        beq     x5, x1, _illegal_inst_handler_amoxor_d
+
+        j       fail
+
+/**
+ * Input:
+ *    x3 = rs1
+ *    x4 = rs2
+ * Ouput:
+ *    x5 = old memory value
+ *
+ * Try LR/SC while counting down from NUM_TRIES_WITHOUT_LOCK to 0.
+ * If counter reaches 0, acquire the global lock, then repeat LR/SC,
+ * counting down from NUM_TRIES_WITHOUT_LOCK + NUM_TRIES_WITH_LOCK to
+ * NUM_TRIES_WITHOUT_LOCK + 1
+ * If counter reaches NUM_TRIES_WITHOUT_LOCK + 1 then fail completely.
+ * On LR/SC success, if counter > NUM_TRIES_WITHOUT_LOCK then we had the lock,
+ * and need to release it.
+ *
+ * Pseudocode:
+ *
+ * # Wait until not locked.
+ * while locked:
+ *     pass
+ *
+ * counter = NUM_TRIES_WITHOUT_LOCK
+ * while 1:
+ *     value, fail = amo()
+ *     if fail:  # SC fail.
+ *         counter -= NUM_TRIES_WITHOUT_LOCK + 1
+ *         if counter == 0:
+ *             fail
+ *         counter += NUM_TRIES_WITHOUT_LOCK
+ *         if counter == 0:
+ *             get_lock()
+ *             counter = NUM_TRIES_WITH_LOCK + NUM_TRIES_WITHOUT_LOCK
+ *     else:  # SC pass.
+ *         counter -= NUM_TRIES_WITH_LOCK
+ *         if counter > 0:
+ *             free_lock()
+ *         return
+ */
+
+#define NUM_TRIES_WITHOUT_LOCK 20
+#define NUM_TRIES_WITH_LOCK 10000
+//#define NO_AMO_EMULATION_LOCK 1
+
+#if NO_AMO_EMULATION_LOCK
+#define DO_AMO(SIZE, AMO_OPERATION...)                            ; \
+        /* Set mstatus.MPRV = 1, x8 = saved mstatus */            ; \
+25:     li      x8, MSTATUS_MPRV                                  ; \
+        csrrs   x8, mstatus, x8                                   ; \
+                                                                  ; \
+30:     lr.SIZE.aq x5, (x3)                                       ; \
+        AMO_OPERATION                                             ; \
+        sc.SIZE.aqrl x1, x1, (x3)                                 ; \
+        beqz    x1, _illegal_inst_handler_return                  ; \
+        j       30b
+#else
+#define DO_AMO(SIZE, AMO_OPERATION...)                            ; \
+        /* Wait until lock is clear */                            ; \
+        lla     x10, amo_lock                                     ; \
+10:     lr.d    x5, (x10)                                         ; \
+        beqz    x5, 20f                                           ; \
+        PAUSE()                                                   ; \
+        j       10b                                               ; \
+                                                                  ; \
+20:     li      x10, NUM_TRIES_WITHOUT_LOCK                       ; \
+                                                                  ; \
+        /* Set mstatus.MPRV = 1, x8 = saved mstatus */            ; \
+25:     li      x8, MSTATUS_MPRV                                  ; \
+        csrrs   x8, mstatus, x8                                   ; \
+                                                                  ; \
+30:     lr.SIZE.aq x5, (x3)                                       ; \
+        AMO_OPERATION                                             ; \
+        sc.SIZE.aqrl x1, x1, (x3)                                 ; \
+        beqz    x1, _illegal_inst_handler_return                  ; \
+        /* SC failed */                                           ; \
+        addi    x10, x10, -NUM_TRIES_WITHOUT_LOCK + 1             ; \
+        bnez    x10, 40f                                          ; \
+        csrw    mstatus, x8                                       ; \
+        j       fail                                              ; \
+40:     addi    x10, x10, NUM_TRIES_WITHOUT_LOCK                  ; \
+        bnez    x10, 30b                                          ; \
+                                                                  ; \
+        /* Acquire lock */                                        ; \
+        csrw    mstatus, x8                                       ; \
+        lla     x10, amo_lock                                     ; \
+50:     lr.d    x5, (x10)                                         ; \
+        beqz    x5, 60f                                           ; \
+        PAUSE()                                                   ; \
+        j       50b                                               ; \
+60:     sc.d    x5, sp, (x10) /* Use sp as lock value */          ; \
+        bnez    x5, 50b                                           ; \
+                                                                  ; \
+        /* Retry with lock */                                     ; \
+        li      x10, NUM_TRIES_WITH_LOCK + NUM_TRIES_WITHOUT_LOCK ; \
+        j       25b
+#endif  /* NO_AMO_EMULATION_LOCK */
+
+_illegal_inst_handler_amoadd_w:
+        DO_AMO(w, addw    x1, x5, x4)
+
+_illegal_inst_handler_amoadd_d:
+        DO_AMO(d, add     x1, x5, x4)
+
+_illegal_inst_handler_amoand_w:
+        DO_AMO(w, and     x1, x5, x4)
+
+_illegal_inst_handler_amoand_d:
+        DO_AMO(d, and     x1, x5, x4)
+
+_illegal_inst_handler_amomax_w:
+        addw    x4, x4, x0
+#if ZBB_PRESENT
+        DO_AMO(w, max     x1, x5, x4)
+#else
+        DO_AMO(w,
+        move    x1, x5          ;
+        bge     x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amomax_d:
+#if ZBB_PRESENT
+        DO_AMO(d, max     x1, x5, x4)
+#else
+        DO_AMO(d,
+        move    x1, x5          ;
+        bge     x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amomaxu_w:
+        addw    x4, x4, x0
+#if ZBB_PRESENT
+        DO_AMO(w, maxu    x1, x5, x4)
+#else
+        DO_AMO(w,
+        move    x1, x5          ;
+        bgeu    x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amomaxu_d:
+#if ZBB_PRESENT
+        DO_AMO(d, maxu    x1, x5, x4)
+#else
+        DO_AMO(d,
+        move    x1, x5          ;
+        bgeu    x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amomin_w:
+        addw    x4, x4, x0
+#if ZBB_PRESENT
+        DO_AMO(w, min     x1, x5, x4)
+#else
+        DO_AMO(w,
+        move    x1, x5          ;
+        ble     x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amomin_d:
+#if ZBB_PRESENT
+        DO_AMO(d, min     x1, x5, x4)
+#else
+        DO_AMO(d,
+        move    x1, x5          ;
+        ble     x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amominu_w:
+        addw    x4, x4, x0
+#if ZBB_PRESENT
+        DO_AMO(w, minu    x1, x5, x4)
+#else
+        DO_AMO(w,
+        move    x1, x5          ;
+        bleu    x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amominu_d:
+#if ZBB_PRESENT
+        DO_AMO(d, minu    x1, x5, x4)
+#else
+        DO_AMO(d,
+        move    x1, x5          ;
+        bleu    x5, x4, 5f      ;
+        move    x1, x4          ;
+5:
+        )
+#endif
+
+_illegal_inst_handler_amoor_w:
+        DO_AMO(w, or      x1, x5, x4)
+
+_illegal_inst_handler_amoor_d:
+        DO_AMO(d, or      x1, x5, x4)
+
+_illegal_inst_handler_amoswap_w:
+        DO_AMO(w, move x1, x4)
+
+_illegal_inst_handler_amoswap_d:
+        DO_AMO(d, move x1, x4)
+
+_illegal_inst_handler_amoxor_w:
+        DO_AMO(w, xor     x1, x5, x4)
+
+_illegal_inst_handler_amoxor_d:
+        DO_AMO(d, xor     x1, x5, x4)
+
+_illegal_inst_handler_return:
+        csrw    mstatus, x8 // Restore mstatus (undo MPRV)
+
+#if NO_AMO_EMULATION_LOCK
+#else
+        /* Clear amo_lock if we had acquired it. */
+        addi    x10, x10, -NUM_TRIES_WITHOUT_LOCK
+        blez    x10, 10f
+        lla     x10, amo_lock
+        sd      x0, (x10)
+10:
+#endif  /* NO_AMO_EMULATION_LOCK */
+
+        /* write rd with value in x5 */
+        lla     x4, write_xr_amo  // x4 = base address of write_xr funcs
+        srli    x3, x9, 7 - JUMP_TABLE_SHIFT  // Align rd idx as table offset
+        andi    x3, x3, 0x1f << JUMP_TABLE_SHIFT  // Isolate aligned rd
+        add     x1, x4, x3             // Apply offset to jump table
+        jalr    x1                     // Call func to write x5 to rd
+
+        addi    x6, x6, 4  // Saved mepc += 4 (skip emulated instruction)
+
+_illegal_inst_handler_mret:
+        csrw    mepc, x6  // Restore mepc
+        csrw    mtvec, x7  // Restore mtvec
+
+        /* Restore working set of XRs */
+        ld      x1, (O_amo_scratch + 0 * 8)(sp)
+        ld      x3, (O_amo_scratch + 2 * 8)(sp)
+        ld      x4, (O_amo_scratch + 3 * 8)(sp)
+        ld      x5, (O_amo_scratch + 4 * 8)(sp)
+        ld      x6, (O_amo_scratch + 5 * 8)(sp)
+        ld      x7, (O_amo_scratch + 6 * 8)(sp)
+        ld      x8, (O_amo_scratch + 7 * 8)(sp)
+        ld      x9, (O_amo_scratch + 8 * 8)(sp)
+        ld      x10, (O_amo_scratch + 9 * 8)(sp)
+        ld      sp, (O_amo_scratch + 1 * 8)(sp) /* restore sp last */
+
+        mret // Return
+
+        .align  2
+_illegal_inst_mtvec_handler:
+        /*
+         * If any exception occurs on a load/store during AMO emulation,
+         * just re-execute the original faulting AMO. This will regenerate
+         * the exception (page fault, access fault) and allow it to
+         * be handled as though from the original context
+         */
+        csrw    mstatus, x8 // Restore mstatus
+
+        csrr    x5, mcause
+
+        li      x1, CAUSE_LOAD_PAGE_FAULT
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        li      x1, CAUSE_STORE_PAGE_FAULT
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        li      x1, CAUSE_GUEST_LOAD_PAGE_FAULT
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        li      x1, CAUSE_GUEST_STORE_PAGE_FAULT
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        li      x1, CAUSE_LOAD_ACCESS
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        li      x1, CAUSE_STORE_ACCESS
+        beq     x5, x1, _illegal_inst_handler_mret
+
+        // An unexpected exception during AMO emulation is fatal.
+        j       fail
+
+/**
+ * This is a table of 32 functions.
+ * Calling the function read_xr_amo + rd * JUMP_TABLE_OFFSET does
+ * x4 = XR[rd]. For xrs where the value is stored in memory by the AMO handler,
+ * do x4 = MEM[address where $rd is stored], which has the equivalent effect.
+ */
+read_xr_amo:
+        li      x4, 0                           ; jr ra
+        ld      x4, (O_amo_scratch + 0 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 1 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 2 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 3 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 4 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 5 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 6 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 7 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 8 * 8)(sp) ; jr ra
+        ld      x4, (O_amo_scratch + 9 * 8)(sp) ; jr ra
+        move    x4, x11                         ; jr ra
+        move    x4, x12                         ; jr ra
+        move    x4, x13                         ; jr ra
+        move    x4, x14                         ; jr ra
+        move    x4, x15                         ; jr ra
+        move    x4, x16                         ; jr ra
+        move    x4, x17                         ; jr ra
+        move    x4, x18                         ; jr ra
+        move    x4, x19                         ; jr ra
+        move    x4, x20                         ; jr ra
+        move    x4, x21                         ; jr ra
+        move    x4, x22                         ; jr ra
+        move    x4, x23                         ; jr ra
+        move    x4, x24                         ; jr ra
+        move    x4, x25                         ; jr ra
+        move    x4, x26                         ; jr ra
+        move    x4, x27                         ; jr ra
+        move    x4, x28                         ; jr ra
+        move    x4, x29                         ; jr ra
+        move    x4, x30                         ; jr ra
+        move    x4, x31                         ; jr ra
+
+/**
+ * This is a table of 32 functions.
+ * Calling the function write_xr_amo + rd * JUMP_TABLE_OFFSET does:
+ * XR[rd] = x5. For xrs which will be restored from memory at the end of
+ * the AMO handler, do MEM[address where $rd is stored] = x5.
+ */
+write_xr_amo:
+        jr      ra                              ; jr ra
+        sd      x5, (O_amo_scratch + 0 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 1 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 2 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 3 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 4 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 5 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 6 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 7 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 8 * 8)(sp) ; jr ra
+        sd      x5, (O_amo_scratch + 9 * 8)(sp) ; jr ra
+        move    x11, x5                         ; jr ra
+        move    x12, x5                         ; jr ra
+        move    x13, x5                         ; jr ra
+        move    x14, x5                         ; jr ra
+        move    x15, x5                         ; jr ra
+        move    x16, x5                         ; jr ra
+        move    x17, x5                         ; jr ra
+        move    x18, x5                         ; jr ra
+        move    x19, x5                         ; jr ra
+        move    x20, x5                         ; jr ra
+        move    x21, x5                         ; jr ra
+        move    x22, x5                         ; jr ra
+        move    x23, x5                         ; jr ra
+        move    x24, x5                         ; jr ra
+        move    x25, x5                         ; jr ra
+        move    x26, x5                         ; jr ra
+        move    x27, x5                         ; jr ra
+        move    x28, x5                         ; jr ra
+        move    x29, x5                         ; jr ra
+        move    x30, x5                         ; jr ra
+        move    x31, x5                         ; jr ra
+
+/**
+ * This is a table of 32 functions.
+ * Calling the function write_xr_rdtime + rd * JUMP_TABLE_OFFSET does:
+ * XR[rd] = x3. For xrs which will be restored from memory@the end of
+ * the rdtime handler, do MEM[address where $rd is stored] = x3.
+ */
+write_xr_rdtime:
+        jr      ra                            ; jr ra
+        sd      x3, O_satp_vsatp_scratch0(sp) ; jr ra
+        j       _write_xr_rdtime_x1           ; jr ra
+        sd      x3, O_satp_vsatp_scratch1(sp) ; jr ra
+        move    x4, x3                        ; jr ra
+        move    x5, x3                        ; jr ra
+        move    x6, x3                        ; jr ra
+        move    x7, x3                        ; jr ra
+        move    x8, x3                        ; jr ra
+        move    x9, x3                        ; jr ra
+        move    x10, x3                       ; jr ra
+        move    x11, x3                       ; jr ra
+        move    x12, x3                       ; jr ra
+        move    x13, x3                       ; jr ra
+        move    x14, x3                       ; jr ra
+        move    x15, x3                       ; jr ra
+        move    x16, x3                       ; jr ra
+        move    x17, x3                       ; jr ra
+        move    x18, x3                       ; jr ra
+        move    x19, x3                       ; jr ra
+        move    x20, x3                       ; jr ra
+        move    x21, x3                       ; jr ra
+        move    x22, x3                       ; jr ra
+        move    x23, x3                       ; jr ra
+        move    x24, x3                       ; jr ra
+        move    x25, x3                       ; jr ra
+        move    x26, x3                       ; jr ra
+        move    x27, x3                       ; jr ra
+        move    x28, x3                       ; jr ra
+        move    x29, x3                       ; jr ra
+        move    x30, x3                       ; jr ra
+        move    x31, x3                       ; jr ra
+_write_xr_rdtime_x1:
+        csrw    mscratch, x3                  ; jr ra
+
+fail:
+        unimp
+
+	.section .sbss
+	.align  6
+	.type   amo_lock, @object
+	.size   amo_lock, 64
+amo_lock:
+        .zero   64
-- 
2.47.1


