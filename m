From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Sep 2024 17:26:53 +0530
Subject: [PATCH 2/9] lib: utils/irqchip: Use sbi_domain_root_add_memrange() for IMSIC
In-Reply-To: <20240923115700.381916-1-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
Message-ID: <20240923115700.381916-3-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_root_add_memrange() should be preferred for creating
multiple memregions over a range. Update IMSIC driver to use
sbi_domain_root_add_memrange() instead of explicity registering
memregions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/irqchip/imsic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index bac72d21..ddb372fb 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -348,7 +348,6 @@ int imsic_data_check(struct imsic_data *imsic)
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
 {
 	int i, rc;
-	struct sbi_domain_memregion reg;
 
 	/* Sanity checks */
 	rc = imsic_data_check(imsic);
@@ -378,13 +377,12 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	/* Add IMSIC regions to the root domain */
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
-		sbi_domain_memregion_init(imsic->regs[i].addr,
-					  imsic->regs[i].size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
+		rc = sbi_domain_root_add_memrange(imsic->regs[i].addr,
+						  imsic->regs[i].size,
+						  IMSIC_MMIO_PAGE_SZ,
+						  SBI_DOMAIN_MEMREGION_MMIO |
+						  SBI_DOMAIN_MEMREGION_M_READABLE |
+						  SBI_DOMAIN_MEMREGION_M_WRITABLE);
 		if (rc)
 			return rc;
 	}
-- 
2.43.0


