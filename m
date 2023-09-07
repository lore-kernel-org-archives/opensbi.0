From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu,  7 Sep 2023 09:27:28 +0000
Subject: [PATCH 3/4] lib: sbi: Improve the code of privilege mode and extensions detection
In-Reply-To: <20230907092729.11200-1-yongxuan.wang@sifive.com>
References: <20230907092729.11200-1-yongxuan.wang@sifive.com>
Message-ID: <20230907092729.11200-4-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We can enhance the code by creating 2 unified interface with macro  for
privilege mode and extensions detection, which relies on supported
privilege modes and CSRs.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 lib/sbi/sbi_hart.c | 90 ++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 51 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 21af2b5..b7ca0e6 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -722,6 +722,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->extensions = 0;
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_mask = 0;
+	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
 
 #define __check_hpm_csr(__csr, __mask) 					  \
 	oldval = csr_read_allowed(__csr, (ulong)&trap);			  \
@@ -814,67 +815,54 @@ __pmp_skip:
 #undef __check_csr_2
 #undef __check_csr
 
-	/* Detect if hart supports Priv v1.10 */
-	val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
-	if (!trap.cause)
-		hfeatures->priv_version = SBI_HART_PRIV_VER_1_10;
 
-	/* Detect if hart supports Priv v1.11 */
-	val = csr_read_allowed(CSR_MCOUNTINHIBIT, (unsigned long)&trap);
-	if (!trap.cause &&
-	    (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_10))
-		hfeatures->priv_version = SBI_HART_PRIV_VER_1_11;
+#define __check_priv(__csr, __base_priv, __priv)			\
+	val = csr_read_allowed(__csr, (ulong)&trap);			\
+	if (!trap.cause && (hfeatures->priv_version >= __base_priv)) {	\
+		hfeatures->priv_version = __priv;			\
+	}								\
 
+	/* Detect if hart supports Priv v1.10 */
+	__check_priv(CSR_MCOUNTEREN,
+		     SBI_HART_PRIV_VER_UNKNOWN, SBI_HART_PRIV_VER_1_10);
+	/* Detect if hart supports Priv v1.11 */
+	__check_priv(CSR_MCOUNTINHIBIT,
+		     SBI_HART_PRIV_VER_1_10, SBI_HART_PRIV_VER_1_11);
 	/* Detect if hart supports Priv v1.12 */
-	csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
-	if (!trap.cause &&
-	    (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11))
-		hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
+	__check_priv(CSR_MENVCFG,
+		     SBI_HART_PRIV_VER_1_11, SBI_HART_PRIV_VER_1_12);
 
-	/* Counter overflow/filtering is not useful without mcounter/inhibit */
-	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {
-		/* Detect if hart supports sscofpmf */
-		csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
-		if (!trap.cause)
-			__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_SSCOFPMF, true);
-	}
+#undef __check_priv_csr
 
-	/* Detect if hart supports time CSR */
-	csr_read_allowed(CSR_TIME, (unsigned long)&trap);
-	if (!trap.cause)
-		__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_ZICNTR, true);
+#define __check_ext_csr(__base_priv, __csr, __ext)			\
+	if (hfeatures->priv_version >= __base_priv) {			\
+		csr_read_allowed(__csr, (ulong)&trap);			\
+		if (!trap.cause)					\
+			__sbi_hart_update_extension(hfeatures,		\
+						    __ext, true);	\
+	}								\
 
+	/* Counter overflow/filtering is not useful without mcounter/inhibit */
+	/* Detect if hart supports sscofpmf */
+	__check_ext_csr(SBI_HART_PRIV_VER_1_11,
+		        CSR_SCOUNTOVF, SBI_HART_EXT_SSCOFPMF);
+	/* Detect if hart supports time CSR */
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_TIME, SBI_HART_EXT_ZICNTR);
 	/* Detect if hart has AIA local interrupt CSRs */
-	csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
-	if (!trap.cause)
-		__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_SMAIA, true);
-
+	__check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_MTOPI, SBI_HART_EXT_SMAIA);
 	/* Detect if hart supports stimecmp CSR(Sstc extension) */
-	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
-		csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
-		if (!trap.cause)
-			__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_SSTC, true);
-	}
-
+	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
+			CSR_STIMECMP, SBI_HART_EXT_SSTC);
 	/* Detect if hart supports mstateen CSRs */
-	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
-		val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
-		if (!trap.cause)
-			__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_SMSTATEEN, true);
-	}
-
+	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
+			CSR_MSTATEEN0, SBI_HART_EXT_SMSTATEEN);
 	/* Detect if hart supports smcntrpmf */
-	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
-		csr_read_allowed(CSR_MCYCLECFG, (unsigned long)&trap);
-		if (!trap.cause)
-			__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_SMCNTRPMF, true);
-	}
+	__check_ext_csr(SBI_HART_PRIV_VER_1_12,
+			CSR_MCYCLECFG, SBI_HART_EXT_SMCNTRPMF);
+
+#undef __check_ext_csr
 
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
-- 
2.17.1


