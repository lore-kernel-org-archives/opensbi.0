From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Thu, 1 Aug 2024 15:26:31 +0800
Subject: [PATCH v3 1/2] util: atcsmu.c: fix typo "%s/hard/hart/"
Message-ID: <20240801072632.2402741-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

%s/hard/hart

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/utils/sys/atcsmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/sys/atcsmu.c b/lib/utils/sys/atcsmu.c
index 8ddd88d5..676c91f4 100644
--- a/lib/utils/sys/atcsmu.c
+++ b/lib/utils/sys/atcsmu.c
@@ -84,7 +84,7 @@ inline int smu_set_reset_vector(struct smu_data *smu, ulong wakeup_addr,
 
 	if (reset_vector != (u64)wakeup_addr) {
 		sbi_printf(
-			"hard%d (PCS%d): Failed to program the reset vector.\n",
+			"hart%d (PCS%d): Failed to program the reset vector.\n",
 			hartid, hartid + 3);
 		return SBI_EFAIL;
 	} else
-- 
2.34.1


