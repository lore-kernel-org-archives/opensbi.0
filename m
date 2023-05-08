From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:29:16 +0800
Subject: [PATCH] lib: utils/irqchip: plic: support T-HEAD C910 PLIC
In-Reply-To: <20230507182843.2987-1-jszhang@kernel.org>
References: <20230507182843.2987-1-jszhang@kernel.org>
Message-ID: <CAJF2gTSroV7DDD7Z-QP6=kZeqaVy2xW_LO-Fkpe5dkEeEFVVFg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 8, 2023 at 2:39?AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> T-HEAD's C910 PLIC still needs the delegation bit setting to allow
> access from S-mode, but it doesn't need the edge quirk. To distinguish
> it from C906, add C910 binding.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  lib/utils/irqchip/fdt_irqchip_plic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
> index 1aadf91..ed572f7 100644
> --- a/lib/utils/irqchip/fdt_irqchip_plic.c
> +++ b/lib/utils/irqchip/fdt_irqchip_plic.c
> @@ -165,6 +165,8 @@ static const struct fdt_match irqchip_plic_match[] = {
>         { .compatible = "sifive,plic-1.0.0" },
>         { .compatible = "thead,c900-plic",
c900 means c906, c908, c910. There is no c900 model, it's a series name.

But still, thx for the patch. If you want to join T-HEAD SoC
maintenance work, please contact Wei Fu.
Contributions of any are welcome.

>           .data = thead_plic_plat_init },
> +       { .compatible = "thead,c910-plic",
> +         .data = thead_plic_plat_init },
>         { /* sentinel */ }
>  };
>
> --
> 2.40.1
>


-- 
Best Regards
 Guo Ren

