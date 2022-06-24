From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 23 Jun 2022 23:50:27 -0700
Subject: [PATCH] lib: pmu: allow to use the highest available counter
Message-ID: <20220624065028.2895176-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sergey Matyukevich <geomatsi@gmail.com>

Both OpenSBI and OS explicitly assume that there is no hardware counter
with index 1: hardware uses that bit for TM control. So OpenSBI filters
out that index in sanity checks.
However, OpenSBI doesn't consider TM bit while returning the number of
counters. As a result, the supervisor software is aware of less number
of firmware counter.

The simple test is to make sure that there is no counter multiplexing
in the following command:

$ perf stat -e \
        r8000000000000000,r8000000000000001,r8000000000000002,r8000000000000003, \
        r8000000000000004,r8000000000000005,r8000000000000006,r8000000000000007, \
        r8000000000000008,r8000000000000009,r800000000000000a,r800000000000000b, \
        r800000000000000c,r800000000000000d,r800000000000000e,r800000000000000f  \
        ls
(16 firmware events with 16 counters won't require multiplexing)

Return accurate number of counters and update the firmware counter
starting index.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 3ecf536002a4..a532746c74be 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -594,7 +594,7 @@ static int pmu_ctr_find_fw(unsigned long cbase, unsigned long cmask, u32 hartid)
 	unsigned long ctr_mask = cmask << cbase;
 
 	if (cbase <= num_hw_ctrs)
-		fw_base = num_hw_ctrs + 1;
+		fw_base = num_hw_ctrs;
 	else
 		fw_base = cbase;
 
@@ -694,7 +694,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 		return SBI_EINVAL;
 
 	/* We have 31 HW counters with 31 being the last index(MHPMCOUNTER31) */
-	if (cidx <= num_hw_ctrs) {
+	if (cidx < num_hw_ctrs) {
 		cinfo.type = SBI_PMU_CTR_TYPE_HW;
 		cinfo.csr = CSR_CYCLE + cidx;
 		/* mcycle & minstret are always 64 bit */
@@ -749,7 +749,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		sbi_platform_pmu_init(plat);
 
 		/* mcycle & minstret is available always */
-		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 2;
+		num_hw_ctrs = sbi_hart_mhpm_count(scratch) + 3;
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 	}
 
-- 
2.25.1


