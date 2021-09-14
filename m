From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Sep 2021 12:12:26 +0530
Subject: [PATCH] lib: utils/irqchip: Automatically delegate T-HEAD PLIC
 access
In-Reply-To: <20210909020821.29431-1-samuel@sholland.org>
References: <20210909020821.29431-1-samuel@sholland.org>
Message-ID: <CAAhSdy26dc+Eyj1rz1aT=KtKkjNjajX3pWVKPzmf9HA9=jb6rg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 9, 2021 at 7:38 AM Samuel Holland <samuel@sholland.org> wrote:
>
> The T-HEAD PLIC implementation requires setting a delegation bit
> to allow access from S-mode. For the D1 SoC, let's set this bit
> automatically from the PLIC driver, instead of relying on another
> driver reaching into the PLIC's MMIO space.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  docs/platform/thead-c9xx.md          |  8 ++------
>  lib/utils/irqchip/fdt_irqchip_plic.c | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
> index c0daeb7..125edf4 100644
> --- a/docs/platform/thead-c9xx.md
> +++ b/docs/platform/thead-c9xx.md
> @@ -51,11 +51,6 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
>                 compatible = "simple-bus";
>                 ranges;
>
> -               reset: reset-sample {
> -                       compatible = "thead,reset-sample";
> -                       plic-delegate = <0x0 0x101ffffc>;
> -               };
> -
>                 clint0: clint at 14000000 {
>                         compatible = "riscv,clint0";
>                         interrupts-extended = <
> @@ -67,7 +62,8 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
>
>                 intc: interrupt-controller at 10000000 {
>                         #interrupt-cells = <1>;
> -                       compatible = "riscv,plic0";
> +                       compatible = "allwinner,sun20i-d1-plic",
> +                                    "riscv,plic0";
>                         interrupt-controller;
>                         interrupts-extended = <
>                                 &cpu0_intc  0xffffffff &cpu0_intc  9
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 18d2797..b044b28 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -9,6 +9,7 @@
>
>  #include <libfdt.h>
>  #include <sbi/riscv_asm.h>
> +#include <sbi/riscv_io.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
> @@ -91,6 +92,13 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>         if (rc)
>                 return rc;
>
> +       if (match->data) {
> +               int (*plic_plat_init)(struct plic_data *) = match->data;
> +               rc = plic_plat_init(pd);
> +               if (rc)
> +                       return rc;
> +       }
> +
>         rc = plic_cold_irqchip_init(pd);
>         if (rc)
>                 return rc;
> @@ -106,7 +114,18 @@ static int irqchip_plic_cold_init(void *fdt, int nodeoff,
>         return irqchip_plic_update_hartid_table(fdt, nodeoff, pd);
>  }
>
> +#define THEAD_PLIC_CTRL_REG 0x1ffffc
> +
> +static int thead_plic_plat_init(struct plic_data *pd)
> +{
> +       writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
> +
> +       return 0;
> +}
> +
>  static const struct fdt_match irqchip_plic_match[] = {
> +       { .compatible = "allwinner,sun20i-d1-plic",
> +         .data = thead_plic_plat_init },

The SoC specific compatible is fine but I think we will need
implementation specific compatible string if more SoCs include
T-HEAD PLIC.

Is there a plan for implementation specific compatible string (such
as "thead,d1-plic") ?

Is the SoC compatible string accepted by Linux DT maintainers ?

Regards,
Anup

>         { .compatible = "riscv,plic0" },
>         { .compatible = "sifive,plic-1.0.0" },
>         { },
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

