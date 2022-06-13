From: Samuel Holland <samuel@sholland.org>
Date: Sun, 12 Jun 2022 19:38:38 -0500
Subject: [PATCH] lib: sbi: Fix version dependency for Sscofpmf
Message-ID: <20220613003838.13028-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

mcounteren was added in the privileged spec v1.10 and mcountinhibit was
added in v1.11. Sscofpmf does not depend on anything in v1.12, so the
minimum privileged spec version should have been v1.11.

Fixes: d4b563c881d6 ("lib: sbi: Remove MCOUNTEREN and SCOUNTEREN hart features")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 lib/sbi/sbi_hart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index de86fee..5bc6d52 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -645,7 +645,7 @@ __mhpm_skip:
 		hfeatures->priv_version = SBI_HART_PRIV_VER_1_12;
 
 	/* Counter overflow/filtering is not useful without mcounter/inhibit */
-	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
+	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_11) {
 		/* Detect if hart supports sscofpmf */
 		csr_read_allowed(CSR_SCOUNTOVF, (unsigned long)&trap);
 		if (!trap.cause)
-- 
2.35.1


