From: liushiwei <liushiwei@eswincomputing.com>
Date: Wed, 11 Jan 2023 10:08:18 +0800
Subject: [PATCH 1/1] Add RISC-V TEE support
Message-ID: <20230111020818.851-1-liushiwei@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V Trusted Executable Environment security software includes
linux, opensbi, and OP-TEE OS. linux is the non-secure domain,
and OP-TEE OS is the secure domain. At boot time, opensbi boots
OP-TEE OS and then starts linux. At runtime, opensbi acts as a
secure monitor, responsible for context saving and restoring
when switching between linux and OP-TEE OS.
TEE function is off by default, when using configuration is
added in the config and objects file, such as
platform/generic/configs/defconfig add CONFIG_SBI_ECALL_TEE = y,
In the platform/generic/objects.mk add CONFIG_TEE_LOAD_ADDR =
0x27c000000, CONFIG_TEE_LOAD_ADDR is the starting address
of the OP-TEE OS.

Signed-off-by: liushiwei <liushiwei@eswincomputing.com>
---
 include/sbi/sbi_ecall_interface.h         |   3 +
 include/sbi_utils/tee/tee_context.h       | 104 ++++++++++
 include/sbi_utils/tee/tee_sm_dispatcher.h |  44 +++++
 include/sbi_utils/tee/teeecall_opteed.h   | 145 ++++++++++++++
 lib/sbi/Kconfig                           |   4 +
 lib/sbi/objects.mk                        |   3 +
 lib/sbi/sbi_ecall_tee.c                   |  19 ++
 lib/sbi/sbi_init.c                        |   5 +
 lib/utils/tee/objects.mk                  |  16 ++
 lib/utils/tee/tee_context.S               | 189 ++++++++++++++++++
 lib/utils/tee/tee_sm_dispatcher.c         | 228 ++++++++++++++++++++++
 11 files changed, 760 insertions(+)
 create mode 100644 include/sbi_utils/tee/tee_context.h
 create mode 100644 include/sbi_utils/tee/tee_sm_dispatcher.h
 create mode 100644 include/sbi_utils/tee/teeecall_opteed.h
 create mode 100644 lib/sbi/sbi_ecall_tee.c
 create mode 100644 lib/utils/tee/objects.mk
 create mode 100644 lib/utils/tee/tee_context.S
 create mode 100644 lib/utils/tee/tee_sm_dispatcher.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a3f2bf4..5ed5bd5 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -238,6 +238,9 @@ enum sbi_pmu_ctr_type {
 #define SBI_EXT_VENDOR_END			0x09FFFFFF
 #define SBI_EXT_FIRMWARE_START			0x0A000000
 #define SBI_EXT_FIRMWARE_END			0x0AFFFFFF
+#define SBI_EXT_TEE_START			0x0A000000
+#define SBI_EXT_TEE_END				0x0AFFFFFF
+#define SBI_EXT_TEE				0xFFFFEEEE
 
 /* SBI return error codes */
 #define SBI_SUCCESS				0
diff --git a/include/sbi_utils/tee/tee_context.h b/include/sbi_utils/tee/tee_context.h
new file mode 100644
index 0000000..467ff00
--- /dev/null
+++ b/include/sbi_utils/tee/tee_context.h
@@ -0,0 +1,104 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Chen Chaokai <chenchaokai@eswincomputing.com>
+ *   Liu Shiwei <liushiwei@eswincomputing.com>
+ */
+
+#ifndef __TEE_CONTEXT_H__
+#define __TEE_CONTEXT_H__
+
+#define TEE_SECURE_FLAG					(0xFFFF0000)
+#define TEE_NON_SECURE_FLAG				(0xFFFFFFFF)
+
+#define TEE_HART_COUNT					(0x8)
+#define OPTEED_CORE_COUNT				TEE_HART_COUNT
+
+#define ECALL_TEE_SHIFT					(0x10)
+#define MCAUSE_INTR					(1)
+
+/* The secure and non-secure contexts size are used to
+ * store the regisers respectively.
+ * The macros defined below are used to setup the spaces
+ * for secure and non-secure contexts.
+ * */
+
+#define SBI_SAVE_CONTEXT_sepc				35
+#define SBI_SAVE_CONTEXT_satp				36
+#define SBI_SAVE_CONTEXT_sstatus			37
+#define SBI_SAVE_CONTEXT_sie				38
+#define SBI_SAVE_CONTEXT_stvec				39
+#define SBI_SAVE_CONTEXT_sscratch			40
+#define SBI_SAVE_CONTEXT_scounteren			41
+#define SBI_SAVE_CONTEXT_scause				42
+#define SBI_SAVE_CONTEXT_stval				43
+#define SBI_SAVE_CONTEXT_sip				44
+#define SBI_SAVE_CONTEXT_last				45
+
+/** Get offset of member with name 'x' in sbi_save_context */
+#define SBI_SAVE_CONTEXT_OFFSET(x) ((SBI_SAVE_CONTEXT_##x) * __SIZEOF_POINTER__)
+/** Size (in bytes) of sbi_trap_regs */
+#define SBI_SAVE_CONTEXT_SIZE SBI_SAVE_CONTEXT_OFFSET(last)
+
+#ifndef __ASSEMBLER__
+#include <sbi/sbi_types.h>
+
+typedef uint32_t optee_vector_isn_t;
+
+typedef struct optee_vectors {
+	optee_vector_isn_t yield_smc_entry;
+	optee_vector_isn_t fast_smc_entry;
+	optee_vector_isn_t cpu_on_entry;
+	optee_vector_isn_t cpu_off_entry;
+	optee_vector_isn_t cpu_resume_entry;
+	optee_vector_isn_t cpu_suspend_entry;
+	optee_vector_isn_t fiq_entry;
+	optee_vector_isn_t system_off_entry;
+	optee_vector_isn_t system_reset_entry;
+} optee_vectors_t;
+
+struct sbi_save_context {
+	struct sbi_trap_regs regs;
+	unsigned long sepc;
+	unsigned long satp;
+	unsigned long sstatus;
+	unsigned long sie;
+	unsigned long stvec;
+	unsigned long sscratch;
+	unsigned long scounteren;
+	unsigned long scause;
+	unsigned long stval;
+	unsigned long sip;
+};
+
+/**
+ * Save opensbi context and enter into TEE OS
+ *
+ * @param cpu_ctx_addr Address of struct sbi_save_context to save context.
+ *
+ * @return Return 0 on success and negative value on failure
+ */
+int entry_teeos(unsigned long cpu_ctx_addr);
+
+/**
+ * Restore openSBI context and continue running openSBI
+ *
+ * @param cpu_ctx_addr Address of struct sbi_trap_regs to restore context.
+ * @param ret Return value coming from TEE OS.
+ *
+ */
+void teeos_entry_done(unsigned long cpu_ctx_addr);
+
+/**
+ * Load supervisor context and return to supervisor mode
+ *
+ * @param ctx_addr Address of struct sbi_trap_regs to restore context.
+ *
+ */
+void restore_to_supervisor(unsigned long ctx_addr);
+
+#endif /* __ASSEMBLER__ */
+#endif /* __TEE_CONTEXT_H__ */
diff --git a/include/sbi_utils/tee/tee_sm_dispatcher.h b/include/sbi_utils/tee/tee_sm_dispatcher.h
new file mode 100644
index 0000000..1c971a4
--- /dev/null
+++ b/include/sbi_utils/tee/tee_sm_dispatcher.h
@@ -0,0 +1,44 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Chen Chaokai <chenchaokai@eswincomputing.com>
+ *   Liu Shiwei <liushiwei@eswincomputing.com>
+ */
+
+#ifndef __TEE_SM_DISPATCHER_H__
+#define __TEE_SM_DISPATCHER_H__
+
+#define TEE_ENTRY_ADDR      TEE_LOAD_ADDR
+
+#ifndef __ASSEMBLER__
+#include <sbi/sbi_types.h>
+
+/**
+ * Initialize tee os
+ *
+ * @return Return 0 on success and negative value on failure
+ */
+void tee_os_init(void);
+
+/**
+ * TEE dispatcher handler which interact bewteen REE and TEE
+ *
+ * @param extid is SBI_EXT_TEE
+ * @param funcid Function id for this ecall trap.
+ * @param args Parameter passed from supervisor mode
+ * @param out_value Output value
+ * @param out_trap Trap detail
+ *
+ * @return Return 0 on success and negative value on failure
+ */
+
+int sbi_ecall_tee_handler(ulong extid, ulong funcid,
+			  const struct sbi_trap_regs *regs,
+			  ulong *out_val,
+			  struct sbi_trap_info *out_trap);
+
+#endif /* __ASSEMBLER__ */
+#endif /* __TEE_SM_DISPATCHER_H__ */
diff --git a/include/sbi_utils/tee/teeecall_opteed.h b/include/sbi_utils/tee/teeecall_opteed.h
new file mode 100644
index 0000000..e953a36
--- /dev/null
+++ b/include/sbi_utils/tee/teeecall_opteed.h
@@ -0,0 +1,145 @@
+/*
+ * Copyright (c) 2014, ARM Limited and Contributors. All rights reserved.
+ *
+ * SPDX-License-Identifier: BSD-3-Clause
+ */
+
+/* Copyright (c) 2014, Linaro Limited. All rights reserved. */
+
+#ifndef __TEEECALL_OPTEED_H__
+#define __TEEECALL_OPTEED_H__
+
+#define ECALL_TYPE_FAST     (1)
+#define ECALL_TYPE_YEILD    (0)
+
+#define FUNCID_TYPE_SHIFT   (31)
+#define FUNCID_TYPE_MASK    (0x1)
+#define ECALL_32            (0)
+#define FUNCID_CC_SHIFT     (30)
+#define FUNCID_OEN_SHIFT    (24)
+
+#define FUNCID_NUM_MASK      (0xffff)
+
+#define GET_ECALL_TYPE(id)        (((id) >> FUNCID_TYPE_SHIFT) & \
+                     FUNCID_TYPE_MASK)
+
+
+#define TEEECALL_OPTEED_RV(func_num) \
+        ((ECALL_TYPE_FAST << FUNCID_TYPE_SHIFT) | \
+         ((ECALL_32) << FUNCID_CC_SHIFT) | \
+         (62 << FUNCID_OEN_SHIFT) | \
+         ((func_num) & FUNCID_NUM_MASK))
+
+
+/*
+ * This file specify SMC function IDs used when returning from TEE to the
+ * secure monitor.
+ *
+ * All SMC Function IDs indicates SMC32 Calling Convention but will carry
+ * full 64 bit values in the argument registers if invoked from Aarch64
+ * mode. This violates the SMC Calling Convention, but since this
+ * convention only coveres API towards Normwal World it's something that
+ * only concerns the OP-TEE Dispatcher in ARM Trusted Firmware and OP-TEE
+ * OS at Secure EL1.
+ */
+
+/*
+ * Issued when returning from initial entry.
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_ENTRY_DONE
+ * r1/x1	Pointer to entry vector
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_ENTRY_DONE		0
+#define TEEECALL_OPTEED_RETURN_ENTRY_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_ENTRY_DONE)
+
+
+
+/*
+ * Issued when returning from "cpu_on" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_ON_DONE
+ * r1/x1	0 on success and anything else to indicate error condition
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_ON_DONE		1
+#define TEEECALL_OPTEED_RETURN_ON_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_ON_DONE)
+
+/*
+ * Issued when returning from "cpu_off" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_OFF_DONE
+ * r1/x1	0 on success and anything else to indicate error condition
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_OFF_DONE		2
+#define TEEECALL_OPTEED_RETURN_OFF_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_OFF_DONE)
+
+/*
+ * Issued when returning from "cpu_suspend" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_SUSPEND_DONE
+ * r1/x1	0 on success and anything else to indicate error condition
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_SUSPEND_DONE	3
+#define TEEECALL_OPTEED_RETURN_SUSPEND_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_SUSPEND_DONE)
+
+/*
+ * Issued when returning from "cpu_resume" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_RESUME_DONE
+ * r1/x1	0 on success and anything else to indicate error condition
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_RESUME_DONE		4
+#define TEEECALL_OPTEED_RETURN_RESUME_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_RESUME_DONE)
+
+/*
+ * Issued when returning from "std_smc" or "fast_smc" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_CALL_DONE
+ * r1-4/x1-4	Return value 0-3 which will passed to normal world in
+ *		r0-3/x0-3
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_CALL_DONE		5
+#define TEEECALL_OPTEED_RETURN_CALL_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_CALL_DONE)
+
+/*
+ * Issued when returning from "fiq" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_FIQ_DONE
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_FIQ_DONE		6
+#define TEEECALL_OPTEED_RETURN_FIQ_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_FIQ_DONE)
+
+/*
+ * Issued when returning from "system_off" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_SYSTEM_OFF_DONE
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_SYSTEM_OFF_DONE	7
+#define TEEECALL_OPTEED_RETURN_SYSTEM_OFF_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_SYSTEM_OFF_DONE)
+
+/*
+ * Issued when returning from "system_reset" vector
+ *
+ * Register usage:
+ * r0/x0	SMC Function ID, TEEECALL_OPTEED_RETURN_SYSTEM_RESET_DONE
+ */
+#define TEEECALL_OPTEED_FUNCID_RETURN_SYSTEM_RESET_DONE	8
+#define TEEECALL_OPTEED_RETURN_SYSTEM_RESET_DONE \
+	TEEECALL_OPTEED_RV(TEEECALL_OPTEED_FUNCID_RETURN_SYSTEM_RESET_DONE)
+
+#endif /* __TEEECALL_OPTEED_H__ */
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index df74bba..7cfc8c3 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -34,4 +34,8 @@ config SBI_ECALL_VENDOR
 	bool "Platform-defined vendor extensions"
 	default y
 
