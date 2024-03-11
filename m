From: Samuel Holland <samuel.holland@sifive.com>
Date: Mon, 11 Mar 2024 12:32:19 -0500
Subject: [PATCH 3/9] lib: sbi: Introduce trap context
In-Reply-To: <20240311160944.1233523-4-apatel@ventanamicro.com>
References: <20240311160944.1233523-1-apatel@ventanamicro.com>
 <20240311160944.1233523-4-apatel@ventanamicro.com>
Message-ID: <66b421cf-a5e8-4a46-b4d0-f8f702a28697@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On 2024-03-11 11:09 AM, Anup Patel wrote:
> Club pointers to struct sbi_trap_regs and struct sbi_trap_info a new
> struct sbi_trap_context (aka trap context).
> 
> To track nested traps, the struct sbi_scratch points to the current
> trap context and the trap context has pointer to pervious context of
> previous trap.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_trap.h | 22 ++++++++++++++++++++++
>  lib/sbi/sbi_trap.c     | 35 ++++++++++++++++++++++-------------
>  2 files changed, 44 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
> index 15ccd0b..513a82e 100644
> --- a/include/sbi/sbi_trap.h
> +++ b/include/sbi/sbi_trap.h
> @@ -117,6 +117,7 @@
>  #ifndef __ASSEMBLER__
>  
>  #include <sbi/sbi_types.h>
> +#include <sbi/sbi_scratch.h>
>  
>  /** Representation of register state at time of trap/interrupt */
>  struct sbi_trap_regs {
> @@ -208,6 +209,16 @@ struct sbi_trap_info {
>  	unsigned long gva;
>  };
>  
> +/** Representation of trap context saved on stack */
> +struct sbi_trap_context {
> +	/** Pointer to previous trap context */
> +	struct sbi_trap_context *prev_context;
> +	/** Pointer to register state */
> +	struct sbi_trap_regs *regs;
> +	/** Pointer to trap details */
> +	const struct sbi_trap_info *trap;

It would be more efficient to embed these two structures inside the context
instead of pointing to them. The assembly code wouldn't have to fill out
sbi_trap_info or prev_context even if it allocates the whole sbi_trap_context.

Regards,
Samuel

> +};
> +
>  static inline unsigned long sbi_regs_gva(const struct sbi_trap_regs *regs)
>  {
>  	/*
> @@ -227,6 +238,17 @@ static inline unsigned long sbi_regs_gva(const struct sbi_trap_regs *regs)
>  int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  		      const struct sbi_trap_info *trap);
>  
> +static inline struct sbi_trap_context *sbi_trap_get_context(struct sbi_scratch *scratch)
> +{
> +	return (scratch) ? (void *)scratch->trap_context : NULL;
> +}
> +
> +static inline void sbi_trap_set_context(struct sbi_scratch *scratch,
> +					struct sbi_trap_context *tcntx)
> +{
> +	scratch->trap_context = (unsigned long)tcntx;
> +}
> +
>  struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs);
>  
>  #endif
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index e514066..dba267c 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -266,6 +266,8 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>  	const char *msg = "trap handler failed";
>  	ulong mcause = csr_read(CSR_MCAUSE);
>  	ulong mtval = csr_read(CSR_MTVAL), mtval2 = 0, mtinst = 0;
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	struct sbi_trap_context tcntx;
>  	struct sbi_trap_info trap;
>  
>  	if (misa_extension('H')) {
> @@ -273,25 +275,31 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>  		mtinst = csr_read(CSR_MTINST);
>  	}
>  
> +	/* Original trap_info */
> +	trap.epc     = regs->mepc;
> +	trap.cause   = mcause;
> +	trap.tval    = mtval;
> +	trap.tval2   = mtval2;
> +	trap.tinst   = mtinst;
> +	trap.gva     = sbi_regs_gva(regs);
> +
> +	/* Setup trap context */
> +	tcntx.prev_context = sbi_trap_get_context(scratch);
> +	tcntx.regs         = regs;
> +	tcntx.trap         = &trap;
> +
> +	/* Update trap context pointer */
> +	sbi_trap_set_context(scratch, &tcntx);
> +
>  	if (mcause & (1UL << (__riscv_xlen - 1))) {
>  		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
>  					   SBI_HART_EXT_SMAIA))
>  			rc = sbi_trap_aia_irq(regs, mcause);
>  		else
>  			rc = sbi_trap_nonaia_irq(regs, mcause);
> -		if (rc) {
> -			msg = "unhandled local interrupt";
> -			goto trap_error;
> -		}
> -		return regs;
> +		msg = "unhandled local interrupt";
> +		goto trap_done;
>  	}
> -	/* Original trap_info */
> -	trap.epc   = regs->mepc;
> -	trap.cause = mcause;
> -	trap.tval  = mtval;
> -	trap.tval2 = mtval2;
> -	trap.tinst = mtinst;
> -	trap.gva   = sbi_regs_gva(regs);
>  
>  	switch (mcause) {
>  	case CAUSE_ILLEGAL_INSTRUCTION:
> @@ -330,8 +338,9 @@ struct sbi_trap_regs *sbi_trap_handler(struct sbi_trap_regs *regs)
>  		break;
>  	}
>  
> -trap_error:
> +trap_done:
>  	if (rc)
>  		sbi_trap_error(msg, rc, mcause, mtval, mtval2, mtinst, regs);
> +	sbi_trap_set_context(scratch, tcntx.prev_context);
>  	return regs;
>  }


