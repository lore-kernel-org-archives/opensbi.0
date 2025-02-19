From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Feb 2025 22:05:11 +0530
Subject: [PATCH] lib: utils/irqchip: Match against more specific
 compatible strings first
In-Reply-To: <20250214062738.2941749-1-alex@studer.dev>
References: <20250214062738.2941749-1-alex@studer.dev>
Message-ID: <CAAhSdy3Fyn=dbGMnARizeRb+1YMBq4xWc28xy=6Se4fia_HCsg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 14, 2025 at 11:58?AM Alex Studer <alex@studer.dev> wrote:
>
> The T-HEAD C90x PLIC has some special quirks, such as the S-mode
> delegation bit. OpenSBI currently handles this by checking the compatible
> string in the device tree.
>
> However, this matching is done in the order of the fdt_match array. So if
> a device tree contains both strings, for example:
>
>         compatible = "thead,c900-plic", "riscv,plic0";
>
> Then OpenSBI will match against the generic "riscv,plic0" string, since
> that appears first in the fdt_match array. This means it will fail to set
> the S-mode delegation bit, and Linux will fail to boot. In some cases, it
> is not possible to change the compatible string to just the T-HEAD PLIC,
> as older versions of Linux only recognize the RISC-V compatible string.
>
> This patch fixes that by moving the RISC-V string to the end, ensuring
> that the more specific options get matched first.
>
> Signed-off-by: Alex Studer <alex@studer.dev>

For now this patch is okay but ideally we should fix fdt_driver_init_by_offset()
to match the compatible strings of a node in correct order (left-to-right).

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/irqchip/fdt_irqchip_plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 494358d..59898d2 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -98,10 +98,16 @@ fail_free_data:
>
>  static const struct fdt_match irqchip_plic_match[] = {
>         { .compatible = "andestech,nceplic100" },
> -       { .compatible = "riscv,plic0" },
>         { .compatible = "sifive,plic-1.0.0" },
>         { .compatible = "thead,c900-plic",
>           .data = (void *)(PLIC_FLAG_THEAD_DELEGATION | PLIC_FLAG_ENABLE_PM) },
> +
> +       /*
> +        * We keep the generic RISC-V PLIC at the end.
> +        * This ensures we match against more specific options first.
> +        * (This is important if the PLIC has quirks, like the T-HEAD PLIC.)
> +        */
> +       { .compatible = "riscv,plic0" },
>         { /* sentinel */ }
>  };
>
> --
> 2.48.1
>
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

