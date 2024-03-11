From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Mar 2024 21:39:42 +0530
Subject: [PATCH 7/9] lib: sbi: Remove regs parameter from trap irq handling functions
In-Reply-To: <20240311160944.1233523-1-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
Message-ID: <20240311160944.1233523-8-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The trap irq handling functions no longer require regs parameter
so remove it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_trap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index e6ef6d1..a50e466 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -198,9 +198,9 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	return 0;
 }
 
-static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
+static int sbi_trap_nonaia_irq(unsigned long mcause)
 {
-	mcause &= ~(1UL << (__riscv_xlen - 1));
+	mcause &= ~BIT(__riscv_xlen - 1);
 	switch (mcause) {
 	case IRQ_M_TIMER:
 		sbi_timer_process();
@@ -217,7 +217,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 	return 0;
 }
 
-static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
+static int sbi_trap_aia_irq(unsigned long mcause)
 {
 	int rc;
 	unsigned long mtopi;
@@ -291,12 +291,12 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 	/* Update trap context pointer */
 	sbi_trap_set_context(scratch, &tcntx);
 
-	if (mcause & (1UL << (__riscv_xlen - 1))) {
+	if (mcause & BIT(__riscv_xlen - 1)) {
 		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 					   SBI_HART_EXT_SMAIA))
-			rc = sbi_trap_aia_irq(regs, mcause);
+			rc = sbi_trap_aia_irq(mcause);
 		else
-			rc = sbi_trap_nonaia_irq(regs, mcause);
+			rc = sbi_trap_nonaia_irq(mcause);
 		msg = "unhandled local interrupt";
 		goto trap_done;
 	}
-- 
2.34.1


