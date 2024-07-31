From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:24 -0700
Subject: [PATCH 3/8] lib: sbi: Rename domain_memregion -> memregion
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-4-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that domains and memregions are separated into their own source files,
rename all instances of struct sbi_domain_memregion to just struct sbi_memregion.
Also, rename all of the memregion permission defined from SBI_DOMAIN_MEMREGION_*
to SBI_MEMREGION_*. This makes the code a little less clunky and verbose.
---
 docs/domain_support.md                   |   4 +-
 include/sbi/sbi_domain.h                 |   4 +-
 include/sbi/sbi_memregion.h              | 196 +++++++++++------------
 include/sbi/sbi_platform.h               |   2 +-
 lib/sbi/sbi_domain.c                     |  40 ++---
 lib/sbi/sbi_hart.c                       |  52 +++---
 lib/sbi/sbi_memregion.c                  |  76 ++++-----
 lib/utils/fdt/fdt_domain.c               |  24 +--
 lib/utils/fdt/fdt_fixup.c                |  10 +-
 lib/utils/ipi/aclint_mswi.c              |  12 +-
 lib/utils/ipi/andes_plicsw.c             |   6 +-
 lib/utils/irqchip/aplic.c                |  12 +-
 lib/utils/irqchip/imsic.c                |  13 +-
 lib/utils/irqchip/plic.c                 |   4 +-
 lib/utils/regmap/fdt_regmap_syscon.c     |   4 +-
 lib/utils/serial/cadence-uart.c          |   4 +-
 lib/utils/serial/fdt_serial_htif.c       |   4 +-
 lib/utils/serial/uart8250.c              |   4 +-
 lib/utils/timer/aclint_mtimer.c          |  24 +--
 lib/utils/timer/andes_plmt.c             |   6 +-
 platform/generic/renesas/rzfive/rzfive.c |   2 +-
 platform/generic/sophgo/sg2042.c         |   6 +-
 22 files changed, 254 insertions(+), 255 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index b34e43a..91677d3 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -8,7 +8,7 @@ features such as PMP, ePMP, IOPMP, SiFive Shield, etc.
 
 Important entities which help implement OpenSBI domain support are:
 
-* **struct sbi_domain_memregion** - Representation of a domain memory region
+* **struct sbi_memregion** - Representation of a domain memory region
 * **struct sbi_hartmask** - Representation of domain HART set
 * **struct sbi_domain** - Representation of a domain instance
 
@@ -21,7 +21,7 @@ it is not mandatory for the OpenSBI platform support to populate domains.
 Domain Memory Region
 --------------------
 
