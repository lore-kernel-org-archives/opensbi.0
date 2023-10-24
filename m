From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 24 Oct 2023 10:11:42 +0000
Subject: [PATCH v2 2/5] lib: sbi: Refactor the code for enable extensions in menvfg CSR
In-Reply-To: <20231024101145.32000-1-yongxuan.wang@sifive.com>
References: <20231024101145.32000-1-yongxuan.wang@sifive.com>
Message-ID: <20231024101145.32000-3-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use 1 variable to store the value of menvcfg.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_encoding.h |  5 -----
 lib/sbi/sbi_hart.c           | 15 ++++++---------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index a545242..92ee0a8 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -207,13 +207,8 @@
 
 #define MHPMEVENT_SSCOF_MASK		_ULL(0xFFFF000000000000)
 
-#if __riscv_xlen > 32
 #define ENVCFG_STCE			(_ULL(1) << 63)
 #define ENVCFG_PBMTE			(_ULL(1) << 62)
-#else
-#define ENVCFGH_STCE			(_UL(1) << 31)
-#define ENVCFGH_PBMTE			(_UL(1) << 30)
-#endif
 #define ENVCFG_CBZE			(_UL(1) << 7)
 #define ENVCFG_CBCFE			(_UL(1) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 5c52b6c..1589111 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -108,6 +108,9 @@ static void mstatus_init(struct sbi_scratch *scratch)
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 		menvcfg_val = csr_read(CSR_MENVCFG);
+#if __riscv_xlen == 32
+		menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
+#endif
 
 		/*
 		 * Set menvcfg.CBZE == 1
@@ -139,9 +142,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		 * If Svpbmt extension is not available then menvcfg.PBMTE
 		 * will be read-only zero.
 		 */
-#if __riscv_xlen > 32
 		menvcfg_val |= ENVCFG_PBMTE;
-#endif
 
 		/*
 		 * The spec doesn't explicitly describe the reset value of menvcfg.
@@ -149,17 +150,13 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		 * hardware.
 		 */
 		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
-#if __riscv_xlen == 32
-			unsigned long menvcfgh_val;
-			menvcfgh_val = csr_read(CSR_MENVCFGH);
-			menvcfgh_val |= ENVCFGH_STCE;
-			csr_write(CSR_MENVCFGH, menvcfgh_val);
-#else
 			menvcfg_val |= ENVCFG_STCE;
-#endif
 		}
 
 		csr_write(CSR_MENVCFG, menvcfg_val);
+#if __riscv_xlen == 32
+		csr_write(CSR_MENVCFGH, menvcfg_val >> 32);
+#endif
 	}
 
 	/* Disable all interrupts */
-- 
2.17.1


