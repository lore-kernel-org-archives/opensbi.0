From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 13 Mar 2024 14:51:22 +0100
Subject: [PATCH v2 08/10] lib: sbi: Remove regs parameter from trap irq
 handling functions
In-Reply-To: <20240312102804.1436376-9-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-9-apatel@ventanamicro.com>
Message-ID: <e26eb846-f252-4671-ab94-01e8557d8aa7@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/03/2024 11:28, Anup Patel wrote:
> The trap irq handling functions no longer require regs parameter
> so remove it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/sbi_trap.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 72b1788..ebf454d 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -198,10 +198,9 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>  	return 0;
>  }
>  
> -static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
> +static int sbi_trap_nonaia_irq(unsigned long irq)
>  {
> -	mcause &= ~(1UL << (__riscv_xlen - 1));
> -	switch (mcause) {
> +	switch (irq) {
>  	case IRQ_M_TIMER:
>  		sbi_timer_process();
>  		break;
> @@ -217,7 +216,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
>  	return 0;
>  }
>  
> -static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
> +static int sbi_trap_aia_irq(void)
>  {
>  	int rc;
>  	unsigned long mtopi;
> @@ -273,12 +272,12 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
>  	tcntx->prev_context = sbi_trap_get_context(scratch);
>  	sbi_trap_set_context(scratch, tcntx);
>  
> -	if (mcause & (1UL << (__riscv_xlen - 1))) {
> +	if (mcause & BIT(__riscv_xlen - 1)) {

Hi Anup,

You could probably add a define for BIT(__riscv_xlen - 1) such as
MCAUSE_IRQ_MASK.

Thanks,

Cl?ment

>  		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
>  					   SBI_HART_EXT_SMAIA))
> -			rc = sbi_trap_aia_irq(regs, mcause);
> +			rc = sbi_trap_aia_irq();
>  		else
> -			rc = sbi_trap_nonaia_irq(regs, mcause);
> +			rc = sbi_trap_nonaia_irq(mcause & ~BIT(__riscv_xlen - 1));
>  		msg = "unhandled local interrupt";
>  		goto trap_done;
>  	}

