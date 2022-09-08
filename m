From: Heiko Stuebner <heiko@sntech.de>
Date: Thu,  8 Sep 2022 15:42:40 +0200
Subject: [PATCH v3 3/5] lib: sbi_pmu: add ability to override methods on non-standard platforms
In-Reply-To: <20220908134242.3133259-1-heiko@sntech.de>
References: <20220908134242.3133259-1-heiko@sntech.de>
Message-ID: <20220908134242.3133259-4-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some platforms may not implement the PMU in a standard way,
but instead deviate on some functionality like overflow
handling.

Implement an abstraction that those platforms can hook into.
This way they can still use the standard pmu interface between
kernel and firmware and profit from things like firmware counters,
without needing to create their own.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/sbi/sbi_pmu.h | 13 +++++++++++++
 lib/sbi/sbi_hart.c    |  7 +++++++
 lib/sbi/sbi_pmu.c     | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index 1c9a997..7c8cfe7 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -28,6 +28,16 @@
 #define SBI_PMU_CTR_MAX	   (SBI_PMU_HW_CTR_MAX + SBI_PMU_FW_CTR_MAX)
 #define SBI_PMU_FIXED_CTR_MASK 0x07
 
+struct sbi_pmu_platform_ops {
+	int (*ctr_enable_irq_hw)(int ctr_idx);
+	int (*ctr_enable_ovf)(int ctr_idx);
+	int (*irq_bit)(void);
+	void (*counter_data)(unsigned int *count, unsigned int *bits);
+};
+
+/** Set platform-specific override ops */
+void sbi_pmu_set_platform_ops(struct sbi_pmu_platform_ops *ops);
+
 /** Initialize PMU */
 int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
 
@@ -37,6 +47,9 @@ void sbi_pmu_exit(struct sbi_scratch *scratch);
 /** Return the pmu irq bit depending on extension existence */
 int sbi_pmu_irq_bit(void);
 
+/** Allow non-standard platforms to override probed counter information */
+void sbi_pmu_override_counter_data(unsigned int *count, unsigned int *bits);
+
 /**
  * Add the hardware event to counter mapping information. This should be called
  * from the platform code to update the mapping table.
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 45fbcde..6506a19 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -632,6 +632,13 @@ __mhpm_skip:
 #undef __check_csr_2
 #undef __check_csr
 
+	/**
+	 * Allow non-standard implementations to override the detected
+	 * values for number of counters and bits.
+	 */
+	sbi_pmu_override_counter_data(&hfeatures->mhpm_count,
+				      &hfeatures->mhpm_bits);
+
 	/* Detect if hart supports Priv v1.10 */
 	val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
 	if (!trap.cause)
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index efbfbb6..08fb242 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -77,6 +77,8 @@ static uint32_t num_hw_ctrs;
 /* Maximum number of counters available */
 static uint32_t total_ctrs;
 
+static struct sbi_pmu_platform_ops *pmu_platform_ops;
+
 /* Helper macros to retrieve event idx and code type */
 #define get_cidx_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
 #define get_cidx_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
@@ -358,6 +360,9 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		pmu_ctr_enable_irq_hw(cidx);
+	else if (pmu_platform_ops && pmu_platform_ops->ctr_enable_irq_hw)
+		pmu_platform_ops->ctr_enable_irq_hw(cidx);
+
 	csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
 
 skip_inhibit_update:
@@ -373,6 +378,8 @@ int sbi_pmu_irq_bit(void)
 
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		return MIP_LCOFIP;
+	else if (pmu_platform_ops && pmu_platform_ops->irq_bit)
+		return pmu_platform_ops->irq_bit();
 
 	return 0;
 }
@@ -534,6 +541,8 @@ static int pmu_update_hw_mhpmevent(struct sbi_pmu_hw_event *hw_evt, int ctr_idx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
 		mhpmevent_val = (mhpmevent_val & ~MHPMEVENT_SSCOF_MASK) |
 				 MHPMEVENT_MINH | MHPMEVENT_OF;
+	else if (pmu_platform_ops && pmu_platform_ops->ctr_enable_ovf)
+		pmu_platform_ops->ctr_enable_ovf(ctr_idx);
 
 	/* Update the inhibit flags based on inhibit flags received from supervisor */
 	pmu_update_inhibit_flags(flags, &mhpmevent_val);
@@ -822,3 +831,15 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	return 0;
 }
+
+void sbi_pmu_override_counter_data(unsigned int *count,
+				   unsigned int *bits)
+{
+	if (pmu_platform_ops && pmu_platform_ops->counter_data)
+		pmu_platform_ops->counter_data(count, bits);
+}
+
+void sbi_pmu_set_platform_ops(struct sbi_pmu_platform_ops *ops)
+{
+	pmu_platform_ops = ops;
+}
-- 
2.35.1