-A domain memory region is represented by **struct sbi_domain_memregion** in
+A domain memory region is represented by **struct sbi_memregion** in
 OpenSBI and has following details:
 
 * **order** - The size of a memory region is **2 ^ order** where **order**
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 596bab3..a712504 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -43,7 +43,7 @@ struct sbi_domain {
 	/** Contexts for possible HARTs indexed by hartindex */
 	struct sbi_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
 	/** Array of memory regions terminated by a region with order zero */
-	struct sbi_domain_memregion *regions;
+	struct sbi_memregion *regions;
 	/** HART id of the HART booting this domain */
 	u32 boot_hartid;
 	/** Arg1 (or 'a1' register) of next booting stage for this domain */
@@ -130,7 +130,7 @@ int sbi_domain_register(struct sbi_domain *dom,
  * @return SBI_EALREADY if memory region conflicts with the existing one
  * @return SBI_EINVAL otherwise
  */
-int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg);
+int sbi_domain_root_add_memregion(const struct sbi_memregion *reg);
 
 /**
  * Add a memory range with its flags to the root domain
diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
index 828d556..0aa9a44 100644
--- a/include/sbi/sbi_memregion.h
+++ b/include/sbi/sbi_memregion.h
@@ -13,7 +13,7 @@ enum sbi_domain_access {
 };
 
 /** Representation of OpenSBI domain memory region */
-struct sbi_domain_memregion {
+struct sbi_memregion {
 	/**
 	 * Size of memory region as power of 2
 	 * It has to be minimum 3 and maximum __riscv_xlen
@@ -25,123 +25,123 @@ struct sbi_domain_memregion {
 	 */
 	unsigned long base;
 	/** Flags representing memory region attributes */
-#define SBI_DOMAIN_MEMREGION_M_READABLE		(1UL << 0)
-#define SBI_DOMAIN_MEMREGION_M_WRITABLE		(1UL << 1)
-#define SBI_DOMAIN_MEMREGION_M_EXECUTABLE	(1UL << 2)
-#define SBI_DOMAIN_MEMREGION_SU_READABLE	(1UL << 3)
-#define SBI_DOMAIN_MEMREGION_SU_WRITABLE	(1UL << 4)
-#define SBI_DOMAIN_MEMREGION_SU_EXECUTABLE	(1UL << 5)
-
-#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0x3fUL)
-#define SBI_DOMAIN_MEMREGION_M_ACCESS_MASK	(0x7UL)
-#define SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK	(0x38UL)
-
-#define SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT	(3)
-
-#define SBI_DOMAIN_MEMREGION_SHARED_RDONLY		\
-		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
-		 SBI_DOMAIN_MEMREGION_SU_READABLE)
-
-#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX		\
-		(SBI_DOMAIN_MEMREGION_M_READABLE   |	\
-		 SBI_DOMAIN_MEMREGION_M_EXECUTABLE |	\
-		 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-
-#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MX		\
-		(SBI_DOMAIN_MEMREGION_M_EXECUTABLE |	\
-		 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-
-#define SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW		\
-		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
-		 SBI_DOMAIN_MEMREGION_M_WRITABLE |	\
-		 SBI_DOMAIN_MEMREGION_SU_READABLE|	\
-		 SBI_DOMAIN_MEMREGION_SU_WRITABLE)
-
-#define SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW		\
-		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
-		 SBI_DOMAIN_MEMREGION_M_WRITABLE |	\
-		 SBI_DOMAIN_MEMREGION_SU_READABLE)
+#define SBI_MEMREGION_M_READABLE	(1UL << 0)
+#define SBI_MEMREGION_M_WRITABLE	(1UL << 1)
+#define SBI_MEMREGION_M_EXECUTABLE	(1UL << 2)
+#define SBI_MEMREGION_SU_READABLE	(1UL << 3)
+#define SBI_MEMREGION_SU_WRITABLE	(1UL << 4)
+#define SBI_MEMREGION_SU_EXECUTABLE	(1UL << 5)
+
+#define SBI_MEMREGION_ACCESS_MASK	(0x3fUL)
+#define SBI_MEMREGION_M_ACCESS_MASK	(0x7UL)
+#define SBI_MEMREGION_SU_ACCESS_MASK	(0x38UL)
+
+#define SBI_MEMREGION_SU_ACCESS_SHIFT	(3)
+
+#define SBI_MEMREGION_SHARED_RDONLY		\
+		(SBI_MEMREGION_M_READABLE |	\
+		 SBI_MEMREGION_SU_READABLE)
+
+#define SBI_MEMREGION_SHARED_SUX_MRX		\
+		(SBI_MEMREGION_M_READABLE   |	\
+		 SBI_MEMREGION_M_EXECUTABLE |	\
+		 SBI_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_MEMREGION_SHARED_SUX_MX		\
+		(SBI_MEMREGION_M_EXECUTABLE |	\
+		 SBI_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_MEMREGION_SHARED_SURW_MRW		\
+		(SBI_MEMREGION_M_READABLE |	\
+		 SBI_MEMREGION_M_WRITABLE |	\
+		 SBI_MEMREGION_SU_READABLE|	\
+		 SBI_MEMREGION_SU_WRITABLE)
+
+#define SBI_MEMREGION_SHARED_SUR_MRW		\
+		(SBI_MEMREGION_M_READABLE |	\
+		 SBI_MEMREGION_M_WRITABLE |	\
+		 SBI_MEMREGION_SU_READABLE)
 
 	/* Shared read-only region between M and SU mode */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MR(__flags)			 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_RDONLY)
+#define SBI_MEMREGION_IS_SUR_MR(__flags)		 \
+		((__flags & SBI_MEMREGION_ACCESS_MASK) == \
+		 SBI_MEMREGION_SHARED_RDONLY)
 
 	/* Shared region: SU execute-only and M read/execute */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MRX(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX)
+#define SBI_MEMREGION_IS_SUX_MRX(__flags)		 \
+		((__flags & SBI_MEMREGION_ACCESS_MASK) == \
+		 SBI_MEMREGION_SHARED_SUX_MRX)
 
 	/* Shared region: SU and M execute-only */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MX(__flags)			 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)
+#define SBI_MEMREGION_IS_SUX_MX(__flags)		 \
+		((__flags & SBI_MEMREGION_ACCESS_MASK) == \
+		 SBI_MEMREGION_SHARED_SUX_MX)
 
 	/* Shared region: SU and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SURW_MRW(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)
+#define SBI_MEMREGION_IS_SURW_MRW(__flags)		 \
+		((__flags & SBI_MEMREGION_ACCESS_MASK) == \
+		 SBI_MEMREGION_SHARED_SURW_MRW)
 
 	/* Shared region: SU read-only and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MRW(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW)
+#define SBI_MEMREGION_IS_SUR_MRW(__flags)		 \
+		((__flags & SBI_MEMREGION_ACCESS_MASK) == \
+		 SBI_MEMREGION_SHARED_SUR_MRW)
 
 	/*
 	 * Check if region flags match with any of the above
 	 * mentioned shared region type
 	 */
-#define SBI_DOMAIN_MEMREGION_IS_SHARED(_flags)			\
-		(SBI_DOMAIN_MEMREGION_IS_SUR_MR(_flags)  ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUX_MRX(_flags) ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUX_MX(_flags)  ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SURW_MRW(_flags)||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUR_MRW(_flags))
+#define SBI_MEMREGION_IS_SHARED(_flags)			\
+		(SBI_MEMREGION_IS_SUR_MR(_flags)  ||	\
+		 SBI_MEMREGION_IS_SUX_MRX(_flags) ||	\
+		 SBI_MEMREGION_IS_SUX_MX(_flags)  ||	\
+		 SBI_MEMREGION_IS_SURW_MRW(_flags)||	\
+		 SBI_MEMREGION_IS_SUR_MRW(_flags))
 
-#define SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) &&	\
-		 !(__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK))
+#define SBI_MEMREGION_M_ONLY_ACCESS(__flags)			\
+		((__flags & SBI_MEMREGION_M_ACCESS_MASK) &&	\
+		 !(__flags & SBI_MEMREGION_SU_ACCESS_MASK))
 
-#define SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)  &&	\
-		 !(__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
+#define SBI_MEMREGION_SU_ONLY_ACCESS(__flags)			\
+		((__flags & SBI_MEMREGION_SU_ACCESS_MASK)  &&	\
+		 !(__flags & SBI_MEMREGION_M_ACCESS_MASK))
 
 /** Bit to control if permissions are enforced on all modes */
-#define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
+#define SBI_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
 
-#define SBI_DOMAIN_MEMREGION_M_RWX		\
-				(SBI_DOMAIN_MEMREGION_M_READABLE | \
-				 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+#define SBI_MEMREGION_M_RWX		\
+		(SBI_MEMREGION_M_READABLE | \
+		 SBI_MEMREGION_M_WRITABLE | \
+		 SBI_MEMREGION_M_EXECUTABLE)
 
-#define SBI_DOMAIN_MEMREGION_SU_RWX		\
-				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
-				 SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+#define SBI_MEMREGION_SU_RWX		\
+		(SBI_MEMREGION_SU_READABLE | \
+		 SBI_MEMREGION_SU_WRITABLE | \
+		 SBI_MEMREGION_SU_EXECUTABLE)
 
 /* Unrestricted M-mode accesses but enfoced on SU-mode */
-#define SBI_DOMAIN_MEMREGION_READABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
-#define SBI_DOMAIN_MEMREGION_WRITEABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
-#define SBI_DOMAIN_MEMREGION_EXECUTABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
+#define SBI_MEMREGION_READABLE		\
+		(SBI_MEMREGION_SU_READABLE | \
+		 SBI_MEMREGION_M_RWX)
+#define SBI_MEMREGION_WRITEABLE		\
+		(SBI_MEMREGION_SU_WRITABLE | \
+		 SBI_MEMREGION_M_RWX)
+#define SBI_MEMREGION_EXECUTABLE	\
+		(SBI_MEMREGION_SU_EXECUTABLE | \
+		 SBI_MEMREGION_M_RWX)
 
 /* Enforced accesses across all modes */
-#define SBI_DOMAIN_MEMREGION_ENF_READABLE	\
-				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
-				 SBI_DOMAIN_MEMREGION_M_READABLE)
-#define SBI_DOMAIN_MEMREGION_ENF_WRITABLE	\
-				(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_M_WRITABLE)
-#define SBI_DOMAIN_MEMREGION_ENF_EXECUTABLE	\
-				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
-				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
-
-#define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
+#define SBI_MEMREGION_ENF_READABLE	\
+		(SBI_MEMREGION_SU_READABLE | \
+		 SBI_MEMREGION_M_READABLE)
+#define SBI_MEMREGION_ENF_WRITABLE	\
+		(SBI_MEMREGION_SU_WRITABLE | \
+		 SBI_MEMREGION_M_WRITABLE)
+#define SBI_MEMREGION_ENF_EXECUTABLE	\
+		(SBI_MEMREGION_SU_EXECUTABLE | \
+		 SBI_MEMREGION_M_EXECUTABLE)
+
+#define SBI_MEMREGION_MMIO		(1UL << 31)
 	unsigned long flags;
 };
 
@@ -154,10 +154,10 @@ struct sbi_domain_memregion {
  * @param flags memory region flags
  * @param reg pointer to memory region being initialized
  */
-void sbi_domain_memregion_init(unsigned long addr,
-			       unsigned long size,
-			       unsigned long flags,
-			       struct sbi_domain_memregion *reg);
+void sbi_memregion_init(unsigned long addr,
+			unsigned long size,
+		        unsigned long flags,
+			struct sbi_memregion *reg);
 
 /**
  *
@@ -166,7 +166,7 @@ void sbi_domain_memregion_init(unsigned long addr,
  *
  * @param dom the domain for which to sanitize regions
  */
-int sbi_domain_memregions_sanitize(struct sbi_domain *dom);
+int sbi_memregion_sanitize(struct sbi_domain *dom);
 
 /**
  * Check whether we can access specified address for given mode and
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 7b3ac4b..1814dbd 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -50,7 +50,7 @@
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_trap_ldst.h>
 
-struct sbi_domain_memregion;
+struct sbi_memregion;
 struct sbi_ecall_return;
 struct sbi_trap_regs;
 struct sbi_hart_features;
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 868704e..22d5d8b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -115,7 +115,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 		}
 	}
 
-	rc = sbi_domain_memregions_sanitize(dom);
+	rc = sbi_memregion_sanitize(dom);
 	if (rc) {
 		sbi_printf("%s: %s has unsanitizable regions\n",
 			   __func__, dom->name);
@@ -287,11 +287,11 @@ int sbi_domain_register(struct sbi_domain *dom,
 	return 0;
 }
 
-int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
+int sbi_domain_root_add_memregion(const struct sbi_memregion *reg)
 {
 	int rc;
 	bool reg_merged;
-	struct sbi_domain_memregion *nreg, *nreg1, *nreg2;
+	struct sbi_memregion *nreg, *nreg1, *nreg2;
 
 	/* Sanity checks */
 	if (!reg || domain_finalized || !root.regions ||
@@ -346,7 +346,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 {
 	int rc;
 	unsigned long pos, end, rsize;
-	struct sbi_domain_memregion reg;
+	struct sbi_memregion reg;
 
 	pos = addr;
 	end = addr + size;
@@ -358,7 +358,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
 			rsize = ((end - pos) < align) ?
 				(end - pos) : align;
 
-		sbi_domain_memregion_init(pos, rsize, region_flags, &reg);
+		sbi_memregion_init(pos, rsize, region_flags, &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
@@ -441,7 +441,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	u32 i;
 	int rc;
 	struct sbi_hartmask *root_hmask;
-	struct sbi_domain_memregion *root_memregs;
+	struct sbi_memregion *root_memregs;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	if (scratch->fw_rw_offset == 0 ||
@@ -478,16 +478,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
-	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
-				  &root_memregs[root_memregs_count++]);
+	sbi_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
+			   (SBI_MEMREGION_M_READABLE |
+			    SBI_MEMREGION_M_EXECUTABLE),
+			   &root_memregs[root_memregs_count++]);
 
-	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
-				  (scratch->fw_size - scratch->fw_rw_offset),
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-				  &root_memregs[root_memregs_count++]);
+	sbi_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
+			   (scratch->fw_size - scratch->fw_rw_offset),
+			   (SBI_MEMREGION_M_READABLE |
+			    SBI_MEMREGION_M_WRITABLE),
+			   &root_memregs[root_memregs_count++]);
 
 	root.fw_region_inited = true;
 
@@ -498,11 +498,11 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	 * have access to SU region while previous entries will allow
 	 * access to M-mode regions.
 	 */
-	sbi_domain_memregion_init(0, ~0UL,
-				  (SBI_DOMAIN_MEMREGION_SU_READABLE |
-				   SBI_DOMAIN_MEMREGION_SU_WRITABLE |
-				   SBI_DOMAIN_MEMREGION_SU_EXECUTABLE),
-				  &root_memregs[root_memregs_count++]);
+	sbi_memregion_init(0, ~0UL,
+			   (SBI_MEMREGION_SU_READABLE |
+			    SBI_MEMREGION_SU_WRITABLE |
+			    SBI_MEMREGION_SU_EXECUTABLE),
+			   &root_memregs[root_memregs_count++]);
 
 	/* Root domain memory region end */
 	root_memregs[root_memregs_count].order = 0;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c366701..4dd1a25 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -288,38 +288,38 @@ unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch)
  */
 static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 					      struct sbi_domain *dom,
-					      struct sbi_domain_memregion *reg)
+					      struct sbi_memregion *reg)
 {
 	unsigned int pmp_flags = 0;
 
-	if (SBI_DOMAIN_MEMREGION_IS_SHARED(reg->flags)) {
+	if (SBI_MEMREGION_IS_SHARED(reg->flags)) {
 		/* Read only for both M and SU modes */
-		if (SBI_DOMAIN_MEMREGION_IS_SUR_MR(reg->flags))
+		if (SBI_MEMREGION_IS_SUR_MR(reg->flags))
 			pmp_flags = (PMP_L | PMP_R | PMP_W | PMP_X);
 
 		/* Execute for SU but Read/Execute for M mode */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MRX(reg->flags))
+		else if (SBI_MEMREGION_IS_SUX_MRX(reg->flags))
 			/* locked region */
 			pmp_flags = (PMP_L | PMP_W | PMP_X);
 
 		/* Execute only for both M and SU modes */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUX_MX(reg->flags))
+		else if (SBI_MEMREGION_IS_SUX_MX(reg->flags))
 			pmp_flags = (PMP_L | PMP_W);
 
 		/* Read/Write for both M and SU modes */
-		else if (SBI_DOMAIN_MEMREGION_IS_SURW_MRW(reg->flags))
+		else if (SBI_MEMREGION_IS_SURW_MRW(reg->flags))
 			pmp_flags = (PMP_W | PMP_X);
 
 		/* Read only for SU mode but Read/Write for M mode */
-		else if (SBI_DOMAIN_MEMREGION_IS_SUR_MRW(reg->flags))
+		else if (SBI_MEMREGION_IS_SUR_MRW(reg->flags))
 			pmp_flags = (PMP_W);
-	} else if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+	} else if (SBI_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
 		/*
 		 * When smepmp is supported and used, M region cannot have RWX
 		 * permissions on any region.
 		 */
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK)
-		    == SBI_DOMAIN_MEMREGION_M_RWX) {
+		if ((reg->flags & SBI_MEMREGION_M_ACCESS_MASK)
+		    == SBI_MEMREGION_M_RWX) {
 			sbi_printf("%s: M-mode only regions cannot have"
 				   "RWX permissions\n", __func__);
 			return 0;
@@ -328,18 +328,18 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 		/* M-mode only access regions are always locked */
 		pmp_flags |= PMP_L;
 
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
+		if (reg->flags & SBI_MEMREGION_M_READABLE)
 			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_M_WRITABLE)
 			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_M_EXECUTABLE)
 			pmp_flags |= PMP_X;
