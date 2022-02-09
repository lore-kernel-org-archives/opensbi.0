From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  9 Feb 2022 20:34:30 +0530
Subject: [PATCH v2 03/13] lib: sbi: Use AIA CSRs for local interrupts when
 available
In-Reply-To: <20220209150441.121729-1-apatel@ventanamicro.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
Message-ID: <20220209150441.121729-4-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should use AIA CSRs to process local interrupts whenever AIA
is available.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_trap.c | 57 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 8d20e04..bc8961f 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -195,6 +195,44 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	return 0;
 }
 
+static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
+{
+	mcause &= ~(1UL << (__riscv_xlen - 1));
+	switch (mcause) {
+	case IRQ_M_TIMER:
+		sbi_timer_process();
+		break;
+	case IRQ_M_SOFT:
+		sbi_ipi_process();
+		break;
+	default:
+		return SBI_ENOENT;
+	};
+
+	return 0;
+}
+
+static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
+{
+	unsigned long mtopi;
+
+	while ((mtopi = csr_read(CSR_MTOPI))) {
+		mtopi = mtopi >> TOPI_IID_SHIFT;
+		switch (mtopi) {
+		case IRQ_M_TIMER:
+			sbi_timer_process();
+			break;
+		case IRQ_M_SOFT:
+			sbi_ipi_process();
+			break;
+		default:
+			return SBI_ENOENT;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * Handle trap/interrupt
  *
@@ -225,18 +263,15 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 	}
 
 	if (mcause & (1UL << (__riscv_xlen - 1))) {
-		mcause &= ~(1UL << (__riscv_xlen - 1));
-		switch (mcause) {
-		case IRQ_M_TIMER:
-			sbi_timer_process();
-			break;
-		case IRQ_M_SOFT:
-			sbi_ipi_process();
-			break;
-		default:
-			msg = "unhandled external interrupt";
+		if (sbi_hart_has_feature(sbi_scratch_thishart_ptr(),
+					 SBI_HART_HAS_AIA))
+			rc = sbi_trap_aia_irq(regs, mcause);
+		else
+			rc = sbi_trap_nonaia_irq(regs, mcause);
+		if (rc) {
+			msg = "unhandled local interrupt";
 			goto trap_error;
-		};
+		}
 		return regs;
 	}
 
-- 
2.25.1


