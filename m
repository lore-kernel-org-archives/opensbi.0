From: Anup Patel <anup.patel@wdc.com>
Date: Sun, 16 Aug 2020 22:30:39 +0530
Subject: [PATCH v2 2/2] lib: sbi: Handle the case where MTVAL has illegal
 instruction address
In-Reply-To: <20200816170039.364608-1-anup.patel@wdc.com>
References: <20200816170039.364608-1-anup.patel@wdc.com>
Message-ID: <20200816170039.364608-2-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Kendryte K210 follows RISC-V v1.9 spec so MTVAL has instruction
address (instead of instruction encoding) on illegal instruction trap.

To handle above case, we fix sbi_illegal_insn_handler() without any
impact on RISC-V v1.10 (or higher) systems. This achieved by exploiting
the fact that program counter (and instruction address) is always 2-byte
aligned in RISC-V world.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 lib/sbi/sbi_illegal_insn.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 0e5523f..9af3d24 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -118,13 +118,22 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 {
 	struct sbi_trap_info uptrap;
 
+	/*
+	 * We only deal with 32-bit (or longer) illegal instructions. If we
+	 * see instruction is zero OR instruction is 16-bit then we fetch and
+	 * check the instruction encoding using unprivilege access.
+	 *
+	 * The program counter (PC) in RISC-V world is always 2-byte aligned
+	 * so handling only 32-bit (or longer) illegal instructions also help
+	 * the case where MTVAL CSR contains instruction address for illegal
+	 * instruction trap.
+	 */
+
 	if (unlikely((insn & 3) != 3)) {
-		if (insn == 0) {
-			insn = sbi_get_insn(regs->mepc, &uptrap);
-			if (uptrap.cause) {
-				uptrap.epc = regs->mepc;
-				return sbi_trap_redirect(regs, &uptrap);
-			}
+		insn = sbi_get_insn(regs->mepc, &uptrap);
+		if (uptrap.cause) {
+			uptrap.epc = regs->mepc;
+			return sbi_trap_redirect(regs, &uptrap);
 		}
 		if ((insn & 3) != 3)
 			return truly_illegal_insn(insn, regs);
-- 
2.25.1


