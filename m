From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:38 -0800
Subject: [PATCH 4/5] lib: sbi_pmu: Implement SBI PMU event info function
In-Reply-To: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
Message-ID: <20241119-pmu_event_info-v1-4-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow the supervisor software to query about the event using the
new function. This supports both firmware and hardware events.
The hardware event presence is verified hw_event_map which is populated
via PMU device tree node. The firmware event presence is checked through
event validation function which should take care of both standard and
platform firmware events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_pmu.h   |  2 ++
 lib/sbi/sbi_ecall_pmu.c |  3 ++
 lib/sbi/sbi_pmu.c       | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 8b1e08c81f30..3649d476475a 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -142,6 +142,8 @@ int sbi_pmu_ctr_start(unsigned long cidx_base, unsigned long cidx_mask,
 		      unsigned long flags, uint64_t ival);
 
 int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info);
+int sbi_pmu_event_get_info(unsigned long shmem_lo, unsigned long shmem_high,
+						   unsigned long num_events, unsigned long flags);
 
 unsigned long sbi_pmu_num_ctr(void);
 
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 40a63a626f6b..ae7aeca9b8f8 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -73,6 +73,9 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 	case SBI_EXT_PMU_COUNTER_STOP:
 		ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = sbi_pmu_event_get_info(regs->a0, regs->a1, regs->a2, regs->a3);
+		break;
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		/* fallthrough as OpenSBI doesn't support snapshot yet */
 	default:
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 1ed578bac23e..3fc50c0b25e2 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_heap.h>
@@ -968,6 +969,81 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 	return 0;
 }
 
+int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
+			   unsigned long num_events, unsigned long flags)
+{
+	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+	int i, j, event_type;
+	struct sbi_pmu_event_info *einfo;
+	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
+	uint32_t event_idx;
+	struct sbi_pmu_hw_event *temp;
+	bool found = false;
+
+	if (flags != 0)
+		return SBI_ERR_INVALID_PARAM;
+
+	/** Check shared memory size and address aligned to 16 byte */
+	if (!num_events || (shmem_phys_lo & 0xF))
+		return SBI_ERR_INVALID_PARAM;
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
+	if (shmem_phys_hi)
+		return SBI_EINVALID_ADDR;
+
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
+					 shmem_phys_lo, shmem_size, PRV_S,
+					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_ERR_INVALID_ADDRESS;
+
+	sbi_hart_map_saddr(shmem_phys_lo, shmem_size);
+
+	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
+	for (i = 0; i < num_events; i++) {
+		event_idx = einfo[i].event_idx;
+		event_type = pmu_event_validate(phs, event_idx, einfo[i].event_data);
+		if (event_type < 0) {
+			einfo[i].output = 0;
+		} else {
+			for (j = 0; j < num_hw_events; j++) {
+				temp = &hw_event_map[j];
+				if (temp->start_idx <= event_idx && event_idx <= temp->end_idx) {
+					found = true;
+					break;
+				}
+				/* For raw events, event data is used as the select value */
+				if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
+					event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
+					uint64_t select_mask = temp->select_mask;
+
+					/* just match the selector */
+					if (temp->select == (einfo[i].event_data & select_mask)) {
+						found = true;
+						break;
+					}
+				}
+			}
+			if (found)
+				einfo[i].output = 1;
+			else
+				einfo[i].output = 0;
+			found = false;
+		}
+	}
+
+	sbi_hart_unmap_saddr();
+
+	return 0;
+}
+
 static void pmu_reset_event_map(struct sbi_pmu_hart_state *phs)
 {
 	int j;

-- 
2.34.1


