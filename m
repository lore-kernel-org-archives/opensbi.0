From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 05 Feb 2025 17:03:52 +0000
Subject: [PATCH v2 2/2] lib: sbi: fwft: Add FWFT support for Control
 transfer records ext
In-Reply-To: <20250205-ctr_upstream_v2-v2-0-2910f2c74e22@rivosinc.com>
References: <20250205-ctr_upstream_v2-v2-0-2910f2c74e22@rivosinc.com>
Message-ID: <20250205-ctr_upstream_v2-v2-2-2910f2c74e22@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow supervisor software to request that Ssctr be enabled for
S-mode. We keep Ssctr always enabled and return SBI_ERR_DENIED
on sbi_fwft_set() call to notify calling software that Ssctr
is always enabled by default.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 include/sbi/sbi_ecall_interface.h |  4 +++-
 lib/sbi/sbi_fwft.c                | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index e9a8167760a9d1e7a06d7142b4e02047b5201319..4db5284ff3d6500666e7c87653b8e4943663815a 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -128,7 +128,9 @@ enum sbi_fwft_feature_t {
 	SBI_FWFT_SHADOW_STACK			= 0x2,
 	SBI_FWFT_DOUBLE_TRAP			= 0x3,
 	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
-	SBI_FWFT_LOCAL_RESERVED_START		= 0x5,
+	SBI_FWFT_POINTER_MASKING_PMLEN          = 0x5,
+	SBI_FWFT_CONTROL_TRANSFER_RECORD        = 0x6,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x7,
 	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
 	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
 	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index f1ae91592fbc880f2e59586bed79cad12b23e994..c12566d891f17f653f3a7524bedfc289519628b6 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -59,6 +59,8 @@ static const unsigned long fwft_defined_features[] = {
 	SBI_FWFT_SHADOW_STACK,
 	SBI_FWFT_DOUBLE_TRAP,
 	SBI_FWFT_PTE_AD_HW_UPDATING,
+	SBI_FWFT_POINTER_MASKING_PMLEN,
+	SBI_FWFT_CONTROL_TRANSFER_RECORD,
 };
 
 static bool fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
@@ -145,6 +147,28 @@ static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
 	return SBI_OK;
 }
 
+static int fwft_ctr_supported(struct fwft_config *conf)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_SSCTR))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+static int fwft_set_ctr(struct fwft_config *conf, unsigned long value)
+{
+	/* CTR is enabled by default and can not be disabled. */
+	return SBI_EDENIED;
+}
+
+static int fwft_get_ctr(struct fwft_config *conf, unsigned long *value)
+{
+	*value = (csr_read(CSR_MSTATEEN0) & SMSTATEEN0_CTR) != 0;
+
+	return SBI_OK;
+}
+
 static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
 {
 	int i;
@@ -236,6 +260,12 @@ static const struct fwft_feature features[] =
 		.set = fwft_set_adue,
 		.get = fwft_get_adue,
 	},
+	{
+		.id = SBI_FWFT_CONTROL_TRANSFER_RECORD,
+		.supported = fwft_ctr_supported,
+		.set = fwft_set_ctr,
+		.get = fwft_get_ctr,
+	},
 };
 
 int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)

-- 
2.34.1


