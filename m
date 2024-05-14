From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 14 May 2024 12:53:40 +0800
Subject: [PATCH] platform: generic: thead: add Sophgo CV18XX/SG200X series
Message-ID: <IA1PR20MB4953463968312055179421F0BBE32@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Sophgo CV18XX/SG200X series SoCs have a standard C906
core. Add support for it.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 platform/generic/thead/thead-generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index 3b59a0d..c82e0c1 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -49,7 +49,15 @@ static struct thead_generic_quirks canaan_k230_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
+static struct thead_generic_quirks sophgo_cv1800_quirks = {
+	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
+};
+
 static const struct fdt_match thead_generic_match[] = {
+	{ .compatible = "sophgo,cv1800b", .data = &sophgo_cv1800_quirks },
+	{ .compatible = "sophgo,cv1812h", .data = &sophgo_cv1800_quirks },
+	{ .compatible = "sophgo,sg2000", .data = &sophgo_cv1800_quirks },
+	{ .compatible = "sophgo,sg2002", .data = &sophgo_cv1800_quirks },
 	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
 	{ .compatible = "canaan,kendryte-k230", .data = &canaan_k230_quirks },
 	{ },
-- 
2.45.0


