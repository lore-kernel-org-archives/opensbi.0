From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:44 +0530
Subject: [PATCH v1 4/7] lib: sbi: Fix pmp_flags for Smepmp read-only shared region
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-5-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

The Smepmp read-only shared region must have pmpcfg.L, pmpcfg.R,
pmpcfg.W, and pmpcfg.X bits set so sbi_hart_get_smepmp_flags()
must return pmp_flags accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6320ea6..c8aa342 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -297,7 +297,7 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 	if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
 		/* Read only for both M and SU modes */
 		if (SBI_DOMAIN_MEMREGION_IS_SUR_MR(reg->flags))
-			pmp_flags = (PMP_R | PMP_W | PMP_X);
+			pmp_flags = (PMP_L | PMP_R | PMP_W | PMP_X);
 
 		/* Execute for SU but Read/Execute for M mode */
 		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MRX(reg->flags))
-- 
2.34.1


