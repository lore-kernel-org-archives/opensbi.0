From: Xiang W <wxjstz@126.com>
Date: Fri,  8 Nov 2024 21:15:15 +0800
Subject: [RFC v2 PATCH 1/2] lib: sbi: Improve pmp_get/pmp_set
In-Reply-To: <20241108131523.676899-1-wxjstz@126.com>
References: <20241108131523.676899-1-wxjstz@126.com>
Message-ID: <20241108131523.676899-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous code used byte addresses, which limited the address
range to 0-2^XLEN. Changing to word addresses allows access to
all address ranges.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/riscv_asm.c | 42 +++++++++++++++++++-----------------------
 lib/sbi/sbi_hart.c  |  9 ++++++---
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..6c9780a 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -309,7 +309,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	unsigned long addrmask, pmpaddr;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (n >= PMP_COUNT || log2len > __riscv_xlen + 1)
 		return SBI_EINVAL;
 
 	/* calculate PMP register and offset */
@@ -326,22 +326,22 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 
 	/* encode PMP config */
 	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+	prot |= (log2len == 0) ? PMP_A_NA4 : PMP_A_NAPOT;
 	cfgmask = ~(0xffUL << pmpcfg_shift);
 	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
 	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
 
 	/* encode PMP address */
-	if (log2len == PMP_SHIFT) {
-		pmpaddr = (addr >> PMP_SHIFT);
+	if (log2len == 0) {
+		pmpaddr = addr;
+	} else if (log2len == __riscv_xlen) {
+		pmpaddr = -1UL >> 1;
+	} else if (log2len == __riscv_xlen + 1) {
+		pmpaddr = -1UL;
 	} else {
-		if (log2len == __riscv_xlen) {
-			pmpaddr = -1UL;
-		} else {
-			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmpaddr |= (addrmask >> 1);
-		}
+		addrmask = (1UL << log2len) - 1;
+		pmpaddr	 = addr & ~addrmask;
+		pmpaddr |= addrmask >> 1;
 	}
 
 	/* write csrs */
@@ -381,19 +381,15 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	prot	= pmpcfg >> pmpcfg_shift;
 
 	/* decode PMP address */
+	addr = csr_read_num(pmpaddr_csr);
+	len  = 0;
 	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = csr_read_num(pmpaddr_csr);
-		if (addr == -1UL) {
-			addr	= 0;
-			len	= __riscv_xlen;
-		} else {
-			t1	= ctz(~addr);
-			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
-			len	= (t1 + PMP_SHIFT + 1);
-		}
-	} else {
-		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
-		len	= PMP_SHIFT;
+		t1 = ctz(~addr);
+		len = t1 + 1;
+		if (len >= __riscv_xlen)
+			addr = 0;
+		else
+			addr	= addr & ~((1UL << t1) - 1);
 	}
 
 	/* return details */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0451fcb..832db7a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -361,7 +361,8 @@ static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
 
 	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
+		pmp_set(pmp_idx, pmp_flags, reg->base >> PMP_SHIFT,
+			    reg->order - PMP_SHIFT);
 	} else {
 		sbi_printf("Can not configure pmp for domain %s because"
 			   " memory region address 0x%lx or size 0x%lx "
@@ -478,7 +479,8 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 
 		pmp_addr = reg->base >> PMP_SHIFT;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+			pmp_set(pmp_idx++, pmp_flags, reg->base >> PMP_SHIFT,
+				    reg->order - PMP_SHIFT);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
 				   " memory region address 0x%lx or size 0x%lx "
@@ -518,7 +520,8 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 		}
 	}
 
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base >> PMP_SHIFT,
+		    order - PMP_SHIFT);
 
 	return SBI_OK;
 }
-- 
2.45.2


