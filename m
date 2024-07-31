From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 30 Jul 2024 21:58:44 -0700
Subject: [PATCH 03/16] lib: utils/fdt: Constify FDT parsing functions
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731045931.2446799-4-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Distinguish between functions which modify the devicetree and those
which only extract information from it. Other than the iterators in
fdt_domain.c, this is a mechanical conversion.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi_utils/fdt/fdt_domain.h |  4 +-
 include/sbi_utils/fdt/fdt_helper.h | 54 +++++++++++++-------------
 include/sbi_utils/fdt/fdt_pmu.h    |  4 +-
 lib/utils/fdt/fdt_domain.c         | 31 +++++++++++----
 lib/utils/fdt/fdt_helper.c         | 62 +++++++++++++++---------------
 lib/utils/fdt/fdt_pmu.c            |  2 +-
 6 files changed, 87 insertions(+), 70 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_domain.h b/include/sbi_utils/fdt/fdt_domain.h
index ee09d1bf..8c2dee09 100644
--- a/include/sbi_utils/fdt/fdt_domain.h
+++ b/include/sbi_utils/fdt/fdt_domain.h
@@ -70,12 +70,12 @@ void fdt_domain_fixup(void *fdt);
  *
  * @return 0 on success and negative error code on failure
  */
-int fdt_domains_populate(void *fdt);
+int fdt_domains_populate(const void *fdt);
 
 #else
 
 static inline void fdt_domain_fixup(void *fdt) { }
-static inline int fdt_domains_populate(void *fdt) { return 0; }
+static inline int fdt_domains_populate(const void *fdt) { return 0; }
 
 #endif
 
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index ab4a80fa..28ae7677 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -34,84 +34,84 @@ struct platform_uart_data {
 	unsigned long reg_offset;
 };
 
-const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
+const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
 				       const struct fdt_match *match_table);
 
-int fdt_find_match(void *fdt, int startoff,
+int fdt_find_match(const void *fdt, int startoff,
 		   const struct fdt_match *match_table,
 		   const struct fdt_match **out_match);
 
-int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
+int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
 
-int fdt_get_node_addr_size(void *fdt, int node, int index,
+int fdt_get_node_addr_size(const void *fdt, int node, int index,
 			   uint64_t *addr, uint64_t *size);
 
-int fdt_get_node_addr_size_by_name(void *fdt, int node, const char *name,
+int fdt_get_node_addr_size_by_name(const void *fdt, int node, const char *name,
 				   uint64_t *addr, uint64_t *size);
 
-bool fdt_node_is_enabled(void *fdt, int nodeoff);
+bool fdt_node_is_enabled(const void *fdt, int nodeoff);
 
-int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
+int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
-int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid);
+int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
 
-int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
+int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
-int fdt_parse_isa_extensions(void *fdt, unsigned int hard_id,
+int fdt_parse_isa_extensions(const void *fdt, unsigned int hard_id,
 			     unsigned long *extensions);
 
-int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
-int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
+int fdt_parse_renesas_scif_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
-int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_shakti_uart_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart);
 
-int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_sifive_uart_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart);
 
-int fdt_parse_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_uart_node(const void *fdt, int nodeoffset,
 			struct platform_uart_data *uart);
 
-int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
+int fdt_parse_uart8250(const void *fdt, struct platform_uart_data *uart,
 		       const char *compatible);
 
-int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
+int fdt_parse_xlnx_uartlite_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart);
 
 struct aplic_data;
 
-int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic);
+int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic);
 
 struct imsic_data;
 
-bool fdt_check_imsic_mlevel(void *fdt);
+bool fdt_check_imsic_mlevel(const void *fdt);
 
-int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic);
+int fdt_parse_imsic_node(const void *fdt, int nodeoff, struct imsic_data *imsic);
 
 struct plic_data;
 
-int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic);
+int fdt_parse_plic_node(const void *fdt, int nodeoffset, struct plic_data *plic);
 
-int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat);
+int fdt_parse_plic(const void *fdt, struct plic_data *plic, const char *compat);
 
-int fdt_parse_aclint_node(void *fdt, int nodeoffset,
+int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
 			  u32 *out_first_hartid, u32 *out_hart_count);
 
