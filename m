From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 17 Aug 2022 13:20:01 +0200
Subject: [PATCH v2 2/5] lib: sbi: do platform-specific extension population earlier
In-Reply-To: <20220817112004.745776-1-heiko@sntech.de>
References: <20220817112004.745776-1-heiko@sntech.de>
Message-ID: <20220817112004.745776-3-heiko@sntech.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of the more specific detections in hart_detect_features()
might need to check platform-specific extensions so might need
the platform-extensions being populated earlier.

So move the call to sbi_platform_extensions_init() to an earlier
place.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 lib/sbi/sbi_hart.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 50e5907..5b33623 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -553,6 +553,12 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	hfeatures->pmp_count = 0;
 	hfeatures->mhpm_count = 0;
 
+	/* Let platform populate extensions */
+	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
+					  &hfeatures->extensions);
+	if (rc)
+		return rc;
+
 #define __check_csr(__csr, __rdonly, __wrval, __field, __skip)	\
 	oldval = csr_read_allowed(__csr, (ulong)&trap);			\
 	if (!trap.cause) {						\
@@ -681,12 +687,6 @@ __mhpm_skip:
 					SBI_HART_EXT_SMSTATEEN, true);
 	}
 
-	/* Let platform populate extensions */
-	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
-					  &hfeatures->extensions);
-	if (rc)
-		return rc;
-
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
-- 
2.35.1


