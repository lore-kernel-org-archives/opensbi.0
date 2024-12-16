From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 16 Dec 2024 22:21:42 +0100
Subject: [PATCH v4 5/5] lib: sbi: pmu: add the PMU SSE event only if overflow IRQ is supported
In-Reply-To: <20241216212144.3379890-1-cleger@rivosinc.com>
References: <20241216212144.3379890-1-cleger@rivosinc.com>
Message-ID: <20241216212144.3379890-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the PMU SSE event only if an overflow irq bit is present.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index eb31f3e9..83a95b6d 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1166,7 +1166,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 	}
 
-	sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+	if (sbi_pmu_irq_bit() >= 0)
+		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
 
 	phs = pmu_get_hart_state_ptr(scratch);
 	if (!phs) {
-- 
2.45.2


