From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu,  7 Sep 2023 17:19:41 +0530
Subject: [PATCH v1 1/7] include: sbi_domain: Fix permission test macros
In-Reply-To: <20230907114947.1705425-1-mchitale@ventanamicro.com>
References: <20230907114947.1705425-1-mchitale@ventanamicro.com>
Message-ID: <20230907114947.1705425-2-mchitale@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The macros to test permissions must perform an exact match of all the
bits in the input with the desired permission bits. Otherwise, the check
returns false positives in those cases where only some of the desired
permissions are set in the input.

Fixes: 6c202c5 ("include: sbi: Add Smepmp specific access flags for PMP
entries")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 include/sbi/sbi_domain.h | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index da2a65a..8bd999a 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -74,33 +74,29 @@ struct sbi_domain_memregion {
 		 SBI_DOMAIN_MEMREGION_SU_READABLE)
 
 	/* Shared read-only region between M and SU mode */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MR(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_M_READABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_READABLE))
+#define SBI_DOMAIN_MEMREGION_IS_SUR_MR(__flags)			 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_RDONLY)
 
 	/* Shared region: SU execute-only and M read/execute */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MRX(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_M_READABLE) &&		\
-		 (__flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+#define SBI_DOMAIN_MEMREGION_IS_SUX_MRX(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX)
 
 	/* Shared region: SU and M execute-only */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MX(__flags)				\
-		((__flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+#define SBI_DOMAIN_MEMREGION_IS_SUX_MX(__flags)			 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)
 
 	/* Shared region: SU and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SURW_MRW(__flags)		\
-		((__flags & SBI_DOMAIN_MEMREGION_M_READABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_M_WRITABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_READABLE) &	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE))
+#define SBI_DOMAIN_MEMREGION_IS_SURW_MRW(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)
 
 	/* Shared region: SU read-only and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MRW(__flags)		\
-		((__flags & SBI_DOMAIN_MEMREGION_M_READABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_M_WRITABLE) &&	\
-		 (__flags & SBI_DOMAIN_MEMREGION_SU_READABLE))
+#define SBI_DOMAIN_MEMREGION_IS_SUR_MRW(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW)
 
 	/*
 	 * Check if region flags match with any of the above
-- 
2.34.1


