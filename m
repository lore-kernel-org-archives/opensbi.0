From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 29 Apr 2022 21:21:49 +0530
Subject: [PATCH 09/11] lib: sbi: Detect hart features only once for each hart
In-Reply-To: <20220429155151.314788-1-apatel@ventanamicro.com>
References: <20220429155151.314788-1-apatel@ventanamicro.com>
Message-ID: <20220429155151.314788-10-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the hart_detect_features() is called everytime a hart
is stopped and started again which is unnecessary work.

We update hart_detect_features() to detect hart features only
once for each hart.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 956d185..28a7e75 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -28,6 +28,7 @@ extern void __sbi_expected_trap_hext(void);
 void (*sbi_hart_expected_trap)(void) = &__sbi_expected_trap;
 
 struct hart_features {
+	bool detected;
 	int priv_version;
 	unsigned long extensions;
 	unsigned int pmp_count;
@@ -510,11 +511,15 @@ static int hart_pmu_get_allowed_bits(void)
 static void hart_detect_features(struct sbi_scratch *scratch)
 {
 	struct sbi_trap_info trap = {0};
-	struct hart_features *hfeatures;
+	struct hart_features *hfeatures =
+		sbi_scratch_offset_ptr(scratch, hart_features_offset);
 	unsigned long val, oldval;
 
-	/* Reset hart features */
-	hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
+	/* If hart features already detected then do nothing */
+	if (hfeatures->detected)
+		return;
+
+	/* Clear hart features */
 	hfeatures->extensions = 0;
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_count = 0;
@@ -642,6 +647,9 @@ __mhpm_skip:
 			hfeatures->extensions |= BIT(SBI_HART_EXT_SMSTATEEN);
 	}
 
+	/* Mark hart feature detection done */
+	hfeatures->detected = true;
+
 	return;
 }
 
-- 
2.34.1


