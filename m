From: Clément Léger <cleger@rivosinc.com>
Date: Thu,  2 Jan 2025 14:39:15 +0100
Subject: [PATCH v5 6/6] lib: sbi: pmu: add the PMU SSE event only if overflow IRQ is supported
In-Reply-To: <20250102133916.413899-1-cleger@rivosinc.com>
References: <20250102133916.413899-1-cleger@rivosinc.com>
Message-ID: <20250102133916.413899-7-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the PMU SSE event only if an overflow irq bit is present.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 lib/sbi/sbi_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 6e69a4dc..40b898fe 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1165,7 +1165,8 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 
-		sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+		if (sbi_pmu_irq_bit() >= 0)
+			sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
 	}
 
 	phs = pmu_get_hart_state_ptr(scratch);
-- 
2.45.2


