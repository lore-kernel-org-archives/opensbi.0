From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 12 Apr 2021 17:46:12 +0530
Subject: [PATCH v2 2/7] lib: sbi: Add sbi_domain_memregion_init() API
In-Reply-To: <20210412121617.933493-1-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
Message-ID: <20210412121617.933493-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds sbi_domain_memregion_init() helper API which can
be used by platform support to initialize a domain memory region
before adding it to the root domain.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Xiang W <wxjstz@126.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/sbi/sbi_domain.h | 14 +++++++++++++
 lib/sbi/sbi_domain.c     | 45 ++++++++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1f8b942..f9f4f7d 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -127,6 +127,20 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 /** Initialize a domain memory region as firmware region */
 void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg);
 
+/**
+ * Initialize a domain memory region based on it's physical
+ * address and size.
+ *
+ * @param addr start physical address of memory region
+ * @param size physical size of memory region
+ * @param flags memory region flags
+ * @param reg pointer to memory region being initialized
+ */
+void sbi_domain_memregion_init(unsigned long addr,
+				unsigned long size,
+				unsigned long flags,
+				struct sbi_domain_memregion *reg);
+
 /**
  * Check whether we can access specified address for given mode and
  * memory region flags under a domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 2849241..164f35c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -72,6 +72,35 @@ void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg)
 	sbi_memcpy(reg, &root_memregs[ROOT_FW_REGION], sizeof(*reg));
 }
 
+void sbi_domain_memregion_init(unsigned long addr,
+				unsigned long size,
+				unsigned long flags,
+				struct sbi_domain_memregion *reg)
+{
+	unsigned long base = 0, order;
+
+	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
+		if (order < __riscv_xlen) {
+			base = addr & ~((1UL << order) - 1UL);
+			if ((base <= addr) &&
+			    (addr < (base + (1UL << order))) &&
+			    (base <= (addr + size - 1UL)) &&
+			    ((addr + size - 1UL) < (base + (1UL << order))))
+				break;
+		} else {
+			base = 0;
+			break;
+		}
+
+	}
+
+	if (reg) {
+		reg->base = base;
+		reg->order = order;
+		reg->flags = flags;
+	}
+}
+
 bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long addr, unsigned long mode,
 			   unsigned long access_flags)
@@ -507,17 +536,15 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Root domain firmware memory region */
-	root_memregs[ROOT_FW_REGION].order = log2roundup(scratch->fw_size);
-	root_memregs[ROOT_FW_REGION].base = scratch->fw_start &
-				~((1UL << root_memregs[0].order) - 1UL);
-	root_memregs[ROOT_FW_REGION].flags = 0;
+	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size, 0,
+				  &root_memregs[ROOT_FW_REGION]);
 
 	/* Root domain allow everything memory region */
-	root_memregs[ROOT_ALL_REGION].order = __riscv_xlen;
-	root_memregs[ROOT_ALL_REGION].base = 0;
-	root_memregs[ROOT_ALL_REGION].flags = (SBI_DOMAIN_MEMREGION_READABLE |
-						SBI_DOMAIN_MEMREGION_WRITEABLE |
-						SBI_DOMAIN_MEMREGION_EXECUTABLE);
+	sbi_domain_memregion_init(0, ~0UL,
+				  (SBI_DOMAIN_MEMREGION_READABLE |
+				   SBI_DOMAIN_MEMREGION_WRITEABLE |
+				   SBI_DOMAIN_MEMREGION_EXECUTABLE),
+				  &root_memregs[ROOT_ALL_REGION]);
 
 	/* Root domain memory region end */
 	root_memregs[ROOT_END_REGION].order = 0;
-- 
2.25.1


