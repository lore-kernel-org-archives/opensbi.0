From: Atish Patra <atish.patra@wdc.com>
Date: Thu, 15 Oct 2020 17:24:47 -0700
Subject: [PATCH 2/2] lib: sbi: Check pmp range granularity before setting pmp
In-Reply-To: <20201016002447.4148184-1-atish.patra@wdc.com>
References: <20201016002447.4148184-1-atish.patra@wdc.com>
Message-ID: <20201016002447.4148184-2-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As per RISC-V privilege specificaiton, a platform may choose to implement
a coarser granularity scheme for PMP addresses. In that case, we shouldn't
allow any pmp region size smaller than the platform supports. The pmp
range granularity is dynamically detected while detecting pmp support.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/riscv_asm.h |  2 +-
 lib/sbi/riscv_asm.c     |  5 +++--
 lib/sbi/sbi_hart.c      | 30 ++++++++++++++++++++++++------
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 10f31a7fc3bb..00d9b8c9c954 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -177,7 +177,7 @@ int misa_xlen(void);
 void misa_string(int xlen, char *out, unsigned int out_sz);
 
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len);
+	    unsigned long log2len, unsigned long pmp_gran_log2);
 
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 8c54c11147e7..698741def16c 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -187,14 +187,15 @@ static unsigned long ctz(unsigned long x)
 }
 
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
-	    unsigned long log2len)
+	    unsigned long log2len, unsigned long pmp_gran_log2)
 {
 	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 	unsigned long cfgmask, pmpcfg;
 	unsigned long addrmask, pmpaddr;
 
 	/* check parameters */
-	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
+	if (n >= PMP_COUNT || log2len > __riscv_xlen ||
+	    log2len < PMP_SHIFT || log2len < pmp_gran_log2)
 		return SBI_EINVAL;
 
 	/* calculate PMP register and offset */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bf47f95a8758..8856aa7a661c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -28,6 +28,7 @@ void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 struct hart_features {
 	unsigned long features;
 	unsigned int pmp_count;
+	unsigned long pmp_gran;
 	unsigned int mhpm_count;
 };
 static unsigned long hart_features_offset;
@@ -144,6 +145,14 @@ unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
 	return hfeatures->mhpm_count;
 }
 
+static unsigned long sbi_hart_pmp_get_gran(struct sbi_scratch *scratch)
+{
+	struct hart_features *hfeatures =
+			sbi_scratch_offset_ptr(scratch, hart_features_offset);
+
+	return hfeatures->pmp_gran;
+}
+
 unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
 {
 	struct hart_features *hfeatures =
@@ -226,7 +235,7 @@ int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
 static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 {
 	u32 i, pmp_idx = 0, pmp_count, count;
-	unsigned long fw_start, fw_size_log2;
+	unsigned long fw_start, fw_size_log2, pmpg_log2;
 	ulong prot, addr, log2size;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
@@ -236,7 +245,8 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 	/* Firmware PMP region to protect OpenSBI firmware */
 	fw_size_log2 = log2roundup(scratch->fw_size);
 	fw_start = scratch->fw_start & ~((1UL << fw_size_log2) - 1UL);
-	pmp_set(pmp_idx++, 0, fw_start, fw_size_log2);
+	pmpg_log2 = log2roundup(sbi_hart_pmp_get_gran(scratch));
+	pmp_set(pmp_idx++, 0, fw_start, fw_size_log2, pmpg_log2);
 
 	/* Platform specific PMP regions */
 	count = sbi_platform_pmp_region_count(plat, hartid);
@@ -245,7 +255,7 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 		if (sbi_platform_pmp_region_info(plat, hartid, i, &prot, &addr,
 						 &log2size))
 			continue;
-		pmp_set(pmp_idx++, prot, addr, log2size);
+		pmp_set(pmp_idx++, prot, addr, log2size, pmpg_log2);
 	}
 
 	/*
@@ -254,7 +264,7 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 	 * 1) Firmware PMP region
 	 * 2) Platform specific PMP regions
 	 */
-	pmp_set(pmp_idx++, PMP_R | PMP_W | PMP_X, 0, __riscv_xlen);
+	pmp_set(pmp_idx++, PMP_R | PMP_W | PMP_X, 0, __riscv_xlen, pmpg_log2);
 
 	return 0;
 }
@@ -362,6 +372,7 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
 	hfeatures->features = 0;
 	hfeatures->pmp_count = 0;
+	hfeatures->pmp_gran  = 0;
 	hfeatures->mhpm_count = 0;
 
 #define __check_csr(__csr, __rdonly, __wrval, __field, __skip)	\
@@ -372,7 +383,14 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 		} else {						\
 			csr_write_allowed(__csr, (ulong)&trap, __wrval);\
 			if (!trap.cause) {				\
-				if (csr_swap(__csr, val) == __wrval)	\
+				if (__csr >= CSR_PMPADDR0 && __csr <= CSR_PMPADDR63) \
+				{					\
+					val = csr_read(__csr);		\
+					if (val) {			\
+						(hfeatures->pmp_gran) =  1 << (ffs(val) + 1); 	\
+						(hfeatures->__field)++;		\
+					}	\
+				} else if (csr_swap(__csr, val) == __wrval)	\
 					(hfeatures->__field)++;		\
 				else					\
 					goto __skip;			\
@@ -403,7 +421,7 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 	__check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
 
 	/* Detect number of PMP regions */
-	__check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
+	__check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK, pmp_count, __pmp_skip);
 __pmp_skip:
 
 	/* Detect number of MHPM counters */
-- 
2.25.1


