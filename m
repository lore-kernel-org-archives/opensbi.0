From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 11:34:37 -0800
Subject: [PATCH 3/5] lib: sbi_pmu: Add SBI PMU event info function details.
In-Reply-To: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-5f287a6f0135@rivosinc.com>
Message-ID: <20241119-pmu_event_info-v1-3-5f287a6f0135@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI v3.0 introduced a new function to query about the events
without invoking CFG_MATCH. This allows supervisor software to
identify which events are supported on the platform with single
SBI call instead of a CFG_MATCH for each event.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index bcb7359f20c5..29b18f5fd003 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -12,6 +12,8 @@
 
 /* clang-format off */
 
+#include <sbi/sbi_types.h>
+
 /* SBI Extension IDs */
 #define SBI_EXT_0_1_SET_TIMER			0x0
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
@@ -107,6 +109,7 @@
 #define SBI_EXT_PMU_COUNTER_FW_READ	0x5
 #define SBI_EXT_PMU_COUNTER_FW_READ_HI	0x6
 #define SBI_EXT_PMU_SNAPSHOT_SET_SHMEM	0x7
+#define SBI_EXT_PMU_EVENT_GET_INFO		0x8
 
 /* SBI function IDs for DBTR extension */
 #define SBI_EXT_DBTR_NUM_TRIGGERS	0x0
@@ -256,6 +259,12 @@ enum sbi_pmu_ctr_type {
 	SBI_PMU_CTR_TYPE_FW,
 };
 
+struct sbi_pmu_event_info {
+	uint32_t event_idx;
+	uint32_t output;
+	uint64_t event_data;
+};
+
 /* Helper macros to decode event idx */
 #define SBI_PMU_EVENT_IDX_MASK 0xFFFFF
 #define SBI_PMU_EVENT_IDX_TYPE_OFFSET 16

-- 
2.34.1


