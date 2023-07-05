From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  5 Jul 2023 17:28:05 +0530
Subject: [PATCH 4/4] lib: sbi: Rename hart_pmu_get_allowed_bits() function
In-Reply-To: <20230705115805.1054915-1-apatel@ventanamicro.com>
References: <20230705115805.1054915-1-apatel@ventanamicro.com>
Message-ID: <20230705115805.1054915-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hart_pmu_get_allowed_bits() function detects implemented bits
of mhpm counters so let us rename this function accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 380e615..25277a5 100644
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


