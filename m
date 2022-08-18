From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 18 Aug 2022 20:37:03 +0530
Subject: [PATCH] lib: sbi: Use the official extension name for AIA M-mode CSRs
Message-ID: <20220818150703.143168-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The arch review of AIA spec is completed and we now have official
extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
AIA CSRs).

Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)

Based on above, we update generic library to use "Smaia" extension
name for AIA M-mode CSRs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h | 4 ++--
 lib/sbi/sbi_hart.c     | 8 ++++----
 lib/sbi/sbi_trap.c     | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 4661506..0032364 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -30,8 +30,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCOFPMF = 0,
 	/** HART has HW time CSR (extension name not available) */
 	SBI_HART_EXT_TIME,
-	/** HART has AIA CSRs (extension name not available) */
-	SBI_HART_EXT_AIA,
+	/** HART has AIA M-mode CSRs */
+	SBI_HART_EXT_SMAIA,
 	/** HART has Smstateen CSR **/
 	SBI_HART_EXT_SMSTATEEN,
 	/** HART has Sstc extension */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 67b685a..1294868 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -100,7 +100,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		mstateen_val |= SMSTATEEN_STATEN;
 		mstateen_val |= SMSTATEEN0_HSENVCFG;
 
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_AIA))
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
 			mstateen_val |= (SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT |
 					SMSTATEEN0_IMSIC);
 		else
@@ -425,8 +425,8 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_TIME:
 		estr = "time";
 		break;
-	case SBI_HART_EXT_AIA:
-		estr = "aia";
+	case SBI_HART_EXT_SMAIA:
+		estr = "smaia";
 		break;
 	case SBI_HART_EXT_SSTC:
 		estr = "sstc";
@@ -663,7 +663,7 @@ __mhpm_skip:
 	csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
 	if (!trap.cause)
 		__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_AIA, true);
+					SBI_HART_EXT_SMAIA, true);
 
 	/* Detect if hart supports stimecmp CSR(Sstc extension) */
 	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index ee3e4e9..22a346c 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -270,7 +270,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 
 	if (mcause & (1UL << (__riscv_xlen - 1))) {
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
-					   SBI_HART_EXT_AIA))
+					   SBI_HART_EXT_SMAIA))
 			rc = sbi_trap_aia_irq(regs, mcause);
 		else
 			rc = sbi_trap_nonaia_irq(regs, mcause);
-- 
2.34.1


