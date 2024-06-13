From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 18:55:35 +0530
Subject: [PATCH 3/7] lib: utils/irqchip: Skip initialize irqchip when dt
 is not enabled
In-Reply-To: <20240611111937.1459876-4-wxjstz@126.com>
References: <20240611111937.1459876-1-wxjstz@126.com> <20240611111937.1459876-4-wxjstz@126.com>
Message-ID: <CAAhSdy36xG2z8OwmNWBUi5YwuVM=1T=vSEjOtH4XSocEfA8poA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 11, 2024 at 4:49?PM Xiang W <wxjstz@126.com> wrote:
>
> When the dt node has a status property and the value is not ok or
> okay, skip initializing irqchip.
>
> Signed-off-by: Xiang W <wxjstz@126.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/irqchip/fdt_irqchip.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/utils/irqchip/fdt_irqchip.c b/lib/utils/irqchip/fdt_irqchip.c
> index 1b6b674..c38b1d8 100644
> --- a/lib/utils/irqchip/fdt_irqchip.c
> +++ b/lib/utils/irqchip/fdt_irqchip.c
> @@ -62,6 +62,9 @@ static int fdt_irqchip_cold_init(void)
>                 drv_added = false;
>                 while ((noff = fdt_find_match(fdt, noff,
>                                         drv->match_table, &match)) >= 0) {
> +                       if (!fdt_node_is_enabled(fdt,noff))
> +                               continue;
> +
>                         if (drv->cold_init) {
>                                 rc = drv->cold_init(fdt, noff, match);
>                                 if (rc == SBI_ENODEV)
> --
> 2.43.0
>

