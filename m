From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Nov 2023 12:49:56 +0530
Subject: [PATCH] lib: utils/irqchip: Avoid redundant writes to APLIC CLRIE register
In-Reply-To: <20231121150259.902907-1-apatel@ventanamicro.com>
References: <20231121150259.902907-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy2BOKWRuPdjfiy-qS5qJAPpugSWm_gPLFoSKAngoacabg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 21, 2023 at 8:33?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Each APLIC CLRIE register allows disabling 32 interrupt sources at
> a time by writing -1 so no need to write CLRIE register separately
> for each interrupt source.
>
> Fixes: 99792653de29 ("lib: utils/irqchip: Add APLIC initialization
> library")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/utils/irqchip/aplic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
> index d7fd992..10236e7 100644
> --- a/lib/utils/irqchip/aplic.c
> +++ b/lib/utils/irqchip/aplic.c
> @@ -193,7 +193,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
>         writel(0, (void *)(aplic->addr + APLIC_DOMAINCFG));
>
>         /* Disable all interrupts */
> -       for (i = 0; i <= aplic->num_source; i++)
> +       for (i = 0; i <= aplic->num_source; i += 32)
>                 writel(-1U, (void *)(aplic->addr + APLIC_CLRIE_BASE +
>                                      (i / 32) * sizeof(u32)));
>
> --
> 2.34.1
>

