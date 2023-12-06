From: Atish Patra <atishp@rivosinc.com>
Date: Tue,  5 Dec 2023 17:08:43 -0800
Subject: [v1 1/2] lib: sbi_pmu: Add PMU snapshot definitions
In-Reply-To: <20231206010844.1739845-1-atishp@rivosinc.com>
References: <20231206010844.1739845-1-atishp@rivosinc.com>
Message-ID: <20231206010844.1739845-2-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI doesn't support SBI PMU snapshot yet as there is not much benefit
unless the multiple counters overflow at the same time.

Just add the definition and return not supported error at this moment. The
default returned error is also not supported. Thus, no functional change
intended.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 3 +++
 lib/sbi/sbi_ecall_pmu.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 1fe469e37078..b4e6f63e0bf0 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -103,6 +103,7 @@
 #define SBI_EXT_PMU_COUNTER_STOP	0x4
 #define SBI_EXT_PMU_COUNTER_FW_READ	0x5
 #define SBI_EXT_PMU_COUNTER_FW_READ_HI	0x6
+#define SBI_EXT_PMU_SNAPSHOT_SET_SHMEM	0x7
 
 /** General pmu event codes specified in SBI PMU extension */
 enum sbi_pmu_hw_generic_events_t {
@@ -241,9 +242,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT (1 << 1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT (1 << 1)
 
 /* SBI function IDs for DBCN extension */
 #define SBI_EXT_DBCN_CONSOLE_WRITE		0x0
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 1d5d512eeed7..c58591106d09 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -74,6 +74,8 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 	case SBI_EXT_PMU_COUNTER_STOP:
 		ret = sbi_pmu_ctr_stop(regs->a0, regs->a1, regs->a2);
 		break;
+	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
+		/* fallthrough as OpenSBI doesn't support snapshot yet */
 	default:
 		ret = SBI_ENOTSUPP;
 	}
-- 
2.34.1


