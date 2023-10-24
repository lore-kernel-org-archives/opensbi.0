From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 24 Oct 2023 10:11:44 +0000
Subject: [PATCH v2 4/5] lib: sbi: Detect extensions from the ISA string in DT
In-Reply-To: <20231024101145.32000-1-yongxuan.wang@sifive.com>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
Message-ID: <20231024101145.32000-5-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable access to some extensions through menvcfg and show them in "Boot
HART ISA Extensions" if they are present in the device tree.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_hart.h |  6 +++++
 lib/sbi/sbi_hart.c     | 51 +++++++++++++-----------------------------
 2 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 33bf327..0424da8 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -42,6 +42,12 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZIHPM,
 	/** Hart has Smcntrpmf extension */
 	SBI_HART_EXT_SMCNTRPMF,
+	/** Hart has Zicboz extension */
+	SBI_HART_EXT_ZICBOZ,
+	/** Hart has Zicbom extension */
+	SBI_HART_EXT_ZICBOM,
+	/** Hart has Svpbmt extension */
+	SBI_HART_EXT_SVPBMT,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index add0155..4fb5153 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -112,46 +112,24 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
 #endif
 
-		/*
-		 * Set menvcfg.CBZE == 1
-		 *
-		 * If Zicboz extension is not available then writes to
-		 * menvcfg.CBZE will be ignored because it is a WARL field.
-		 */
-		menvcfg_val |= ENVCFG_CBZE;
+#define __set_menvcfg_ext(__ext, __bit)					\
+		if (sbi_hart_has_extension(scratch, __ext)) {		\
+			menvcfg_val |= __bit;				\
+		}
 
 		/*
-		 * Set menvcfg.CBCFE == 1
-		 *
-		 * If Zicbom extension is not available then writes to
-		 * menvcfg.CBCFE will be ignored because it is a WARL field.
+		* Enable access to extensions if they are present in the
+		 * hardware or in the device tree.
 		 */
-		menvcfg_val |= ENVCFG_CBCFE;
 
-		/*
-		 * Set menvcfg.CBIE == 3
-		 *
-		 * If Zicbom extension is not available then writes to
-		 * menvcfg.CBIE will be ignored because it is a WARL field.
-		 */
-		menvcfg_val |= ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT;
+		__set_menvcfg_ext(SBI_HART_EXT_ZICBOZ, ENVCFG_CBZE);
+		__set_menvcfg_ext(SBI_HART_EXT_ZICBOM, ENVCFG_CBCFE);
+		__set_menvcfg_ext(SBI_HART_EXT_ZICBOM,
+				  ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT);
+		__set_menvcfg_ext(SBI_HART_EXT_SVPBMT, ENVCFG_PBMTE);
+		__set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE);
 
-		/*
-		 * Set menvcfg.PBMTE == 1 for RV64 or RV128
-		 *
-		 * If Svpbmt extension is not available then menvcfg.PBMTE
-		 * will be read-only zero.
-		 */
-		menvcfg_val |= ENVCFG_PBMTE;
-
-		/*
-		 * The spec doesn't explicitly describe the reset value of menvcfg.
-		 * Enable access to stimecmp if sstc extension is present in the
-		 * hardware.
-		 */
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
-			menvcfg_val |= ENVCFG_STCE;
-		}
+#undef __set_menvcfg_ext
 
 		csr_write(CSR_MENVCFG, menvcfg_val);
 #if __riscv_xlen == 32
@@ -666,6 +644,9 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(zicntr, SBI_HART_EXT_ZICNTR),
 	__SBI_HART_EXT_DATA(zihpm, SBI_HART_EXT_ZIHPM),
 	__SBI_HART_EXT_DATA(smcntrpmf, SBI_HART_EXT_SMCNTRPMF),
+	__SBI_HART_EXT_DATA(zicboz, SBI_HART_EXT_ZICBOZ),
+	__SBI_HART_EXT_DATA(zicbom, SBI_HART_EXT_ZICBOM),
+	__SBI_HART_EXT_DATA(svpbmt, SBI_HART_EXT_SVPBMT),
 };
 
 /**
-- 
2.17.1


