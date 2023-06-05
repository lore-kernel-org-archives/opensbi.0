From: Anup Patel <apatel@ventanamicro.com>
Date: Mon,  5 Jun 2023 17:07:47 +0530
Subject: [PATCH v2 16/18] lib: utils/irqchip: Use scratch space to save per-HART PLIC pointer
In-Reply-To: <20230605113749.230696-1-apatel@ventanamicro.com>
References: <20230605113749.230696-1-apatel@ventanamicro.com>
Message-ID: <20230605113749.230696-17-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array indexed by hartid, we should use
scratch space to save per-HART PLIC pointer and PLIC context numbers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 88 +++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 22 deletions(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index d733284..829c5ee 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -12,54 +12,77 @@
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
-#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/plic.h>
 
-static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
-static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2] = { { -1 } };
+static unsigned long plic_ptr_offset;
+
+#define plic_get_hart_data_ptr(__scratch)				\
+	sbi_scratch_read_type((__scratch), void *, plic_ptr_offset)
+
+#define plic_set_hart_data_ptr(__scratch, __plic)			\
+	sbi_scratch_write_type((__scratch), void *, plic_ptr_offset, (__plic))
+
+static unsigned long plic_mcontext_offset;
+
+#define plic_get_hart_mcontext(__scratch)				\
+	(sbi_scratch_read_type((__scratch), long, plic_mcontext_offset) - 1)
+
+#define plic_set_hart_mcontext(__scratch, __mctx)			\
+	sbi_scratch_write_type((__scratch), long, plic_mcontext_offset, (__mctx) + 1)
+
+static unsigned long plic_scontext_offset;
+
+#define plic_get_hart_scontext(__scratch)				\
+	(sbi_scratch_read_type((__scratch), long, plic_scontext_offset) - 1)
+
+#define plic_set_hart_scontext(__scratch, __sctx)			\
+	sbi_scratch_write_type((__scratch), long, plic_scontext_offset, (__sctx) + 1)
 
 void fdt_plic_priority_save(u8 *priority, u32 num)
 {
-	struct plic_data *plic = plic_hartid2data[current_hartid()];
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_priority_save(plic, priority, num);
+	plic_priority_save(plic_get_hart_data_ptr(scratch), priority, num);
 }
 
 void fdt_plic_priority_restore(const u8 *priority, u32 num)
 {
-	struct plic_data *plic = plic_hartid2data[current_hartid()];
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_priority_restore(plic, priority, num);
+	plic_priority_restore(plic_get_hart_data_ptr(scratch), priority, num);
 }
 
 void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num)
 {
-	u32 hartid = current_hartid();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_context_save(plic_hartid2data[hartid],
-			  plic_hartid2context[hartid][smode],
+	plic_context_save(plic_get_hart_data_ptr(scratch),
+			  smode ? plic_get_hart_scontext(scratch) :
+				  plic_get_hart_mcontext(scratch),
 			  enable, threshold, num);
 }
 
 void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
 			      u32 num)
 {
-	u32 hartid = current_hartid();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	plic_context_restore(plic_hartid2data[hartid],
-			     plic_hartid2context[hartid][smode],
+	plic_context_restore(plic_get_hart_data_ptr(scratch),
+			     smode ? plic_get_hart_scontext(scratch) :
+				     plic_get_hart_mcontext(scratch),
 			     enable, threshold, num);
 }
 
 static int irqchip_plic_warm_init(void)
 {
-	u32 hartid = current_hartid();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 
-	return plic_warm_irqchip_init(plic_hartid2data[hartid],
-				      plic_hartid2context[hartid][0],
-				      plic_hartid2context[hartid][1]);
+	return plic_warm_irqchip_init(plic_get_hart_data_ptr(scratch),
+				      plic_get_hart_mcontext(scratch),
+				      plic_get_hart_scontext(scratch));
 }
 
 static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
@@ -67,6 +90,7 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
 {
 	const fdt32_t *val;
 	u32 phandle, hwirq, hartid;
+	struct sbi_scratch *scratch;
 	int i, err, count, cpu_offset, cpu_intc_offset;
 
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
@@ -90,16 +114,17 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
 		if (err)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= hartid)
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
 			continue;
 
-		plic_hartid2data[hartid] = pd;
+		plic_set_hart_data_ptr(scratch, pd);
 		switch (hwirq) {
 		case IRQ_M_EXT:
-			plic_hartid2context[hartid][0] = i / 2;
+			plic_set_hart_mcontext(scratch, i / 2);
 			break;
 		case IRQ_S_EXT:
-			plic_hartid2context[hartid][1] = i / 2;
+			plic_set_hart_scontext(scratch, i / 2);
 			break;
 		}
 	}
@@ -113,6 +138,24 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
 	int rc;
 	struct plic_data *pd;
 
+	if (!plic_ptr_offset) {
+		plic_ptr_offset = sbi_scratch_alloc_type_offset(void *);
+		if (!plic_ptr_offset)
+			return SBI_ENOMEM;
+	}
+
+	if (!plic_mcontext_offset) {
+		plic_mcontext_offset = sbi_scratch_alloc_type_offset(long);
+		if (!plic_mcontext_offset)
+			return SBI_ENOMEM;
+	}
+
+	if (!plic_scontext_offset) {
+		plic_scontext_offset = sbi_scratch_alloc_type_offset(long);
+		if (!plic_scontext_offset)
+			return SBI_ENOMEM;
+	}
+
 	pd = sbi_zalloc(sizeof(*pd));
 	if (!pd)
 		return SBI_ENOMEM;
@@ -150,7 +193,8 @@ static void thead_plic_plat_init(struct plic_data *pd)
 
 void thead_plic_restore(void)
 {
-	struct plic_data *plic = plic_hartid2data[current_hartid()];
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	struct plic_data *plic = plic_get_hart_data_ptr(scratch);
 
 	thead_plic_plat_init(plic);
 }
-- 
2.34.1


