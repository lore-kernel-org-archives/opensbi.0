From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 17 Dec 2021 18:02:58 +0100
Subject: [PATCH v2 1/1] lib: sbi: simplify pmp_set(), pmp_get()
Message-ID: <20211217170258.7321-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pmpcfg_csr and pmpcfg_shift are only negative for an unexpected value of
__riscv_xlen. We can immediately return in this case.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
v2:
	adjust pmp_get too
---
 lib/sbi/riscv_asm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 2e2e148..847bdba 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -261,12 +261,9 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
 	pmpcfg_shift = (n & 7) << 3;
 #else
-	pmpcfg_csr   = -1;
-	pmpcfg_shift = -1;
+	return SBI_ENOTSUPP;
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
-	if (pmpcfg_csr < 0 || pmpcfg_shift < 0)
-		return SBI_ENOTSUPP;
 
 	/* encode PMP config */
 	prot &= ~PMP_A;
@@ -315,12 +312,9 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
 	pmpcfg_shift = (n & 7) << 3;
 #else
-	pmpcfg_csr   = -1;
-	pmpcfg_shift = -1;
+	return SBI_ENOTSUPP;
 #endif
 	pmpaddr_csr = CSR_PMPADDR0 + n;
-	if (pmpcfg_csr < 0 || pmpcfg_shift < 0)
-		return SBI_ENOTSUPP;
 
 	/* decode PMP config */
 	cfgmask = (0xffUL << pmpcfg_shift);
-- 
2.33.1


