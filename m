From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:43 +0530
Subject: [PATCH v1 3/7] lib: sbi: Don't clear mseccfg.MML bit in sbi_hart_smepmp_configure()
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-4-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anup Patel <apatel@ventanamicro.com>

The mseccfg.MML bit is a sticky bit which remains unchanged once set
so no need to clear it in sbi_hart_smepmp_configure().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 lib/sbi/sbi_hart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 48784c8..6320ea6 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,12 +360,10 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	unsigned long pmp_addr;
 
 	/*
-	 * Set the RLB and clear MML so that, we can write to
-	 * entries without enforcement even if some entries
-	 * are locked.
+	 * Set the RLB so that, we can write to PMP entries without
+	 * enforcement even if some entries are locked.
 	 */
 	csr_set(CSR_MSECCFG, MSECCFG_RLB);
-	csr_clear(CSR_MSECCFG, MSECCFG_MML);
 
 	/* Disable the reserved entry */
 	pmp_disable(SBI_SMEPMP_RESV_ENTRY);
-- 
2.34.1


