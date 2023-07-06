From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu,  6 Jul 2023 16:19:22 +0530
Subject: [PATCH v2 2/8] lib: sbi: Add functions to manipulate PMP entries
In-Reply-To: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
 <20230706104928.3391947-1-hchauhan@ventanamicro.com>
Message-ID: <20230706104928.3391947-3-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a function to disable a given PMP entry.
- Add a function to check if a given entry is disabled.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_asm.h |  6 ++++++
 lib/sbi/riscv_asm.c     | 42 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index 1ff36de..2c34635 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -181,6 +181,12 @@ int misa_xlen(void);
 /* Get RISC-V ISA string representation */
 void misa_string(int xlen, char *out, unsigned int out_sz);
 
+/* Disable pmp entry at a given index */
+int pmp_disable(unsigned int n);
+
+/* Check if the matching field is set */
+int is_pmp_entry_mapped(unsigned long entry);
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index cd56553..881dea3 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -246,6 +246,48 @@ static unsigned long ctz(unsigned long x)
 	return ret;
 }
 
+int pmp_disable(unsigned int n)
+{
+	int pmpcfg_csr, pmpcfg_shift;
+	unsigned long cfgmask, pmpcfg;
+
+	if (n >= PMP_COUNT)
+		return SBI_EINVAL;
+
+#if __riscv_xlen == 32
+	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
+	pmpcfg_shift = (n & 3) << 3;
+#elif __riscv_xlen == 64
+	pmpcfg_csr   = (CSR_PMPCFG0 + (n >> 2)) & ~1;
+	pmpcfg_shift = (n & 7) << 3;
+#else
+# error "Unexpected __riscv_xlen"
+#endif
+
+	/* Clear the address matching bits to disable the pmp entry */
+	cfgmask = ~(0xffUL << pmpcfg_shift);
+	pmpcfg	= (csr_read_num(pmpcfg_csr) & cfgmask);
+
+	csr_write_num(pmpcfg_csr, pmpcfg);
+
+	return SBI_OK;
+}
+
+int is_pmp_entry_mapped(unsigned long entry)
+{
+	unsigned long prot;
+	unsigned long addr;
+	unsigned long log2len;
+
+	pmp_get(entry, &prot, &addr, &log2len);
+
+	/* If address matching bits are non-zero, the entry is enable */
+	if (prot & PMP_A)
+		return true;
+
+	return false;
+}
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
-- 
2.34.1


