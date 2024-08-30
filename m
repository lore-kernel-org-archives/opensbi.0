From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:49:16 -0700
Subject: [PATCH 12/12] lib: sbi: Remove unused hartid parameters
In-Reply-To: <20240830154929.3971790-1-samuel.holland@sifive.com>
References: <20240830154929.3971790-1-samuel.holland@sifive.com>
Message-ID: <20240830154929.3971790-13-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

None of these functions use their hartid parameter.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_hsm.h |  2 +-
 lib/sbi/sbi_hsm.c     |  6 +++---
 lib/sbi/sbi_init.c    | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index e4b92c80..ae098f45 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -59,7 +59,7 @@ const struct sbi_hsm_device *sbi_hsm_get_device(void);
 
 void sbi_hsm_set_device(const struct sbi_hsm_device *dev);
 
-int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot);
+int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot);
 void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
 
 int sbi_hsm_hart_start(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 5679819c..58a33798 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -157,7 +157,7 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
-static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
+static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 {
 	unsigned long saved_mie;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
@@ -236,7 +236,7 @@ static void hsm_device_hart_resume(void)
 		hsm_dev->hart_resume();
 }
 
-int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
+int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	u32 i;
 	struct sbi_scratch *rscratch;
@@ -262,7 +262,7 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 			ATOMIC_INIT(&hdata->start_ticket, 0);
 		}
 	} else {
-		sbi_hsm_hart_wait(scratch, hartid);
+		sbi_hsm_hart_wait(scratch);
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 18d33088..cccd723d 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -193,14 +193,14 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 
 static unsigned long coldboot_done;
 
-static void wait_for_coldboot(struct sbi_scratch *scratch, u32 hartid)
+static void wait_for_coldboot(struct sbi_scratch *scratch)
 {
 	/* Wait for coldboot to finish */
 	while (!__smp_load_acquire(&coldboot_done))
 		cpu_relax();
 }
 
-static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
+static void wake_coldboot_harts(struct sbi_scratch *scratch)
 {
 	/* Mark coldboot done */
 	__smp_store_release(&coldboot_done, 1);
@@ -241,7 +241,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
 	(*count)++;
 
-	rc = sbi_hsm_init(scratch, hartid, true);
+	rc = sbi_hsm_init(scratch, true);
 	if (rc)
 		sbi_hart_hang();
 
@@ -251,7 +251,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
 	 * path is completed.
 	 */
-	wake_coldboot_harts(scratch, hartid);
+	wake_coldboot_harts(scratch);
 
 	rc = sbi_platform_early_init(plat, true);
 	if (rc)
@@ -386,7 +386,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	(*count)++;
 
 	/* Note: This has to be first thing in warmboot init sequence */
-	rc = sbi_hsm_init(scratch, hartid, false);
+	rc = sbi_hsm_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
 
@@ -470,7 +470,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 {
 	int hstate;
 
-	wait_for_coldboot(scratch, hartid);
+	wait_for_coldboot(scratch);
 
 	hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
 	if (hstate < 0)
-- 
2.45.1


