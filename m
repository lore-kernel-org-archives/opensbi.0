From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue,  4 Mar 2025 17:45:43 -0800
Subject: [PATCH] lib: sbi_trap: Add support for vectored interrupts
In-Reply-To: <d3efe4c5-d9cc-4664-a779-40fb5cafd427@sysgo.com>
References: <d3efe4c5-d9cc-4664-a779-40fb5cafd427@sysgo.com>
Message-ID: <20250305014729.3143535-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When redirecting an exception to S-mode, transform the (v)stvec CSR
value as described in the privileged spec to derive the S-mode PC.
Since OpenSBI never redirects interrupts, only synchronous exceptions,
the only action needed is to mask out the (v)stvec.MODE field.

Reported-by: Jan Reinhard <jan.reinhard@sysgo.com>
Closes: https://github.com/riscv-software-src/opensbi/issues/391
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
Hi Jan,

Thanks for your bug report and the patch!

OpenSBI requires patches to be signed off in accordance with the
Developer Certificate of Origin (DCO)[1], and sent as complete commits
as with git format-patch/git send-email.

Since the fix is trivial now that we are aware of the bug, I took the
liberty of sending a more complete patch, so you don't have to deal with
a bunch of processes just to get the bug fixed. If you'd rather resend
your own patch per the Contribution Guidelines[1], that is fine too.

Regards,
Samuel

[1]: https://github.com/riscv-software-src/opensbi/blob/master/docs/contributing.md

 include/sbi/riscv_encoding.h | 2 ++
 lib/sbi/sbi_trap.c           | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 03c68a57..1846d750 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -85,6 +85,8 @@
 #define HSTATUS_GVA			_UL(0x00000040)
 #define HSTATUS_VSBE			_UL(0x00000020)
 
+#define MTVEC_MODE			_UL(0x00000003)
+
 #define MCAUSE_IRQ_MASK			(_UL(1) << (__riscv_xlen - 1))
 
 #define IRQ_S_SOFT			1
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index e63a563b..f41db4d1 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -169,7 +169,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		csr_write(CSR_VSCAUSE, trap->cause);
 
 		/* Set MEPC to VS-mode exception vector base */
-		regs->mepc = csr_read(CSR_VSTVEC);
+		regs->mepc = csr_read(CSR_VSTVEC) & ~MTVEC_MODE;
 
 		/* Set MPP to VS-mode */
 		regs->mstatus &= ~MSTATUS_MPP;
@@ -204,7 +204,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		csr_write(CSR_SCAUSE, trap->cause);
 
 		/* Set MEPC to S-mode exception vector base */
-		regs->mepc = csr_read(CSR_STVEC);
+		regs->mepc = csr_read(CSR_STVEC) & ~MTVEC_MODE;
 
 		/* Set MPP to S-mode */
 		regs->mstatus &= ~MSTATUS_MPP;
-- 
2.47.2


