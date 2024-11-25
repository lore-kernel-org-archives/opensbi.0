From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 11:53:00 +0100
Subject: [PATCH 2/2] lib: sbi: sse: Fix a6 and a7 register content upon injection
In-Reply-To: <20241125105303.1113607-1-cleger@rivosinc.com>
References: <20241125105303.1113607-1-cleger@rivosinc.com>
Message-ID: <20241125105303.1113607-3-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The specification states that a6 contains the current hart id and a7
contains the entry argument. This was inverted in the current
implementation.

Reported-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 lib/sbi/sbi_sse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index bf5620e..c9f9a9d 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -509,8 +509,8 @@ static void sse_event_inject(struct sbi_sse_event *e,
 	csr_write(CSR_SEPC, regs->mepc);
 
 	/* Setup entry context */
-	regs->a6 = e->attrs.entry.arg;
-	regs->a7 = current_hartid();
+	regs->a6 = current_hartid();
+	regs->a7 = e->attrs.entry.arg;
 	regs->mepc = e->attrs.entry.pc;
 
 	/* Return to S-mode with virtualization disabled */
-- 
2.45.2


