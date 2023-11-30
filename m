From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 30 Nov 2023 10:13:19 +0100
Subject: [RFC PATCH 2/2] lib: sbi: add support for Supervisor Software Events extension
In-Reply-To: <20231130091319.1223849-1-cleger@rivosinc.com>
References: <20231130091319.1223849-1-cleger@rivosinc.com>
Message-ID: <20231130091319.1223849-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This extension [1] allows to deliver events from SBI to supervisor via a
software mecanism. This extensions defines events (either local or
global) which are signaled by the SBI on specific signal sources (IRQ,
traps, etc) and are injected to be executed in supervisor mode.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h |  36 +-
 include/sbi/sbi_error.h           |   4 +
 include/sbi/sbi_sse.h             | 222 +++++++
 lib/sbi/Kconfig                   |   4 +
 lib/sbi/objects.mk                |   4 +
 lib/sbi/sbi_ecall.c               |   7 +-
 lib/sbi/sbi_ecall_sse.c           |  61 ++
 lib/sbi/sbi_init.c                |  13 +
 lib/sbi/sbi_sse.c                 | 963 ++++++++++++++++++++++++++++++
 9 files changed, 1312 insertions(+), 2 deletions(-)
 create mode 100644 include/sbi/sbi_sse.h
 create mode 100644 lib/sbi/sbi_ecall_sse.c
 create mode 100644 lib/sbi/sbi_sse.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 1fe469e..f510039 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -32,6 +32,7 @@
 #define SBI_EXT_DBCN				0x4442434E
 #define SBI_EXT_SUSP				0x53555350
 #define SBI_EXT_CPPC				0x43505043
+#define SBI_EXT_SSE				0x535345
 
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
@@ -290,6 +291,36 @@ enum sbi_cppc_reg_id {
 	SBI_CPPC_NON_ACPI_LAST		= SBI_CPPC_TRANSITION_LATENCY,
 };
 
