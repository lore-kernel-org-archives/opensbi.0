From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 21 May 2024 15:58:29 +0200
Subject: [PATCH v1 1/5] lib: sbi: Add SVADU extension support
In-Reply-To: <20240521135835.371485-1-cleger@rivosinc.com>
References: <20240521135835.371485-1-cleger@rivosinc.com>
Message-ID: <20240521135835.371485-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add SVADU ISA extension support. By default, clear the ADUE bit to
maintain backward-compatibility.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/riscv_encoding.h | 1 +
 include/sbi/sbi_hart.h       | 2 ++
 lib/sbi/sbi_hart.c           | 9 +++++++++
 3 files changed, 12 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index d914828..477fa3a 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -211,6 +211,7 @@
 
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
+#define ENVCFG_ADUE			(_ULL(1) << 61)
 #define ENVCFG_CDE			(_ULL(1) << 60)
 #define ENVCFG_CBZE			(_UL(1) << 7)
 #define ENVCFG_CBCFE			(_UL(1) << 6)
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index cc78eec..10dd90c 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** Hart has Svadu extension */
+	SBI_HART_EXT_SVADU,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index cd974cc..2170a82 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -148,6 +148,14 @@ static void mstatus_init(struct sbi_scratch *scratch)
 			csr_set(CSR_MSECCFG, MSECCFG_SSEED);
 			csr_clear(CSR_MSECCFG, MSECCFG_USEED);
 		}
+
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADU)) {
+#if __riscv_xlen == 32
+			csr_clear(CSR_MENVCFGH, ENVCFG_ADUE >> 32);
+#else
+			csr_clear(CSR_MENVCFG, ENVCFG_ADUE);
+#endif
+		}
 	}
 
 	/* Disable all interrupts */
@@ -668,6 +676,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
 	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
+	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.0


