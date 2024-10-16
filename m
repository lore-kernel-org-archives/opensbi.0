From: Xiang W <wxjstz@126.com>
Date: Thu, 17 Oct 2024 01:53:19 +0800
Subject: [PATCH] lib: sbi: Fix integer overflow in is_region_subset
Message-ID: <20241016175348.149869-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When calculating the end address of memregion, shifting may overflow.
Add code to avoid it.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_domain.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index feb2392..4c10cb1 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -191,9 +191,13 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
 			     const struct sbi_domain_memregion *regB)
 {
 	ulong regA_start = regA->base;
-	ulong regA_end = regA->base + (BIT(regA->order) - 1);
+	ulong regA_end = regA->order < __riscv_xlen ?
+			    regA->base + (BIT(regA->order) - 1) :
+			    -1UL;
 	ulong regB_start = regB->base;
-	ulong regB_end = regB->base + (BIT(regB->order) - 1);
+	ulong regB_end = regB->order < __riscv_xlen ?
+			    regB->base + (BIT(regB->order) - 1) :
+			    -1UL;
 
 	if ((regB_start <= regA_start) &&
 	    (regA_start < regB_end) &&
-- 
2.45.2


