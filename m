From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 27 Feb 2023 11:31:04 +0100
Subject: [PATCH v2 09/11] lib: sbi: Implement system suspend
In-Reply-To: <20230227103106.137995-1-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com>
Message-ID: <20230227103106.137995-10-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fill the implementation of the system suspend ecall. A platform
implementation of the suspend callbacks is still required for this
to do anything.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_system.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index 5c123a6c9d8d..7fa5ea82b7a6 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -116,5 +116,60 @@ bool sbi_system_suspend_supported(u32 sleep_type)
 
 int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 {
-	return 0;
+	int ret = SBI_ENOTSUPP;
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
+	unsigned int hartid = current_hartid();
+	unsigned long prev_mode;
+	unsigned long i;
+
+	if (!dom || !dom->system_suspend_allowed)
+		return SBI_EFAIL;
+
+	if (!suspend_dev || !suspend_dev->system_suspend)
+		return SBI_EFAIL;
+
+	if (!sbi_system_suspend_supported(sleep_type))
+		return SBI_ENOTSUPP;
+
+	prev_mode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
+	if (prev_mode != PRV_S && prev_mode != PRV_U)
+		return SBI_EFAIL;
+
+	sbi_hartmask_for_each_hart(i, &dom->assigned_harts) {
+		if (i == hartid)
+			continue;
+		if (__sbi_hsm_hart_get_state(i) != SBI_HSM_STATE_STOPPED)
+			return SBI_EFAIL;
+	}
+
+	if (!sbi_domain_check_addr(dom, resume_addr, prev_mode,
+				   SBI_DOMAIN_EXECUTE))
+		return SBI_EINVALID_ADDR;
+
+	if (!sbi_hsm_hart_change_state(scratch, SBI_HSM_STATE_STARTED,
+				       SBI_HSM_STATE_SUSPENDED))
+		return SBI_EFAIL;
+
+	/* Prepare for resume */
+	scratch->next_mode = prev_mode;
+	scratch->next_addr = resume_addr;
+	scratch->next_arg1 = opaque;
+
+	__sbi_hsm_suspend_non_ret_save(scratch);
+
+	/* Suspend */
+	ret = suspend_dev->system_suspend(sleep_type, scratch->warmboot_addr);
+	if (ret != SBI_OK) {
+		if (!sbi_hsm_hart_change_state(scratch, SBI_HSM_STATE_SUSPENDED,
+					       SBI_HSM_STATE_STARTED))
+			sbi_hart_hang();
+		return ret;
+	}
+
+	/* Resume */
+	jump_warmboot();
+
+	__builtin_unreachable();
 }
-- 
2.39.1