-	} else if (SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+	} else if (SBI_MEMREGION_SU_ONLY_ACCESS(reg->flags)) {
+		if (reg->flags & SBI_MEMREGION_SU_READABLE)
 			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_SU_WRITABLE)
 			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
 	}
 
@@ -348,7 +348,7 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 
 static void sbi_hart_smepmp_set(struct sbi_scratch *scratch,
 				struct sbi_domain *dom,
-				struct sbi_domain_memregion *reg,
+				struct sbi_memregion *reg,
 				unsigned int pmp_idx,
 				unsigned int pmp_flags,
 				unsigned int pmp_log2gran,
@@ -371,7 +371,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_log2gran,
 				     unsigned long pmp_addr_max)
 {
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx, pmp_flags;
 
@@ -394,7 +394,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 			break;
 
 		/* Skip shared and SU-only regions */
-		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+		if (!SBI_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
 			pmp_idx++;
 			continue;
 		}
@@ -420,7 +420,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 			break;
 
 		/* Skip M-only regions */
-		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
+		if (SBI_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
 			pmp_idx++;
 			continue;
 		}
@@ -446,7 +446,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 				     unsigned int pmp_log2gran,
 				     unsigned long pmp_addr_max)
 {
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned int pmp_idx = 0;
 	unsigned int pmp_flags;
@@ -462,14 +462,14 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 		 * If permissions are to be enforced for all modes on
 		 * this region, the lock bit should be set.
 		 */
-		if (reg->flags & SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS)
+		if (reg->flags & SBI_MEMREGION_ENF_PERMISSIONS)
 			pmp_flags |= PMP_L;
 
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+		if (reg->flags & SBI_MEMREGION_SU_READABLE)
 			pmp_flags |= PMP_R;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_SU_WRITABLE)
 			pmp_flags |= PMP_W;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
