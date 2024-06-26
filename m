From: Xiang W <wxjstz@126.com>
Date: Thu, 27 Jun 2024 01:48:12 +0800
Subject: [PATCH 1/3] lib: sbi: Add tor type PMP support
In-Reply-To: <20240626174816.2837278-1-wxjstz@126.com>
References: <20240626174816.2837278-1-wxjstz@126.com>
Message-ID: <20240626174816.2837278-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

tor type PMP can save the number of PMP configuration registers in
certain scenarios. This patch add support

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/riscv_asm.h |   6 +-
 lib/sbi/riscv_asm.c     | 190 +++++++++++++++++++++++-----------------
 lib/sbi/sbi_hart.c      |  29 +++---
 3 files changed, 132 insertions(+), 93 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 2c34635..60036fa 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -187,11 +187,11 @@ int pmp_disable(unsigned int n);
 /* Check if the matching field is set */
 int is_pmp_entry_mapped(unsigned long entry);
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len);
+int pmp_set(unsigned int *n, unsigned long prot, unsigned long addr,
+	    unsigned long end);
 
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len);
+	    unsigned long *end_out);
 
 #endif /* !__ASSEMBLER__ */
 
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 05b8c7c..b763ec5 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -8,8 +8,10 @@
  */
 
 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_math.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
 
@@ -258,29 +260,52 @@ static unsigned long ctz(unsigned long x)
 	return ret;
 }
 
-int pmp_disable(unsigned int n)
+static void pmp_rw(unsigned int n,
+			unsigned long *cfg_in, unsigned long *addr_in,
+			unsigned long *cfg_out, unsigned long *addr_out)
 {
-	int pmpcfg_csr, pmpcfg_shift;
 	unsigned long cfgmask, pmpcfg;
+	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 
-	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
-
+	if (cfg_in || cfg_out) {
 #if __riscv_xlen == 32
-	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-	pmpcfg_shift = (n & 3) << 3;
+		pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
+		pmpcfg_shift = (n & 3) << 3;
 #elif __riscv_xlen == 64
-	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
-	pmpcfg_shift = (n & 7) << 3;
+		pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
+		pmpcfg_shift = (n & 7) << 3;
 #else
 # error "Unexpected __riscv_xlen"
 #endif
 
-	/* Clear the address matching bits to disable the pmp entry */
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
+		cfgmask = ~(0xffUL << pmpcfg_shift);
+		pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
+		if (cfg_out)
+			*cfg_out = pmpcfg >> pmpcfg_shift;
+		if (cfg_in) {
+			pmpcfg |= ((*cfg_in << pmpcfg_shift) & ~cfgmask);
+			csr_write_num(pmpcfg_csr, pmpcfg);
+		}
+	}
+
+	if (addr_in || addr_out) {
+		pmpaddr_csr = CSR_PMPADDR0 + n;
+		if (addr_out)
+			*addr_out = csr_read_num(pmpaddr_csr);
+		if (addr_in)
+			csr_write_num(pmpaddr_csr, *addr_in);
+	}
+}
+
+int pmp_disable(unsigned int n)
+{
+	unsigned long pmpcfg;
+
+	if (n >= PMP_COUNT)
+		return SBI_EINVAL;
 
-	csr_write_num(pmpcfg_csr, pmpcfg);
+	pmpcfg = 0;
+	pmp_rw(n, &pmpcfg, NULL, NULL, NULL);
 
 	return SBI_OK;
 }
@@ -289,99 +314,94 @@ int is_pmp_entry_mapped(unsigned long entry)
 {
 	unsigned long prot;
 	unsigned long addr;
-	unsigned long log2len;
+	unsigned long end;
 
-	pmp_get(entry, &prot, &addr, &log2len);
+	pmp_get(entry, &prot, &addr, &end);
 
 	/* If address matching bits are non-zero, the entry is enable */
 	if (prot & PMP_A)
 		return true;
 
+	pmp_get(entry + 1, &prot, &addr, &end);
+	if ((prot & PMP_A) == PMP_A_TOR)
+		return true;
+
 	return false;
 }
 
