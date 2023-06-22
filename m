From: Gianluca Guida <gianluca@rivosinc.com>
Date: Thu, 22 Jun 2023 18:38:59 +0100
Subject: [PATCH] lib: sbi: check A2 register in ecall_dbcn_handler.
Message-ID: <20230622173857.387914-1-gianluca@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not ignore register A2 (high bits of physical address) in the dbcn
handler (RV64).

Signed-off-by: Gianluca Guida <gianluca@rivosinc.com>
---

The spec doesn't seem to imply that in RV64 only one paramenter will
be used.

Thanks,
G.


 lib/sbi/sbi_ecall_dbcn.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index e0b892c..ecec027 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -34,11 +34,14 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 		 * Based on above, we simply fail if the upper 32bits of
 		 * the physical address (i.e. a2 register) is non-zero on
 		 * RV32.
+                 *
+                 * Analogously, we fail if the upper 64bit of the
+                 * physical address (i.e. a2 register) is non-zero on
+                 * RV64.
 		 */
-#if __riscv_xlen == 32
 		if (regs->a2)
 			return SBI_ERR_FAILED;
-#endif
+
 		if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(),
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
-- 
2.34.1


