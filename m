From: Xiang W <wxjstz@126.com>
Date: Mon,  8 Nov 2021 17:43:03 +0800
Subject: [PATCH] lib: sbi: fix pmp_set: clear A befor setting
Message-ID: <20211108094303.76907-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index f6b8c8e..845039c 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -255,6 +255,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 		return SBI_ENOTSUPP;
 
 	/* encode PMP config */
+	prot &= ~PMP_A;
 	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-- 
2.30.2


