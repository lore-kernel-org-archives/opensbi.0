From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu, 13 Aug 2020 18:24:15 +0200
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
Message-ID: <20200813162415.124469-1-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

OpenSBI hangs in wake_coldboot_harts() indefinitely on the MaixDuino board
when trying to boot U-Boot as FW_PAYLOAD.

Even if reading and writing coldboot_done is not atomic it is safe to check
it without using a spinlock.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 lib/sbi/sbi_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index a7fb848..a0e4f11 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -106,14 +106,14 @@ static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hartmask_set_hart(hartid, &coldboot_wait_hmask);

 	/* Wait for coldboot to finish using WFI */
+	spin_unlock(&coldboot_lock);
 	while (!coldboot_done) {
-		spin_unlock(&coldboot_lock);
 		do {
 			wfi();
 			cmip = csr_read(CSR_MIP);
 		 } while (!(cmip & MIP_MSIP));
-		spin_lock(&coldboot_lock);
 	};
+	spin_lock(&coldboot_lock);

 	/* Unmark current HART as waiting */
 	sbi_hartmask_clear_hart(hartid, &coldboot_wait_hmask);
--
2.28.0


