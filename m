From: Anup Patel <anup.patel@wdc.com>
Date: Sat,  7 Aug 2021 19:03:19 +0530
Subject: [PATCH v2 2/5] lib: utils: Extend fdt_get_node_addr_size() for
 multiple register sets
In-Reply-To: <20210807133322.545675-1-anup.patel@wdc.com>
References: <20210807133322.545675-1-anup.patel@wdc.com>
Message-ID: <20210807133322.545675-3-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add "index" parameter to fdt_get_node_addr_size() API so that
calling function can specify index of desired register set. This
will allow fdt_get_node_addr_size() to handle DT nodes with
multiple register sets.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi_utils/fdt/fdt_helper.h      |  4 ++--
 lib/utils/fdt/fdt_helper.c              | 31 ++++++++++++++++++-------
 lib/utils/gpio/fdt_gpio_sifive.c        |  2 +-
 lib/utils/reset/fdt_reset_sifive_test.c |  2 +-
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 32aebb4..1a93e1c 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -43,8 +43,8 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args);
 
-int fdt_get_node_addr_size(void *fdt, int node, uint64_t *addr,
-			   uint64_t *size);
+int fdt_get_node_addr_size(void *fdt, int node, int index,
+			   uint64_t *addr, uint64_t *size);
 
 int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index a27f5ba..b68544f 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -157,13 +157,17 @@ static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
 	return 0;
 }
 
-int fdt_get_node_addr_size(void *fdt, int node, uint64_t *addr, uint64_t *size)
+int fdt_get_node_addr_size(void *fdt, int node, int index,
+			   uint64_t *addr, uint64_t *size)
 {
 	int parent, len, i, rc;
 	int cell_addr, cell_size;
 	const fdt32_t *prop_addr, *prop_size;
 	uint64_t temp = 0;
 
+	if (!fdt || node < 0 || index < 0)
+		return SBI_EINVAL;
+
 	parent = fdt_parent_offset(fdt, node);
 	if (parent < 0)
 		return parent;
@@ -178,6 +182,11 @@ int fdt_get_node_addr_size(void *fdt, int node, uint64_t *addr, uint64_t *size)
 	prop_addr = fdt_getprop(fdt, node, "reg", &len);
 	if (!prop_addr)
 		return SBI_ENODEV;
+
+	if ((len / sizeof(u32)) <= (index * (cell_addr + cell_size)))
+		return SBI_EINVAL;
+
+	prop_addr = prop_addr + (index * (cell_addr + cell_size));
 	prop_size = prop_addr + cell_addr;
 
 	if (addr) {
@@ -270,7 +279,8 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
 	if (nodeoffset < 0 || !uart || !fdt)
 		return SBI_ENODEV;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	uart->addr = reg_addr;
@@ -308,7 +318,8 @@ int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
 	if (nodeoffset < 0 || !uart || !fdt)
 		return SBI_ENODEV;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	uart->addr = reg_addr;
@@ -342,7 +353,8 @@ int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
 	if (nodeoffset < 0 || !uart || !fdt)
 		return SBI_ENODEV;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	uart->addr = reg_addr;
@@ -380,7 +392,8 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
 	if (nodeoffset < 0 || !uart || !fdt)
 		return SBI_ENODEV;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	uart->addr = reg_addr;
@@ -440,7 +453,8 @@ int fdt_parse_plic_node(void *fdt, int nodeoffset, struct plic_data *plic)
 	if (nodeoffset < 0 || !plic || !fdt)
 		return SBI_ENODEV;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	plic->addr = reg_addr;
@@ -481,7 +495,8 @@ int fdt_parse_aclint_node(void *fdt, int nodeoffset, bool for_timer,
 	    !out_first_hartid || !out_hart_count)
 		return SBI_EINVAL;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, &reg_addr, &reg_size);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
+				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
 	*out_addr = reg_addr;
@@ -543,7 +558,7 @@ int fdt_parse_compat_addr(void *fdt, uint64_t *addr,
 	if (nodeoffset < 0)
 		return nodeoffset;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoffset, addr, NULL);
+	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0, addr, NULL);
 	if (rc < 0 || !addr)
 		return SBI_ENODEV;
 
diff --git a/lib/utils/gpio/fdt_gpio_sifive.c b/lib/utils/gpio/fdt_gpio_sifive.c
index 00d3e14..677f0fa 100644
--- a/lib/utils/gpio/fdt_gpio_sifive.c
+++ b/lib/utils/gpio/fdt_gpio_sifive.c
@@ -77,7 +77,7 @@ static int sifive_gpio_init(void *fdt, int nodeoff, u32 phandle,
 		return SBI_ENOSPC;
 	chip = &sifive_gpio_chip_array[sifive_gpio_chip_count];
 
-	rc = fdt_get_node_addr_size(fdt, nodeoff, &addr, NULL);
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
 	if (rc)
 		return rc;
 
diff --git a/lib/utils/reset/fdt_reset_sifive_test.c b/lib/utils/reset/fdt_reset_sifive_test.c
index b0b59e7..7e0eba3 100644
--- a/lib/utils/reset/fdt_reset_sifive_test.c
+++ b/lib/utils/reset/fdt_reset_sifive_test.c
@@ -18,7 +18,7 @@ static int sifive_test_reset_init(void *fdt, int nodeoff,
 	int rc;
 	uint64_t addr;
 
-	rc = fdt_get_node_addr_size(fdt, nodeoff, &addr, NULL);
+	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &addr, NULL);
 	if (rc)
 		return rc;
 
-- 
2.25.1


