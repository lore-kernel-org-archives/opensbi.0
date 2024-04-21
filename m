From: Yangyu Chen <cyy@cyyself.name>
Date: Sun, 21 Apr 2024 23:52:08 +0800
Subject: [PATCH 1/2] platform: generic: thead: separate T-Head PMU Errata
In-Reply-To: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
References: <tencent_0B636642B81B2FF820053DB5571D87701709@qq.com>
Message-ID: <tencent_815FAC608936A023172E4ECC5C8856E30B06@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As Guo Ren said from the kernel mailing list [1], future T-Head CPUs,
including the newer versions of T-Head C908, will feature standard
Sscofpmf extension. For these CPUs, T-Head's implementation of PMU
Overflow Interrupts may not needed anymore. In this case, we shouldn't
apply T-Head PMU for all T-Head CPUs. Thus, this patch separated T-Head PMU
errata.

[1] https://lore.kernel.org/linux-riscv/Zh9sUUUT09LZb0MO at gmail.com/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 platform/generic/include/thead/c9xx_errata.h | 1 +
 platform/generic/thead/thead-generic.c       | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/platform/generic/include/thead/c9xx_errata.h b/platform/generic/include/thead/c9xx_errata.h
index bf97938..40c1587 100644
--- a/platform/generic/include/thead/c9xx_errata.h
+++ b/platform/generic/include/thead/c9xx_errata.h
@@ -7,6 +7,7 @@
  * stale entrie avoid incorrect memory access.
  */
 #define THEAD_QUIRK_ERRATA_TLB_FLUSH		BIT(0)
+#define THEAD_QUIRK_ERRATA_THEAD_PMU		BIT(1)
 
 void thead_register_tlb_flush_trap_handler(void);
 
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index 72f4aaa..da55e05 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -33,12 +33,16 @@ static int thead_generic_early_init(bool cold_boot,
 static int thead_generic_extensions_init(const struct fdt_match *match,
 					 struct sbi_hart_features *hfeatures)
 {
-	thead_c9xx_register_pmu_device();
+	struct thead_generic_quirks *quirks = (void *)match->data;
+
+	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
+		thead_c9xx_register_pmu_device();
+
 	return 0;
 }
 
 static struct thead_generic_quirks thead_th1520_quirks = {
-	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH,
+	.errata = THEAD_QUIRK_ERRATA_TLB_FLUSH | THEAD_QUIRK_ERRATA_THEAD_PMU,
 };
 
 static const struct fdt_match thead_generic_match[] = {
-- 
2.43.0


