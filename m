From: Xiang W <wxjstz@126.com>
Date: Mon, 11 Dec 2023 22:07:26 +0800
Subject: [PATCH] lib: sbi: Optimize ipi_send/ipi_clear
Message-ID: <20231211140731.1251787-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the hartid parameter to ipi_send/ipi_clear to avoid multiple
conversions of hartid and hartindex.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_ipi.h          | 12 ++++++------
 lib/sbi/sbi_hsm.c              |  2 +-
 lib/sbi/sbi_init.c             |  4 ++--
 lib/sbi/sbi_ipi.c              | 17 ++++++++++-------
 lib/utils/ipi/aclint_mswi.c    | 14 +++++++-------
 lib/utils/ipi/andes_plicsw.c   | 10 +++++-----
 lib/utils/irqchip/imsic.c      |  2 +-
 platform/generic/andes/ae350.c |  2 +-
 8 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index d396233..947fd7f 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -23,11 +23,11 @@ struct sbi_ipi_device {
 	/** Name of the IPI device */
 	char name[32];
 
-	/** Send IPI to a target HART index */
-	void (*ipi_send)(u32 hart_index);
+	/** Send IPI to a target HART */
+	void (*ipi_send)(u32 hartid, u32 hart_index);
 
-	/** Clear IPI for a target HART index */
-	void (*ipi_clear)(u32 hart_index);
+	/** Clear IPI for a target HART */
+	void (*ipi_clear)(u32 hartid, u32 hart_index);
 };
 
 enum sbi_ipi_update_type {
@@ -85,9 +85,9 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
-int sbi_ipi_raw_send(u32 hartindex);
+int sbi_ipi_raw_send(u32 hartid, u32 hartindex);
 
-void sbi_ipi_raw_clear(u32 hartindex);
+void sbi_ipi_raw_clear(u32 hartid, u32 hartindex);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 3d60ceb..1288bf7 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -355,7 +355,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		rc = sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+		rc = sbi_ipi_raw_send(hartid, sbi_hartid_to_hartindex(hartid));
 	}
 
 	if (!rc)
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 6a98e13..c111453 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -257,7 +257,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	sbi_hartmask_for_each_hartindex(i, &coldboot_wait_hmask) {
 		if (i == hartindex)
 			continue;
-		sbi_ipi_raw_send(i);
+		sbi_ipi_raw_send(sbi_hartindex_to_hartid(i), i);
 	}
 
 	/* Release coldboot lock */
@@ -504,7 +504,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear(sbi_hartid_to_hartindex(hartid));
+		sbi_ipi_raw_clear(hartid, sbi_hartid_to_hartindex(hartid));
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 5c33a78..dbfd1bb 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -72,7 +72,9 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 	 */
 	if (!__atomic_fetch_or(&ipi_data->ipi_type,
 				BIT(event), __ATOMIC_RELAXED))
-		ret = sbi_ipi_raw_send(remote_hartindex);
+		ret = sbi_ipi_raw_send(
+			sbi_hartindex_to_hartid(remote_hartindex),
+			remote_hartindex);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
@@ -221,10 +223,11 @@ void sbi_ipi_process(void)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_ipi_data *ipi_data =
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
-	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
+	u32 hartid = current_hartid();
+	u32 hartindex = sbi_hartid_to_hartindex(hartid);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear(hartindex);
+	sbi_ipi_raw_clear(hartid, hartindex);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -239,7 +242,7 @@ void sbi_ipi_process(void)
 	}
 }
 
-int sbi_ipi_raw_send(u32 hartindex)
+int sbi_ipi_raw_send(u32 hartid, u32 hartindex)
 {
 	if (!ipi_dev || !ipi_dev->ipi_send)
 		return SBI_EINVAL;
@@ -255,14 +258,14 @@ int sbi_ipi_raw_send(u32 hartindex)
 	 */
 	wmb();
 
-	ipi_dev->ipi_send(hartindex);
+	ipi_dev->ipi_send(hartid, hartindex);
 	return 0;
 }
 
