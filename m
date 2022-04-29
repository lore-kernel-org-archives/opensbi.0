From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Apr 2022 21:21:46 +0530
Subject: [PATCH 06/11] lib: sbi: Remove MENVCFG hart feature
In-Reply-To: <20220429155151.314788-1-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
Message-ID: <20220429155151.314788-7-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a hart implements privileged spec v1.12 (or higher) then we can
safely assume that menvcfg CSR is present and we don't need MENVCFG
as a hart feature.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h |  6 ++----
 lib/sbi/sbi_hart.c     | 32 ++++++++++++--------------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index bc6b766..c985674 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -32,12 +32,10 @@ enum sbi_hart_features {
 	SBI_HART_HAS_TIME = (1 << 1),
 	/** HART has AIA local interrupt CSRs */
 	SBI_HART_HAS_AIA = (1 << 2),
-	/** HART has menvcfg CSR */
-	SBI_HART_HAS_MENVCFG = (1 << 3),
 	/** HART has mstateen CSR **/
-	SBI_HART_HAS_SMSTATEEN = (1 << 4),
+	SBI_HART_HAS_SMSTATEEN = (1 << 3),
 	/** HART has SSTC extension implemented in hardware */
-	SBI_HART_HAS_SSTC = (1 << 5),
+	SBI_HART_HAS_SSTC = (1 << 4),
 
 	/** Last index of Hart features*/
 	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_SSTC,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0fe88cb..5ee5ddd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -97,10 +97,8 @@ static void mstatus_init(struct sbi_scratch *scratch)
 		mstateen_val |= ((uint64_t)csr_read(CSR_MSTATEEN0H)) << 32;
 #endif
 		mstateen_val |= SMSTATEEN_STATEN;
-		if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG))
-			mstateen_val |= SMSTATEEN0_HSENVCFG;
-		else
-			mstateen_val &= ~SMSTATEEN0_HSENVCFG;
+		mstateen_val |= SMSTATEEN0_HSENVCFG;
+
 		if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
 			mstateen_val |= (SMSTATEEN0_AIA | SMSTATEEN0_SVSLCT |
 					SMSTATEEN0_IMSIC);
@@ -113,7 +111,7 @@ static void mstatus_init(struct sbi_scratch *scratch)
 #endif
 	}
 
-	if (sbi_hart_has_feature(scratch, SBI_HART_HAS_MENVCFG)) {
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
 		menvcfg_val = csr_read(CSR_MENVCFG);
 
 		/*
@@ -413,9 +411,6 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
 	case SBI_HART_HAS_SSTC:
 		fstr = "sstc";
 		break;
-	case SBI_HART_HAS_MENVCFG:
-		fstr = "menvcfg";
-		break;
 	case SBI_HART_HAS_SMSTATEEN:
 		fstr = "smstateen";
 		break;
@@ -616,13 +611,11 @@ __mhpm_skip:
 	    (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_10))
 		hfeatures->priv_version = SBI_HART_PRIV_VER_1_11;
 
-	/* Detect if hart has menvcfg CSR */
+	/* Detect if hart supports Priv v1.12 */
 	csr_read_allowed(CSR_MENVCFG, (unsigned long)&trap);
 	if (!trap.cause &&
-	    (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11)) {
+	    (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11))
 		hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
-		hfeatures->features |= SBI_HART_HAS_MENVCFG;
-	}
 
 	/* Counter overflow/filtering is not useful without mcounter/inhibit */
 	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
@@ -644,20 +637,19 @@ __mhpm_skip:
 	hfeatures->features |= SBI_HART_HAS_AIA;
 __aia_skip:
 
-	/**
-	 * Detect if hart supports stimecmp CSR(Sstc extension) and menvcfg is
-	 * implemented.
-	 */
-	if (hfeatures->features & SBI_HART_HAS_MENVCFG) {
+	/* Detect if hart supports stimecmp CSR(Sstc extension) */
+	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
 		csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
 		if (!trap.cause)
 			hfeatures->features |= SBI_HART_HAS_SSTC;
 	}
 
 	/* Detect if hart supports mstateen CSRs */
-	val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
-	if (!trap.cause)
-		hfeatures->features |= SBI_HART_HAS_SMSTATEEN;
+	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
+		val = csr_read_allowed(CSR_MSTATEEN0, (unsigned long)&trap);
+		if (!trap.cause)
+			hfeatures->features |= SBI_HART_HAS_SMSTATEEN;
+	}
 
 	return;
 }
-- 
2.34.1


