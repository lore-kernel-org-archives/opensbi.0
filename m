From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue,  7 Feb 2023 22:23:24 +0530
Subject: [PATCH 1/3] lib: sbi_pmu: add callback for counter width
In-Reply-To: <20230207165326.3205728-1-mchitale@ventanamicro.com>
References: <20230207165326.3205728-1-mchitale@ventanamicro.com>
Message-ID: <20230207165326.3205728-2-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a callback to fetch the number of bits implemented for a
custom firmware counter. If the callback fails or is not implemented then
width defaults to 63.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 include/sbi/sbi_pmu.h | 5 +++++
 lib/sbi/sbi_pmu.c     | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index c365243..b3b75c1 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -41,6 +41,11 @@ struct sbi_pmu_device {
 	bool (*fw_counter_match_code)(uint32_t counter_index,
 				      uint32_t event_idx_code);
 
+	/**
+	 * Fetch the max width of this counter in number of bits.
+	 */
+	int (*fw_counter_width)(void);
+
 	/**
 	 * Read value of custom firmware counter
 	 * Note: 0 <= counter_index < SBI_PMU_FW_CTR_MAX
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 154dbda..a99c045 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -761,6 +761,7 @@ unsigned long sbi_pmu_num_ctr(void)
 
 int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 {
+	int width;
 	union sbi_pmu_ctr_info cinfo = {0};
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
@@ -782,6 +783,11 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 		cinfo.type = SBI_PMU_CTR_TYPE_FW;
 		/* Firmware counters are always 64 bits wide */
 		cinfo.width = 63;
+		if (pmu_dev && pmu_dev->fw_counter_width) {
+			width = pmu_dev->fw_counter_width();
+			if (width)
+				cinfo.width = width - 1;
+		}
 	}
 
 	*ctr_info = cinfo.value;
-- 
2.34.1


