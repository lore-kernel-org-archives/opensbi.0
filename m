From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 29 May 2024 16:02:10 +0100
Subject: [PATCH] lib: sbi: Enable Control Transfer Records (CTR) Ext using xstateen.
Message-ID: <20240529150210.125200-1-rkanwal@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Control Transfer Records (CTR) extension provides a method to
record a limited branch history in register-accessible internal chip
storage.

This extension is similar to Arch LBR in x86 and BRBE in ARM.
The Extension has been stable and the latest release can be found here
https://github.com/riscv/riscv-control-transfer-records/release

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 include/sbi/riscv_encoding.h | 13 +++++++++++++
 include/sbi/sbi_hart.h       |  4 ++++
 lib/sbi/sbi_hart.c           | 13 +++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index d914828..eb3361c 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -357,6 +357,17 @@
 #define CSR_SSTATEEN2			0x10E
 #define CSR_SSTATEEN3			0x10F
 
+/* Machine-Level Control transfer records CSRs */
+#define CSR_MCTRCTL                     0x34e
+
+/* Supervisor-Level Control transfer records CSRs */
+#define CSR_SCTRCTL                     0x14e
+#define CSR_SCTRSTATUS                  0x14f
+#define CSR_SCTRDEPTH                   0x15f
+
+/* VS-Level Control transfer records CSRs */
+#define CSR_VSCTRCTL                    0x24e
+
 /* ===== Hypervisor-level CSRs ===== */
 
 /* Hypervisor Trap Setup (H-extension) */
@@ -773,6 +784,8 @@
 #define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
 #define SMSTATEEN0_FCSR_SHIFT		1
 #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
+#define SMSTATEEN0_CTR_SHIFT		54
+#define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
 #define SMSTATEEN0_CONTEXT_SHIFT	57
 #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
 #define SMSTATEEN0_IMSIC_SHIFT		58
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index cc78eec..c4eddb4 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** HART has CTR M-mode CSRs */
+	SBI_HART_EXT_SMCTR,
+	/** HART has CTR S-mode CSRs */
+	SBI_HART_EXT_SSCTR,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index cd974cc..db2f157 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		else
 			mstateen_val &= ~(SMSTATEEN0_SVSLCT);
 
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCTR))
+			mstateen_val |= SMSTATEEN0_CTR;
+		else
+			mstateen_val &= ~SMSTATEEN0_CTR;
+
 		csr_write(CSR_MSTATEEN0, mstateen_val);
 #if __riscv_xlen == 32
 		csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
@@ -668,6 +673,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
 	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
+	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
+	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -921,6 +928,12 @@ __pmp_skip:
 	/* Save trap based detection of Zicntr */
 	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
 
+	/* Detect if hart has Control Transfer Record CSRs */
+	csr_read_allowed(CSR_MCTRCTL, (unsigned long)&trap);
+	if (!trap.cause)
+		__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_SMCTR,
+					    true);
+
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
 					  hfeatures);
-- 
2.34.1


