From: Xiang W <wxjstz@126.com>
Date: Tue, 23 Apr 2024 22:51:39 +0800
Subject: [PATCH 1/5] lib: sbi: fix hart_shmem_base
In-Reply-To: <20240423145147.391425-1-wxjstz@126.com>
References: <20240423145147.391425-1-wxjstz@126.com>
Message-ID: <20240423145147.391425-2-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When only phys_hi is equal to SBI_DBTR_SHMEM_INVALID_ADDR, it may be
a legal address. The old code would modify the legal address.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 7142fed..5b07285 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -84,21 +84,18 @@ static inline void sbi_dbtr_disable_shmem(void)
 
 static inline void *hart_shmem_base(void)
 {
-	struct sbi_dbtr_shmem* shmem;
 	unsigned long phys_hi, phys_lo;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
 	hs = dbtr_get_hart_state_ptr(sbi_scratch_thishart_ptr());
-
 	if (!hs)
 		return NULL;
 
-	shmem = &hs->shmem;
+	phys_hi = hs->shmem.phys_hi;
+	phys_lo = hs->shmem.phys_lo;
 
-	phys_hi = (shmem->phys_hi == SBI_DBTR_SHMEM_INVALID_ADDR
-		   ? shmem->phys_hi : 0);
-	phys_lo = (shmem->phys_lo == SBI_DBTR_SHMEM_INVALID_ADDR
-		   ? 0 : shmem->phys_lo);
+	if (phys_hi == SBI_DBTR_SHMEM_INVALID_ADDR && phys_hi == phys_lo)
+		return NULL;
 
 	return ((void *)(unsigned long)DBTR_SHMEM_MAKE_PHYS(phys_hi, phys_lo));
 }
-- 
2.43.0


