From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Nov 2022 00:18:59 +0300
Subject: [PATCH RFC v1 1/1] lib: sbi: add support for debug triggers
Message-ID: <20221031211859.910439-1-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

RISC-V Debug specification includes Sdtrig ISA extension.
This extension describes Trigger Module. Triggers can cause
a breakpoint exception, entry into Debug Mode, or a trace
action without having to execute a special instruction. For
native debugging triggers can be used to implement hardware
breakpoints and watchpoints.

Software support for RISC-V hardware triggers consists of the
following major components:
- U-mode: gdb support for setting hw breakpoints/watchpoints
- S/VS-mode: hardware breakpoints framework in Linux kernel
- M-mode: SBI firmware code to handle triggers

SBI Debug Trigger extension proposal (draft v4) has been posted
by Anup Patel to lists.riscv.org tech-debug mailing list:

https://lists.riscv.org/g/tech-debug/topic/92375492

This patch provides initial implementation of SBI Debug
Trigger Extension in OpenSBI library based on the
suggested extension proposal.

Initial implementation has the following limitations:
- only mcontrol6 trigger type is supported
- no support for chained triggers
- trigger update supports only address change

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 include/sbi/riscv_dbtr.h          |  78 ++++++
 include/sbi/riscv_encoding.h      |   1 +
 include/sbi/sbi_dbtr.h            |  79 ++++++
 include/sbi/sbi_ecall_interface.h |  10 +
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   3 +
 lib/sbi/sbi_dbtr.c                | 404 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbtr.c          |  68 +++++
 lib/sbi/sbi_init.c                |   9 +
 9 files changed, 656 insertions(+)
 create mode 100644 include/sbi/riscv_dbtr.h
 create mode 100644 include/sbi/sbi_dbtr.h
 create mode 100644 lib/sbi/sbi_dbtr.c
 create mode 100644 lib/sbi/sbi_ecall_dbtr.c

diff --git a/include/sbi/riscv_dbtr.h b/include/sbi/riscv_dbtr.h
new file mode 100644
index 0000000..e5f6f4e
--- /dev/null
+++ b/include/sbi/riscv_dbtr.h
@@ -0,0 +1,78 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Syntacore
+ *
+ * Authors:
+ *   Sergey Matyukevich <sergey.matyukevich@syntacore.com>
+ *
+ */
+
+#ifndef __RISCV_DBTR_H__
+#define __RISCV_DBTR_H__
+
+#define RV_MAX_TRIGGERS	32
+
+enum {
+	RISCV_DBTR_TRIG_NONE = 0,
+	RISCV_DBTR_TRIG_LEGACY,
+	RISCV_DBTR_TRIG_MCONTROL,
+	RISCV_DBTR_TRIG_ICOUNT,
+	RISCV_DBTR_TRIG_ITRIGGER,
+	RISCV_DBTR_TRIG_ETRIGGER,
+	RISCV_DBTR_TRIG_MCONTROL6,
+};
+
+union riscv_dbtr_tdata1 {
+	unsigned long value;
+	struct {
+#if __riscv_xlen == 64
+		unsigned long data:59;
+#elif __riscv_xlen == 32
+		unsigned long data:27;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+		unsigned long dmode:1;
+		unsigned long type:4;
+	};
+};
+
+union riscv_dbtr_tdata1_mcontrol6 {
+	unsigned long value;
+	struct {
+		unsigned long load:1;
+		unsigned long store:1;
+		unsigned long execute:1;
+		unsigned long u:1;
+		unsigned long s:1;
+		unsigned long _res2:1;
+		unsigned long m:1;
+		unsigned long match:4;
+		unsigned long chain:1;
+		unsigned long action:4;
+		unsigned long size:4;
+		unsigned long timing:1;
+		unsigned long select:1;
+		unsigned long hit:1;
+		unsigned long vu:1;
+		unsigned long vs:1;
+#if __riscv_xlen == 64
+		unsigned long _res1:34;
+#elif __riscv_xlen == 32
+		unsigned long _res1:2;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+		unsigned long dmode:1;
+		unsigned long type:4;
+	};
+};
+
+#define MCONTROL6_U_OFFSET	3
+#define MCONTROL6_S_OFFSET	4
+#define MCONTROL6_M_OFFSET	6
+#define MCONTROL6_VU_OFFSET	23
+#define MCONTROL6_VS_OFFSET	24
+
+#endif /* __RISCV_DBTR_H__ */
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b0f08c8..2041ab7 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -671,6 +671,7 @@
 #define CSR_TDATA1			0x7a1
 #define CSR_TDATA2			0x7a2
 #define CSR_TDATA3			0x7a3
