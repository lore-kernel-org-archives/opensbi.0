From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 30 Nov 2023 10:13:18 +0100
Subject: [RFC PATCH 1/2] lib: sbi: provides regs to sbi_ipi_process()
In-Reply-To: <20231130091319.1223849-1-cleger@rivosinc.com>
References: <20231130091319.1223849-1-cleger@rivosinc.com>
Message-ID: <20231130091319.1223849-2-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to implement SSE on IPI notifications, provides regs to
sbi_ipi_process(). This will be used in two cases, global event
triggered from one cpu to another and ipi injection to a specific hart.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/sbi_ipi.h     |  6 ++++--
 lib/sbi/sbi_ipi.c         | 12 +++++++-----
 lib/sbi/sbi_tlb.c         |  2 +-
 lib/sbi/sbi_trap.c        |  4 ++--
 lib/utils/irqchip/imsic.c |  2 +-
 5 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index d396233..0b32194 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -11,6 +11,7 @@
 #define __SBI_IPI_H__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_trap.h>
 
 /* clang-format off */
 
@@ -68,7 +69,8 @@ struct sbi_ipi_event_ops {
 	 * Note: This is a mandatory callback and it is called on the
 	 * remote HART after IPI is triggered.
 	 */
-	void (* process)(struct sbi_scratch *scratch);
+	void (* process)(struct sbi_scratch *scratch,
+			 struct sbi_trap_regs *regs);
 };
 
 int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data);
@@ -83,7 +85,7 @@ void sbi_ipi_clear_smode(void);
 
 int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
-void sbi_ipi_process(void);
+void sbi_ipi_process(struct sbi_trap_regs *regs);
 
 int sbi_ipi_raw_send(u32 hartindex);
 
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 0bf446a..7fa6113 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -170,7 +170,8 @@ void sbi_ipi_event_destroy(u32 event)
 	ipi_ops_array[event] = NULL;
 }
 
-static void sbi_ipi_process_smode(struct sbi_scratch *scratch)
+static void sbi_ipi_process_smode(struct sbi_scratch *scratch,
+				  struct sbi_trap_regs *regs)
 {
 	csr_set(CSR_MIP, MIP_SSIP);
 }
@@ -192,7 +193,8 @@ void sbi_ipi_clear_smode(void)
 	csr_clear(CSR_MIP, MIP_SSIP);
 }
 
-static void sbi_ipi_process_halt(struct sbi_scratch *scratch)
+static void sbi_ipi_process_halt(struct sbi_scratch *scratch,
+				 struct sbi_trap_regs *regs)
 {
 	sbi_hsm_hart_stop(scratch, true);
 }
@@ -209,7 +211,7 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase)
 	return sbi_ipi_send_many(hmask, hbase, ipi_halt_event, NULL);
 }
 
-void sbi_ipi_process(void)
+void sbi_ipi_process(struct sbi_trap_regs *regs)
 {
 	unsigned long ipi_type;
 	unsigned int ipi_event;
@@ -228,7 +230,7 @@ void sbi_ipi_process(void)
 		if (ipi_type & 1UL) {
 			ipi_ops = ipi_ops_array[ipi_event];
 			if (ipi_ops && ipi_ops->process)
-				ipi_ops->process(scratch);
+				ipi_ops->process(scratch, regs);
 		}
 		ipi_type = ipi_type >> 1;
 		ipi_event++;
@@ -333,7 +335,7 @@ void sbi_ipi_exit(struct sbi_scratch *scratch)
 	csr_clear(CSR_MIE, MIP_MSIP);
 
 	/* Process pending IPIs */
-	sbi_ipi_process();
+	sbi_ipi_process(NULL);
 
 	/* Platform exit */
 	sbi_platform_ipi_exit(sbi_platform_ptr(scratch));
diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
index dad9508..80e7bdf 100644
--- a/lib/sbi/sbi_tlb.c
+++ b/lib/sbi/sbi_tlb.c
@@ -229,7 +229,7 @@ static bool tlb_process_once(struct sbi_scratch *scratch)
 	return false;
 }
 
-static void tlb_process(struct sbi_scratch *scratch)
+static void tlb_process(struct sbi_scratch *scratch, struct sbi_trap_regs *regs)
 {
 	while (tlb_process_once(scratch));
 }
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index dbf307c..d574ab1 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -206,7 +206,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
 		sbi_timer_process();
 		break;
 	case IRQ_M_SOFT:
-		sbi_ipi_process();
+		sbi_ipi_process(regs);
 		break;
 	case IRQ_M_EXT:
 		return sbi_irqchip_process(regs);
@@ -229,7 +229,7 @@ static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
 			sbi_timer_process();
 			break;
 		case IRQ_M_SOFT:
-			sbi_ipi_process();
+			sbi_ipi_process(regs);
 			break;
 		case IRQ_M_EXT:
 			rc = sbi_irqchip_process(regs);
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 36ef66c..a207dbc 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -149,7 +149,7 @@ static int imsic_external_irqfn(struct sbi_trap_regs *regs)
 
 		switch (mirq) {
 		case IMSIC_IPI_ID:
-			sbi_ipi_process();
+			sbi_ipi_process(regs);
 			break;
 		default:
 			sbi_printf("%s: unhandled IRQ%d\n",
-- 
2.42.0


