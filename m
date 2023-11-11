From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 11 Nov 2023 12:16:40 +0800
Subject: [PATCH] lib: sbi_pmu: disable IR and CY counter in SBI initialization
Message-ID: <IA1PR20MB49535075F058FF74E83CD41BBBADA@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The default overflow behavior of INSTRET and CYCLE counter remains
unclear when platform has a custom pmu_device with irq callback.
For example, enabling the IR and CY events in the startup without
setting related CSRs may cause missing interrupt and wrong event
report for D1 soc.

Disable IR and CY counter in the startup and let OS manage them.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 lib/sbi/sbi_hart.c | 2 +-
 lib/sbi/sbi_pmu.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 29d6481..8a908d6 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -64,7 +64,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 
 	/* All programmable counters will start running at runtime after S-mode request */
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
-		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
+		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFFD);
 
 	/**
 	 * The mhpmeventn[h] CSR should be initialized with interrupt disabled
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index f4c8fc4..1e2fc01 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -944,7 +944,7 @@ void sbi_pmu_set_device(const struct sbi_pmu_device *dev)
 void sbi_pmu_exit(struct sbi_scratch *scratch)
 {
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
-		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFF8);
+		csr_write(CSR_MCOUNTINHIBIT, 0xFFFFFFFD);
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		csr_write(CSR_MCOUNTEREN, -1);
-- 
2.42.1


