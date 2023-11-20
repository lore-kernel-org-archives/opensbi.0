From: Xiang W <wxjstz@126.com>
Date: Mon, 20 Nov 2023 17:52:42 +0800
Subject: [PATCH 1/2] lib: sbi: simplify sbi_ipi_send/sbi_ipi_process
Message-ID: <20231120095301.105772-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass sbi_ipi_raw_send/sbi_ipi_raw_clear instead of direct access
to ipi_dev.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_ipi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 5571b37..30cb315 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -68,9 +68,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 	 */
 	atomic_raw_set_bit(event, &ipi_data->ipi_type);
 	smp_wmb();
-
-	if (ipi_dev && ipi_dev->ipi_send)
-		ipi_dev->ipi_send(remote_hartindex);
+	sbi_ipi_raw_send(remote_hartindex);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
@@ -222,9 +220,7 @@ void sbi_ipi_process(void)
 	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear(hartindex);
-
+	sbi_ipi_raw_clear(hartindex);
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
 	while (ipi_type) {
-- 
2.42.0


