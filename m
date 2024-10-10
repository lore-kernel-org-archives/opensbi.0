From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:50 +0530
Subject: [PATCH v2 1/9] lib: utils/ipi: Use sbi_domain_root_add_memrange() for ACLINT mswi
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-2-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_root_add_memrange() should be preferred for creating
multiple memregions over a range. Update ACLINT mswi driver to use
sbi_domain_root_add_memrange() instead of explicitly registering
memregions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/utils/ipi/aclint_mswi.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index c8ebb7ac..0ef3d003 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -84,8 +84,6 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	u32 i;
 	int rc;
 	struct sbi_scratch *scratch;
-	unsigned long pos, region_size;
-	struct sbi_domain_memregion reg;
 
 	/* Sanity checks */
 	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
@@ -114,18 +112,12 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	}
 
 	/* Add MSWI regions to the root domain */
-	for (pos = 0; pos < mswi->size; pos += ACLINT_MSWI_ALIGN) {
-		region_size = ((mswi->size - pos) < ACLINT_MSWI_ALIGN) ?
-			      (mswi->size - pos) : ACLINT_MSWI_ALIGN;
-		sbi_domain_memregion_init(mswi->addr + pos, region_size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
-		if (rc)
-			return rc;
-	}
+	rc = sbi_domain_root_add_memrange(mswi->addr, mswi->size, ACLINT_MSWI_ALIGN,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_M_READABLE |
+					  SBI_DOMAIN_MEMREGION_M_WRITABLE);
+	if (rc)
+		return rc;
 
 	sbi_ipi_set_device(&aclint_mswi);
 
-- 
2.43.0


