From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:40 +0530
Subject: [PATCH 3/7] lib: sbi_pmu: Firmware counters are always 64 bits wide
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As-per SBI specification, all firmware counters are always 64 bits
wide so let us update the SBI PMU implementation to reflect this fact.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 250808e..1c01d34 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -36,7 +36,7 @@ struct sbi_pmu_hw_event {
 /** Representation of a firmware event */
 struct sbi_pmu_fw_event {
 	/* Current value of the counter */
-	unsigned long curr_count;
+	uint64_t curr_count;
 
 	/* A flag indicating pmu event monitoring is started */
 	bool bStarted;
@@ -719,8 +719,8 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 	} else {
 		/* it's a firmware counter */
 		cinfo.type = SBI_PMU_CTR_TYPE_FW;
-		/* Firmware counters are XLEN bits wide */
-		cinfo.width = BITS_PER_LONG - 1;
+		/* Firmware counters are always 64 bits wide */
+		cinfo.width = 63;
 	}
 
 	*ctr_info = cinfo.value;
-- 
2.34.1


