From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:39 -0700
Subject: [PATCH v2 10/15] lib: sbi: Add PMU support
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-11-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V SBI v0.3 specification defined a PMU extension to configure/start/stop
the hardware/firmware pmu events.

Implement PMU support in OpenSBI library. The implementation is agnostic of
event to counter mapping & mhpmevent value configuration. That means, it
expects platform hooks will be used to set up the mapping and provide
the mhpmevent value at runtime.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_ecall_interface.h | 138 ++++++-
 include/sbi/sbi_error.h           |   2 +
 include/sbi/sbi_pmu.h             |  73 ++++
 lib/sbi/objects.mk                |   1 +
 lib/sbi/sbi_init.c                |   9 +
 lib/sbi/sbi_pmu.c                 | 600 ++++++++++++++++++++++++++++++
 6 files changed, 822 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_pmu.h
 create mode 100644 lib/sbi/sbi_pmu.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 559a33e7ced0..8fc723bc212c 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -28,6 +28,7 @@
 #define SBI_EXT_RFENCE				0x52464E43
 #define SBI_EXT_HSM				0x48534D
 #define SBI_EXT_SRST				0x53525354
+#define SBI_EXT_PMU				0x504D55
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -91,6 +92,139 @@
 #define SBI_SRST_RESET_REASON_NONE	0x0
 #define SBI_SRST_RESET_REASON_SYSFAIL	0x1
 
