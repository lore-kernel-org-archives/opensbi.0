From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  5 Jul 2023 17:28:02 +0530
Subject: [PATCH 1/4] lib: sbi: Add Zicntr as a HART ISA extension
In-Reply-To: <20230705115805.1054915-1-apatel@ventanamicro.com>
References: <20230705115805.1054915-1-apatel@ventanamicro.com>
Message-ID: <20230705115805.1054915-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Recently ratified Zicntr ISA extension covers cycle, time and
instret CSRs so we replace the "time" ISA extension with "zicntr"
ISA extension in OpenSBI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_hart.h | 4 ++--
 lib/sbi/sbi_hart.c     | 6 +++---
 lib/sbi/sbi_timer.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 95b40e7..d48940d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -28,8 +28,8 @@ enum sbi_hart_priv_versions {
 enum sbi_hart_extensions {
 	/** Hart has Sscofpmt extension */
 	SBI_HART_EXT_SSCOFPMF = 0,
-	/** HART has HW time CSR (extension name not available) */
-	SBI_HART_EXT_TIME,
+	/** HART has Zicntr extension (i.e. HW cycle, time & instret CSRs) */
+	SBI_HART_EXT_ZICNTR,
 	/** HART has AIA M-mode CSRs */
 	SBI_HART_EXT_SMAIA,
 	/** HART has Smstateen CSR **/
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6e52cbd..c470482 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -441,8 +441,8 @@ static inline char *sbi_hart_extension_id2string(int ext)
 	case SBI_HART_EXT_SSCOFPMF:
 		estr = "sscofpmf";
 		break;
-	case SBI_HART_EXT_TIME:
-		estr = "time";
+	case SBI_HART_EXT_ZICNTR:
+		estr = "zicntr";
 		break;
 	case SBI_HART_EXT_SMAIA:
 		estr = "smaia";
@@ -676,7 +676,7 @@ __mhpm_skip:
 	csr_read_allowed(CSR_TIME, (unsigned long)&trap);
 	if (!trap.cause)
 		__sbi_hart_update_extension(hfeatures,
-					SBI_HART_EXT_TIME, true);
+					SBI_HART_EXT_ZICNTR, true);
 
 	/* Detect if hart has AIA local interrupt CSRs */
 	csr_read_allowed(CSR_MTOPI, (unsigned long)&trap);
diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 4b24cbe..7b618de 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -188,7 +188,7 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (!time_delta_off)
 			return SBI_ENOMEM;
 
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_TIME))
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR))
 			get_time_val = get_ticks;
 	} else {
 		if (!time_delta_off)
-- 
2.34.1


