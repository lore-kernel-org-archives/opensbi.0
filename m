From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 27 Dec 2022 11:54:21 +0100
Subject: [PATCH v2 2/5] libs: utils/irqchip: plic: Ensure no out-of-bound
 access in priority save/restore helpers
In-Reply-To: <20221204051503.439727-2-bmeng@tinylab.org>
References: <20221204051503.439727-1-bmeng@tinylab.org>
 <20221204051503.439727-2-bmeng@tinylab.org>
Message-ID: <70ccdcc7-613b-6a56-dc33-3b22ef5d0474@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/4/22 06:15, Bin Meng wrote:
> Currently the priority save/restore helpers writes/reads the provided
> array using an index whose maximum value is determined by PLIC, which
> potentially may disagree with the caller to these helpers.
> 
> Add a parameter to ask the caller to provide the size limit of the
> array to ensure no out-of-bound access happens.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
> Changes in v2:
> - new patch: libs: utils/irqchip: plic: Ensure no out-of-bound access in priority save/restore helpers
> 
>   include/sbi_utils/irqchip/fdt_irqchip_plic.h |  4 ++--
>   include/sbi_utils/irqchip/plic.h             |  5 +++--
>   lib/utils/irqchip/fdt_irqchip_plic.c         | 12 ++++++++----
>   lib/utils/irqchip/plic.c                     |  9 +++++----
>   platform/generic/allwinner/sun20i-d1.c       |  4 ++--
>   5 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/include/sbi_utils/irqchip/fdt_irqchip_plic.h b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> index 98d4de5..5f3f54d 100644
> --- a/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> +++ b/include/sbi_utils/irqchip/fdt_irqchip_plic.h
> @@ -9,9 +9,9 @@
>   
>   #include <sbi/sbi_types.h>
>   
> -void fdt_plic_priority_save(u8 *priority);
> +void fdt_plic_priority_save(u8 *priority, u32 num);
>   
> -void fdt_plic_priority_restore(const u8 *priority);
> +void fdt_plic_priority_restore(const u8 *priority, u32 num);
>   
>   void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold);
>   
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 48c24f0..38704a1 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -18,9 +18,10 @@ struct plic_data {
>   };
>   
>   /* So far, priorities on all consumers of these functions fit in 8 bits. */
> -void plic_priority_save(const struct plic_data *plic, u8 *priority);
> +void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
>   
> -void plic_priority_restore(const struct plic_data *plic, const u8 *priority);
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
> +			   u32 num);
>   
>   void plic_context_save(const struct plic_data *plic, int context_id,
>   		       u32 *enable, u32 *threshold);
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index a6e185c..87fb9bd 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -24,18 +24,22 @@ static struct plic_data plic[PLIC_MAX_NR];
>   static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
>   static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2];
>   
> -void fdt_plic_priority_save(u8 *priority)
> +void fdt_plic_priority_save(u8 *priority, u32 num)
>   {
>   	struct plic_data *plic = plic_hartid2data[current_hartid()];
>   
> -	plic_priority_save(plic, priority);
> +	if (num > plic->num_src + 1)
> +		num = plic->num_src + 1;
> +	plic_priority_save(plic, priority, num);
>   }
>   
> -void fdt_plic_priority_restore(const u8 *priority)
> +void fdt_plic_priority_restore(const u8 *priority, u32 num)
>   {
>   	struct plic_data *plic = plic_hartid2data[current_hartid()];
>   
> -	plic_priority_restore(plic, priority);
> +	if (num > plic->num_src + 1)
> +		num = plic->num_src + 1;
> +	plic_priority_restore(plic, priority, num);
>   }
>   
>   void fdt_plic_context_save(bool smode, u32 *enable, u32 *threshold)
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 4df9020..c5c1879 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -36,15 +36,16 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>   	writel(val, plic_priority);
>   }
>   
> -void plic_priority_save(const struct plic_data *plic, u8 *priority)
> +void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num)
>   {
> -	for (u32 i = 1; i <= plic->num_src; i++)
> +	for (u32 i = 1; i <= num; i++)
>   		priority[i] = plic_get_priority(plic, i);
>   }
>   
> -void plic_priority_restore(const struct plic_data *plic, const u8 *priority)
> +void plic_priority_restore(const struct plic_data *plic, const u8 *priority,
> +			   u32 num)
>   {
> -	for (u32 i = 1; i <= plic->num_src; i++)
> +	for (u32 i = 1; i <= num; i++)
>   		plic_set_priority(plic, i, priority[i]);
>   }
>   
> diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
> index 707313b..46d336f 100644
> --- a/platform/generic/allwinner/sun20i-d1.c
> +++ b/platform/generic/allwinner/sun20i-d1.c
> @@ -79,13 +79,13 @@ static u32 plic_threshold;
>   static void sun20i_d1_plic_save(void)
>   {
>   	fdt_plic_context_save(true, plic_sie, &plic_threshold);
> -	fdt_plic_priority_save(plic_priority);
> +	fdt_plic_priority_save(plic_priority, PLIC_SOURCES);

This ends up calling plic_priority_save() which will access 
plic_priority at indexes 1 to PLIC_SOURCES. So you are overrunning the 
plic_priority array size.

Coverity 1530252 Out-of-bounds access


>   }
>   
>   static void sun20i_d1_plic_restore(void)
>   {
>   	thead_plic_restore();
> -	fdt_plic_priority_restore(plic_priority);
> +	fdt_plic_priority_restore(plic_priority, PLIC_SOURCES);

This ends up calling plic_priority_restore() which will access 
plic_priority at indexes 1 to PLIC_SOURCES. So you are overrunning the 
plic_priority array size.

Coverity 1530251 Out-of-bounds access

Best regards

Heinrich

>   	fdt_plic_context_restore(true, plic_sie, plic_threshold);
>   }
>   

