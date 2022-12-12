From: Samuel Holland <samuel@sholland.org>
Date: Mon, 12 Dec 2022 01:04:33 -0600
Subject: [PATCH v3 2/5] lib: utils/irqchip: plic: Ensure no out-of-bound
 access in priority save/restore helpers
In-Reply-To: <20221211065424.806478-2-bmeng@tinylab.org>
References: <20221211065424.806478-1-bmeng@tinylab.org>
 <20221211065424.806478-2-bmeng@tinylab.org>
Message-ID: <a515eb8a-4f5e-68ff-327f-082d948362f3@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/11/22 00:54, Bin Meng wrote:
> Currently the priority save/restore helpers writes/reads the provided
> array using an index whose maximum value is determined by PLIC, which
> potentially may disagree with the caller to these helpers.
> 
> Add a parameter to ask the caller to provide the size limit of the
> array to ensure no out-of-bound access happens.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> 
> ---
> 
> Changes in v3:
> - fix the size limit check
> - move the size limit check to plic_priority_save/restore
> - add parameter description to fdt_plic_priority_save/restore
> 
> Changes in v2:
> - new patch: libs: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers
> 
>  include/sbi_utils/irqchip/fdt_irqchip_plic.h | 14 ++++++++++++--
>  include/sbi_utils/irqchip/plic.h             |  5 +++--
>  lib/utils/irqchip/fdt_irqchip_plic.c         |  8 ++++----
>  lib/utils/irqchip/plic.c                     | 15 +++++++++++----
>  platform/generic/allwinner/sun20i-d1.c       |  4 ++--
>  5 files changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> index 98d4de5..d5b1c60 100644
> --- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> +++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> @@ -9,9 +9,19 @@
>  
>  #include <sbi/sbi_types.h>
>  
> -void fdt_plic_priority_save(u8 *priority);
> +/**
> + * Save the PLIC priority state
> + * @param priority pointer to the memory region for the saved priority
> + * @param num size of the memory region including interrupt source 0
> + */
> +void fdt_plic_priority_save(u8 *priority, u32 num);
>  
> -void fdt_plic_priority_restore(const u8 *priority);
> +/**
> + * Restore the PLIC priority state
> + * @param priority pointer to the memory region for the saved priority
> + * @param num size of the memory region including interrupt source 0
> + */
> +void fdt_plic_priority_restore(const u8 *priority, u32 num);
>  
>  void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold);
>  
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 48c24f0..38704a1 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -18,9 +18,10 @@ struct plic_data {
>  };
>  
>  /* So far, priorities on all consumers of these functions fit in 8 bits. */
> -void plic_priority_save(const struct plic_data *plic, u8 *priority);
> +void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
>  
> -void plic_priority_restore(const struct plic_data *plic, const u8 *priority);
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
> +			   u32 num);
>  
>  void plic_context_save(const struct plic_data *plic, int context_id,
>  		       u32 *enable, u32 *threshold);
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index fe08836..7d76c5b 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -24,18 +24,18 @@ static struct plic_data plic[PLIC_MAX_NR];
>  static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
>  static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2];
>  
> -void fdt_plic_priority_save(u8 *priority)
> +void fdt_plic_priority_save(u8 *priority, u32 num)
>  {
>  	struct plic_data *plic = plic_hartid2data[current_hartid()];
>  
> -	plic_priority_save(plic, priority);
> +	plic_priority_save(plic, priority, num);
>  }
>  
> -void fdt_plic_priority_restore(const u8 *priority)
> +void fdt_plic_priority_restore(const u8 *priority, u32 num)
>  {
>  	struct plic_data *plic = plic_hartid2data[current_hartid()];
>  
> -	plic_priority_restore(plic, priority);
> +	plic_priority_restore(plic, priority, num);
>  }
>  
>  void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold)
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 4df9020..dca5678 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -36,15 +36,22 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>  	writel(val, plic_priority);
>  }
>  
> -void plic_priority_save(const struct plic_data *plic, u8 *priority)
> +void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
>  {
> -	for (u32 i = 1; i <= plic->num_src; i++)
> +	if (num > plic->num_src)
> +		num = plic->num_src;

This check is not really necessary. If the caller tries to save/restore
more sources then actually exist, then the extra register writes will
just be ignored. We already access extra bits by doing word accesses.

For bounds checking, the only things that need to match are the array
size and the loop. With your change to the loop condition, plic->num_src
is not relevant at all anymore.

Regards,
Samuel

> +
> +	for (u32 i = 1; i <= num; i++)
>  		priority[i] = plic_get_priority(plic, i);
>  }
>  
> -void plic_priority_restore(const struct plic_data *plic, const u8 *priority)
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
> +			   u32 num)
>  {
> -	for (u32 i = 1; i <= plic->num_src; i++)
> +	if (num > plic->num_src)
> +		num = plic->num_src;
> +
> +	for (u32 i = 1; i <= num; i++)
>  		plic_set_priority(plic, i, priority[i]);
>  }
>  
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 18d330d..1f27575 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -79,13 +79,13 @@ static u32 plic_threshold;
>  static void sun20i_d1_plic_save(void)
>  {
>  	fdt_plic_context_save(true, plic_sie, &plic_threshold);
> -	fdt_plic_priority_save(plic_priority);
> +	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);
>  }
>  
>  static void sun20i_d1_plic_restore(void)
>  {
>  	thead_plic_restore();
> -	fdt_plic_priority_restore(plic_priority);
> +	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);
>  	fdt_plic_context_restore(true, plic_sie, plic_threshold);
>  }
>  


