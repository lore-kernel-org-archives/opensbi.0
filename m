From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 21 Nov 2023 21:47:10 +0530
Subject: [PATCH 1/2] lib: sbi: Allow relaxed MMIO writes in device ipi_send() callback
In-Reply-To: <20231121161711.904674-1-apatel@ventanamicro.com>
References: <20231121161711.904674-1-apatel@ventanamicro.com>
Message-ID: <20231121161711.904674-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we have a smp_wmb() between atomic_raw_set_bit() and
ipi_send() device callback whereas the MMIO writes done by the
device ipi_send() callback will also include a barrier.

We can avoid unnecessary/redundant barriers described above by
allowing relaxed MMIO writes in device ipi_send() callback. To
achieve this, we simply use  wmb() instead of smp_wmb() before
calling device ipi_send().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_ipi.c           | 15 +++++++++++----
 lib/utils/ipi/aclint_mswi.c |  2 +-
 lib/utils/irqchip/imsic.c   |  4 ++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 5571b37..1694a23 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -67,14 +67,12 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 	 * trigger the interrupt
 	 */
 	atomic_raw_set_bit(event, &ipi_data->ipi_type);
-	smp_wmb();
 
-	if (ipi_dev && ipi_dev->ipi_send)
-		ipi_dev->ipi_send(remote_hartindex);
+	ret = sbi_ipi_raw_send(remote_hartindex);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
-	return 0;
+	return ret;
 }
 
 static int sbi_ipi_sync(struct sbi_scratch *scratch, u32 event)
@@ -243,6 +241,15 @@ int sbi_ipi_raw_send(u32 hartindex)
 	if (!ipi_dev || !ipi_dev->ipi_send)
 		return SBI_EINVAL;
 
+	/*
+	 * Ensure that memory or MMIO writes done before
+	 * this function are not observed after the memory
+	 * or MMIO writes done by the ipi_send() device
+	 * callback. This also allows the ipi_send() device
+	 * callback to use relaxed MMIO writes.
+	 */
+	wmb();
+
 	ipi_dev->ipi_send(hartindex);
 	return 0;
 }
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index a3bfb4a..bfd6a45 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -41,7 +41,7 @@ static void mswi_ipi_send(u32 hart_index)
 
 	/* Set ACLINT IPI */
 	msip = (void *)mswi->addr;
-	writel(1, &msip[sbi_hartindex_to_hartid(hart_index) -
+	writel_relaxed(1, &msip[sbi_hartindex_to_hartid(hart_index) -
 			mswi->first_hartid]);
 }
 
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 78f5895..36ef66c 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -186,8 +186,8 @@ static void imsic_ipi_send(u32 hart_index)
 	}
 
 	if (regs->size && (reloff < regs->size))
-		writel(IMSIC_IPI_ID,
-		       (void *)(regs->addr + reloff + IMSIC_MMIO_PAGE_LE));
+		writel_relaxed(IMSIC_IPI_ID,
+			(void *)(regs->addr + reloff + IMSIC_MMIO_PAGE_LE));
 }
 
 static struct sbi_ipi_device imsic_ipi_device = {
-- 
2.34.1


