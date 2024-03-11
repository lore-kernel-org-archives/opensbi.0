From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Mar 2024 21:39:40 +0530
Subject: [PATCH 5/9] lib: sbi: Simplify parameters of sbi_illegal_insn_handler()
In-Reply-To: <20240311160944.1233523-1-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
Message-ID: <20240311160944.1233523-6-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The struct sbi_trap_context already has the information needed by
sbi_illegal_insn_handler() so directly pass struct sbi_trap_context
pointer to this function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_illegal_insn.h |  4 ++--
 lib/sbi/sbi_illegal_insn.c     | 14 ++++++++------
 lib/sbi/sbi_trap.c             |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sbi/sbi_illegal_insn.h b/include/sbi/sbi_illegal_insn.h
index 0397935..7be72ac 100644
--- a/include/sbi/sbi_illegal_insn.h
+++ b/include/sbi/sbi_illegal_insn.h
@@ -12,8 +12,8 @@
 
 #include <sbi/sbi_types.h>
 
-struct sbi_trap_regs;
+struct sbi_trap_context;
 
-int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs);
+int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx);
 
 #endif
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 2be4757..0c8ad1e 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -137,8 +137,9 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn  /* 31 */
 };
 
-int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
+int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
 {
+	ulong mepc, insn = tcntx->trap->tval;
 	struct sbi_trap_info uptrap;
 
 	/*
@@ -154,14 +155,15 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ILLEGAL_INSN);
 	if (unlikely((insn & 3) != 3)) {
-		insn = sbi_get_insn(regs->mepc, &uptrap);
+		mepc = tcntx->regs->mepc;
+		insn = sbi_get_insn(mepc, &uptrap);
 		if (uptrap.cause) {
-			uptrap.epc = regs->mepc;
-			return sbi_trap_redirect(regs, &uptrap);
+			uptrap.epc = mepc;
+			return sbi_trap_redirect(tcntx->regs, &uptrap);
 		}
 		if ((insn & 3) != 3)
-			return truly_illegal_insn(insn, regs);
+			return truly_illegal_insn(insn, tcntx->regs);
 	}
 
-	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
+	return illegal_insn_table[(insn & 0x7c) >> 2](insn, tcntx->regs);
 }
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 359749f..3d300c3 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -303,7 +303,7 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
 
 	switch (mcause) {
 	case CAUSE_ILLEGAL_INSTRUCTION:
-		rc  = sbi_illegal_insn_handler(mtval, regs);
+		rc  = sbi_illegal_insn_handler(&tcntx);
 		msg = "illegal instruction handler failed";
 		break;
 	case CAUSE_MISALIGNED_LOAD:
-- 
2.34.1