-void sbi_ipi_raw_clear(u32 hartindex)
+void sbi_ipi_raw_clear(u32 hartid, u32 hartindex)
 {
 	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(hartindex);
+		ipi_dev->ipi_clear(hartid, hartindex);
 
 	/*
 	 * Ensure that memory or MMIO writes after this
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 4ae6bb1..b73b5b6 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -25,7 +25,7 @@ static unsigned long mswi_ptr_offset;
 #define mswi_set_hart_data_ptr(__scratch, __mswi)			\
 	sbi_scratch_write_type((__scratch), void *, mswi_ptr_offset, (__mswi))
 
-static void mswi_ipi_send(u32 hart_index)
+static void mswi_ipi_send(u32 hartid, u32 hart_index)
 {
 	u32 *msip;
 	struct sbi_scratch *scratch;
@@ -41,11 +41,10 @@ static void mswi_ipi_send(u32 hart_index)
 
 	/* Set ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel_relaxed(1, &msip[sbi_hartindex_to_hartid(hart_index) -
-			mswi->first_hartid]);
+	writel_relaxed(1, &msip[hartid - mswi->first_hartid]);
 }
 
-static void mswi_ipi_clear(u32 hart_index)
+static void mswi_ipi_clear(u32 hartid, u32 hart_index)
 {
 	u32 *msip;
 	struct sbi_scratch *scratch;
@@ -61,8 +60,7 @@ static void mswi_ipi_clear(u32 hart_index)
 
 	/* Clear ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel_relaxed(0, &msip[sbi_hartindex_to_hartid(hart_index) -
-			mswi->first_hartid]);
+	writel_relaxed(0, &msip[hartid - mswi->first_hartid]);
 }
 
 static struct sbi_ipi_device aclint_mswi = {
@@ -73,8 +71,10 @@ static struct sbi_ipi_device aclint_mswi = {
 
 int aclint_mswi_warm_init(void)
 {
+	u32 hartid = current_hartid();
+
 	/* Clear IPI for current HART */
-	mswi_ipi_clear(current_hartid());
+	mswi_ipi_clear(hartid, sbi_hartid_to_hartindex(hartid));
 
 	return 0;
 }
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 413ac20..981b8c7 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -18,11 +18,11 @@
 
 struct plicsw_data plicsw;
 
-static void plicsw_ipi_send(u32 hart_index)
+static void plicsw_ipi_send(u32 hartid, u32 hart_index)
 {
 	ulong pending_reg;
 	u32 interrupt_id, word_index, pending_bit;
-	u32 target_hart = sbi_hartindex_to_hartid(hart_index);
+	u32 target_hart = hartid;
 
 	if (plicsw.hart_count <= target_hart)
 		ebreak();
@@ -41,9 +41,9 @@ static void plicsw_ipi_send(u32 hart_index)
 	writel_relaxed(BIT(pending_bit), (void *)pending_reg);
 }
 
-static void plicsw_ipi_clear(u32 hart_index)
+static void plicsw_ipi_clear(u32 hartid, u32 hart_index)
 {
-	u32 target_hart = sbi_hartindex_to_hartid(hart_index);
+	u32 target_hart = hartid;
 	ulong reg = plicsw.addr + PLICSW_CONTEXT_BASE + PLICSW_CONTEXT_CLAIM +
 		    PLICSW_CONTEXT_STRIDE * target_hart;
 
@@ -70,7 +70,7 @@ int plicsw_warm_ipi_init(void)
 	u32 hartid = current_hartid();
 
 	/* Clear PLICSW IPI */
-	plicsw_ipi_clear(hartid);
+	plicsw_ipi_clear(hartid, sbi_hartid_to_hartindex(hartid));
 
 	return 0;
 }
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 36ef66c..ca6f15d 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -161,7 +161,7 @@ static int imsic_external_irqfn(struct sbi_trap_regs *regs)
 	return 0;
 }
 
-static void imsic_ipi_send(u32 hart_index)
+static void imsic_ipi_send(u32 hartid, u32 hart_index)
 {
 	unsigned long reloff;
 	struct imsic_regs *regs;
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 088ec07..fafbb3e 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -32,7 +32,7 @@ static int ae350_hart_start(u32 hartid, ulong saddr)
 	 * 2) the target hart is non-sleepable 25-series hart0
 	 */
 	if (!sbi_init_count(hartid) || (is_andes(25) && hartid == 0))
-		return sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
+		return sbi_ipi_raw_send(hartid, sbi_hartid_to_hartindex(hartid));
 
 	/* Write wakeup command to the sleep hart */
 	smu_set_command(&smu, WAKEUP_CMD, hartid);
-- 
2.42.0