+/* SBI function IDs for PMU extension */
+#define SBI_EXT_PMU_NUM_COUNTERS	0x0
+#define SBI_EXT_PMU_COUNTER_GET_INFO	0x1
+#define SBI_EXT_PMU_COUNTER_CFG_MATCH	0x2
+#define SBI_EXT_PMU_COUNTER_START	0x3
+#define SBI_EXT_PMU_COUNTER_STOP	0x4
+#define SBI_EXT_PMU_COUNTER_FW_READ	0x5
+
+/** General pmu event codes specified in SBI PMU extension */
+enum sbi_pmu_hw_generic_events_t {
+	SBI_PMU_HW_NO_EVENT			= 0,
+	SBI_PMU_HW_CPU_CYCLES			= 1,
+	SBI_PMU_HW_INSTRUCTIONS			= 2,
+	SBI_PMU_HW_CACHE_REFERENCES		= 3,
+	SBI_PMU_HW_CACHE_MISSES			= 4,
+	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
+	SBI_PMU_HW_BRANCH_MISSES		= 6,
+	SBI_PMU_HW_BUS_CYCLES			= 7,
+	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
+	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
+	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
+
+	SBI_PMU_HW_GENERAL_MAX,
+};
+
+/**
+ * Generalized hardware cache events:
+ *
+ *       { L1-D, L1-I, LLC, ITLB, DTLB, BPU, NODE } x
+ *       { read, write, prefetch } x
+ *       { accesses, misses }
+ */
+enum sbi_pmu_hw_cache_id {
+	SBI_PMU_HW_CACHE_L1D		= 0,
+	SBI_PMU_HW_CACHE_L1I		= 1,
+	SBI_PMU_HW_CACHE_LL		= 2,
+	SBI_PMU_HW_CACHE_DTLB		= 3,
+	SBI_PMU_HW_CACHE_ITLB		= 4,
+	SBI_PMU_HW_CACHE_BPU		= 5,
+	SBI_PMU_HW_CACHE_NODE		= 6,
+
+	SBI_PMU_HW_CACHE_MAX,
+};
+
+enum sbi_pmu_hw_cache_op_id {
+	SBI_PMU_HW_CACHE_OP_READ	= 0,
+	SBI_PMU_HW_CACHE_OP_WRITE	= 1,
+	SBI_PMU_HW_CACHE_OP_PREFETCH	= 2,
+
+	SBI_PMU_HW_CACHE_OP_MAX,
+};
+
+enum sbi_pmu_hw_cache_op_result_id {
+	SBI_PMU_HW_CACHE_RESULT_ACCESS	= 0,
+	SBI_PMU_HW_CACHE_RESULT_MISS	= 1,
+
+	SBI_PMU_HW_CACHE_RESULT_MAX,
+};
+
+/**
+ * Special "firmware" events provided by the OpenSBI, even if the hardware
+ * does not support performance events. These events are encoded as a raw
+ * event type in Linux kernel perf framework.
+ */
+enum sbi_pmu_fw_event_code_id {
+	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
+	SBI_PMU_FW_MISALIGNED_STORE	= 1,
+	SBI_PMU_FW_ACCESS_LOAD		= 2,
+	SBI_PMU_FW_ACCESS_STORE		= 3,
+	SBI_PMU_FW_ILLEGAL_INSN		= 4,
+	SBI_PMU_FW_SET_TIMER		= 5,
+	SBI_PMU_FW_IPI_SENT		= 6,
+	SBI_PMU_FW_IPI_RECVD		= 7,
+	SBI_PMU_FW_FENCE_I_SENT		= 8,
+	SBI_PMU_FW_FENCE_I_RECVD	= 9,
+	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
+	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
+	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
+	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
+
+	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
+	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
+
+	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
+	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
+	SBI_PMU_FW_MAX,
+};
+
+/** SBI PMU event idx type */
+enum sbi_pmu_event_type_id {
+	SBI_PMU_EVENT_TYPE_HW				= 0x0,
+	SBI_PMU_EVENT_TYPE_HW_CACHE			= 0x1,
+	SBI_PMU_EVENT_TYPE_HW_RAW			= 0x2,
+	SBI_PMU_EVENT_TYPE_FW				= 0xf,
+	SBI_PMU_EVENT_TYPE_MAX,
+};
+
+/** SBI PMU counter type */
+enum sbi_pmu_ctr_type {
+	SBI_PMU_CTR_TYPE_HW = 0,
+	SBI_PMU_CTR_TYPE_FW,
+};
+
+/* Helper macros to decode event idx */
+#define SBI_PMU_EVENT_IDX_OFFSET 20
+#define SBI_PMU_EVENT_IDX_MASK 0xFFFFF
+#define SBI_PMU_EVENT_IDX_CODE_MASK 0xFFFF
+#define SBI_PMU_EVENT_IDX_TYPE_MASK 0xF0000
+#define SBI_PMU_EVENT_RAW_IDX 0x20000
+
+#define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
+
+/* Flags defined for config matching function */
+#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
+#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
+#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
+#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 3)
+#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 6)
+#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 7)
+
+/* Flags defined for counter start function */
+#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+
+/* Flags defined for counter stop function */
+#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+
+/* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
 #define SBI_SPEC_VERSION_MINOR_MASK		0xffffff
@@ -107,8 +241,10 @@
 #define SBI_ERR_DENIED				-4
 #define SBI_ERR_INVALID_ADDRESS			-5
 #define SBI_ERR_ALREADY_AVAILABLE		-6
+#define SBI_ERR_ALREADY_STARTED			-7
+#define SBI_ERR_ALREADY_STOPPED			-8
 
-#define SBI_LAST_ERR				SBI_ERR_ALREADY_AVAILABLE
+#define SBI_LAST_ERR				SBI_ERR_ALREADY_STOPPED
 
 /* clang-format on */
 
diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
index 3655d122006b..dd65e14b6fcd 100644
--- a/include/sbi/sbi_error.h
+++ b/include/sbi/sbi_error.h
@@ -21,6 +21,8 @@
 #define SBI_EDENIED		SBI_ERR_DENIED
 #define SBI_EINVALID_ADDR	SBI_ERR_INVALID_ADDRESS
 #define SBI_EALREADY		SBI_ERR_ALREADY_AVAILABLE
