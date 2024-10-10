From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 10 Oct 2024 14:30:53 +0530
Subject: [PATCH v2 4/9] lib: sbi_domain: Make sbi_domain_root_add_memregion() as local function
In-Reply-To: <20241010090058.179381-1-apatel@ventanamicro.com>
References: <20241010090058.179381-1-apatel@ventanamicro.com>
Message-ID: <20241010090058.179381-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_domain_root_add_memregion() is only used within sbi_domain
implementation so rename and make it a local function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/sbi_domain.h | 10 ----------
 lib/sbi/sbi_domain.c     |  4 ++--
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index d92f309a..fc349820 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -292,16 +292,6 @@ void sbi_domain_dump_all(const char *suffix);
 int sbi_domain_register(struct sbi_domain *dom,
 			const struct sbi_hartmask *assign_mask);
 
-/**
- * Add a memory region to the root domain
- * @param reg pointer to the memory region to be added
- *
- * @return 0 on success
- * @return SBI_EALREADY if memory region conflicts with the existing one
- * @return SBI_EINVAL otherwise
- */
-int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg);
-
 /**
  * Add a memory range with its flags to the root domain
  * @param addr start physical address of memory range
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index feb23921..a1db1310 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -589,7 +589,7 @@ int sbi_domain_register(struct sbi_domain *dom,
 	return 0;
 }
 
-int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
+static int root_add_memregion(const struct sbi_domain_memregion *reg)
 {
 	int rc;
 	bool reg_merged;
@@ -667,7 +667,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 				(end - pos) : align;
 
 		sbi_domain_memregion_init(pos, rsize, region_flags, &reg);
-		rc = sbi_domain_root_add_memregion(&reg);
+		rc = root_add_memregion(&reg);
 		if (rc)
 			return rc;
 		pos += rsize;
-- 
2.43.0


