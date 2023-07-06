From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  6 Jul 2023 09:45:42 +0530
Subject: [PATCH v2 4/4] lib: sbi: Rename hart_pmu_get_allowed_bits() function
In-Reply-To: <20230706041542.1069059-1-apatel@ventanamicro.com>
References: <20230706041542.1069059-1-apatel@ventanamicro.com>
Message-ID: <20230706041542.1069059-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hart_pmu_get_allowed_bits() function detects implemented bits
of mhpm counters so let us rename this function accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_hart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 2eacefb..e9b2b27 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -527,7 +527,7 @@ static unsigned long hart_pmp_get_allowed_addr(void)
 	return val;
 }
 
-static int hart_pmu_get_allowed_bits(void)
+static int hart_mhpm_get_allowed_bits(void)
 {
 	unsigned long val = ~(0UL);
 	struct sbi_trap_info trap = {0};
@@ -628,7 +628,7 @@ __pmp_skip:
 
 	/* Detect number of MHPM counters */
 	__check_csr(CSR_MHPMCOUNTER3, 0, 1UL, mhpm_count, __mhpm_skip);
-	hfeatures->mhpm_bits = hart_pmu_get_allowed_bits();
+	hfeatures->mhpm_bits = hart_mhpm_get_allowed_bits();
 
 	__check_csr_4(CSR_MHPMCOUNTER4, 0, 1UL, mhpm_count, __mhpm_skip);
 	__check_csr_8(CSR_MHPMCOUNTER8, 0, 1UL, mhpm_count, __mhpm_skip);
-- 
2.34.1