+config SBI_ECALL_TEE
+	bool "trusted execution environment"
+	default n
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c774ebb..ea79924 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -43,6 +43,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_LEGACY) += sbi_ecall_legacy.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_VENDOR) += ecall_vendor
 libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_TEE) += ecall_tee
+libsbi-objs-$(CONFIG_SBI_ECALL_TEE) += sbi_ecall_tee.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_ecall_tee.c b/lib/sbi/sbi_ecall_tee.c
new file mode 100644
index 0000000..86deea3
--- /dev/null
+++ b/lib/sbi/sbi_ecall_tee.c
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Chen Chaokai <chenchaokai@eswincomputing.com>
+ *   Liu Shiwei <liushiwei@eswincomputing.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi_utils/tee/tee_sm_dispatcher.h>
+
+struct sbi_ecall_extension ecall_tee = {
+	.extid_start = SBI_EXT_TEE,
+	.extid_end = SBI_EXT_TEE,
+	.handle = sbi_ecall_tee_handler,
+};
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 259a191..1158949 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -26,6 +26,7 @@
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
+#include <sbi_utils/tee/tee_sm_dispatcher.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -350,6 +351,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
 	(*init_count)++;
 
+#ifdef CONFIG_SBI_ECALL_TEE
+	tee_os_init();
+#endif
+
 	sbi_hsm_prepare_next_jump(scratch, hartid);
 	sbi_hart_switch_mode(hartid, scratch->next_arg1, scratch->next_addr,
 			     scratch->next_mode, false);
