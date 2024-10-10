From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:52 +0530
Subject: [PATCH v2 3/9] lib: utils/irqchip: Use sbi_domain_root_add_memrange() for APLIC
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_root_add_memrange() should be preferred for creating
multiple memregions over a range. Update APLIC driver to use
sbi_domain_root_add_memrange() instead of explicitly registering
memregions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/utils/irqchip/aplic.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 10236e7a..28f2f26d 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -169,7 +169,6 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
 	u32 i, j, tmp;
-	struct sbi_domain_memregion reg;
 	struct aplic_delegate_data *deleg;
 	u32 first_deleg_irq, last_deleg_irq;
 
@@ -268,12 +267,10 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	    ((first_deleg_irq < last_deleg_irq) &&
 	    (last_deleg_irq == aplic->num_source) &&
 	    (first_deleg_irq == 1))) {
-		sbi_domain_memregion_init(aplic->addr, aplic->size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
+		rc = sbi_domain_root_add_memrange(aplic->addr, aplic->size, PAGE_SIZE,
+						  SBI_DOMAIN_MEMREGION_MMIO |
+						  SBI_DOMAIN_MEMREGION_M_READABLE |
+						  SBI_DOMAIN_MEMREGION_M_WRITABLE);
 		if (rc)
 			return rc;
 	}
-- 
2.43.0


