From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 21 Feb 2021 14:23:19 +0530
Subject: [RFC PATCH 08/10] lib: sbi: Implement SBI HSM suspend function
In-Reply-To: <20210221085321.180602-1-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
Message-ID: <20210221085321.180602-9-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements the SBI HSM suspend function. Using this
new SBI call, the S-mode software can put calling HART in platform
specific suspend (i.e. low-power) state. For a successful retentive
suspend, the SBI call will return without errors upon resuming
whereas for a successful non-retentive suspend, the SBI call will
resume from a user provided resume address.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_hsm.h   |   4 +
 lib/sbi/sbi_ecall_hsm.c |   6 ++
 lib/sbi/sbi_hsm.c       | 186 +++++++++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_init.c      |  38 +++++++-
 4 files changed, 228 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 4250515..bf0c1a5 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -22,6 +22,10 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 		       const struct sbi_domain *dom,
 		       u32 hartid, ulong saddr, ulong smode, ulong priv);
 int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow);
+void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch);
+void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch);
+int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
+			 ulong raddr, ulong rmode, ulong priv);
 int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid);
 int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 				    ulong hbase, ulong *out_hmask);
diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index 79a9f21..a4a0e58 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -40,6 +40,12 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(),
 					     regs->a0);
 		break;
+	case SBI_EXT_HSM_HART_SUSPEND:
+		smode = csr_read(CSR_MSTATUS);
+		smode = (smode & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
+		ret = sbi_hsm_hart_suspend(scratch, regs->a0, regs->a1,
+					   smode, regs->a2);
+		break;
 	default:
 		ret = SBI_ENOTSUPP;
 	};
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 732c400..b597265 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -31,6 +31,9 @@ static unsigned long hart_data_offset;
 /** Per hart specific data to manage state transition **/
 struct sbi_hsm_data {
 	atomic_t state;
+	unsigned long suspend_type;
+	unsigned long saved_mie;
+	unsigned long saved_mip;
 };
 
 static inline int __sbi_hsm_hart_get_state(u32 hartid)