+#define SBI_EALREADY_STARTED	SBI_ERR_ALREADY_STARTED
+#define SBI_EALREADY_STOPPED	SBI_ERR_ALREADY_STOPPED
 
 #define SBI_ENODEV		-1000
 #define SBI_ENOSYS		-1001
diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
new file mode 100644
index 000000000000..b3010cc5c1ce
--- /dev/null
+++ b/include/sbi/sbi_pmu.h
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
+#ifndef __SBI_PMU_H__
+#define __SBI_PMU_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_ecall_interface.h>
+
+/* Event related macros */
+/* Maximum number of hardware events that can mapped by OpenSBI */
+#define SBI_PMU_HW_EVENT_MAX 64
+
+/* Maximum number of firmware events that can mapped by OpenSBI */
+#define SBI_PMU_FW_EVENT_MAX 32
+
+/* Counter related macros */
+#define SBI_PMU_FW_CTR_MAX 16
+#define SBI_PMU_HW_CTR_MAX 32
+#define SBI_PMU_CTR_MAX	   (SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
+
+/** Initialize PMU */
+int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
+
+/** Reset PMU during hart exit */
+void sbi_pmu_exit(struct sbi_scratch *scratch);
+
+/**
+ * Add the hardware event to counter mapping information. This should be called
+ * from the platform code to update the mapping table.
+ * @param eidx_start Start of the event idx range for supported counters
+ * @param eidx_end   End of the event idx range for supported counters
+ * @param cmap       A bitmap representing counters supporting the event range
+ * @return 0 on success, error otherwise.
+ */
+int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
+
+/**
+ * Add the raw hardware event selector and supported counter information. This
+ * should be called from the platform code to update the mapping table.
+ * @param info  a pointer to the hardware event info
+ * @return 0 on success, error otherwise.
+ */
+
+int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap);
+
+int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval);
+
+int sbi_pmu_ctr_stop(unsigned long cidx_base, unsigned long cidx_mask,
+		     unsigned long flag);
+
+int sbi_pmu_ctr_start(unsigned long cidx_base, unsigned long cidx_mask,
+		      unsigned long flags, uint64_t ival);
+
+int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info);
+
+unsigned long sbi_pmu_num_ctr(void);
+
+int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
+			  unsigned long flags, unsigned long event_idx,
+			  uint64_t event_data);
+
+int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 6f2c06f5b501..d9068b707854 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -33,6 +33,7 @@ libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_misaligned_ldst.o
 libsbi-objs-y += sbi_platform.o
+libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_scratch.o
 libsbi-objs-y += sbi_string.o
 libsbi-objs-y += sbi_system.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 65af5705f484..143b98f93c02 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -19,6 +19,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_timer.h>
@@ -252,6 +253,8 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_pmu_init(scratch, TRUE);
+
 	sbi_boot_print_banner(scratch);
 
 	rc = sbi_platform_irqchip_init(plat, TRUE);
@@ -353,6 +356,8 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_pmu_init(scratch, FALSE);
+
 	rc = sbi_platform_irqchip_init(plat, FALSE);
 	if (rc)
 		sbi_hart_hang();
@@ -393,6 +398,8 @@ static void init_warm_resume(struct sbi_scratch *scratch)
 	if (rc)
 		sbi_hart_hang();
 
+	sbi_pmu_init(scratch, FALSE);
+
 	rc = sbi_hart_pmp_configure(scratch);
 	if (rc)
 		sbi_hart_hang();
@@ -516,6 +523,8 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
 
 	sbi_platform_early_exit(plat);
 
+	sbi_pmu_exit(scratch);
+
 	sbi_timer_exit(scratch);
 
 	sbi_ipi_exit(scratch);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
