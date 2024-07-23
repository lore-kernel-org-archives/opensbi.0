From: Ben Zong-You Xie <ben717@andestech.com>
Date: Tue, 23 Jul 2024 15:57:28 +0800
Subject: [PATCH 4/4] platform: generic: andes: add a new Andes SBI call to free a PMA entry
In-Reply-To: <20240723075728.587110-1-ben717@andestech.com>
References: <20240723075728.587110-1-ben717@andestech.com>
Message-ID: <20240723075728.587110-5-ben717@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new Andes SBI call to free a PMA entry, and reset the memory
attributes for the corresponding NAPOT region.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 platform/generic/andes/andes_pma.c         | 65 ++++++++++++++++------
 platform/generic/andes/andes_sbi.c         |  4 ++
 platform/generic/include/andes/andes_pma.h |  9 +++
 3 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index 70039ca..be61005 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -120,6 +120,27 @@ static char get_pmaxcfg(int entry_id)
 	return *pmaxcfg;
 }
 
+static void set_pmaxcfg(int entry_id, char flags)
+{
+	unsigned int pmacfg_addr;
+	unsigned long pmacfg_val;
+	char *pmaxcfg;
+
+#if __riscv_xlen == 64
+	pmacfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
+	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
+#elif __riscv_xlen == 32
+	pmacfg_addr = CSR_PMACFG0 + (entry_id / 4);
+	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+	*pmaxcfg = flags;
+	andes_pma_write_num(pmacfg_addr, pmacfg_val);
+}
+
 static void decode_pmaaddrx(int entry_id, unsigned long *start,
 			    unsigned long *size)
 {
@@ -167,30 +188,14 @@ static unsigned long andes_pma_setup(const struct andes_pma_region *pma_region,
 {
 	unsigned long size = pma_region->size;
 	unsigned long addr = pma_region->pa;
-	unsigned int pma_cfg_addr;
-	unsigned long pmacfg_val;
 	unsigned long pmaaddr;
-	char *pmaxcfg;
 
 	/* Check for a 4KiB granularity NAPOT region*/
 	if (size < ANDES_PMA_GRANULARITY || not_napot(addr, size) ||
 	    !(pma_region->flags & ANDES_PMACFG_ETYP_NAPOT))
 		return SBI_EINVAL;
 
-#if __riscv_xlen == 64
-	pma_cfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
-	pmacfg_val = andes_pma_read_num(pma_cfg_addr);
-	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
-#elif __riscv_xlen == 32
-	pma_cfg_addr = CSR_PMACFG0 + (entry_id / 4);
-	pmacfg_val = andes_pma_read_num(pma_cfg_addr);
-	pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
-#else
-#error "Unexpected __riscv_xlen"
-#endif
-	*pmaxcfg = pma_region->flags;
-
-	andes_pma_write_num(pma_cfg_addr, pmacfg_val);
+	set_pmaxcfg(entry_id, pma_region->flags);
 
 	pmaaddr = (addr >> 2) + (size >> 3) - 1;
 
@@ -404,3 +409,29 @@ int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags)
 
 	return SBI_SUCCESS;
 }
+
+int andes_sbi_free_pma(unsigned long pa)
+{
+	unsigned long start, size;
+	char pmaxcfg;
+
+	for (int i = 0; i < ANDES_MAX_PMA_REGIONS; i++) {
+		pmaxcfg = get_pmaxcfg(i);
+		if (is_pma_entry_disable(pmaxcfg))
+			continue;
+
+		decode_pmaaddrx(i, &start, &size);
+		if (start != pa)
+			continue;
+
+		set_pmaxcfg(i, ANDES_PMACFG_ETYP_OFF);
+		andes_pma_write_num(CSR_PMAADDR0 + i, 0);
+
+		return SBI_SUCCESS;
+	}
+
+	sbi_printf("ERROR %s(): Failed to find the entry with PA %#lx\n",
+		   __func__, pa);
+
+	return SBI_ERR_FAILED;
+}
diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
index 0e4a43d..0e1e59e 100644
--- a/platform/generic/andes/andes_sbi.c
+++ b/platform/generic/andes/andes_sbi.c
@@ -14,6 +14,7 @@ enum sbi_ext_andes_fid {
 	SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
 	SBI_EXT_ANDES_PMA_PROBE,
 	SBI_EXT_ANDES_PMA_SET,
+	SBI_EXT_ANDES_PMA_FREE,
 };
 
 static bool andes_cache_controllable(void)
@@ -51,6 +52,9 @@ int andes_sbi_vendor_ext_provider(long funcid,
 	case SBI_EXT_ANDES_PMA_SET:
 		ret = andes_sbi_set_pma(regs->a0, regs->a1, regs->a2);
 		break;
+	case SBI_EXT_ANDES_PMA_FREE:
+		ret = andes_sbi_free_pma(regs->a0);
+		break;
 
 	default:
 		ret = SBI_ENOTSUPP;
diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
index 487d9bf..e2d5279 100644
--- a/platform/generic/include/andes/andes_pma.h
+++ b/platform/generic/include/andes/andes_pma.h
@@ -77,4 +77,13 @@ bool andes_sbi_probe_pma(void);
  */
 int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags);
 
+/**
+ * Reset the memory attribute of a NAPOT region
+ * @param pa Start address of the NAPOT region
+ *
+ * @return SBI_SUCCESS on success
+ * @return SBI_ERR_FAILED if the given region is not set before
+ */
+int andes_sbi_free_pma(unsigned long pa);
+
 #endif /* _ANDES_PMA_H_ */
-- 
2.34.1


