From: Anup Patel <anup.patel@wdc.com>
Date: Sat, 15 Aug 2020 22:30:54 +0530
Subject: [PATCH 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldbook_lock
Message-ID: <20200815170055.286732-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can have thundering hurd problem with coldboot_lock where the
boot HART can potentially starve trying to acquire coldboot_lock
because some of the non-boot HARTs are continuously acquiring and
releasing coldboot_lock. This can happen if WFI is a NOP OR if
MIP.MSIP bit is already set for some of the non-boot HARTs.

To avoid thundering hurd problem for coldboot_lock, we convert
coldboot_done flag into atomic variable and using coldboot_lock
only for coldboot_wait_hmask.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 lib/sbi/sbi_init.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a7fb848..6b58983 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -85,9 +85,10 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 }
 
 static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
-static unsigned long coldboot_done = 0;
 static struct sbi_hartmask coldboot_wait_hmask = { 0 };
 
+static atomic_t coldboot_done = ATOMIC_INITIALIZER(0);
+
 static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	unsigned long saved_mie, cmip;
@@ -105,16 +106,20 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	/* Mark current HART as waiting */
 	sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);
 
+	/* Release coldboot lock */
+	spin_unlock(&coldboot_lock);
+
 	/* Wait for coldboot to finish using WFI */
-	while (!coldboot_done) {
-		spin_unlock(&coldboot_lock);
+	while (!atomic_read(&coldboot_done)) {
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
 
@@ -132,12 +137,12 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 {
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
+	/* Mark coldboot done */
+	atomic_write(&coldboot_done, 1);
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