new file mode 100644
index 000000000000..ed519dfcc860
--- /dev/null
+++ b/lib/sbi/sbi_pmu.c
@@ -0,0 +1,600 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Atish Patra <atish.patra@wdc.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+
+/** Information about hardware counters */
+struct sbi_pmu_hw_event {
+	unsigned long counters;
+	unsigned long start_idx;
+	unsigned long end_idx;
+	/* Event selector value used only for raw events */
+	uint64_t select;
+};
+
+/** Representation of a firmware event */
+struct sbi_pmu_fw_event {
+
+	/* Event associated with the particular counter */
+	unsigned long event_idx;
+
+	/* Current value of the counter */
+	unsigned long curr_count;
+
+	/* A flag indicating pmu event monitoring is started */
+	bool bStarted;
+};
+
+/* Information about PMU counters as per SBI specification */
+union sbi_pmu_ctr_info {
+	unsigned long value;
+	struct {
+		unsigned long csr:12;
+		unsigned long width:6;
+#if __riscv_xlen == 32
+		unsigned long reserved:13;
+#else
+		unsigned long reserved:45;
+#endif
+		unsigned long type:1;
+	};
+};
+
+/* Mapping between event range and possible counters  */
+static struct sbi_pmu_hw_event hw_event_map[SBI_PMU_HW_EVENT_MAX] = {0};
+
+/* counter to enabled event mapping */
+static uint32_t active_events[SBI_HARTMASK_MAX_BITS][SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX];
+
+/* Contains all the information about firmwares events */
+static struct sbi_pmu_fw_event fw_event_map[SBI_HARTMASK_MAX_BITS][SBI_PMU_FW_EVENT_MAX] = {0};
+
+/* Maximum number of hardware events available */
+static uint32_t num_hw_events;
+/* Maximum number of hardware counters available */
+static uint32_t num_hw_ctrs;
+
+/* Maximum number of counters available */
+static uint32_t total_ctrs;
+
+/* Helper macros to retrieve event idx and code type */
+#define get_cidx_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
+#define get_cidx_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
+
+/**
+ * Perform a sanity check on event & counter mappings with event range overlap check
+ * @param evtA Pointer to the existing hw event structure
+ * @param evtB Pointer to the new hw event structure
+ *
+ * Return FALSE if the range doesn't overlap, TRUE otherwise
+ */
+static bool pmu_event_range_overlap(struct sbi_pmu_hw_event *evtA,
+				    struct sbi_pmu_hw_event *evtB)
+{
+	/* check if the range of events overlap with a previous entry */
+	if (((evtA->end_idx < evtB->start_idx) && (evtA->end_idx < evtB->end_idx)) ||
+	   ((evtA->start_idx > evtB->start_idx) && (evtA->start_idx > evtB->end_idx)))
+		return FALSE;
+	return TRUE;
+}
+
+static bool pmu_event_select_overlap(struct sbi_pmu_hw_event *evt,
+				     uint64_t select_val)
+{
+
+	if (evt->select == select_val)
+		return TRUE;
+
+	return FALSE;
+}
+
+static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
+{
+	uint32_t event_idx_val;
+	uint32_t event_idx_type;
+	u32 hartid = current_hartid();
+
+	event_idx_val = active_events[hartid][cidx];
+
+	if (cidx >= total_ctrs || (event_idx_val == SBI_PMU_EVENT_IDX_INVALID))
+		return SBI_EINVAL;
+
+	event_idx_type = get_cidx_type(event_idx_val);
+	if (event_idx_type >= SBI_PMU_EVENT_TYPE_MAX)
+		return SBI_EINVAL;
+
+	*event_idx_code = get_cidx_code(event_idx_val);
+
+	return event_idx_type;
+}
+
+static int pmu_ctr_read_fw(uint32_t cidx, unsigned long *cval,
+			       uint32_t fw_evt_code)
+{
+	u32 hartid = current_hartid();
+	struct sbi_pmu_fw_event fevent;
+
+	fevent = fw_event_map[hartid][fw_evt_code];
+	*cval = fevent.curr_count;
+
+	return 0;
+}
+
+/* Add a hardware counter read for completeness for future purpose */
+static int pmu_ctr_read_hw(uint32_t cidx, uint64_t *cval)
+{
+#if __riscv_xlen == 32
+	uint32_t temp, temph = 0;
+
+	temp = csr_read_num(CSR_MCYCLE + cidx);
+	temph = csr_read_num(CSR_MCYCLEH + cidx);
+	*cval = ((uint64_t)temph << 32) | temp;
+#else
+	*cval = csr_read_num(CSR_MCYCLE + cidx);
+#endif
+
+	return 0;
+}
+
+int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
+{
+	int event_idx_type;
+	uint32_t event_code;
+	uint64_t cval64;
+
+	event_idx_type = pmu_ctr_validate(cidx, &event_code);
+	if (event_idx_type < 0)
+		return SBI_EINVAL;
+	else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
+		pmu_ctr_read_fw(cidx, cval, event_code);
+	else
+		pmu_ctr_read_hw(cidx, &cval64);
+
+	return 0;
+}
+
+static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
+				uint64_t select)
+{
+	int i = 0;
+	bool is_overlap;
+	struct sbi_pmu_hw_event *event = &hw_event_map[num_hw_events];
+
+	/* The first two counters are reserved by priv spec */
+	if ((eidx_start == SBI_PMU_HW_CPU_CYCLES && cmap != 0x1) ||
+	    (eidx_start == SBI_PMU_HW_INSTRUCTIONS && cmap != 0x4) ||
+	    (eidx_start > SBI_PMU_HW_INSTRUCTIONS && cmap < 0x08))
+		return SBI_EDENIED;
+
+	if (num_hw_events >= SBI_PMU_HW_EVENT_MAX - 1) {
+		sbi_printf("Can not handle more than %d perf events\n",
+			    SBI_PMU_HW_EVENT_MAX);
+		return SBI_EFAIL;
+	}
+
+	event->start_idx = eidx_start;
+	event->end_idx = eidx_end;
+	event->counters = cmap;
+	event->select = select;
+
+	/* Sanity check */
+	for (i = 0; i < num_hw_events; i++) {
+		if (eidx_start == SBI_PMU_EVENT_RAW_IDX)
+		/* All raw events have same event idx. Just do sanity check on select */
+			is_overlap = pmu_event_select_overlap(&hw_event_map[i], select);
+		else
+			is_overlap = pmu_event_range_overlap(&hw_event_map[i], event);
+		if (is_overlap)
+			return SBI_EINVALID_ADDR;
+	}
+	num_hw_events++;
+
+	return 0;
+}
+
+/**
+ * Logical counter ids are assigned to hardware counters are assigned consecutively.
+ * E.g. counter0 must count MCYCLE where counter2 must count minstret. Similarly,
+ * counterX will mhpmcounterX.
+ */
+int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
+{
+	if ((eidx_start > eidx_end) || eidx_start == SBI_PMU_EVENT_RAW_IDX ||
+	     eidx_end == SBI_PMU_EVENT_RAW_IDX)
+		return SBI_EINVAL;
+
+	return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0);
+}
+
+int sbi_pmu_add_raw_event_counter_map(uint64_t select, u32 cmap)
+{
+	return pmu_add_hw_event_map(SBI_PMU_EVENT_RAW_IDX,
+				    SBI_PMU_EVENT_RAW_IDX, cmap, select);
+}
+
+static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
+{
+#if __riscv_xlen == 32
+	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFF);
+	csr_write_num(CSR_MCYCLEH + cidx, ival >> BITS_PER_LONG);
+#else
+	csr_write_num(CSR_MCYCLE + cidx, ival);
+#endif
+}
+
+static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
+{
+	unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
+	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
+
+	if (cidx > num_hw_ctrs)
+		return SBI_EINVAL;
+
+	if (__test_bit(cidx, &mctr_en) && !__test_bit(cidx, &mctr_inhbt))
+		return SBI_EALREADY_STARTED;
+
+	__set_bit(cidx, &mctr_en);
+	__clear_bit(cidx, &mctr_inhbt);
+
+	if (ival_update)
+		pmu_ctr_write_hw(cidx, ival);
+
+	csr_write(CSR_MCOUNTEREN, mctr_en);
+	csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
+
+	return 0;
+}
+
+static int pmu_ctr_start_fw(uint32_t cidx, uint32_t fw_evt_code,
+			    uint64_t ival, bool ival_update)
+{
+	u32 hartid = current_hartid();
+	struct sbi_pmu_fw_event *fevent;
+
+	fevent = &fw_event_map[hartid][fw_evt_code];
+	if (ival_update)
+		fevent->curr_count = ival;
+	fevent->bStarted = TRUE;
+
+	return 0;
+}
+
+int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
+		      unsigned long flags, uint64_t ival)
+{
+	int event_idx_type;
+	uint32_t event_code;
+	unsigned long ctr_mask = cmask << cbase;
+	int ret = SBI_EINVAL;
+	bool bUpdate = FALSE;
+
+	if (cbase >= total_ctrs)
+		return ret;
+
+	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
+		bUpdate = TRUE;
+
+	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
+		event_idx_type = pmu_ctr_validate(cbase, &event_code);
+		if (event_idx_type < 0)
+			return SBI_EINVAL;
+		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
+			ret = pmu_ctr_start_fw(cbase, event_code, ival, bUpdate);
+		else
+			ret = pmu_ctr_start_hw(cbase, ival, bUpdate);
+	}
+
+	return ret;
+}
+
+static int pmu_ctr_stop_hw(uint32_t cidx)
+{
+	unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
+	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
+
+	if (__test_bit(cidx, &mctr_en) && !__test_bit(cidx, &mctr_inhbt)) {
+		__set_bit(cidx, &mctr_inhbt);
+		__clear_bit(cidx, &mctr_en);
+		csr_write(CSR_MCOUNTEREN, mctr_en);
+		csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
+		return 0;
+	} else
+		return SBI_EALREADY_STOPPED;
+}
+
+static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t fw_evt_code)
+{
+	u32 hartid = current_hartid();
+
+	fw_event_map[hartid][fw_evt_code].bStarted = FALSE;
+
+	return 0;
+}
+
+int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
+		     unsigned long flag)
+{
+	u32 hartid = current_hartid();
+	int ret = SBI_EINVAL;
+	int event_idx_type;
+	uint32_t event_code;
+	unsigned long ctr_mask = cmask << cbase;
+
+	if (cbase >= total_ctrs)
+		return SBI_EINVAL;
+
+	for_each_set_bit_from(cbase, &ctr_mask, total_ctrs) {
+		event_idx_type = pmu_ctr_validate(cbase, &event_code);
+		if (event_idx_type < 0)
+			return SBI_EINVAL;
+
+		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
+			ret = pmu_ctr_stop_fw(cbase, event_code);
+		else
+			ret = pmu_ctr_stop_hw(cbase);
+
+		if (!ret && (flag & SBI_PMU_STOP_FLAG_RESET))
+			active_events[hartid][cbase] = SBI_PMU_EVENT_IDX_INVALID;
+	}
+
+	return ret;
+}
+
+static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
+				    unsigned long eindex, uint64_t data)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	uint64_t mhpmevent_val;
+
+	/* Get the final mhpmevent value to be written from platform */
+	mhpmevent_val = sbi_platform_pmu_xlate_to_mhpmevent(plat, eindex, data);
+
+	if (!mhpmevent_val || ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
+		return SBI_EFAIL;
+
+	/* TODO: The upper 8 bits of mhpmevent is reserved by sscofpmf extension.
+	 * Update those bits based on the flags received from supervisor.
+	 * The OVF bit also should be cleared here in case it was not cleared
+	 * during event stop.
+	 */
+	csr_write_num(CSR_MCOUNTINHIBIT + ctr_idx, mhpmevent_val);
+
+	return 0;
+}
+
+static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask,
+			   unsigned long event_idx, uint64_t data)
+{
+	unsigned long ctr_mask;
+	int i, ret = 0, ctr_idx = SBI_ENOTSUPP;
+	struct sbi_pmu_hw_event *temp;
+	unsigned long mctr_en = csr_read(CSR_MCOUNTEREN);
+	unsigned long mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
+	int evt_idx_code = get_cidx_code(event_idx);
+
+	if (cbase > num_hw_ctrs)
+		return SBI_EINVAL;
+
+	for (i = 0; i < num_hw_events; i++) {
+		temp = &hw_event_map[i];
+		if ((temp->start_idx > event_idx && event_idx < temp->end_idx) ||
+		    (temp->start_idx < event_idx && event_idx > temp->end_idx))
+			continue;
+
+		/* For raw events, event data is used as the select value */
+		if ((event_idx == SBI_PMU_EVENT_RAW_IDX) && temp->select != data)
+			continue;
+
+		ctr_mask = temp->counters & (cmask << cbase);
+		for_each_set_bit_from(cbase, &ctr_mask, SBI_PMU_HW_CTR_MAX) {
+			if (!__test_bit(cbase, &mctr_en) &&
+			    __test_bit(cbase, &mctr_inhbt)) {
+				ctr_idx = cbase;
+				break;
+			}
+		}
+	}
+
+	if (ctr_idx == SBI_ENOTSUPP)
+		return SBI_EFAIL;
+
+	/* No need to update the  event selectors for fixed events */
+	if (evt_idx_code != SBI_PMU_HW_CPU_CYCLES &&
+	    evt_idx_code != SBI_PMU_HW_INSTRUCTIONS)
+		ret = pmu_update_hw_mhpmevent(temp, ctr_idx, event_idx, data);
+
+	if (!ret)
+		ret = ctr_idx;
+
+	return ret;
+}
+
+
+/**
+ * Any firmware counter can map to any firmware event.
+ * Thus, select the first available fw counter after sanity
+ * check.
+ */
+static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask, u32 hartid)
+{
+	int i = 0;
+	int fw_base;
+	unsigned long ctr_mask = cmask << cbase;
+
+	if (cbase <= num_hw_ctrs)
+		fw_base = num_hw_ctrs + 1;
+	else
+		fw_base = cbase;
+
+	for (i = fw_base; i < total_ctrs; i++)
+		if ((active_events[hartid][i] == SBI_PMU_EVENT_IDX_INVALID) &&
+		    ((1UL << i) & ctr_mask))
+			return i;
+
+	return SBI_ENOTSUPP;
+}
+
+int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
+			  unsigned long flags, unsigned long event_idx,
+			  uint64_t event_data)
+{
+	int ctr_idx = SBI_ENOTSUPP;
+	u32 hartid = current_hartid();
+	int event_type = get_cidx_type(event_idx);
+	struct sbi_pmu_fw_event *fevent;
+	uint32_t fw_evt_code;
+	unsigned long tmp = cidx_mask << cidx_base;
+
+	/* Do a basic sanity check of counter base & mask */
+	if (cidx_base >= total_ctrs || __fls(tmp) >= total_ctrs ||
+	    event_type >= SBI_PMU_EVENT_TYPE_MAX)
+		return SBI_EINVAL;
+
+	if (flags & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
+		/* The caller wants to skip the match because it already knows the
+		 * counter idx for the given event. Verify that the counter idx
+		 * is still valid.
+		 */
+		if (active_events[hartid][cidx_base] == SBI_PMU_EVENT_IDX_INVALID)
+			return SBI_EINVAL;
+		ctr_idx = cidx_base;
+		goto skip_match;
+	}
+
+	if (event_type == SBI_PMU_EVENT_TYPE_FW) {
+		/* Any firmware counter can be used track any firmware event */
+		ctr_idx = pmu_ctr_find_fw(cidx_base, cidx_mask, hartid);
+	} else {
+		ctr_idx = pmu_ctr_find_hw(cidx_base, cidx_mask, event_idx, event_data);
+	}
+
+	if (ctr_idx < 0)
+		return SBI_ENOTSUPP;
+
+	active_events[hartid][ctr_idx] = event_idx;
+skip_match:
+	if (event_type == SBI_PMU_EVENT_TYPE_HW) {
+		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
+			pmu_ctr_write_hw(ctr_idx, 0);
+		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
+			pmu_ctr_start_hw(ctr_idx, 0, false);
+	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
+		fw_evt_code = get_cidx_code(event_idx);
+		fevent = &fw_event_map[hartid][fw_evt_code];
+		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
+			fevent->curr_count = 0;
+		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
+			fevent->bStarted = TRUE;
+	}
+
+	return ctr_idx;
+}
+
+inline int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id)
+{
+	u32 hartid = current_hartid();
+	struct sbi_pmu_fw_event *fevent;
+
+	if (unlikely(fw_id >= SBI_PMU_FW_MAX))
+		return SBI_EINVAL;
+
+	fevent = &fw_event_map[hartid][fw_id];
+
+	/* PMU counters will be only enabled during performance debugging */
+	if (unlikely(fevent->bStarted))
+		fevent->curr_count++;
+
+	return 0;
+}
+
+unsigned long sbi_pmu_num_ctr(void)
+{
+	return (num_hw_ctrs + SBI_PMU_FW_CTR_MAX);
+}
+
+int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
+{
+	union sbi_pmu_ctr_info cinfo = {0};
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* Sanity check. Counter1 is not mapped at all */
+	if (cidx >= total_ctrs || cidx == 1)
+		return SBI_EINVAL;
+
+	/* We have 31 HW counters with 31 being the last index(MHPMCOUNTER31) */
+	if (cidx <= num_hw_ctrs) {
+		cinfo.type = SBI_PMU_CTR_TYPE_HW;
+		cinfo.csr = CSR_CYCLE + cidx;
+		/* mcycle & minstret are always 64 bit */
+		if (cidx == 0 || cidx == 2)
+			cinfo.width = 63;
+		else
+			cinfo.width = sbi_hart_mhpm_bits(scratch);
+	} else {
+		/* it's a firmware counter */
+		cinfo.type = SBI_PMU_CTR_TYPE_FW;
+		/* Firmware counters are XLEN bits wide */
+		cinfo.width = BITS_PER_LONG - 1;
+	}
+
+	*ctr_info = cinfo.value;
+
+	return 0;
+}
+
+static void pmu_reset_event_map(u32 hartid)
+{
+	int j;
+
+	/* Initialize the counter to event mapping table */
+	for (j = 0; j < total_ctrs; j++)
+		active_events[hartid][j] = SBI_PMU_EVENT_IDX_INVALID;
+	for (j = 0; j < SBI_PMU_FW_CTR_MAX; j++)
+		sbi_memset(&fw_event_map[hartid][j], 0,
+			   sizeof(struct sbi_pmu_fw_event));
+}
+
+void sbi_pmu_exit(struct sbi_scratch *scratch)
+{
+	u32 hartid = current_hartid();
+
+	csr_write(CSR_MCOUNTINHIBIT, -1);
+	csr_write(CSR_MCOUNTEREN, 2);
+	pmu_reset_event_map(hartid);
+}
+
+int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	const struct sbi_platform *plat;
+
+	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_MCOUNTINHIBIT))
+		return SBI_ENOTSUPP;
+
+	if (cold_boot) {
+		plat = sbi_platform_ptr(scratch);
+		/* Initialize hw pmu events */
+		sbi_platform_pmu_init(plat);
+
+		/* mcycle & minstret is available always */
+		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 2;
+		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
+	}
+
+	pmu_reset_event_map(current_hartid());
+
+	return 0;
+}
-- 
2.25.1


