From: Inochi Amaoto <inochiama@outlook.com>
Date: Fri, 17 Nov 2023 20:13:09 +0800
Subject: [PATCH v2] lib: utils/fdt: Allow to use reg-names when parsing ACLINT
Message-ID: <IA1PR20MB49532E6C3653C0F3EC3EFCDEBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the fdt_parse_aclint_node() follows a fixed order to parse
ACLINT timer. This may cause the undesirable result when the ACLINT
device does not support mtime without adding an empty entry for it in
the DT.

To be robust, make fdt_parse_aclint_node() support "reg-names" property,
so it can parse the DT in an order independent way. For compatibility,
fdt_parse_aclint_node() only use "reg-names" when parsing ACLINT timer,
and will fallback to the old way if "reg-names" property is not found.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://lore.kernel.org/all/20231114-skedaddle-precinct-66c8897227bb at squawk/
---
Changed from v1:
1. add fdt_get_node_addr_size_by_name to fdt_helper.h
2. make fdt_get_aclint_addr_size_by_name, fdt_get_aclint_addr_size static
---
 include/sbi_utils/fdt/fdt_helper.h |   3 +
 lib/utils/fdt/fdt_helper.c         | 107 ++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 16 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 5c928ff..430d818 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -48,6 +48,9 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
 int fdt_get_node_addr_size(void *fdt, int node, int index,
 			   uint64_t *addr, uint64_t *size);

+int fdt_get_node_addr_size_by_name(void *fdt, int node, const char *name,
+				   uint64_t *addr, uint64_t *size);
+
 bool fdt_node_is_enabled(void *fdt, int nodeoff);

 int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 9ae7f09..83299a8 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -216,6 +216,32 @@ int fdt_get_node_addr_size(void *fdt, int node, int index,
 	return 0;
 }

+int fdt_get_node_addr_size_by_name(void *fdt, int node, const char *name,
+				   uint64_t *addr, uint64_t *size)
+{
+	int i, j, count;
+	const char *val;
+	const char *regname;
+
+	if (!fdt || node < 0 || !name)
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, node, "reg-names", &count);
+	if (!val)
+		return SBI_ENODEV;
+
+	for (i = 0, j = 0; i < count; i++, j++) {
+		regname = val + i;
+
+		if (strcmp(name, regname) == 0)
+			return fdt_get_node_addr_size(fdt, node, j, addr, size);
+
+		i += strlen(regname);
+	}
+
+	return SBI_ENODEV;
+}
+
 bool fdt_node_is_enabled(void *fdt, int nodeoff)
 {
 	int len;
@@ -873,13 +899,66 @@ int fdt_parse_plic(void *fdt, struct plic_data *plic, const char *compat)
 	return fdt_parse_plic_node(fdt, nodeoffset, plic);
 }

+static int fdt_get_aclint_addr_size_by_name(void *fdt, int nodeoffset,
+					    unsigned long *out_addr1,
+					    unsigned long *out_size1,
+					    unsigned long *out_addr2,
+					    unsigned long *out_size2)
+{
+	int rc;
+	uint64_t reg_addr, reg_size;
+
+	rc = fdt_get_node_addr_size_by_name(fdt, nodeoffset, "mtime",
+					    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_size)
+		reg_addr = reg_size = 0;
+	*out_addr1 = reg_addr;
+	*out_size1 = reg_size;
+
+	rc = fdt_get_node_addr_size_by_name(fdt, nodeoffset, "mtimecmp",
+					    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_size)
+		return SBI_ENODEV;
+	*out_addr2 = reg_addr;
+	*out_size2 = reg_size;
+
+	return 0;
+}
+
+static int fdt_get_aclint_addr_size(void *fdt, int nodeoffset,
+				    unsigned long *out_addr1,
+				    unsigned long *out_size1,
+				    unsigned long *out_addr2,
+				    unsigned long *out_size2)
+{
+	int rc;
+	uint64_t reg_addr, reg_size;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_size)
+		return SBI_ENODEV;
+	*out_addr1 = reg_addr;
+	*out_size1 = reg_size;
+
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 1,
+				    &reg_addr, &reg_size);
+	if (rc < 0 || !reg_size)
+		reg_addr = reg_size = 0;
+	if (out_addr2)
+		*out_addr2 = reg_addr;
+	if (out_size2)
+		*out_size2 = reg_size;
+
+	return 0;
+}
+
 int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
 			  u32 *out_first_hartid, u32 *out_hart_count)
 {
 	const fdt32_t *val;
-	uint64_t reg_addr, reg_size;
 	int i, rc, count, cpu_offset, cpu_intc_offset;
 	u32 phandle, hwirq, hartid, first_hartid, last_hartid, hart_count;
 	u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
@@ -889,21 +968,17 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 	    !out_first_hartid || !out_hart_count)
 		return SBI_EINVAL;

-	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
-				    &reg_addr, &reg_size);
-	if (rc < 0 || !reg_size)
-		return SBI_ENODEV;
-	*out_addr1 = reg_addr;
-	*out_size1 = reg_size;
-
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, 1,
-				    &reg_addr, &reg_size);
-	if (rc < 0 || !reg_size)
-		reg_addr = reg_size = 0;
-	if (out_addr2)
-		*out_addr2 = reg_addr;
-	if (out_size2)
-		*out_size2 = reg_size;
+	if (for_timer && out_addr2 && out_size2 &&
+	    fdt_getprop(fdt, nodeoffset, "reg-names", NULL))
+		rc = fdt_get_aclint_addr_size_by_name(fdt, nodeoffset,
+						      out_addr1, out_size1,
+						      out_addr2, out_size2);
+	else
+		rc = fdt_get_aclint_addr_size(fdt, nodeoffset,
+					      out_addr1, out_size1,
+					      out_addr2, out_size2);
+	if (rc)
+		return rc;

 	*out_first_hartid = 0;
 	*out_hart_count = 0;
--
2.42.1


