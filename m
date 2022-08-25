From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:39 +0530
Subject: [PATCH 2/7] lib: sbi_pmu: Replace sbi_pmu_ctr_read() with sbi_pmu_ctr_fw_read()
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "read a firmware counter" SBI call should only work for firmware
counters so let us replace sbi_pmu_ctr_read() with sbi_pmu_ctr_fw_read()
which works only on firmware counters.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_pmu.h   |  2 +-
 lib/sbi/sbi_ecall_pmu.c |  3 ++-
 lib/sbi/sbi_pmu.c       | 45 +++++++----------------------------------
 3 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index f5e3dbd..34336f7 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -53,7 +53,7 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
 
 int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap);
 
-int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval);
+int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval);
 
 int sbi_pmu_ctr_stop(unsigned long cidx_base, unsigned long cidx_mask,
 		     unsigned long flag);
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 9ee9e81..826c8a8 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -51,7 +51,8 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ:
-		ret = sbi_pmu_ctr_read(regs->a0, out_val);
+		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
+		*out_val = temp;
 		break;
 	case SBI_EXT_PMU_COUNTER_START:
 
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 535e5cc..250808e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -167,50 +167,19 @@ static int pmu_ctr_validate(uint32_t cidx, uint32_t *event_idx_code)
 	return event_idx_type;
 }
 
-static int pmu_ctr_read_fw(uint32_t cidx, unsigned long *cval,
-			       uint32_t fw_evt_code)
-{
-	u32 hartid = current_hartid();
-	struct sbi_pmu_fw_event fevent;
-
-	fevent = fw_event_map[hartid][fw_evt_code];
-	*cval = fevent.curr_count;
-
-	return 0;
-}
-
-/* Add a hardware counter read for completeness for future purpose */
-static int pmu_ctr_read_hw(uint32_t cidx, uint64_t *cval)
-{
-	/* Check for invalid hw counter read requests */
-	if (unlikely(cidx == 1))
-		return SBI_EINVAL;
-#if __riscv_xlen == 32
-	uint32_t temp, temph = 0;
-
-	temp = csr_read_num(CSR_MCYCLE + cidx);
-	temph = csr_read_num(CSR_MCYCLEH + cidx);
-	*cval = ((uint64_t)temph << 32) | temp;
-#else
-	*cval = csr_read_num(CSR_MCYCLE + cidx);
-#endif
-
-	return 0;
-}
-
-int sbi_pmu_ctr_read(uint32_t cidx, unsigned long *cval)
+int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 {
 	int event_idx_type;
 	uint32_t event_code;
-	uint64_t cval64;
+	u32 hartid = current_hartid();
+	struct sbi_pmu_fw_event *fevent;
 
 	event_idx_type = pmu_ctr_validate(cidx, &event_code);
-	if (event_idx_type < 0)
+	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
-	else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
-		pmu_ctr_read_fw(cidx, cval, event_code);
-	else
-		pmu_ctr_read_hw(cidx, &cval64);
+
+	fevent = &fw_event_map[hartid][event_code];
+	*cval = fevent->curr_count;
 
 	return 0;
 }
-- 
2.34.1


