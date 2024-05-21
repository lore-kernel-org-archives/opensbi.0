From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 21 May 2024 15:58:32 +0200
Subject: [PATCH v1 4/5] lib: sbi: fwft: add support for SBI_FWFT_PTE_AD_HW_UPDATING
In-Reply-To: <20240521135835.371485-1-cleger@rivosinc.com>
References: <20240521135835.371485-1-cleger@rivosinc.com>
Message-ID: <20240521135835.371485-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for SBI_FWFT_PTE_AD_HW_UPDATING based on SVADU presence.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_fwft.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c  | 12 ++++++++++
 2 files changed, 68 insertions(+)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 54c6642..bf5d4d4 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -101,6 +101,56 @@ static int fwft_get_misaligned_delegation(struct fwft_config *conf,
 	return SBI_OK;
 }
 
+static int fwft_adue_supported(struct fwft_config *conf)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_SVADU))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+#if __riscv_xlen == 32
+#define MENVCFG_REG(__val) \
+	(__builtin_ffsll(__val) > 32 ? CSR_MENVCFGH : CSR_MENVCFG)
+#define MENVCFG_VAL(__val) \
+	(__builtin_ffsll(__val) > 32 ? (__val) >> 32 : (__val))
+#else
+#define MENVCFG_REG(__val) CSR_MENVCFG
+#define MENVCFG_VAL(__val) (__val)
+#endif
+
+static int fwft_set_adue(struct fwft_config *conf, unsigned long value)
+{
+	if (value)
+#if __riscv_xlen == 32
+		csr_set(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
+#else
+		csr_set(CSR_MENVCFG, ENVCFG_ADUE);
+#endif
+	else
+#if __riscv_xlen == 32
+		csr_clear(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
+#else
+		csr_clear(CSR_MENVCFG, ENVCFG_ADUE);
+#endif
+
+	return SBI_OK;
+}
+
+static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
+{
+	unsigned long cfg;
+#if __riscv_xlen == 32
+	cfg = csr_read(CSR_MENVCFGH) & (ENVCFG_ADUE >> 32);
+#else
+	cfg = csr_read(CSR_MENVCFG) & ENVCFG_ADUE;
+#endif
+	*value = cfg != 0;
+
+	return SBI_OK;
+}
+
 static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
 {
 	int i;
@@ -186,6 +236,12 @@ static const struct fwft_feature features[] =
 		.set = fwft_set_misaligned_delegation,
 		.get = fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
+		.supported = fwft_adue_supported,
+		.set = fwft_set_adue,
+		.get = fwft_get_adue,
+	},
 };
 
 int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 47edab2..9a74d2c 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -45,6 +45,10 @@ struct sbi_hsm_data {
 	unsigned long saved_mie;
 	unsigned long saved_mip;
 	unsigned long saved_hedeleg;
+	unsigned long saved_menvcfg;
+#if __riscv_xlen == 32
+	unsigned long saved_menvcfgh;
+#endif
 	atomic_t start_ticket;
 };
 
@@ -419,6 +423,10 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mie = csr_read(CSR_MIE);
 	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
 	hdata->saved_hedeleg = csr_read(CSR_HEDELEG);
+#if __riscv_xlen == 32
+	hdata->saved_menvcfgh = csr_read(CSR_MENVCFGH);
+#endif
+	hdata->saved_menvcfg = csr_read(CSR_MENVCFG);
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -426,6 +434,10 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
+	csr_write(CSR_MENVCFG, hdata->saved_menvcfg);
+#if __riscv_xlen == 32
+	csr_write(CSR_MENVCFGH, hdata->saved_menvcfgh);
+#endif
 	csr_write(CSR_HEDELEG, hdata->saved_hedeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
-- 
2.43.0


