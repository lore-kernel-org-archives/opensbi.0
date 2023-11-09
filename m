From: Xiang W <wxjstz@126.com>
Date: Thu,  9 Nov 2023 16:25:17 +0800
Subject: [PATCH] lib: sbi_illegal_insn: Emulate c.li
Message-ID: <20231109082540.52144-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Linux kernel RISC-V image format allows that UEFI Images can also
be booted by non-UEFI firmware. However for that to work, the PE/Image
combo requires that 'MZ' is a valid instruction. On RISC-V, 'MZ' is
only a valid instruction if the hardware is C capable [1]. So add
Emulate c.li

Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_illegal_insn.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 2be4757..4ab10f4 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -102,6 +102,22 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	return 0;
 }
 
+static int compressed_insn(ulong insn, struct sbi_trap_regs *regs) {
+	unsigned long imm, rd;
+	unsigned long *regs_p = (unsigned long *)regs;
+
+	if ((insn & 0xe003) == 0x4001) { /* c.li */
+		imm = (insn >> 2) & 0x1f;
+		imm |= ((insn >> 12) & 1) ? -32 : 0;
+		rd = (insn >> 7) & 0x1f;
+		if (rd)
+			regs_p[rd] = imm;
+		return 0;
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+
 static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 0 */
 	truly_illegal_insn, /* 1 */
@@ -160,7 +176,7 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
 			return sbi_trap_redirect(regs, &uptrap);
 		}
 		if ((insn & 3) != 3)
-			return truly_illegal_insn(insn, regs);
+			return compressed_insn(insn, regs);
 	}
 
 	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
-- 
2.42.0


