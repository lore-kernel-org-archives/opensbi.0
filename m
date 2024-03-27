From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 27 Mar 2024 13:23:44 +0800
Subject: [PATCH] sbi: sbi_domain_context: Check privilege spec version before accessing S-mode CSRs
Message-ID: <20240327052344.2264839-1-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SCOUNTEREN and SENVCFG may not be supported on certain RISC-V core,
so check the existence of these CSRs via privilege spec version to
prevent illegal instructions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 lib/sbi/sbi_domain_context.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 9213c1ac..05ba0699 100755
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -55,8 +55,10 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
 	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
 	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
 	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
-	ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
-	ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
+		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
+	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
+		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
 
 	/* Save current trap state and restore target domain's trap state */
 	trap_regs = (struct sbi_trap_regs *)(csr_read(CSR_MSCRATCH) -
-- 
2.34.1