+#define CSR_TINFO			0x7a4
 
 /* Debug Mode Registers */
 #define CSR_DCSR			0x7b0
diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
new file mode 100644
index 0000000..568b5ea
--- /dev/null
+++ b/include/sbi/sbi_dbtr.h
@@ -0,0 +1,79 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Syntacore
+ *
+ * Authors:
+ *   Sergey Matyukevich <sergey.matyukevich@syntacore.com>
+ *
+ */
+
+#ifndef __SBI_DBTR_H__
+#define __SBI_DBTR_H__
+
+#include <sbi/riscv_dbtr.h>
+
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_types.h>
+
+/** Representation of trigger state */
+union sbi_dbtr_trig_state {
+	unsigned long value;
+	struct {
+		unsigned long mapped:1;
+		unsigned long u:1;
+		unsigned long s:1;
+		unsigned long vu:1;
+		unsigned long vs:1;
+#if __riscv_xlen == 64
+		unsigned long reserved:59;
+#elif __riscv_xlen == 32
+		unsigned long reserved:27;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+	};
+};
+
+struct sbi_dbtr_trig_info {
+	unsigned long type_mask;
+	union sbi_dbtr_trig_state state;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+/** SBI shared mem messages layout */
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+} __packed;
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+} __packed;
+
+/** Initialize PMU */
+int sbi_dbtr_init(struct sbi_scratch *scratch);
+
+/** SBI DBTR extension functions */
+int sbi_dbtr_probe(unsigned long *out);
+int sbi_dbtr_num_trig(unsigned long trig_tdata1, unsigned long *out);
+int sbi_dbtr_read_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_idx_base, unsigned long trig_count,
+		unsigned long out_addr_div_by_16);
+int sbi_dbtr_install_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_count, unsigned long in_addr_div_by_16,
+		unsigned long out_addr_div_by_16, unsigned long *out);
+int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask);
+int sbi_dbtr_enable_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask);
+int sbi_dbtr_update_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_count, unsigned long in_addr_div_by_16,
+		unsigned long out_addr_div_by_16);
+int sbi_dbtr_disable_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask);
+
+#endif
diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a3f2bf4..3c1b1ea 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -29,6 +29,7 @@
 #define SBI_EXT_HSM				0x48534D
 #define SBI_EXT_SRST				0x53525354
 #define SBI_EXT_PMU				0x504D55
+#define SBI_EXT_DBTR				0x44425452
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -100,6 +101,15 @@
 #define SBI_EXT_PMU_COUNTER_STOP	0x4
 #define SBI_EXT_PMU_COUNTER_FW_READ	0x5
 
+/* SBI function IDs for DBTR extension */
+#define SBI_EXT_DBTR_NUM_TRIGGERS	0x0
+#define SBI_EXT_DBTR_TRIGGER_READ	0x1
+#define SBI_EXT_DBTR_TRIGGER_INSTALL	0x2
+#define SBI_EXT_DBTR_TRIGGER_UNINSTALL	0x3
+#define SBI_EXT_DBTR_TRIGGER_ENABLE	0x4
+#define SBI_EXT_DBTR_TRIGGER_UPDATE	0x5
+#define SBI_EXT_DBTR_TRIGGER_DISABLE	0x6
+
 /** General pmu event codes specified in SBI PMU extension */
 enum sbi_pmu_hw_generic_events_t {
 	SBI_PMU_HW_NO_EVENT			= 0,
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index df74bba..e3a7955 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -34,4 +34,8 @@ config SBI_ECALL_VENDOR
 	bool "Platform-defined vendor extensions"
 	default y
 
+config SBI_ECALL_DBTR
+	bool "Debug Trigger Extension"
+	default y
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 783c46d..d45a24a 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -25,6 +25,7 @@ carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SRST) += ecall_srst
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_PMU) += ecall_pmu
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_LEGACY) += ecall_legacy
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_DBTR) += ecall_dbtr
 
 libsbi-objs-y += sbi_ecall_base.o
 libsbi-objs-$(CONFIG_SBI_ECALL_HSM) += sbi_ecall_hsm.o
@@ -32,6 +33,7 @@ libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
 libsbi-objs-$(CONFIG_SBI_ECALL_PMU) += sbi_ecall_pmu.o
 libsbi-objs-y += sbi_ecall_replace.o
 libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
