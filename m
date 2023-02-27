From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:30:56 +0100
Subject: [PATCH v2 01/11] lib: sbi_hsm: Factor out invalid state detection
In-Reply-To: <20230227103106.137995-1-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com>
Message-ID: <20230227103106.137995-2-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove some redundant code by creating an invalid state detection
macro.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_hsm.c | 65 +++++++++++++++++------------------------------
 1 file changed, 24 insertions(+), 41 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 8499bb1ddeae..b71ee6ba4e80 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -26,6 +26,15 @@
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_console.h>
 
+#define __sbi_hsm_hart_change_state(hdata, oldstate, newstate)		\
+({									\
+	long state = atomic_cmpxchg(&(hdata)->state, oldstate, newstate); \
+	if (state != (oldstate))					\
+		sbi_printf("%s: ERR: The hart is in invalid state [%lu]\n", \
+			   __func__, state);				\
+	state == (oldstate);						\
+})
+
 static const struct sbi_hsm_device *hsm_dev = NULL;
 static unsigned long hart_data_offset;
 
@@ -95,13 +104,11 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 
 void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
 {
-	u32 oldstate;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_START_PENDING,
-				  SBI_HSM_STATE_STARTED);
-	if (oldstate != SBI_HSM_STATE_START_PENDING)
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_START_PENDING,
+					 SBI_HSM_STATE_STARTED))
 		sbi_hart_hang();
 }
 
@@ -217,14 +224,12 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 
 void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch)
 {
-	u32 hstate;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
 
-	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOP_PENDING,
-				SBI_HSM_STATE_STOPPED);
-	if (hstate != SBI_HSM_STATE_STOP_PENDING)
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STOP_PENDING,
+					 SBI_HSM_STATE_STOPPED))
 		goto fail_exit;
 
 	if (hsm_device_has_hart_hotplug()) {
@@ -298,7 +303,6 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 {
-	int oldstate;
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
@@ -306,13 +310,9 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 	if (!dom)
 		return SBI_EFAIL;
 
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
-				  SBI_HSM_STATE_STOP_PENDING);
-	if (oldstate != SBI_HSM_STATE_STARTED) {
-		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
-			   __func__, oldstate);
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STARTED,
+					 SBI_HSM_STATE_STOP_PENDING))
 		return SBI_EFAIL;
-	}
 
 	if (exitnow)
 		sbi_exit(scratch);
@@ -362,36 +362,26 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 
 void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
 {
-	int oldstate;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
 	/* If current HART was SUSPENDED then set RESUME_PENDING state */
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_SUSPENDED,
-			SBI_HSM_STATE_RESUME_PENDING);
-	if (oldstate != SBI_HSM_STATE_SUSPENDED) {
-		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
-			   __func__, oldstate);
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_SUSPENDED,
+					 SBI_HSM_STATE_RESUME_PENDING))
 		sbi_hart_hang();
-	}
 
 	hsm_device_hart_resume();
 }
 
 void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
 {
-	u32 oldstate;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
 	/* If current HART was RESUME_PENDING then set STARTED state */
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_RESUME_PENDING,
-				  SBI_HSM_STATE_STARTED);
-	if (oldstate != SBI_HSM_STATE_RESUME_PENDING) {
-		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
-			   __func__, oldstate);
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_RESUME_PENDING,
+					 SBI_HSM_STATE_STARTED))
 		sbi_hart_hang();
-	}
 
 	/*
 	 * Restore some of the M-mode CSRs which we are re-configured by
@@ -403,7 +393,7 @@ void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
 int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 			 ulong raddr, ulong rmode, ulong arg1)
 {
-	int oldstate, ret;
+	int ret;
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
@@ -437,11 +427,8 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
 	scratch->next_mode = rmode;
 
 	/* Directly move from STARTED to SUSPENDED state */
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
-				  SBI_HSM_STATE_SUSPENDED);
-	if (oldstate != SBI_HSM_STATE_STARTED) {
-		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
-			   __func__, oldstate);
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STARTED,
+					 SBI_HSM_STATE_SUSPENDED)) {
 		ret = SBI_EDENIED;
 		goto fail_restore_state;
 	}
@@ -484,13 +471,9 @@ fail_restore_state:
 	 * We might have successfully resumed from retentive suspend
 	 * or suspend failed. In both cases, we restore state of hart.
 	 */
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_SUSPENDED,
-				  SBI_HSM_STATE_STARTED);
-	if (oldstate != SBI_HSM_STATE_SUSPENDED) {
-		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
-			   __func__, oldstate);
+	if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_SUSPENDED,
+					 SBI_HSM_STATE_STARTED))
 		sbi_hart_hang();
-	}
 
 	return ret;
 }
-- 
2.39.1