+/* SBI Function IDs for SSE extension */
+#define SBI_EXT_SSE_GET_ATTR		0x00000000
+#define SBI_EXT_SSE_SET_ATTR		0x00000001
+#define SBI_EXT_SSE_REGISTER		0x00000002
+#define SBI_EXT_SSE_UNREGISTER		0x00000003
+#define SBI_EXT_SSE_ENABLE		0x00000004
+#define SBI_EXT_SSE_DISABLE		0x00000005
+#define SBI_EXT_SSE_COMPLETE		0x00000006
+#define SBI_EXT_SSE_INJECT		0x00000007
+
+/* SBI SSE Event Attributes. */
+#define SBI_SSE_ATTR_STATE		0x00000000
+#define SBI_SSE_ATTR_PRIO		0x00000001
+#define SBI_SSE_ATTR_ALLOW_INJECT	0x00000002
+#define SBI_SSE_ATTR_HART_ID		0x00000003
+#define SBI_SSE_ATTR_PENDING		0x00000004
+
+/* SBI SSE Event IDs. */
+#define SBI_SSE_EVENT_LOCAL_RAS		0x00000000
+#define SBI_SSE_EVENT_GLOBAL_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_ASYNC_PF	0x00010000
+#define SBI_SSE_EVENT_LOCAL_PMU		0x00010001
+#define SBI_SSE_EVENT_LOCAL_DEBUG      	0xffff3fff
+#define SBI_SSE_EVENT_GLOBAL_DEBUG	0xffffbfff
+
+#define SBI_SSE_EVENT_GLOBAL		(1 << 15)
+#define SBI_SSE_EVENT_PLATFORM		(1 << 14)
+
+#define SBI_SSE_COMPLETE_FLAG_EVENT_DISABLE	(1 << 0)
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
@@ -309,8 +340,11 @@ enum sbi_cppc_reg_id {
 #define SBI_ERR_ALREADY_AVAILABLE		-6
 #define SBI_ERR_ALREADY_STARTED			-7
 #define SBI_ERR_ALREADY_STOPPED			-8
+#define SBI_ERR_INVALID_STATE			-10
+#define SBI_ERR_BAD_RANGE			-11
+#define SBI_ERR_BUSY				-12
 
-#define SBI_LAST_ERR				SBI_ERR_ALREADY_STOPPED
+#define SBI_LAST_ERR				SBI_ERR_BUSY
 
 /* clang-format on */
 
diff --git a/include/sbi/sbi_error.h b/include/sbi/sbi_error.h
index dd65e14..3cff248 100644
--- a/include/sbi/sbi_error.h
+++ b/include/sbi/sbi_error.h
@@ -23,6 +23,9 @@
 #define SBI_EALREADY		SBI_ERR_ALREADY_AVAILABLE
 #define SBI_EALREADY_STARTED	SBI_ERR_ALREADY_STARTED
 #define SBI_EALREADY_STOPPED	SBI_ERR_ALREADY_STOPPED
+#define SBI_EINVALID_STATE	SBI_ERR_INVALID_STATE
+#define SBI_EBAD_RANGE		SBI_ERR_BAD_RANGE
+#define SBI_EBUSY		SBI_ERR_BUSY
 
 #define SBI_ENODEV		-1000
 #define SBI_ENOSYS		-1001
@@ -34,6 +37,7 @@
 #define SBI_ETRAP		-1007
 #define SBI_EUNKNOWN		-1008
 #define SBI_ENOENT		-1009
+#define SBI_EJUMP		-1010
 
 /* clang-format on */
 
diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
new file mode 100644
index 0000000..e3a49a5
--- /dev/null
+++ b/include/sbi/sbi_sse.h
@@ -0,0 +1,222 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Rivos Systems.
+ */
+
+#ifndef __SBI_SSE_H__
+#define __SBI_SSE_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+#include <sbi/riscv_locks.h>
+
+struct sbi_scratch;
+
+#define EXC_MODE_PP_SHIFT		0
+#define EXC_MODE_PP			BIT(EXC_MODE_PP_SHIFT)
+#define EXC_MODE_PV_SHIFT		1
+#define EXC_MODE_PV			BIT(EXC_MODE_PV_SHIFT)
+#define EXC_MODE_SSTATUS_SPIE_SHIFT	2
+#define EXC_MODE_SSTATUS_SPIE		BIT(EXC_MODE_SSTATUS_SPIE_SHIFT)
+
+struct sse_entry_state {
+	/** Entry program counter */
+	unsigned long pc;
+	/** ra register state */
+	unsigned long ra;
+	/** sp register state */
+	unsigned long sp;
+	/** gp register state */
+	unsigned long gp;
+	/** tp register state */
+	unsigned long tp;
+	/** t0 register state */
+	unsigned long t0;
+	/** t1 register state */
+	unsigned long t1;
+	/** t2 register state */
+	unsigned long t2;
+	/** s0 register state */
+	unsigned long s0;
+	/** s1 register state */
+	unsigned long s1;
+	/** a0 register state */
+	unsigned long a0;
+	/** a1 register state */
+	unsigned long a1;
+	/** a2 register state */
+	unsigned long a2;
+	/** a3 register state */
+	unsigned long a3;
+	/** a4 register state */
+	unsigned long a4;
+	/** a5 register state */
+	unsigned long a5;
+	/** a6 register state */
+	unsigned long a6;
+	/** a7 register state */
+	unsigned long a7;
+	/** s2 register state */
+	unsigned long s2;
+	/** s3 register state */
+	unsigned long s3;
+	/** s4 register state */
+	unsigned long s4;
+	/** s5 register state */
+	unsigned long s5;
+	/** s6 register state */
+	unsigned long s6;
+	/** s7 register state */
+	unsigned long s7;
+	/** s8 register state */
+	unsigned long s8;
+	/** s9 register state */
+	unsigned long s9;
+	/** s10 register state */
+	unsigned long s10;
+	/** s11 register state */
+	unsigned long s11;
+	/** t3 register state */
+	unsigned long t3;
+	/** t4 register state */
+	unsigned long t4;
+	/** t5 register state */
+	unsigned long t5;
+	/** t6 register state */
+	unsigned long t6;
+};
+
+struct sse_interrupted_state {
+	/** Interrupted program counter */
+	unsigned long pc;
+	/** ra register state */
+	unsigned long ra;
+	/** sp register state */
+	unsigned long sp;
+	/** gp register state */
+	unsigned long gp;
+	/** tp register state */
+	unsigned long tp;
+	/** t0 register state */
+	unsigned long t0;
+	/** t1 register state */
+	unsigned long t1;
+	/** t2 register state */
+	unsigned long t2;
+	/** s0 register state */
+	unsigned long s0;
+	/** s1 register state */
+	unsigned long s1;
+	/** a0 register state */
+	unsigned long a0;
+	/** a1 register state */
+	unsigned long a1;
+	/** a2 register state */
+	unsigned long a2;
+	/** a3 register state */
+	unsigned long a3;
+	/** a4 register state */
+	unsigned long a4;
+	/** a5 register state */
+	unsigned long a5;
+	/** a6 register state */
+	unsigned long a6;
+	/** a7 register state */
+	unsigned long a7;
+	/** s2 register state */
+	unsigned long s2;
+	/** s3 register state */
+	unsigned long s3;
+	/** s4 register state */
+	unsigned long s4;
+	/** s5 register state */
+	unsigned long s5;
+	/** s6 register state */
+	unsigned long s6;
+	/** s7 register state */
+	unsigned long s7;
+	/** s8 register state */
+	unsigned long s8;
+	/** s9 register state */
+	unsigned long s9;
+	/** s10 register state */
+	unsigned long s10;
+	/** s11 register state */
+	unsigned long s11;
+	/** t3 register state */
+	unsigned long t3;
+	/** t4 register state */
+	unsigned long t4;
+	/** t5 register state */
+	unsigned long t5;
+	/** t6 register state */
+	unsigned long t6;
+	/** Exception mode */
+	unsigned long exc_mode;
+};
+
+struct sbi_sse_handler_ctx {
+	struct sse_entry_state entry;
+	struct sse_interrupted_state interrupted;
+};
+
+enum sbi_sse_state {
+	SSE_STATE_UNUSED = 0,
+	SSE_STATE_REGISTERED = 1,
+	SSE_STATE_ENABLED = 2,
+	SSE_STATE_RUNNING = 3,
+};
+
+struct sbi_sse_cb_ops {
+	/**
+	 * Called when hart_id is changed on the event.
+	 */
+	void (*set_hartid_cb)(uint32_t event_id, unsigned long hart_id);
+
+	/**
+	 * Called when the SBI_EXT_SSE_COMPLETE is invoked on the event.
+	 */
+	void (*complete_cb)(uint32_t event_id);
+
+	/**
+	 * Called when the SBI_EXT_SSE_REGISTER is invoked on the event.
+	 */
+	void (*register_cb)(uint32_t event_id);
+
+	/**
+	 * Called when the SBI_EXT_SSE_UNREGISTER is invoked on the event.
+	 */
+	void (*unregister_cb)(uint32_t event_id);
+};
+
+/* Set the callback operations for an event
+ * @param event_id Event identifier (SBI_SSE_EVENT_*)
+ * @param cb_ops Callback operations
+ * @return 0 on success, error otherwise
+ */
+int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops);
+
+/* Inject an event to the current hard
+ * @param event_id Event identifier (SBI_SSE_EVENT_*)
+ * @param regs Registers that were used on SBI entry
+ * @return 0 on success, error otherwise
+ */
+int sbi_sse_inject_event(uint32_t event_id, struct sbi_trap_regs *regs);
+
+int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot);
+void sbi_sse_exit(struct sbi_scratch *scratch);
+
+/* Interface called from sbi_ecall_sse.c */
+int sbi_sse_get_attr(uint32_t event_id, uint32_t attr_id, unsigned long *out_val);
+int sbi_sse_set_attr(uint32_t event_id, uint32_t attr_id, unsigned long value);
+int sbi_sse_register(uint32_t event_id, unsigned long phys_hi, unsigned long phys_lo);
+int sbi_sse_unregister(uint32_t event_id);
+int sbi_sse_enable(uint32_t event_id);
+int sbi_sse_disable(uint32_t event_id);
+int sbi_sse_complete(uint32_t event_id, uint32_t status, uint32_t flags,
+		     struct sbi_trap_regs *regs);
+int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hart_id,
+			      struct sbi_trap_regs *regs);
+
+#endif
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 477775e..1b713e9 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -46,4 +46,8 @@ config SBI_ECALL_VENDOR
 	bool "Platform-defined vendor extensions"
 	default y
 
