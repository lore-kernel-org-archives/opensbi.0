From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 24 Mar 2025 08:48:08 -0700
Subject: [PATCH v2 4/5] lib: utils: Use fdt_cpu_intc_phandle_to_hartindex()
In-Reply-To: <20250324154858.4147529-1-samuel.holland@sifive.com>
References: <20250324154858.4147529-1-samuel.holland@sifive.com>
Message-ID: <20250324154858.4147529-5-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the cached information to look up the hart index from an interrupt
reference instead of parsing the DT each time.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 include/sbi_utils/irqchip/imsic.h     |  2 +-
 lib/utils/fdt/fdt_helper.c            | 59 +++++----------------------
 lib/utils/irqchip/fdt_irqchip_imsic.c | 19 +++------
 lib/utils/irqchip/fdt_irqchip_plic.c  | 21 +++-------
 lib/utils/irqchip/imsic.c             |  6 +--
 5 files changed, 25 insertions(+), 82 deletions(-)

diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index 353cefec..e4e750b0 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -35,7 +35,7 @@ struct imsic_data {
 
 #ifdef CONFIG_IRQCHIP_IMSIC
 
-int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file);
+int imsic_map_hartindex_to_data(u32 hartindex, struct imsic_data *imsic, int file);
 
 struct imsic_data *imsic_get_data(u32 hartindex);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 937ad83a..13f38510 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -920,8 +920,8 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  u32 *out_first_hartid, u32 *out_hart_count)
 {
 	const fdt32_t *val;
-	int i, rc, count, cpu_offset, cpu_intc_offset;
-	u32 phandle, hwirq, hartid, first_hartid, last_hartid, hart_count;
+	int i, rc, count;
+	u32 phandle, hwirq, hartindex, hartid, first_hartid, last_hartid, hart_count;
 	u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
 
 	if (nodeoffset < 0 || !fdt ||
@@ -955,20 +955,11 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[(2 * i) + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
-			continue;
+		hartid = sbi_hartindex_to_hartid(hartindex);
 
 		if (match_hwirq == hwirq) {
 			if (hartid < first_hartid)
@@ -994,7 +985,7 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
 	const fdt32_t *val;
 	int rc, i, count;
 	uint64_t reg_addr, reg_size;
-	u32 phandle, hwirq, hartid, hcount;
+	u32 phandle, hwirq, hartindex, hcount;
 
 	if (nodeoffset < 0 || !fdt || !plmt_base ||
 	    !hart_count || !plmt_size)
@@ -1014,25 +1005,11 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
 
 	hcount = 0;
 	for (i = 0; i < (count / 2); i++) {
-		int cpu_offset, cpu_intc_offset;
-
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[2 * i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		if (hwirq == IRQ_M_TIMER)
@@ -1050,7 +1027,7 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 	const fdt32_t *val;
 	int rc, i, count;
 	uint64_t reg_addr, reg_size;
-	u32 phandle, hwirq, hartid, hcount;
+	u32 phandle, hwirq, hartindex, hcount;
 
 	if (nodeoffset < 0 || !fdt || !plicsw_base ||
 	    !hart_count || !size)
@@ -1070,25 +1047,11 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 
 	hcount = 0;
 	for (i = 0; i < (count / 2); i++) {
-		int cpu_offset, cpu_intc_offset;
-
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[2 * i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		if (hwirq == IRQ_M_SOFT)
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 2e47cc81..153c4785 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -20,8 +21,8 @@ static int irqchip_imsic_update_hartid_table(const void *fdt, int nodeoff,
 					     struct imsic_data *id)
 {
 	const fdt32_t *val;
-	u32 phandle, hwirq, hartid;
-	int i, err, count, cpu_offset, cpu_intc_offset;
+	u32 phandle, hwirq, hartindex;
+	int i, err, count;
 
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
 	if (!val || count < sizeof(fdt32_t))
@@ -32,21 +33,11 @@ static int irqchip_imsic_update_hartid_table(const void *fdt, int nodeoff,
 		phandle = fdt32_to_cpu(val[i]);
 		hwirq = fdt32_to_cpu(val[i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			return SBI_EINVAL;
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
 
 		switch (hwirq) {
 		case IRQ_M_EXT:
-			err = imsic_map_hartid_to_data(hartid, id, i / 2);
+			err = imsic_map_hartindex_to_data(hartindex, id, i / 2);
 			if (err)
 				return err;
 			break;
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 65a9de15..98ff02c0 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/plic.h>
@@ -21,8 +22,8 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 					   struct plic_data *pd)
 {
 	const fdt32_t *val;
-	u32 phandle, hwirq, hartid, hartindex;
-	int i, err, count, cpu_offset, cpu_intc_offset;
+	u32 phandle, hwirq, hartindex;
+	int i, count;
 
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
 	if (!val || count < sizeof(fdt32_t))
@@ -33,20 +34,8 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 		phandle = fdt32_to_cpu(val[i]);
 		hwirq = fdt32_to_cpu(val[i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		hartindex = sbi_hartid_to_hartindex(hartid);
-		if (hartindex == -1U)
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		switch (hwirq) {
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 057b9fa7..bcf1aa55 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -96,7 +96,7 @@ static unsigned long imsic_file_offset;
 #define imsic_set_hart_file(__scratch, __file)				\
 	sbi_scratch_write_type((__scratch), long, imsic_file_offset, (__file))
 
-int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
+int imsic_map_hartindex_to_data(u32 hartindex, struct imsic_data *imsic, int file)
 {
 	struct sbi_scratch *scratch;
 
@@ -105,12 +105,12 @@ int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
 
 	/*
 	 * We don't need to fail if scratch pointer is not available
-	 * because we might be dealing with hartid of a HART disabled
+	 * because we might be dealing with hartindex of a HART disabled
 	 * in device tree. For HARTs disabled in device tree, the
 	 * imsic_get_data() and imsic_get_target_file() will anyway
 	 * fail.
 	 */
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return 0;
 
-- 
2.47.2


