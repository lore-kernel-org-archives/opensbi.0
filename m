From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Apr 2022 21:21:42 +0530
Subject: [PATCH 02/11] lib: sbi: Remove 's' and 'u' from misa_string() output
In-Reply-To: <20220429155151.314788-1-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
Message-ID: <20220429155151.314788-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Both 's' and 'u' are not treated as ISA extensions since these are
privilege modes so let's remove it from misa_string() output.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/riscv_asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 5eab1ed..0ebf41d 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -53,7 +53,7 @@ int misa_xlen(void)
 void misa_string(int xlen, char *out, unsigned int out_sz)
 {
 	unsigned int i, pos = 0;
-	const char valid_isa_order[] = "iemafdqclbjtpvnsuhkorwxyzg";
+	const char valid_isa_order[] = "iemafdqclbjtpvnhkorwxyzg";
 
 	if (!out)
 		return;
-- 
2.34.1


