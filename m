From: Samuel Holland <samuel@sholland.org>
Date: Sun, 29 May 2022 13:25:30 -0500
Subject: [PATCH 2/2] lib: sbi_illegal_insn: Add emulation for fence.tso
In-Reply-To: <20220529182531.30377-1-samuel@sholland.org>
References: <20220529182531.30377-1-samuel@sholland.org>
Message-ID: <20220529182531.30377-2-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While OpenC906 appears to properly decode `fence.tso` as a fence
instruction[1], the version of the C906 taped out in the Allwinner D1
does not, and raises illegal instruction.

Handle this errata by emulating `fence.tso` as `fence rw, rw`.

[1]: https://github.com/T-head-Semi/openc906/blob/30827e7f/C906_RTL_FACTORY/gen_rtl/idu/rtl/aq_idu_id_decd.v#L2097

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 lib/sbi/sbi_illegal_insn.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 39ef990..44c9385 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -8,6 +8,7 @@
  */
 
 #include <sbi/riscv_asm.h>
+#include <sbi/riscv_barrier.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_emulate_csr.h>
@@ -32,6 +33,17 @@ static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
 	return sbi_trap_redirect(regs, &trap);
 }
 
+static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* Errata workaround: emulate `fence.tso` as `fence rw, rw`. */
+	if (insn == 0x8330000fUL) {
+		smp_mb();
+		return 0;
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+
 static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 {
 	int do_write, rs1_num = (insn >> 15) & 0x1f;
@@ -84,7 +96,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 0 */
 	truly_illegal_insn, /* 1 */
 	truly_illegal_insn, /* 2 */
-	truly_illegal_insn, /* 3 */
+	misc_mem_opcode_insn, /* 3 */
 	truly_illegal_insn, /* 4 */
 	truly_illegal_insn, /* 5 */
 	truly_illegal_insn, /* 6 */
-- 
2.35.1


