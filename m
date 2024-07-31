From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 31 Jul 2024 11:16:22 -0700
Subject: [PATCH 1/8] lib: sbi: Separate domain-handling code from memregion-handling code
In-Reply-To: <20240731181629.269898-1-gregorhaas1997@gmail.com>
References: <20240731181629.269898-1-gregorhaas1997@gmail.com>
Message-ID: <20240731181629.269898-2-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The next changes in this patch series will add a large amount of functionality
to the domain memregion abstraction. Split out memregions from domains, since
sbi_domain.c is already almost 900 lines long. This commit verbatim moves code
without modifying it, except to add new includes and integrate sbi_memregion.c
into the build system.
---
 include/sbi/sbi_domain.h    | 184 +---------------------
 include/sbi/sbi_memregion.h | 199 ++++++++++++++++++++++++
 lib/sbi/objects.mk          |   1 +
 lib/sbi/sbi_domain.c        | 296 +----------------------------------
 lib/sbi/sbi_memregion.c     | 301 ++++++++++++++++++++++++++++++++++++
 5 files changed, 507 insertions(+), 474 deletions(-)
 create mode 100644 include/sbi/sbi_memregion.h
 create mode 100644 lib/sbi/sbi_memregion.c

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a6e99c6..596bab3 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -14,150 +14,10 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
+#include <sbi/sbi_memregion.h>
 
 struct sbi_scratch;
 
-/** Domain access types */
-enum sbi_domain_access {
-	SBI_DOMAIN_READ = (1UL << 0),
-	SBI_DOMAIN_WRITE = (1UL << 1),
-	SBI_DOMAIN_EXECUTE = (1UL << 2),
-	SBI_DOMAIN_MMIO = (1UL << 3)
-};
-
-/** Representation of OpenSBI domain memory region */
-struct sbi_domain_memregion {
-	/**
-	 * Size of memory region as power of 2
-	 * It has to be minimum 3 and maximum __riscv_xlen
-	 */
-	unsigned long order;
-	/**
-	 * Base address of memory region
-	 * It must be 2^order aligned address
-	 */
-	unsigned long base;
-	/** Flags representing memory region attributes */
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
-
-	/* Shared read-only region between M and SU mode */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MR(__flags)			 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_RDONLY)
-
-	/* Shared region: SU execute-only and M read/execute */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MRX(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX)
-
-	/* Shared region: SU and M execute-only */
-#define SBI_DOMAIN_MEMREGION_IS_SUX_MX(__flags)			 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)
-
-	/* Shared region: SU and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SURW_MRW(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)
-
-	/* Shared region: SU read-only and M read/write */
-#define SBI_DOMAIN_MEMREGION_IS_SUR_MRW(__flags)		 \
-		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
-		 SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW)
-
-	/*
-	 * Check if region flags match with any of the above
-	 * mentioned shared region type
-	 */
-#define SBI_DOMAIN_MEMREGION_IS_SHARED(_flags)			\
-		(SBI_DOMAIN_MEMREGION_IS_SUR_MR(_flags)  ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUX_MRX(_flags) ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUX_MX(_flags)  ||	\
-		 SBI_DOMAIN_MEMREGION_IS_SURW_MRW(_flags)||	\
-		 SBI_DOMAIN_MEMREGION_IS_SUR_MRW(_flags))
-
-#define SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) &&	\
-		 !(__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK))
-
-#define SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(__flags)			\
-		((__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)  &&	\
-		 !(__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
-
-/** Bit to control if permissions are enforced on all modes */
-#define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
-
-#define SBI_DOMAIN_MEMREGION_M_RWX		\
-				(SBI_DOMAIN_MEMREGION_M_READABLE | \
-				 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
-
-#define SBI_DOMAIN_MEMREGION_SU_RWX		\
-				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
-				 SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
-
-/* Unrestricted M-mode accesses but enfoced on SU-mode */
-#define SBI_DOMAIN_MEMREGION_READABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
-#define SBI_DOMAIN_MEMREGION_WRITEABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
-#define SBI_DOMAIN_MEMREGION_EXECUTABLE		\
-				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
-				 SBI_DOMAIN_MEMREGION_M_RWX)
-
-/* Enforced accesses across all modes */
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
-	unsigned long flags;
-};
-
 /** Maximum number of domains */
 #define SBI_DOMAIN_MAX_INDEX			32
 
@@ -246,48 +106,6 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
 ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 				       ulong hbase);
 
