From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 20 Oct 2020 15:09:29 +0530
Subject: [PATCH v4 15/16] lib: sbi: Display domain details in boot prints
In-Reply-To: <20201020093930.2551352-1-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
Message-ID: <20201020093930.2551352-16-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend boot prints to display details of each domain. In the
process, we remove sbi_hart_pmp_dump() because it shows redundant
information which domain details already show.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 include/sbi/sbi_domain.h |  6 +++
 include/sbi/sbi_hart.h   |  4 +-
 lib/sbi/sbi_domain.c     | 94 ++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c       | 44 +++++--------------
 lib/sbi/sbi_init.c       | 27 +++++++-----
 5 files changed, 127 insertions(+), 48 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 4bb08dc..6f90b26 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -138,6 +138,12 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long addr, unsigned long mode,
 			   unsigned long access_flags);
 
+/** Dump domain details on the console */
+void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix);
+
+/** Dump all domain details on the console */
+void sbi_domain_dump_all(const char *suffix);
+
 /** Finalize domain tables and startup non-root domains */
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
 
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 79d745a..3ac1500 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -36,9 +36,9 @@ static inline ulong sbi_hart_expected_trap_addr(void)
 }
 
 unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
-void sbi_hart_delegation_dump(struct sbi_scratch *scratch);
+void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
+			      const char *prefix, const char *suffix);
 unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
