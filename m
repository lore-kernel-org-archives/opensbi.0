From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue,  9 Jan 2024 19:24:44 +0800
Subject: [RFC PATCH 2/2] lib: sbi_pmu: Add PMU snapshot implementation
In-Reply-To: <IA1PR20MB495392B203C9DF5A3FF4F4A6BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495392B203C9DF5A3FF4F4A6BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <IA1PR20MB49537C182ADC9D50F6EB9D36BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI PMU snapshot is an opetional extension that allow supervisor to save
a snapshot about PMU counter status. which is useful for KVM snapshot.

Add the implementation of the PMU snapshot, and remove the related error.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 include/sbi/sbi_pmu.h   |   4 ++
 lib/sbi/sbi_ecall_pmu.c |   3 +-
 lib/sbi/sbi_pmu.c       | 143 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 143 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 7d32a4d..c755ed5 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -150,4 +150,8 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,

 int sbi_pmu_ctr_incr_fw(enum sbi_pmu_fw_event_code_id fw_id);

+int sbi_pmu_set_snapshot_shmem(unsigned long shmem_phys_lo,
+			       unsigned long shmem_phys_hi,
+			       unsigned long flags);
+
 #endif
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 40a63a6..8e9a82e 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -74,7 +74,8 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
 		break;
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
-		/* fallthrough as OpenSBI doesn't support snapshot yet */
+		ret = sbi_pmu_set_snapshot_shmem(regs->a0, regs->a1, regs->a2);
+		break;
 	default:
 		ret = SBI_ENOTSUPP;
 	}
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 6209ccc..5892537 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_shm.h>
 #include <sbi/sbi_string.h>

 /** Information about hardware counters */
@@ -68,8 +69,22 @@ struct sbi_pmu_hart_state {
 	 * and hence can optimally share the same memory.
 	 */
 	uint64_t fw_counters_data[SBI_PMU_FW_CTR_MAX];
+
+	/* Shared memory for pmu */
+	struct sbi_shmem shmem;
 };

+#define PMU_SNAPSHOT_SHMEM_ALIGN			4096
+#define PMU_SNAPSHOT_SHMEM_SIZE				4096
+
+#define PMU_SNAPSHOT_COUNTER_OF_MAP_OFFSET		0x0000
+#define PMU_SNAPSHOT_COUNTER_OFFSET_BASE		0x0008
+#define PMU_SNAPSHOT_COUNTER_ENTRY_SIZE			8
+
+#define PMU_SNAPSHOT_COUNTER_OFFSET(i)			\
+	(PMU_SNAPSHOT_COUNTER_OFFSET_BASE +		\
+	 PMU_SNAPSHOT_COUNTER_ENTRY_SIZE * (i))
+
 /** Offset of pointer to PMU HART state in scratch space */
 static unsigned long phs_ptr_offset;

@@ -333,6 +348,39 @@ static int pmu_ctr_enable_irq_hw(int ctr_idx)
 	return 0;
 }

+static uint64_t pmu_ctr_read_hw_of(uint32_t cidx)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	uint32_t overflow;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		return 0;
+
+	if (cidx < (CSR_INSTRET - CSR_CYCLE))
+		return 0;
+#if __riscv_xlen == 32
+	overflow = csr_read_num(CSR_MHPMEVENT3H + cidx - 3) & MHPMEVENTH_OF;
+#else
+	overflow = csr_read_num(CSR_MHPMEVENT3 + cidx - 3) & MHPMEVENT_OF;
+#endif
+	if (overflow)
+		return 1;
+	else
+		return 0;
+}
+
+static uint64_t pmu_ctr_read_hw(uint32_t cidx)
+{
+	uint64_t cval;
+#if __riscv_xlen == 32
+	cval = csr_read_num(CSR_MCYCLE + cidx) |
+	       csr_read_num(CSR_MCYCLEH + cidx) << BITS_PER_LONG;
+#else
+	cval = csr_read_num(CSR_MCYCLE + cidx);
+#endif
+	return cval;
+}
+
 static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
 {
 #if __riscv_xlen == 32
@@ -428,33 +476,64 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 	return 0;
 }

