From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:35 -0800
Subject: [PATCH 1/5] lib: sbi_pmu: PMU raw event v2 support
In-Reply-To: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
Message-ID: <20241119-pmu_event_info-v1-1-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As per the updated ISA specification and SBI PMU v3.0, lower 56
bits are available for the platform to implement mhpmeventX
encoding. Implement the PMU raw event V2 support defined in SBI
v3.0 which allows more bits for platforms to encode the raw events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h |  2 ++
 lib/sbi/sbi_pmu.c                 | 14 +++++++++-----
 platform/generic/platform.c       |  3 ++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 3aa574669e72..bcb7359f20c5 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -245,6 +245,7 @@ enum sbi_pmu_event_type_id {
 	SBI_PMU_EVENT_TYPE_HW				= 0x0,
 	SBI_PMU_EVENT_TYPE_HW_CACHE			= 0x1,
 	SBI_PMU_EVENT_TYPE_HW_RAW			= 0x2,
+	SBI_PMU_EVENT_TYPE_HW_RAW_V2			= 0x3,
 	SBI_PMU_EVENT_TYPE_FW				= 0xf,
 	SBI_PMU_EVENT_TYPE_MAX,
 };
@@ -261,6 +262,7 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_EVENT_IDX_TYPE_MASK (0xF << SBI_PMU_EVENT_IDX_TYPE_OFFSET)
 #define SBI_PMU_EVENT_IDX_CODE_MASK 0xFFFF
 #define SBI_PMU_EVENT_RAW_IDX 0x20000
+#define SBI_PMU_EVENT_RAW_V2_IDX 0x30000
 
 #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
 
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index b9e845430fcb..14d6a0da984c 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -172,6 +172,7 @@ static int pmu_event_validate(struct sbi_pmu_hart_state *phs,
 			return SBI_EINVAL;
 		break;
 	case SBI_PMU_EVENT_TYPE_HW_RAW:
+	case SBI_PMU_EVENT_TYPE_HW_RAW_V2:
 		event_idx_code_max = 1; // event_idx.code should be zero
 		break;
 	default:
@@ -259,7 +260,8 @@ static int pmu_add_hw_event_map(u32 eidx_start, u32 eidx_end, u32 cmap,
 
 	/* Sanity check */
 	for (i = 0; i < num_hw_events; i++) {
-		if (eidx_start == SBI_PMU_EVENT_RAW_IDX)
+		if (eidx_start == SBI_PMU_EVENT_RAW_IDX ||
+			eidx_start == SBI_PMU_EVENT_RAW_V2_IDX)
 		/* All raw events have same event idx. Just do sanity check on select */
 			is_overlap = pmu_event_select_overlap(&hw_event_map[i],
 							      select, select_mask);
@@ -290,8 +292,8 @@ reset_event:
  */
 int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
 {
-	if ((eidx_start > eidx_end) || eidx_start == SBI_PMU_EVENT_RAW_IDX ||
-	     eidx_end == SBI_PMU_EVENT_RAW_IDX)
+	if ((eidx_start > eidx_end) || eidx_start >= SBI_PMU_EVENT_RAW_V2_IDX ||
+	     eidx_end >= SBI_PMU_EVENT_RAW_V2_IDX)
 		return SBI_EINVAL;
 
 	return pmu_add_hw_event_map(eidx_start, eidx_end, cmap, 0, 0);
@@ -299,8 +301,9 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap)
 
 int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap)
 {
+	sbi_printf("%s: select %lx select_mask %lx cmap %x\n", __func__, select, select_mask, cmap);
 	return pmu_add_hw_event_map(SBI_PMU_EVENT_RAW_IDX,
-				    SBI_PMU_EVENT_RAW_IDX, cmap, select, select_mask);
+				    SBI_PMU_EVENT_RAW_V2_IDX, cmap, select, select_mask);
 }
 
 void sbi_pmu_ovf_irq()
@@ -736,7 +739,8 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 			continue;
 
 		/* For raw events, event data is used as the select value */
-		if (event_idx == SBI_PMU_EVENT_RAW_IDX) {
+		if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
+			event_idx == SBI_PMU_EVENT_RAW_V2_IDX) {
 			uint64_t select_mask = temp->select_mask;
 
 			/* The non-event map bits of data should match the selector */
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 3b20ffbe780a..03cf019c2936 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -393,7 +393,8 @@ static uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx,
 	uint64_t evt_val = 0;
 
 	/* data is valid only for raw events and is equal to event selector */
-	if (event_idx == SBI_PMU_EVENT_RAW_IDX)
+	if (event_idx == SBI_PMU_EVENT_RAW_IDX ||
+		event_idx == SBI_PMU_EVENT_RAW_V2_IDX)
 		evt_val = data;
 	else {
 		/**

-- 
2.34.1


