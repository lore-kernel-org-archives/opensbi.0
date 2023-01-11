From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed, 11 Jan 2023 10:15:11 +0000
Subject: [PATCH] platform: generic: renesas: rzfive: Configure the Local memory regions as part of root domain
Message-ID: <20230111101511.1386-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
virtual address falls within this range, the MMU doesn't trigger a page
fault; it assumes the virtual address is a physical address which can
cause undesired behaviours for statically linked applications/libraries.

To avoid this, add the ILM/DLM memory regions to the root domain region
of the PMPU with permissions set to 0x0 so that any access to these
regions gets blocked.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 platform/generic/renesas/rzfive/rzfive.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index ca182e3..76f2d3a 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -5,8 +5,25 @@
  */
 
 #include <platform_override.h>
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
+int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
+{
+	/*
+	 * Renesas RZ/Five RISC-V SoC has Instruction local memory and
+	 * Data local memory (ILM & DLM) mapped between region 0x30000
+	 * to 0x4FFFF. When a virtual address falls within this range,
+	 * the MMU doesn't trigger a page fault; it assumes the virtual
+	 * address is a physical address which can cause undesired
+	 * behaviours for statically linked applications/libraries. To
+	 * avoid this, add the ILM/DLM memory regions to the root domain
+	 * region of the PMPU with permissions set to 0x0 so that any
+	 * access to these regions gets blocked.
+	 */
+	return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000, 0x0);
+}
+
 static const struct fdt_match renesas_rzfive_match[] = {
 	{ .compatible = "renesas,r9a07g043f01" },
 	{ /* sentinel */ }
@@ -14,4 +31,5 @@ static const struct fdt_match renesas_rzfive_match[] = {
 
 const struct platform_override renesas_rzfive = {
 	.match_table = renesas_rzfive_match,
+	.early_init = renesas_rzfive_early_init,
 };
-- 
2.17.1


