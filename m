From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Apr 2023 18:02:30 +0530
Subject: [PATCH 17/17] lib: utils/irqchip: Use scratch space to save per-HART IMSIC pointer
In-Reply-To: <20230425123230.3943447-1-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
Message-ID: <20230425123230.3943447-18-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using a global array indexed by hartid, we should use
scratch space to save per-HART IMSIC pointer and IMSIC file number.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/irqchip/fdt_irqchip_imsic.c |  4 +-
 lib/utils/irqchip/imsic.c             | 87 ++++++++++++++++++++++-----
 2 files changed, 74 insertions(+), 17 deletions(-)

diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 574cadc..20ee0d8 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -78,13 +78,13 @@ static int irqchip_imsic_cold_init(void *fdt, int nodeoff,
 		return 0;
 	}
 
-	rc = irqchip_imsic_update_hartid_table(fdt, nodeoff, id);
+	rc = imsic_cold_irqchip_init(id);
 	if (rc) {
 		sbi_free(id);
 		return rc;
 	}
 
-	rc = imsic_cold_irqchip_init(id);
+	rc = irqchip_imsic_update_hartid_table(fdt, nodeoff, id);
 	if (rc) {
 		sbi_free(id);
 		return rc;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 11667cd..2b3e9da 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -13,10 +13,10 @@
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
-#include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_ipi.h>
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi_utils/irqchip/imsic.h>
 
 #define IMSIC_MMIO_PAGE_LE		0x00
@@ -79,33 +79,69 @@ do { \
 	csr_clear(CSR_MIREG, __v); \
 } while (0)
 
-static struct imsic_data *imsic_hartid2data[SBI_HARTMASK_MAX_BITS];
-static int imsic_hartid2file[SBI_HARTMASK_MAX_BITS];
+static unsigned long imsic_ptr_offset;
+
+#define imsic_get_hart_data_ptr(__scratch)				\
+({									\
+	(void *)(*((ulong *)sbi_scratch_offset_ptr((__scratch),		\
+						   imsic_ptr_offset)));\
+})
+
+#define imsic_set_hart_data_ptr(__scratch, __imsic)			\
+do {									\
+	*((ulong *)sbi_scratch_offset_ptr((__scratch), imsic_ptr_offset))\
+					= (ulong)(__imsic);		\
+} while (0)
+
+static unsigned long imsic_file_offset;
+
+#define imsic_get_hart_file(__scratch)					\
+({									\
+	*((long *)sbi_scratch_offset_ptr((__scratch), imsic_file_offset));\
+})
+
+#define imsic_set_hart_file(__scratch, __file)				\
+do {									\
+	*((long *)sbi_scratch_offset_ptr((__scratch), imsic_file_offset))\
+					= (long)(__file);		\
+} while (0)
 
 int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
 {
-	if (!imsic || !imsic->targets_mmode ||
-	    (SBI_HARTMASK_MAX_BITS <= hartid))
+	struct sbi_scratch *scratch;
+
+	if (!imsic || !imsic->targets_mmode)
 		return SBI_EINVAL;
 
-	imsic_hartid2data[hartid] = imsic;
-	imsic_hartid2file[hartid] = file;
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch)
+		return SBI_ENOENT;
+
+	imsic_set_hart_data_ptr(scratch, imsic);
+	imsic_set_hart_file(scratch, file);
 	return 0;
 }
 
 struct imsic_data *imsic_get_data(u32 hartid)
 {
-	if (SBI_HARTMASK_MAX_BITS <= hartid)
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch)
 		return NULL;
-	return imsic_hartid2data[hartid];
+
+	return imsic_get_hart_data_ptr(scratch);
 }
 
 int imsic_get_target_file(u32 hartid)
 {
-	if ((SBI_HARTMASK_MAX_BITS <= hartid) ||
-	    !imsic_hartid2data[hartid])
+	struct sbi_scratch *scratch;
+
+	scratch = sbi_hartid_to_scratch(hartid);
+	if (!scratch)
 		return SBI_ENOENT;
-	return imsic_hartid2file[hartid];
+
+	return imsic_get_hart_file(scratch);
 }
 
 static int imsic_external_irqfn(struct sbi_trap_regs *regs)
@@ -133,9 +169,16 @@ static void imsic_ipi_send(u32 target_hart)
 {
 	unsigned long reloff;
 	struct imsic_regs *regs;
-	struct imsic_data *data = imsic_hartid2data[target_hart];
-	int file = imsic_hartid2file[target_hart];
+	struct imsic_data *data;
+	struct sbi_scratch *scratch;
+	int file;
 
+	scratch = sbi_hartid_to_scratch(target_hart);
+	if (!scratch)
+		return;
+
+	data = imsic_get_hart_data_ptr(scratch);
+	file = imsic_get_hart_file(scratch);
 	if (!data || !data->targets_mmode)
 		return;
 
@@ -204,7 +247,7 @@ void imsic_local_irqchip_init(void)
 
 int imsic_warm_irqchip_init(void)
 {
-	struct imsic_data *imsic = imsic_hartid2data[current_hartid()];
+	struct imsic_data *imsic = imsic_get_data(current_hartid());
 
 	/* Sanity checks */
 	if (!imsic || !imsic->targets_mmode)
@@ -306,6 +349,20 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	if (!imsic->targets_mmode)
 		return SBI_EINVAL;
 
+	/* Allocate scratch space pointer */
+	if (!imsic_ptr_offset) {
+		imsic_ptr_offset = sbi_scratch_alloc_offset(sizeof(ulong));
+		if (!imsic_ptr_offset)
+			return SBI_ENOMEM;
+	}
+
+	/* Allocate scratch space file */
+	if (!imsic_file_offset) {
+		imsic_file_offset = sbi_scratch_alloc_offset(sizeof(long));
+		if (!imsic_file_offset)
+			return SBI_ENOMEM;
+	}
+
 	/* Setup external interrupt function for IMSIC */
 	sbi_irqchip_set_irqfn(imsic_external_irqfn);
 
-- 
2.34.1


