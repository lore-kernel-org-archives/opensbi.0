From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Mar 2025 16:43:24 -0700
Subject: [PATCH 01/10] platform: generic: andes: Remove inline definitions
In-Reply-To: <20250325234342.711447-1-samuel.holland@sifive.com>
References: <20250325234342.711447-1-samuel.holland@sifive.com>
Message-ID: <20250325234342.711447-2-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The addresses of these functions are used to set function pointers in
struct platform_override, so it is not valid for them to be inline.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/include/andes/andes_pmu.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/platform/generic/include/andes/andes_pmu.h b/platform/generic/include/andes/andes_pmu.h
index f3553246..c600d35f 100644
--- a/platform/generic/include/andes/andes_pmu.h
+++ b/platform/generic/include/andes/andes_pmu.h
@@ -11,24 +11,8 @@
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/fdt/fdt_pmu.h>
 
-#ifdef CONFIG_ANDES_PMU
-
 int andes_pmu_init(const struct fdt_match *match);
 int andes_pmu_extensions_init(const struct fdt_match *match,
 			      struct sbi_hart_features *hfeatures);
 
-#else
-
-static inline int andes_pmu_init(const struct fdt_match *match)
-{
-	return 0;
-}
-static inline int andes_pmu_extensions_init(const struct fdt_match *match,
-			      struct sbi_hart_features *hfeatures)
-{
-	return 0;
-}
-
-#endif /* CONFIG_ANDES_PMU */
-
 #endif /* _RISCV_ANDES_PMU_H */
-- 
2.47.2


