From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 16 Sep 2024 11:23:57 -0700
Subject: [PATCH v6 4/4] lib: sbi: fwft: implement landing pad and shadow stack fwft interface
In-Reply-To: <20240916182357.24545-1-debug@rivosinc.com>
References: <20240916182357.24545-1-debug@rivosinc.com>
Message-ID: <20240916182357.24545-5-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Supervisor software can enable control flow integrity features for itself
using fwft feature `SBI_FWFT_LANDING_PAD` and `SBI_FWFT_SHADOW_STACK`.
This patch implements the mechanism to enable both these fwft.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_fwft.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index ef881ef..88610aa 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -145,6 +145,68 @@ static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
 	return SBI_OK;
 }
 
+static int fwft_lpad_supported(struct fwft_config *conf)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_ZICFILP))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+static int fwft_enable_lpad(struct fwft_config *conf, unsigned long value)
+{
+	if (value == 1)
+		csr_set(CSR_MENVCFG, ENVCFG_LPE);
+	else if (value == 0)
+		csr_clear(CSR_MENVCFG, ENVCFG_LPE);
+	else
+		return SBI_EINVAL;
+
+	return SBI_OK;
+}
+
+static int fwft_get_lpad(struct fwft_config *conf, unsigned long *value)
+{
+	unsigned long cfg;
+
+	cfg = csr_read(CSR_MENVCFG) & ENVCFG_LPE;
+	*value = cfg != 0;
+
+	return SBI_OK;
+}
+
+static int fwft_sstack_supported(struct fwft_config *conf)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_ZICFISS))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+static int fwft_enable_sstack(struct fwft_config *conf, unsigned long value)
+{
+	if (value == 1)
+		csr_set(CSR_MENVCFG, ENVCFG_SSE);
+	else if (value == 0)
+		csr_clear(CSR_MENVCFG, ENVCFG_SSE);
+	else
+		return SBI_EINVAL;
+
+	return SBI_OK;
+}
+
+static int fwft_get_sstack(struct fwft_config *conf, unsigned long *value)
+{
+	unsigned long cfg;
+
+	cfg = csr_read(CSR_MENVCFG) & ENVCFG_SSE;
+	*value = cfg != 0;
+
+	return SBI_OK;
+}
+
 static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
 {
 	int i;
@@ -230,6 +292,18 @@ static const struct fwft_feature features[] =
 		.set = fwft_set_misaligned_delegation,
 		.get = fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_LANDING_PAD,
+		.supported = fwft_lpad_supported,
+		.set = fwft_enable_lpad,
+		.get = fwft_get_lpad,
+	},
+	{
+		.id = SBI_FWFT_SHADOW_STACK,
+		.supported = fwft_sstack_supported,
+		.set = fwft_enable_sstack,
+		.get = fwft_get_sstack,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.supported = fwft_adue_supported,
-- 
2.45.0


