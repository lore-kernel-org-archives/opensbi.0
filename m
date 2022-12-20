From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Dec 2022 16:16:17 +0530
Subject: [PATCH 1/9] include: sbi: Fine grain the permissions for M and SU modes
In-Reply-To: <20221220104625.80667-1-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com>
Message-ID: <20221220104625.80667-2-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split the permissions for M-mode and SU-mode. This would
help if different sections of OpenSBI need to be given
different permissions and if M-mode has different permisssions
than the SU-mode over a region.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/sbi/sbi_domain.h | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 5553d21..955ffa3 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -36,11 +36,41 @@ struct sbi_domain_memregion {
 	 */
 	unsigned long base;
 	/** Flags representing memory region attributes */
-#define SBI_DOMAIN_MEMREGION_READABLE		(1UL << 0)
-#define SBI_DOMAIN_MEMREGION_WRITEABLE		(1UL << 1)
-#define SBI_DOMAIN_MEMREGION_EXECUTABLE		(1UL << 2)
-#define SBI_DOMAIN_MEMREGION_MMODE		(1UL << 3)
-#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0xfUL)
+#define SBI_DOMAIN_MEMREGION_M_READABLE		(1UL << 0)
+#define SBI_DOMAIN_MEMREGION_M_WRITABLE		(1UL << 1)
+#define SBI_DOMAIN_MEMREGION_M_EXECUTABLE	(1UL << 2)
+#define SBI_DOMAIN_MEMREGION_SU_READABLE	(1UL << 3)
+#define SBI_DOMAIN_MEMREGION_SU_WRITABLE	(1UL << 4)
+#define SBI_DOMAIN_MEMREGION_SU_EXECUTABLE	(1UL << 5)
+
+	/** Bit to control if permissions are enforced on all modes */
+#define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
+
+#define SBI_DOMAIN_MEMREGION_M_RWX		(SBI_DOMAIN_MEMREGION_M_READABLE | \
+						 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
+						 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+
+	/* Unrestricted M-mode accesses but enfoced on SU-mode */
+#define SBI_DOMAIN_MEMREGION_READABLE		(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+						 SBI_DOMAIN_MEMREGION_M_RWX)
+#define SBI_DOMAIN_MEMREGION_WRITEABLE		(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+						 SBI_DOMAIN_MEMREGION_M_RWX)
+#define SBI_DOMAIN_MEMREGION_EXECUTABLE		(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
+						 SBI_DOMAIN_MEMREGION_M_RWX)
+
+	/* Enforced accesses across all modes */
+#define SBI_DOMAIN_MEMREGION_ENF_READABLE	(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+						 SBI_DOMAIN_MEMREGION_M_READABLE)
+#define SBI_DOMAIN_MEMREGION_ENF_WRITABLE	(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+						 SBI_DOMAIN_MEMREGION_M_WRITABLE)
+#define SBI_DOMAIN_MEMREGION_ENF_EXECUTABLE	(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
+						 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0x3fUL)
+#define SBI_DOMAIN_MEMREGION_M_ACCESS_MASK	(0x7UL)
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK	(0x38UL)
+
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT	(3)
 
 #define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
 	unsigned long flags;
-- 
2.39.0


