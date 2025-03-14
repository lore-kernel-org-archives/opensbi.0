From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 14 Mar 2025 11:33:02 +0100
Subject: [PATCH] lib: sbi: Disable hw a/d updating by default
Message-ID: <20250314103301.10902-2-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI FWFT specifies zero for PTE_AD_HW_UPDATING's reset value, so
ensure ENVCFG_ADUE is cleared on init. S-mode will use SBI FWFT
to set it when desired.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

This issue was found with kvm-unit-tests SBI FWFT tests.

 lib/sbi/sbi_hart.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 8e2979b54586..5c649b781724 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -117,6 +117,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
 #endif
 
+		/* Disable HW A/D updating by default */
+		menvcfg_val &= ~ENVCFG_ADUE;
+
 		/* Disable double trap by default */
 		menvcfg_val &= ~ENVCFG_DTE;
 
@@ -138,19 +141,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
 #endif
 		__set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE)
 		__set_menvcfg_ext(SBI_HART_EXT_SMCDELEG, ENVCFG_CDE);
-		__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
 
 #undef __set_menvcfg_ext
 
-		/*
-		 * When both Svade and Svadu are present in DT, the default scheme for managing
-		 * the PTE A/D bits should use Svade. Check Svadu before Svade extension to ensure
-		 * that the ADUE bit is cleared when the Svade support are specified.
-		 */
-
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
-			menvcfg_val &= ~ENVCFG_ADUE;
-
 		csr_write(CSR_MENVCFG, menvcfg_val);
 #if __riscv_xlen == 32
 		csr_write(CSR_MENVCFGH, menvcfg_val >> 32);
-- 
2.48.1


