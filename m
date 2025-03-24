From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 24 Mar 2025 18:08:36 +0100
Subject: [PATCH 5/6] lib: sbi: sse: Add support for SSTATUS.SPELP
In-Reply-To: <20250317105426.631243-6-cleger@rivosinc.com>
References: <20250317105426.631243-1-cleger@rivosinc.com>
 <20250317105426.631243-6-cleger@rivosinc.com>
Message-ID: <20250324-5511e43cb7647d8f6c08ab3c@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025 at 11:54:23AM +0100, Cl?ment L?ger wrote:
> As raised during the ARC review, SPELP was not handled during the event
> injection process. Save it as part of the interrupted flags, clear it
> before injecting the event and restore it after completion.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_ecall_interface.h |  1 +
>  lib/sbi/sbi_sse.c                 | 16 +++++++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
> index 51e42eed..a93e61fa 100644
> --- a/include/sbi/sbi_ecall_interface.h
> +++ b/include/sbi/sbi_ecall_interface.h
> @@ -384,6 +384,7 @@ enum sbi_sse_attr_id {
>  #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
>  #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
>  #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
>  
>  enum sbi_sse_state {
>  	SBI_SSE_STATE_UNUSED		= 0,
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index fb7ccf05..a45d3eeb 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -430,7 +430,8 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
>  		if (val & ~(SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP |
>  			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE |
>  			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV |
> -			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP))
> +			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP |
> +			    SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP))
>  			return SBI_EINVAL;
>  		__attribute__((__fallthrough__));
>  	case SBI_SSE_ATTR_INTERRUPTED_SEPC:
> @@ -516,6 +517,8 @@ static unsigned long sse_interrupted_flags(unsigned long mstatus)
>  		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE;
>  	if (mstatus & (MSTATUS_SPP))
>  		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP;
> +	if (mstatus & (MSTATUS_SPELP))
> +		flags |= SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP;

Not sure why we have the superfluous (), but I guess this is consistent.

>  
>  	if (misa_extension('H')) {
>  		hstatus = csr_read(CSR_HSTATUS);
> @@ -573,8 +576,11 @@ static void sse_event_inject(struct sbi_sse_event *e,
>  	regs->a7 = e->attrs.entry.arg;
>  	regs->mepc = e->attrs.entry.pc;
>  
> -	/* Return to S-mode with virtualization disabled */
> -	regs->mstatus &= ~(MSTATUS_MPP | MSTATUS_SIE);
> +	/*
> +	 * Return to S-mode with virtualization disabled, no expected landing

s/no/not/

> +	 * pad.
> +	 */
> +	regs->mstatus &= ~(MSTATUS_MPP | MSTATUS_SIE | MSTATUS_SPELP);
>  	regs->mstatus |= (PRV_S << MSTATUS_MPP_SHIFT);
>  
>  #if __riscv_xlen == 64
> @@ -633,6 +639,10 @@ static void sse_event_resume(struct sbi_sse_event *e,
>  	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP)
>  		regs->mstatus |= MSTATUS_SPP;
>  
> +	regs->mstatus &= ~MSTATUS_SPELP;
> +	if (i_ctx->flags & SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP)
> +		regs->mstatus |= MSTATUS_SPELP;
> +
>  	regs->a7 = i_ctx->a7;
>  	regs->a6 = i_ctx->a6;
>  	csr_write(CSR_SEPC, i_ctx->sepc);
> -- 
> 2.47.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