+config SBI_ECALL_SSE
+       bool "SSE extension"
+       default y
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c699187..011c824 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -52,6 +52,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
 libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_SSE) += ecall_sse
+libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
@@ -71,6 +74,7 @@ libsbi-objs-y += sbi_misaligned_ldst.o
 libsbi-objs-y += sbi_platform.o
 libsbi-objs-y += sbi_pmu.o
 libsbi-objs-y += sbi_scratch.o
+libsbi-objs-y += sbi_sse.o
 libsbi-objs-y += sbi_string.o
 libsbi-objs-y += sbi_system.o
 libsbi-objs-y += sbi_timer.o
diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 3eb4f0a..e7c1d1b 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -116,7 +116,12 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 		ret = SBI_ENOTSUPP;
 	}
 
-	if (ret == SBI_ETRAP) {
+	if (ret == SBI_EJUMP) {
+		/* We don't want to modify register content since they could
+		 * have been modified by the handler.
+		 */
+		return 0;
+	} else if (ret == SBI_ETRAP) {
 		trap.epc = regs->mepc;
 		sbi_trap_redirect(regs, &trap);
 	} else {
diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
new file mode 100644
index 0000000..4ee35a2
--- /dev/null
+++ b/lib/sbi/sbi_ecall_sse.c
@@ -0,0 +1,61 @@
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_sse.h>
+
+static int sbi_ecall_sse_handler(unsigned long extid, unsigned long funcid,
+				 const struct sbi_trap_regs *regs,
+				 unsigned long *out_val,
+				 struct sbi_trap_info *out_trap)
+{
+	int ret;
+	unsigned long temp;
+
+	switch (funcid) {
+	case SBI_EXT_SSE_GET_ATTR:
+		ret = sbi_sse_get_attr(regs->a0, regs->a1, &temp);
+		if (ret == 0)
+			*out_val = temp;
+		break;
+	case SBI_EXT_SSE_SET_ATTR:
+		ret = sbi_sse_set_attr(regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_SSE_REGISTER:
+		ret = sbi_sse_register(regs->a0, regs->a1, regs->a2);
+		break;
+	case SBI_EXT_SSE_UNREGISTER:
+		ret = sbi_sse_unregister(regs->a0);
+		break;
+	case SBI_EXT_SSE_ENABLE:
+		ret = sbi_sse_enable(regs->a0);
+		break;
+	case SBI_EXT_SSE_DISABLE:
+		ret = sbi_sse_disable(regs->a0);
+		break;
+	case SBI_EXT_SSE_COMPLETE:
+		ret = sbi_sse_complete(regs->a0, regs->a1, regs->a2,
+				       (struct sbi_trap_regs *) regs);
+		break;
+	case SBI_EXT_SSE_INJECT:
+		ret = sbi_sse_inject_from_ecall(regs->a0, regs->a1,
+						(struct sbi_trap_regs *) regs);
+		break;
+	default:
+		ret = SBI_ENOTSUPP;
+	}
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_sse;
+
+static int sbi_ecall_sse_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_sse);
+}
+
+struct sbi_ecall_extension ecall_sse = {
+	.extid_start		= SBI_EXT_SSE,
+	.extid_end		= SBI_EXT_SSE,
+	.register_extensions	= sbi_ecall_sse_register_extensions,
+	.handle			= sbi_ecall_sse_handler,
+};
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index e723553..5aa9992 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -23,6 +23,7 @@
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
+#include <sbi/sbi_sse.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_timer.h>
@@ -312,6 +313,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+        rc = sbi_sse_init(scratch, true);
+        if (rc) {
+                sbi_printf("%s: sse init failed (error %d)\n", __func__, rc);
+                sbi_hart_hang();
+        }
+
 	rc = sbi_pmu_init(scratch, true);
 	if (rc) {
 		sbi_printf("%s: pmu init failed (error %d)\n",
@@ -432,6 +439,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_sse_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_pmu_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
@@ -636,6 +647,8 @@ void __noreturn sbi_exit(struct sbi_scratch *scratch)
 
 	sbi_platform_early_exit(plat);
 
+	sbi_sse_exit(scratch);
+
 	sbi_pmu_exit(scratch);
 
 	sbi_timer_exit(scratch);
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
new file mode 100644
index 0000000..7b6be7d
--- /dev/null
+++ b/lib/sbi/sbi_sse.c
@@ -0,0 +1,963 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2023 Rivos Systems Inc.
+ *
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_fifo.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_hsm.h>
+#include <sbi/sbi_ipi.h>
+#include <sbi/sbi_list.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
+#include <sbi/sbi_sse.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_trap.h>
+
+#include <sbi/sbi_console.h>
+
+#define sse_get_hart_state_ptr(__scratch)	\
+	sbi_scratch_read_type((__scratch), void *, shs_ptr_off)
+
+#define sse_thishart_state_ptr()		\
+	sse_get_hart_state_ptr(sbi_scratch_thishart_ptr())
+
+#define sse_set_hart_state_ptr(__scratch, __sse_state)	\
+	sbi_scratch_write_type((__scratch), void *, shs_ptr_off, (__sse_state))
+
+/*
+ * Rather than using memcpy to copy the context (which does it byte-per-byte),
+ * copy each field which generates ld/lw.
+ */
+#define regs_copy(dst, src) \
+	dst->ra = src->ra; \
+	dst->sp = src->sp; \
+	dst->gp = src->gp; \
+	dst->tp = src->tp; \
+	dst->t0 = src->t0; \
+	dst->t1 = src->t1; \
+	dst->t2 = src->t2; \
+	dst->s0 = src->s0; \
+	dst->s1 = src->s1; \
+	dst->a0 = src->a0; \
+	dst->a1 = src->a1; \
+	dst->a2 = src->a2; \
+	dst->a3 = src->a3; \
+	dst->a4 = src->a4; \
+	dst->a5 = src->a5; \
+	dst->a6 = src->a6; \
+	dst->a7 = src->a7; \
+	dst->s2 = src->s2; \
+	dst->s3 = src->s3; \
+	dst->s4 = src->s4; \
+	dst->s5 = src->s5; \
+	dst->s6 = src->s6; \
+	dst->s7 = src->s7; \
+	dst->s8 = src->s8; \
+	dst->s9 = src->s9; \
+	dst->s10 = src->s10; \
+	dst->s11 = src->s11; \
+	dst->t3 = src->t3; \
+	dst->t4 = src->t4; \
+	dst->t5 = src->t5; \
+	dst->t6 = src->t6
+
+#define EVENT_IS_GLOBAL(__event_id)	((__event_id) & SBI_SSE_EVENT_GLOBAL)
+
+#define EVENT_COUNT	array_size(supported_events)
+
+static const uint32_t supported_events[] =
+{
+	SBI_SSE_EVENT_LOCAL_RAS,
+	SBI_SSE_EVENT_LOCAL_PMU,
+	SBI_SSE_EVENT_LOCAL_ASYNC_PF,
+	SBI_SSE_EVENT_LOCAL_DEBUG,
+	SBI_SSE_EVENT_GLOBAL_RAS,
+	SBI_SSE_EVENT_GLOBAL_DEBUG,
+};
+
+struct sse_ipi_inject_data {
+	uint32_t event_id;
+};
+
+struct sbi_sse_event {
+	enum sbi_sse_state state;
+	bool pending;
+	uint32_t event_id;
+	struct sbi_sse_handler_ctx *ctx;
+	uint32_t prio;
+	unsigned int hartid;
+	const struct sbi_sse_cb_ops *cb_ops;
+	struct sbi_dlist node;
+	spinlock_t lock;
+};
+
+struct sse_hart_state {
+	struct sbi_dlist event_list;
+	spinlock_t list_lock;
+	struct sbi_sse_event *local_events;
+};
+
+static unsigned int local_event_count;
+static unsigned int global_event_count;
+static struct sbi_sse_event *global_events;
+
+static unsigned long sse_inject_fifo_off;
+static unsigned long sse_inject_fifo_mem_off;
+/* Offset of pointer to SSE HART state in scratch space */
+static unsigned long shs_ptr_off;
+
+static u32 sse_ipi_inject_event = SBI_IPI_EVENT_MAX;
+
+static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id);
+
+static bool sse_event_is_global(struct sbi_sse_event *e)
+{
+	return EVENT_IS_GLOBAL(e->event_id);
+}
+
+static void sse_event_lock(struct sbi_sse_event *e)
+{
+	if (sse_event_is_global(e))
+		spin_lock(&e->lock);
+}
+
+static void sse_event_unlock(struct sbi_sse_event *e)
+{
+	if (sse_event_is_global(e))
+		spin_unlock(&e->lock);
+}
+
+static void sse_event_set_state(struct sbi_sse_event *e,
+				enum sbi_sse_state new_state)
+{
+	enum sbi_sse_state prev_state = e->state;
+
+	e->state = new_state;
+	switch (new_state) {
+		case SSE_STATE_UNUSED:
+			if (prev_state == SSE_STATE_REGISTERED)
+				return;
+		break;
+		case SSE_STATE_REGISTERED:
+			if (prev_state == SSE_STATE_UNUSED ||
+			    prev_state == SSE_STATE_ENABLED) {
+				return;
+			}
+		break;
+		case SSE_STATE_ENABLED:
+			if (prev_state == SSE_STATE_REGISTERED ||
+			    prev_state == SSE_STATE_RUNNING)
+				return;
+		break;
+		case SSE_STATE_RUNNING:
+			if (prev_state == SSE_STATE_ENABLED)
+				return;
+		break;
+	}
+
+	sbi_panic("Invalid SSE state transition: %d -> %d\n", prev_state,
+		  new_state);
+}
+
+static struct sbi_sse_event *sse_event_get(uint32_t event)
+{
+	unsigned int i;
+	struct sbi_sse_event *events, *e;
+	unsigned int count;
+	struct sse_hart_state *shs;
+
+	if (EVENT_IS_GLOBAL(event)) {
+		count = global_event_count;
+		events = global_events;
+	} else {
+		count = local_event_count;
+		shs = sse_thishart_state_ptr();
+		events = shs->local_events;
+	}
+
+	for (i = 0; i < count; i++) {
+		e = &events[i];
+		if (e->event_id == event)
+			return e;
+	}
+
+	return NULL;
+}
+
+static int sse_event_get_attr(struct sbi_sse_event *e, uint32_t attr_id,
+			      unsigned long *out_val)
+{
+	int ret;
+
+	switch (attr_id) {
+	case SBI_SSE_ATTR_STATE:
+		*out_val = e->state;
+		ret = 0;
+		break;
+	case SBI_SSE_ATTR_PRIO:
+		*out_val = e->prio;
+		ret = 0;
+		break;
+	case SBI_SSE_ATTR_ALLOW_INJECT:
+		*out_val = 1;
+		ret = 0;
+		break;
+	case SBI_SSE_ATTR_HART_ID:
+		*out_val = e->hartid;
+		ret = 0;
+		break;
+	case SBI_SSE_ATTR_PENDING:
+		*out_val = e->pending;
+		ret = 0;
+		break;
+	default:
+		ret = SBI_EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void sse_event_remove_from_list(struct sbi_sse_event *e)
+{
+	struct sbi_scratch *scratch = sbi_hartid_to_scratch(e->hartid);
+	struct sse_hart_state *state = sse_get_hart_state_ptr(scratch);
+
+	spin_lock(&state->list_lock);
+	sbi_list_del(&e->node);
+	spin_unlock(&state->list_lock);
+}
+
+static void sse_event_add_to_list(struct sbi_sse_event *e)
+{
+	struct sbi_scratch *scratch = sbi_hartid_to_scratch(e->hartid);
+	struct sse_hart_state *state = sse_get_hart_state_ptr(scratch);
+	struct sbi_sse_event *tmp;
+
+	spin_lock(&state->list_lock);
+	sbi_list_for_each_entry(tmp, &state->event_list, node) {
+		if (e->prio < tmp->prio)
+			break;
+		if (e->prio == tmp->prio && e->event_id < tmp->event_id)
+			break;
+	}
+	sbi_list_add_tail(&e->node, &tmp->node);
+
+	spin_unlock(&state->list_lock);
+}
+
+static int sse_event_disable(struct sbi_sse_event *e)
+{
+	if (e->state != SSE_STATE_ENABLED)
+		return SBI_EINVALID_STATE;
+
+	sse_event_remove_from_list(e);
+	sse_event_set_state(e, SSE_STATE_REGISTERED);
+
+	return SBI_OK;
+}
+
+static int sse_event_set_hart_id(struct sbi_sse_event *e, uint32_t event_id,
+				 unsigned long new_hartid)
+{
+	int hstate;
+	unsigned int hartid = (uint32_t) new_hartid;
+	struct sbi_domain * hd = sbi_domain_thishart_ptr();
+
+	if (!sse_event_is_global(e))
+		return SBI_EDENIED;
+
+	if (e->state == SSE_STATE_RUNNING)
+		return SBI_EBUSY;
+
+	if (!sbi_domain_is_assigned_hart(hd, new_hartid))
+		return SBI_EINVAL;
+
+	hstate = sbi_hsm_hart_get_state(hd, hartid);
+	if (hstate != SBI_HSM_STATE_STARTED)
+		return SBI_EINVAL;
+
+	if (new_hartid == e->hartid)
+		return SBI_OK;
+
+	if (e->state >= SSE_STATE_ENABLED)
+		sse_event_remove_from_list(e);
+
+	e->hartid = hartid;
+
+	if (e->cb_ops && e->cb_ops->set_hartid_cb)
+		 e->cb_ops->set_hartid_cb(event_id, e->hartid);
+
+	if (e->state >= SSE_STATE_ENABLED)
+		sse_event_add_to_list(e);
+
+	if (e->pending)
+		sbi_ipi_send_many(BIT(e->hartid), 0, sse_ipi_inject_event, NULL);
+
+	return 0;
+}
+
+static int sse_event_set_attr(struct sbi_sse_event *e, uint32_t event_id,
+			      uint32_t attr_id, unsigned long val)
+{
+	int ret;
+
+	switch (attr_id) {
+	case SBI_SSE_ATTR_PENDING:
+	case SBI_SSE_ATTR_STATE:
+	case SBI_SSE_ATTR_ALLOW_INJECT:
+		/* Read-only */
+		ret = SBI_EDENIED;
+		break;
+	case SBI_SSE_ATTR_PRIO:
+		if (e->state >= SSE_STATE_ENABLED) {
+			ret = SBI_EINVALID_STATE;
+		} else {
+			e->prio = (uint32_t)val;
+			ret = 0;
+		}
+		break;
+	case SBI_SSE_ATTR_HART_ID:
+		ret = sse_event_set_hart_id(e, event_id, val);
+		break;
+	default:
+		ret = SBI_EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int sse_event_register(struct sbi_sse_event *e,
+			      struct sbi_sse_handler_ctx *ctx)
+{
+	if (sse_event_is_global(e) && e->hartid != current_hartid())
+		return SBI_EINVAL;
+
+	if (e->state != SSE_STATE_UNUSED)
+		return SBI_EINVALID_STATE;
+
+	e->ctx = ctx;
+	sse_event_set_state(e, SSE_STATE_REGISTERED);
+
+	return 0;
+}
+
+static int sse_event_unregister(struct sbi_sse_event *e)
+{
+	if (e->state != SSE_STATE_REGISTERED)
+		return SBI_EINVALID_STATE;
+
+	sse_event_set_state(e, SSE_STATE_UNUSED);
+	e->ctx = NULL;
+
+	return 0;
+}
+
+static void sse_event_inject(struct sbi_sse_event *e,
+			     struct sbi_sse_event *prev_e,
+			     struct sbi_trap_regs *regs)
+{
+	ulong prev_smode, prev_virt;
+	struct sse_interrupted_state *i_ctx = &e->ctx->interrupted, *prev_i_ctx;
+	struct sse_entry_state *e_ctx = &e->ctx->entry;
+
+	sse_event_set_state(e, SSE_STATE_RUNNING);
+	e->pending = false;
+
+	if (prev_e) {
+		/* We are injected right after another event, copy previous
+		 * event context for correct restoration
+		 */
+		prev_i_ctx = &prev_e->ctx->interrupted;
+
+		regs_copy(i_ctx, prev_i_ctx);
+		i_ctx->exc_mode = prev_i_ctx->exc_mode;
+		i_ctx->pc = prev_i_ctx->pc;
+	} else {
+		regs_copy(i_ctx, regs);
+
+		prev_smode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
+	#if __riscv_xlen == 32
+		prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? 1 : 0;
+	#else
+		prev_virt = (regs->mstatus & MSTATUS_MPV) ? 1 : 0;
+	#endif
+
+		i_ctx->exc_mode = prev_smode << EXC_MODE_PP_SHIFT;
+		i_ctx->exc_mode |= prev_virt << EXC_MODE_PV_SHIFT;
+		if (regs->mstatus & MSTATUS_SPIE)
+			i_ctx->exc_mode |= EXC_MODE_SSTATUS_SPIE;
+		i_ctx->pc = regs->mepc;
+
+		/* We only want to set SPIE for the first event injected after
+		 * entering M-Mode. For the event injected right after another
+		 * event (after calling sse_event_complete(), we will keep the
+		 * saved SPIE).
+		 */
+		regs->mstatus &= ~MSTATUS_SPIE;
+		if (regs->mstatus & MSTATUS_SIE)
+			regs->mstatus |= MSTATUS_SPIE;
+	}
+
+	regs_copy(regs, e_ctx);
+	regs->mepc = e_ctx->pc;
+
+	regs->mstatus &= ~MSTATUS_MPP;
+	regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
+
+	#if __riscv_xlen == 32
+		regs->mstatusH &= ~MSTATUSH_MPV;
+	#else
+		regs->mstatus &= ~MSTATUS_MPV;
+	#endif
+
+	regs->mstatus &= ~MSTATUS_SIE;
+}
+
+static int sse_event_resume(struct sbi_sse_event *e, struct sbi_trap_regs *regs)
+{
+	struct sse_interrupted_state *i_ctx = &e->ctx->interrupted;
+
+	regs_copy(regs, i_ctx);
+
+	/* Restore previous virtualization state */
+#if __riscv_xlen == 32
+	regs->mstatusH &= ~MSTATUSH_MPV;
+	if (i_ctx->exc_mode & EXC_MODE_PV)
+		regs->mstatusH |= MSTATUSH_MPV;
+#else
+	regs->mstatus &= ~MSTATUS_MPV;
+	if (i_ctx->exc_mode & EXC_MODE_PV)
+		regs->mstatus |= MSTATUS_MPV;
+#endif
+
+	regs->mstatus &= ~MSTATUS_MPP;
+	if (i_ctx->exc_mode & EXC_MODE_PP)
+		regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
+
+	regs->mstatus &= ~MSTATUS_SIE;
+	if (regs->mstatus & MSTATUS_SPIE)
+		regs->mstatus |= MSTATUS_SIE;
+
+	regs->mstatus &= ~MSTATUS_SPIE;
+	if (i_ctx->exc_mode & EXC_MODE_SSTATUS_SPIE)
+		regs->mstatus |= MSTATUS_SPIE;
+
+	regs->mepc = i_ctx->pc;
+
+	return SBI_EJUMP;
+}
+
+static bool event_is_ready(struct sbi_sse_event *e)
+{
+	if (!e->pending || e->state == SSE_STATE_RUNNING ||
+	    e->hartid != current_hartid()) {
+		return false;
+	}
+
+	return true;
+}
+
+static int sse_process_pending_events(struct sbi_sse_event *prev_e,
+				      struct sbi_trap_regs *regs)
+{
+	int ret = SBI_OK;
+	struct sbi_sse_event *e, *to_run = NULL;
+	struct sse_hart_state *state = sse_thishart_state_ptr();
+
+retry:
+	spin_lock(&state->list_lock);
+	sbi_list_for_each_entry(e, &state->event_list, node) {
+		/*
+		 * List of event is ordered by priority, stop at first running
+		 * event since all other events after this one are of lower
+		 * priority.
+		 */
+		if (e->state == SSE_STATE_RUNNING)
+			break;
+
+		if (event_is_ready(e)) {
+			to_run = e;
+			break;
+		}
+	}
+	spin_unlock(&state->list_lock);
+
+	/*
+	 * We can not lock the event while holding the list lock or we could
+	 * deadlock due to different locking order than other functions.
+	 */
+	if (to_run) {
+		sse_event_lock(to_run);
+		/*
+		 * Reevaluate readiness, for global events, the hart_id might
+		 * have changed, in that case, try to find another ready event
+		 */
+		if (!event_is_ready(e)) {
+			sse_event_unlock(to_run);
+			to_run = NULL;
+			goto retry;
+		}
+
+		sse_event_inject(to_run, prev_e, regs);
+		sse_event_unlock(to_run);
+
+		return SBI_EJUMP;
+	}
+
+	return ret;
+}
+
+static int sse_event_set_pending(struct sbi_sse_event *e)
+{
+	if (e->state != SSE_STATE_RUNNING && e->state != SSE_STATE_ENABLED)
+		return SBI_ERR_INVALID_STATE;
+
+	e->pending = true;
+
+	return SBI_OK;
+}
+
+static void sse_ipi_inject_process(struct sbi_scratch *scratch,
+				   struct sbi_trap_regs *regs)
+{
+	struct sbi_sse_event *e;
+	struct sse_ipi_inject_data evt;
+	struct sbi_fifo *sse_inject_fifo_r =
+			sbi_scratch_offset_ptr(scratch, sse_inject_fifo_off);
+
+	/* This can be the case when sbi_exit() is called */
+	if (!regs)
+		return;
+
+	/* Mark all queued events as pending */
+	while(!sbi_fifo_dequeue(sse_inject_fifo_r, &evt)) {
+		e = sse_event_get(evt.event_id);
+		if (!e)
+			continue;
+
+		sse_event_lock(e);
+		sse_event_set_pending(e);
+		sse_event_unlock(e);
+	}
+
+	sse_process_pending_events(NULL, regs);
+}
+
+static struct sbi_ipi_event_ops sse_ipi_inject_ops = {
+	.name = "IPI_SSE_INJECT",
+	.process = sse_ipi_inject_process,
+};
+
+static int sse_ipi_inject_send(unsigned long hartid, uint32_t event_id)
+{
+	int ret;
+	struct sbi_scratch *remote_scratch = NULL;
+	struct sse_ipi_inject_data evt = {event_id};
+	struct sbi_fifo *sse_inject_fifo_r;
+
+	remote_scratch = sbi_hartid_to_scratch(hartid);
+	if (!remote_scratch)
+		return SBI_EINVAL;
+	sse_inject_fifo_r = sbi_scratch_offset_ptr(remote_scratch,
+						   sse_inject_fifo_off);
+
+	ret = sbi_fifo_enqueue(sse_inject_fifo_r, &evt);
+	if (ret)
+		return SBI_EFAIL;
+
+	ret = sbi_ipi_send_many(BIT(hartid), 0, sse_ipi_inject_event, NULL);
+	if (ret)
+		return SBI_EFAIL;
+
+	return SBI_OK;
+}
+
+static int sse_inject_event(uint32_t event_id, unsigned long hartid,
+			    struct sbi_trap_regs *regs, bool from_ecall)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+
+	/* In case of global event, provided hart_id is ignored */
+	if (sse_event_is_global(e))
+		hartid = e->hartid;
+
+	/*
+	 * If coming from an ecall, always use an IPI to send the event, this
+	 * simplifies handling as we don't have to modify epc/a0 for ecall
+	 * return value.
+	 */
+	if (from_ecall || hartid != current_hartid()) {
+		sse_event_unlock(e);
+		return sse_ipi_inject_send(hartid, event_id);
+	}
+
+	/*
+	 * In other cases, directly handle the event on this hart for faster
+	 * handling
+	 */
+	ret = sse_event_set_pending(e);
+	sse_event_unlock(e);
+	if (ret)
+		return ret;
+
+	return sse_process_pending_events(NULL, regs);
+}
+
+static int sse_event_enable(struct sbi_sse_event *e)
+{
+	if (e->state != SSE_STATE_REGISTERED)
+		return SBI_EINVALID_STATE;
+
+	sse_event_set_state(e, SSE_STATE_ENABLED);
+	sse_event_add_to_list(e);
+
+	return SBI_OK;
+}
+
+static int sse_event_complete(struct sbi_sse_event *e, uint32_t status,
+			      uint32_t flags, struct sbi_trap_regs *regs)
+{
+	if (e->state != SSE_STATE_RUNNING)
+		return SBI_EINVALID_STATE;
+
+	if (e->hartid != current_hartid())
+		return SBI_EDENIED;
+
+	if (flags & SBI_SSE_COMPLETE_FLAG_EVENT_DISABLE)
+		sse_event_disable(e);
+	else
+		sse_event_set_state(e, SSE_STATE_ENABLED);
+
+	if (e->cb_ops && e->cb_ops->complete_cb)
+		e->cb_ops->complete_cb(e->event_id);
+
+	if (sse_process_pending_events(e, regs) == SBI_EJUMP)
+		return SBI_EJUMP;
+
+	return sse_event_resume(e, regs);
+}
+
+int sbi_sse_complete(uint32_t event_id, uint32_t status, uint32_t flags,
+		     struct sbi_trap_regs *regs)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_complete(e, status, flags, regs);
+	sse_event_unlock(e);
+
+	return ret;
+}
+
+int sbi_sse_enable(uint32_t event_id)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_enable(e);
+	sse_event_unlock(e);
+
+	return ret;
+}
+
+int sbi_sse_disable(uint32_t event_id)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_disable(e);
+	sse_event_unlock(e);
+
+	return ret;
+}
+
+int sbi_sse_inject_from_ecall(uint32_t event_id, unsigned long hartid,
+			      struct sbi_trap_regs *regs)
+{
+	if (!sbi_domain_is_assigned_hart(sbi_domain_thishart_ptr(), hartid))
+		return SBI_EINVAL;
+
+	return sse_inject_event(event_id, hartid, regs, true);
+}
+
+int sbi_sse_inject_event(uint32_t event_id, struct sbi_trap_regs *regs)
+{
+	return sse_inject_event(event_id, current_hartid(), regs, false);
+}
+
+int sbi_sse_set_cb_ops(uint32_t event_id, const struct sbi_sse_cb_ops *cb_ops)
+{
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	if (cb_ops->set_hartid_cb && !sse_event_is_global(e))
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	e->cb_ops = cb_ops;
+	sse_event_unlock(e);
+
+	return SBI_OK;
+}
+
+
+int sbi_sse_get_attr(uint32_t event_id, uint32_t attr_id, unsigned long *out_val)
+{
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	return sse_event_get_attr(e, attr_id, out_val);
+}
+
+int sbi_sse_set_attr(uint32_t event_id, uint32_t attr_id, unsigned long val)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_set_attr(e, event_id, attr_id, val);
+	sse_event_unlock(e);
+
+	return ret;
+}
+
+int sbi_sse_register(uint32_t event_id,
+			unsigned long phys_lo,
+			unsigned long phys_hi)
+{
+	int ret;
+	struct sbi_sse_event *e;
+	const unsigned align = __riscv_xlen >> 3;
+	ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
+			MSTATUS_MPP_SHIFT;
+
+	if (phys_lo & (align - 1))
+		return SBI_EINVALID_ADDR;
+
+	/*
+	 * On RV32, the M-mode can only access the first 4GB of
+	 * the physical address space because M-mode does not have
+	 * MMU to access full 34-bit physical address space.
+	 *
+	 * Based on above, we simply fail if the upper 32bits of
+	 * the physical address (i.e. a2 register) is non-zero on
+	 * RV32.
+	 */
+	if (phys_hi)
+		return SBI_EINVALID_ADDR;
+
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), phys_lo,
+					 sizeof(struct sbi_sse_handler_ctx),
+					 smode,
+					 SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
+		return SBI_EINVALID_ADDR;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_register(e, (struct sbi_sse_handler_ctx *)phys_lo);
+	sse_event_unlock(e);
+
+	if (!ret) {
+		if (e->cb_ops && e->cb_ops->register_cb) {
+			e->cb_ops->register_cb(e->event_id);
+		}
+	}
+
+	return ret;
+}
+
+int sbi_sse_unregister(uint32_t event_id)
+{
+	int ret;
+	struct sbi_sse_event *e;
+
+	e = sse_event_get(event_id);
+	if (!e)
+		return SBI_EINVAL;
+
+	sse_event_lock(e);
+	ret = sse_event_unregister(e);
+	sse_event_unlock(e);
+
+	if (!ret) {
+		if (e->cb_ops && e->cb_ops->unregister_cb) {
+			e->cb_ops->unregister_cb(e->event_id);
+		}
+	}
+
+	return ret;
+}
+
+static void sse_event_init(struct sbi_sse_event *event, uint32_t event_id)
+{
+	event->event_id = event_id;
+	event->hartid = current_hartid();
+	SPIN_LOCK_INIT(event->lock);
+}
+
+static int sse_global_init()
+{
+	unsigned int i, ev = 0;
+
+	for (i = 0; i < EVENT_COUNT; i++) {
+		if (EVENT_IS_GLOBAL(supported_events[i]))
+			global_event_count++;
+		else
+			local_event_count++;
+	}
+
+	global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
+	if (!global_events)
+		return SBI_ENOMEM;
+
+	for (i = 0; i < EVENT_COUNT; i++) {
+		if (!EVENT_IS_GLOBAL(supported_events[i]))
+			continue;
+
+		sse_event_init(&global_events[ev++], supported_events[i]);
+	}
+
+	return 0;
+}
+
+static void sse_local_init(struct sse_hart_state *shs)
+{
+	unsigned int i, ev = 0;
+
+	SBI_INIT_LIST_HEAD(&shs->event_list);
+	SPIN_LOCK_INIT(shs->list_lock);
+
+	for (i = 0; i < EVENT_COUNT; i++) {
+		if (EVENT_IS_GLOBAL(supported_events[i]))
+			continue;
+
+		sse_event_init(&shs->local_events[ev++], supported_events[i]);
+	}
+}
+
+int sbi_sse_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	int ret;
+	void *sse_inject_mem;
+	struct sse_hart_state *shs;
+	struct sbi_fifo *sse_inject_q;
+
+	if (cold_boot) {
+		ret = sse_global_init();
+		if (ret)
+			return ret;
+
+		shs_ptr_off = sbi_scratch_alloc_offset(sizeof(void *));
+		if (!shs_ptr_off)
+			return SBI_ENOMEM;
+
+		sse_inject_fifo_off = sbi_scratch_alloc_offset(
+							sizeof(*sse_inject_q));
+		if (!sse_inject_fifo_off) {
+			sbi_scratch_free_offset(shs_ptr_off);
+			return SBI_ENOMEM;
+		}
+
+		sse_inject_fifo_mem_off = sbi_scratch_alloc_offset(
+			EVENT_COUNT * sizeof(struct sse_ipi_inject_data));
+		if (!sse_inject_fifo_mem_off) {
+			sbi_scratch_free_offset(sse_inject_fifo_off);
+			sbi_scratch_free_offset(shs_ptr_off);
+			return SBI_ENOMEM;
+		}
+
+		ret = sbi_ipi_event_create(&sse_ipi_inject_ops);
+		if (ret < 0) {
+			sbi_scratch_free_offset(shs_ptr_off);
+			return ret;
+		}
+		sse_ipi_inject_event = ret;
+	}
+
+	shs = sse_get_hart_state_ptr(scratch);
+	if (!shs) {
+		shs = sbi_zalloc(sizeof(*shs) +
+			sizeof(struct sbi_sse_event) * local_event_count);
+		if (!shs)
+			return SBI_ENOMEM;
+
+		shs->local_events = (struct sbi_sse_event *)(shs + 1);
+
+		sse_set_hart_state_ptr(scratch, shs);
+	}
+
+	sse_local_init(shs);
+
+	sse_inject_q = sbi_scratch_offset_ptr(scratch, sse_inject_fifo_off);
+	sse_inject_mem = sbi_scratch_offset_ptr(scratch,
+						sse_inject_fifo_mem_off);
+
+	sbi_fifo_init(sse_inject_q, sse_inject_mem, EVENT_COUNT,
+		      sizeof(struct sse_ipi_inject_data));
+
+	return 0;
+}
+
+void sbi_sse_exit(struct sbi_scratch *scratch)
+{
+	int i;
+	struct sbi_sse_event *e;
+
+	for (i = 0; i < EVENT_COUNT; i++) {
+		e = sse_event_get(supported_events[i]);
+
+		if (e->hartid != current_hartid())
+			continue;
+
+		if (e->state > SSE_STATE_REGISTERED)
+			sbi_printf("Event %d in invalid state at exit", i);
+	}
+}
-- 
2.42.0


