From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 6 Sep 2023 17:40:46 +0800
Subject: [PATCH 1/6] sbi: sbi_pmu: Add hw_counter_filter_mode() to pmu device
In-Reply-To: <20230906094051.3957564-1-peterlin@andestech.com>
References: <20230906094051.3957564-1-peterlin@andestech.com>
Message-ID: <20230906094051.3957564-2-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for custom PMU extensions to set inhibit bits
on custom CSRs by introducing the PMU device callback
hw_counter_filter_mode(). This allows the perf tool to
restrict event counting under a specified privileged
mode by appending a modifier, e.g. perf record -e event:k
to count events only happening in kernel mode.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 include/sbi/sbi_pmu.h | 6 ++++++
 lib/sbi/sbi_pmu.c     | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 16f6877..d63149c 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -89,6 +89,12 @@ struct sbi_pmu_device {
 	 * Custom function returning the machine-specific irq-bit.
 	 */
 	int (*hw_counter_irq_bit)(void);
+
+	/**
+	 * Custom function to inhibit counting of events while in
+	 * specified mode.
+	 */
+	void (*hw_counter_filter_mode)(unsigned long flags, int counter_index);
 };
 
 /** Get the PMU platform device */
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e8bed49..cfe9b0c 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -594,7 +594,10 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 		pmu_dev->hw_counter_disable_irq(ctr_idx);
 
 	/* Update the inhibit flags based on inhibit flags received from supervisor */
-	pmu_update_inhibit_flags(flags, &mhpmevent_val);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		pmu_update_inhibit_flags(flags, &mhpmevent_val);
+	if (pmu_dev && pmu_dev->hw_counter_filter_mode)
+		pmu_dev->hw_counter_filter_mode(flags, ctr_idx);
 
 #if __riscv_xlen == 32
 	csr_write_num(CSR_MHPMEVENT3 + ctr_idx - 3, mhpmevent_val & 0xFFFFFFFF);
-- 
2.34.1


