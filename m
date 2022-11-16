From: Eric Lin <eric.lin@sifive.com>
Date: Wed, 16 Nov 2022 18:18:26 +0800
Subject: [PATCH] lib: sbi: Bypass CY and IR bit setting in mcountinhibit
Message-ID: <20221116101826.10465-1-eric.lin@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

CYCLE and INSTRET counters are part of uABI and they were
re-enable for userspace in Linux riscv pmu driver.

To make these counters increase normally in userspace, we bypass
CY and IR bit checking when setting mcountinhibit register.

LINK:https://lore.kernel.org/all/20220928131807.30386-1-palmer at rivosinc.com/
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 lib/sbi/sbi_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 91d9ccc..28107e5 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -318,7 +318,7 @@ static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
 	if (cidx >= num_hw_ctrs || cidx == 1)
 		return SBI_EINVAL;
 
-	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
+	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
 		goto skip_inhibit_update;
 
 	/*
@@ -413,7 +413,7 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	unsigned long mctr_inhbt;
 
-	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11)
+	if (sbi_hart_priv_version(scratch) < SBI_HART_PRIV_VER_1_11 || cidx == 0 || cidx == 2)
 		return 0;
 
 	mctr_inhbt = csr_read(CSR_MCOUNTINHIBIT);
-- 
2.36.1


