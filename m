From: Heiko Stuebner <heiko@sntech.de>
Date: Thu,  8 Sep 2022 15:42:39 +0200
Subject: [PATCH v3 2/5] lib: sbi_pmu: move pmu irq information into pmu itself
In-Reply-To: <20220908134242.3133259-1-heiko@sntech.de>
References: <20220908134242.3133259-1-heiko@sntech.de>
Message-ID: <20220908134242.3133259-3-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't spread checking for pmu extensions through the code
but instead introduce a sbi-pmu function that other code can
call to get the correct information about the existence of the
pmu interrupt.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/sbi/sbi_pmu.h |  3 +++
 lib/sbi/sbi_hart.c    |  4 ++--
 lib/sbi/sbi_pmu.c     | 10 ++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index f5e3dbd..1c9a997 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -34,6 +34,9 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot);
 /** Reset PMU during hart exit */
 void sbi_pmu_exit(struct sbi_scratch *scratch);
 
+/** Return the pmu irq bit depending on extension existence */
+int sbi_pmu_irq_bit(void);
+
 /**
  * Add the hardware event to counter mapping information. This should be called
  * from the platform code to update the mapping table.
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 9540e5c..45fbcde 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -19,6 +19,7 @@
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 
@@ -208,8 +209,7 @@ static int delegate_traps(struct sbi_scratch *scratch)
 
 	/* Send M-mode interrupts and most exceptions to S-mode */
 	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
-	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
-		interrupts |= MIP_LCOFIP;
+	interrupts |= sbi_pmu_irq_bit();
 
 	exceptions = (1U << CAUSE_MISALIGNED_FETCH) | (1U << CAUSE_BREAKPOINT) |
 		     (1U << CAUSE_USER_ECALL);
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5a294a2..efbfbb6 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -367,6 +367,16 @@ skip_inhibit_update:
 	return 0;
 }
 
+int sbi_pmu_irq_bit(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+		return MIP_LCOFIP;
+
+	return 0;
+}
+
 static int pmu_ctr_start_fw(uint32_t cidx, uint32_t fw_evt_code,
 			    uint64_t ival, bool ival_update)
 {
-- 
2.35.1


