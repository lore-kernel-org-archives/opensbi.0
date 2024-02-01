From: yang.zhang <gaoshanliukou@163.com>
Date: Thu,  1 Feb 2024 18:30:20 +0800
Subject: [PATCH] lib: sbi: Add sparse hartid support for mtimer/ipi
Message-ID: <20240201103020.21181-1-gaoshanliukou@163.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If hartid is sparse, such as 0, 7, 16..., mtimer/mswi
can't work well.

Test:
1.Our platform support SMT, one core contains many harts
whoes number is configurable, so the hartids is sparse when
enter Opensbi?
2.I just simply simulate a scenario on qemu, like below
"qemu-system-riscv64 -M virt,aia=aplic -m 2g -smp 8 -dtb qemu2cpu.dtb
 -bios fw_jump.bin ..."
There are total 8 cpus, but the dts only suppor 2 cpu nodes, hartid are
0 and 7, so when enter opensbi, just hartid 0 and 7 are running, the others
are hanged, like sparse hartid.Then the issue happened.
Logs:
OpenSBI v1.4-11-g0dcc2e6
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

init_coldboot: timer init failed (error -1000)

Signed-off-by: yang.zhang <gaoshanliukou@163.com>
---
 lib/utils/ipi/aclint_mswi.c     | 2 +-
 lib/utils/timer/aclint_mtimer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 4ae6bb1..3bbab8b 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -102,7 +102,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 
 	/* Update MSWI pointer in scratch space */
 	for (i = 0; i < mswi->hart_count; i++) {
-		scratch = sbi_hartid_to_scratch(mswi->first_hartid + i);
+		scratch = sbi_hartindex_to_scratch(i);
 		/*
 		 * We don't need to fail if scratch pointer is not available
 		 * because we might be dealing with hartid of a HART disabled
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 271e625..77d5522 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -218,7 +218,7 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 
 	/* Update MTIMER pointer in scratch space */
 	for (i = 0; i < mt->hart_count; i++) {
-		scratch = sbi_hartid_to_scratch(mt->first_hartid + i);
+		scratch = sbi_hartindex_to_scratch(i);
 		/*
 		 * We don't need to fail if scratch pointer is not available
 		 * because we might be dealing with hartid of a HART disabled
-- 
2.25.1


