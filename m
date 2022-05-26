From: Xiang W <wxjstz@126.com>
Date: Thu, 26 May 2022 16:01:56 +0800
Subject: [PATCH v2] lib: sbi: fix system_opcode_insn
Message-ID: <20220526080156.259781-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the csr's operation comes from M mode, it should not be forwarded
to low-privilege processing, this patch fixes this problem.

Signed-off-by: Xiang W <wxjstz@126.com>
---
Changes in v2:
- add missing head file

 lib/sbi/sbi_illegal_insn.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index bfe7d61..f9d3857 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
+#include <sbi/sbi_console.h>
 
 typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
 
@@ -37,12 +38,16 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	int do_write, rs1_num = (insn >> 15) & 0x1f;
 	ulong rs1_val = GET_RS1(insn, regs);
 	int csr_num   = (u32)insn >> 20;
+	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 	ulong csr_val, new_csr_val;
 
 	/* TODO: Ensure that we got CSR read/write instruction */
 
-	if (sbi_emulate_csr_read(csr_num, regs, &csr_val))
+	if (sbi_emulate_csr_read(csr_num, regs, &csr_val)) {
+		if (prev_mode == PRV_M)
+			sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		return truly_illegal_insn(insn, regs);
+	}
 
 	do_write = rs1_num;
 	switch (GET_RM(insn)) {
-- 
2.30.2


