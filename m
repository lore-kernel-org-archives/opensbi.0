From: Atish Patra <atish.patra@wdc.com>
Date: Wed, 26 May 2021 17:30:42 -0700
Subject: [PATCH v2 13/15] lib: sbi: Implement firmware counters
In-Reply-To: <20210527003044.889681-1-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
Message-ID: <20210527003044.889681-14-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V SBI v0.3 specification defines a set of firmware events that can
provide additional information about the current firmware context. All
of the firmware event monitoring are enabled now. The firmware
events must be defined as raw perf event with MSB set as specified in the
specification.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_ecall_replace.c   |  1 +
 lib/sbi/sbi_illegal_insn.c    |  2 ++
 lib/sbi/sbi_ipi.c             |  6 ++++++
 lib/sbi/sbi_misaligned_ldst.c |  5 +++++
 lib/sbi/sbi_timer.c           |  2 ++
 lib/sbi/sbi_tlb.c             | 38 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_trap.c            |  5 +++++
 7 files changed, 59 insertions(+)

diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
index a7935d97300d..fb1235d66fa9 100644
--- a/lib/sbi/sbi_ecall_replace.c
+++ b/lib/sbi/sbi_ecall_replace.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_ipi.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_tlb.h>
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 9af3d24d797e..bfe7d6195898 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_emulate_csr.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
 
@@ -129,6 +130,7 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 	 * instruction trap.
 	 */
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ILLEGAL_INSN);
 	if (unlikely((insn & 3) != 3)) {
 		insn = sbi_get_insn(regs->mepc, &uptrap);
 		if (uptrap.cause) {
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index bfaf4e9766e1..563db2cf9e55 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -19,6 +19,9 @@
 #include <sbi/sbi_init.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_tlb.h>
 
 struct sbi_ipi_data {
 	unsigned long ipi_type;
@@ -64,6 +67,8 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 	if (ipi_dev && ipi_dev->ipi_send)
 		ipi_dev->ipi_send(remote_hartid);
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
+
 	if (ipi_ops->sync)
 		ipi_ops->sync(scratch);
 
@@ -183,6 +188,7 @@ void sbi_ipi_process(void)
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
 	u32 hartid = current_hartid();
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
 	if (ipi_dev && ipi_dev->ipi_clear)
 		ipi_dev->ipi_clear(hartid);
 
diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
index 5057cb5ecd58..c879ce72f61a 100644
--- a/lib/sbi/sbi_misaligned_ldst.c
+++ b/lib/sbi/sbi_misaligned_ldst.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_fp.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_misaligned_ldst.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
 
@@ -29,6 +30,8 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
 	struct sbi_trap_info uptrap;
 	int i, fp = 0, shift = 0, len = 0;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_LOAD);
+
 	if (tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
@@ -149,6 +152,8 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
 	struct sbi_trap_info uptrap;
 	int i, len = 0;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_MISALIGNED_STORE);
+
 	if (tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 63e8ea98eadc..c7f1c80b8939 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 
@@ -88,6 +89,7 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
 
 void sbi_timer_event_start(u64 next_event)
 {
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
 	if (timer_dev && timer_dev->timer_event_start)
 		timer_dev->timer_event_start(next_event);
 	csr_clear(CSR_MIP, MIP_STIP);
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 73f59e8681e2..6e9e4f0b1916 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -21,6 +21,7 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
 
 static unsigned long tlb_sync_off;
 static unsigned long tlb_fifo_off;
@@ -39,6 +40,8 @@ void sbi_tlb_local_hfence_vvma(struct sbi_tlb_info *tinfo)
 	unsigned long vmid  = tinfo->vmid;
 	unsigned long i, hgatp;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_RCVD);
+
 	hgatp = csr_swap(CSR_HGATP,
 			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
 
@@ -61,6 +64,8 @@ void sbi_tlb_local_hfence_gvma(struct sbi_tlb_info *tinfo)
 	unsigned long size  = tinfo->size;
 	unsigned long i;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_RCVD);
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		__sbi_hfence_gvma_all();
 		return;
@@ -77,6 +82,8 @@ void sbi_tlb_local_sfence_vma(struct sbi_tlb_info *tinfo)
 	unsigned long size  = tinfo->size;
 	unsigned long i;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_RCVD);
+
 	if ((start == 0 && size == 0) || (size == SBI_TLB_FLUSH_ALL)) {
 		sbi_tlb_flush_all();
 		return;
@@ -98,6 +105,8 @@ void sbi_tlb_local_hfence_vvma_asid(struct sbi_tlb_info *tinfo)
 	unsigned long vmid  = tinfo->vmid;
 	unsigned long i, hgatp;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
+
 	hgatp = csr_swap(CSR_HGATP,
 			 (vmid << HGATP_VMID_SHIFT) & HGATP_VMID_MASK);
 
@@ -126,6 +135,8 @@ void sbi_tlb_local_hfence_gvma_vmid(struct sbi_tlb_info *tinfo)
 	unsigned long vmid  = tinfo->vmid;
 	unsigned long i;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD);
+
 	if (start == 0 && size == 0) {
 		__sbi_hfence_gvma_all();
 		return;
@@ -148,6 +159,8 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 	unsigned long asid  = tinfo->asid;
 	unsigned long i;
 
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_RCVD);
+
 	if (start == 0 && size == 0) {
 		sbi_tlb_flush_all();
 		return;
@@ -172,9 +185,32 @@ void sbi_tlb_local_sfence_vma_asid(struct sbi_tlb_info *tinfo)
 
 void sbi_tlb_local_fence_i(struct sbi_tlb_info *tinfo)
 {
+	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_RECVD);
+
 	__asm__ __volatile("fence.i");
 }
 
+static void tlb_pmu_incr_fw_ctr(struct sbi_tlb_info *data)
+{
+	if (unlikely(!data))
+		return;
+
+	if (data->local_fn == sbi_tlb_local_fence_i)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_FENCE_I_SENT);
+	else if (data->local_fn == sbi_tlb_local_sfence_vma)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_SENT);
+	else if (data->local_fn == sbi_tlb_local_sfence_vma_asid)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SFENCE_VMA_ASID_SENT);
+	else if (data->local_fn == sbi_tlb_local_hfence_gvma)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_SENT);
+	else if (data->local_fn == sbi_tlb_local_hfence_gvma_vmid)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_GVMA_VMID_SENT);
+	else if (data->local_fn == sbi_tlb_local_hfence_vvma)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_SENT);
+	else if (data->local_fn == sbi_tlb_local_hfence_vvma_asid)
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
+}
+
 static void sbi_tlb_entry_process(struct sbi_tlb_info *tinfo)
 {
 	u32 rhartid;
@@ -368,6 +404,8 @@ int sbi_tlb_request(ulong hmask, ulong hbase, struct sbi_tlb_info *tinfo)
 	if (!tinfo->local_fn)
 		return SBI_EINVAL;
 
+	tlb_pmu_incr_fw_ctr(tinfo);
+
 	return sbi_ipi_send_many(hmask, hbase, tlb_event, tinfo);
 }
 
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 1ba649074b75..dda68d4375af 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_illegal_insn.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_misaligned_ldst.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_trap.h>
@@ -257,6 +258,10 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		rc  = sbi_ecall_handler(regs);
 		msg = "ecall handler failed";
 		break;
+	case CAUSE_LOAD_ACCESS:
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
+	case CAUSE_STORE_ACCESS:
+		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
 	default:
 		/* If the trap came from S or U mode, redirect it there */
 		trap.epc = regs->mepc;
-- 
2.25.1


