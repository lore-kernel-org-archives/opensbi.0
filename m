From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 28 Apr 2022 10:25:22 -0700
Subject: [PATCH] lib: sbi: Fix mhpmeventh access for rv32 in absence of
 sscofpmf
Message-ID: <20220428172522.998645-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MHPMEVENT3H-31H are defined in sscofpmf extension. Thus, they should be
accessed only if sscofpmf is present.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 7ea0ca5e2fa7..372423796cbf 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -400,11 +400,13 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t fw_evt_code)
 
 static int pmu_reset_hw_mhpmevent(int ctr_idx)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	if (ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
 		return SBI_EFAIL;
 #if __riscv_xlen == 32
 	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
-	csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, 0);
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
+		csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, 0);
 #else
 	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
 #endif
@@ -483,7 +485,9 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 
 #if __riscv_xlen == 32
 	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
-	csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, mhpmevent_val >> BITS_PER_LONG);
+	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_SSCOFPMF))
+		csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3,
+			      mhpmevent_val >> BITS_PER_LONG);
 #else
 	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val);
 #endif
-- 
2.25.1


