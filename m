From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  8 Nov 2021 10:53:03 -0800
Subject: [PATCH v5 08/12] lib: sbi: Reset the mhpmevent value upon counter
 reset
In-Reply-To: <20211108185307.389145-1-atish.patra@wdc.com>
References: <20211108185307.389145-1-atish.patra@wdc.com>
Message-ID: <20211108185307.389145-9-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hardware solely relies on the event selector value in mhpmevent
to figure out what event to monitor using that counter. It should be
reset when counter reset happens.

Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_pmu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 818b87555e69..1bb3e49412b7 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -369,6 +369,20 @@ static int pmu_ctr_stop_fw(uint32_t cidx, uint32_t fw_evt_code)
 	return 0;
 }
 
+static int pmu_reset_hw_mhpmevent(int ctr_idx)
+{
+	if (ctr_idx < 3 || ctr_idx >= SBI_PMU_HW_CTR_MAX)
+		return SBI_EFAIL;
+#if __riscv_xlen == 32
+	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
+	csr_write_num(CSR_MHPMEVENT3H + ctr_idx - 3, 0);
+#else
+	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, 0);
+#endif
+
+	return 0;
+}
+
 int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		     unsigned long flag)
 {
@@ -392,8 +406,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		else
 			ret = pmu_ctr_stop_hw(cbase);
 
-		if (!ret && (flag & SBI_PMU_STOP_FLAG_RESET))
+		if (flag & SBI_PMU_STOP_FLAG_RESET) {
 			active_events[hartid][cbase] = SBI_PMU_EVENT_IDX_INVALID;
+			pmu_reset_hw_mhpmevent(cbase);
+		}
 	}
 
 	return ret;
-- 
2.31.1


