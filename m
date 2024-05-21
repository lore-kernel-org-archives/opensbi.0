From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 21 May 2024 15:58:31 +0200
Subject: [PATCH v1 3/5] lib: sbi: fwft: add support for SBI_FWFT_MISALIGNED_EXC_DELEG
In-Reply-To: <20240521135835.371485-1-cleger@rivosinc.com>
References: <20240521135835.371485-1-cleger@rivosinc.com>
Message-ID: <20240521135835.371485-4-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for SBI_FWFT_MISALIGNED_EXC_DELEG withing FWFT support. This
support allows to delegate misaligned accesses traps.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hsm.c  |  3 +++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index adfe645..54c6642 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -32,6 +32,8 @@ static unsigned long fwft_ptr_offset;
 #define fwft_set_hart_state_ptr(__scratch, __phs)			\
 	sbi_scratch_write_type((__scratch), void *, fwft_ptr_offset, (__phs))
 
+#define MIS_DELEG (1UL << CAUSE_MISALIGNED_LOAD | 1UL << CAUSE_MISALIGNED_STORE)
+
 struct fwft_config;
 
 struct fwft_feature {
@@ -72,6 +74,33 @@ static bool fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static int fwft_misaligned_delegation_supported(struct fwft_config *conf)
+{
+	if (!misa_extension('S'))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+static int fwft_set_misaligned_delegation(struct fwft_config *conf,
+					 unsigned long value)
+{
+	if (value)
+		csr_set(CSR_MEDELEG, MIS_DELEG);
+	else
+		csr_clear(CSR_MEDELEG, MIS_DELEG);
+
+	return SBI_OK;
+}
+
+static int fwft_get_misaligned_delegation(struct fwft_config *conf,
+					 unsigned long *value)
+{
+	*value = (csr_read(CSR_MEDELEG) & MIS_DELEG) != 0;
+
+	return SBI_OK;
+}
+
 static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
 {
 	int i;
@@ -149,7 +178,15 @@ int sbi_fwft_get(enum sbi_fwft_feature_t feature, unsigned long *out_val)
 	return conf->feature->get(conf, out_val);
 }
 
-static const struct fwft_feature features[] = {};
+static const struct fwft_feature features[] =
+{
+	{
+		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.supported = fwft_misaligned_delegation_supported,
+		.set = fwft_set_misaligned_delegation,
+		.get = fwft_get_misaligned_delegation,
+	},
+};
 
 int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
 {
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index be48d64..47edab2 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -44,6 +44,7 @@ struct sbi_hsm_data {
 	unsigned long suspend_type;
 	unsigned long saved_mie;
 	unsigned long saved_mip;
+	unsigned long saved_hedeleg;
 	atomic_t start_ticket;
 };
 
@@ -417,6 +418,7 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 
 	hdata->saved_mie = csr_read(CSR_MIE);
 	hdata->saved_mip = csr_read(CSR_MIP) & (MIP_SSIP | MIP_STIP);
+	hdata->saved_hedeleg = csr_read(CSR_HEDELEG);
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -424,6 +426,7 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
 
+	csr_write(CSR_HEDELEG, hdata->saved_hedeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
 }
-- 
2.43.0


