From: Yangyu Chen <cyy@cyyself.name>
Date: Fri,  8 Dec 2023 06:04:06 +0800
Subject: [PATCH 2/7] lib: sbi: detect the number of PMP entries first
In-Reply-To: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
Message-ID: <tencent_595E4C50085063265F9560B676806315EE06@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To further probe each PMP entry whether is locked or not, we should
detect the number of PMP entries first.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 lib/sbi/sbi_hart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 49d1454..eaa69ad 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -868,6 +868,9 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	__check_csr_32(__csr + 0, __rdonly, __wrval, __field, __skip)	\
 	__check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
 
+	/* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
+	__check_csr_64(CSR_PMPADDR0, true, 0, pmp_count, __pmp_count_probed);
+__pmp_count_probed:
 	/**
 	 * Detect the allowed address bits & granularity. At least PMPADDR0
 	 * should be implemented.
@@ -876,10 +879,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	if (val) {
 		hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
 		hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
-		/* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
-		__check_csr_64(CSR_PMPADDR0, true, 0, pmp_count, __pmp_skip);
 	}
-__pmp_skip:
 	/* Detect number of MHPM counters */
 	__check_hpm_csr(CSR_MHPMCOUNTER3, mhpm_mask);
 	hfeatures->mhpm_bits = hart_mhpm_get_allowed_bits();
-- 
2.43.0


