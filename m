From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu,  3 Aug 2023 09:50:34 +0800
Subject: [PATCH] platform: generic: allwinner: correct mhpmevent count
Message-ID: <IA1PR20MB495331314E453C7E9822C88ABB08A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only the CSR mhpmevent 3-9,13-17 of D1 have valid function, so reduce
the mhpm_count to 15 to avoid invalid usage.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/allwinner/sun20i-d1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 0f0a9f3..94a3a5e 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -272,7 +272,8 @@ static int sun20i_d1_extensions_init(const struct fdt_match *match,
 	sbi_pmu_set_device(&thead_c9xx_pmu_device);

 	/* auto-detection doesn't work on t-head c9xx cores */
-	hfeatures->mhpm_count = 29;
+	/* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
+	hfeatures->mhpm_count = 15;
 	hfeatures->mhpm_bits = 64;

 	return 0;
--
2.41.0