-int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
-			  unsigned long *plmt_size, u32 *hart_count);
+int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_base,
+			unsigned long *plmt_size, u32 *hart_count);
 
-int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
+int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw_base,
 			  unsigned long *size, u32 *hart_count);
 
-int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
+int fdt_parse_compat_addr(const void *fdt, uint64_t *addr,
 			  const char *compatible);
 
 static inline void *fdt_get_address(void)
diff --git a/include/sbi_utils/fdt/fdt_pmu.h b/include/sbi_utils/fdt/fdt_pmu.h
index b10ae270..b31d8351 100644
--- a/include/sbi_utils/fdt/fdt_pmu.h
+++ b/include/sbi_utils/fdt/fdt_pmu.h
@@ -52,7 +52,7 @@ int fdt_pmu_fixup(void *fdt);
  *
  * @return 0 on success and negative error code on failure
  */
-int fdt_pmu_setup(void *fdt);
+int fdt_pmu_setup(const void *fdt);
 
 /**
  * Get the mhpmevent select value read from DT for a given event
@@ -70,7 +70,7 @@ extern uint32_t hw_event_count;
 #else
 
 static inline void fdt_pmu_fixup(void *fdt) { }
-static inline int fdt_pmu_setup(void *fdt) { return 0; }
+static inline int fdt_pmu_setup(const void *fdt) { return 0; }
 static inline uint64_t fdt_pmu_get_select_value(uint32_t event_idx) { return 0; }
 
 #endif
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index fa1c3575..1fa53a72 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -48,6 +48,14 @@ int fdt_iterate_each_domain(void *fdt, void *opaque,
 	return 0;
 }
 
+static int fdt_iterate_each_domain_ro(const void *fdt, void *opaque,
+				      int (*fn)(const void *fdt, int domain_offset,
+						void *opaque))
+{
+	return fdt_iterate_each_domain((void *)fdt, opaque,
+				       (int (*)(void *, int,  void *))fn);
+}
+
 int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
 			       int (*fn)(void *fdt, int domain_offset,
 					 int region_offset, u32 region_access,
@@ -88,6 +96,15 @@ int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
 	return 0;
 }
 
+static int fdt_iterate_each_memregion_ro(const void *fdt, int domain_offset, void *opaque,
+					 int (*fn)(const void *fdt, int domain_offset,
+						   int region_offset, u32 region_access,
+						   void *opaque))
+{
+	return fdt_iterate_each_memregion((void *)fdt, domain_offset, opaque,
+					  (int (*)(void *, int, int, u32, void *))fn);
+}
+
 struct __fixup_find_domain_offset_info {
 	const char *name;
 	int *doffset;
@@ -228,7 +245,7 @@ struct parse_region_data {
 	u32 max_regions;
 };
 
-static int __fdt_parse_region(void *fdt, int domain_offset,
+static int __fdt_parse_region(const void *fdt, int domain_offset,
 			      int region_offset, u32 region_access,
 			      void *opaque)
 {
@@ -283,7 +300,7 @@ static int __fdt_parse_region(void *fdt, int domain_offset,
 	return 0;
 }
 
-static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
+static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 {
 	u32 val32;
 	u64 val64;
@@ -347,8 +364,8 @@ static int __fdt_parse_domain(void *fdt, int domain_offset, void *opaque)
 	}
 
 	/* Setup memregions from DT */
-	err = fdt_iterate_each_memregion(fdt, domain_offset, &preg,
-					 __fdt_parse_region);
+	err = fdt_iterate_each_memregion_ro(fdt, domain_offset, &preg,
+					    __fdt_parse_region);
 	if (err)
 		goto fail_free_all;
 
@@ -491,7 +508,7 @@ fail_free_domain:
 	return err;
 }
 
-int fdt_domains_populate(void *fdt)
+int fdt_domains_populate(const void *fdt)
 {
 	const u32 *val;
 	int cold_domain_offset;
@@ -530,6 +547,6 @@ int fdt_domains_populate(void *fdt)
 	}
 
 	/* Iterate over each domain in FDT and populate details */
-	return fdt_iterate_each_domain(fdt, &cold_domain_offset,
-				       __fdt_parse_domain);
+	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
+					  __fdt_parse_domain);
 }
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b7f7e075..cb350e5a 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -33,7 +33,7 @@
 #define DEFAULT_SHAKTI_UART_FREQ		50000000
 #define DEFAULT_SHAKTI_UART_BAUD		115200
 
