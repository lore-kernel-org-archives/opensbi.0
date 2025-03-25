From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 25 Mar 2025 11:26:11 +0100
Subject: [PATCH v2 4/7] lib: sbi: sse: Rename STATUS* interrupted flags to SSTATUS*
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
Message-ID: <20250325102615.1587953-5-cleger@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As raised by Andrew on the kvm-unit-test review, this flags are meant to
hold SSTATUS bits in the specification. Rename them to match that.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 include/sbi/sbi_ecall_interface.h |  4 ++--
 lib/sbi/sbi_sse.c                 | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 4817c8cf..6c210942 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -380,8 +380,8 @@ enum sbi_sse_attr_id {
 
 #define SBI_SSE_ATTR_CONFIG_ONESHOT	(1 << 0)
 
-#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPP	BIT(0)
-#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
 #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
 
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 35bb6564..330a5476 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -427,8 +427,8 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
 
 		return sse_event_set_hart_id_check(e, val);
 	case SBI_SSE_ATTR_INTERRUPTED_FLAGS:
-		if (val & ~(SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPP |
-			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPIE |
+		if (val & ~(SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP |
+			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE |
 			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV |
 			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP))
 			return SBI_EINVAL;
@@ -519,9 +519,9 @@ static unsigned long sse_interrupted_flags(unsigned long mstatus)
 	unsigned long hstatus, flags = 0;
 
 	if (mstatus & (MSTATUS_SPIE))
-		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPIE;
+		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE;
 	if (mstatus & (MSTATUS_SPP))
-		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPP;
+		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP;
 
 	if (misa_extension('H')) {
 		hstatus = csr_read(CSR_HSTATUS);
@@ -632,11 +632,11 @@ static void sse_event_resume(struct sbi_sse_event *e,
 		regs->mstatus |= MSTATUS_SIE;
 
 	regs->mstatus &= ~MSTATUS_SPIE;
-	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPIE)
+	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE)
 		regs->mstatus |= MSTATUS_SPIE;
 
 	regs->mstatus &= ~MSTATUS_SPP;
-	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_STATUS_SPP)
+	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP)
 		regs->mstatus |= MSTATUS_SPP;
 
 	regs->a7 = i_ctx->a7;
-- 
2.47.2


