From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 19 Oct 2020 18:24:41 +0530
Subject: [PATCH v3 04/16] lib: sbi: Remove redundant hartid parameter from
 sbi_hart_init()
In-Reply-To: <20201019125453.2460105-1-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
Message-ID: <20201019125453.2460105-5-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hartid parameter of sbi_hart_init() is not used anywhere in
sbi_hart_init() implementation so let's remove it.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_hart.h |  2 +-
 lib/sbi/sbi_hart.c     | 14 +++++++-------
 lib/sbi/sbi_init.c     |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 9207f4c..2efe44d 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -27,7 +27,7 @@ enum sbi_hart_features {
 
 struct sbi_scratch;
 
-int sbi_hart_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot);
+int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
 extern void (*sbi_hart_expected_trap)(void);
 static inline ulong sbi_hart_expected_trap_addr(void)
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 7244f1c..88ffab0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -33,7 +33,7 @@ struct hart_features {
 };
 static unsigned long hart_features_offset;
 
-static void mstatus_init(struct sbi_scratch *scratch, u32 hartid)
+static void mstatus_init(struct sbi_scratch *scratch)
 {
 	unsigned long mstatus_val = 0;
 
@@ -62,7 +62,7 @@ static void mstatus_init(struct sbi_scratch *scratch, u32 hartid)
 		csr_write(CSR_SATP, 0);
 }
 
-static int fp_init(u32 hartid)
+static int fp_init(struct sbi_scratch *scratch)
 {
 #ifdef __riscv_flen
 	int i;
@@ -83,7 +83,7 @@ static int fp_init(u32 hartid)
 	return 0;
 }
 
-static int delegate_traps(struct sbi_scratch *scratch, u32 hartid)
+static int delegate_traps(struct sbi_scratch *scratch)
 {
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	unsigned long interrupts, exceptions;
@@ -435,7 +435,7 @@ __mhpm_skip:
 		hfeatures->features |= SBI_HART_HAS_TIME;
 }
 
-int sbi_hart_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
+int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	int rc;
 
@@ -452,13 +452,13 @@ int sbi_hart_init(struct sbi_scratch *scratch, u32 hartid, bool cold_boot)
 
 	hart_detect_features(scratch);
 
-	mstatus_init(scratch, hartid);
+	mstatus_init(scratch);
 
-	rc = fp_init(hartid);
+	rc = fp_init(scratch);
 	if (rc)
 		return rc;
 
-	rc = delegate_traps(scratch, hartid);
+	rc = delegate_traps(scratch);
 	if (rc)
 		return rc;
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 85a5f13..5cedb15 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -182,7 +182,7 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, hartid, TRUE);
+	rc = sbi_hart_init(scratch, TRUE);
 	if (rc)
 		sbi_hart_hang();
 
@@ -250,7 +250,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (rc)
 		sbi_hart_hang();
 
-	rc = sbi_hart_init(scratch, hartid, FALSE);
+	rc = sbi_hart_init(scratch, FALSE);
 	if (rc)
 		sbi_hart_hang();
 
-- 
2.25.1


