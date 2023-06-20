From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Jun 2023 20:02:09 +0530
Subject: [PATCH 3/6] include: sbi: Add Smepmp specific access flags for PMP entries
In-Reply-To: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
References: <20230620143212.2701598-1-hchauhan@ventanamicro.com>
Message-ID: <20230620143212.2701598-4-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Smepmp specification defines a truth table based on which the access is allowed to
different modes. This patch adds different flags based on this truth table.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_domain.h | 51 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index b05bcf4..24d3dc1 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -43,6 +43,51 @@ struct sbi_domain_memregion {
 #define SBI_DOMAIN_MEMREGION_SU_WRITABLE	(1UL << 4)
 #define SBI_DOMAIN_MEMREGION_SU_EXECUTABLE	(1UL << 5)
 
+#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0x3fUL)
+#define SBI_DOMAIN_MEMREGION_M_ACCESS_MASK	(0x7UL)
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK	(0x38UL)
+
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT	(3)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_RDONLY	\
+					(SBI_DOMAIN_MEMREGION_M_READABLE | \
+					 SBI_DOMAIN_MEMREGION_SU_READABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX	\
+					(SBI_DOMAIN_MEMREGION_M_READABLE   | \
+					 SBI_DOMAIN_MEMREGION_M_EXECUTABLE | \
+					 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MX	\
+					(SBI_DOMAIN_MEMREGION_M_EXECUTABLE | \
+					 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW	\
+					(SBI_DOMAIN_MEMREGION_M_READABLE | \
+					 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
+					 SBI_DOMAIN_MEMREGION_SU_READABLE| \
+					 SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW	\
+					(SBI_DOMAIN_MEMREGION_M_READABLE | \
+					 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
+					 SBI_DOMAIN_MEMREGION_SU_READABLE)
+
+#define SBI_DOMAIN_MEMREGION_IS_SHARED(_flags)	\
+	((_flags == SBI_DOMAIN_MEMREGION_SHARED_RDONLY)  || \
+	 (_flags == SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX) || \
+	 (_flags == SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)  || \
+	 (_flags == SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)|| \
+	 (_flags == SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW))
+
+#define SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(__flags) \
+	((__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) && \
+	 !(__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK))
+
+#define SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(__flags) \
+	((__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)  && \
+	 !(__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
+
 /** Bit to control if permissions are enforced on all modes */
 #define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
 
@@ -78,12 +123,6 @@ struct sbi_domain_memregion {
 				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
 				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
 
-#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0x3fUL)
-#define SBI_DOMAIN_MEMREGION_M_ACCESS_MASK	(0x7UL)
-#define SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK	(0x38UL)
-
-#define SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT	(3)
-
 #define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
 	unsigned long flags;
 };
-- 
2.34.1


