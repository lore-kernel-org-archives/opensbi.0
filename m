From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 15 Aug 2023 17:40:33 +0800
Subject: [PATCH V2 3/3] lib: sbi_pmu: keep overflow interrupt of stopped hpm counter disabled
In-Reply-To: <20230815094033.593243-1-inochiama@outlook.com>
References: <IA1PR20MB495351FBE86C63ECBB8764C7BB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230815094033.593243-1-inochiama@outlook.com>
Message-ID: <IA1PR20MB4953344E8BB577C4EA3BDE6ABB14A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After the hardware hpm counter is stopped, it should not raise any new
interrupt as it is already stopped. So add the hw_counter_disable_irq
callback to allow the custom pmu device to control this behavior.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 lib/sbi/sbi_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 2904903..b5c11bc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -482,6 +482,9 @@ static int pmu_ctr_stop_hw(uint32_t cidx)
 	if (!__test_bit(cidx, &mctr_inhbt)) {
 		__set_bit(cidx, &mctr_inhbt);
 		csr_write(CSR_MCOUNTINHIBIT, mctr_inhbt);
+		if (pmu_dev && pmu_dev->hw_counter_disable_irq) {
+			pmu_dev->hw_counter_disable_irq(cidx);
+		}
 		return 0;
 	} else
 		return SBI_EALREADY_STOPPED;
--
2.41.0


