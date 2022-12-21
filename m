From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Dec 2022 11:55:34 -0800
Subject: [PATCH v2 Zisslpcfi 1/2] include: adding support for Zisslpcfi encodings
In-Reply-To: <20221221195535.2136015-1-debug@rivosinc.com>
References: <20221221195535.2136015-1-debug@rivosinc.com>
Message-ID: <20221221195535.2136015-2-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zisslpcfi extension (see link) introduces b60 (CFI) in menvcfg CSR to
enable shadow stack and landing pad for machine and lesser privileged
modes. Additionally extension introduces new bits in xstatus for cfi
state.

Link: https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>

---
changelog
v1 --> v2:
 - updated with correct name for extension "Zisslpcfi"
---
 include/sbi/riscv_encoding.h | 4 ++++
 include/sbi/sbi_hart.h       | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b0f08c8..1fb520f 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -210,9 +210,11 @@
 #if __riscv_xlen > 32
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
+#define ENVCFG_CFI			(_ULL(1) << 60)
 #else
 #define ENVCFGH_STCE			(_UL(1) << 31)
 #define ENVCFGH_PBMTE			(_UL(1) << 30)
+#define ENVCFGH_CFI			(_UL(1) << 28)
 #endif
 #define ENVCFG_CBZE			(_UL(1) << 7)
 #define ENVCFG_CBCFE			(_UL(1) << 6)
@@ -229,6 +231,8 @@
 #define CSR_USTATUS			0x000
 #define CSR_UIE				0x004
 #define CSR_UTVEC			0x005
+#define CSR_LPLR			0x006
+#define CSR_SSP				0x020
 
 /* User Trap Handling (N-extension) */
 #define CSR_USCRATCH			0x040
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 95b40e7..d25227d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -36,6 +36,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SMSTATEEN,
 	/** HART has Sstc extension */
 	SBI_HART_EXT_SSTC,
+	/** HART has sslpcfi extension */
+	SBI_HART_EXT_SSLPCFI,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
-- 
2.25.1


