From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 05 Feb 2025 17:03:51 +0000
Subject: [PATCH v2 1/2] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
In-Reply-To: <20250205-ctr_upstream_v2-v2-0-2910f2c74e22@rivosinc.com>
References: <20250205-ctr_upstream_v2-v2-0-2910f2c74e22@rivosinc.com>
Message-ID: <20250205-ctr_upstream_v2-v2-1-2910f2c74e22@rivosinc.com>
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
 lib/sbi/sbi_hart.c           | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 050674a243fc7d341e0bbe73a2ab73ec103f1e1b..1608cf1759b4b38b12fad4cd59f8fd6779ce1ba4 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -358,6 +358,17 @@
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
@@ -774,6 +785,8 @@
 #define SMSTATEEN0_CS			(_ULL(1) << SMSTATEEN0_CS_SHIFT)
 #define SMSTATEEN0_FCSR_SHIFT		1
 #define SMSTATEEN0_FCSR			(_ULL(1) << SMSTATEEN0_FCSR_SHIFT)
+#define SMSTATEEN0_CTR_SHIFT		54
+#define SMSTATEEN0_CTR			(_ULL(1) << SMSTATEEN0_CTR_SHIFT)
 #define SMSTATEEN0_CONTEXT_SHIFT	57
 #define SMSTATEEN0_CONTEXT		(_ULL(1) << SMSTATEEN0_CONTEXT_SHIFT)
 #define SMSTATEEN0_IMSIC_SHIFT		58
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 81ec061d36a93e35686136940984647e9f1d8d94..ef710d9aa1a591af486d0761cc752f19ff15ee70 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -67,6 +67,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SVADE,
 	/** Hart has Svadu extension */
 	SBI_HART_EXT_SVADU,
+	/** HART has CTR M-mode CSRs */
+	SBI_HART_EXT_SMCTR,
+	/** HART has CTR S-mode CSRs */
+	SBI_HART_EXT_SSCTR,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c3667019b9a195ecc9fa902471c1ff830a150458..09792332d369d30a15aa30f73f6dbc044be1b67c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -105,6 +105,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		else
 			mstateen_val &= ~(SMSTATEEN0_SVSLCT);
 
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCTR))
+			mstateen_val |= SMSTATEEN0_CTR;
+		else
+			mstateen_val &= ~SMSTATEEN0_CTR;
+
 		csr_write(CSR_MSTATEEN0, mstateen_val);
 #if __riscv_xlen == 32
 		csr_write(CSR_MSTATEEN0H, mstateen_val >> 32);
@@ -680,6 +685,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
 	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
 	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
+	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
+	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -933,6 +940,18 @@ __pmp_skip:
 	/* Save trap based detection of Zicntr */
 	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
 
+	/* Detect if hart has Smctr CSRs */
+	csr_read_allowed(CSR_MCTRCTL, (unsigned long)&trap);
+	if (!trap.cause)
+		__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_SMCTR,
+					    true);
+
+	/* Detect if hart has Ssctr CSRs */
+	csr_read_allowed(CSR_SCTRCTL, (unsigned long)&trap);
+	if (!trap.cause)
+		__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_SSCTR,
+					    true);
+
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
 					  hfeatures);

-- 
2.34.1


