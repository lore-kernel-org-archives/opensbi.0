From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Mar 2024 20:29:30 +0530
Subject: [PATCH 2/2] lib: sbi: Wakeup non-coldboot HARTs early in the coldboot path
In-Reply-To: <20240319145930.1827176-1-apatel@ventanamicro.com>
References: <20240319145930.1827176-1-apatel@ventanamicro.com>
Message-ID: <20240319145930.1827176-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, all non-coldboot HARTs busy spin in wait_for_coldboot()
until the entire coldboot init sequence is completed.

This means:
1) On QEMU, all non-coldboot HARTs will eat host CPU time and
   also slow down the coldboot HART until the entire coldboot
   init sequence is completed.
2) On real HW, all non-coldboot HARTs will consume more CPU
   power until the entire coldboot init sequence is completed.

To address this, wake up all non-coldboot HARTs as early as
possible in the coldboot init sequence.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index b3f3e38..8fdc8de 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -243,6 +243,14 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
+	/*
+	 * All non-coldboot HARTs do HSM initialization (i.e. enter HSM state
+	 * machine) at the start of the warmboot path so it is wasteful to
+	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
+	 * path is completed.
+	 */
+	wake_coldboot_harts(scratch, hartid);
+
 	rc = sbi_platform_early_init(plat, true);
 	if (rc)
 		sbi_hart_hang();
@@ -348,8 +356,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
-	wake_coldboot_harts(scratch, hartid);
-
 	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
 	(*count)++;
 
@@ -369,6 +375,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
 	(*count)++;
 
+	/* Note: This has to be first thing in warmboot init sequence */
 	rc = sbi_hsm_init(scratch, hartid, false);
 	if (rc)
 		sbi_hart_hang();
-- 
2.34.1


