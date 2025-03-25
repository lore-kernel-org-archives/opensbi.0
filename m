From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:26 -0700
Subject: [PATCH 03/10] platform: generic: thead: Avoid casting away const
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

struct fdt_match expects match data to be const. Follow this expectation
so that no type casting is needed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/thead/thead-generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index fedb6145..25919df1 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -22,7 +22,7 @@ struct thead_generic_quirks {
 static int thead_generic_early_init(bool cold_boot, const void *fdt,
 				    const struct fdt_match *match)
 {
-	struct thead_generic_quirks *quirks = (void *)match->data;
+	const struct thead_generic_quirks *quirks = match->data;
 
 	if (quirks->errata & THEAD_QUIRK_ERRATA_TLB_FLUSH)
 		thead_register_tlb_flush_trap_handler();
@@ -33,7 +33,7 @@ static int thead_generic_early_init(bool cold_boot, const void *fdt,
 static int thead_generic_extensions_init(const struct fdt_match *match,
 					 struct sbi_hart_features *hfeatures)
 {
-	struct thead_generic_quirks *quirks = (void *)match->data;
+	const struct thead_generic_quirks *quirks = match->data;
 
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
 		thead_c9xx_register_pmu_device();
@@ -41,11 +41,11 @@ static int thead_generic_extensions_init(const struct fdt_match *match,
 	return 0;
 }
 
-static struct thead_generic_quirks thead_th1520_quirks = {
+static const struct thead_generic_quirks thead_th1520_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH | THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
-static struct thead_generic_quirks thead_pmu_quirks = {
+static const struct thead_generic_quirks thead_pmu_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
-- 
2.47.2


