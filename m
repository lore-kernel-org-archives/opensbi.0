From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 18 Dec 2024 21:02:38 -0800
Subject: [PATCH v2 1/2] platform: generic: Initialize console before other drivers
Message-ID: <20241219050250.3861915-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Initialize serial drivers first, so messages printed by other drivers do
not need to use the early console buffer.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 platform/generic/platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 350d2517..c03ed88e 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -250,17 +250,17 @@ static int generic_early_init(bool cold_boot)
 	int rc;
 
 	if (cold_boot) {
-		fdt_reset_init(fdt);
-		fdt_suspend_init(fdt);
-		fdt_hsm_init(fdt);
-		fdt_cppc_init(fdt);
-
 		if (semihosting_enabled())
 			rc = semihosting_init();
 		else
 			rc = fdt_serial_init(fdt);
 		if (rc)
 			return rc;
+
+		fdt_cppc_init(fdt);
+		fdt_hsm_init(fdt);
+		fdt_reset_init(fdt);
+		fdt_suspend_init(fdt);
 	}
 
 	if (!generic_plat || !generic_plat->early_init)
-- 
2.45.1


