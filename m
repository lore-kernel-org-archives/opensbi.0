From: Xiang W <wxjstz@126.com>
Date: Wed, 25 May 2022 01:44:32 +0800
Subject: [PATCH] lib: sbi: fix system_opcode_insn
Message-ID: <20220524174432.58212-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the csr's operation comes from M mode, it should not be forwarded
to low-privilege processing, this patch fixes this problem.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_illegal_insn.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index bfe7d61..deb77e6 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -37,12 +37,16 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
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