-/**
- * Initialize a domain memory region based on it's physical
- * address and size.
- *
- * @param addr start physical address of memory region
- * @param size physical size of memory region
- * @param flags memory region flags
- * @param reg pointer to memory region being initialized
- */
-void sbi_domain_memregion_init(unsigned long addr,
-				unsigned long size,
-				unsigned long flags,
-				struct sbi_domain_memregion *reg);
-
-/**
- * Check whether we can access specified address for given mode and
- * memory region flags under a domain
- * @param dom pointer to domain
- * @param addr the address to be checked
- * @param mode the privilege mode of access
- * @param access_flags bitmask of domain access types (enum sbi_domain_access)
- * @return true if access allowed otherwise false
- */
-bool sbi_domain_check_addr(const struct sbi_domain *dom,
-			   unsigned long addr, unsigned long mode,
-			   unsigned long access_flags);
-
-/**
- * Check whether we can access specified address range for given mode and
- * memory region flags under a domain
- * @param dom pointer to domain
- * @param addr the start of the address range to be checked
- * @param size the size of the address range to be checked
- * @param mode the privilege mode of access
- * @param access_flags bitmask of domain access types (enum sbi_domain_access)
- * @return TRUE if access allowed otherwise FALSE
- */
-bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
-				 unsigned long addr, unsigned long size,
-				 unsigned long mode,
-				 unsigned long access_flags);
-
 /** Dump domain details on the console */
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix);
 
