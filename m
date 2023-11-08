From: Björn Töpel <bjorn@kernel.org>
Date: Wed,  8 Nov 2023 20:13:10 +0100
Subject: [PATCH] lib: sbi_illegal_insn: Emulate 'MZ'/c.li s4,-13 instruction
Message-ID: <20231108191310.49950-1-bjorn@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bj?rn T?pel <bjorn@rivosinc.com>

The Linux kernel RISC-V image format allows that UEFI Images can also
be booted by non-UEFI firmware. However for that to work, the PE/Image
combo requires that 'MZ' is a valid instruction. On RISC-V, 'MZ' is
only a valid instruction if the hardware is C capable [1].

Emulate "c.li s4,-13" for non-C capable hardware.

Link: https://lore.kernel.org/linux-riscv/20231024192648.25527-1-bjorn at kernel.org/ # [1]
Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
---
 lib/sbi/sbi_illegal_insn.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 2be47575a365..a3ade71295ce 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -102,6 +102,19 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	return 0;
 }
 
+static int compressed_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* Only handle 'MZ'/c.li s4,-13/0x5a3d */
+	if (!misa_extension('C') && (insn & 0xffff) == 0x5a4d) {
+		regs->s4 = -13;
+		regs->mepc += 4;
+
+		return 0;
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+
 static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 0 */
 	truly_illegal_insn, /* 1 */
@@ -140,6 +153,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
 int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 {
 	struct sbi_trap_info uptrap;
+	ulong tmp;
 
 	/*
 	 * We only deal with 32-bit (or longer) illegal instructions. If we
@@ -159,7 +173,11 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 			uptrap.epc = regs->mepc;
 			return sbi_trap_redirect(regs, &uptrap);
 		}
-		if ((insn & 3) != 3)
+
+		tmp = insn & 3;
+		if (tmp == 1)
+			return compressed_insn(insn, regs);
+		else if (tmp != 3)
 			return truly_illegal_insn(insn, regs);
 	}
 

base-commit: cbdd86973901b6be2a1a2d3d6b54f3184fdf9a44
-- 
2.40.1


