From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 13 Mar 2024 14:42:46 +0100
Subject: [PATCH v2 06/10] lib: sbi: Simplify parameters of
 sbi_illegal_insn_handler()
In-Reply-To: <20240312102804.1436376-7-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-7-apatel@ventanamicro.com>
Message-ID: <a731a7b8-97b5-4345-a36a-e4114c820f66@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/03/2024 11:28, Anup Patel wrote:
> The struct sbi_trap_context already has the information needed by
> sbi_illegal_insn_handler() so directly pass struct sbi_trap_context
> pointer to this function.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_illegal_insn.h |  4 ++--
>  lib/sbi/sbi_illegal_insn.c     | 14 +++++++-------
>  lib/sbi/sbi_trap.c             |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sbi/sbi_illegal_insn.h b/include/sbi/sbi_illegal_insn.h
> index 0397935..7be72ac 100644
> --- a/include/sbi/sbi_illegal_insn.h
> +++ b/include/sbi/sbi_illegal_insn.h
> @@ -12,8 +12,8 @@
>  
>  #include <sbi/sbi_types.h>
>  
> -struct sbi_trap_regs;
> +struct sbi_trap_context;
>  
> -int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs);
> +int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx);
>  
>  #endif
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index dd0b3c1..29c5d74 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -136,8 +136,9 @@ static const illegal_insn_func illegal_insn_table[32] = {
>  	truly_illegal_insn  /* 31 */
>  };
>  
> -int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
> +int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
>  {
> +	ulong insn = tcntx->trap.tval;

Maybe add some intermediate variable:

	struct sbi_trap_regs *regs = &tcntx->regs;

So you won't have to modify anything below.

Regards,

Cl?ment

>  	struct sbi_trap_info uptrap;
>  
>  	/*
> @@ -153,13 +154,12 @@ int sbi_illegal_insn_handler(ulong insn, struct sbi_trap_regs *regs)
>  
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ILLEGAL_INSN);
>  	if (unlikely((insn & 3) != 3)) {
> -		insn = sbi_get_insn(regs->mepc, &uptrap);
> -		if (uptrap.cause) {
> -			return sbi_trap_redirect(regs, &uptrap);
> -		}
> +		insn = sbi_get_insn(tcntx->regs.mepc, &uptrap);
> +		if (uptrap.cause)
> +			return sbi_trap_redirect(&tcntx->regs, &uptrap);
>  		if ((insn & 3) != 3)
> -			return truly_illegal_insn(insn, regs);
> +			return truly_illegal_insn(insn, &tcntx->regs);
>  	}
>  
> -	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
> +	return illegal_insn_table[(insn & 0x7c) >> 2](insn, &tcntx->regs);
>  }
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index a2afb0a..4e691df 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -285,7 +285,7 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
>  
>  	switch (mcause) {
>  	case CAUSE_ILLEGAL_INSTRUCTION:
> -		rc  = sbi_illegal_insn_handler(tcntx->trap.tval, regs);
> +		rc  = sbi_illegal_insn_handler(tcntx);
>  		msg = "illegal instruction handler failed";
>  		break;
>  	case CAUSE_MISALIGNED_LOAD:

