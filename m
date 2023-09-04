From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  4 Sep 2023 09:33:43 +0530
Subject: [PATCH 5/8] lib: sbi: Prefer hartindex over hartid in IPI framework
In-Reply-To: <20230904040346.118604-1-apatel@ventanamicro.com>
References: <20230904040346.118604-1-apatel@ventanamicro.com>
Message-ID: <20230904040346.118604-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let us prefer hartindex over hartid in IPI framework which in-turn
forces IPI users to also prefer hartindex.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ipi.h          | 14 +++++++-------
 lib/sbi/sbi_hsm.c              |  2 +-
 lib/sbi/sbi_init.c             |  4 ++--
 lib/sbi/sbi_ipi.c              | 26 +++++++++++++-------------
 lib/sbi/sbi_tlb.c              |  8 ++++----
 lib/utils/ipi/aclint_mswi.c    | 14 ++++++++------
 lib/utils/ipi/andes_plicsw.c   |  8 ++++++--
 lib/utils/irqchip/imsic.c      |  4 ++--
 platform/generic/andes/ae350.c |  2 +-
 9 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index c64f422..cea8dee 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -23,11 +23,11 @@ struct sbi_ipi_device {
 	/** Name of the IPI device */
 	char name[32];
 
-	/** Send IPI to a target HART */
-	void (*ipi_send)(u32 target_hart);
+	/** Send IPI to a target HART index */
+	void (*ipi_send)(u32 hart_index);
 
-	/** Clear IPI for a target HART */
-	void (*ipi_clear)(u32 target_hart);
+	/** Clear IPI for a target HART index */
+	void (*ipi_clear)(u32 hart_index);
 };
 
 enum sbi_ipi_update_type {
@@ -54,7 +54,7 @@ struct sbi_ipi_event_ops {
 	 */
 	int (* update)(struct sbi_scratch *scratch,
 			struct sbi_scratch *remote_scratch,
-			u32 remote_hartid, void *data);
+			u32 remote_hartindex, void *data);
 
 	/**
 	 * Sync callback to wait for remote HART
@@ -85,9 +85,9 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
-int sbi_ipi_raw_send(u32 target_hart);
+int sbi_ipi_raw_send(u32 hartindex);
 
-void sbi_ipi_raw_clear(u32 target_hart);
+void sbi_ipi_raw_clear(u32 hartindex);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index f870ca7..814130e 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -356,7 +356,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		rc = sbi_ipi_raw_send(hartid);
+		rc = sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
 	}
 
 	if (!rc)
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 10dbd0a..a6d96e6 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -252,7 +252,7 @@ static void wake_coldboot_harts(struct sbi_scratch *scratch, u32 hartid)
 	for (u32 i = 0; i <= sbi_scratch_last_hartid(); i++) {
 		if ((i != hartid) &&
 		    sbi_hartmask_test_hartid(i, &coldboot_wait_hmask))
-			sbi_ipi_raw_send(i);
+			sbi_ipi_raw_send(sbi_hartid_to_hartindex(i));
 	}
 
 	/* Release coldboot lock */
@@ -499,7 +499,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear(hartid);
+		sbi_ipi_raw_clear(sbi_hartid_to_hartindex(hartid));
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 09c8d10..42d56c7 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -31,7 +31,7 @@ static unsigned long ipi_data_off;
 static const struct sbi_ipi_device *ipi_dev = NULL;
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
-static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
+static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 			u32 event, void *data)
 {
 	int ret;
@@ -44,7 +44,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 		return SBI_EINVAL;
 	ipi_ops = ipi_ops_array[event];
 
-	remote_scratch = sbi_hartid_to_scratch(remote_hartid);
+	remote_scratch = sbi_hartindex_to_scratch(remote_hartindex);
 	if (!remote_scratch)
 		return SBI_EINVAL;
 
@@ -52,7 +52,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 
 	if (ipi_ops->update) {
 		ret = ipi_ops->update(scratch, remote_scratch,
-				      remote_hartid, data);
+				      remote_hartindex, data);
 		if (ret != SBI_IPI_UPDATE_SUCCESS)
 			return ret;
 	}
@@ -65,7 +65,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartid,
 	smp_wmb();
 
 	if (ipi_dev && ipi_dev->ipi_send)
-		ipi_dev->ipi_send(remote_hartid);
+		ipi_dev->ipi_send(remote_hartindex);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
@@ -96,7 +96,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 {
 	int rc;
 	bool retry_needed;
-	ulong i, j, m;
+	ulong i, m;
 	struct sbi_hartmask target_mask = {0};
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
@@ -126,12 +126,12 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
 	/* Send IPIs */
 	do {
 		retry_needed = false;
-		sbi_hartmask_for_each_hart(i, j, &target_mask) {
+		sbi_hartmask_for_each_hartindex(i, &target_mask) {
 			rc = sbi_ipi_send(scratch, i, event, data);
 			if (rc == SBI_IPI_UPDATE_RETRY)
 				retry_needed = true;
 			else
-				sbi_hartmask_clear_hartid(i, &target_mask);
+				sbi_hartmask_clear_hartindex(i, &target_mask);
 		}
 	} while (retry_needed);
 
@@ -214,11 +214,11 @@ void sbi_ipi_process(void)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_ipi_data *ipi_data =
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
-	u32 hartid = current_hartid();
+	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
 	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(hartid);
+		ipi_dev->ipi_clear(hartindex);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -233,19 +233,19 @@ void sbi_ipi_process(void)
 	}
 }
 
-int sbi_ipi_raw_send(u32 target_hart)
+int sbi_ipi_raw_send(u32 hartindex)
 {
 	if (!ipi_dev || !ipi_dev->ipi_send)
 		return SBI_EINVAL;
 
-	ipi_dev->ipi_send(target_hart);
+	ipi_dev->ipi_send(hartindex);
 	return 0;
 }
 