+static void pmu_ctrl_read_snapshot(struct sbi_pmu_hart_state *phs,
+				   int i, int eid_type,
+				   uint64_t of_val, uint64_t *ival)
+{
+	sbi_shmem_read_u64(&phs->shmem,
+			   PMU_SNAPSHOT_COUNTER_OFFSET(i),
+			   ival);
+
+	if (eid_type == SBI_PMU_EVENT_TYPE_FW)
+		return;
+
+	if (BIT(i) & of_val)
+		*ival |= MHPMEVENT_OF;
+}
+
 int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 		      unsigned long flags, uint64_t ival)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 	int event_idx_type;
 	uint32_t event_code;
 	int ret = SBI_EINVAL;
-	bool bUpdate = false;
+	bool bUpdate = false, sUpdate = false;
 	int i, cidx;
-	uint64_t edata;
+	uint64_t edata, of_val = 0;

 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return ret;

-	if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
-		return SBI_ENO_SHMEM;
+	if (flags & SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT)
+		sUpdate = true;

 	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
 		bUpdate = true;

+	if (sUpdate) {
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+			sbi_shmem_read_u64(&phs->shmem,
+					   PMU_SNAPSHOT_COUNTER_OF_MAP_OFFSET,
+					   &of_val);
+
+		/* Snapshot initialization implicit value update */
+		bUpdate = true;
+	}
+
 	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
 		event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 		if (event_idx_type < 0)
 			/* Continue the start operation for other counters */
 			continue;
-		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW) {
+
+		if (sUpdate)
+			pmu_ctrl_read_snapshot(phs, i, event_idx_type,
+					       of_val, &ival);
+
+		if (event_idx_type == SBI_PMU_EVENT_TYPE_FW) {
 			edata = (event_code == SBI_PMU_FW_PLATFORM) ?
 				 phs->fw_counters_data[cidx - num_hw_ctrs]
 				 : 0x0;
@@ -538,13 +617,16 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	int ret = SBI_EINVAL;
 	int event_idx_type;
 	uint32_t event_code;
+	bool record = false;
+	uint64_t counter_val;
+	uint64_t of_val = 0;
 	int i, cidx;

 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return SBI_EINVAL;

 	if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
-		return SBI_ENO_SHMEM;
+		record = true;

 	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
@@ -558,12 +640,30 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		else
 			ret = pmu_ctr_stop_hw(cidx);

+		if (record) {
+			if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
+				ret = sbi_pmu_ctr_fw_read(cidx, &counter_val);
+			else {
+				counter_val = pmu_ctr_read_hw(cidx);
+				of_val = pmu_ctr_read_hw_of(cidx) << cidx;
+			}
+
+			sbi_shmem_write_u64(&phs->shmem,
+					    PMU_SNAPSHOT_COUNTER_OFFSET(i),
+					    counter_val);
+		}
+
 		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
 			phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
 			pmu_reset_hw_mhpmevent(cidx);
 		}
 	}

+	if (record)
+		sbi_shmem_write_u64(&phs->shmem,
+				    PMU_SNAPSHOT_COUNTER_OF_MAP_OFFSET,
+				    of_val);
+
 	return ret;
 }

@@ -946,6 +1046,37 @@ static void pmu_reset_event_map(struct sbi_pmu_hart_state *phs)
 	phs->fw_counters_started = 0;
 }

+int sbi_pmu_set_snapshot_shmem(unsigned long shmem_phys_lo,
+			       unsigned long shmem_phys_hi,
+			       unsigned long flags)
+{
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+	int ret;
+
+	if (flags)
+		return SBI_EINVAL;
+
+	/* remove the stop flag */
+	if (shmem_phys_lo == -1 && shmem_phys_hi == -1) {
+		sbi_shmem_region_clear(&phs->shmem);
+		return 0;
+	}
+
+	ret = sbi_shmem_region_init(shmem_phys_lo, shmem_phys_hi,
+				    PMU_SNAPSHOT_SHMEM_SIZE,
+				    PMU_SNAPSHOT_SHMEM_ALIGN,
+				    &phs->shmem);
+	if (ret)
+		return ret;
+
+	ret = sbi_shmem_region_check(&phs->shmem,
+				     SBI_SHMEM_M_RW | SBI_SHMEM_S_RW);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 const struct sbi_pmu_device *sbi_pmu_get_device(void)
 {
 	return pmu_dev;
--
2.43.0


