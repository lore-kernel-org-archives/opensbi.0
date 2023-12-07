From: Yangyu Chen <cyy@cyyself.name>
Date: Fri,  8 Dec 2023 06:04:08 +0800
Subject: [PATCH 4/7] lib: sbi: probe PMP allowed addr from first usable PMP
In-Reply-To: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com>
Message-ID: <tencent_A07C3A8220DA838EA8B85431CA21988DD608@qq.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some PMPs may be locked before OpenSBI starts. Probe allowed addr only
from pmpaddr0 may get the wrong result since it may be locked thus the
value can not be changed.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 lib/sbi/sbi_hart.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index f18a6bc..f8f7b82 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -784,23 +784,10 @@ static unsigned long hart_pmp_probe_reserved(unsigned int nr_pmps)
 	return pmpcfg_locked;
 }
 
-static unsigned long hart_pmp_get_allowed_addr(void)
+static unsigned long hart_pmp_get_allowed_addr(unsigned int n)
 {
-	unsigned long val = 0;
-	struct sbi_trap_info trap = {0};
-
-	csr_write_allowed(CSR_PMPCFG0, (ulong)&trap, 0);
-	if (trap.cause)
-		return 0;
-
-	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap, PMP_ADDR_MASK);
-	if (!trap.cause) {
-		val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
-		if (trap.cause)
-			val = 0;
-	}
-
-	return val;
+	csr_write_num(CSR_PMPADDR0 + n, PMP_ADDR_MASK);
+	return csr_read_num(CSR_PMPADDR0 + n);
 }
 
 static int hart_mhpm_get_allowed_bits(void)
@@ -926,10 +913,12 @@ __pmp_count_probed:
 	 * Detect the allowed address bits & granularity. At least PMPADDR0
 	 * should be implemented.
 	 */
-	val = hart_pmp_get_allowed_addr();
-	if (val) {
-		hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
-		hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
+	if (hfeatures->pmp_reserved != hfeatures->pmp_count) {
+		val = hart_pmp_get_allowed_addr(hfeatures->pmp_reserved);
+		if (val) {
+			hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
+			hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
+		}
 	}
 	/* Detect number of MHPM counters */
 	__check_hpm_csr(CSR_MHPMCOUNTER3, mhpm_mask);
-- 
2.43.0


