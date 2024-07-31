From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:23 -0700
Subject: [PATCH 2/8] lib: sbi: Create sbi_domain_dump_memregions()
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-3-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the memregion-dumping code out of sbi_domain.c and into sbi_memregion.c
---
 include/sbi/sbi_memregion.h |  3 +++
 lib/sbi/sbi_domain.c        | 37 +--------------------------------
 lib/sbi/sbi_memregion.c     | 41 +++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 36 deletions(-)

diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
index 8a62fc0..828d556 100644
--- a/include/sbi/sbi_memregion.h
+++ b/include/sbi/sbi_memregion.h
@@ -196,4 +196,7 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 				 unsigned long mode,
 				 unsigned long access_flags);
 
+/** Dump domain memregion details on the console */
+void sbi_domain_dump_memregions(const struct sbi_domain *dom, const char *suffix);
+
 #endif // __SBI_MEMREGION_H__
\ No newline at end of file
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 00ba870..868704e 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -155,8 +155,6 @@ static int sanitize_domain(struct sbi_domain *dom)
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
 	u32 i, j, k;
-	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -173,40 +171,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	}
 	sbi_printf("\n");
 
-	i = 0;
-	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
-
-		sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
-			   dom->index, i, suffix, rstart, rend);
-
-		k = 0;
-
-		sbi_printf("M: ");
-		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
-			sbi_printf("%cI", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
-			sbi_printf("%cR", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
-			sbi_printf("%cW", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
-			sbi_printf("%cX", (k++) ? ',' : '(');
-		sbi_printf("%s ", (k++) ? ")" : "()");
-
-		k = 0;
-		sbi_printf("S/U: ");
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
-			sbi_printf("%cR", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-			sbi_printf("%cW", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-			sbi_printf("%cX", (k++) ? ',' : '(');
-		sbi_printf("%s\n", (k++) ? ")" : "()");
-
-		i++;
-	}
+	sbi_domain_dump_memregions(dom, suffix);
 
 	sbi_printf("Domain%d Next Address%s: 0x%" PRILX "\n",
 		   dom->index, suffix, dom->next_addr);
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 8cb1eed..1ef53dc 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -298,4 +298,45 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 	}
 
 	return true;
+}
+
+void sbi_domain_dump_memregions(const struct sbi_domain *dom, const char *suffix)
+{
+	unsigned long rstart, rend;
+	struct sbi_domain_memregion *reg;
+	int i = 0, k;
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		rstart = reg->base;
+		rend = (reg->order < __riscv_xlen) ?
+		        rstart + ((1UL << reg->order) - 1) : -1UL;
+
+		sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
+			   dom->index, i, suffix, rstart, rend);
+
+		k = 0;
+
+		sbi_printf("M: ");
+		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+			sbi_printf("%cI", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
+			sbi_printf("%cR", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
+			sbi_printf("%cW", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+			sbi_printf("%cX", (k++) ? ',' : '(');
+		sbi_printf("%s ", (k++) ? ")" : "()");
+
+		k = 0;
+		sbi_printf("S/U: ");
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+			sbi_printf("%cR", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+			sbi_printf("%cW", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+			sbi_printf("%cX", (k++) ? ',' : '(');
+		sbi_printf("%s\n", (k++) ? ")" : "()");
+
+		i++;
+	}
 }
\ No newline at end of file
-- 
2.45.2


