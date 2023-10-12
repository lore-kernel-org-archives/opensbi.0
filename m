From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 12 Oct 2023 09:54:18 +0800
Subject: [PATCH] platform: generic: thead: improve tlb flush errata
Message-ID: <IA1PR20MB49530A123B23DFFED0CC3E06BBD3A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Flushing the tlb entries can solve the thead tlb problem, but flushing
it by address will miss something and lead to a exception in some rare
cases, and this is more common for sg2042.

To solve this problem, flush the tlb entries by asid in the custom trap
handler to ensure it is refreshed.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
This patch based on the th1520 series patch.
---
 platform/generic/thead/thead_c9xx_tlb_trap_handler.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/platform/generic/thead/thead_c9xx_tlb_trap_handler.S b/platform/generic/thead/thead_c9xx_tlb_trap_handler.S
index 861c029..120daa7 100644
--- a/platform/generic/thead/thead_c9xx_tlb_trap_handler.S
+++ b/platform/generic/thead/thead_c9xx_tlb_trap_handler.S
@@ -9,5 +9,5 @@
 	.align 3
 	.globl _thead_tlb_flush_fixup_trap_handler
 _thead_tlb_flush_fixup_trap_handler:
-	sfence.vma t0, zero
+	sfence.vma zero, t0
 	j _trap_handler
--
2.42.0


