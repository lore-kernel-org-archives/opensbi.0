From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Mar 2025 17:00:49 +0530
Subject: [PATCH 2/2] Revert "lib: utils/irqchip: Match against more
 specific compatible strings first"
In-Reply-To: <20250219204258.261765-2-samuel.holland@sifive.com>
References: <20250219204258.261765-1-samuel.holland@sifive.com> <20250219204258.261765-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2mang=-9=sgkd=3E0fnT7g=KMoixW92h3_6KdrsoWrvA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025 at 2:13?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This reverts commit 6019259dfbdf9322858b4e7cfc3d1448376e2aa0.
>
> Now that fdt_driver_init_by_offset() respects the compatible string
> fallback priority order, this workaround is no longer necessary.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup


> ---
>
>  lib/utils/irqchip/fdt_irqchip_plic.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 59898d24..494358d8 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -98,16 +98,10 @@ fail_free_data:
>
>  static const struct fdt_match irqchip_plic_match[] = {
>         { .compatible = "andestech,nceplic100" },
> +       { .compatible = "riscv,plic0" },
>         { .compatible = "sifive,plic-1.0.0" },
>         { .compatible = "thead,c900-plic",
>           .data = (void *)(PLIC_FLAG_THEAD_DELEGATION | PLIC_FLAG_ENABLE_PM) },
> -
> -       /*
> -        * We keep the generic RISC-V PLIC at the end.
> -        * This ensures we match against more specific options first.
> -        * (This is important if the PLIC has quirks, like the T-HEAD PLIC.)
> -        */
> -       { .compatible = "riscv,plic0" },
>         { /* sentinel */ }
>  };
>
> --
> 2.47.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

