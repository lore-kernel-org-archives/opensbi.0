From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:29 -0700
Subject: [PATCH 8/8] lib: sbi: memregion: Move memregion_sanitize_pmp() closer to its call site
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-9-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a code movement change to move the previously created
memregion_sanitize_pmp() function closer to its call site.
---
 lib/sbi/sbi_memregion.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 3783a0a..7c5a977 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -4,28 +4,6 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_string.h>
 
-static void memregion_sanitize_pmp(struct sbi_memregion *reg)
-{
-	unsigned long base = 0, order;
-	unsigned long addr = reg->base, size = reg->size;
-	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
-		if (order < __riscv_xlen) {
-			base = addr & ~((1UL << order) - 1UL);
-			if ((base <= addr) &&
-			    (addr < (base + (1UL << order))) &&
-			    (base <= (addr + size - 1UL)) &&
-			    ((addr + size - 1UL) < (base + (1UL << order))))
-				break;
-		} else {
-			base = 0;
-			break;
-		}
-	}
-
-	reg->base = base;
-	reg->size = (order == __riscv_xlen) ? -1UL : BIT(order);
-}
-
 void sbi_memregion_init(unsigned long addr,
 			       unsigned long size,
 			       unsigned long flags,
@@ -212,6 +190,28 @@ static void merge_memregions(struct sbi_domain *dom, int *nmerged)
 	}
 }
 
+static void memregion_sanitize_pmp(struct sbi_memregion *reg)
+{
+	unsigned long base = 0, order;
+	unsigned long addr = reg->base, size = reg->size;
+	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
+		if (order < __riscv_xlen) {
+			base = addr & ~((1UL << order) - 1UL);
+			if ((base <= addr) &&
+			    (addr < (base + (1UL << order))) &&
+			    (base <= (addr + size - 1UL)) &&
+			    ((addr + size - 1UL) < (base + (1UL << order))))
+				break;
+		} else {
+			base = 0;
+			break;
+		}
+	}
+
+	reg->base = base;
+	reg->size = (order == __riscv_xlen) ? -1UL : BIT(order);
+}
+
 static int memregion_sanitize(struct sbi_domain *dom,
 			      struct sbi_memregion *reg,
 			      enum sbi_isolation_method type)
-- 
2.45.2