diff --git a/lib/utils/tee/objects.mk b/lib/utils/tee/objects.mk
new file mode 100644
index 0000000..5bf81f7
--- /dev/null
+++ b/lib/utils/tee/objects.mk
@@ -0,0 +1,16 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+#
+# Authors:
+#   Chen Chaokai <chenchaokai@eswincomputing.com>
+#   Liu Shiwei <liushiwei@eswincomputing.com>
+#
+
+ifdef CONFIG_TEE_LOAD_ADDR
+firmware-cflags-y += -DTEE_LOAD_ADDR=$(CONFIG_TEE_LOAD_ADDR)
+endif
+
+libsbiutils-objs-$(CONFIG_SBI_ECALL_TEE) += tee/tee_context.o
+libsbiutils-objs-$(CONFIG_SBI_ECALL_TEE) += tee/tee_sm_dispatcher.o
diff --git a/lib/utils/tee/tee_context.S b/lib/utils/tee/tee_context.S
new file mode 100644
index 0000000..90b1013
--- /dev/null
+++ b/lib/utils/tee/tee_context.S
@@ -0,0 +1,189 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Chen Chaokai <chenchaokai@eswincomputing.com>
+ *   Liu Shiwei <liushiwei@eswincomputing.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_trap.h>
+#include <sbi_utils/tee/tee_context.h>
+
+	.global entry_teeos
+	.type entry_teeos, @function
+entry_teeos:
+	/* Save t0 into scratch temporarily */
+	csrrw	tp, CSR_MSCRATCH, tp
+	REG_S	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
+
+	li	t0, 0
+	addi	t0, sp, 0
+
+	/* Set new SP */
+	li	sp, 0
+	addi	sp, a0, 0
+
+	/* Save original SP and t0 */
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(sp)(sp)
+	REG_L	t0, SBI_SCRATCH_TMP0_OFFSET(tp)
+	REG_S	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	csrrw	tp, CSR_MSCRATCH, tp
+
+	/* Save all general registers except SP and T0*/
+	REG_S	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_S	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_S	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_S	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_S	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_S	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_S	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_S	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_S	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_S	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_S	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_S	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_S	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_S	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_S	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_S	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_S	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_S	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_S	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_S	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_S	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_S	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_S	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_S	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_S	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_S	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_S	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_S	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_S	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
+	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(sp)
+
+	/* Enter supervisor mode */
+	call	enter_teeos_start_point
+
+	.global teeos_entry_done
+	.type teeos_entry_done, @function
+teeos_entry_done:
+	li	sp, 0
+	addi	sp, a0, 0
+
+	/* Restore all general purpose registers except SP and T0*/
+	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_L	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_L	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_L	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_L	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_L	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_L	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_L	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_L	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_L	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_L	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_L	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_L	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_L	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_L	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_L	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_L	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_L	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_L	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_L	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_L	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_L	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_L	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_L	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_L	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_L	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
+
+	/* Restore T0 */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Restore SP */
+	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(sp)
+	ret
+
+	.global restore_to_supervisor
+	.type restore_to_supervisor, @function
+restore_to_supervisor:
+	li	sp, 0
+	add	sp, a0, zero
+
+	/* Restore all general purpose registers except SP and T0*/
+	REG_L	zero, SBI_TRAP_REGS_OFFSET(zero)(sp)
+	REG_L	ra, SBI_TRAP_REGS_OFFSET(ra)(sp)
+	REG_L	gp, SBI_TRAP_REGS_OFFSET(gp)(sp)
+	REG_L	tp, SBI_TRAP_REGS_OFFSET(tp)(sp)
+	REG_L	t1, SBI_TRAP_REGS_OFFSET(t1)(sp)
+	REG_L	t2, SBI_TRAP_REGS_OFFSET(t2)(sp)
+	REG_L	s0, SBI_TRAP_REGS_OFFSET(s0)(sp)
+	REG_L	s1, SBI_TRAP_REGS_OFFSET(s1)(sp)
+	REG_L	a0, SBI_TRAP_REGS_OFFSET(a0)(sp)
+	REG_L	a1, SBI_TRAP_REGS_OFFSET(a1)(sp)
+	REG_L	a2, SBI_TRAP_REGS_OFFSET(a2)(sp)
+	REG_L	a3, SBI_TRAP_REGS_OFFSET(a3)(sp)
+	REG_L	a4, SBI_TRAP_REGS_OFFSET(a4)(sp)
+	REG_L	a5, SBI_TRAP_REGS_OFFSET(a5)(sp)
+	REG_L	a6, SBI_TRAP_REGS_OFFSET(a6)(sp)
+	REG_L	a7, SBI_TRAP_REGS_OFFSET(a7)(sp)
+	REG_L	s2, SBI_TRAP_REGS_OFFSET(s2)(sp)
+	REG_L	s3, SBI_TRAP_REGS_OFFSET(s3)(sp)
+	REG_L	s4, SBI_TRAP_REGS_OFFSET(s4)(sp)
+	REG_L	s5, SBI_TRAP_REGS_OFFSET(s5)(sp)
+	REG_L	s6, SBI_TRAP_REGS_OFFSET(s6)(sp)
+	REG_L	s7, SBI_TRAP_REGS_OFFSET(s7)(sp)
+	REG_L	s8, SBI_TRAP_REGS_OFFSET(s8)(sp)
+	REG_L	s9, SBI_TRAP_REGS_OFFSET(s9)(sp)
+	REG_L	s10, SBI_TRAP_REGS_OFFSET(s10)(sp)
+	REG_L	s11, SBI_TRAP_REGS_OFFSET(s11)(sp)
+	REG_L	t3, SBI_TRAP_REGS_OFFSET(t3)(sp)
+	REG_L	t4, SBI_TRAP_REGS_OFFSET(t4)(sp)
+	REG_L	t5, SBI_TRAP_REGS_OFFSET(t5)(sp)
+	REG_L	t6, SBI_TRAP_REGS_OFFSET(t6)(sp)
+
+	/* Restore Supervisor mode CSRs */
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(sepc)(sp)
+	csrw	CSR_SEPC, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(satp)(sp)
+	csrw	CSR_SATP, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(sstatus)(sp)
+	csrw	CSR_SSTATUS, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(sie)(sp)
+	csrw	CSR_SIE, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(stvec)(sp)
+	csrw	CSR_STVEC, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(sscratch)(sp)
+	csrw	CSR_SSCRATCH, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(scounteren)(sp)
+	csrw	CSR_SCOUNTEREN, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(scause)(sp)
+	csrw	CSR_SCAUSE, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(stval)(sp)
+	csrw	CSR_STVAL, t0
+	REG_L	t0, SBI_SAVE_CONTEXT_OFFSET(sip)(sp)
+	csrw	CSR_SIP, t0
+
+	/* Restore Machine mode CSRs */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mepc)(sp)
+	csrw	CSR_MEPC, t0
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(mstatus)(sp)
+	csrw	CSR_MSTATUS, t0
+
+	/* Restore T0 */
+	REG_L	t0, SBI_TRAP_REGS_OFFSET(t0)(sp)
+
+	/* Restore SP */
+	REG_L	sp, SBI_TRAP_REGS_OFFSET(sp)(sp)
+	mret
diff --git a/lib/utils/tee/tee_sm_dispatcher.c b/lib/utils/tee/tee_sm_dispatcher.c
new file mode 100644
index 0000000..74e55c5
--- /dev/null
+++ b/lib/utils/tee/tee_sm_dispatcher.c
@@ -0,0 +1,228 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright  2023  Beijing ESWIN Computing Technology Co., Ltd.
+ *
+ * Authors:
+ *   Chen Chaokai <chenchaokai@eswincomputing.com>
+ *   Liu Shiwei <liushiwei@eswincomputing.com>
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_error.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_types.h>
+#include <sbi_utils/tee/tee_context.h>
+#include <sbi_utils/tee/teeecall_opteed.h>
+#include <sbi_utils/tee/tee_sm_dispatcher.h>
+
+optee_vectors_t *optee_vector_table;
+struct sbi_save_context nsec_cpu_context[OPTEED_CORE_COUNT];
+struct sbi_save_context sec_cpu_context[OPTEED_CORE_COUNT];
+struct sbi_trap_regs cpu_start_context[OPTEED_CORE_COUNT];
+ulong mscratch[OPTEED_CORE_COUNT];
+typedef ulong tee_tmp_trap_stack[1024];
+static tee_tmp_trap_stack tmp_stack[OPTEED_CORE_COUNT];
+
+static ulong get_save_context_addr(uint32_t direction)
+{
+	ulong addr = 0;
+	ulong hartid = current_hartid();
+	switch (direction) {
+	case TEE_SECURE_FLAG:
+		addr = (ulong)&sec_cpu_context[hartid];
+		break;
+	case TEE_NON_SECURE_FLAG:
+		addr = (ulong)&nsec_cpu_context[hartid];
+		break;
+	default:
+		sbi_printf("wrong state\n");
+		while(1)
+			wfi();
+	}
+
+	return addr;
+}
+
+static ulong save_context(const struct sbi_trap_regs *regs)
+{
+	ulong addr = 0;
+	struct sbi_save_context *context = NULL;
+
+	addr = get_save_context_addr(regs->a5);
+	context = (struct sbi_save_context *)addr;
+	if (context != NULL) {
+		sbi_memset(context, 0, sizeof(struct sbi_save_context));
+		sbi_memcpy(context, regs, sizeof(struct sbi_trap_regs));
+	} else {
+		return SBI_EINVAL;
+	}
+
+	context->sepc = csr_read(CSR_SEPC);
+	context->satp = csr_read(CSR_SATP);
+	context->sstatus = csr_read(CSR_SSTATUS);
+	context->sie = csr_read(CSR_SIE);
+	context->stvec = csr_read(CSR_STVEC);
+	context->sscratch = csr_read(CSR_SSCRATCH);
+	context->scounteren = csr_read(CSR_SCOUNTEREN);
+	context->scause = csr_read(CSR_SCAUSE);
+	context->stval = csr_read(CSR_STVAL);
+	context->sip = csr_read(CSR_SIP);
+
+	return SBI_OK;
+}
+
+static void restore_context(ulong ctx_addr)
+{
+	restore_to_supervisor(ctx_addr);
+}
+
+void enter_teeos_start_point(void)
+{
+	uint32_t hartid = current_hartid();
+	mscratch[hartid] = csr_read(CSR_MSCRATCH);
+	csr_write(CSR_MSCRATCH,&tmp_stack[hartid + 1]);
+	sbi_hart_switch_mode(hartid, 0, TEE_ENTRY_ADDR, PRV_S, false);
+}
+
+static void teeos_back(void)
+{
+	uint32_t hartid = current_hartid();
+	struct sbi_trap_regs *optee_ctx = &cpu_start_context[hartid];
+	csr_write(CSR_MSCRATCH,mscratch[hartid]);
+
+	teeos_entry_done((ulong)optee_ctx);
+
+	sbi_printf("Error, should never reach here\n");
+}
+
+static ulong prepare_tee_ctx(ulong funcid, ulong *args, ulong *ctx_addr)
+{
+	uint32_t hartid = current_hartid();
+	struct sbi_trap_regs *tee_regs = (struct sbi_trap_regs *)&sec_cpu_context[hartid];
+	tee_regs->mstatus |= MSTATUS_SUM;
+	struct sbi_save_context *context = (struct sbi_save_context *)tee_regs;
+	context->sstatus |= MSTATUS_SUM;
+	ulong func_type = GET_ECALL_TYPE(funcid);
+
+	if (func_type == ECALL_TYPE_FAST) {
+		tee_regs->mepc = (ulong)&optee_vector_table->fast_smc_entry;
+		tee_regs->a0 = funcid;
+		tee_regs->a1 = args[1];
+		tee_regs->a2 = args[2];
+		tee_regs->a3 = args[3];
+		tee_regs->a4 = args[4];
+		tee_regs->a5 = args[5];
+	} else if (func_type == ECALL_TYPE_YEILD) {
+		tee_regs->mepc = (ulong)&optee_vector_table->yield_smc_entry;
+		tee_regs->a0 = funcid;
+		tee_regs->a1 = args[1];
+		tee_regs->a2 = args[2];
+		tee_regs->a3 = args[3];
+		tee_regs->a4 = args[4];
+		tee_regs->a5 = args[0];
+	} else
+		return SBI_EFAIL;
+
+	*ctx_addr = (ulong)tee_regs;
+	return SBI_OK;
+}
+
+static ulong prepare_ree_ctx(ulong *args, ulong *ctx_addr)
+{
+	struct sbi_save_context *ns_regs = NULL;
+	uint32_t hartid = current_hartid();
+
+	ns_regs = &nsec_cpu_context[hartid];
+	ns_regs->regs.a0 = args[0];
+	ns_regs->regs.a1 = args[1];
+	ns_regs->regs.a2 = args[2];
+	ns_regs->regs.a3 = args[3];
+	ns_regs->regs.a4 = args[4];
+	ns_regs->regs.a5 = args[5];
+	ns_regs->regs.mepc += 4;
+	*ctx_addr = (ulong)ns_regs;
+
+	return SBI_OK;
+}
+
+void tee_os_init(void)
+{
+	uint32_t hartid = current_hartid();
+	struct sbi_trap_regs *optee_cpu_ctx = &cpu_start_context[hartid];
+
+	sbi_memset(optee_cpu_ctx, 0, sizeof(struct sbi_save_context));
+	entry_teeos((ulong )optee_cpu_ctx);
+}
+
+int sbi_ecall_tee_handler(ulong extid, ulong funcid,
+			  const struct sbi_trap_regs *regs,
+			  ulong *out_val,
+			  struct sbi_trap_info *out_trap)
+{
+	ulong ret;
+	int tee_func_id = funcid;
+	ulong ctx_addr = 0;
+	ulong args[8] = {0};
+	ulong secure_state = 0;
+	args[0] = regs->a0;
+	args[1] = regs->a1;
+	args[2] = regs->a2;
+	args[3] = regs->a3;
+	args[4] = regs->a4;
+	args[5] = regs->a5;
+	args[6] = regs->a6;
+	args[7] = regs->a7;
+	secure_state = args[5];
+
+	ret = save_context(regs);
+	if (ret != SBI_OK) {
+		sbi_printf("save exception context failed\n");
+		return ret;
+	}
+
+	if (secure_state == TEE_NON_SECURE_FLAG) {
+		ret = prepare_tee_ctx(funcid, args, &ctx_addr);
+		if ( ret != SBI_OK) {
+			sbi_printf("Set optee context failed\n");
+			return ret;
+		}
+		restore_context(ctx_addr);
+	} else if (secure_state == TEE_SECURE_FLAG) {
+		switch (tee_func_id) {
+		case TEEECALL_OPTEED_RETURN_ENTRY_DONE:
+		/* Stash the OPTEE entry point information. */
+			optee_vector_table = (optee_vectors_t *)args[1];
+			if (!args[1] || (args[1] & 3)) {
+				sbi_printf("Get TEE vector table failed.\n");
+				while(1);
+					wfi();
+			}
+			teeos_back();
+			break;
+		case TEEECALL_OPTEED_RETURN_CALL_DONE:
+			ret = prepare_ree_ctx(args, &ctx_addr);
+			if (ret != SBI_OK) {
+				sbi_printf("Set ree context failed\n");
+				return ret;
+			}
+			restore_context(ctx_addr);
+			break;
+		default:
+			sbi_printf("Wrong TEE funcid, funcid = %lx\n", funcid);
+			return SBI_EILL;
+		}
+
+	} else {
+		sbi_printf("Wrong secure state!\n");
+		return SBI_EILL;
+	}
+
+	return SBI_OK;
+}
-- 
2.17.1


