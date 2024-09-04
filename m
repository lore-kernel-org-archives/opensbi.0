From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue,  3 Sep 2024 18:24:10 -0700
Subject: [PATCH 1/3] lib: sbi_ipi: Make .ipi_clear always target the current hart
In-Reply-To: <20240904012508.3626840-1-samuel.holland@sifive.com>
References: <20240904012508.3626840-1-samuel.holland@sifive.com>
Message-ID: <20240904012508.3626840-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All existing users of this operation target the current hart, and it
seems unlikely that a future user will need to clear the pending IPI
status of a remote hart. Simplify the logic by changing .ipi_clear (and
its wrapper sbi_ipi_raw_clear()) to always operate on the current hart.

This incidentally fixes a bug introduced in commit 78c667b6fc07 ("lib:
sbi: Prefer hartindex over hartid in IPI framework"), which changed the
.ipi_clear parameter from a hartid to a hart index, but failed to update
the warm_init functions to match.

Fixes: 78c667b6fc07 ("lib: sbi: Prefer hartindex over hartid in IPI framework")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
This fix supersedes my previous patch [1] ("lib: utils/ipi: Fix hartid
wrongly used as hart index").

[1]: http://lists.infradead.org/pipermail/opensbi/2024-August/007324.html

 include/sbi/sbi_ipi.h        |  6 +++---
 lib/sbi/sbi_init.c           |  2 +-
 lib/sbi/sbi_ipi.c            |  7 +++----
 lib/utils/ipi/aclint_mswi.c  | 13 ++++---------
 lib/utils/ipi/andes_plicsw.c |  8 +++-----
 5 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index d3962334..62d61304 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -26,8 +26,8 @@ struct sbi_ipi_device {
 	/** Send IPI to a target HART index */
 	void (*ipi_send)(u32 hart_index);
 
-	/** Clear IPI for a target HART index */
-	void (*ipi_clear)(u32 hart_index);
+	/** Clear IPI for the current hart */
+	void (*ipi_clear)(void);
 };
 
 enum sbi_ipi_update_type {
@@ -87,7 +87,7 @@ void sbi_ipi_process(void);
 
 int sbi_ipi_raw_send(u32 hartindex);
 
-void sbi_ipi_raw_clear(u32 hartindex);
+void sbi_ipi_raw_clear(void);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index d80efe97..b07a201a 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -479,7 +479,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear(sbi_hartid_to_hartindex(hartid));
+		sbi_ipi_raw_clear();
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 048aaa66..0ce27ba1 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -233,10 +233,9 @@ void sbi_ipi_process(void)
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_ipi_data *ipi_data =
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
-	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear(hartindex);
+	sbi_ipi_raw_clear();
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -271,10 +270,10 @@ int sbi_ipi_raw_send(u32 hartindex)
 	return 0;
 }
 
-void sbi_ipi_raw_clear(u32 hartindex)
+void sbi_ipi_raw_clear(void)
 {
 	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(hartindex);
+		ipi_dev->ipi_clear();
 
 	/*
 	 * Ensure that memory or MMIO writes after this
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 4ae6bb1c..b572ad81 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -45,24 +45,19 @@ static void mswi_ipi_send(u32 hart_index)
 			mswi->first_hartid]);
 }
 
-static void mswi_ipi_clear(u32 hart_index)
+static void mswi_ipi_clear(void)
 {
 	u32 *msip;
-	struct sbi_scratch *scratch;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct aclint_mswi_data *mswi;
 
-	scratch = sbi_hartindex_to_scratch(hart_index);
-	if (!scratch)
-		return;
-
 	mswi = mswi_get_hart_data_ptr(scratch);
 	if (!mswi)
 		return;
 
 	/* Clear ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel_relaxed(0, &msip[sbi_hartindex_to_hartid(hart_index) -
-			mswi->first_hartid]);
+	writel_relaxed(0, &msip[current_hartid() - mswi->first_hartid]);
 }
 
 static struct sbi_ipi_device aclint_mswi = {
@@ -74,7 +69,7 @@ static struct sbi_ipi_device aclint_mswi = {
 int aclint_mswi_warm_init(void)
 {
 	/* Clear IPI for current HART */
-	mswi_ipi_clear(current_hartid());
+	mswi_ipi_clear();
 
 	return 0;
 }
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 413ac20e..626699f9 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -41,9 +41,9 @@ static void plicsw_ipi_send(u32 hart_index)
 	writel_relaxed(BIT(pending_bit), (void *)pending_reg);
 }
 
-static void plicsw_ipi_clear(u32 hart_index)
+static void plicsw_ipi_clear(void)
 {
-	u32 target_hart = sbi_hartindex_to_hartid(hart_index);
+	u32 target_hart = current_hartid();
 	ulong reg = plicsw.addr + PLICSW_CONTEXT_BASE + PLICSW_CONTEXT_CLAIM +
 		    PLICSW_CONTEXT_STRIDE * target_hart;
 
@@ -67,10 +67,8 @@ static struct sbi_ipi_device plicsw_ipi = {
 
 int plicsw_warm_ipi_init(void)
 {
-	u32 hartid = current_hartid();
-
 	/* Clear PLICSW IPI */
-	plicsw_ipi_clear(hartid);
+	plicsw_ipi_clear();
 
 	return 0;
 }
-- 
2.45.1