-const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
+const struct fdt_match *fdt_match_node(const void *fdt, int nodeoff,
 				       const struct fdt_match *match_table)
 {
 	int ret;
@@ -52,7 +52,7 @@ const struct fdt_match *fdt_match_node(void *fdt, int nodeoff,
 	return NULL;
 }
 
-int fdt_find_match(void *fdt, int startoff,
+int fdt_find_match(const void *fdt, int startoff,
 		   const struct fdt_match *match_table,
 		   const struct fdt_match **out_match)
 {
@@ -75,7 +75,7 @@ int fdt_find_match(void *fdt, int startoff,
 	return SBI_ENODEV;
 }
 
-int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
+int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args)
 {
@@ -122,7 +122,7 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
 	return SBI_ENOENT;
 }
 
-static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
+static int fdt_translate_address(const void *fdt, uint64_t reg, int parent,
 				 uint64_t *addr)
 {
 	int i, rlen;
@@ -160,7 +160,7 @@ static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
 	return 0;
 }
 
-int fdt_get_node_addr_size(void *fdt, int node, int index,
+int fdt_get_node_addr_size(const void *fdt, int node, int index,
 			   uint64_t *addr, uint64_t *size)
 {
 	int parent, len, i, rc;
@@ -216,7 +216,7 @@ int fdt_get_node_addr_size(void *fdt, int node, int index,
 	return 0;
 }
 
-int fdt_get_node_addr_size_by_name(void *fdt, int node, const char *name,
+int fdt_get_node_addr_size_by_name(const void *fdt, int node, const char *name,
 				   uint64_t *addr, uint64_t *size)
 {
 	int i, j, count;
@@ -242,7 +242,7 @@ int fdt_get_node_addr_size_by_name(void *fdt, int node, const char *name,
 	return SBI_ENODEV;
 }
 
-bool fdt_node_is_enabled(void *fdt, int nodeoff)
+bool fdt_node_is_enabled(const void *fdt, int nodeoff)
 {
 	int len;
 	const void *prop;
@@ -260,7 +260,7 @@ bool fdt_node_is_enabled(void *fdt, int nodeoff)
 	return false;
 }
 
-int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid)
+int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
 {
 	int len;
 	const void *prop;
@@ -288,7 +288,7 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
-int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid)
+int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
 {
 	u32 hartid;
 	int err, cpu_offset, cpus_offset;
@@ -319,7 +319,7 @@ int fdt_parse_max_enabled_hart_id(void *fdt, u32 *max_hartid)
 	return 0;
 }
 
-int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
+int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 {
 	const fdt32_t *val;
 	int len, cpus_offset;
@@ -423,7 +423,7 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 	}
 }
 
-static int fdt_parse_isa_all_harts(void *fdt)
+static int fdt_parse_isa_all_harts(const void *fdt)
 {
 	u32 hartid;
 	const fdt32_t *val;
@@ -472,7 +472,7 @@ static int fdt_parse_isa_all_harts(void *fdt)
 	return 0;
 }
 
-int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
+int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
 			unsigned long *extensions)
 {
 	int rc, i;
@@ -502,7 +502,7 @@ int fdt_parse_isa_extensions(void *fdt, unsigned int hartid,
 	return 0;
 }
 
-static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
+static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
 				      unsigned long default_baud)
@@ -539,7 +539,7 @@ static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
 	return 0;
 }
 
-int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart)
 {
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
@@ -547,7 +547,7 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 					DEFAULT_UART_BAUD);
 }
 
-int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
+int fdt_parse_renesas_scif_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart)
 {
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
@@ -555,7 +555,7 @@ int fdt_parse_renesas_scif_node(void *fdt, int nodeoffset,
 					  DEFAULT_RENESAS_SCIF_BAUD);
 }
 
-int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_shakti_uart_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
@@ -563,7 +563,7 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 					DEFAULT_SHAKTI_UART_BAUD);
 }
 
-int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_sifive_uart_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
@@ -571,7 +571,7 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 					DEFAULT_SIFIVE_UART_BAUD);
 }
 
