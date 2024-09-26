From: Pope B.Lei <popeblei@gmail.com>
Date: Thu, 26 Sep 2024 21:16:59 +0800
Subject: [PATCH] Support TOR mode in pmp_set
Message-ID: <20240926131659.1477-1-popeblei@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Pope B.Lei <popeblei@gmail.com>
---
 include/sbi/riscv_encoding.h |  2 ++
 lib/sbi/riscv_asm.c          | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 980abdb..387c011 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -154,6 +154,8 @@
 #define PMP_A_NAPOT			_UL(0x18)
 #define PMP_L				_UL(0x80)
 
+#define PMP_USE_TOR			_UL(0x00)
+
 #define PMP_SHIFT			2
 #define PMP_COUNT			64
 #if __riscv_xlen == 64
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..4518b2c 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -309,7 +309,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	unsigned long addrmask, pmpaddr;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (n >= PMP_COUNT || log2len > __riscv_xlen || (log2len < PMP_SHIFT && log2len != PMP_USE_TOR ))
 		return SBI_EINVAL;
 
 	/* calculate PMP register and offset */
@@ -326,13 +326,26 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 
 	/* encode PMP config */
 	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+
+	switch(log2len){
+		case PMP_USE_TOR:{
+			prot |= PMP_A_TOR;
+			break;
+		}
+		case PMP_SHIFT:{
+			prot |= PMP_A_NA4;
+			break;
+		}
+		default:
+			prot |= PMP_A_NAPOT;
+	}
+
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
 	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
 
 	/* encode PMP address */
-	if (log2len == PMP_SHIFT) {
+	if (log2len == PMP_SHIFT || log2len == PMP_USE_TOR) {
 		pmpaddr = (addr >> PMP_SHIFT);
 	} else {
 		if (log2len == __riscv_xlen) {
-- 
2.35.2.windows.1


