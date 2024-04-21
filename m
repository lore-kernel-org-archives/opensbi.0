From: Yangyu Chen <cyy@cyyself.name>
Date: Sun, 21 Apr 2024 23:52:09 +0800
Subject: [PATCH 2/2] platform: generic: thead: add Canaan Kendryte K230
In-Reply-To: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
References: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
Message-ID: <tencent_6C2A44A1919D0F42D0423BC3D11697348605@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Canaan Kendryte K230 SoC has T-Head C908 cores inside. The dt-binding has
been merged into the linux kernel [1]. However, it has early version of
C908 core which does not have Sscofpmf and need to use T-Head PMU
extension. Thus, we add a K230 compatible string to thead_generic_match
and set quirk for T-Head PMU.

[1] https://lore.kernel.org/linux-riscv/tencent_4D85743622F39109466913393EE2F6C5980A at qq.com/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 platform/generic/thead/thead-generic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index da55e05..3b59a0d 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -45,8 +45,13 @@ static struct thead_generic_quirks thead_th1520_quirks = {
 	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH | THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
+static struct thead_generic_quirks canaan_k230_quirks = {
+	.errata = THEAD_QUIRK_ERRATA_THEAD_PMU,
+};
+
 static const struct fdt_match thead_generic_match[] = {
 	{ .compatible = "thead,th1520", .data = &thead_th1520_quirks },
+	{ .compatible = "canaan,kendryte-k230", .data = &canaan_k230_quirks },
 	{ },
 };
 
-- 
2.43.0


