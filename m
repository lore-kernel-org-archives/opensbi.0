From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:25 -0700
Subject: [PATCH 4/8] lib: sbi: memregion: Introduce memregion_start/end macros
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-5-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Various disparate parts of the memregion handling code calculate the base and
bounds of memregions. Standardize these calculations into two new macros:
memregion_start() and memregion_end(). This will reduce the amount of code
changes later, when we make memregions keep track of raw sizes rather than
rounded orders.
---
 include/sbi/sbi_memregion.h |  6 ++++++
 lib/sbi/sbi_memregion.c     | 23 ++++++++++-------------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
index 0aa9a44..6e1b771 100644
--- a/include/sbi/sbi_memregion.h
+++ b/include/sbi/sbi_memregion.h
@@ -145,6 +145,12 @@ struct sbi_memregion {
 	unsigned long flags;
 };
 
+#define memregion_start(reg) \
+	((reg)->base)
+
+#define memregion_end(reg) \
+	((reg)->order < __riscv_xlen) ? \
+	      (reg)->base + ((1UL << (reg)->order) - 1) : -1UL;
 /**
  * Initialize a domain memory region based on it's physical
  * address and size.
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 4abd20a..8978793 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -37,10 +37,10 @@ void sbi_memregion_init(unsigned long addr,
 static bool is_region_subset(const struct sbi_memregion *regA,
 			     const struct sbi_memregion *regB)
 {
-	ulong regA_start = regA->base;
-	ulong regA_end = regA->base + (BIT(regA->order) - 1);
-	ulong regB_start = regB->base;
-	ulong regB_end = regB->base + (BIT(regB->order) - 1);
+	ulong regA_start = memregion_start(regA);
+	ulong regA_end = memregion_end(regA);
+	ulong regB_start = memregion_start(regB);
+	ulong regB_end = memregion_end(regB);
 
 	if ((regB_start <= regA_start) &&
 	    (regA_start < regB_end) &&
@@ -217,9 +217,8 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 					(rflags & SBI_MEMREGION_SU_ACCESS_MASK)
 						>> SBI_MEMREGION_SU_ACCESS_SHIFT);
 
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-						     rstart + ((1UL << reg->order) - 1) : -1UL;
+		rstart = memregion_start(reg);
+		rend = memregion_end(reg);
 		if (rstart <= addr && addr <= rend) {
 			rmmio = (rflags & SBI_MEMREGION_MMIO) ? true : false;
 			if (mmio != rmmio)
@@ -239,9 +238,8 @@ static const struct sbi_memregion *find_region(
 	struct sbi_memregion *reg;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-						     rstart + ((1UL << reg->order) - 1) : -1UL;
+		rstart = memregion_start(reg);
+		rend = memregion_end(reg);
 		if (rstart <= addr && addr <= rend)
 			return reg;
 	}
@@ -307,9 +305,8 @@ void sbi_domain_dump_memregions(const struct sbi_domain *dom, const char *suffix
 	int i = 0, k;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-		        rstart + ((1UL << reg->order) - 1) : -1UL;
+		rstart = memregion_start(reg);
+		rend = memregion_end(reg);
 
 		sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
 			   dom->index, i, suffix, rstart, rend);
-- 
2.45.2