-void sbi_ipi_raw_clear(u32 target_hart)
+void sbi_ipi_raw_clear(u32 hartindex)
 {
 	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(target_hart);
+		ipi_dev->ipi_clear(hartindex);
 }
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void)
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index 1604669..b1bd7dc 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -333,7 +333,7 @@ static int tlb_update_cb(void *in, void *data)
 
 static int tlb_update(struct sbi_scratch *scratch,
 			  struct sbi_scratch *remote_scratch,
-			  u32 remote_hartid, void *data)
+			  u32 remote_hartindex, void *data)
 {
 	int ret;
 	atomic_t *tlb_sync;
@@ -355,7 +355,7 @@ static int tlb_update(struct sbi_scratch *scratch,
 	 * If the request is to queue a tlb flush entry for itself
 	 * then just do a local flush and return;
 	 */
-	if (remote_hartid == curr_hartid) {
+	if (sbi_hartindex_to_hartid(remote_hartindex) == curr_hartid) {
 		tinfo->local_fn(tinfo);
 		return SBI_IPI_UPDATE_BREAK;
 	}
@@ -374,8 +374,8 @@ static int tlb_update(struct sbi_scratch *scratch,
 		 * this properly.
 		 */
 		tlb_process_once(scratch);
-		sbi_dprintf("hart%d: hart%d tlb fifo full\n",
-			    curr_hartid, remote_hartid);
+		sbi_dprintf("hart%d: hart%d tlb fifo full\n", curr_hartid,
+			    sbi_hartindex_to_hartid(remote_hartindex));
 		return SBI_IPI_UPDATE_RETRY;
 	}
 
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 140a49b..a3bfb4a 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -25,13 +25,13 @@ static unsigned long mswi_ptr_offset;
 #define mswi_set_hart_data_ptr(__scratch, __mswi)			\
 	sbi_scratch_write_type((__scratch), void *, mswi_ptr_offset, (__mswi))
 
-static void mswi_ipi_send(u32 target_hart)
+static void mswi_ipi_send(u32 hart_index)
 {
 	u32 *msip;
 	struct sbi_scratch *scratch;
 	struct aclint_mswi_data *mswi;
 
-	scratch = sbi_hartid_to_scratch(target_hart);
+	scratch = sbi_hartindex_to_scratch(hart_index);
 	if (!scratch)
 		return;
 
@@ -41,16 +41,17 @@ static void mswi_ipi_send(u32 target_hart)
 
 	/* Set ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel(1, &msip[target_hart - mswi->first_hartid]);
+	writel(1, &msip[sbi_hartindex_to_hartid(hart_index) -
+			mswi->first_hartid]);
 }
 
-static void mswi_ipi_clear(u32 target_hart)
+static void mswi_ipi_clear(u32 hart_index)
 {
 	u32 *msip;
 	struct sbi_scratch *scratch;
 	struct aclint_mswi_data *mswi;
 
-	scratch = sbi_hartid_to_scratch(target_hart);
+	scratch = sbi_hartindex_to_scratch(hart_index);
 	if (!scratch)
 		return;
 
@@ -60,7 +61,8 @@ static void mswi_ipi_clear(u32 target_hart)
 
 	/* Clear ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel(0, &msip[target_hart - mswi->first_hartid]);
+	writel(0, &msip[sbi_hartindex_to_hartid(hart_index) -
+			mswi->first_hartid]);
 }
 
 static struct sbi_ipi_device aclint_mswi = {
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index db25ae2..dde39c0 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -68,8 +68,10 @@ static inline void plic_sw_pending(u32 target_hart)
 	writel(val, (void *)plicsw.addr + PLICSW_PENDING_BASE + word_index * 4);
 }
 
-static void plicsw_ipi_send(u32 target_hart)
+static void plicsw_ipi_send(u32 hart_index)
 {
+	u32 target_hart = sbi_hartindex_to_hartid(hart_index);
+
 	if (plicsw.hart_count <= target_hart)
 		ebreak();
 
@@ -77,8 +79,10 @@ static void plicsw_ipi_send(u32 target_hart)
 	plic_sw_pending(target_hart);
 }
 
-static void plicsw_ipi_clear(u32 target_hart)
+static void plicsw_ipi_clear(u32 hart_index)
 {
+	u32 target_hart = sbi_hartindex_to_hartid(hart_index);
+
 	if (plicsw.hart_count <= target_hart)
 		ebreak();
 
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 7fc61d9..78f5895 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -161,7 +161,7 @@ static int imsic_external_irqfn(struct sbi_trap_regs *regs)
 	return 0;
 }
 
-static void imsic_ipi_send(u32 target_hart)
+static void imsic_ipi_send(u32 hart_index)
 {
 	unsigned long reloff;
 	struct imsic_regs *regs;
@@ -169,7 +169,7 @@ static void imsic_ipi_send(u32 target_hart)
 	struct sbi_scratch *scratch;
 	int file;
 
-	scratch = sbi_hartid_to_scratch(target_hart);
+	scratch = sbi_hartindex_to_scratch(hart_index);
 	if (!scratch)
 		return;
 
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index 01bd02d..80eca05 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -33,7 +33,7 @@ static int ae350_hart_start(u32 hartid, ulong saddr)
 {
 	/* Don't send wakeup command@boot-time */
 	if (!sbi_init_count(hartid) || (is_andes25() && hartid == 0))
-		return sbi_ipi_raw_send(hartid);
+		return sbi_ipi_raw_send(sbi_hartid_to_hartindex(hartid));
 
 	/* Write wakeup command to the sleep hart */
 	smu_set_command(&smu, WAKEUP_CMD, hartid);
-- 
2.34.1


