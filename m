From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 18 Oct 2024 10:40:07 +0200
Subject: [PATCH v4 6/7] lib: sbi: implement firmware feature SBI_FWFT_DOUBLE_TRAP
In-Reply-To: <20241018084010.406285-1-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
Message-ID: <20241018084010.406285-7-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for double trap firmware feature.

Link: https://lists.riscv.org/g/tech-prs/message/985 [1]
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/riscv_encoding.h |  3 ++-
 lib/sbi/sbi_fwft.c           | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index fd34ba7..174cc9c 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -217,7 +217,8 @@
 #define ENVCFG_ADUE_SHIFT		61
 #define ENVCFG_ADUE			(_ULL(1) << ENVCFG_ADUE_SHIFT)
 #define ENVCFG_CDE			(_ULL(1) << 60)
-#define ENVCFG_DTE			(_ULL(1) << 59)
+#define ENVCFG_DTE_SHIFT		59
+#define ENVCFG_DTE			(_ULL(1) << ENVCFG_DTE_SHIFT)
 #define ENVCFG_PMM			(_ULL(0x3) << 32)
 #define ENVCFG_PMM_PMLEN_0		(_ULL(0x0) << 32)
 #define ENVCFG_PMM_PMLEN_7		(_ULL(0x2) << 32)
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 9ee0d07..9cf14c1 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -137,6 +137,25 @@ static int fwft_get_misaligned_delegation(struct fwft_config *conf,
 	return SBI_OK;
 }
 
+static int fwft_double_trap_supported(struct fwft_config *conf)
+{
+	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+				    SBI_HART_EXT_SSDBLTRP))
+		return SBI_ENOTSUPP;
+
+	return SBI_OK;
+}
+
+static int fwft_set_double_trap(struct fwft_config *conf, unsigned long value)
+{
+	return fwft_menvcfg_set_bit(value, ENVCFG_DTE_SHIFT);
+}
+
+static int fwft_get_double_trap(struct fwft_config *conf, unsigned long *value)
+{
+	return fwft_menvcfg_read_bit(value, ENVCFG_DTE_SHIFT);
+}
+
 static int fwft_adue_supported(struct fwft_config *conf)
 {
 	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
@@ -349,6 +368,12 @@ static const struct fwft_feature features[] =
 		.set = fwft_enable_sstack,
 		.get = fwft_get_sstack,
 	},
+	{
+		.id = SBI_FWFT_DOUBLE_TRAP,
+		.supported = fwft_double_trap_supported,
+		.set = fwft_set_double_trap,
+		.get = fwft_get_double_trap,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.supported = fwft_adue_supported,
-- 
2.45.2


