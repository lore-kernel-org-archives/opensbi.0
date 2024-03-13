From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 13 Mar 2024 14:39:29 +0100
Subject: [PATCH v2 07/10] lib: sbi: Remove regs paramter of
 sbi_irqchip_process()
In-Reply-To: <20240312102804.1436376-8-apatel@ventanamicro.com>
References: <20240312102804.1436376-1-apatel@ventanamicro.com>
 <20240312102804.1436376-8-apatel@ventanamicro.com>
Message-ID: <c562de9f-3f73-495b-952d-4f576efcc5d9@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/03/2024 11:28, Anup Patel wrote:
> The irqchip handlers will typically not need pointer to trap registers
> so remove regs paramter of sbi_irqchip_process().

Hi Anup,

Typo: "paramter" -> "parameter"

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_irqchip.h |  5 ++---
>  lib/sbi/sbi_irqchip.c     | 10 +++++-----
>  lib/sbi/sbi_trap.c        |  4 ++--
>  lib/utils/irqchip/imsic.c |  2 +-
>  4 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
> index 6acc6e3..0ed02eb 100644
> --- a/include/sbi/sbi_irqchip.h
> +++ b/include/sbi/sbi_irqchip.h
> @@ -13,7 +13,6 @@
>  #include <sbi/sbi_types.h>
>  
>  struct sbi_scratch;
> -struct sbi_trap_regs;
>  
>  /**
>   * Set external interrupt handling function
> @@ -23,7 +22,7 @@ struct sbi_trap_regs;
>   *
>   * @param fn function pointer for handling external irqs
>   */
> -void sbi_irqchip_set_irqfn(int (*fn)(struct sbi_trap_regs *regs));
> +void sbi_irqchip_set_irqfn(int (*fn)(void));
>  
>  /**
>   * Process external interrupts
> @@ -33,7 +32,7 @@ void sbi_irqchip_set_irqfn(int (*fn)(struct sbi_trap_regs *regs));
>   *
>   * @param regs pointer for trap registers
>   */
> -int sbi_irqchip_process(struct sbi_trap_regs *regs);
> +int sbi_irqchip_process(void);
>  
>  /** Initialize interrupt controllers */
>  int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot);
> diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
> index 24128be..0ae604a 100644
> --- a/lib/sbi/sbi_irqchip.c
> +++ b/lib/sbi/sbi_irqchip.c
> @@ -10,22 +10,22 @@
>  #include <sbi/sbi_irqchip.h>
>  #include <sbi/sbi_platform.h>
>  
> -static int default_irqfn(struct sbi_trap_regs *regs)
> +static int default_irqfn(void)
>  {
>  	return SBI_ENODEV;
>  }
>  
> -static int (*ext_irqfn)(struct sbi_trap_regs *regs) = default_irqfn;
> +static int (*ext_irqfn)(void) = default_irqfn;
>  
> -void sbi_irqchip_set_irqfn(int (*fn)(struct sbi_trap_regs *regs))
> +void sbi_irqchip_set_irqfn(int (*fn)(void))
>  {
>  	if (fn)
>  		ext_irqfn = fn;
>  }
>  
> -int sbi_irqchip_process(struct sbi_trap_regs *regs)
> +int sbi_irqchip_process(void)
>  {
> -	return ext_irqfn(regs);
> +	return ext_irqfn();
>  }
>  
>  int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 4e691df..72b1788 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -209,7 +209,7 @@ static int sbi_trap_nonaia_irq(struct sbi_trap_regs *regs, ulong mcause)
>  		sbi_ipi_process();
>  		break;
>  	case IRQ_M_EXT:
> -		return sbi_irqchip_process(regs);
> +		return sbi_irqchip_process();
>  	default:
>  		return SBI_ENOENT;
>  	}
> @@ -232,7 +232,7 @@ static int sbi_trap_aia_irq(struct sbi_trap_regs *regs, ulong mcause)
>  			sbi_ipi_process();
>  			break;
>  		case IRQ_M_EXT:
> -			rc = sbi_irqchip_process(regs);
> +			rc = sbi_irqchip_process();
>  			if (rc)
>  				return rc;
>  			break;
> diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
> index 36ef66c..f2a35c6 100644
> --- a/lib/utils/irqchip/imsic.c
> +++ b/lib/utils/irqchip/imsic.c
> @@ -140,7 +140,7 @@ int imsic_get_target_file(u32 hartid)
>  	return imsic_get_hart_file(scratch);
>  }
>  
> -static int imsic_external_irqfn(struct sbi_trap_regs *regs)
> +static int imsic_external_irqfn(void)
>  {
>  	ulong mirq;
>  

Other than that, LGTM:

Reviewed-by: Cl?ment L?ger <cleger@rivosinc.com>


