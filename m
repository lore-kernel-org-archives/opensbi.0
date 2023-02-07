From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue,  7 Feb 2023 22:23:25 +0530
Subject: [PATCH 2/3] lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi
In-Reply-To: <20230207165326.3205728-1-mchitale@ventanamicro.com>
References: <20230207165326.3205728-1-mchitale@ventanamicro.com>
Message-ID: <20230207165326.3205728-3-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To support 64 bit firmware counters on RV32 systems, we implement
sbi_pmu_counter_fw_read_hi() which returns the upper 32 bits of
the firmware counter value. On RV64 (or higher) systems, this
function will always return zero.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h | 1 +
 lib/sbi/sbi_ecall_pmu.c           | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a3f2bf4..f5d6667 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -99,6 +99,7 @@
 #define SBI_EXT_PMU_COUNTER_START	0x3
 #define SBI_EXT_PMU_COUNTER_STOP	0x4
 #define SBI_EXT_PMU_COUNTER_FW_READ	0x5
+#define SBI_EXT_PMU_COUNTER_FW_READ_HI	0x6
 
 /** General pmu event codes specified in SBI PMU extension */
 enum sbi_pmu_hw_generic_events_t {
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 826c8a8..2d1e669 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -54,6 +54,14 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
 		*out_val = temp;
 		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
+#if __riscv_xlen == 32
+		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
+		*out_val = temp >> 32
+#else
+		*out_val = 0;
+#endif
+		break;
 	case SBI_EXT_PMU_COUNTER_START:
 
 #if __riscv_xlen == 32
-- 
2.34.1


