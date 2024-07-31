From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Wed, 31 Jul 2024 10:28:06 +0800
Subject: [PATCH 1/1] util: atcsmu.c: fix typo and coding style
Message-ID: <20240731022806.851197-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 lib/utils/sys/atcsmu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
index 8ddd88d5..c783aaae 100644
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
@@ -58,11 +58,11 @@ inline bool smu_support_sleep_mode(struct smu_data *smu, u32 sleep_mode,
 
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
@@ -84,9 +84,10 @@ inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
 
 	if (reset_vector != (u64)wakeup_addr) {
 		sbi_printf(
-			"hard%d (PCS%d): Failed to program the reset vector.\n",
+			"hart%d (PCS%d): Failed to program the reset vector.\n",
 			hartid, hartid + 3);
 		return SBI_EFAIL;
-	} else
-		return 0;
+	}
+
+	return 0;
 }
-- 
2.34.1