-int fdt_parse_uart_node(void *fdt, int nodeoffset,
+int fdt_parse_uart_node(const void *fdt, int nodeoffset,
 			struct platform_uart_data *uart)
 {
 	int len, rc;
@@ -604,7 +604,7 @@ int fdt_parse_uart_node(void *fdt, int nodeoffset,
 	return 0;
 }
 
-int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
+int fdt_parse_uart8250(const void *fdt, struct platform_uart_data *uart,
 		   const char *compatible)
 {
 	int nodeoffset;
@@ -619,13 +619,13 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
 	return fdt_parse_uart_node(fdt, nodeoffset, uart);
 }
 
-int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
+int fdt_parse_xlnx_uartlite_node(const void *fdt, int nodeoffset,
 			       struct platform_uart_data *uart)
 {
 	return fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
 }
 
-int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
+int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 {
 	bool child_found;
 	const fdt32_t *val;
@@ -785,7 +785,7 @@ skip_delegate_parse:
 	return 0;
 }
 
-bool fdt_check_imsic_mlevel(void *fdt)
+bool fdt_check_imsic_mlevel(const void *fdt)
 {
 	const fdt32_t *val;
 	int i, len, noff = 0;
@@ -808,7 +808,7 @@ bool fdt_check_imsic_mlevel(void *fdt)
 	return false;
 }
 
-int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
+int fdt_parse_imsic_node(const void *fdt, int nodeoff, struct imsic_data *imsic)
 {
 	const fdt32_t *val;
 	struct imsic_regs *regs;
@@ -887,7 +887,7 @@ int fdt_parse_imsic_node(void *fdt, int nodeoff, struct imsic_data *imsic)
 	return 0;
 }
 
-int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
+int fdt_parse_plic_node(const void *fdt, int nodeoffset, struct plic_data *plic)
 {
 	int len, rc;
 	const fdt32_t *val;
@@ -910,7 +910,7 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
 	return 0;
 }
 
-int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat)
+int fdt_parse_plic(const void *fdt, struct plic_data *plic, const char *compat)
 {
 	int nodeoffset;
 
@@ -924,7 +924,7 @@ int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat)
 	return fdt_parse_plic_node(fdt, nodeoffset, plic);
 }
 
-static int fdt_get_aclint_addr_size_by_name(void *fdt, int nodeoffset,
+static int fdt_get_aclint_addr_size_by_name(const void *fdt, int nodeoffset,
 					    unsigned long *out_addr1,
 					    unsigned long *out_size1,
 					    unsigned long *out_addr2,
@@ -950,7 +950,7 @@ static int fdt_get_aclint_addr_size_by_name(void *fdt, int nodeoffset,
 	return 0;
 }
 
-static int fdt_get_aclint_addr_size(void *fdt, int nodeoffset,
+static int fdt_get_aclint_addr_size(const void *fdt, int nodeoffset,
 				    unsigned long *out_addr1,
 				    unsigned long *out_size1,
 				    unsigned long *out_addr2,
@@ -978,7 +978,7 @@ static int fdt_get_aclint_addr_size(void *fdt, int nodeoffset,
 	return 0;
 }
 
-int fdt_parse_aclint_node(void *fdt, int nodeoffset,
+int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
@@ -1053,7 +1053,7 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset,
 	return 0;
 }
 
-int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
+int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_base,
 			  unsigned long *plmt_size, u32 *hart_count)
 {
 	const fdt32_t *val;
@@ -1109,7 +1109,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
 	return 0;
 }
 
-int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
+int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw_base,
 			  unsigned long *size, u32 *hart_count)
 {
 	const fdt32_t *val;
@@ -1165,7 +1165,7 @@ int fdt_parse_plicsw_node(void *fdt, int nodeoffset, unsigned long *plicsw_base,
 	return 0;
 }
 
-int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
+int fdt_parse_compat_addr(const void *fdt, uint64_t *addr,
 			  const char *compatible)
 {
 	int nodeoffset, rc;
diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index e23e8223..64de569e 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -56,7 +56,7 @@ int fdt_pmu_fixup(void *fdt)
 	return 0;
 }
 
-int fdt_pmu_setup(void *fdt)
+int fdt_pmu_setup(const void *fdt)
 {
 	int i, pmu_offset, len, result;
 	const u32 *event_val;
-- 
2.45.1


