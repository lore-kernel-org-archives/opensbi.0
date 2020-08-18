From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 18 Aug 2020 09:37:27 +0530
Subject: [PATCH v3 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldboot_lock
Message-ID: <20200818040728.528426-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can have thundering hurd problem with coldboot_lock where the
boot HART can potentially starve trying to acquire coldboot_lock
because some of the non-boot HARTs are continuously acquiring and
releasing coldboot_lock. This can happen if MIP.MSIP bit is already
set for some of the non-boot HARTs.

To avoid thundering hurd problem for coldboot_lock, we use the
__smp_load_acquire() and __smp_store_release() for coldboot_done
flag and use coldboot_lock only for coldboot_wait_hmask.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_init.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a7fb848..c438eaa 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -9,6 +9,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_atomic.h>
+#include <sbi/riscv_barrier.h>
 #include <sbi/riscv_locks.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_ecall.h>
@@ -85,9 +86,10 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 }
 
 static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
-static unsigned long coldboot_done = 0;
 static struct sbi_hartmask coldboot_wait_hmask = { 0 };
 
+static unsigned long coldboot_done;
+
 static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	unsigned long saved_mie, cmip;
@@ -105,16 +107,20 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	/* Mark current HART as waiting */
 	sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
 
+	/* Release coldboot lock */
+	spin_unlock(&coldboot_lock);
+
 	/* Wait for coldboot to finish using WFI */
-	while (!coldboot_done) {
-		spin_unlock(&coldboot_lock);
+	while (!__smp_load_acquire(&coldboot_done)) {
 		do {
 			wfi();
 			cmip = csr_read(CSR_MIP);
 		 } while (!(cmip & MIP_MSIP));
-		spin_lock(&coldboot_lock);
 	};
 
+	/* Acquire coldboot lock */
+	spin_lock(&coldboot_lock);
+
 	/* Unmark current HART as waiting */
 	sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
 
@@ -132,12 +138,12 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 {
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	/* Mark coldboot done */
+	__smp_store_release(&coldboot_done, 1);
+
 	/* Acquire coldboot lock */
 	spin_lock(&coldboot_lock);
 
-	/* Mark coldboot done */
-	coldboot_done = 1;
-
 	/* Send an IPI to all HARTs waiting for coldboot */
 	for (int i = 0; i <= sbi_scratch_last_hartid(); i++) {
 		if ((i != hartid) &&
-- 
2.25.1