-void sbi_hart_pmp_dump(struct sbi_scratch *scratch);
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
 bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long feature);
 void sbi_hart_get_features_str(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 9bde5fb..d4b82fe 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -8,6 +8,7 @@
  */
 
 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_hsm.h>
@@ -243,6 +244,99 @@ static int sanitize_domain(const struct sbi_platform *plat,
 	return 0;
 }
 
+void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
+{
+	u32 i, k;
+	unsigned long rstart, rend;
+	struct sbi_domain_memregion *reg;
+
+	sbi_printf("Domain%d Name        %s: %s\n",
+		   dom->index, suffix, dom->name);
+
+	sbi_printf("Domain%d Boot HART   %s: %d\n",
+		   dom->index, suffix, dom->boot_hartid);
+
+	k = 0;
+	sbi_printf("Domain%d HARTs       %s: ", dom->index, suffix);
+	sbi_hartmask_for_each_hart(i, dom->possible_harts)
+		sbi_printf("%s%d%s", (k++) ? "," : "",
+			   i, sbi_domain_is_assigned_hart(dom, i) ? "*" : "");
+	sbi_printf("\n");
+
+	i = 0;
+	sbi_domain_for_each_memregion(dom, reg) {
+		rstart = reg->base;
+		rend = (reg->order < __riscv_xlen) ?
+			rstart + ((1UL << reg->order) - 1) : -1UL;
+
+#if __riscv_xlen == 32
+		sbi_printf("Domain%d Region%02d    %s: 0x%08lx-0x%08lx ",
+#else
+		sbi_printf("Domain%d Region%02d    %s: 0x%016lx-0x%016lx ",
+#endif
+			   dom->index, i, suffix, rstart, rend);
+
+		k = 0;
+		if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
+			sbi_printf("%cM", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+			sbi_printf("%cI", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_READABLE)
+			sbi_printf("%cR", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_WRITEABLE)
+			sbi_printf("%cW", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_EXECUTABLE)
+			sbi_printf("%cX", (k++) ? ',' : '(');
+		sbi_printf("%s\n", (k++) ? ")" : "()");
+
+		i++;
+	}
+
+#if __riscv_xlen == 32
+	sbi_printf("Domain%d Next Address%s: 0x%08lx\n",
+#else
+	sbi_printf("Domain%d Next Address%s: 0x%016lx\n",
+#endif
+		   dom->index, suffix, dom->next_addr);
+
+#if __riscv_xlen == 32
+	sbi_printf("Domain%d Next Arg1   %s: 0x%08lx\n",
+#else
+	sbi_printf("Domain%d Next Arg1   %s: 0x%016lx\n",
+#endif
+		   dom->index, suffix, dom->next_arg1);
+
+	sbi_printf("Domain%d Next Mode   %s: ", dom->index, suffix);
+	switch (dom->next_mode) {
+	case PRV_M:
+		sbi_printf("M-mode\n");
+		break;
+	case PRV_S:
+		sbi_printf("S-mode\n");
+		break;
+	case PRV_U:
+		sbi_printf("U-mode\n");
+		break;
+	default:
+		sbi_printf("Unknown\n");
+		break;
+	};
+
+	sbi_printf("Domain%d SysReset    %s: %s\n",
+		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
+}
+
+void sbi_domain_dump_all(const char *suffix)
+{
+	u32 i;
+	const struct sbi_domain *dom;
+
+	sbi_domain_for_each(i, dom) {
+		sbi_domain_dump(dom, suffix);
+		sbi_printf("\n");
+	}
+}
+
 int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
 {
 	int rc;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1871a1e..ff18c9d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -123,18 +123,23 @@ static int delegate_traps(struct sbi_scratch *scratch)
 	return 0;
 }
 
-void sbi_hart_delegation_dump(struct sbi_scratch *scratch)
+void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
+			      const char *prefix, const char *suffix)
 {
 	if (!misa_extension('S'))
 		/* No delegation possible as mideleg does not exist*/
 		return;
 
 #if __riscv_xlen == 32
-	sbi_printf("MIDELEG : 0x%08lx\n", csr_read(CSR_MIDELEG));
-	sbi_printf("MEDELEG : 0x%08lx\n", csr_read(CSR_MEDELEG));
+	sbi_printf("%sMIDELEG%s: 0x%08lx\n",
+		   prefix, suffix, csr_read(CSR_MIDELEG));
+	sbi_printf("%sMEDELEG%s: 0x%08lx\n",
+		   prefix, suffix, csr_read(CSR_MEDELEG));
 #else
-	sbi_printf("MIDELEG : 0x%016lx\n", csr_read(CSR_MIDELEG));
-	sbi_printf("MEDELEG : 0x%016lx\n", csr_read(CSR_MEDELEG));
+	sbi_printf("%sMIDELEG%s: 0x%016lx\n",
+		   prefix, suffix, csr_read(CSR_MIDELEG));
+	sbi_printf("%sMEDELEG%s: 0x%016lx\n",
+		   prefix, suffix, csr_read(CSR_MEDELEG));
 #endif
 }
 
@@ -154,35 +159,6 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
 	return hfeatures->pmp_count;
 }
 
-void sbi_hart_pmp_dump(struct sbi_scratch *scratch)
-{
-	unsigned long prot, addr, size, log2size;
-	unsigned int i, pmp_count;
-
-	pmp_count = sbi_hart_pmp_count(scratch);
-	for (i = 0; i < pmp_count; i++) {
-		pmp_get(i, &prot, &addr, &log2size);
-		if (!(prot & PMP_A))
-			continue;
-		size = (log2size < __riscv_xlen) ? 1UL << log2size : 0;
-#if __riscv_xlen == 32
-		sbi_printf("PMP%d    : 0x%08lx-0x%08lx (A",
-#else
-		sbi_printf("PMP%d    : 0x%016lx-0x%016lx (A",
-#endif
-			   i, addr, addr + size - 1);
-		if (prot & PMP_L)
-			sbi_printf(",L");
-		if (prot & PMP_R)
-			sbi_printf(",R");
-		if (prot & PMP_W)
-			sbi_printf(",W");
-		if (prot & PMP_X)
-			sbi_printf(",X");
-		sbi_printf(")\n");
-	}
-}
-
 int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
 {
 	struct sbi_domain_memregion *reg;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 406cb3f..5151d36 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -39,6 +39,7 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 {
 	int xlen;
 	char str[128];
+	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 #ifdef OPENSBI_VERSION_GIT
@@ -64,27 +65,29 @@ static void sbi_boot_prints(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Platform HART Count : %u\n",
 		   sbi_platform_hart_count(plat));
 
-	/* Boot HART details */
-	sbi_printf("Boot HART ID        : %u\n", hartid);
-	misa_string(xlen, str, sizeof(str));
-	sbi_printf("Boot HART ISA       : %s\n", str);
-	sbi_hart_get_features_str(scratch, str, sizeof(str));
-	sbi_printf("BOOT HART Features  : %s\n", str);
-	sbi_printf("BOOT HART PMP Count : %d\n", sbi_hart_pmp_count(scratch));
-	sbi_printf("BOOT HART MHPM Count: %d\n", sbi_hart_mhpm_count(scratch));
-
 	/* Firmware details */
 	sbi_printf("Firmware Base       : 0x%lx\n", scratch->fw_start);
 	sbi_printf("Firmware Size       : %d KB\n",
 		   (u32)(scratch->fw_size / 1024));
 
-	/* Generic details */
+	/* SBI details */
 	sbi_printf("Runtime SBI Version : %d.%d\n",
 		   sbi_ecall_version_major(), sbi_ecall_version_minor());
 	sbi_printf("\n");
 
-	sbi_hart_delegation_dump(scratch);
-	sbi_hart_pmp_dump(scratch);
+	/* Domain details */
+	sbi_domain_dump_all("");
+
+	/* Boot HART details */
+	sbi_printf("Boot HART ID        : %u\n", hartid);
+	sbi_printf("Boot HART Domain    : %s\n", dom->name);
+	misa_string(xlen, str, sizeof(str));
+	sbi_printf("Boot HART ISA       : %s\n", str);
+	sbi_hart_get_features_str(scratch, str, sizeof(str));
+	sbi_printf("Boot HART Features  : %s\n", str);
+	sbi_printf("Boot HART PMP Count : %d\n", sbi_hart_pmp_count(scratch));
+	sbi_printf("Boot HART MHPM Count: %d\n", sbi_hart_mhpm_count(scratch));
+	sbi_hart_delegation_dump(scratch, "Boot HART ", "   ");
 }
 
 static spinlock_t coldboot_lock = SPIN_LOCK_INITIALIZER;
-- 
2.25.1


