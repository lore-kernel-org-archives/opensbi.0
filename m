From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 30 Apr 2024 16:42:41 +0800
Subject: [PATCH 1/1] lib: sbi: Add Smrnmi extension detection
Message-ID: <20240430084241.2009259-1-nylon.chen@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds detection and initialization of the Smrnmi extension
in the SBI hart initialization code.

The Smrnmi extension provides resumable non-maskable interrupts (RNMIs)
support. It adds new CSRs (mnscratch, mnepc, mncause, mnstatus) to save
the interrupted context and a new instruction MNRET to resume from the
RNMI handler[1].

we need to detect its presence and enable it in the early hart
initialization process, before any traps.

[1] https://github.com/riscv/riscv-isa-manual/blob/main/src/rnmi.adoc

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/riscv_encoding.h | 10 ++++++++++
 include/sbi/sbi_hart.h       |  2 ++
 lib/sbi/sbi_hart.c           | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index d914828..320bb2b 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -207,6 +207,10 @@
 
 #endif
 
+#define MNSTATUS_NMIE			(_UL(0x8))
+#define MNSTATUS_MNPV			(_UL(0x80))
+#define MNSTATUS_MNPP			(_UL(0x1800))
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFFFF000000000000)
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
@@ -738,6 +742,12 @@
 #define CSR_MSTATEEN3			0x30F
 #define CSR_MSTATEEN3H			0x31F
 
+/* Smrnmi extension registers */
+#define CSR_MNSCRATCH			0x740
+#define CSR_MNEPC			0x741
+#define CSR_MNCAUSE			0x742
+#define CSR_MNSTATUS			0x744
+
 /* Machine-Level High-Half CSRs (AIA) */
 #define CSR_MIDELEGH			0x313
 #define CSR_MIEH			0x314
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index cc78eec..d49d987 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** Hart has Smrnmi extension */
+	SBI_HART_EXT_SMRNMI,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0e7b5d1..6941a94 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -668,6 +668,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
 	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
+	__SBI_HART_EXT_DATA(smrnmi, SBI_HART_EXT_SMRNMI),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -706,6 +707,20 @@ void sbi_hart_get_extensions_str(struct sbi_scratch *scratch,
 		sbi_strncpy(extensions_str, "none", nestr);
 }
 
+static int hart_smrnmi_get_allowed(void)
+{
+	unsigned long val;
+	struct sbi_trap_info trap = {0};
+
+	val = csr_read_allowed(CSR_MNSTATUS, (unsigned long)&trap);
+	if (!trap.cause) {
+		val |= MNSTATUS_NMIE;
+		csr_write(CSR_MNSTATUS, val);
+		return true;
+	} else {
+		return false;
+	}
+
 static unsigned long hart_pmp_get_allowed_addr(void)
 {
 	unsigned long val = 0;
@@ -775,6 +790,13 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->mhpm_mask = 0;
 	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
+	/*
+	 * Detect Resumable Non-Maskable Interrupts
+	 * If it exists we must enable it before all traps.
+	 */
+	if (hart_smrnmi_get_allowed())
+		__sbi_hart_update_extension(hfeatures, SBI_HART_EXT_SMRNMI, true);
+
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, (ulong)&trap);			  \
 	if (!trap.cause) {						  \
-- 
2.34.1


