From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 15:12:19 +0200
Subject: [PATCH 15/17] lib: utils/irqchip: Use scratch space to save
 per-HART PLIC pointer
In-Reply-To: <20230425123230.3943447-16-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-16-apatel@ventanamicro.com>
Message-ID: <20230531-50d3a3df6b5f858e99d1b10a@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:28PM +0530, Anup Patel wrote:
> Instead of using a global array indexed by hartid, we should use
> scratch space to save per-HART PLIC pointer and PLIC context numbers.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/fdt_irqchip_plic.c | 108 +++++++++++++++++++++------
>  1 file changed, 86 insertions(+), 22 deletions(-)
> 
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 605f44a..eb1e412 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -12,54 +12,97 @@
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_heap.h>
> -#include <sbi/sbi_hartmask.h>
> +#include <sbi/sbi_scratch.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
>  #include <sbi_utils/irqchip/plic.h>
>  
> -static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
> -static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2] = { { -1 } };
> +static unsigned long plic_ptr_offset;
> +
> +#define plic_get_hart_data_ptr(__scratch)				\
> +({									\
> +	(void *)(*((ulong *)sbi_scratch_offset_ptr((__scratch),		\
> +						   plic_ptr_offset)));	\
> +})
> +
> +#define plic_set_hart_data_ptr(__scratch, __imsic)			\
> +do {									\
> +	*((ulong *)sbi_scratch_offset_ptr((__scratch), plic_ptr_offset))\
> +					= (ulong)(__imsic);		\
> +} while (0)
> +
> +static unsigned long plic_mcontext_offset;
> +
> +#define plic_get_hart_mcontext(__scratch)				\
> +({									\
> +	long __ret =							\
> +	*((long *)sbi_scratch_offset_ptr((__scratch), plic_mcontext_offset));\
> +	(__ret - 1);							\
> +})
> +
> +#define plic_set_hart_mcontext(__scratch, __mcontext)			\
> +do {									\
> +	*((long *)sbi_scratch_offset_ptr((__scratch), plic_mcontext_offset))\
> +					= (long)(__mcontext + 1);	\
> +} while (0)
> +
> +static unsigned long plic_scontext_offset;
> +
> +#define plic_get_hart_scontext(__scratch)				\
> +({									\
> +	long __ret =							\
> +	*((long *)sbi_scratch_offset_ptr((__scratch), plic_scontext_offset));\
> +	(__ret - 1);							\
> +})
> +
> +#define plic_set_hart_scontext(__scratch, __scontext)			\
> +do {									\
> +	*((long *)sbi_scratch_offset_ptr((__scratch), plic_scontext_offset))\
> +					= (long)(__scontext + 1);	\
> +} while (0)

I guess the +/- 1 stuff is to ensure that the m/scontext offsets can be
tested with zero to see if they need to be allocated. It'd be nice to
add a comment explaining it.

>  
>  void fdt_plic_priority_save(u8 *priority, u32 num)
>  {
> -	struct plic_data *plic = plic_hartid2data[current_hartid()];
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
> -	plic_priority_save(plic, priority, num);
> +	plic_priority_save(plic_get_hart_data_ptr(scratch), priority, num);
>  }
>  
>  void fdt_plic_priority_restore(const u8 *priority, u32 num)
>  {
> -	struct plic_data *plic = plic_hartid2data[current_hartid()];
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
> -	plic_priority_restore(plic, priority, num);
> +	plic_priority_restore(plic_get_hart_data_ptr(scratch), priority, num);
>  }
>  
>  void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold, u32 num)
>  {
> -	u32 hartid = current_hartid();
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
> -	plic_context_save(plic_hartid2data[hartid],
> -			  plic_hartid2context[hartid][smode],
> +	plic_context_save(plic_get_hart_data_ptr(scratch),
> +			  smode ? plic_get_hart_scontext(scratch) :
> +				  plic_get_hart_mcontext(scratch),
>  			  enable, threshold, num);
>  }
>  
>  void fdt_plic_context_restore(bool smode, const u32 *enable, u32 threshold,
>  			      u32 num)
>  {
> -	u32 hartid = current_hartid();
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
> -	plic_context_restore(plic_hartid2data[hartid],
> -			     plic_hartid2context[hartid][smode],
> +	plic_context_restore(plic_get_hart_data_ptr(scratch),
> +			     smode ? plic_get_hart_scontext(scratch) :
> +				     plic_get_hart_mcontext(scratch),
>  			     enable, threshold, num);
>  }
>  
>  static int irqchip_plic_warm_init(void)
>  {
> -	u32 hartid = current_hartid();
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>  
> -	return plic_warm_irqchip_init(plic_hartid2data[hartid],
> -				      plic_hartid2context[hartid][0],
> -				      plic_hartid2context[hartid][1]);
> +	return plic_warm_irqchip_init(plic_get_hart_data_ptr(scratch),
> +				      plic_get_hart_mcontext(scratch),
> +				      plic_get_hart_scontext(scratch));
>  }
>  
>  static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
> @@ -67,6 +110,7 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
>  {
>  	const fdt32_t *val;
>  	u32 phandle, hwirq, hartid;
> +	struct sbi_scratch *scratch;
>  	int i, err, count, cpu_offset, cpu_intc_offset;
>  
>  	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
> @@ -90,16 +134,17 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
>  		if (err)
>  			continue;
>  
> -		if (SBI_HARTMASK_MAX_BITS <= hartid)
> +		scratch = sbi_hartid_to_scratch(hartid);
> +		if (!scratch)
>  			continue;
>  
> -		plic_hartid2data[hartid] = pd;
> +		plic_set_hart_data_ptr(scratch, pd);
>  		switch (hwirq) {
>  		case IRQ_M_EXT:
> -			plic_hartid2context[hartid][0] = i / 2;
> +			plic_set_hart_mcontext(scratch, i / 2);
>  			break;
>  		case IRQ_S_EXT:
> -			plic_hartid2context[hartid][1] = i / 2;
> +			plic_set_hart_scontext(scratch, i / 2);
>  			break;
>  		}
>  	}
> @@ -113,6 +158,24 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>  	int rc;
>  	struct plic_data *pd;
>  
> +	if (!plic_ptr_offset) {
> +		plic_ptr_offset = sbi_scratch_alloc_offset(sizeof(ulong));
> +		if (!plic_ptr_offset)
> +			return SBI_ENOMEM;
> +	}
> +
> +	if (!plic_mcontext_offset) {
> +		plic_mcontext_offset = sbi_scratch_alloc_offset(sizeof(long));
> +		if (!plic_mcontext_offset)
> +			return SBI_ENOMEM;
> +	}
> +
> +	if (!plic_scontext_offset) {
> +		plic_scontext_offset = sbi_scratch_alloc_offset(sizeof(long));
> +		if (!plic_scontext_offset)
> +			return SBI_ENOMEM;
> +	}
> +
>  	pd = sbi_zalloc(sizeof(*pd));
>  	if (!pd)
>  		return SBI_ENOMEM;
> @@ -152,7 +215,8 @@ static void thead_plic_plat_init(struct plic_data *pd)
>  
>  void thead_plic_restore(void)
>  {
> -	struct plic_data *plic = plic_hartid2data[current_hartid()];
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	struct plic_data *plic = plic_get_hart_data_ptr(scratch);
>  
>  	thead_plic_plat_init(plic);
>  }
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


