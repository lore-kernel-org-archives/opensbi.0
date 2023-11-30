From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Thu, 30 Nov 2023 20:42:08 +0800
Subject: [PATCH v4 10/15] lib: utils: fdt_fixup: Allow preserving PMU properties
In-Reply-To: <20231130124213.2590640-1-peterlin@andestech.com>
References: <20231130124213.2590640-1-peterlin@andestech.com>
Message-ID: <20231130124213.2590640-11-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a Kconfig option to control PMU fixup, so the next
stage software can dump the PMU node including event
mapping information for debugging purposes.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v1 -> v2:
  - New patch
Changes v2 -> v3:
  - Rename to SBI_SCRATCH_PRESERVE_PMU_NODE (suggested by Anup)
  - Include Anup's RB tag
Changes v3 -> v4:
  - Use Kconfig instead (suggested by Anup)
---
 lib/utils/fdt/Kconfig     | 7 +++++++
 lib/utils/fdt/fdt_fixup.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/lib/utils/fdt/Kconfig b/lib/utils/fdt/Kconfig
index 23b003b..9a42d15 100644
--- a/lib/utils/fdt/Kconfig
+++ b/lib/utils/fdt/Kconfig
@@ -15,4 +15,11 @@ config FDT_PMU
 	bool "FDT performance monitoring unit (PMU) support"
 	default n
 
+config FDT_FIXUPS_PRESERVE_PMU_NODE
+	bool "Preserve PMU node in device-tree"
+	depends on FDT_PMU
+	default n
+	help
+	  Preserve PMU node properties for debugging purposes.
+
 endif
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index e213ded..5fc7673 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -394,5 +394,8 @@ void fdt_fixups(void *fdt)
 	fdt_plic_fixup(fdt);
 
 	fdt_reserved_memory_fixup(fdt);
+
+#ifndef CONFIG_FDT_FIXUPS_PRESERVE_PMU_NODE
 	fdt_pmu_fixup(fdt);
+#endif
 }
-- 
2.34.1


