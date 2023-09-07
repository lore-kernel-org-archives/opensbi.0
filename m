From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu,  7 Sep 2023 09:27:29 +0000
Subject: [PATCH 4/4] lib: sbi: detect extensions from menvcfg
In-Reply-To: <20230907092729.11200-1-yongxuan.wang@sifive.com>
References: <20230907092729.11200-1-yongxuan.wang@sifive.com>
Message-ID: <20230907092729.11200-5-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently "Boot HART ISA Extensions" only shows extensions which can be
detected by test and set their CSRs. We can expand this functionality to
detect additional extensions from menvcfg that do not introduce new CSRs
but are controlled through menvcfg settings.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 include/sbi/sbi_hart.h |  8 +++++++
 lib/sbi/sbi_hart.c     | 49 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e60f415..a0e5f58 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -42,6 +42,14 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_ZIHPM,
 	/** Hart has Smcntrpmf extension */
 	SBI_HART_EXT_SMCNTRPMF,
+	/** Hart has Smcntrpmf extension */
+	SBI_HART_EXT_ZICBOZ,
+	/** Hart has Smcntrpmf extension */
+	SBI_HART_EXT_ZICBOM,
+	/** Hart has Smcntrpmf extension */
+	SBI_HART_EXT_SVPBMT,
+	/** Hart has Svadu extension */
+	SBI_HART_EXT_SVADU,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index b7ca0e6..9a0572e 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -604,6 +604,18 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SMCNTRPMF:
 		estr = "smcntrpmf";
 		break;
+	case SBI_HART_EXT_ZICBOZ:
+		estr = "zicboz";
+		break;
+	case SBI_HART_EXT_ZICBOM:
+		estr = "zicbom";
+		break;
+	case SBI_HART_EXT_SVPBMT:
+		estr = "svpbmt";
+		break;
+	case SBI_HART_EXT_SVADU:
+		estr = "svadu";
+		break;
 	default:
 		break;
 	}
@@ -875,6 +887,43 @@ __pmp_skip:
 		__sbi_hart_update_extension(hfeatures,
 					SBI_HART_EXT_ZIHPM, true);
 
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
+		unsigned long orig_menvcfg_val, menvcfg_val;
+
+		orig_menvcfg_val = csr_read(CSR_MENVCFG);
+		csr_write(CSR_MENVCFG, ~0);
+		menvcfg_val = csr_read(CSR_MENVCFG);
+
+#if __riscv_xlen == 32
+		orig_menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
+		csr_write(CSR_MENVCFGH, ~0);
+		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
+#endif
+
+#define __check_ext_menvcfg(__bit, __ext)				\
+		if (menvcfg_val & (__bit))				\
+			__sbi_hart_update_extension(hfeatures,		\
+						    __ext, true);	\
+
+		/* If the extension is not implemented, the related fields in
+		 * menvcfg are read-only zero.
+		 */
+		__check_ext_menvcfg(ENVCFG_CBZE, SBI_HART_EXT_ZICBOZ);
+		__check_ext_menvcfg(ENVCFG_CBCFE |
+				    (ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT),
+				    SBI_HART_EXT_ZICBOM);
+		__check_ext_menvcfg(ENVCFG_PBMTE, SBI_HART_EXT_SVPBMT);
+		__check_ext_menvcfg(ENVCFG_HADE, SBI_HART_EXT_SVADU);
+
+#undef __check_ext_menvcfg
+
+		csr_write(CSR_MENVCFG, orig_menvcfg_val);
+#if __riscv_xlen == 32
+		csr_write(CSR_MENVCFGH, orig_menvcfg_val >> 32);
+#endif
+
+	}
+
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
-- 
2.17.1


