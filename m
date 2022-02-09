From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  9 Feb 2022 20:34:31 +0530
Subject: [PATCH v2 04/13] lib: sbi: Add sbi_trap_set_external_irqfn() API
In-Reply-To: <20220209150441.121729-1-apatel@ventanamicro.com>
References: <20220209150441.121729-1-apatel@ventanamicro.com>
Message-ID: <20220209150441.121729-5-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds sbi_trap_set_external_irqfn() API which can be used by
OpenSBI platform code to set a callback function for external interrupts.
The RISC-V AIA IMSIC driver will use this API to implement inter-processor
interrupts on-top-of MSIs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/sbi/sbi_trap.h |  2 ++
 lib/sbi/sbi_trap.c     | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index d205056..4f611fa 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -205,6 +205,8 @@ struct sbi_trap_info {
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      struct sbi_trap_info *trap);
 
+void sbi_trap_set_external_irqfn(int (*fn)(struct sbi_trap_regs *regs));
+
 struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
 
 void __noreturn sbi_trap_exit(const struct sbi_trap_regs *regs);
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index bc8961f..faab90a 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -195,6 +195,27 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	return 0;
 }
 
+static int default_irqfn(struct sbi_trap_regs *regs)
+{
+	return SBI_ENODEV;
+}
+
+static int (*ext_irqfn)(struct sbi_trap_regs *regs) = default_irqfn;
+
+/**
+ * Set external irq handler function
+ *
+ * This function is called by OpenSBI platform code to set a handler for
+ * external interrupts
+ *
+ * @param fn function pointer for handling external irqs
+ */
+void sbi_trap_set_external_irqfn(int (*fn)(struct sbi_trap_regs *regs))
+{
+	if (fn)
+		ext_irqfn = fn;
+}
+
 static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 {
 	mcause &= ~(1UL << (__riscv_xlen - 1));
@@ -205,6 +226,8 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 	case IRQ_M_SOFT:
 		sbi_ipi_process();
 		break;
+	case IRQ_M_EXT:
+		return ext_irqfn(regs);
 	default:
 		return SBI_ENOENT;
 	};
@@ -214,6 +237,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 
 static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
 {
+	int rc;
 	unsigned long mtopi;
 
 	while ((mtopi = csr_read(CSR_MTOPI))) {
@@ -225,6 +249,11 @@ static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
 		case IRQ_M_SOFT:
 			sbi_ipi_process();
 			break;
+		case IRQ_M_EXT:
+			rc = ext_irqfn(regs);
+			if (rc)
+				return rc;
+			break;
 		default:
 			return SBI_ENOENT;
 		}
-- 
2.25.1


