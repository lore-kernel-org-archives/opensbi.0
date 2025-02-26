From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 25 Feb 2025 16:53:35 -0800
Subject: [PATCH v2 11/11] Initialize MIPS custom PMA registers
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
Message-ID: <20250226005335.19498-11-cfu@mips.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Before PMP set up, we need to set up MIPS custom PMA registers.
---
 lib/sbi/riscv_asm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac..ca7edbe 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -12,6 +12,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_console.h>
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+#include <mips/p8700.h>
+#endif
 
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
@@ -119,6 +122,9 @@ unsigned long csr_read_num(int csr_num)
 	unsigned long ret = 0;
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
+#endif
 	switchcase_csr_read_16(CSR_PMPCFG0, ret)
 	switchcase_csr_read_64(CSR_PMPADDR0, ret)
 	switchcase_csr_read(CSR_MCYCLE, ret)
@@ -199,6 +205,9 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_32(__csr_num + 32, __val)
 
 	switch (csr_num) {
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
+#endif
 	switchcase_csr_write_16(CSR_PMPCFG0, val)
 	switchcase_csr_write_64(CSR_PMPADDR0, val)
 	switchcase_csr_write(CSR_MCYCLE, val)
@@ -301,6 +310,29 @@ int is_pmp_entry_mapped(unsigned long entry)
 	return false;
 }
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+extern unsigned long _fw_start;
+static void pma_set(unsigned int n, unsigned long addr)
+{
+	int pmacfg_csr, pmacfg_shift;
+	unsigned long cfgmask;
+	unsigned long pmacfg, cca;
+
+	pmacfg_csr = (CSR_MIPSPMACFG0 + (n >> 2)) & ~1;
+	pmacfg_shift = (n & 7) << 3;
+	cfgmask = ~(0xffUL << pmacfg_shift);
+
+	/* Read pmacfg to change cacheability */
+        pmacfg  = (csr_read_num(pmacfg_csr) & cfgmask);
+        if (addr >= (unsigned long)&_fw_start)
+                cca = CCA_CACHE_ENABLE | PMA_SPECULATION;
+        else
+                cca = CCA_CACHE_DISABLE;
+        pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
+        csr_write_num(pmacfg_csr, pmacfg);
+}
+#endif
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len)
 {
@@ -312,6 +344,10 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	if (n >= PMP_COUNT || log2len > __riscv_xlen || log2len < PMP_SHIFT)
 		return SBI_EINVAL;
 
+#ifdef CONFIG_PLATFORM_MIPS_P8700
+	pma_set(n, addr);
+#endif
+
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
 	pmpcfg_csr   = CSR_PMPCFG0 + (n >> 2);
-- 
2.47.1


