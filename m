From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 00:29:12 -0800
Subject: [PATCH v1 1/2] lib/sbi: Implement menvcfg CSR
In-Reply-To: <20220228082913.3665360-1-atishp@rivosinc.com>
References: <20220228082913.3665360-1-atishp@rivosinc.com>
Message-ID: <20220228082913.3665360-2-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Privileged specification v1.12 added a menvcfg CSR for execution
enviornment configuration register for various ISA extension configuration.

Add support for the menvcfg CSR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/riscv_encoding.h | 11 +++++++++++
 include/sbi/sbi_hart.h       |  4 +++-
 lib/sbi/sbi_hart.c           |  5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 574d1c349023..c0020f43f022 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -201,6 +201,13 @@
 
 #endif
 
+#if __riscv_xlen == 64
+#define MENVCFG_STCE			(_UL(1) << 63)
+#else
+#define MENVCFGH_STCE			(_UL(1) << 31)
+#endif
+
+
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFFFF000000000000)
 
 /* ===== User-level CSRs ===== */
@@ -408,6 +415,10 @@
 #define CSR_MCOUNTEREN			0x306
 #define CSR_MSTATUSH			0x310
 
+/* Environment configuration CSRs */
+#define CSR_MENVCFG			0x30A
+#define CSR_MENVCFGH			0x31A
+
 /* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
 #define CSR_MEPC			0x341
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a83b45b985c3..9e5a2b416017 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -26,9 +26,11 @@ enum sbi_hart_features {
 	SBI_HART_HAS_TIME = (1 << 4),
 	/** HART has AIA local interrupt CSRs */
 	SBI_HART_HAS_AIA = (1 << 5),
+	/** HART has MENVCFG CSR */
+	SBI_HART_HAS_MENVCFG = (1 << 6),
 
 	/** Last index of Hart features*/
-	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_AIA,
+	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_MENVCFG,
 };
 
 struct sbi_scratch;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e0285406256c..e08d9d32266a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -528,6 +528,11 @@ __mhpm_skip:
 	if (!trap.cause)
 		hfeatures->features |= SBI_HART_HAS_TIME;
 
+	/* Detect if hart supports menvcfg CSR */
+	csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
+	if (!trap.cause)
+		hfeatures->features |= SBI_HART_HAS_MENVCFG;
+
 	/* Detect if hart has AIA local interrupt CSRs */
 	csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
 	if (trap.cause)
-- 
2.30.2


