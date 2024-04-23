From: Xiang W <wxjstz@126.com>
Date: Tue, 23 Apr 2024 22:57:41 +0800
Subject: [PATCH v2 5/5] lib: sbi: Fixed memory permission check in sbi_dbtr_setup_shmem
In-Reply-To: <20240423145743.392718-1-wxjstz@126.com>
References: <20240423145743.392718-1-wxjstz@126.com>
Message-ID: <20240423145743.392718-6-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The previous code detected shmem_phys_hi and shmem_phys_lo as two
addresses. fix this bug

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_dbtr.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 29be9bb..f1b53e9 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -293,17 +293,11 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
 	if (shmem_phys_lo & SBI_DBTR_SHMEM_ALIGN_MASK)
 		return SBI_ERR_INVALID_PARAM;
 
-	if (dom && !sbi_domain_check_addr(dom, shmem_phys_lo, smode,
-					  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+	if (dom && !sbi_domain_check_addr(dom,
+		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
+		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	if (shmem_phys_hi != SBI_DBTR_SHMEM_INVALID_ADDR) {
-		if (dom &&
-		    !sbi_domain_check_addr(dom, shmem_phys_hi, smode,
-					   SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
-			return SBI_ERR_INVALID_ADDRESS;
-	}
-
 	hart_state = dbtr_thishart_state_ptr();
 	if (!hart_state)
 		return SBI_ERR_FAILED;
-- 
2.43.0


