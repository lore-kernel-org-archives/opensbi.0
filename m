From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Tue, 20 Dec 2022 16:16:24 +0530
Subject: [PATCH 8/9] lib: utils: Add M-mode {R/W} flags to the MMIO regions
In-Reply-To: <20221220104625.80667-1-hchauhan@ventanamicro.com>
References: <20221220104625.80667-1-hchauhan@ventanamicro.com>
Message-ID: <20221220104625.80667-9-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the M-mode readable/writable flags to mmio regions
of various drivers.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 lib/utils/ipi/aclint_mswi.c     |  4 +++-
 lib/utils/irqchip/aplic.c       |  4 +++-
 lib/utils/irqchip/imsic.c       |  4 +++-
 lib/utils/timer/aclint_mtimer.c | 16 ++++++++++++----
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 832e223..c714a89 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -88,7 +88,9 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 		region_size = ((mswi->size - pos) < ACLINT_MSWI_ALIGN) ?
 			      (mswi->size - pos) : ACLINT_MSWI_ALIGN;
 		sbi_domain_memregion_init(mswi->addr + pos, region_size,
-					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					   SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE), &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 0a8469b..858e9b2 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -269,7 +269,9 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	    (last_deleg_irq == aplic->num_source) &&
 	    (first_deleg_irq == 1))) {
 		sbi_domain_memregion_init(aplic->addr, aplic->size,
-					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					   SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE), &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 98f2cb6..ada4f3b 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -313,7 +313,9 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
 		sbi_domain_memregion_init(imsic->regs[i].addr,
 					  imsic->regs[i].size,
-					  SBI_DOMAIN_MEMREGION_MMIO, &reg);
+					  (SBI_DOMAIN_MEMREGION_MMIO |
+					   SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE), &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 1846a9a..84ded4e 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -188,26 +188,34 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
 					mt->mtime_size + mt->mtimecmp_size,
 					MTIMER_REGION_ALIGN,
-					SBI_DOMAIN_MEMREGION_MMIO);
+					(SBI_DOMAIN_MEMREGION_MMIO |
+					 SBI_DOMAIN_MEMREGION_M_READABLE |
+					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
 		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
 					mt->mtime_size + mt->mtimecmp_size,
 					MTIMER_REGION_ALIGN,
-					SBI_DOMAIN_MEMREGION_MMIO);
+					(SBI_DOMAIN_MEMREGION_MMIO |
+					 SBI_DOMAIN_MEMREGION_M_READABLE |
+					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else {
 		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
 						mt->mtime_size, MTIMER_REGION_ALIGN,
-						SBI_DOMAIN_MEMREGION_MMIO);
+						(SBI_DOMAIN_MEMREGION_MMIO |
+						 SBI_DOMAIN_MEMREGION_M_READABLE |
+						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 
 		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
 						mt->mtimecmp_size, MTIMER_REGION_ALIGN,
-						SBI_DOMAIN_MEMREGION_MMIO);
+						(SBI_DOMAIN_MEMREGION_MMIO |
+						 SBI_DOMAIN_MEMREGION_M_READABLE |
+						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	}
-- 
2.39.0