diff --git a/include/sbi/sbi_memregion.h b/include/sbi/sbi_memregion.h
new file mode 100644
index 0000000..8a62fc0
--- /dev/null
+++ b/include/sbi/sbi_memregion.h
@@ -0,0 +1,199 @@
+
+#ifndef __SBI_MEMREGION_H__
+#define __SBI_MEMREGION_H__
+
+#include <sbi/sbi_domain.h>
+
+/** Domain access types */
+enum sbi_domain_access {
+	SBI_DOMAIN_READ = (1UL << 0),
+	SBI_DOMAIN_WRITE = (1UL << 1),
+	SBI_DOMAIN_EXECUTE = (1UL << 2),
+	SBI_DOMAIN_MMIO = (1UL << 3)
+};
+
+/** Representation of OpenSBI domain memory region */
+struct sbi_domain_memregion {
+	/**
+	 * Size of memory region as power of 2
+	 * It has to be minimum 3 and maximum __riscv_xlen
+	 */
+	unsigned long order;
+	/**
+	 * Base address of memory region
+	 * It must be 2^order aligned address
+	 */
+	unsigned long base;
+	/** Flags representing memory region attributes */
+#define SBI_DOMAIN_MEMREGION_M_READABLE		(1UL << 0)
+#define SBI_DOMAIN_MEMREGION_M_WRITABLE		(1UL << 1)
+#define SBI_DOMAIN_MEMREGION_M_EXECUTABLE	(1UL << 2)
+#define SBI_DOMAIN_MEMREGION_SU_READABLE	(1UL << 3)
+#define SBI_DOMAIN_MEMREGION_SU_WRITABLE	(1UL << 4)
+#define SBI_DOMAIN_MEMREGION_SU_EXECUTABLE	(1UL << 5)
+
+#define SBI_DOMAIN_MEMREGION_ACCESS_MASK	(0x3fUL)
+#define SBI_DOMAIN_MEMREGION_M_ACCESS_MASK	(0x7UL)
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK	(0x38UL)
+
+#define SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT	(3)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_RDONLY		\
+		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
+		 SBI_DOMAIN_MEMREGION_SU_READABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX		\
+		(SBI_DOMAIN_MEMREGION_M_READABLE   |	\
+		 SBI_DOMAIN_MEMREGION_M_EXECUTABLE |	\
+		 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUX_MX		\
+		(SBI_DOMAIN_MEMREGION_M_EXECUTABLE |	\
+		 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW		\
+		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
+		 SBI_DOMAIN_MEMREGION_M_WRITABLE |	\
+		 SBI_DOMAIN_MEMREGION_SU_READABLE|	\
+		 SBI_DOMAIN_MEMREGION_SU_WRITABLE)
+
+#define SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW		\
+		(SBI_DOMAIN_MEMREGION_M_READABLE |	\
+		 SBI_DOMAIN_MEMREGION_M_WRITABLE |	\
+		 SBI_DOMAIN_MEMREGION_SU_READABLE)
+
+	/* Shared read-only region between M and SU mode */
+#define SBI_DOMAIN_MEMREGION_IS_SUR_MR(__flags)			 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_RDONLY)
+
+	/* Shared region: SU execute-only and M read/execute */
+#define SBI_DOMAIN_MEMREGION_IS_SUX_MRX(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MRX)
+
+	/* Shared region: SU and M execute-only */
+#define SBI_DOMAIN_MEMREGION_IS_SUX_MX(__flags)			 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUX_MX)
+
+	/* Shared region: SU and M read/write */
+#define SBI_DOMAIN_MEMREGION_IS_SURW_MRW(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW)
+
+	/* Shared region: SU read-only and M read/write */
+#define SBI_DOMAIN_MEMREGION_IS_SUR_MRW(__flags)		 \
+		((__flags & SBI_DOMAIN_MEMREGION_ACCESS_MASK) == \
+		 SBI_DOMAIN_MEMREGION_SHARED_SUR_MRW)
+
+	/*
+	 * Check if region flags match with any of the above
+	 * mentioned shared region type
+	 */
+#define SBI_DOMAIN_MEMREGION_IS_SHARED(_flags)			\
+		(SBI_DOMAIN_MEMREGION_IS_SUR_MR(_flags)  ||	\
+		 SBI_DOMAIN_MEMREGION_IS_SUX_MRX(_flags) ||	\
+		 SBI_DOMAIN_MEMREGION_IS_SUX_MX(_flags)  ||	\
+		 SBI_DOMAIN_MEMREGION_IS_SURW_MRW(_flags)||	\
+		 SBI_DOMAIN_MEMREGION_IS_SUR_MRW(_flags))
+
+#define SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(__flags)			\
+		((__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) &&	\
+		 !(__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK))
+
+#define SBI_DOMAIN_MEMREGION_SU_ONLY_ACCESS(__flags)			\
+		((__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)  &&	\
+		 !(__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
+
+/** Bit to control if permissions are enforced on all modes */
+#define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
+
+#define SBI_DOMAIN_MEMREGION_M_RWX		\
+				(SBI_DOMAIN_MEMREGION_M_READABLE | \
+				 SBI_DOMAIN_MEMREGION_M_WRITABLE | \
+				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_SU_RWX		\
+				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+				 SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+				 SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
+
+/* Unrestricted M-mode accesses but enfoced on SU-mode */
+#define SBI_DOMAIN_MEMREGION_READABLE		\
+				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+				 SBI_DOMAIN_MEMREGION_M_RWX)
+#define SBI_DOMAIN_MEMREGION_WRITEABLE		\
+				(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+				 SBI_DOMAIN_MEMREGION_M_RWX)
+#define SBI_DOMAIN_MEMREGION_EXECUTABLE		\
+				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
+				 SBI_DOMAIN_MEMREGION_M_RWX)
+
+/* Enforced accesses across all modes */
+#define SBI_DOMAIN_MEMREGION_ENF_READABLE	\
+				(SBI_DOMAIN_MEMREGION_SU_READABLE | \
+				 SBI_DOMAIN_MEMREGION_M_READABLE)
+#define SBI_DOMAIN_MEMREGION_ENF_WRITABLE	\
+				(SBI_DOMAIN_MEMREGION_SU_WRITABLE | \
+				 SBI_DOMAIN_MEMREGION_M_WRITABLE)
+#define SBI_DOMAIN_MEMREGION_ENF_EXECUTABLE	\
+				(SBI_DOMAIN_MEMREGION_SU_EXECUTABLE | \
+				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
+
+#define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
+	unsigned long flags;
+};
+
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
+			       unsigned long size,
+			       unsigned long flags,
+			       struct sbi_domain_memregion *reg);
+
+/**
+ *
+ * Traverse all of a domain's memory regions and sanitize
+ * them, while making sure they are formatted properly
+ *
+ * @param dom the domain for which to sanitize regions
+ */
+int sbi_domain_memregions_sanitize(struct sbi_domain *dom);
+
+/**
+ * Check whether we can access specified address for given mode and
+ * memory region flags under a domain
+ * @param dom pointer to domain
+ * @param addr the address to be checked
+ * @param mode the privilege mode of access
+ * @param access_flags bitmask of domain access types (enum sbi_domain_access)
+ * @return true if access allowed otherwise false
+ */
+bool sbi_domain_check_addr(const struct sbi_domain *dom,
+			   unsigned long addr, unsigned long mode,
+			   unsigned long access_flags);
+
+/**
+ * Check whether we can access specified address range for given mode and
+ * memory region flags under a domain
+ * @param dom pointer to domain
+ * @param addr the start of the address range to be checked
+ * @param size the size of the address range to be checked
+ * @param mode the privilege mode of access
+ * @param access_flags bitmask of domain access types (enum sbi_domain_access)
+ * @return TRUE if access allowed otherwise FALSE
+ */
+bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
+				 unsigned long addr, unsigned long size,
+				 unsigned long mode,
+				 unsigned long access_flags);
+
+#endif // __SBI_MEMREGION_H__
\ No newline@end of file
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 535aa70..d80d6cc 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -66,6 +66,7 @@ libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
 libsbi-objs-y += sbi_domain_context.o
 libsbi-objs-y += sbi_domain.o
+libsbi-objs-y += sbi_memregion.o
 libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_fwft.o
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 374ac36..00ba870 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -96,199 +96,9 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
 	return ret;
 }
 
