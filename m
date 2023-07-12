From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 12 Jul 2023 10:04:36 +0530
Subject: [PATCH v3 10/10] lib: sbi: Map/Unmap debug console shared memory buffers
In-Reply-To: <20230712043436.100548-1-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com>
Message-ID: <20230712043436.100548-11-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With Smepmp enabled, it is necessary for shared memory from
S/U mode to be mapped/unmapped before and after read/write
of the memory region. This patch maps the debug console
shared memory before accessing it.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_ecall_dbcn.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 8e68729..18cd6c8 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/riscv_asm.h>
+#include <sbi/sbi_hart.h>
 
 static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 				  const struct sbi_trap_regs *regs,
@@ -46,10 +47,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
+		sbi_hart_map_saddr(regs->a1, regs->a0);
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
 			*out_val = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
 			*out_val = sbi_ngets((char *)regs->a1, regs->a0);
+		sbi_hart_unmap_saddr();
 		return 0;
 	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
 		sbi_putc(regs->a0);
-- 
2.34.1


