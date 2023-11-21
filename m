From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 21 Nov 2023 21:47:11 +0530
Subject: [PATCH 2/2] lib: sbi: Allow relaxed MMIO writes in device ipi_clear() callback
In-Reply-To: <20231121161711.904674-1-apatel@ventanamicro.com>
References: <20231121161711.904674-1-apatel@ventanamicro.com>
Message-ID: <20231121161711.904674-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, there are no barriers before or after the ipi_clear()
device callback which forces ipi_clear() device callback to always
use non-relaxed MMIO writes.

Instead of above, we use wmb() in after the ipi_clear() device
callback which pairs with the wmb() done before the ipi_send()
device callback. This also allows device ipi_clear() callback
to use relaxed MMIO writes.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_ipi.c           | 16 ++++++++++++++--
 lib/utils/ipi/aclint_mswi.c |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 1694a23..0bf446a 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -220,8 +220,7 @@ void sbi_ipi_process(void)
 	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(hartindex);
+	sbi_ipi_raw_clear(hartindex);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -247,6 +246,8 @@ int sbi_ipi_raw_send(u32 hartindex)
 	 * or MMIO writes done by the ipi_send() device
 	 * callback. This also allows the ipi_send() device
 	 * callback to use relaxed MMIO writes.
+	 *
+	 * This pairs with the wmb() in sbi_ipi_raw_clear().
 	 */
 	wmb();
 
@@ -258,6 +259,17 @@ void sbi_ipi_raw_clear(u32 hartindex)
 {
 	if (ipi_dev && ipi_dev->ipi_clear)
 		ipi_dev->ipi_clear(hartindex);
+
+	/*
+	 * Ensure that memory or MMIO writes after this
+	 * function returns are not observed before the
+	 * memory or MMIO writes done by the ipi_clear()
+	 * device callback. This also allows ipi_clear()
+	 * device callback to use relaxed MMIO writes.
+	 *
+	 * This pairs with the wmb() in sbi_ipi_raw_send().
+	 */
+	wmb();
 }
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void)
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index bfd6a45..4ae6bb1 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -61,7 +61,7 @@ static void mswi_ipi_clear(u32 hart_index)
 
 	/* Clear ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel(0, &msip[sbi_hartindex_to_hartid(hart_index) -
+	writel_relaxed(0, &msip[sbi_hartindex_to_hartid(hart_index) -
 			mswi->first_hartid]);
 }
 
-- 
2.34.1


