From: Samuel Holland <samuel@sholland.org>
Date: Sun, 29 May 2022 13:25:29 -0500
Subject: [PATCH 1/2] lib: sbi_illegal_insn: Constify illegal_insn_table
Message-ID: <20220529182531.30377-1-samuel@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This table does not need to be modified at runtime.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 lib/sbi/sbi_illegal_insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index bfe7d61..39ef990 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -80,7 +80,7 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	return 0;
 }
 
-static illegal_insn_func illegal_insn_table[32] = {
+static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 0 */
 	truly_illegal_insn, /* 1 */
 	truly_illegal_insn, /* 2 */
-- 
2.35.1


