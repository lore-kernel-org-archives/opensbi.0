From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 24 Oct 2023 10:11:45 +0000
Subject: [PATCH v2 5/5] lib: sbi: Add support for Svadu extension
In-Reply-To: <20231024101145.32000-1-yongxuan.wang@sifive.com>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
Message-ID: <20231024101145.32000-6-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch detects the Svadu extension from DT and enables the ADUE bit
in the menvcfg CSR for lower privilege modes.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/riscv_encoding.h | 1 +
 include/sbi/sbi_hart.h       | 2 ++
 lib/sbi/sbi_hart.c           | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 92ee0a8..8a81787 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -209,6 +209,7 @@
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
+#define ENVCFG_ADUE			(_ULL(1) << 61)
 #define ENVCFG_CBZE			(_UL(1) << 7)
 #define ENVCFG_CBCFE			(_UL(1) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 0424da8..83471c1 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -48,6 +48,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZICBOM,
 	/** Hart has Svpbmt extension */
 	SBI_HART_EXT_SVPBMT,
+	/** Hart has Svadu extension */
+	SBI_HART_EXT_SVADU,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4fb5153..9874e77 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -128,6 +128,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 				  ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT);
 		__set_menvcfg_ext(SBI_HART_EXT_SVPBMT, ENVCFG_PBMTE);
 		__set_menvcfg_ext(SBI_HART_EXT_SSTC, ENVCFG_STCE);
+		__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
 
 #undef __set_menvcfg_ext
 
@@ -647,6 +648,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(zicboz, SBI_HART_EXT_ZICBOZ),
 	__SBI_HART_EXT_DATA(zicbom, SBI_HART_EXT_ZICBOM),
 	__SBI_HART_EXT_DATA(svpbmt, SBI_HART_EXT_SVPBMT),
+	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
 };
 
 /**
-- 
2.17.1


