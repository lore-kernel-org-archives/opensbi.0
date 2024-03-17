From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 17 Mar 2024 18:32:29 +0530
Subject: [PATCH v3 08/10] lib: sbi: Remove regs parameter from trap irq handling functions
In-Reply-To: <20240317130231.1705888-1-apatel@ventanamicro.com>
References: <20240317130231.1705888-1-apatel@ventanamicro.com>
Message-ID: <20240317130231.1705888-9-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The trap irq handling functions no longer require regs parameter
so remove it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 include/sbi/riscv_encoding.h |  2 ++
 lib/sbi/sbi_trap.c           | 13 ++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 46bbeed..d914828 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -80,6 +80,8 @@
 #define HSTATUS_GVA			_UL(0x00000040)
 #define HSTATUS_VSBE			_UL(0x00000020)
 
+#define MCAUSE_IRQ_MASK			(_UL(1) << (__riscv_xlen - 1))
+
 #define IRQ_S_SOFT			1
 #define IRQ_VS_SOFT			2
 #define IRQ_M_SOFT			3
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 72b1788..2462763 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -198,10 +198,9 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	return 0;
 }
 
-static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
+static int sbi_trap_nonaia_irq(unsigned long irq)
 {
-	mcause &= ~(1UL << (__riscv_xlen - 1));
-	switch (mcause) {
+	switch (irq) {
 	case IRQ_M_TIMER:
 		sbi_timer_process();
 		break;
@@ -217,7 +216,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 	return 0;
 }
 
-static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
+static int sbi_trap_aia_irq(void)
 {
 	int rc;
 	unsigned long mtopi;
@@ -273,12 +272,12 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 	tcntx->prev_context = sbi_trap_get_context(scratch);
 	sbi_trap_set_context(scratch, tcntx);
 
-	if (mcause & (1UL << (__riscv_xlen - 1))) {
+	if (mcause & MCAUSE_IRQ_MASK) {
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_SMAIA))
-			rc = sbi_trap_aia_irq(regs, mcause);
+			rc = sbi_trap_aia_irq();
 		else
-			rc = sbi_trap_nonaia_irq(regs, mcause);
+			rc = sbi_trap_nonaia_irq(mcause & ~MCAUSE_IRQ_MASK);
 		msg = "unhandled local interrupt";
 		goto trap_done;
 	}
-- 
2.34.1


