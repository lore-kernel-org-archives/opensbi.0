From: Xiang W <wxjstz@126.com>
Date: Mon, 23 Sep 2024 09:37:53 +0800
Subject: [PATCH] lib: sbi: fix missing high 32bits when sbi_cppc_write on rv32
Message-ID: <20240923013832.477015-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sbi_cppc_write was writing to the a1 register only, which under rv32
would cause the high 32 bits to always be 0. This patch fixes that.

Resolves: https://github.com/riscv-software-src/opensbi/issues/334

Signed-off-by: Xiang W <wxjstz@126.com>
Reported-by: Wesley Norris <repnop@outlook.com>
---
 lib/sbi/sbi_ecall_cppc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
index c26bb40..f3747b0 100644
--- a/lib/sbi/sbi_ecall_cppc.c
+++ b/lib/sbi/sbi_ecall_cppc.c
@@ -32,7 +32,13 @@ static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
 #endif
 		break;
 	case SBI_EXT_CPPC_WRITE:
-		ret = sbi_cppc_write(regs->a0, regs->a1);
+#if __riscv_xlen == 32
+		temp = regs->a2;
+		temp = (temp << 32) | regs->a1;
+else
+		temp = regs->a1;
+#endif
+		ret = sbi_cppc_write(regs->a0, temp);
 		break;
 	case SBI_EXT_CPPC_PROBE:
 		ret = sbi_cppc_probe(regs->a0);
-- 
2.45.2


