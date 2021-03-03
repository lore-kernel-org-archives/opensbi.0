From: Anup Patel <anup.patel@wdc.com>
Date: Wed,  3 Mar 2021 17:25:08 +0530
Subject: [PATCH v3 07/11] lib: sbi: Add sbi_hart_reinit() function
In-Reply-To: <20210303115512.470786-1-anup.patel@wdc.com>
References: <20210303115512.470786-1-anup.patel@wdc.com>
Message-ID: <20210303115512.470786-8-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add sbi_hart_reinit() function which will re-initialize HART CSRs
assuming HART features are already detected. This new function will
be useful in re-initializing HART after it resumes from HSM SUSPENDED
state.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_hart.h |  1 +
 lib/sbi/sbi_hart.c     | 29 +++++++++++++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index ec9e30f..031c7b0 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -27,6 +27,7 @@ enum sbi_hart_features {
 
 struct sbi_scratch;
 
+int sbi_hart_reinit(struct sbi_scratch *scratch);
 int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot);
 
 extern void (*sbi_hart_expected_trap)(void);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fc86e9f..d91b08c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -430,10 +430,25 @@ __mhpm_skip:
 		hfeatures->features |= SBI_HART_HAS_TIME;
 }
 
-int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
+int sbi_hart_reinit(struct sbi_scratch *scratch)
 {
 	int rc;
 
+	mstatus_init(scratch);
+
+	rc = fp_init(scratch);
+	if (rc)
+		return rc;
+
+	rc = delegate_traps(scratch);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
+{
 	if (cold_boot) {
 		if (misa_extension('H'))
 			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
@@ -447,17 +462,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 
 	hart_detect_features(scratch);
 
-	mstatus_init(scratch);
-
-	rc = fp_init(scratch);
-	if (rc)
-		return rc;
-
-	rc = delegate_traps(scratch);
-	if (rc)
-		return rc;
-
-	return 0;
+	return sbi_hart_reinit(scratch);
 }
 
 void __attribute__((noreturn)) sbi_hart_hang(void)
-- 
2.25.1