-void sbi_domain_memregion_init(unsigned long addr,
-				unsigned long size,
-				unsigned long flags,
-				struct sbi_domain_memregion *reg)
-{
-	unsigned long base = 0, order;
-
-	for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
-		if (order < __riscv_xlen) {
-			base = addr & ~((1UL << order) - 1UL);
-			if ((base <= addr) &&
-			    (addr < (base + (1UL << order))) &&
-			    (base <= (addr + size - 1UL)) &&
-			    ((addr + size - 1UL) < (base + (1UL << order))))
-				break;
-		} else {
-			base = 0;
-			break;
-		}
-
-	}
-
-	if (reg) {
-		reg->base = base;
-		reg->order = order;
-		reg->flags = flags;
-	}
-}
-
-bool sbi_domain_check_addr(const struct sbi_domain *dom,
-			   unsigned long addr, unsigned long mode,
-			   unsigned long access_flags)
-{
-	bool rmmio, mmio = false;
-	struct sbi_domain_memregion *reg;
-	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
-
-	if (!dom)
-		return false;
-
-	/*
-	 * Use M_{R/W/X} bits because the SU-bits are at the
-	 * same relative offsets. If the mode is not M, the SU
-	 * bits will fall at same offsets after the shift.
-	 */
-	if (access_flags & SBI_DOMAIN_READ)
-		rwx |= SBI_DOMAIN_MEMREGION_M_READABLE;
-
-	if (access_flags & SBI_DOMAIN_WRITE)
-		rwx |= SBI_DOMAIN_MEMREGION_M_WRITABLE;
-
-	if (access_flags & SBI_DOMAIN_EXECUTE)
-		rwx |= SBI_DOMAIN_MEMREGION_M_EXECUTABLE;
-
-	if (access_flags & SBI_DOMAIN_MMIO)
-		mmio = true;
-
-	sbi_domain_for_each_memregion(dom, reg) {
-		rflags = reg->flags;
-		rrwx = (mode == PRV_M ?
-			(rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) :
-			(rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
-			>> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
-
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
-		if (rstart <= addr && addr <= rend) {
-			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
-			if (mmio != rmmio)
-				return false;
-			return ((rrwx & rwx) == rwx) ? true : false;
-		}
-	}
-
-	return (mode == PRV_M) ? true : false;
-}
-
-/* Check if region complies with constraints */
-static bool is_region_valid(const struct sbi_domain_memregion *reg)
-{
-	if (reg->order < 3 || __riscv_xlen < reg->order)
-		return false;
-
-	if (reg->order == __riscv_xlen && reg->base != 0)
-		return false;
-
-	if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
-		return false;
-
-	return true;
-}
-
-/** Check if regionA is sub-region of regionB */
-static bool is_region_subset(const struct sbi_domain_memregion *regA,
-			     const struct sbi_domain_memregion *regB)
-{
-	ulong regA_start = regA->base;
-	ulong regA_end = regA->base + (BIT(regA->order) - 1);
-	ulong regB_start = regB->base;
-	ulong regB_end = regB->base + (BIT(regB->order) - 1);
-
-	if ((regB_start <= regA_start) &&
-	    (regA_start < regB_end) &&
-	    (regB_start < regA_end) &&
-	    (regA_end <= regB_end))
-		return true;
-
-	return false;
-}
-
-/** Check if regionA can be replaced by regionB */
-static bool is_region_compatible(const struct sbi_domain_memregion *regA,
-				 const struct sbi_domain_memregion *regB)
-{
-	if (is_region_subset(regA, regB) && regA->flags == regB->flags)
-		return true;
-
-	return false;
-}
-
-/** Check if regionA should be placed before regionB */
-static bool is_region_before(const struct sbi_domain_memregion *regA,
-			     const struct sbi_domain_memregion *regB)
-{
-	if (regA->order < regB->order)
-		return true;
-
-	if ((regA->order == regB->order) &&
-	    (regA->base < regB->base))
-		return true;
-
-	return false;
-}
-
-static const struct sbi_domain_memregion *find_region(
-						const struct sbi_domain *dom,
-						unsigned long addr)
-{
-	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
-
-	sbi_domain_for_each_memregion(dom, reg) {
-		rstart = reg->base;
-		rend = (reg->order < __riscv_xlen) ?
-			rstart + ((1UL << reg->order) - 1) : -1UL;
-		if (rstart <= addr && addr <= rend)
-			return reg;
-	}
-
-	return NULL;
-}
-
-static const struct sbi_domain_memregion *find_next_subset_region(
-				const struct sbi_domain *dom,
-				const struct sbi_domain_memregion *reg,
-				unsigned long addr)
-{
-	struct sbi_domain_memregion *sreg, *ret = NULL;
-
-	sbi_domain_for_each_memregion(dom, sreg) {
-		if (sreg == reg || (sreg->base <= addr) ||
-		    !is_region_subset(sreg, reg))
-			continue;
-
-		if (!ret || (sreg->base < ret->base) ||
-		    ((sreg->base == ret->base) && (sreg->order < ret->order)))
-			ret = sreg;
-	}
-
-	return ret;
-}
-
-static void swap_region(struct sbi_domain_memregion* reg1,
-			struct sbi_domain_memregion* reg2)
-{
-	struct sbi_domain_memregion treg;
-
-	sbi_memcpy(&treg, reg1, sizeof(treg));
-	sbi_memcpy(reg1, reg2, sizeof(treg));
-	sbi_memcpy(reg2, &treg, sizeof(treg));
-}
-
-static void clear_region(struct sbi_domain_memregion* reg)
-{
-	sbi_memset(reg, 0x0, sizeof(*reg));
-}
-
 static int sanitize_domain(struct sbi_domain *dom)
 {
-	u32 i, j, count;
-	bool is_covered;
-	struct sbi_domain_memregion *reg, *reg1;
+	u32 i, rc;
 
 	/* Check possible HARTs */
 	if (!dom->possible_harts) {
@@ -305,70 +115,11 @@ static int sanitize_domain(struct sbi_domain *dom)
 		}
 	}
 
-	/* Check memory regions */
-	if (!dom->regions) {
-		sbi_printf("%s: %s regions is NULL\n",
-			   __func__, dom->name);
-		return SBI_EINVAL;
-	}
-	sbi_domain_for_each_memregion(dom, reg) {
-		if (!is_region_valid(reg)) {
-			sbi_printf("%s: %s has invalid region base=0x%lx "
-				   "order=%lu flags=0x%lx\n", __func__,
-				   dom->name, reg->base, reg->order,
-				   reg->flags);
-			return SBI_EINVAL;
-		}
-	}
-
-	/* Count memory regions */
-	count = 0;
-	sbi_domain_for_each_memregion(dom, reg)
-		count++;
-
-	/* Check presence of firmware regions */
-	if (!dom->fw_region_inited) {
-		sbi_printf("%s: %s does not have firmware region\n",
+	rc = sbi_domain_memregions_sanitize(dom);
+	if (rc) {
+		sbi_printf("%s: %s has unsanitizable regions\n",
 			   __func__, dom->name);
-		return SBI_EINVAL;
-	}
-
-	/* Sort the memory regions */
-	for (i = 0; i < (count - 1); i++) {
-		reg = &dom->regions[i];
-		for (j = i + 1; j < count; j++) {
-			reg1 = &dom->regions[j];
-
-			if (!is_region_before(reg1, reg))
-				continue;
-
-			swap_region(reg, reg1);
-		}
-	}
-
-	/* Remove covered regions */
-	while(i < (count - 1)) {
-		is_covered = false;
-		reg = &dom->regions[i];
-
-		for (j = i + 1; j < count; j++) {
-			reg1 = &dom->regions[j];
-
-			if (is_region_compatible(reg, reg1)) {
-				is_covered = true;
-				break;
-			}
-		}
-
-		/* find a region is superset of reg, remove reg */
-		if (is_covered) {
-			for (j = i; j < (count - 1); j++)
-				swap_region(&dom->regions[j],
-					    &dom->regions[j + 1]);
-			clear_region(&dom->regions[count - 1]);
-			count--;
-		} else
-			i++;
+		return rc;
 	}
 
 	/*
@@ -401,37 +152,6 @@ static int sanitize_domain(struct sbi_domain *dom)
 	return 0;
 }
 
-bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
-				 unsigned long addr, unsigned long size,
-				 unsigned long mode,
-				 unsigned long access_flags)
-{
-	unsigned long max = addr + size;
-	const struct sbi_domain_memregion *reg, *sreg;
-
-	if (!dom)
-		return false;
-
-	while (addr < max) {
-		reg = find_region(dom, addr);
-		if (!reg)
-			return false;
-
-		if (!sbi_domain_check_addr(dom, addr, mode, access_flags))
-			return false;
-
-		sreg = find_next_subset_region(dom, reg, addr);
-		if (sreg)
-			addr = sreg->base;
-		else if (reg->order < __riscv_xlen)
-			addr = reg->base + (1UL << reg->order);
-		else
-			break;
-	}
-
-	return true;
-}
-
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
 	u32 i, j, k;
@@ -613,12 +333,6 @@ int sbi_domain_root_add_memregion(const struct sbi_domain_memregion *reg)
 	    (ROOT_REGION_MAX <= root_memregs_count))
 		return SBI_EINVAL;
 
-	/* Check whether compatible region exists for the new one */
-	sbi_domain_for_each_memregion(&root, nreg) {
-		if (is_region_compatible(reg, nreg))
-			return 0;
-	}
-
 	/* Append the memregion to root memregions */
 	nreg = &root.regions[root_memregs_count];
 	sbi_memcpy(nreg, reg, sizeof(*reg));
diff --git a/lib/sbi/sbi_memregion.c b/lib/sbi/sbi_memregion.c
new file mode 100644
index 0000000..8cb1eed
--- /dev/null
+++ b/lib/sbi/sbi_memregion.c
@@ -0,0 +1,301 @@
+#include <sbi/sbi_memregion.h>
+#include <sbi/sbi_math.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
+
+void sbi_domain_memregion_init(unsigned long addr,
+			       unsigned long size,
+			       unsigned long flags,
+			       struct sbi_domain_memregion *reg)
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
+/** Check if regionA is sub-region of regionB */
+static bool is_region_subset(const struct sbi_domain_memregion *regA,
+			     const struct sbi_domain_memregion *regB)
+{
+	ulong regA_start = regA->base;
+	ulong regA_end = regA->base + (BIT(regA->order) - 1);
+	ulong regB_start = regB->base;
+	ulong regB_end = regB->base + (BIT(regB->order) - 1);
+
+	if ((regB_start <= regA_start) &&
+	    (regA_start < regB_end) &&
+	    (regB_start < regA_end) &&
+	    (regA_end <= regB_end))
+		return true;
+
+	return false;
+}
+
+/** Check if regionA can be replaced by regionB */
+static bool is_region_compatible(const struct sbi_domain_memregion *regA,
+				 const struct sbi_domain_memregion *regB)
+{
+	if (is_region_subset(regA, regB) && regA->flags == regB->flags)
+		return true;
+
+	return false;
+}
+
+/* Check if region complies with constraints */
+static bool is_region_valid(const struct sbi_domain_memregion *reg)
+{
+	if (reg->order < 3 || __riscv_xlen < reg->order)
+		return false;
+
+	if (reg->order == __riscv_xlen && reg->base != 0)
+		return false;
+
+	if (reg->order < __riscv_xlen && (reg->base & (BIT(reg->order) - 1)))
+		return false;
+
+	return true;
+}
+
+/** Check if regionA should be placed before regionB */
+static bool is_region_before(const struct sbi_domain_memregion *regA,
+			     const struct sbi_domain_memregion *regB)
+{
+	if (regA->order < regB->order)
+		return true;
+
+	if ((regA->order == regB->order) &&
+	    (regA->base < regB->base))
+		return true;
+
+	return false;
+}
+
+
+static void swap_region(struct sbi_domain_memregion* reg1,
+			struct sbi_domain_memregion* reg2)
+{
+	struct sbi_domain_memregion treg;
+
+	sbi_memcpy(&treg, reg1, sizeof(treg));
+	sbi_memcpy(reg1, reg2, sizeof(treg));
+	sbi_memcpy(reg2, &treg, sizeof(treg));
+}
+
+static void clear_region(struct sbi_domain_memregion* reg)
+{
+	sbi_memset(reg, 0x0, sizeof(*reg));
+}
+
+int sbi_domain_memregions_sanitize(struct sbi_domain *dom)
+{
+	int i, j, count;
+	bool is_covered;
+	struct sbi_domain_memregion *reg, *reg1;
+
+	/* Check memory regions */
+	if (!dom->regions) {
+		sbi_printf("%s: %s regions is NULL\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
+	}
+	sbi_domain_for_each_memregion(dom, reg) {
+		if (!is_region_valid(reg)) {
+			sbi_printf("%s: %s has invalid region base=0x%lx "
+				   "order=%lu flags=0x%lx\n", __func__,
+				   dom->name, reg->base, reg->order,
+				   reg->flags);
+			return SBI_EINVAL;
+		}
+	}
+
+	/* Count memory regions */
+	count = 0;
+	sbi_domain_for_each_memregion(dom, reg)
+		count++;
+
+	/* Check presence of firmware regions */
+	if (!dom->fw_region_inited) {
+		sbi_printf("%s: %s does not have firmware region\n",
+			   __func__, dom->name);
+		return SBI_EINVAL;
+	}
+
+	/* Sort the memory regions */
+	for (i = 0; i < (count - 1); i++) {
+		reg = &dom->regions[i];
+		for (j = i + 1; j < count; j++) {
+			reg1 = &dom->regions[j];
+
+			if (!is_region_before(reg1, reg))
+				continue;
+
+			swap_region(reg, reg1);
+		}
+	}
+
+	/* Remove covered regions */
+	while(i < (count - 1)) {
+		is_covered = false;
+		reg = &dom->regions[i];
+
+		for (j = i + 1; j < count; j++) {
+			reg1 = &dom->regions[j];
+
+			if (is_region_compatible(reg, reg1)) {
+				is_covered = true;
+				break;
+			}
+		}
+
+		/* find a region is superset of reg, remove reg */
+		if (is_covered) {
+			for (j = i; j < (count - 1); j++)
+				swap_region(&dom->regions[j],
+					    &dom->regions[j + 1]);
+			clear_region(&dom->regions[count - 1]);
+			count--;
+		} else
+			i++;
+	}
+
+	return SBI_OK;
+}
+
+
+bool sbi_domain_check_addr(const struct sbi_domain *dom,
+			   unsigned long addr, unsigned long mode,
+			   unsigned long access_flags)
+{
+	bool rmmio, mmio = false;
+	struct sbi_domain_memregion *reg;
+	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
+
+	if (!dom)
+		return false;
+
+	/*
+	 * Use M_{R/W/X} bits because the SU-bits are at the
+	 * same relative offsets. If the mode is not M, the SU
+	 * bits will fall at same offsets after the shift.
+	 */
+	if (access_flags & SBI_DOMAIN_READ)
+		rwx |= SBI_DOMAIN_MEMREGION_M_READABLE;
+
+	if (access_flags & SBI_DOMAIN_WRITE)
+		rwx |= SBI_DOMAIN_MEMREGION_M_WRITABLE;
+
+	if (access_flags & SBI_DOMAIN_EXECUTE)
+		rwx |= SBI_DOMAIN_MEMREGION_M_EXECUTABLE;
+
+	if (access_flags & SBI_DOMAIN_MMIO)
+		mmio = true;
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		rflags = reg->flags;
+		rrwx = (mode == PRV_M ?
+					(rflags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK) :
+					(rflags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)
+						>> SBI_DOMAIN_MEMREGION_SU_ACCESS_SHIFT);
+
+		rstart = reg->base;
+		rend = (reg->order < __riscv_xlen) ?
+						     rstart + ((1UL << reg->order) - 1) : -1UL;
+		if (rstart <= addr && addr <= rend) {
+			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
+			if (mmio != rmmio)
+				return false;
+			return ((rrwx & rwx) == rwx) ? true : false;
+		}
+	}
+
+	return (mode == PRV_M) ? true : false;
+}
+
+static const struct sbi_domain_memregion *find_region(
+	const struct sbi_domain *dom,
+	unsigned long addr)
+{
+	unsigned long rstart, rend;
+	struct sbi_domain_memregion *reg;
+
+	sbi_domain_for_each_memregion(dom, reg) {
+		rstart = reg->base;
+		rend = (reg->order < __riscv_xlen) ?
+						     rstart + ((1UL << reg->order) - 1) : -1UL;
+		if (rstart <= addr && addr <= rend)
+			return reg;
+	}
+
+	return NULL;
+}
+
+static const struct sbi_domain_memregion *find_next_subset_region(
+	const struct sbi_domain *dom,
+	const struct sbi_domain_memregion *reg,
+	unsigned long addr)
+{
+	struct sbi_domain_memregion *sreg, *ret = NULL;
+
+	sbi_domain_for_each_memregion(dom, sreg) {
+		if (sreg == reg || (sreg->base <= addr) ||
+		    !is_region_subset(sreg, reg))
+			continue;
+
+		if (!ret || (sreg->base < ret->base) ||
+		    ((sreg->base == ret->base) && (sreg->order < ret->order)))
+			ret = sreg;
+	}
+
+	return ret;
+}
+
+bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
+				 unsigned long addr, unsigned long size,
+				 unsigned long mode,
+				 unsigned long access_flags)
+{
+	unsigned long max = addr + size;
+	const struct sbi_domain_memregion *reg, *sreg;
+
+	if (!dom)
+		return false;
+
+	while (addr < max) {
+		reg = find_region(dom, addr);
+		if (!reg)
+			return false;
+
+		if (!sbi_domain_check_addr(dom, addr, mode, access_flags))
+			return false;
+
+		sreg = find_next_subset_region(dom, reg, addr);
+		if (sreg)
+			addr = sreg->base;
+		else if (reg->order < __riscv_xlen)
+			addr = reg->base + (1UL << reg->order);
+		else
+			break;
+	}
+
+	return true;
+}
\ No newline at end of file
-- 
2.45.2


