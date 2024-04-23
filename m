From: Christoph Müllner <christoph.muellner@vrull.eu>
Date: Tue, 23 Apr 2024 17:42:50 +0200
Subject: [PATCH] lib: sbi: Issue a PAUSE hint between spins in spin_lock()
Message-ID: <20240423154250.3797276-1-christoph.muellner@vrull.eu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V's Zihintpause extension includes a PAUSE instruction that
is designed to reduce engergy consumption while executing spin-wait
code sequences.  It is encoded as a HINT, which means that it
behaves like a NOP on systems that don't implement Zihintpause.

Binutils supports Zihintpause since 2.36, so this patch uses
the ".insn" directive to keep the code compatible with older
toolchains.

Signed-off-by: Christoph M?llner <christoph.muellner@vrull.eu>
---
 lib/sbi/riscv_locks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index acab776..3c26a77 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -61,7 +61,8 @@ void spin_lock(spinlock_t *lock)
 		"1:	and	%2, %0, %5\n"
 		"	beq	%1, %2, 2f\n"
 
-		/* If not, then spin on the lock. */
+		/* If not, then issue a PAUSE hint and spin on the lock. */
+		"	.insn	i 0x0f, 0, x0, x0, 0x010\n"
 		"	lw	%0, %3\n"
 		RISCV_ACQUIRE_BARRIER
 		"	j	1b\n"
-- 
2.44.0


