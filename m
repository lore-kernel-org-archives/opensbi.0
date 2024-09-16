From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 16 Sep 2024 16:08:22 +0200
Subject: [PATCH v3 5/7] lib: sbi: fwft: factorize menvcfg read/write
In-Reply-To: <20240916140824.3343921-1-cleger@rivosinc.com>
References: <20240916140824.3343921-1-cleger@rivosinc.com>
Message-ID: <20240916140824.3343921-6-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MENVCFG access will be used as well for double trap, landing pad and
shadow stack fwft support. Factorize that in a common function.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/riscv_encoding.h |  3 +-
 lib/sbi/sbi_fwft.c           | 62 +++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 4728c63..5b3bbc5 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -211,7 +211,8 @@
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
-#define ENVCFG_ADUE			(_ULL(1) << 61)
+#define ENVCFG_ADUE_SHIFT		61
+#define ENVCFG_ADUE			(_ULL(1) << ENVCFG_ADUE_SHIFT)
 #define ENVCFG_CDE			(_ULL(1) << 60)
 #define ENVCFG_DTE			(_ULL(1) << 59)
 #define ENVCFG_CBZE			(_UL(1) << 7)
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index ef881ef..c818afd 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -73,6 +73,40 @@ static bool fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static int fwft_menvcfg_set_bit(unsigned long value, unsigned long bit)
+{
+	if (value == 1) {
+		if (bit >= 32 && __riscv_xlen == 32)
+			csr_set(CSR_MENVCFGH, _ULL(1) << (bit - 32));
+		else
+			csr_set(CSR_MENVCFG, _ULL(1) << bit);
+
+	} else if (value == 0) {
+		if (bit >= 32 && __riscv_xlen == 32)
+			csr_clear(CSR_MENVCFGH, _ULL(1) << (bit - 32));
+		else
+			csr_clear(CSR_MENVCFG, _ULL(1) << bit);
+	} else {
+		return SBI_EINVAL;
+	}
+
+	return SBI_OK;
+}
+
+static int fwft_menvcfg_read_bit(unsigned long *value, unsigned long bit)
+{
+	unsigned long cfg;
+
+	if (bit >= 32 && __riscv_xlen == 32)
+		cfg = csr_read(CSR_MENVCFGH) & (_ULL(1) << (bit - 32));
+	else
+		cfg = csr_read(CSR_MENVCFG) & (_ULL(1) << bit);
+
+	*value = cfg != 0;
+
+	return SBI_OK;
+}
+
 static int fwft_misaligned_delegation_supported(struct fwft_config *conf)
 {
 	if (!misa_extension('S'))
@@ -113,36 +147,12 @@ static int fwft_adue_supported(struct fwft_config *conf)
 
 static int fwft_set_adue(struct fwft_config *conf, unsigned long value)
 {
-	if (value == 1)
-#if __riscv_xlen == 32
-		csr_set(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
-#else
-		csr_set(CSR_MENVCFG, ENVCFG_ADUE);
-#endif
-	else if (value == 0)
-#if __riscv_xlen == 32
-		csr_clear(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
-#else
-		csr_clear(CSR_MENVCFG, ENVCFG_ADUE);
-#endif
-	else
-		return SBI_EINVAL;
-
-	return SBI_OK;
+	return fwft_menvcfg_set_bit(value, ENVCFG_ADUE_SHIFT);
 }
 
 static int fwft_get_adue(struct fwft_config *conf, unsigned long *value)
 {
-	unsigned long cfg;
-
-#if __riscv_xlen == 32
-	cfg = csr_read(CSR_MENVCFGH) & (ENVCFG_ADUE >> 32);
-#else
-	cfg = csr_read(CSR_MENVCFG) & ENVCFG_ADUE;
-#endif
-	*value = cfg != 0;
-
-	return SBI_OK;
+	return fwft_menvcfg_read_bit(value, ENVCFG_ADUE_SHIFT);
 }
 
 static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
-- 
2.45.2