+libsbi-objs-$(CONFIG_SBI_ECALL_DBTR) += sbi_ecall_dbtr.o
 
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
@@ -50,6 +52,7 @@ libsbi-objs-y += sbi_irqchip.o
 libsbi-objs-y += sbi_misaligned_ldst.o
 libsbi-objs-y += sbi_platform.o
 libsbi-objs-y += sbi_pmu.o
+libsbi-objs-y += sbi_dbtr.o
 libsbi-objs-y += sbi_scratch.o
 libsbi-objs-y += sbi_string.o
 libsbi-objs-y += sbi_system.o
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
new file mode 100644
index 0000000..943b5fc
--- /dev/null
+++ b/lib/sbi/sbi_dbtr.c
@@ -0,0 +1,404 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Syntacore
+ *
+ * Authors:
+ *   Sergey Matyukevich <sergey.matyukevich@syntacore.com>
+ *
+ */
+
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_csr_detect.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_dbtr.h>
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+
+static struct sbi_dbtr_trig_info triggers[SBI_HARTMASK_MAX_BITS][RV_MAX_TRIGGERS] = {0};
+static uint32_t total_trigs;
+
+static void sbi_triggers_table_init(u32 hartid, int idx, unsigned long type_mask)
+{
+	triggers[hartid][idx].type_mask = type_mask;
+	triggers[hartid][idx].state.value = 0;
+	triggers[hartid][idx].tdata1 = 0;
+	triggers[hartid][idx].tdata2 = 0;
+	triggers[hartid][idx].tdata3 = 0;
+}
+
+int sbi_dbtr_init(struct sbi_scratch *scratch)
+{
+	struct sbi_trap_info trap = {0};
+	u32 hartid = current_hartid();
+	union riscv_dbtr_tdata1 tdata1;
+	unsigned long val;
+	int i;
+
+	total_trigs = 0;
+
+	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+		csr_write_allowed(CSR_TSELECT, (ulong)&trap, i);
+		if (trap.cause)
+			break;
+
+		val = csr_read_allowed(CSR_TSELECT, (ulong)&trap);
+		if (trap.cause)
+			break;
+
+		/* Read back tselect and check that it contains the written value */
+		if (val != i)
+			break;
+
+		val = csr_read_allowed(CSR_TINFO, (ulong)&trap);
+		if (trap.cause) {
+			/**
+			 * If reading tinfo caused an exception, the debugger
+			 * must read tdata1 to discover the type.
+			 */
+			tdata1.value = csr_read_allowed(CSR_TDATA1, (ulong)&trap);
+			if (trap.cause)
+				break;
+
+			if (tdata1.type == 0)
+				break;
+
+
+			sbi_triggers_table_init(hartid, i, BIT(tdata1.type));
+			total_trigs++;
+		} else {
+			if (val == 1)
+				break;
+
+			sbi_triggers_table_init(hartid, i, val);
+			total_trigs++;
+		}
+	}
+
+	return 0;
+}
+
+int sbi_dbtr_probe(unsigned long *out)
+{
+	*out  = total_trigs;
+
+	return 0;
+}
+
+static void dbtr_trigger_enable(unsigned int hartid, unsigned int idx)
+{
+	if (!triggers[hartid][idx].state.mapped)
+		return;
+
+	if (triggers[hartid][idx].state.vu)
+		__set_bit(MCONTROL6_VU_OFFSET, &triggers[hartid][idx].tdata1);
+	else
+		__clear_bit(MCONTROL6_VU_OFFSET, &triggers[hartid][idx].tdata1);
+
+	if (triggers[hartid][idx].state.vs)
+		__set_bit(MCONTROL6_VS_OFFSET, &triggers[hartid][idx].tdata1);
+	else
+		__clear_bit(MCONTROL6_VS_OFFSET, &triggers[hartid][idx].tdata1);
+
+	if (triggers[hartid][idx].state.u)
+		__set_bit(MCONTROL6_U_OFFSET, &triggers[hartid][idx].tdata1);
+	else
+		__clear_bit(MCONTROL6_U_OFFSET, &triggers[hartid][idx].tdata1);
+
+	if (triggers[hartid][idx].state.s)
+		__set_bit(MCONTROL6_S_OFFSET, &triggers[hartid][idx].tdata1);
+	else
+		__clear_bit(MCONTROL6_S_OFFSET, &triggers[hartid][idx].tdata1);
+
+	/*
+	 * RISC-V Debug Support v1.0.0 section 5.5:
+	 * Debugger cannot simply set a trigger by writing tdata1, then tdata2, etc. The current
+	 * value of tdata2 might not be legal with the new value of tdata1. To help with this
+	 * situation, it is guaranteed that writing 0 to tdata1 disables the trigger, and
+	 * leaves it in a state where tdata2 and tdata3 can be written with any value
+	 * that makes sense for any trigger type supported by this trigger.
+	 */
+	csr_write(CSR_TSELECT, idx);
+	csr_write(CSR_TDATA1, 0x0);
+	csr_write(CSR_TDATA2, triggers[hartid][idx].tdata2);
+	csr_write(CSR_TDATA1, triggers[hartid][idx].tdata1);
+}
+
+static void dbtr_trigger_disable(unsigned int hartid, unsigned int idx)
+{
+	if (!triggers[hartid][idx].state.mapped)
+		return;
+
+	__clear_bit(MCONTROL6_VU_OFFSET, &triggers[hartid][idx].tdata1);
+	__clear_bit(MCONTROL6_VS_OFFSET, &triggers[hartid][idx].tdata1);
+	__clear_bit(MCONTROL6_U_OFFSET, &triggers[hartid][idx].tdata1);
+	__clear_bit(MCONTROL6_S_OFFSET, &triggers[hartid][idx].tdata1);
+
+	csr_write(CSR_TSELECT, idx);
+	csr_write(CSR_TDATA1, triggers[hartid][idx].tdata1);
+}
+
+static void dbtr_trigger_clear(unsigned int hartid, unsigned int idx)
+{
+	if (!triggers[hartid][idx].state.mapped)
+		return;
+
+	csr_write(CSR_TSELECT, idx);
+	csr_write(CSR_TDATA1, 0x0);
+	csr_write(CSR_TDATA2, 0x0);
+}
+
+int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
+{
+	unsigned long type = ((union riscv_dbtr_tdata1)data).type;
+	u32 hartid = current_hartid();
+	unsigned long total = 0;
+	int i;
+
+
+	if (data == 0) {
+		sbi_dprintf("%s: hart%d: total triggers: %u\n",
+			    __func__, hartid, total_trigs);
+		*out = total_trigs;
+		return SBI_SUCCESS;
+	}
+
+	for (i = 0; i < total_trigs; i++) {
+		if (__test_bit(type, &triggers[hartid][i].type_mask))
+			total++;
+	}
+
+
+	sbi_dprintf("%s: hart%d: total triggers of type %lu: %lu\n",
+		    __func__, hartid, type, total);
+
+	*out = total;
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_read_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_idx_base, unsigned long trig_count,
+		unsigned long out_addr_div_by_16)
+{
+	unsigned long out_addr = (out_addr_div_by_16 << 4);
+	struct sbi_dbtr_data_msg *xmit;
+	u32 hartid = current_hartid();
+	int i;
+
+	if (smode != PRV_S)
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_check_addr(dom, out_addr, smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+
+	if (trig_idx_base >= total_trigs || trig_idx_base + trig_count >= total_trigs) {
+		sbi_dprintf("%s: hart%d: invalid trigger index\n", __func__, hartid);
+		return SBI_ERR_INVALID_PARAM;
+	}
+
+	for (i = 0; i < trig_count; i++) {
+		xmit = (struct sbi_dbtr_data_msg *)(out_addr + i * sizeof(*xmit));
+
+		sbi_dprintf("%s: hart%d: read trigger %d\n", __func__, hartid, i);
+
+		xmit->tstate = triggers[hartid][i + trig_idx_base].state.value;
+		xmit->tdata1 = triggers[hartid][i + trig_idx_base].tdata1;
+		xmit->tdata2 = triggers[hartid][i + trig_idx_base].tdata2;
+		xmit->tdata3 = triggers[hartid][i + trig_idx_base].tdata3;
+	}
+
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_install_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_count, unsigned long in_addr_div_by_16,
+		unsigned long out_addr_div_by_16, unsigned long *out)
+{
+	unsigned long out_addr = (out_addr_div_by_16 << 4);
+	unsigned long in_addr = (in_addr_div_by_16 << 4);
+	u32 hartid = current_hartid();
+	struct sbi_dbtr_data_msg *recv;
+	struct sbi_dbtr_id_msg *xmit;
+	union riscv_dbtr_tdata1_mcontrol6 ctrl;
+	int i, k;
+
+	if (smode != PRV_S)
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_check_addr(dom, in_addr, smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+	if (dom && !sbi_domain_check_addr(dom, out_addr, smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+
+	/* TODO: check chained triggers configurations */
+
+	/* Check requested triggers configuration */
+	for (k = 0; k < trig_count; k++) {
+		recv = (struct sbi_dbtr_data_msg *)(in_addr + k * sizeof(*recv));
+		ctrl = (union riscv_dbtr_tdata1_mcontrol6)recv->tdata1;
+
+		if (ctrl.type != RISCV_DBTR_TRIG_MCONTROL6) {
+			sbi_dprintf("%s: invalid type of trigger %d\n", __func__, k);
+			*out = k;
+			return SBI_ERR_FAILED;
+		}
+
+		if (ctrl.action || ctrl.dmode || ctrl.m) {
+			sbi_dprintf("%s: invalid configuration of trigger %d\n", __func__, k);
+			*out = k;
+			return SBI_ERR_FAILED;
+		}
+	}
+
+	/* Check if we have enough spare triggers */
+	for (i = 0, k = 0; i < total_trigs; i++) {
+		if (!triggers[hartid][i].state.mapped)
+			k++;
+	}
+
+	if (k < trig_count) {
+		sbi_dprintf("%s: hartid%d: not enough spare triggers\n", __func__, hartid);
+		*out = k;
+		return SBI_ERR_FAILED;
+	}
+
+	/* Install triggers */
+	for (i = 0, k = 0; i < total_trigs; i++) {
+		if (triggers[hartid][i].state.mapped)
+			continue;
+
+		recv = (struct sbi_dbtr_data_msg *)(in_addr + k * sizeof(*recv));
+		xmit = (struct sbi_dbtr_id_msg *)(out_addr + k * sizeof(*xmit));
+
+		sbi_dprintf("%s: hart%d: idx[%d] tdata1[0x%lx] tdata2[0x%lx]\n",
+			    __func__, hartid, i, recv->tdata1, recv->tdata2);
+
+		triggers[hartid][i].tdata1 = recv->tdata1;
+		triggers[hartid][i].tdata2 = recv->tdata2;
+		triggers[hartid][i].tdata3 = recv->tdata3;
+
+		triggers[hartid][i].state.vu =
+			__test_bit(MCONTROL6_VU_OFFSET, &triggers[hartid][i].tdata1);
+		triggers[hartid][i].state.vs =
+			__test_bit(MCONTROL6_VS_OFFSET, &triggers[hartid][i].tdata1);
+		triggers[hartid][i].state.u =
+			__test_bit(MCONTROL6_U_OFFSET, &triggers[hartid][i].tdata1);
+		triggers[hartid][i].state.s =
+			__test_bit(MCONTROL6_S_OFFSET, &triggers[hartid][i].tdata1);
+		triggers[hartid][i].state.mapped = 1;
+
+		dbtr_trigger_enable(hartid, i);
+		xmit->idx = i;
+
+		if (++k >= trig_count)
+			break;
+	}
+
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask)
+{
+	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
+	unsigned long idx = trig_idx_base;
+	u32 hartid = current_hartid();
+
+	sbi_dprintf("%s: hart%d: triggers mask: 0x%lx\n",
+		    __func__, hartid, trig_mask);
+
+	for_each_set_bit_from(idx, &trig_mask, total_trigs) {
+		if (!triggers[hartid][idx].state.mapped) {
+			sbi_dprintf("%s: trigger %lu not mapped\n", __func__, idx);
+			return SBI_ERR_INVALID_PARAM;
+		}
+
+		sbi_dprintf("%s: clear trigger %lu\n", __func__, idx);
+		dbtr_trigger_clear(hartid, idx);
+
+		triggers[hartid][idx].state.value = 0;
+		triggers[hartid][idx].tdata1 = 0;
+		triggers[hartid][idx].tdata2 = 0;
+		triggers[hartid][idx].tdata3 = 0;
+	}
+
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_enable_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask)
+{
+	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
+	unsigned long idx = trig_idx_base;
+	u32 hartid = current_hartid();
+
+	sbi_dprintf("%s: hart%d: triggers mask: 0x%lx\n",
+		    __func__, hartid, trig_mask);
+
+	for_each_set_bit_from(idx, &trig_mask, total_trigs) {
+		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
+		dbtr_trigger_enable(hartid, idx);
+	}
+
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_update_trig(const struct sbi_domain *dom, unsigned long smode,
+		unsigned long trig_idx_base, unsigned long trig_idx_mask,
+		unsigned long in_addr_div_by_16)
+{
+	unsigned long in_addr = (in_addr_div_by_16 << 4);
+	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
+	unsigned long idx = trig_idx_base;
+	u32 hartid = current_hartid();
+	struct sbi_dbtr_data_msg *recv;
+	unsigned long uidx = 0;
+
+	sbi_dprintf("%s: hart%d: triggers mask: 0x%lx\n",
+		    __func__, hartid, trig_mask);
+
+	if (smode != PRV_S)
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
+		return SBI_ERR_DENIED;
+	if (dom && !sbi_domain_check_addr(dom, in_addr, smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+
+	for_each_set_bit_from(idx, &trig_mask, total_trigs) {
+		if (!triggers[hartid][idx].state.mapped) {
+			sbi_dprintf("%s: trigger %lu not mapped\n", __func__, idx);
+			return SBI_ERR_INVALID_PARAM;
+		}
+
+		recv = (struct sbi_dbtr_data_msg *)(in_addr + uidx * sizeof(*recv));
+
+		sbi_dprintf("%s: update trigger %lu: newaddr 0x%lx\n",
+			    __func__, idx, recv->tdata2);
+
+		triggers[hartid][idx].tdata2 = recv->tdata2;
+		dbtr_trigger_enable(hartid, idx);
+		uidx++;
+	}
+
+	return SBI_SUCCESS;
+}
+
+int sbi_dbtr_disable_trig(unsigned long trig_idx_base, unsigned long trig_idx_mask)
+{
+	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
+	unsigned long idx = trig_idx_base;
+	u32 hartid = current_hartid();
+
+	sbi_dprintf("%s: hart%d: triggers mask: 0x%lx\n",
+		    __func__, hartid, trig_mask);
+
+	for_each_set_bit_from(idx, &trig_mask, total_trigs) {
+		sbi_dprintf("%s: disable trigger %lu\n", __func__, idx);
+		dbtr_trigger_disable(hartid, idx);
+	}
+
+	return SBI_SUCCESS;
+}
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
new file mode 100644
index 0000000..d013b3e
--- /dev/null
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -0,0 +1,68 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2022 Syntacore
+ *
+ * Authors:
+ *   Sergey Matyukevich <sergey.matyukevich@syntacore.com>
+ *
+ */
+
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_version.h>
+#include <sbi/sbi_dbtr.h>
+
+static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
+				  const struct sbi_trap_regs *regs,
+				  unsigned long *out_val,
+				  struct sbi_trap_info *out_trap)
+{
+	unsigned long smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
+			MSTATUS_MPP_SHIFT;
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	int ret = 0;
+
+	switch (funcid) {
+	case SBI_EXT_DBTR_NUM_TRIGGERS:
+		ret = sbi_dbtr_num_trig(regs->a0, out_val);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_READ:
+		ret = sbi_dbtr_read_trig(dom, smode, regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_INSTALL:
+		ret = sbi_dbtr_install_trig(dom, smode, regs->a0, regs->a1, regs->a2, out_val);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_UNINSTALL:
+		ret = sbi_dbtr_uninstall_trig(regs->a0, regs->a1);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_ENABLE:
+		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_UPDATE:
+		ret = sbi_dbtr_update_trig(dom, smode, regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_DBTR_TRIGGER_DISABLE:
+		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+	};
+
+	return ret;
+}
+
+static int sbi_ecall_dbtr_probe(unsigned long extid, unsigned long *out_val)
+{
+	return sbi_dbtr_probe(out_val);
+}
+
+struct sbi_ecall_extension ecall_dbtr = {
+	.extid_start = SBI_EXT_DBTR,
+	.extid_end = SBI_EXT_DBTR,
+	.handle = sbi_ecall_dbtr_handler,
+	.probe = sbi_ecall_dbtr_probe,
+};
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a8500e5..956afae 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -21,6 +21,7 @@
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
+#include <sbi/sbi_dbtr.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_timer.h>
@@ -275,6 +276,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_dbtr_init(scratch);
+	if (rc)
+		sbi_hart_hang();
+
 	sbi_boot_print_banner(scratch);
 
 	rc = sbi_irqchip_init(scratch, TRUE);
@@ -380,6 +385,10 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_dbtr_init(scratch);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_irqchip_init(scratch, FALSE);
 	if (rc)
 		sbi_hart_hang();
-- 
2.38.1