-int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
+int pmp_set(unsigned int *idx, unsigned long prot, unsigned long addr, unsigned long end)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg;
+	unsigned int n = *idx;
+	unsigned long log2len, size;
 	unsigned long addrmask, pmpaddr;
 
-	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (end <= addr)
 		return SBI_EINVAL;
 
-	/* calculate PMP register and offset */
-#if __riscv_xlen == 32
-	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-	pmpcfg_shift = (n & 3) << 3;
-#elif __riscv_xlen == 64
-	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
-	pmpcfg_shift = (n & 7) << 3;
-#else
-# error "Unexpected __riscv_xlen"
-#endif
-	pmpaddr_csr = CSR_PMPADDR0 + n;
-
-	/* encode PMP config */
-	prot &= ~PMP_A;
-	prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
-	cfgmask = ~(0xffUL << pmpcfg_shift);
-	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
-	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);
-
-	/* encode PMP address */
-	if (log2len == PMP_SHIFT) {
-		pmpaddr = (addr >> PMP_SHIFT);
-	} else {
-		if (log2len == __riscv_xlen) {
-			pmpaddr = -1UL;
+	size = end - addr + 1;
+	if ((end - addr == -1UL) || (sbi_popcount(size) == 1)) {
+		log2len = log2roundup(size);
+		if (end - addr == -1UL)
+			log2len = __riscv_xlen;
+		if (n >= PMP_COUNT || log2len < PMP_SHIFT)
+			return SBI_EINVAL;
+
+		/* encode PMP config */
+		prot &= ~PMP_A;
+		prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
+
+		/* encode PMP address */
+		if (log2len == PMP_SHIFT) {
+			pmpaddr = (addr >> PMP_SHIFT);
 		} else {
-			addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
-			pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
-			pmpaddr |= (addrmask >> 1);
+			if (log2len == __riscv_xlen) {
+				pmpaddr = -1UL;
+			} else {
+				addrmask = (1UL << (log2len - PMP_SHIFT)) - 1;
+				pmpaddr	 = ((addr >> PMP_SHIFT) & ~addrmask);
+				pmpaddr |= (addrmask >> 1);
+			}
 		}
+		pmp_rw(n, &prot, &pmpaddr, NULL, NULL);
+		n++;
+		*idx = n;
+		return 0;
 	}
 
-	/* write csrs */
-	csr_write_num(pmpaddr_csr, pmpaddr);
-	csr_write_num(pmpcfg_csr, pmpcfg);
+	if (n + 1 >= PMP_COUNT)
+		return SBI_EINVAL;
+
+	addr = addr >> PMP_SHIFT;
+	end = (end + 1) >> PMP_SHIFT;
+
+	prot &= ~PMP_A;
+	pmp_rw(n, &prot, &addr, NULL, NULL);
+	n++;
 
+	prot |= PMP_A_TOR;
+	pmp_rw(n, &prot, &end, NULL, NULL);
+	n++;
+
+	*idx = n;
 	return 0;
 }
 
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *log2len)
+	    unsigned long *end_out)
 {
-	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
-	unsigned long cfgmask, pmpcfg, prot;
-	unsigned long t1, addr, len;
+	unsigned long prot, prot_a;
+	unsigned long t1, addr, len, end;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
+	if (n >= PMP_COUNT || !prot_out || !addr_out || !end_out)
 		return SBI_EINVAL;
-	*prot_out = *addr_out = *log2len = 0;
-
-	/* calculate PMP register and offset */
-#if __riscv_xlen == 32
-	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-	pmpcfg_shift = (n & 3) << 3;
-#elif __riscv_xlen == 64
-	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
-	pmpcfg_shift = (n & 7) << 3;
-#else
-# error "Unexpected __riscv_xlen"
-#endif
-	pmpaddr_csr = CSR_PMPADDR0 + n;
 
-	/* decode PMP config */
-	cfgmask = (0xffUL << pmpcfg_shift);
-	pmpcfg	= csr_read_num(pmpcfg_csr) & cfgmask;
-	prot	= pmpcfg >> pmpcfg_shift;
+	end = 0;
+	pmp_rw(n, NULL, NULL, &prot, &addr);
 
 	/* decode PMP address */
-	if ((prot & PMP_A) == PMP_A_NAPOT) {
-		addr = csr_read_num(pmpaddr_csr);
+	prot_a = prot & PMP_A;
+	if (prot_a == PMP_A_NAPOT) {
 		if (addr == -1UL) {
 			addr	= 0;
 			len	= __riscv_xlen;
@@ -390,15 +410,27 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
 			len	= (t1 + PMP_SHIFT + 1);
 		}
-	} else {
-		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
+		end	= addr + (1UL << len) - 1;
+	}
+	if (prot_a == PMP_A_NA4) {
+		addr	= addr << PMP_SHIFT;
 		len	= PMP_SHIFT;
+		end	= addr + (1UL << len) - 1;
+	}
+	if(prot_a == PMP_A_TOR) {
+		end = addr;
+		if (n > 0)
+			pmp_rw(n - 1, NULL, NULL, NULL, &addr);
+		else
+			addr = 0;
+		addr = addr << PMP_SHIFT;
+		end = (end << PMP_SHIFT) - 1;
 	}
 
 	/* return details */
 	*prot_out    = prot;
 	*addr_out    = addr;
-	*log2len     = len;
+	*end_out     = end;
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c366701..acf0926 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -349,16 +349,18 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
 				struct sbi_domain_memregion *reg,
-				unsigned int pmp_idx,
+				unsigned int *pmp_idx,
 				unsigned int pmp_flags,
 				unsigned int pmp_log2gran,
 				unsigned long pmp_addr_max)
 {
 	unsigned long pmp_addr = reg->base >> PMP_SHIFT;
-
-	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-		pmp_set(pmp_idx, pmp_flags, reg->base, reg->order);
-	} else {
+	unsigned long start = reg->base;
+	unsigned long end = reg->order < __riscv_xlen ?
+				start + BIT(reg->order) - 1: -1UL;
+	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max)
+		pmp_set(pmp_idx, pmp_flags, start, end);
+	else {
 		sbi_printf("Can not configure pmp for domain %s because"
 			   " memory region address 0x%lx or size 0x%lx "
 			   "is not in range.\n", dom->name, reg->base,
@@ -403,7 +405,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		if (!pmp_flags)
 			return 0;
 
-		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+		sbi_hart_smepmp_set(scratch, dom, reg, &pmp_idx, pmp_flags,
 				    pmp_log2gran, pmp_addr_max);
 	}
 
@@ -429,7 +431,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		if (!pmp_flags)
 			return 0;
 
-		sbi_hart_smepmp_set(scratch, dom, reg, pmp_idx++, pmp_flags,
+		sbi_hart_smepmp_set(scratch, dom, reg, &pmp_idx, pmp_flags,
 				    pmp_log2gran, pmp_addr_max);
 	}
 
@@ -450,7 +452,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
 	unsigned int pmp_flags;
-	unsigned long pmp_addr;
+	unsigned long pmp_addr, start, end;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (pmp_count <= pmp_idx)
@@ -473,8 +475,11 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_X;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
+		start = reg->base;
+		end = reg->order < __riscv_xlen ?
+			start + BIT(reg->order) - 1 : -1UL;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-			pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
+			pmp_set(&pmp_idx, pmp_flags, start, end);
 		} else {
 			sbi_printf("Can not configure pmp for domain %s because"
 				   " memory region address 0x%lx or size 0x%lx "
@@ -489,8 +494,9 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 {
 	/* shared R/W access for M and S/U mode */
+	unsigned int n = SBI_SMEPMP_RESV_ENTRY;
 	unsigned int pmp_flags = (PMP_W | PMP_X);
-	unsigned long order, base = 0;
+	unsigned long order, base = 0, end;
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
 	/* If Smepmp is not supported no special mapping is required */
@@ -514,7 +520,8 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
 		}
 	}
 
-	pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
+	end = base + (1UL << order) - 1;
+	pmp_set(&n, pmp_flags, base, end);
 
 	return SBI_OK;
 }
-- 
2.43.0