index 1ef53dc..4abd20a 100644
--- a/lib/sbi/sbi_memregion.c
+++ b/lib/sbi/sbi_memregion.c
@@ -4,10 +4,10 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_string.h>
 
-void sbi_domain_memregion_init(unsigned long addr,
+void sbi_memregion_init(unsigned long addr,
 			       unsigned long size,
 			       unsigned long flags,
-			       struct sbi_domain_memregion *reg)
+			       struct sbi_memregion *reg)
 {
 	unsigned long base = 0, order;
 
@@ -34,8 +34,8 @@ void sbi_domain_memregion_init(unsigned long addr,
 }
 
 /** Check if regionA is sub-region of regionB */
-static bool is_region_subset(const struct sbi_domain_memregion *regA,
-			     const struct sbi_domain_memregion *regB)
+static bool is_region_subset(const struct sbi_memregion *regA,
+			     const struct sbi_memregion *regB)
 {
 	ulong regA_start = regA->base;
 	ulong regA_end = regA->base + (BIT(regA->order) - 1);
@@ -52,8 +52,8 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
 }
 
 /** Check if regionA can be replaced by regionB */
-static bool is_region_compatible(const struct sbi_domain_memregion *regA,
-				 const struct sbi_domain_memregion *regB)
+static bool is_region_compatible(const struct sbi_memregion *regA,
+				 const struct sbi_memregion *regB)
 {
 	if (is_region_subset(regA, regB) && regA->flags == regB->flags)
 		return true;
@@ -62,7 +62,7 @@ static bool is_region_compatible(const struct sbi_domain_memregion *regA,
 }
 
 /* Check if region complies with constraints */
-static bool is_region_valid(const struct sbi_domain_memregion *reg)
+static bool is_region_valid(const struct sbi_memregion *reg)
 {
 	if (reg->order < 3 || __riscv_xlen < reg->order)
 		return false;
@@ -77,8 +77,8 @@ static bool is_region_valid(const struct sbi_domain_memregion *reg)
 }
 
 /** Check if regionA should be placed before regionB */
-static bool is_region_before(const struct sbi_domain_memregion *regA,
-			     const struct sbi_domain_memregion *regB)
+static bool is_region_before(const struct sbi_memregion *regA,
+			     const struct sbi_memregion *regB)
 {
 	if (regA->order < regB->order)
 		return true;
@@ -91,26 +91,26 @@ static bool is_region_before(const struct sbi_domain_memregion *regA,
 }
 
 
-static void swap_region(struct sbi_domain_memregion* reg1,
-			struct sbi_domain_memregion* reg2)
+static void swap_region(struct sbi_memregion * reg1,
+			struct sbi_memregion * reg2)
 {
-	struct sbi_domain_memregion treg;
+	struct sbi_memregion treg;
 
 	sbi_memcpy(&treg, reg1, sizeof(treg));
 	sbi_memcpy(reg1, reg2, sizeof(treg));
 	sbi_memcpy(reg2, &treg, sizeof(treg));
 }
 
-static void clear_region(struct sbi_domain_memregion* reg)
+static void clear_region(struct sbi_memregion * reg)
 {
 	sbi_memset(reg, 0x0, sizeof(*reg));
 }
 
-int sbi_domain_memregions_sanitize(struct sbi_domain *dom)
+int sbi_memregion_sanitize(struct sbi_domain *dom)
 {
 	int i, j, count;
 	bool is_covered;
-	struct sbi_domain_memregion *reg, *reg1;
+	struct sbi_memregion *reg, *reg1;
 
 	/* Check memory regions */
 	if (!dom->regions) {
@@ -187,7 +187,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long access_flags)
 {
 	bool rmmio, mmio = false;
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
 
 	if (!dom)
@@ -199,13 +199,13 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 	 * bits will fall at same offsets after the shift.
 	 */
 	if (access_flags & SBI_DOMAIN_READ)
-		rwx |= SBI_DOMAIN_MEMREGION_M_READABLE;
+		rwx |= SBI_MEMREGION_M_READABLE;
 
 	if (access_flags & SBI_DOMAIN_WRITE)
-		rwx |= SBI_DOMAIN_MEMREGION_M_WRITABLE;
+		rwx |= SBI_MEMREGION_M_WRITABLE;
 
 	if (access_flags & SBI_DOMAIN_EXECUTE)
-		rwx |= SBI_DOMAIN_MEMREGION_M_EXECUTABLE;
+		rwx |= SBI_MEMREGION_M_EXECUTABLE;
 
 	if (access_flags & SBI_DOMAIN_MMIO)
 		mmio = true;
@@ -213,15 +213,15 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 	sbi_domain_for_each_memregion(dom, reg) {
 		rflags = reg->flags;
 		rrwx = (mode == PRV_M ?
-					(rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) :
-					(rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
-						>> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
+					(rflags & SBI_MEMREGION_M_ACCESS_MASK) :
+					(rflags & SBI_MEMREGION_SU_ACCESS_MASK)
+						>> SBI_MEMREGION_SU_ACCESS_SHIFT);
 
 		rstart = reg->base;
 		rend = (reg->order < __riscv_xlen) ?
 						     rstart + ((1UL << reg->order) - 1) : -1UL;
 		if (rstart <= addr && addr <= rend) {
-			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
+			rmmio = (rflags & SBI_MEMREGION_MMIO) ? true : false;
 			if (mmio != rmmio)
 				return false;
 			return ((rrwx & rwx) == rwx) ? true : false;
@@ -231,12 +231,12 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 	return (mode == PRV_M) ? true : false;
 }
 
-static const struct sbi_domain_memregion *find_region(
+static const struct sbi_memregion *find_region(
 	const struct sbi_domain *dom,
 	unsigned long addr)
 {
 	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		rstart = reg->base;
@@ -249,12 +249,12 @@ static const struct sbi_domain_memregion *find_region(
 	return NULL;
 }
 
-static const struct sbi_domain_memregion *find_next_subset_region(
+static const struct sbi_memregion *find_next_subset_region(
 	const struct sbi_domain *dom,
-	const struct sbi_domain_memregion *reg,
+	const struct sbi_memregion *reg,
 	unsigned long addr)
 {
-	struct sbi_domain_memregion *sreg, *ret = NULL;
+	struct sbi_memregion *sreg, *ret = NULL;
 
 	sbi_domain_for_each_memregion(dom, sreg) {
 		if (sreg == reg || (sreg->base <= addr) ||
@@ -275,7 +275,7 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 				 unsigned long access_flags)
 {
 	unsigned long max = addr + size;
-	const struct sbi_domain_memregion *reg, *sreg;
+	const struct sbi_memregion *reg, *sreg;
 
 	if (!dom)
 		return false;
@@ -303,7 +303,7 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 void sbi_domain_dump_memregions(const struct sbi_domain *dom, const char *suffix)
 {
 	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	int i = 0, k;
 
 	sbi_domain_for_each_memregion(dom, reg) {
@@ -317,26 +317,26 @@ void sbi_domain_dump_memregions(const struct sbi_domain *dom, const char *suffix
 		k = 0;
 
 		sbi_printf("M: ");
-		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+		if (reg->flags & SBI_MEMREGION_MMIO)
 			sbi_printf("%cI", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
+		if (reg->flags & SBI_MEMREGION_M_READABLE)
 			sbi_printf("%cR", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_M_WRITABLE)
 			sbi_printf("%cW", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_M_EXECUTABLE)
 			sbi_printf("%cX", (k++) ? ',' : '(');
 		sbi_printf("%s ", (k++) ? ")" : "()");
 
 		k = 0;
 		sbi_printf("S/U: ");
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+		if (reg->flags & SBI_MEMREGION_SU_READABLE)
 			sbi_printf("%cR", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_SU_WRITABLE)
 			sbi_printf("%cW", (k++) ? ',' : '(');
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_SU_EXECUTABLE)
 			sbi_printf("%cX", (k++) ? ',' : '(');
 		sbi_printf("%s\n", (k++) ? ")" : "()");
 
 		i++;
 	}
-}
\ No newline at end of file
+}
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 3623c6b..779acec 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -103,9 +103,9 @@ static int __fixup_find_domain_offset(void *fdt, int doff, void *p)
 	return 0;
 }
 
-#define DISABLE_DEVICES_MASK	(SBI_DOMAIN_MEMREGION_READABLE | \
-				 SBI_DOMAIN_MEMREGION_WRITEABLE | \
-				 SBI_DOMAIN_MEMREGION_EXECUTABLE)
+#define DISABLE_DEVICES_MASK	(SBI_MEMREGION_READABLE | \
+				 SBI_MEMREGION_WRITEABLE | \
+				 SBI_MEMREGION_EXECUTABLE)
 
 static int __fixup_count_disable_devices(void *fdt, int doff, int roff,
 					 u32 perm, void *p)
@@ -237,7 +237,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	u64 val64;
 	const u32 *val;
 	struct parse_region_data *preg = opaque;
-	struct sbi_domain_memregion *region;
+	struct sbi_memregion *region;
 
 	/*
 	 * Non-root domains cannot add a region with only M-mode
@@ -247,8 +247,8 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	 * SU permission bits can't be all zeroes when M-mode permission
 	 * bits have at least one bit set.
 	 */
-	if (!(region_access & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
-	    && (region_access & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
+	if (!(region_access & SBI_MEMREGION_SU_ACCESS_MASK)
+	    && (region_access & SBI_MEMREGION_M_ACCESS_MASK))
 		return SBI_EINVAL;
 
 	/* Find next region of the domain */
@@ -274,9 +274,9 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	region->order = val32;
 
 	/* Read "mmio" DT property */
-	region->flags = region_access & SBI_DOMAIN_MEMREGION_ACCESS_MASK;
+	region->flags = region_access & SBI_MEMREGION_ACCESS_MASK;
 	if (fdt_get_property(fdt, region_offset, "mmio", NULL))
-		region->flags |= SBI_DOMAIN_MEMREGION_MMIO;
+		region->flags |= SBI_MEMREGION_MMIO;
 
 	preg->region_count++;
 
@@ -293,7 +293,7 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	struct sbi_hartmask assign_mask;
 	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
 
 	dom = sbi_zalloc(sizeof(*dom));
@@ -362,9 +362,9 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	 * 2) mmio regions protecting M-mode only mmio devices
 	 */
 	sbi_domain_for_each_memregion(&root, reg) {
-		if ((reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE) ||
-		    (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE))
+		if ((reg->flags & SBI_MEMREGION_SU_READABLE) ||
+		    (reg->flags & SBI_MEMREGION_SU_WRITABLE) ||
+		    (reg->flags & SBI_MEMREGION_SU_EXECUTABLE))
 			continue;
 		if (preg.max_regions <= preg.region_count) {
 			err = SBI_EINVAL;
diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index 974b1b8..fd45763 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -282,7 +282,7 @@ static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
  */
 int fdt_reserved_memory_fixup(void *fdt)
 {
-	struct sbi_domain_memregion *reg;
+	struct sbi_memregion *reg;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	unsigned long filtered_base[PMP_COUNT] = { 0 };
 	unsigned char filtered_order[PMP_COUNT] = { 0 };
@@ -343,13 +343,13 @@ int fdt_reserved_memory_fixup(void *fdt)
 	i = 0;
 	sbi_domain_for_each_memregion(dom, reg) {
 		/* Ignore MMIO or READABLE or WRITABLE or EXECUTABLE regions */
-		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+		if (reg->flags & SBI_MEMREGION_MMIO)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_READABLE)
+		if (reg->flags & SBI_MEMREGION_SU_READABLE)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+		if (reg->flags & SBI_MEMREGION_SU_WRITABLE)
 			continue;
-		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+		if (reg->flags & SBI_MEMREGION_SU_EXECUTABLE)
 			continue;
 
 		if (i >= PMP_COUNT) {
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 4ae6bb1..231a1d6 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -85,7 +85,7 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	int rc;
 	struct sbi_scratch *scratch;
 	unsigned long pos, region_size;
-	struct sbi_domain_memregion reg;
+	struct sbi_memregion reg;
 
 	/* Sanity checks */
 	if (!mswi || (mswi->addr & (ACLINT_MSWI_ALIGN - 1)) ||
@@ -117,11 +117,11 @@ int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 	for (pos = 0; pos < mswi->size; pos += ACLINT_MSWI_ALIGN) {
 		region_size = ((mswi->size - pos) < ACLINT_MSWI_ALIGN) ?
 			      (mswi->size - pos) : ACLINT_MSWI_ALIGN;
-		sbi_domain_memregion_init(mswi->addr + pos, region_size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
+		sbi_memregion_init(mswi->addr + pos, region_size,
+				   (SBI_MEMREGION_MMIO |
+				    SBI_MEMREGION_M_READABLE |
+				    SBI_MEMREGION_M_WRITABLE),
+				   &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 413ac20..5ce64fc 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -103,9 +103,9 @@ int plicsw_cold_ipi_init(struct plicsw_data *plicsw)
 	/* Add PLICSW region to the root domain */
 	rc = sbi_domain_root_add_memrange(plicsw->addr, plicsw->size,
 					  PLICSW_REGION_ALIGN,
-					  SBI_DOMAIN_MEMREGION_MMIO |
-					  SBI_DOMAIN_MEMREGION_M_READABLE |
-					  SBI_DOMAIN_MEMREGION_M_WRITABLE);
+					  SBI_MEMREGION_MMIO |
+					  SBI_MEMREGION_M_READABLE |
+					  SBI_MEMREGION_M_WRITABLE);
 	if (rc)
 		return rc;
 
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 10236e7..84cdae0 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -169,7 +169,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
 	u32 i, j, tmp;
-	struct sbi_domain_memregion reg;
+	struct sbi_memregion reg;
 	struct aplic_delegate_data *deleg;
 	u32 first_deleg_irq, last_deleg_irq;
 
@@ -268,11 +268,11 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	    ((first_deleg_irq < last_deleg_irq) &&
 	    (last_deleg_irq == aplic->num_source) &&
 	    (first_deleg_irq == 1))) {
-		sbi_domain_memregion_init(aplic->addr, aplic->size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
+		sbi_memregion_init(aplic->addr, aplic->size,
+				   (SBI_MEMREGION_MMIO |
+				    SBI_MEMREGION_M_READABLE |
+				    SBI_MEMREGION_M_WRITABLE),
+				   &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 7d6993e..d0f2e95 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -348,7 +348,7 @@ int imsic_data_check(struct imsic_data *imsic)
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
 {
 	int i, rc;
-	struct sbi_domain_memregion reg;
+	struct sbi_memregion reg;
 
 	/* Sanity checks */
 	rc = imsic_data_check(imsic);
@@ -378,12 +378,11 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	/* Add IMSIC regions to the root domain */
 	for (i = 0; i < IMSIC_MAX_REGS && imsic->regs[i].size; i++) {
-		sbi_domain_memregion_init(imsic->regs[i].addr,
-					  imsic->regs[i].size,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE),
-					  &reg);
+		sbi_memregion_init(imsic->regs[i].addr, imsic->regs[i].size,
+				   (SBI_MEMREGION_MMIO |
+				    SBI_MEMREGION_M_READABLE |
+				    SBI_MEMREGION_M_WRITABLE),
+				   &reg);
 		rc = sbi_domain_root_add_memregion(&reg);
 		if (rc)
 			return rc;
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 193e320..b1b3ba2 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -174,6 +174,6 @@ int plic_cold_irqchip_init(const struct plic_data *plic)
 		plic_set_priority(plic, i, 0);
 
 	return sbi_domain_root_add_memrange(plic->addr, plic->size, BIT(20),
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+					(SBI_MEMREGION_MMIO |
+					 SBI_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index d87b6e0..bd031f5 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -242,8 +242,8 @@ static int regmap_syscon_init(void *fdt, int nodeoff, u32 phandle,
 	}
 
 	rc = sbi_domain_root_add_memrange(addr, size, PAGE_SIZE,
-				(SBI_DOMAIN_MEMREGION_MMIO |
-				 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+				(SBI_MEMREGION_MMIO |
+				 SBI_MEMREGION_SHARED_SURW_MRW));
 	if (rc)
 		goto fail_free_syscon;
 
diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
index 30fbb95..a9e6ea9 100644
--- a/lib/utils/serial/cadence-uart.c
+++ b/lib/utils/serial/cadence-uart.c
@@ -127,6 +127,6 @@ int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 	sbi_console_set_device(&cadence_console);
 
 	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
-					    (SBI_DOMAIN_MEMREGION_MMIO |
-					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+					    (SBI_MEMREGION_MMIO |
+					    SBI_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/serial/fdt_serial_htif.c b/lib/utils/serial/fdt_serial_htif.c
index 7d88e7a..d113cb5 100644
--- a/lib/utils/serial/fdt_serial_htif.c
+++ b/lib/utils/serial/fdt_serial_htif.c
@@ -33,8 +33,8 @@ static int serial_htif_init(void *fdt, int nodeoff,
 	fdt_get_node_addr_size(fdt, nodeoff, 1, &tohost_addr, NULL);
 
 	rc = sbi_domain_root_add_memrange(fromhost_addr, PAGE_SIZE, PAGE_SIZE,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+					  (SBI_MEMREGION_MMIO |
+					   SBI_MEMREGION_SHARED_SURW_MRW));
 	if (rc)
 		return rc;
 
diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 1fe053f..aec9456 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -136,6 +136,6 @@ int uart8250_init(unsigned long base, u32 in_freq, u32 baudrate, u32 reg_shift,
 	sbi_console_set_device(&uart8250_console);
 
 	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
-					    (SBI_DOMAIN_MEMREGION_MMIO |
-					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
+					    (SBI_MEMREGION_MMIO |
+					    SBI_MEMREGION_SHARED_SURW_MRW));
 }
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 9acb26e..41dbfb0 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -227,34 +227,34 @@ int aclint_mtimer_cold_init(struct aclint_mtimer_data *mt,
 		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
 					mt->mtime_size + mt->mtimecmp_size,
 					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+					(SBI_MEMREGION_MMIO |
+					 SBI_MEMREGION_M_READABLE |
+					 SBI_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else if (mt->mtimecmp_addr == (mt->mtime_addr + mt->mtime_size)) {
 		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
 					mt->mtime_size + mt->mtimecmp_size,
 					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+					(SBI_MEMREGION_MMIO |
+					 SBI_MEMREGION_M_READABLE |
+					 SBI_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	} else {
 		rc = sbi_domain_root_add_memrange(mt->mtime_addr,
 						mt->mtime_size, MTIMER_REGION_ALIGN,
-						(SBI_DOMAIN_MEMREGION_MMIO |
-						 SBI_DOMAIN_MEMREGION_M_READABLE |
-						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+						(SBI_MEMREGION_MMIO |
+						 SBI_MEMREGION_M_READABLE |
+						 SBI_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 
 		rc = sbi_domain_root_add_memrange(mt->mtimecmp_addr,
 						mt->mtimecmp_size, MTIMER_REGION_ALIGN,
-						(SBI_DOMAIN_MEMREGION_MMIO |
-						 SBI_DOMAIN_MEMREGION_M_READABLE |
-						 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+						(SBI_MEMREGION_MMIO |
+						 SBI_MEMREGION_M_READABLE |
+						 SBI_MEMREGION_M_WRITABLE));
 		if (rc)
 			return rc;
 	}
diff --git a/lib/utils/timer/andes_plmt.c b/lib/utils/timer/andes_plmt.c
index 6e4bfaf..71be37f 100644
--- a/lib/utils/timer/andes_plmt.c
+++ b/lib/utils/timer/andes_plmt.c
@@ -83,9 +83,9 @@ int plmt_cold_timer_init(struct plmt_data *plmt)
 	rc = sbi_domain_root_add_memrange(
 		(unsigned long)plmt->time_val, plmt->size,
 		PLMT_REGION_ALIGN,
-		SBI_DOMAIN_MEMREGION_MMIO |
-		SBI_DOMAIN_MEMREGION_M_READABLE |
-		SBI_DOMAIN_MEMREGION_M_WRITABLE);
+		SBI_MEMREGION_MMIO |
+		SBI_MEMREGION_M_READABLE |
+		SBI_MEMREGION_M_WRITABLE);
 	if (rc)
 		return rc;
 
diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
index 515bcd7..e13224d 100644
--- a/platform/generic/renesas/rzfive/rzfive.c
+++ b/platform/generic/renesas/rzfive/rzfive.c
@@ -45,7 +45,7 @@ static int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *mat
 	 * we grant full access.
 	 */
 	return sbi_domain_root_add_memrange(0x30000, 0x20000, 0x1000,
-					    SBI_DOMAIN_MEMREGION_M_RWX);
+					    SBI_MEMREGION_M_RWX);
 }
 
 static const struct fdt_match renesas_rzfive_match[] = {
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index ae2d702..6a2736d 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -36,9 +36,9 @@ static int sophgo_sg2042_early_init(bool cold_boot,
 					SOPHGO_SG2042_TIMER_SIZE *
 					SOPHGO_SG2042_TIMER_NUM,
 					MTIMER_REGION_ALIGN,
-					(SBI_DOMAIN_MEMREGION_MMIO |
-					 SBI_DOMAIN_MEMREGION_M_READABLE |
-					 SBI_DOMAIN_MEMREGION_M_WRITABLE));
+					(SBI_MEMREGION_MMIO |
+					 SBI_MEMREGION_M_READABLE |
+					 SBI_MEMREGION_M_WRITABLE));
 
 
 	return 0;
-- 
2.45.2