@@ -65,6 +68,7 @@ int sbi_hsm_hart_get_state(const struct sbi_domain *dom, u32 hartid)
 int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 				    ulong hbase, ulong *out_hmask)
 {
+	int hstate;
 	ulong i, hmask, dmask;
 	ulong hend = sbi_scratch_last_hartid() + 1;
 
@@ -77,9 +81,12 @@ int sbi_hsm_hart_interruptible_mask(const struct sbi_domain *dom,
 	dmask = sbi_domain_get_assigned_hartmask(dom, hbase);
 	for (i = hbase; i < hend; i++) {
 		hmask = 1UL << (i - hbase);
-		if ((dmask & hmask) &&
-		    (__sbi_hsm_hart_get_state(i) == SBI_HSM_STATE_STARTED))
-			*out_hmask |= hmask;
+		if (dmask & hmask) {
+			hstate = __sbi_hsm_hart_get_state(i);
+			if (hstate == SBI_HSM_STATE_STARTED ||
+			    hstate == SBI_HSM_STATE_SUSPENDED)
+				*out_hmask |= hmask;
+		}
 	}
 
 	return 0;
@@ -260,3 +267,176 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
 
 	return 0;
 }
+
+static int __sbi_hsm_suspend_ret_default(struct sbi_scratch *scratch)
+{
+	/* Wait for interrupt */
+	wfi();
+
+	return 0;
+}
+
+static void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
+{
+	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
+							    hart_data_offset);
+
+	/*
+	 * We will be resuming in warm-boot path so the MIE and MIP CSRs
+	 * will be back to initial state. It is possible that HART has
+	 * configured timer event before going to suspend state so we
+	 * should save MIE and MIP CSRs and restore it after resuming.
+	 *
+	 * Further, the M-mode bits in MIP CSR are read-only and set by
+	 * external devices (such as interrupt controller) wherease all
+	 * VS-mode bits in MIP are read-only alias of bits in HVIP CSR.
+	 *
+	 * This means we should only save/restore S-mode bits of MIP CSR
+	 * such as MIP.SSIP and MIP.STIP.
+	 */
+
+	hdata->saved_mie = csr_read(CSR_MIE);
+	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
+}
+
+static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
+{
+	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
+							    hart_data_offset);
+
+	csr_write(CSR_MIE, hdata->saved_mie);
+	csr_write(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
+}
+
+static int __sbi_hsm_suspend_non_ret_default(struct sbi_scratch *scratch,
+					     ulong raddr)
+{
+	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
+
+	/*
+	 * Save some of the M-mode CSRs which should be restored after
+	 * resuming from suspend state
+	 */
+	__sbi_hsm_suspend_non_ret_save(scratch);
+
+	/* Wait for interrupt */
+	wfi();
+
+	/*
+	 * Directly jump to warm reboot to simulate resume from a
+	 * non-retentive suspend.
+	 */
+	jump_warmboot();
+
+	return 0;
+}
+
+void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
+{
+	int oldstate;
+	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
+							    hart_data_offset);
+
+	/* If current HART was SUSPENDED then set RESUME_PENDING state */
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_SUSPENDED,
+			SBI_HSM_STATE_RESUME_PENDING);
+	if (oldstate != SBI_HSM_STATE_SUSPENDED)
+		sbi_hart_hang();
+}
+
+void sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch)
+{
+	u32 oldstate;
+	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
+							    hart_data_offset);
+
+	/* If current HART was RESUME_PENDING then set STARTED state */
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_RESUME_PENDING,
+				  SBI_HSM_STATE_STARTED);
+	if (oldstate != SBI_HSM_STATE_RESUME_PENDING)
+		sbi_hart_hang();
+
+	/*
+	 * Restore some of the M-mode CSRs which we are re-configured by
+	 * the warm-boot sequence.
+	 */
+	__sbi_hsm_suspend_non_ret_restore(scratch);
+}
+
+int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
+			 ulong raddr, ulong rmode, ulong priv)
+{
+	int oldstate, ret;
+	u32 hartid = current_hartid();
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
+							    hart_data_offset);
+
+	/* For now, we only allow suspend from S-mode or U-mode. */
+	if (dom && !sbi_domain_is_assigned_hart(dom, hartid))
+		return SBI_EINVAL;
+
+	/* Sanity check on suspend type */
+	if (SBI_HSM_SUSPEND_RET_DEFAULT < suspend_type &&
+	    suspend_type < SBI_HSM_SUSPEND_RET_PLATFORM)
+		return SBI_EINVAL;
+	if (SBI_HSM_SUSPEND_NON_RET_DEFAULT < suspend_type &&
+	    suspend_type < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
+		return SBI_EINVAL;
+
+	/* Additional sanity check for non-retentive suspend */
+	if (suspend_type & SBI_HSM_SUSP_NON_RET_BIT) {
+		if (rmode != PRV_S && rmode != PRV_U)
+			return SBI_EINVAL;
+		if (dom && !sbi_domain_check_addr(dom, raddr, rmode,
+						  SBI_DOMAIN_EXECUTE))
+			return SBI_EINVALID_ADDR;
+	}
+
+	/* Save the resume address and resume mode */
+	scratch->next_arg1 = priv;
+	scratch->next_addr = raddr;
+	scratch->next_mode = rmode;
+
+	/* Directly move from STARTED to SUSPENDED state */
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_STARTED,
+				  SBI_HSM_STATE_SUSPENDED);
+	if (oldstate != SBI_HSM_STATE_STARTED) {
+		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
+			   __func__, oldstate);
+		ret = SBI_EDENIED;
+		goto fail_restore_state;
+	}
+
+	/* Save the suspend type */
+	hdata->suspend_type = suspend_type;
+
+	/* Try platform specific suspend */
+	ret = sbi_platform_hart_suspend(plat, suspend_type,
+					scratch->warmboot_addr);
+	if (ret == SBI_ENOTSUPP) {
+		/* Try generic implementation of default suspend types */
+		if (suspend_type == SBI_HSM_SUSPEND_RET_DEFAULT) {
+			ret = __sbi_hsm_suspend_ret_default(scratch);
+		} else if (suspend_type == SBI_HSM_SUSPEND_NON_RET_DEFAULT) {
+			ret = __sbi_hsm_suspend_non_ret_default(scratch,
+						scratch->warmboot_addr);
+		}
+	}
+
+fail_restore_state:
+	/*
+	 * We might have successfully resumed from retentive suspend
+	 * or suspend failed. In both cases, we retore state of hart.
+	 */
+	oldstate = atomic_cmpxchg(&hdata->state, SBI_HSM_STATE_SUSPENDED,
+				  SBI_HSM_STATE_STARTED);
+	if (oldstate != SBI_HSM_STATE_SUSPENDED) {
+		sbi_printf("%s: ERR: The hart is in invalid state [%u]\n",
+			   __func__, oldstate);
+		sbi_hart_hang();
+	}
+
+	return ret;
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 0e82458..1d4a838 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -311,14 +311,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 			     scratch->next_mode, FALSE);
 }
 
-static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
+static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
 {
 	int rc;
 	unsigned long *init_count;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	wait_for_coldboot(scratch, hartid);
-
 	if (!init_count_offset)
 		sbi_hart_hang();
 
@@ -362,6 +360,40 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	(*init_count)++;
 
 	sbi_hsm_prepare_next_jump(scratch, hartid);
+}
+
+static void init_warm_resume(struct sbi_scratch *scratch)
+{
+	int rc;
+
+	sbi_hsm_hart_resume_start(scratch);
+
+	rc = sbi_hart_reinit(scratch);
+	if (rc)
+		sbi_hart_hang();
+
+	rc = sbi_hart_pmp_configure(scratch);
+	if (rc)
+		sbi_hart_hang();
+
+	sbi_hsm_hart_resume_finish(scratch);
+}
+
+static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
+{
+	int hstate;
+
+	wait_for_coldboot(scratch, hartid);
+
+	hstate = sbi_hsm_hart_get_state(sbi_domain_thishart_ptr(), hartid);
+	if (hstate < 0)
+		sbi_hart_hang();
+
+	if (hstate == SBI_HSM_STATE_SUSPENDED)
+		init_warm_resume(scratch);
+	else
+		init_warm_startup(scratch, hartid);
+
 	sbi_hart_switch_mode(hartid, scratch->next_arg1,
 			     scratch->next_addr,
 			     scratch->next_mode, FALSE);
-- 
2.25.1


