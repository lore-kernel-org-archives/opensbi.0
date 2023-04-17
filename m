From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Apr 2023 11:27:20 +0530
Subject: [PATCH] lib: sbi: Don't check SBI error range for legacy console getchar
Message-ID: <20230417055721.2972735-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The legacy console getchar SBI call returns character value in
the sbiret.error field so the "SBI_SUCCESS < ret" check in
sbi_ecall_handler() results in unwanted error prints for the
legacy console getchar SBI call. Let's suppress these unwanted
error prints.

Fixes: 67b2a408924b ("lib: sbi: sbi_ecall: Check the range of
SBI error")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/sbi/sbi_ecall.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index d0f0166..76a1ae9 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -120,7 +120,9 @@ int sbi_ecall_handler(struct sbi_trap_regs *regs)
 		trap.epc = regs->mepc;
 		sbi_trap_redirect(regs, &trap);
 	} else {
-		if (ret < SBI_LAST_ERR || SBI_SUCCESS < ret) {
+		if (ret < SBI_LAST_ERR ||
+		    (extension_id != SBI_EXT_0_1_CONSOLE_GETCHAR &&
+		     SBI_SUCCESS < ret)) {
 			sbi_printf("%s: Invalid error %d for ext=0x%lx "
 				   "func=0x%lx\n", __func__, ret,
 				   extension_id, func_id);
-- 
2.34.1


