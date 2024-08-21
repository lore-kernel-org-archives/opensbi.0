From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Aug 2024 16:55:44 -0700
Subject: [PATCH 1/3] include: adding support for Zicfilp / Zicfiss encodings
In-Reply-To: <20240821235546.3876172-1-debug@rivosinc.com>
References: <20240821235546.3876172-1-debug@rivosinc.com>
Message-ID: <20240821235546.3876172-2-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zicfilp / Zicfiss extension (see link) introduces b2 (LPE) in menvcfg CSR to
enable landing pads and b3 (SSE) in menvcfg CSR to enable shadow stack and
landing pad for privilege less than M. Additionally extension introduces new
bits in *status for recording landing pad state and a new exception type
`software check exception` with cause=0x12.

Link: https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/sbi/riscv_encoding.h | 6 ++++++
 include/sbi/sbi_hart.h       | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 2ed05f2..64cd9ab 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -32,6 +32,8 @@
 #define MSTATUS_TVM			_UL(0x00100000)
 #define MSTATUS_TW			_UL(0x00200000)
 #define MSTATUS_TSR			_UL(0x00400000)
+#define MSTATUS_SPELP		_UL(0x00800000)
+#define MSTATUS_MPELP		_UL(0x020000000000)
 #define MSTATUS32_SD			_UL(0x80000000)
 #if __riscv_xlen == 64
 #define MSTATUS_UXL			_ULL(0x0000000300000000)
@@ -213,6 +215,8 @@
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
 #define ENVCFG_ADUE			(_ULL(1) << 61)
 #define ENVCFG_CDE			(_ULL(1) << 60)
+#define ENVCFG_SSE			(_ULL(1) << 3)
+#define ENVCFG_LPE			(_ULL(1) << 2)
 #define ENVCFG_CBZE			(_UL(1) << 7)
 #define ENVCFG_CBCFE			(_UL(1) << 6)
 #define ENVCFG_CBIE_SHIFT		4
@@ -228,6 +232,7 @@
 #define CSR_USTATUS			0x000
 #define CSR_UIE				0x004
 #define CSR_UTVEC			0x005
+#define CSR_SSP				0x011
 
 /* User Trap Handling (N-extension) */
 #define CSR_USCRATCH			0x040
@@ -763,6 +768,7 @@
 #define CAUSE_FETCH_PAGE_FAULT		0xc
 #define CAUSE_LOAD_PAGE_FAULT		0xd
 #define CAUSE_STORE_PAGE_FAULT		0xf
+#define CAUSE_SW_CHECK_EXCP			0x12
 #define CAUSE_FETCH_GUEST_PAGE_FAULT	0x14
 #define CAUSE_LOAD_GUEST_PAGE_FAULT	0x15
 #define CAUSE_VIRTUAL_INST_FAULT	0x16
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 81ec061..2aa6867 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -67,6 +67,9 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SVADE,
 	/** Hart has Svadu extension */
 	SBI_HART_EXT_SVADU,
+	/** HART has zicfiss & zicfilp extension */
+	SBI_HART_EXT_ZICFILP,
+	SBI_HART_EXT_ZICFISS,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
-- 
2.44.0


