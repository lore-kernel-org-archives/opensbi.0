From: Xiang W <wxjstz@126.com>
Date: Wed, 16 Mar 2022 00:22:38 +0800
Subject: [PATCH 1/3] lib: pmp_set/pmp_get moved errors from runtime to compile
 time
Message-ID: <20220315162240.40990-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pmp_set/pmp_get calculates the location of the CSR register separately
through conditional compilation. In the case of non-32-bit and 64-bit,
we can report an error directly through #error without putting it at
runtime

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 847bdba..5eab1ed 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -261,7 +261,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
 	pmpcfg_shift = (n & 7) << 3;
 #else
-	return SBI_ENOTSUPP;
+# error "Unexpected __riscv_xlen"
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
@@ -312,7 +312,7 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
 	pmpcfg_shift = (n & 7) << 3;
 #else
-	return SBI_ENOTSUPP;
+# error "Unexpected __riscv_xlen"
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-- 
2.30.2


