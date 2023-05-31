From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:46:55 +0200
Subject: [PATCH 10/17] lib: utils/irqchip: Use heap in PLIC, APLIC and
 IMSIC drivers
In-Reply-To: <20230425123230.3943447-11-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-11-apatel@ventanamicro.com>
Message-ID: <20230531-14fb3f8b4bbee3ac09daf364@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:23PM +0530, Anup Patel wrote:
> Let's use heap allocation in PLIC, APLIC, and IMSIC irqchip drivers
> instead of using a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/fdt_irqchip_aplic.c | 24 ++++++++++--------
>  lib/utils/irqchip/fdt_irqchip_imsic.c | 30 +++++++++++-----------
>  lib/utils/irqchip/fdt_irqchip_plic.c  | 36 +++++++++++++--------------
>  3 files changed, 47 insertions(+), 43 deletions(-)
> 
> diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
> index 965f023..caa92a7 100644
> --- a/lib/utils/irqchip/fdt_irqchip_aplic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
> @@ -11,15 +11,11 @@
>  #include <libfdt.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
>  #include <sbi_utils/irqchip/aplic.h>
>  
> -#define APLIC_MAX_NR			16
> -
> -static unsigned long aplic_count = 0;
> -static struct aplic_data aplic[APLIC_MAX_NR];
> -
>  static int irqchip_aplic_warm_init(void)
>  {
>  	/* Nothing to do here. */
> @@ -32,15 +28,23 @@ static int irqchip_aplic_cold_init(void *fdt, int nodeoff,
>  	int rc;
>  	struct aplic_data *pd;
>  
> -	if (APLIC_MAX_NR <= aplic_count)
> -		return SBI_ENOSPC;
> -	pd = &aplic[aplic_count++];
> +	pd = sbi_zalloc(sizeof(*pd));
> +	if (!pd)
> +		return SBI_ENOMEM;
>  
>  	rc = fdt_parse_aplic_node(fdt, nodeoff, pd);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(pd);
>  		return rc;
> +	}
>  
> -	return aplic_cold_irqchip_init(pd);
> +	rc = aplic_cold_irqchip_init(pd);
> +	if (rc) {
> +		sbi_free(pd);
> +		return rc;
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct fdt_match irqchip_aplic_match[] = {
> diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
> index 6020ac0..d890400 100644
> --- a/lib/utils/irqchip/fdt_irqchip_imsic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
> @@ -11,16 +11,12 @@
>  #include <libfdt.h>
>  #include <sbi/riscv_asm.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
>  #include <sbi_utils/irqchip/imsic.h>
>  
> -#define IMSIC_MAX_NR			16
> -
> -static unsigned long imsic_count = 0;
> -static struct imsic_data imsic[IMSIC_MAX_NR];
> -
>  static int irqchip_imsic_update_hartid_table(void *fdt, int nodeoff,
>  					     struct imsic_data *id)
>  {
> @@ -71,25 +67,31 @@ static int irqchip_imsic_cold_init(void *fdt, int nodeoff,
>  	int rc;
>  	struct imsic_data *id;
>  
> -	if (IMSIC_MAX_NR <= imsic_count)
> -		return SBI_ENOSPC;
> -	id = &imsic[imsic_count];
> +	id = sbi_zalloc(sizeof(*id));
> +	if (!id)
> +		return SBI_ENOMEM;
>  
>  	rc = fdt_parse_imsic_node(fdt, nodeoff, id);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(id);
>  		return rc;
> -	if (!id->targets_mmode)
> +	}
> +	if (!id->targets_mmode) {
> +		sbi_free(id);
>  		return 0;
> +	}
>  
>  	rc = irqchip_imsic_update_hartid_table(fdt, nodeoff, id);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(id);
>  		return rc;
> +	}
>  
>  	rc = imsic_cold_irqchip_init(id);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(id);
>  		return rc;
> -
> -	imsic_count++;
> +	}

Could have a label at the bottom

    return 0;
error:
    sbi_free(id);
    return rc;

Just need to set rc=0 before the id->targets_mmode test and everything can
goto error rather than needing to remember to free at each point.

>  
>  	return 0;
>  }
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 1aadf91..605f44a 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -11,18 +11,14 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
> +#include <sbi/sbi_heap.h>
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>  #include <sbi_utils/irqchip/fdt_irqchip.h>
>  #include <sbi_utils/irqchip/plic.h>
>  
> -#define PLIC_MAX_NR			16
> -
> -static unsigned long plic_count = 0;
> -static struct plic_data plic[PLIC_MAX_NR];
> -
>  static struct plic_data *plic_hartid2data[SBI_HARTMASK_MAX_BITS];
> -static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2];
> +static int plic_hartid2context[SBI_HARTMASK_MAX_BITS][2] = { { -1 } };
>  
>  void fdt_plic_priority_save(u8 *priority, u32 num)
>  {
> @@ -114,16 +110,18 @@ static int irqchip_plic_update_hartid_table(void *fdt, int nodeoff,
>  static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>  				  const struct fdt_match *match)
>  {
> -	int i, rc;
> +	int rc;
>  	struct plic_data *pd;
>  
> -	if (PLIC_MAX_NR <= plic_count)
> -		return SBI_ENOSPC;
> -	pd = &plic[plic_count++];
> +	pd = sbi_zalloc(sizeof(*pd));
> +	if (!pd)
> +		return SBI_ENOMEM;
>  
>  	rc = fdt_parse_plic_node(fdt, nodeoff, pd);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(pd);
>  		return rc;
> +	}
>  
>  	if (match->data) {
>  		void (*plic_plat_init)(struct plic_data *) = match->data;
> @@ -131,18 +129,18 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>  	}
>  
>  	rc = plic_cold_irqchip_init(pd);
> -	if (rc)
> +	if (rc) {
> +		sbi_free(pd);
>  		return rc;
> +	}
>  
> -	if (plic_count == 1) {
> -		for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> -			plic_hartid2data[i] = NULL;
> -			plic_hartid2context[i][0] = -1;
> -			plic_hartid2context[i][1] = -1;
> -		}
> +	rc = irqchip_plic_update_hartid_table(fdt, nodeoff, pd);
> +	if (rc) {
> +		sbi_free(pd);
> +		return rc;
>  	}
>  
> -	return irqchip_plic_update_hartid_table(fdt, nodeoff, pd);
> +	return 0;

Same comment as above.

>  }
>  
>  #define THEAD_PLIC_CTRL_REG 0x1ffffc
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

