From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Wed, 31 Jul 2024 10:58:41 +0800
Subject: [PATCH v2, 1/1] util: atcsmu.c: fix typo and coding style
Message-ID: <20240731025841.984979-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix typo "hard -> hart", printf format and if statement coding style.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/utils/sys/atcsmu.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
index 8ddd88d5..0472d0f9 100644
--- a/lib/utils/sys/atcsmu.c
+++ b/lib/utils/sys/atcsmu.c
@@ -15,11 +15,11 @@
 
 inline int smu_set_wakeup_events(struct smu_data *smu, u32 events, u32 hartid)
 {
-	if (smu) {
-		writel(events, (void *)(smu->addr + PCSm_WE_OFFSET(hartid)));
-		return 0;
-	} else
+	if (!smu)
 		return SBI_EINVAL;
+
+	writel(events, (void *)(smu->addr + PCSm_WE_OFFSET(hartid)));
+	return 0;
 }
 
 inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
@@ -37,17 +37,15 @@ inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
 	switch (sleep_mode) {
 	case LIGHTSLEEP_MODE:
 		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_LIGHT_SLEEP) == 0) {
-			sbi_printf(
-				"SMU: hart%d (PCS%d) does not support light sleep mode\n",
-				hartid, hartid + 3);
+			sbi_printf("SMU: hart%d (PCS%d) does not support light sleep mode\n",
+				   hartid, hartid + 3);
 			return false;
 		}
 		break;
 	case DEEPSLEEP_MODE:
 		if (EXTRACT_FIELD(pcs_cfg, PCS_CFG_DEEP_SLEEP) == 0) {
-			sbi_printf(
-				"SMU: hart%d (PCS%d) does not support deep sleep mode\n",
-				hartid, hartid + 3);
+			sbi_printf("SMU: hart%d (PCS%d) does not support deep sleep mode\n",
+				   hartid, hartid + 3);
 			return false;
 		}
 		break;
@@ -58,11 +56,11 @@ inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
 
 inline int smu_set_command(struct smu_data *smu, u32 pcs_ctl, u32 hartid)
 {
-	if (smu) {
-		writel(pcs_ctl, (void *)(smu->addr + PCSm_CTL_OFFSET(hartid)));
-		return 0;
-	} else
+	if (!smu)
 		return SBI_EINVAL;
+
+	writel(pcs_ctl, (void *)(smu->addr + PCSm_CTL_OFFSET(hartid)));
+	return 0;
 }
 
 inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
@@ -83,10 +81,10 @@ inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
 	reset_vector = ((u64)vec_hi << 32) | vec_lo;
 
 	if (reset_vector != (u64)wakeup_addr) {
-		sbi_printf(
-			"hard%d (PCS%d): Failed to program the reset vector.\n",
-			hartid, hartid + 3);
+		sbi_printf("hart%d (PCS%d): Failed to program the reset vector.\n",
+			   hartid, hartid + 3);
 		return SBI_EFAIL;
-	} else
-		return 0;
+	}
+
+	return 0;
 }
-- 
2.34.1


