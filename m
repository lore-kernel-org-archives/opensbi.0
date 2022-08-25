From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 25 Aug 2022 10:21:38 +0530
Subject: [PATCH 1/7] lib: sbi_pmu: Remove "event_idx" member from struct sbi_pmu_fw_event
In-Reply-To: <20220825045144.752619-1-apatel@ventanamicro.com>
References: <20220825045144.752619-1-apatel@ventanamicro.com>
Message-ID: <20220825045144.752619-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "event_idx" member of struct sbi_pmu_fw_event is not used
anywhere so let us remove it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5a294a2..535e5cc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -35,9 +35,6 @@ struct sbi_pmu_hw_event {
 
 /** Representation of a firmware event */
 struct sbi_pmu_fw_event {
-	/* Event associated with the particular counter */
-	uint32_t event_idx;
-
 	/* Current value of the counter */
 	unsigned long curr_count;
 
-- 
2.34.1


