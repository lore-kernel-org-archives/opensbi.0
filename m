From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 21 Feb 2021 14:23:13 +0530
Subject: [RFC PATCH 02/10] lib: sbi: Use SBI_HSM_STATE_xyz defines instead of
 SBI_STATE_xyz defines
In-Reply-To: <20210221085321.180602-1-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
Message-ID: <20210221085321.180602-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We replace the use of SBI_STATE_xyz defines with SBI_HSM_STATE_xyz
defines because the HSM state defines are complete enough to implement
HSM state machine in OpenSBI. As a result of this, we can now remove
sbi_hsm_hart_state_to_status() function because it is now redundant
and sbi_hsm_hart_get_state() can directly return HSM state or error.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_hsm.h   |  8 ------
 lib/sbi/sbi_ecall_hsm.c |  7 ++---
 lib/sbi/sbi_hsm.c       | 64 ++++++++++++++---------------------------
 3 files changed, 24 insertions(+), 55 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 4823383..69ddee7 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -12,13 +12,6 @@
 
 #include <sbi/sbi_types.h>
 
-/** Hart state values **/
-#define SBI_HART_STOPPED	0
-#define SBI_HART_STOPPING	1
-#define SBI_HART_STARTING	2
-#define SBI_HART_STARTED	3
-#define SBI_HART_UNKNOWN	4
-
 struct sbi_domain;
 struct sbi_scratch;
 
@@ -30,7 +23,6 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		       u32 hartid, ulong saddr, ulong smode, ulong priv);
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
-int sbi_hsm_hart_state_to_status(int state);
 int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
 			      ulong hbase, ulong *out_hmask);
 void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid);
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index df29d51..79a9f21 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -23,7 +23,7 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 				 struct sbi_trap_info *out_trap)
 {
 	ulong smode;
-	int ret = 0, hstate;
+	int ret = 0;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	switch (funcid) {
@@ -37,9 +37,8 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_hsm_hart_stop(scratch, TRUE);
 		break;
 	case SBI_EXT_HSM_HART_GET_STATUS:
-		hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
-						regs->a0);
-		ret = sbi_hsm_hart_state_to_status(hstate);
+		ret = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
+					     regs->a0);
 		break;
 	default:
 		ret = SBI_ENOTSUPP;
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 1722280..1f54c9d 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -33,30 +33,6 @@ struct sbi_hsm_data {
 	atomic_t state;
 };
 
-int sbi_hsm_hart_state_to_status(int state)
-{
-	int ret;
-
-	switch (state) {
-	case SBI_HART_STOPPED:
-		ret = SBI_HSM_STATE_STOPPED;
-		break;
-	case SBI_HART_STOPPING:
-		ret = SBI_HSM_STATE_STOP_PENDING;
-		break;
-	case SBI_HART_STARTING:
-		ret = SBI_HSM_STATE_START_PENDING;
-		break;
-	case SBI_HART_STARTED:
-		ret = SBI_HSM_STATE_STARTED;
-		break;
-	default:
-		ret = SBI_EINVAL;
-	}
-
-	return ret;
-}
-
 static inline int __sbi_hsm_hart_get_state(u32 hartid)
 {
 	struct sbi_hsm_data *hdata;
@@ -64,7 +40,7 @@ static inline int __sbi_hsm_hart_get_state(u32 hartid)
 
 	scratch = sbi_hartid_to_scratch(hartid);
 	if (!scratch)
-		return SBI_HART_UNKNOWN;
+		return SBI_EINVAL;
 
 	hdata = sbi_scratch_offset_ptr(scratch, hart_data_offset);
 	return atomic_read(&hdata->state);
@@ -73,14 +49,14 @@ static inline int __sbi_hsm_hart_get_state(u32 hartid)
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 {
 	if (!sbi_domain_is_assigned_hart(dom, hartid))
-		return SBI_HART_UNKNOWN;
+		return SBI_EINVAL;
 
 	return __sbi_hsm_hart_get_state(hartid);
 }
 
 static bool sbi_hsm_hart_started(const struct sbi_domain *dom, u32 hartid)
 {
-	if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HART_STARTED)
+	if (sbi_hsm_hart_get_state(dom, hartid) == SBI_HSM_STATE_STARTED)
 		return TRUE;
 	else
 		return FALSE;
@@ -110,7 +86,7 @@ int sbi_hsm_hart_started_mask(const struct sbi_domain *dom,
 	for (i = hbase; i < hend; i++) {
 		hmask = 1UL << (i - hbase);
 		if ((dmask & hmask) &&
-		    (__sbi_hsm_hart_get_state(i) == SBI_HART_STARTED))
+		    (__sbi_hsm_hart_get_state(i) == SBI_HSM_STATE_STARTED))
 			*out_hmask |= hmask;
 	}
 
@@ -123,9 +99,9 @@ void sbi_hsm_prepare_next_jump(struct sbi_scratch *scratch, u32 hartid)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HART_STARTING,
-				  SBI_HART_STARTED);
-	if (oldstate != SBI_HART_STARTING)
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_START_PENDING,
+				  SBI_HSM_STATE_STARTED);
+	if (oldstate != SBI_HSM_STATE_START_PENDING)
 		sbi_hart_hang();
 }
 
