From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 28 Aug 2020 09:10:08 +0530
Subject: [PATCH v3 1/5] lib: sbi: Remove redundant SBI_HART_HAS_PMP feature
In-Reply-To: <20200828034012.144048-1-anup.patel@wdc.com>
References: <20200828034012.144048-1-anup.patel@wdc.com>
Message-ID: <20200828034012.144048-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI_HART_HAS_PMP feature is redundant because we already
have number of PMP regions returned by sbi_hart_pmp_count().

Checking whether PMP is supported for a HART can be simply done
by checking non-zero value returned by sbi_hart_pmp_count().

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/sbi/sbi_hart.h    |  8 +++-----
 lib/sbi/sbi_hart.c        | 15 +--------------
 lib/utils/fdt/fdt_fixup.c |  2 +-
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 51c2c35..c2ea686 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -14,14 +14,12 @@
 
 /** Possible feature flags of a hart */
 enum sbi_hart_features {
-	/** Hart has PMP support */
-	SBI_HART_HAS_PMP = (1 << 0),
 	/** Hart has S-mode counter enable */
-	SBI_HART_HAS_SCOUNTEREN = (1 << 1),
+	SBI_HART_HAS_SCOUNTEREN = (1 << 0),
 	/** Hart has M-mode counter enable */
-	SBI_HART_HAS_MCOUNTEREN = (1 << 2),
+	SBI_HART_HAS_MCOUNTEREN = (1 << 1),
 	/** HART has timer csr implementation in hardware */
-	SBI_HART_HAS_TIME = (1 << 3),
+	SBI_HART_HAS_TIME = (1 << 2),
 
 	/** Last index of Hart features*/
 	SBI_HART_HAS_LAST_FEATURE = SBI_HART_HAS_TIME,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fa20bd2..80ed86a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -158,9 +158,6 @@ void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
 	unsigned long prot, addr, size;
 	unsigned int i, pmp_count;
 
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_PMP))
-		return;
-
 	pmp_count = sbi_hart_pmp_count(scratch);
 	for (i = 0; i < pmp_count; i++) {
 		pmp_get(i, &prot, &addr, &size);
@@ -190,9 +187,6 @@ int sbi_hart_pmp_check_addr(struct sbi_scratch *scratch, unsigned long addr,
 	unsigned long prot, size, tempaddr;
 	unsigned int i, pmp_count;
 
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_PMP))
-		return SBI_OK;
-
 	pmp_count = sbi_hart_pmp_count(scratch);
 	for (i = 0; i < pmp_count; i++) {
 		pmp_get(i, &prot, &tempaddr, &size);
@@ -213,7 +207,7 @@ static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
 	ulong prot, addr, log2size;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_PMP))
+	if (!sbi_hart_pmp_count(scratch))
 		return 0;
 
 	/* Firmware PMP region to protect OpenSBI firmware */
@@ -276,9 +270,6 @@ static inline char *sbi_hart_feature_id2string(unsigned long feature)
 		return NULL;
 
 	switch (feature) {
-	case SBI_HART_HAS_PMP:
-		fstr = "pmp";
-		break;
 	case SBI_HART_HAS_SCOUNTEREN:
 		fstr = "scounteren";
 		break;
@@ -375,10 +366,6 @@ static void hart_detect_features(struct sbi_scratch *scratch)
 	__detect_pmp(CSR_PMPADDR15);
 #undef __detect_pmp
 
-	/* Set hart PMP feature if we have@least one PMP region */
-	if (hfeatures->pmp_count)
-		hfeatures->features |= SBI_HART_HAS_PMP;
-
 	/* Detect if hart supports SCOUNTEREN feature */
 	trap.cause = 0;
 	val = csr_read_allowed(CSR_SCOUNTEREN, (unsigned long)&trap);
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index a3bccae..4da7397 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -199,7 +199,7 @@ int fdt_reserved_memory_fixup(void *fdt)
 	 * With above assumption, we create child nodes directly.
 	 */
 
-	if (!sbi_hart_has_feature(scratch, SBI_HART_HAS_PMP)) {
+	if (!sbi_hart_pmp_count(scratch)) {
 		/*
 		 * Update the DT with firmware start & size even if PMP is not
 		 * supported. This makes sure that supervisor OS is always
-- 
2.25.1


