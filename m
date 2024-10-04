From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 4 Oct 2024 18:51:55 +0800
Subject: [PATCH 8/9] lib: sbi_domain: Use domain data support for
 per-domain hart context
In-Reply-To: <20240923115700.381916-9-apatel@ventanamicro.com>
References: <20240923115700.381916-1-apatel@ventanamicro.com>
 <20240923115700.381916-9-apatel@ventanamicro.com>
Message-ID: <Zv_IywVUKv7W40Jq@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

I noticed a few minor non-functional issues.

On Mon, Sep 23, 2024 at 05:26:59PM +0530, Anup Patel wrote:
> The per-domain hartindex_to_context_table[] is yet another per-domain
> data required for implementing hart entry into (or exit from) domain.
> 
> Use the recently added domain data support for per-domain hart context
> so that a dedicated hartindex_to_context_table[] in struct sbi_domain
> is not needed.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_domain.h         |   2 -
>  include/sbi/sbi_domain_context.h |  57 +++--------------
>  lib/sbi/sbi_domain.c             |   9 ++-
>  lib/sbi/sbi_domain_context.c     | 104 +++++++++++++++++++++++++++----
>  4 files changed, 110 insertions(+), 62 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 60d7a776..1ecf3116 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -176,8 +176,6 @@ struct sbi_domain {
>  	char name[64];
>  	/** Possible HARTs in this domain */
>  	const struct sbi_hartmask *possible_harts;
> -	/** Contexts for possible HARTs indexed by hartindex */
> -	struct sbi_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
>  	/** Array of memory regions terminated by a region with order zero */
>  	struct sbi_domain_memregion *regions;
>  	/** HART id of the HART booting this domain */
> diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
> index 3f43b622..31a3a7f8 100755
> --- a/include/sbi/sbi_domain_context.h
> +++ b/include/sbi/sbi_domain_context.h
> @@ -8,56 +8,9 @@
>  #define __SBI_DOMAIN_CONTEXT_H__
>  
>  #include <sbi/sbi_types.h>
> -#include <sbi/sbi_trap.h>
>  
>  struct sbi_domain;
>  
> -/** Context representation for a hart within a domain */
> -struct sbi_context {
> -	/** Trap-related states such as GPRs, mepc, and mstatus */
> -	struct sbi_trap_context trap_ctx;
> -
> -	/** Supervisor status register */
> -	unsigned long sstatus;
> -	/** Supervisor interrupt enable register */
> -	unsigned long sie;
> -	/** Supervisor trap vector base address register */
> -	unsigned long stvec;
> -	/** Supervisor scratch register for temporary storage */
> -	unsigned long sscratch;
> -	/** Supervisor exception program counter register */
> -	unsigned long sepc;
> -	/** Supervisor cause register */
> -	unsigned long scause;
> -	/** Supervisor trap value register */
> -	unsigned long stval;
> -	/** Supervisor interrupt pending register */
> -	unsigned long sip;
> -	/** Supervisor address translation and protection register */
> -	unsigned long satp;
> -	/** Counter-enable register */
> -	unsigned long scounteren;
> -	/** Supervisor environment configuration register */
> -	unsigned long senvcfg;
> -
> -	/** Reference to the owning domain */
> -	struct sbi_domain *dom;
> -	/** Previous context (caller) to jump to during context exits */
> -	struct sbi_context *prev_ctx;
> -	/** Is context initialized and runnable */
> -	bool initialized;
> -};
> -
> -/** Get the context pointer for a given hart index and domain */
> -#define sbi_hartindex_to_domain_context(__hartindex, __d) \
> -	(__d)->hartindex_to_context_table[__hartindex]
> -
> -/** Macro to obtain the current hart's context pointer */
> -#define sbi_domain_context_thishart_ptr()                  \
> -	sbi_hartindex_to_domain_context(                   \
> -		sbi_hartid_to_hartindex(current_hartid()), \
> -		sbi_domain_thishart_ptr())
> -
>  /**
>   * Enter a specific domain context synchronously
>   * @param dom pointer to domain
> @@ -75,4 +28,14 @@ int sbi_domain_context_enter(struct sbi_domain *dom);
>   */
>  int sbi_domain_context_exit(void);
>  
> +/**
> + * Initialize domain context support
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_domain_context_init(void);
> +
> +/* Deinitialize domain context support */
> +void sbi_domain_context_deinit(void);
> +
>  #endif // __SBI_DOMAIN_CONTEXT_H__
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 22c5c752..ee6e2569 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -781,11 +781,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>  	if (!domain_hart_ptr_offset)
>  		return SBI_ENOMEM;
>  
> +	/* Initialize domain context support */
> +	rc = sbi_domain_context_init();
> +	if (rc)
> +		goto fail_free_domain_hart_ptr_offset;
> +
>  	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
>  	if (!root_memregs) {
>  		sbi_printf("%s: no memory for root regions\n", __func__);
>  		rc = SBI_ENOMEM;
> -		goto fail_free_domain_hart_ptr_offset;
> +		goto fail_deinit_context;
>  	}
>  	root.regions = root_memregs;
>  
> @@ -850,6 +855,8 @@ fail_free_root_hmask:
>  	sbi_free(root_hmask);
>  fail_free_root_memregs:
>  	sbi_free(root_memregs);
> +fail_deinit_context:
> +	sbi_domain_context_deinit();
>  fail_free_domain_hart_ptr_offset:
>  	sbi_scratch_free_offset(domain_hart_ptr_offset);
>  	return rc;
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 29e2d280..b70db41e 100755
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -14,6 +14,76 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>  #include <sbi/sbi_domain.h>
> +#include <sbi/sbi_trap.h>
> +
> +/** Context representation for a hart within a domain */
> +struct hart_context {
> +	/** Trap-related states such as GPRs, mepc, and mstatus */
> +	struct sbi_trap_context trap_ctx;
> +
> +	/** Supervisor status register */
> +	unsigned long sstatus;
> +	/** Supervisor interrupt enable register */
> +	unsigned long sie;
> +	/** Supervisor trap vector base address register */
> +	unsigned long stvec;
> +	/** Supervisor scratch register for temporary storage */
> +	unsigned long sscratch;
> +	/** Supervisor exception program counter register */
> +	unsigned long sepc;
> +	/** Supervisor cause register */
> +	unsigned long scause;
> +	/** Supervisor trap value register */
> +	unsigned long stval;
> +	/** Supervisor interrupt pending register */
> +	unsigned long sip;
> +	/** Supervisor address translation and protection register */
> +	unsigned long satp;
> +	/** Counter-enable register */
> +	unsigned long scounteren;
> +	/** Supervisor environment configuration register */
> +	unsigned long senvcfg;
> +
> +	/** Reference to the owning domain */
> +	struct sbi_domain *dom;
> +	/** Previous context (caller) to jump to during context exits */
> +	struct hart_context *prev_ctx;
> +	/** Is context initialized and runnable */
> +	bool initialized;
> +};
> +
> +struct domain_context_priv {
> +	/** Contexts for possible HARTs indexed by hartindex */
> +	struct hart_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
> +};
> +
> +static struct sbi_domain_data dcpriv = {
> +	.data_size = sizeof(struct domain_context_priv),
> +};
> +
> +static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
> +						    u32 hartindex)
> +{
> +	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
> +
> +	return (dcp && hartindex < SBI_HARTMASK_MAX_BITS) ?
> +		dcp->hartindex_to_context_table[hartindex] : NULL;
> +}
> +
> +static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
> +			     struct hart_context *hc)
> +{
> +	struct domain_context_priv *dcp = sbi_domain_data_ptr(dom, &dcpriv);
> +
> +	if (dcp && hartindex < SBI_HARTMASK_MAX_BITS) {
> +		dcp->hartindex_to_context_table[hartindex] = hc;
> +	}
> +}
> +
> +/** Macro to obtain the current hart's context pointer */
> +#define hart_context_thishart_get()					\
> +	hart_context_get(sbi_domain_thishart_ptr(),			\
> +			 sbi_hartid_to_hartindex(current_hartid()))

