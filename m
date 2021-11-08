From: Xiang W <wxjstz@126.com>
Date: Mon,  8 Nov 2021 18:02:42 +0800
Subject: [PATCH] lib: sbi: Fix pmp_set/pmp_get to use sbi_hart_pmp_count to
 get the number of pmp
Message-ID: <20211108100242.79845-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index f6b8c8e..2d64592 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,8 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_hart.h>
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -234,9 +236,11 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
 	unsigned long addrmask, pmpaddr;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (n >= pmp_count || log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
 	/* calculate PMP register and offset */
@@ -286,9 +290,11 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg, prot;
 	unsigned long t1, addr, len;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned int pmp_count = sbi_hart_pmp_count(scratch);
 
 	/* check parameters */
-	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
+	if (n >= pmp_count || !prot_out || !addr_out || !log2len)
 		return SBI_EINVAL;
 	*prot_out = *addr_out = *log2len = 0;
 
-- 
2.30.2


