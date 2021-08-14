From: Samuel Holland <samuel@sholland.org>
Date: Sat, 14 Aug 2021 08:41:47 -0500
Subject: [PATCH] lib: sbi_trap: Restore redirect for access faults
Message-ID: <20210814134147.14056-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit 764a17d852a8 ("lib: sbi: Implement firmware counters") added
switch cases for CAUSE_LOAD_ACCESS and CAUSE_STORE_ACCESS. This caused
them to stop being redirected to U or S mode, as that is handled in the
default switch case. As a result, an error in userspace could cause the
system to hang. Fix this by allowing the acces fault case to fall
through to the default case.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 lib/sbi/sbi_trap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 5781fea..8d20e04 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -259,11 +259,10 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 		msg = "ecall handler failed";
 		break;
 	case CAUSE_LOAD_ACCESS:
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
-		break;
 	case CAUSE_STORE_ACCESS:
-		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
-		break;
+		sbi_pmu_ctr_incr_fw(mcause == CAUSE_LOAD_ACCESS ?
+			SBI_PMU_FW_ACCESS_LOAD : SBI_PMU_FW_ACCESS_STORE);
+		/* fallthrough */
 	default:
 		/* If the trap came from S or U mode, redirect it there */
 		trap.epc = regs->mepc;
-- 
2.31.1