Perhaps we could simplify this by using current_hartindex().

>  
>  /**
>   * Switches the HART context from the current domain to the target domain.
> @@ -23,8 +93,8 @@
>   * @param ctx pointer to the current HART context
>   * @param dom_ctx pointer to the target domain context
>   */
> -static void switch_to_next_domain_context(struct sbi_context *ctx,
> -					  struct sbi_context *dom_ctx)
> +static void switch_to_next_domain_context(struct hart_context *ctx,
> +					  struct hart_context *dom_ctx)
>  {
>  	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
>  	struct sbi_trap_context *trap_ctx;
> @@ -89,9 +159,9 @@ static void switch_to_next_domain_context(struct sbi_context *ctx,
>  
>  int sbi_domain_context_enter(struct sbi_domain *dom)
>  {
> -	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
> -	struct sbi_context *dom_ctx = sbi_hartindex_to_domain_context(
> -		sbi_hartid_to_hartindex(current_hartid()), dom);
> +	struct hart_context *ctx = hart_context_thishart_get();
> +	struct hart_context *dom_ctx = hart_context_get(dom,
> +				sbi_hartid_to_hartindex(current_hartid()));
>  
>  	/* Validate the domain context existence */
>  	if (!dom_ctx)
> @@ -109,8 +179,8 @@ int sbi_domain_context_exit(void)
>  {
>  	u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
>  	struct sbi_domain *dom;
> -	struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
> -	struct sbi_context *dom_ctx, *tmp;
> +	struct hart_context *ctx = hart_context_thishart_get();
> +	struct hart_context *dom_ctx, *tmp;
>  
>  	/*
>  	 * If it's first time to call `exit` on the current hart, no
> @@ -123,16 +193,16 @@ int sbi_domain_context_exit(void)
>  							 dom->possible_harts))
>  				continue;
>  
> -			dom_ctx = sbi_zalloc(sizeof(struct sbi_context));
> +			dom_ctx = sbi_zalloc(sizeof(struct hart_context));
>  			if (!dom_ctx)
>  				return SBI_ENOMEM;
>  
>  			/* Bind context and domain */
>  			dom_ctx->dom				   = dom;

The indentation might need to be updated.

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

Best regards,
Peter Lin

> -			dom->hartindex_to_context_table[hartindex] = dom_ctx;
> +			hart_context_set(dom, hartindex, dom_ctx);
>  		}
>  
> -		ctx = sbi_domain_context_thishart_ptr();
> +		ctx = hart_context_thishart_get();
>  	}
>  
>  	dom_ctx = ctx->prev_ctx;
> @@ -144,7 +214,7 @@ int sbi_domain_context_exit(void)
>  			if (dom == &root || dom == sbi_domain_thishart_ptr())
>  				continue;
>  
> -			tmp = sbi_hartindex_to_domain_context(hartindex, dom);
> +			tmp = hart_context_get(dom, hartindex);
>  			if (tmp && !tmp->initialized) {
>  				dom_ctx = tmp;
>  				break;
> @@ -154,9 +224,19 @@ int sbi_domain_context_exit(void)
>  
>  	/* Take the root domain context if fail to find */
>  	if (!dom_ctx)
> -		dom_ctx = sbi_hartindex_to_domain_context(hartindex, &root);
> +		dom_ctx = hart_context_get(&root, hartindex);
>  
>  	switch_to_next_domain_context(ctx, dom_ctx);
>  
>  	return 0;
>  }
> +
> +int sbi_domain_context_init(void)
> +{
> +	return sbi_domain_register_data(&dcpriv);
> +}
> +
> +void sbi_domain_context_deinit(void)
> +{
> +	sbi_domain_unregister_data(&dcpriv);
> +}