@@ -142,7 +118,7 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch, u32 hartid)
 	csr_set(CSR_MIE, MIP_MSIP);
 
 	/* Wait for hart_add call*/
-	while (atomic_read(&hdata->state) != SBI_HART_STARTING) {
+	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
 		wfi();
 	};
 
@@ -174,7 +150,9 @@ int sbi_hsm_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 			hdata = sbi_scratch_offset_ptr(rscratch,
 						       hart_data_offset);
 			ATOMIC_INIT(&hdata->state,
-			(i == hartid) ? SBI_HART_STARTING : SBI_HART_STOPPED);
+				    (i == hartid) ?
+				    SBI_HSM_STATE_START_PENDING :
+				    SBI_HSM_STATE_STOPPED);
 		}
 	} else {
 		sbi_hsm_hart_wait(scratch, hartid);
@@ -191,9 +169,9 @@ void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch)
 							    hart_data_offset);
 	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
 
-	hstate = atomic_cmpxchg(&hdata->state, SBI_HART_STOPPING,
-				SBI_HART_STOPPED);
-	if (hstate != SBI_HART_STOPPING)
+	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOP_PENDING,
+				SBI_HSM_STATE_STOPPED);
+	if (hstate != SBI_HSM_STATE_STOP_PENDING)
 		goto fail_exit;
 
 	if (sbi_platform_has_hart_hotplug(plat)) {
@@ -238,16 +216,16 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	if (!rscratch)
 		return SBI_EINVAL;
 	hdata = sbi_scratch_offset_ptr(rscratch, hart_data_offset);
-	hstate = atomic_cmpxchg(&hdata->state, SBI_HART_STOPPED,
-				SBI_HART_STARTING);
-	if (hstate == SBI_HART_STARTED)
+	hstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STOPPED,
+				SBI_HSM_STATE_START_PENDING);
+	if (hstate == SBI_HSM_STATE_STARTED)
 		return SBI_EALREADY;
 
 	/**
 	 * if a hart is already transition to start or stop, another start call
 	 * is considered as invalid request.
 	 */
-	if (hstate != SBI_HART_STOPPED)
+	if (hstate != SBI_HSM_STATE_STOPPED)
 		return SBI_EINVAL;
 
 	init_count = sbi_init_count(hartid);
@@ -276,9 +254,9 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 	if (!sbi_hsm_hart_started(sbi_domain_thishart_ptr(), hartid))
 		return SBI_EINVAL;
 
-	oldstate = atomic_cmpxchg(&hdata->state, SBI_HART_STARTED,
-				  SBI_HART_STOPPING);
-	if (oldstate != SBI_HART_STARTED) {
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
+				  SBI_HSM_STATE_STOP_PENDING);
+	if (oldstate != SBI_HSM_STATE_STARTED) {
 		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
 			   __func__, oldstate);
 		return SBI_EDENIED;
-- 
2.25.1


