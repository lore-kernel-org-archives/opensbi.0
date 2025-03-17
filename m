From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 17 Mar 2025 11:54:24 +0100
Subject: [PATCH 6/6] lib: sbi: sse: Add support for SSTATUS.SDT
In-Reply-To: <20250317105426.631243-1-cleger@rivosinc.com>
References: <20250317105426.631243-1-cleger@rivosinc.com>
Message-ID: <20250317105426.631243-7-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Similarly to what is done for SPELP, handle SSTATUS.SDT upon event
injection. In order to mimick an interrupt, set SDT to 1 for injection and
save its previous value in interrupted_flags[5:5]. Restore it upon
completion.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 include/sbi/riscv_encoding.h      |  3 ++-
 include/sbi/sbi_ecall_interface.h |  1 +
 lib/sbi/sbi_sse.c                 | 12 ++++++++++--
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 03c68a57..84d3c17b 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -32,7 +32,8 @@
 #define MSTATUS_TVM			_UL(0x00100000)
 #define MSTATUS_TW			_UL(0x00200000)
 #define MSTATUS_TSR			_UL(0x00400000)
-#define MSTATUS_SPELP		_UL(0x00800000)
+#define MSTATUS_SPELP			_UL(0x00800000)
+#define MSTATUS_SDT			_UL(0x01000000)
 #define MSTATUS32_SD			_UL(0x80000000)
 #if __riscv_xlen == 64
 #define MSTATUS_UXL			_ULL(0x0000000300000000)
diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index a93e61fa..3d8bbcf3 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -385,6 +385,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
 
 enum sbi_sse_state {
 	SBI_SSE_STATE_UNUSED		= 0,
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index a45d3eeb..79c5bdb4 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -431,7 +431,8 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
 			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE |
 			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV |
 			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP |
-			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP))
+			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP |
+			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT))
 			return SBI_EINVAL;
 		__attribute__((__fallthrough__));
 	case SBI_SSE_ATTR_INTERRUPTED_SEPC:
@@ -519,6 +520,8 @@ static unsigned long sse_interrupted_flags(unsigned long mstatus)
 		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP;
 	if (mstatus & (MSTATUS_SPELP))
 		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP;
+	if (mstatus & (MSTATUS_SDT))
+		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT;
 
 	if (misa_extension('H')) {
 		hstatus = csr_read(CSR_HSTATUS);
@@ -578,10 +581,11 @@ static void sse_event_inject(struct sbi_sse_event *e,
 
 	/*
 	 * Return to S-mode with virtualization disabled, no expected landing
-	 * pad.
+	 * pad, supervisor trap disabled.
 	 */
 	regs->mstatus &= ~(MSTATUS_MPP | MSTATUS_SIE | MSTATUS_SPELP);
 	regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
+	regs->mstatus |= MSTATUS_SDT;
 
 #if __riscv_xlen == 64
 	regs->mstatus &= ~MSTATUS_MPV;
@@ -643,6 +647,10 @@ static void sse_event_resume(struct sbi_sse_event *e,
 	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP)
 		regs->mstatus |= MSTATUS_SPELP;
 
+	regs->mstatus &= ~MSTATUS_SDT;
+	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT)
+		regs->mstatus |= MSTATUS_SDT;
+
 	regs->a7 = i_ctx->a7;
 	regs->a6 = i_ctx->a6;
 	csr_write(CSR_SEPC, i_ctx->sepc);
-- 
2.47.2


