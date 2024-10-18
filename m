From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 18 Oct 2024 10:40:06 +0200
Subject: [PATCH v4 5/7] lib: sbi: fwft: factorize menvcfg read/write
In-Reply-To: <20241018084010.406285-1-cleger@rivosinc.com>
References: <20241018084010.406285-1-cleger@rivosinc.com>
Message-ID: <20241018084010.406285-6-cleger@rivosinc.com>
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
 include/sbi/riscv_encoding.h |  9 ++--
 lib/sbi/sbi_fwft.c           | 94 +++++++++++++++---------------------
 2 files changed, 46 insertions(+), 57 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 2264427..fd34ba7 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -214,7 +214,8 @@
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
-#define ENVCFG_ADUE			(_ULL(1) << 61)
+#define ENVCFG_ADUE_SHIFT		61
+#define ENVCFG_ADUE			(_ULL(1) << ENVCFG_ADUE_SHIFT)
 #define ENVCFG_CDE			(_ULL(1) << 60)
 #define ENVCFG_DTE			(_ULL(1) << 59)
 #define ENVCFG_PMM			(_ULL(0x3) << 32)
@@ -228,8 +229,10 @@
 #define ENVCFG_CBIE_ILL			_UL(0x0)
 #define ENVCFG_CBIE_FLUSH		_UL(0x1)
 #define ENVCFG_CBIE_INV			_UL(0x3)
-#define ENVCFG_SSE			(_UL(1) << 3)
-#define ENVCFG_LPE			(_UL(1) << 2)
+#define ENVCFG_SSE_SHIFT		3
+#define ENVCFG_SSE			(_UL(1) << ENVCFG_SSE_SHIFT)
+#define ENVCFG_LPE_SHIFT		2
+#define ENVCFG_LPE			(_UL(1) << ENVCFG_LPE_SHIFT)
 #define ENVCFG_FIOM			_UL(0x1)
 
 /* ===== User-level CSRs ===== */
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 124a043..9ee0d07 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -74,6 +74,40 @@ static bool fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
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
@@ -114,36 +148,12 @@ static int fwft_adue_supported(struct fwft_config *conf)
 
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
 
 static int fwft_lpad_supported(struct fwft_config *conf)
@@ -157,24 +167,12 @@ static int fwft_lpad_supported(struct fwft_config *conf)
 
 static int fwft_enable_lpad(struct fwft_config *conf, unsigned long value)
 {
-	if (value == 1)
-		csr_set(CSR_MENVCFG, ENVCFG_LPE);
-	else if (value == 0)
-		csr_clear(CSR_MENVCFG, ENVCFG_LPE);
-	else
-		return SBI_EINVAL;
-
-	return SBI_OK;
+	return fwft_menvcfg_set_bit(value, ENVCFG_LPE_SHIFT);
 }
 
 static int fwft_get_lpad(struct fwft_config *conf, unsigned long *value)
 {
-	unsigned long cfg;
-
-	cfg = csr_read(CSR_MENVCFG) & ENVCFG_LPE;
-	*value = cfg != 0;
-
-	return SBI_OK;
+	return fwft_menvcfg_read_bit(value, ENVCFG_LPE_SHIFT);
 }
 
 static int fwft_sstack_supported(struct fwft_config *conf)
@@ -188,24 +186,12 @@ static int fwft_sstack_supported(struct fwft_config *conf)
 
 static int fwft_enable_sstack(struct fwft_config *conf, unsigned long value)
 {
-	if (value == 1)
-		csr_set(CSR_MENVCFG, ENVCFG_SSE);
-	else if (value == 0)
-		csr_clear(CSR_MENVCFG, ENVCFG_SSE);
-	else
-		return SBI_EINVAL;
-
-	return SBI_OK;
+	return fwft_menvcfg_set_bit(value, ENVCFG_SSE_SHIFT);
 }
 
 static int fwft_get_sstack(struct fwft_config *conf, unsigned long *value)
 {
-	unsigned long cfg;
-
-	cfg = csr_read(CSR_MENVCFG) & ENVCFG_SSE;
-	*value = cfg != 0;
-
-	return SBI_OK;
+	return fwft_menvcfg_read_bit(value, ENVCFG_SSE_SHIFT);
 }
 
 #if __riscv_xlen > 32
-- 
2.45.2


