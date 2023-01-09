From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon,  9 Jan 2023 05:20:39 +0000
Subject: [PATCH v2 5/9] lib: sbi: Modify the boot time region flag prints
In-Reply-To: <20230109052043.55473-1-hchauhan@ventanamicro.com>
References: <20230109052043.55473-1-hchauhan@ventanamicro.com>
Message-ID: <20230109052043.55473-6-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the finer permission semantics, the region access
permissions must be displayed separately for M and SU mode.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_domain.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index b36a9d5..f6addc4 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -344,15 +344,25 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 			   dom->index, i, suffix, rstart, rend);
 
 		k = 0;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
-			sbi_printf("%cM", (k++) ? ',' : '(');
+
+		sbi_printf("M: ");
 		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
 			sbi_printf("%cI", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
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
 			sbi_printf("%cR", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
 			sbi_printf("%cW", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
+		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			sbi_printf("%cX", (k++) ? ',' : '(');
 		sbi_printf("%s\n", (k++) ? ")" : "()");
 
-- 
2.34.1


