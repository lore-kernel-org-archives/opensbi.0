From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  9 Sep 2020 20:20:25 +0530
Subject: [PATCH 2/5] lib: sbi: Allow specifying mode in
 sbi_hart_pmp_check_addr() API
In-Reply-To: <20200909145028.446794-1-anup.patel@wdc.com>
References: <20200909145028.446794-1-anup.patel@wdc.com>
Message-ID: <20200909145028.446794-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend sbi_hart_pmp_check_addr() API so that users can specify
privilege mode of the address for checking PMP access permissions.

To achieve this, we end-up converting "unsigned long *size" parameter
to "unsigned long *log2len" for pmp_get() implementation so that we
can deal with regions of "1UL << __riscv_xlen" size in a special case
in sbi_hart_pmp_check_addr() implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/riscv_asm.h |  2 +-
 include/sbi/sbi_hart.h  |  3 ++-
 lib/sbi/riscv_asm.c     | 18 ++++++++----------
 lib/sbi/sbi_hart.c      | 28 +++++++++++++++++++++-------
 lib/sbi/sbi_hsm.c       |  2 +-
 5 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 6e093ca..10f31a7 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -180,7 +180,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *size);
+	    unsigned long *log2len);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 1e1eb67..0ba68f0 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -42,7 +42,8 @@ int sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n,
 		     unsigned long *prot_out, unsigned long *addr_out,
 		     unsigned long *size);
 void sbi_hart_pmp_dump(struct sbi_scratch *scratch);
-int  sbi_hart_pmp_check_addr(struct sbi_scratch *scratch, unsigned long daddr,
+int  sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
+			     unsigned long daddr, unsigned long mode,
 			     unsigned long attr);
 bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
 void sbi_hart_get_features_str(struct sbi_scratch *scratch,
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 799123f..8c54c11 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -239,16 +239,16 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 }
 
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
-	    unsigned long *size)
+	    unsigned long *log2len)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg, prot;
-	unsigned long t1, addr, log2len;
+	unsigned long t1, addr, len;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || !prot_out || !addr_out || !size)
+	if (n >= PMP_COUNT || !prot_out || !addr_out || !log2len)
 		return SBI_EINVAL;
-	*prot_out = *addr_out = *size = 0;
+	*prot_out = *addr_out = *log2len = 0;
 
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
@@ -275,23 +275,21 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 		addr = csr_read_num(pmpaddr_csr);
 		if (addr == -1UL) {
 			addr	= 0;
-			log2len = __riscv_xlen;
+			len	= __riscv_xlen;
 		} else {
 			t1	= ctz(~addr);
 			addr	= (addr & ~((1UL << t1) - 1)) << PMP_SHIFT;
-			log2len = (t1 + PMP_SHIFT + 1);
+			len	= (t1 + PMP_SHIFT + 1);
 		}
 	} else {
 		addr	= csr_read_num(pmpaddr_csr) << PMP_SHIFT;
-		log2len = PMP_SHIFT;
+		len	= PMP_SHIFT;
 	}
 
 	/* return details */
 	*prot_out    = prot;
 	*addr_out    = addr;
-
-	if (log2len < __riscv_xlen)
-		*size = (1UL << log2len);
+	*log2len     = len;
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index d788918..4cbe8ce 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -156,22 +156,31 @@ int sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n,
 		     unsigned long *prot_out, unsigned long *addr_out,
 		     unsigned long *size)
 {
+	int err;
+	unsigned long log2size;
+
 	if (sbi_hart_pmp_count(scratch) <= n)
 		return SBI_EINVAL;
 
-	return pmp_get(n, prot_out, addr_out, size);
+	err = pmp_get(n, prot_out, addr_out, &log2size);
+	if (err)
+		return err;
+	*size = (log2size < __riscv_xlen) ? 1UL << log2size : 0;
+
+	return 0;
 }
 
 void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
 {
-	unsigned long prot, addr, size;
+	unsigned long prot, addr, size, log2size;
 	unsigned int i, pmp_count;
 
 	pmp_count = sbi_hart_pmp_count(scratch);
 	for (i = 0; i < pmp_count; i++) {
-		pmp_get(i, &prot, &addr, &size);
+		pmp_get(i, &prot, &addr, &log2size);
 		if (!(prot & PMP_A))
 			continue;
+		size = (log2size < __riscv_xlen) ? 1UL << log2size : 0;
 #if __riscv_xlen == 32
 		sbi_printf("PMP%d    : 0x%08lx-0x%08lx (A",
 #else
@@ -190,18 +199,23 @@ void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
 	}
 }
 
-int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch, unsigned long addr,
+int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
+			    unsigned long addr, unsigned long mode,
 			    unsigned long attr)
 {
-	unsigned long prot, size, tempaddr;
+	unsigned long prot, size, log2size, tempaddr;
 	unsigned int i, pmp_count;
 
 	pmp_count = sbi_hart_pmp_count(scratch);
 	for (i = 0; i < pmp_count; i++) {
-		pmp_get(i, &prot, &tempaddr, &size);
+		pmp_get(i, &prot, &tempaddr, &log2size);
 		if (!(prot & PMP_A))
 			continue;
-		if (tempaddr <= addr && addr <= tempaddr + size)
+		if (mode == PRV_M && !(prot & PMP_L))
+			continue;
+		size = 1UL << log2size;
+		if ((log2size >= __riscv_xlen) ||
+		    ((tempaddr <= addr && addr <= tempaddr + size)))
 			if (!(prot & attr))
 				return SBI_EINVALID_ADDR;
 	}
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index b430793..8c1b7b0 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -231,7 +231,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch, u32 hartid,
 	if (hstate != SBI_HART_STOPPED)
 		return SBI_EINVAL;
 
-	rc = sbi_hart_pmp_check_addr(scratch, saddr, PMP_X);
+	rc = sbi_hart_pmp_check_addr(scratch, saddr, smode, PMP_X);
 	if (rc)
 		return rc;
 	//TODO: We also need to check saddr for valid physical address as well.
-- 
2.25.1


