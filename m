From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:08 +0100
Subject: [PATCH v2 1/7] lib: sbi: sse: Update SSE event ids
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
Message-ID: <20250325102615.1587953-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest specification added new high priority RAS events and renamed
the PMU to PMU_OVERFLOW.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h | 44 ++++++++++++++++++++++++-------
 lib/sbi/sbi_pmu.c                 |  4 +--
 lib/sbi/sbi_sse.c                 |  8 +++---
 3 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index e68d9188..4817c8cf 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -393,34 +393,60 @@ enum sbi_sse_state {
 };
 
 /* SBI SSE Event IDs. */
-#define SBI_SSE_EVENT_LOCAL_RAS			0x00000000
+/* Range 0x00000000 - 0x0000ffff */
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
 #define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_LOCAL_RESERVED_0_START	0x00000002
+#define SBI_SSE_EVENT_LOCAL_RESERVED_0_END	0x00003fff
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_START	0x00004000
 #define SBI_SSE_EVENT_LOCAL_PLAT_0_END		0x00007fff
-#define SBI_SSE_EVENT_GLOBAL_RAS		0x00008000
+
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_0_START	0x00008001
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_0_END	0x0000bfff
 #define SBI_SSE_EVENT_GLOBAL_PLAT_0_START	0x0000c000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_0_END		0x0000ffff
 
-#define SBI_SSE_EVENT_LOCAL_PMU			0x00010000
+/* Range 0x00010000 - 0x0001ffff */
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_RESERVED_1_START	0x00010001
+#define SBI_SSE_EVENT_LOCAL_RESERVED_1_END	0x00013fff
 #define SBI_SSE_EVENT_LOCAL_PLAT_1_START	0x00014000
 #define SBI_SSE_EVENT_LOCAL_PLAT_1_END		0x00017fff
+
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_1_START	0x00018000
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_1_END	0x0001bfff
 #define SBI_SSE_EVENT_GLOBAL_PLAT_1_START	0x0001c000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_1_END		0x0001ffff
 
-#define SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00024000
-#define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00027fff
-#define SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0002c000
-#define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0002ffff
+/* Range 0x00100000 - 0x0010ffff */
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_LOCAL_RESERVED_2_START	0x00100001
+#define SBI_SSE_EVENT_LOCAL_RESERVED_2_END	0x00103fff
+#define SBI_SSE_EVENT_LOCAL_PLAT_2_START	0x00104000
+#define SBI_SSE_EVENT_LOCAL_PLAT_2_END		0x00107fff
 
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_2_START	0x00108001
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_2_END	0x0010bfff
+#define SBI_SSE_EVENT_GLOBAL_PLAT_2_START	0x0010c000
+#define SBI_SSE_EVENT_GLOBAL_PLAT_2_END		0x0010ffff
+
+/* Range 0xffff0000 - 0xffffffff */
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE		0xffff0000
+#define SBI_SSE_EVENT_LOCAL_RESERVED_3_START	0xffff0001
+#define SBI_SSE_EVENT_LOCAL_RESERVED_3_END	0xffff3fff
 #define SBI_SSE_EVENT_LOCAL_PLAT_3_START	0xffff4000
 #define SBI_SSE_EVENT_LOCAL_PLAT_3_END		0xffff7fff
+
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE		0xffff8000
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_3_START	0xffff8001
+#define SBI_SSE_EVENT_GLOBAL_RESERVED_3_END	0xffffbfff
 #define SBI_SSE_EVENT_GLOBAL_PLAT_3_START	0xffffc000
 #define SBI_SSE_EVENT_GLOBAL_PLAT_3_END		0xffffffff
 
-#define SBI_SSE_EVENT_GLOBAL_BIT		(1 << 15)
-#define SBI_SSE_EVENT_PLATFORM_BIT		(1 << 14)
+#define SBI_SSE_EVENT_GLOBAL_BIT		BIT(15)
+#define SBI_SSE_EVENT_PLATFORM_BIT		BIT(14)
 
 /* SBI function IDs for MPXY extension */
 #define SBI_EXT_MPXY_GET_SHMEM_SIZE		0x0
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 40b898fe..4f113c23 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -313,7 +313,7 @@ void sbi_pmu_ovf_irq()
 	 * on an irq being triggered
 	 */
 	csr_clear(CSR_MIE, sbi_pmu_irq_mask());
-	sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_PMU);
+	sbi_sse_inject_event(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW);
 }
 
 static int pmu_ctr_enable_irq_hw(int ctr_idx)
@@ -1166,7 +1166,7 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
 		total_ctrs = num_hw_ctrs + SBI_PMU_FW_CTR_MAX;
 
 		if (sbi_pmu_irq_bit() >= 0)
-			sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU, &pmu_sse_cb_ops);
+			sbi_sse_add_event(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, &pmu_sse_cb_ops);
 	}
 
 	phs = pmu_get_hart_state_ptr(scratch);
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index ff2745a3..39916d34 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -195,10 +195,12 @@ static SBI_SLIST_HEAD(supported_events, sse_event_info) =
  * events in order to return SBI_ERR_NOT_SUPPORTED for them.
  */
 static const uint32_t standard_events[] = {
-	SBI_SSE_EVENT_LOCAL_RAS,
+	SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS,
 	SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP,
-	SBI_SSE_EVENT_GLOBAL_RAS,
-	SBI_SSE_EVENT_LOCAL_PMU,
+	SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS,
+	SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW,
+	SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS,
+	SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS,
 	SBI_SSE_EVENT_LOCAL_SOFTWARE,
 	SBI_SSE_EVENT_GLOBAL_SOFTWARE,
 };
-- 
2.47.2


