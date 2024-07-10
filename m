From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 10 Jul 2024 07:26:06 -0700
Subject: [PATCH] lib: sbi_hsm: Save/restore menvcfg only when it exists
Message-ID: <20240710142629.2327391-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Attempting to access the menvcfg CSR raises an illegal instruction
exception on hardware which implements Sm1p11 or older.

Fixes: e9ee9678ba50 ("lib: sbi: fwft: add support for SBI_FWFT_PTE_AD_HW_UPDATING")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_hsm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 7e32af37..3706acfb 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -423,10 +423,12 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mie = csr_read(CSR_MIE);
 	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
 	hdata->saved_medeleg = csr_read(CSR_MEDELEG);
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 #if __riscv_xlen == 32
-	hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
+		hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
 #endif
-	hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
+		hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
+	}
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -434,10 +436,12 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
-	csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
+		csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
 #if __riscv_xlen == 32
-	csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
+		csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
 #endif
+	}
 	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
-- 
2.45.1


